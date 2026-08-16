import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Говорит платформе, накрывать ли окно, когда приложение уходит с экрана.
///
/// Существует ради одного измеренного дефекта на iOS. Шторку замка поднимает
/// Flutter по `AppLifecycleState.paused`, а этот сигнал приходит из
/// `applicationDidEnterBackground` — **после** того, как система сняла картинку
/// для переключателя приложений. Между снимком и `paused` Flutter не рисует ни
/// одного кадра, поэтому в снимок попадала очередь с именами файлов: на
/// возврате человек видел сначала свой экран и только потом шторку. Замок при
/// этом работал и код спрашивал — но показывал ровно то, что должен был скрыть.
///
/// Починить это на стороне Dart нельзя в принципе: к моменту, когда Flutter
/// узнаёт о сворачивании, снимок уже сделан. Поэтому окно закрывает нативная
/// накладка по `applicationWillResignActive`, а Dart лишь сообщает, нужна ли
/// она вообще, — без замка накрывать нечего, и лишняя вспышка при каждом
/// переключении приложений была бы платой ни за что.
///
/// На Android не нужно: там снимок для «недавних» делается позже, и шторка в
/// него попадает. Метод там просто не реализован, и вызов молча ничего не
/// делает.
class PrivacyShade {
  const PrivacyShade({MethodChannel? channel})
      : _channel = channel ?? const MethodChannel('eluna/share_intake');

  final MethodChannel _channel;

  Future<void> setEnabled(bool enabled) async {
    // Платформа не проверяется намеренно: на Android метода просто нет, вызов
    // приходит `MissingPluginException` и гасится ниже. Проверка `Platform.isIOS`
    // здесь стоила бы того, что метод стало бы нечем проверить на хосте, — а
    // ошибиться тут можно ровно одним способом, опечаткой в имени.
    try {
      await _channel.invokeMethod<void>('setPrivacyShade', {'enabled': enabled});
    } on MissingPluginException {
      // Хост-тесты и всё, где канала нет.
    } on PlatformException {
      // Платформа отказала — приложение от этого не ломается.
    }
  }
}

final privacyShadeProvider = Provider<PrivacyShade>((ref) => const PrivacyShade());
