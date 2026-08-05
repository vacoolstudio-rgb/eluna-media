import 'dart:ui' show Color;

import 'package:dynamic_color/dynamic_color.dart';
import 'package:eluna_shared/core.dart';

/// Что общий код не может знать про это приложение — плагины, чей API меняется
/// от версии к версии. Контракты живут в eluna_shared, реализации здесь: пакет
/// не тянет плагин в свой pubspec, и его версия остаётся делом приложения.
/// См. docs/CONTRACT.md §5.

/// Material You: отдаём общей теме ЦВЕТ обоев, а не готовую `ColorScheme`.
///
/// Раньше Media передавала схему целиком из `DynamicColorBuilder`. Пакет так не
/// умеет намеренно: его схемы расписаны вручную ровно затем, чтобы гармонизатор
/// Material в них ничего не пересчитывал, и принять готовую схему значило бы
/// вернуть то, от чего уходили. `ElunaPalette.fromAccent` разворачивает один
/// цвет в ту же форму, что и любой пресет, поэтому обои перекрашивают тему, а
/// её характер остаётся общим для семьи.
///
/// Видимое следствие: у кого переключатель включён, цвета изменятся.
class MediaDynamicColorAdapter implements ElunaDynamicColorAdapter {
  const MediaDynamicColorAdapter();

  @override
  Future<Color?> wallpaperAccent() async {
    try {
      final palette = await DynamicColorPlugin.getCorePalette();
      // primary.get(40) — тон, который Material берёт за основной акцент;
      // палитра отдаёт целую лестницу, а нам нужен один seed.
      if (palette != null) return Color(palette.primary.get(40));
      // Android до 12 и iOS не отдают ничего; десктопы — отдельным каналом.
      // Null здесь не ошибка, а «остаётся выбранный пресет».
      return await DynamicColorPlugin.getAccentColor();
    } catch (e) {
      AppLogger.instance.w('theme', 'wallpaper accent unavailable', e);
      return null;
    }
  }
}

/// Отправка письма в поддержку — только через почтовый клиент пользователя.
///
/// `false` здесь означает «своего способа отправить нет», и это правда: у
/// Subs на этом месте нативный интент со вложениями, а у Media нет ни канала,
/// ни вложений (экран поддержки открывается без выбора файлов). Общий экран,
/// получив отказ, сам открывает `mailto:` через url_launcher — плагин у Media
/// уже есть, — а если и он не открылся, предлагает скопировать письмо в буфер.
///
/// Именно поэтому адаптер выглядит пустым и должен таким остаться: релизная
/// сборка Media идёт БЕЗ разрешения INTERNET и обещает, что ничего не уходит с
/// устройства. Любой плагин отправки — это сетевой плагин в манифесте и
/// нарушенное обещание; письмо, которое пользователь сам видит и сам
/// отправляет своим почтовым клиентом, — нет.
class MediaMailAdapter implements ElunaMailAdapter {
  const MediaMailAdapter();

  @override
  Future<bool> compose({
    required String to,
    required String subject,
    required String body,
    List<String> attachmentPaths = const [],
  }) async =>
      false;
}
