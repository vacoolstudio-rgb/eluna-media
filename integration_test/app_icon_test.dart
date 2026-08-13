import 'package:eluna_media/domain/app_icons.dart';
import 'package:eluna_media/services/app_icon.dart';
import 'package:eluna_shared/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Переключение иконки на живой платформе.
///
/// Хост-тест (`test/app_icons_test.dart`) сверяет четыре копии списка между
/// собой по текстам файлов. Чего он не может: `setComponentEnabledSetting`
/// бросает на компоненте, которого в пакете нет, — а «нет» здесь означает не
/// отсутствие строки в манифесте, а несовпадение имени после слияния
/// манифестов, и увидеть это можно только на устройстве.
///
/// Каждая из девяти включается по-настоящему. В конце возвращается иконка по
/// умолчанию: тест идёт на телефоне владельца, и оставить после себя чужую
/// иконку на рабочем столе — плохая манера.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const service = AppIconService();

  tearDownAll(() async {
    final fallback = kAppIcons.firstWhere((i) => i.id == kDefaultAppIconId);
    await service.apply(fallback);
  });

  testWidgets('на свежей установке включена иконка по умолчанию', (tester) async {
    // Записи, которых никто не касался, отвечают COMPONENT_ENABLED_STATE_DEFAULT,
    // и «по умолчанию» здесь означает манифест. Если эта проверка падает на
    // первом же прогоне — значит, в манифесте включено не то или не одно.
    final defaultIcon = kAppIcons.firstWhere((i) => i.id == kDefaultAppIconId);
    expect(await service.currentAlias(), defaultIcon.alias);
  });

  for (final icon in kAppIcons) {
    testWidgets('${icon.id}: платформа принимает ${icon.alias}', (tester) async {
      final ok = await service.apply(icon);
      expect(ok, isTrue,
          reason: 'платформа отказалась включать ${icon.alias} — '
              'обычно это опечатка в имени записи манифеста');

      // Главное утверждение файла. `apply` возвращает true просто потому, что
      // вызов не бросил; вот это читает у менеджера пакетов, что включено на
      // самом деле, и только оно отличает работающее переключение от вызова,
      // который ничего не сделал.
      expect(await service.currentAlias(), icon.alias,
          reason: '${icon.alias} включили, а лаунчеру достался другой');
    });
  }

  testWidgets('несуществующая запись отвергается, а не роняет приложение',
      (tester) async {
    // Белый список в MainActivity существует ровно для этого: без него имя
    // мимо манифеста улетело бы в setComponentEnabledSetting и бросило.
    const bogus = ElunaAppIcon('nope', 'IconDoesNotExist', 'notif_loop');
    expect(await service.apply(bogus), isFalse);
  });
}
