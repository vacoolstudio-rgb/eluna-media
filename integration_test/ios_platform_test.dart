import 'dart:io';

import 'package:eluna_media/domain/app_icons.dart';
import 'package:eluna_media/services/app_icon.dart';
import 'package:eluna_media/services/device_storage.dart';
import 'package:eluna_media/services/file_opener.dart';
import 'package:eluna_media/services/foreground_service.dart';
import 'package:eluna_media/services/original_media.dart';
import 'package:eluna_shared/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Всё, что на iOS делает не Dart, а `AppDelegate.swift`.
///
/// Андроидные наборы это не покрывают по построению: там другой нативный
/// файл, другой канал внутри и другие обещания. Здесь проверяется ровно то,
/// что iOS-сторона обязана отвечать, — включая случаи, где правильный ответ
/// это «нет»: `docs/IOS.md` требует, чтобы непроверенная ветка возвращала
/// `false`/`null`, а не делала вид, что сработала.
///
/// Ничего в этом файле не должно поднимать системный диалог: нажать в нём
/// некому, и прогон встанет до таймаута, а не упадёт. Это не теория — так и
/// вышло дважды, пока файл писался (см. группу про удаление оригиналов).
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Файл целиком про iOS. На Android те же вызовы отвечают иначе, и
    // «прошло» здесь означало бы, что тест ничего не проверил.
    if (!Platform.isIOS) {
      fail('этот набор имеет смысл только на iOS');
    }
  });

  // Почему здесь НЕ перебираются все девять иконок, как это делает андроидный
  // `app_icon_test.dart`.
  //
  // Успешный `setAlternateIconName` поднимает системный алерт «You have
  // changed the icon for…». Он не наш, отключить его нечем (единственные
  // способы — приватные), и до нажатия OK прогон стоит: проверено на
  // симуляторе, где цикл по девятке намертво встал на первой же настоящей
  // смене. Нажать системную кнопку интеграционный тест не может — она вне
  // Flutter-иерархии, и `simctl` тапов не умеет.
  //
  // Поэтому утверждение «все девять наборов на месте и объявлены сборке»
  // проверяет `test/ios_project_test.dart` — без устройства, по каталогу
  // ассетов и всем трём конфигурациям pbxproj. Здесь остаётся то, что можно
  // проверить только вживую и без алерта: что канал есть, что чтение
  // возвращает факт, и что мусорное имя отвергается.
  group('иконка приложения', () {
    const service = AppIconService();

    testWidgets('на свежей установке включена основная', (tester) async {
      // `alternateIconName` равен null ровно тогда, когда показывается
      // основной набор, — у iOS нет способа назвать его по имени. Ответ
      // именно `kDefaultAppIconId`, а не null, и есть доказательство, что
      // канал ответил: платформа без обработчика дала бы null.
      expect(await service.currentIconId(), kDefaultAppIconId);
    });

    testWidgets('несуществующий набор отвергается, а не роняет приложение',
        (tester) async {
      // На iOS белого списка нет: имя уходит прямо в UIKit, и защита здесь —
      // то, что ошибка приходит в completion-хендлер, а не бросается. Алерта
      // этот путь не поднимает: он поднимается только на успехе.
      const bogus = ElunaAppIcon('nope', 'IconDoesNotExist', 'notif_loop');
      expect(await service.apply(bogus), isFalse);

      // И, что важнее отказа: он не должен был ничего переключить.
      expect(await service.currentIconId(), kDefaultAppIconId,
          reason: 'отказ не должен был сменить иконку');
    });
  });

  group('свободное место', () {
    testWidgets('freeSpace отвечает правдоподобным числом', (tester) async {
      // Канал `freeSpace` — единственный источник этой цифры на iOS, и Dart
      // трактует null как «не знаю» и пропускает конверсию дальше. Значит,
      // молчаливая поломка здесь невидима: проверка не в том, что число
      // «какое-то», а в том, что оно вообще пришло.
      final free = await const DeviceStorage().freeBytes();
      expect(free, isNotNull,
          reason: 'volumeAvailableCapacityForImportantUsage не ответил — '
              'проверка места на iOS молча выключена');
      expect(free, greaterThan(0));
    });

    testWidgets('арифметика запаса совпадает с платформенной цифрой',
        (tester) async {
      final free = await const DeviceStorage().freeBytes();
      // Симулятор и телефон всегда вмещают мегабайт; если нет — тест обязан
      // сказать об этом, а не тихо пройти.
      expect(SpaceCheck.fits(totalInputBytes: 1024 * 1024, freeBytes: free), isTrue);
    });
  });

  group('чего на iOS нет', () {
    testWidgets('папки «Загрузки» нет, и приложение это признаёт',
        (tester) async {
      // `docs/IOS.md` §5: это окончательное решение, а не заглушка. Dart
      // подставляет лист «Поделиться», и обе стороны обязаны отвечать
      // одинаково — иначе в интерфейсе появится кнопка, которая ничего не
      // делает.
      final opener = FileOpener();
      expect(opener.canOpenFolder, isFalse);
      expect(await opener.openDownloads(), isFalse);
    });

    testWidgets('foreground service — осознанный no-op, а не тихая ошибка',
        (tester) async {
      // Аналога в iOS нет (§4). Требование к no-op ровно одно: он не должен
      // бросать, потому что очередь зовёт его на каждой работе.
      final service = ForegroundService();
      await service.start(title: 'Eluna', text: 'тест', cancelLabel: 'Отмена');
      await service.update(title: 'Eluna', text: 'тест', progress: 0.5);
      await service.stop();
    });
  });

  group('удаление оригиналов отказывает закрыто', () {
    testWidgets('пустой список не ходит на платформу и удаляет ноль',
        (tester) async {
      // Единственная ветка этой функции, которую можно проверить без человека:
      // Dart отвечает сам и до канала не доходит.
      final outcome = await const ChannelOriginalMediaService().delete([]);
      expect(outcome.deletedCount, 0);
      expect(outcome.cancelled, isFalse);
    });

    // Непустой список автоматизировать нечем, и это стоит записать, чтобы
    // следующий человек не потратил на это вечер.
    //
    // Любой такой вызов доходит до `requestPhotoAccess`, а тот на свежей
    // установке поднимает системный запрос доступа к медиатеке. Выдать его
    // заранее не выходит: `xcrun simctl privacy … grant photos` (и даже
    // `grant all`) на iOS 26 не покрывает readWrite-доступ к `PHPhotoLibrary`
    // — запрос всё равно появляется. Проверено обоими вариантами.
    //
    // А само удаление, даже когда доступ есть, всегда показывает подтверждение
    // самой iOS — это свойство функции, а не препятствие: приложение по замыслу
    // не может удалить ничего молча.
    //
    // Поэтому §3 `docs/IOS.md` остаётся ручной проверкой на устройстве с живой
    // медиатекой, где и интересен настоящий случай — два файла с одним именем.
  });
}
