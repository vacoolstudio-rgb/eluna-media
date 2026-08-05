import 'package:eluna_shared/core.dart';
import 'package:flutter/foundation.dart';

/// Отправляет ошибки фреймворка в [AppLogger] и в [CrashLog] — то же, что
/// делают Screen и Subs.
///
/// До этого у Media не было ни того, ни другого: `FlutterError.onError`
/// заканчивался на `presentError`, который в релизе не печатает никуда, а
/// обработчик зоны — на `debugPrint`, который на установленном приложении не
/// читает никто. Каждое падение у пользователя было падением, о котором мы бы
/// никогда не узнали.
///
/// Вторая половина — обработчик самой зоны — осталась в `main`: Media
/// оборачивает весь запуск в `runZonedGuarded`, и всё, что не поймали, приходит
/// туда, а не в `PlatformDispatcher.onError` (это корневая зона, до неё уже не
/// доходит).
///
/// Ничего не глотается: родной обработчик вызывается после, и красный экран с
/// дампом в debug остаётся на месте.
void installFlutterErrorHandler() {
  final previous = FlutterError.onError;
  FlutterError.onError = (details) {
    AppLogger.instance.e(
      'flutter',
      details.exceptionAsString(),
      shortStack(details.stack),
    );
    // Локально, на устройство. Отправлять некуда и незачем: у релизной сборки
    // Media нет разрешения INTERNET вовсе (см. README и NOTICE.md), а файл
    // предлагается пользователю на следующем запуске — он и решает.
    CrashLog.record(details.exception, details.stack, context: 'flutter');
    previous?.call(details);
  };
}

/// Верхние [frames] строк стека: полный стек Flutter — сотня строк внутренностей
/// фреймворка, которые вытеснили бы из кольцевого буфера всё остальное.
String? shortStack(StackTrace? stack, {int frames = 8}) {
  if (stack == null) return null;
  final lines = stack.toString().trimRight().split('\n');
  if (lines.length <= frames) return lines.join('\n');
  return [...lines.take(frames), '… +${lines.length - frames} more'].join('\n');
}
