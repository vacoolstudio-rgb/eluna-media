import 'dart:io';

import 'package:eluna_shared/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// PIN и биометрия. Сам замок — `AppLockService` из пакета (PBKDF2-хеш и
/// нарастающая пауза после неверных попыток); здесь только состояние шторки и
/// то, что о ней знают экраны.
final appLockServiceProvider = Provider<AppLockService>((ref) => AppLockService());

/// Три состояния, а не два.
///
/// `checking` — не то же самое, что `locked`: пока хранилище отвечает, шторка
/// должна быть просто непрозрачной. Показать клавиатуру пин-кода тому, кто его
/// никогда не заводил, и через миг её убрать — это выглядит сбоем; показать
/// очередь до ответа — это отсутствие замка.
enum AppLockState { checking, locked, unlocked }

class AppLockGate extends Notifier<AppLockState> {
  /// Уводит ли системный интерфейс приложение в фон по-настоящему.
  ///
  /// На Android — да: пикер, лист «Поделиться» и подтверждение удаления это
  /// **чужие Activity**, наша уходит в `paused`, и отличить их от сворачивания
  /// нечем. Отсюда и пауза [graceOnReturn].
  ///
  /// На iOS — **нет**: всё это листы, показанные поверх нашего же процесса.
  /// Приложение уходит только в `inactive`, а `paused` там означает ровно то,
  /// что написано: человек свернул приложение. Значит, прощать возврат нельзя.
  ///
  /// Прощали — и вот чем это оказалось на живом телефоне. Свернул, вернулся
  /// через десять секунд: пауза снимала замок в тот же миг, когда шторка
  /// запускала Face ID. Системный лист повисал поверх **уже открытого**
  /// приложения — со всей очередью, именами файлов и настройками под ним.
  /// Замок стоял, выглядел работающим и не защищал ничего.
  AppLockGate({bool? systemUiBackgroundsApp})
      : _systemUiBackgroundsApp = systemUiBackgroundsApp ?? !Platform.isIOS;

  final bool _systemUiBackgroundsApp;

  /// Когда приложение ушло в фон. Нужно на возврате: см. [resumed].
  DateTime? _leftAt;

  /// Пауза, короче которой возврат считается тем же сеансом.
  ///
  /// Страховка, а не основной механизм: системный пикер, лист «Поделиться» и
  /// диалог удаления оригиналов — это чужие Activity, и наша уходит при них в
  /// `paused` ровно так же, как при сворачивании. Про НАШИ отлучки замок знает
  /// точно — см. [expectSystemUi], — а эти секунды закрывают то, чего мы не
  /// обернули: системный запрос разрешения, чужой диалог поверх экрана.
  ///
  /// Изначально это и было основным механизмом, и на устройстве сразу стало
  /// видно, почему так нельзя: выбор файла в системном пикере — открыть папку,
  /// переключить фильтр, найти нужное — занял 75 секунд, и приложение
  /// потребовало код у человека, который никуда из него не уходил.
  static const graceOnReturn = Duration(seconds: 30);

  /// Сколько живёт отметка [expectSystemUi], если возврата так и не случилось.
  ///
  /// Без срока незапустившийся пикер оставил бы отметку навсегда, и она
  /// однажды пропустила бы в приложение настоящее сворачивание.
  static const _excursionTtl = Duration(minutes: 10);

  /// Когда экран сам отправил человека в системный интерфейс.
  DateTime? _excursionAt;

  /// «Сейчас мы отдадим управление системе, и это не значит, что нас закрыли».
  ///
  /// Ставится ПЕРЕД запуском чужой Activity — пикера, листа «Поделиться»,
  /// системного подтверждения удаления. Отметка одноразовая: её снимает первый
  /// же возврат, поэтому длинный сеанс в пикере проходит без кода, а следующее
  /// сворачивание — уже с кодом.
  void expectSystemUi({DateTime? now}) => _excursionAt = now ?? DateTime.now();

  @override
  AppLockState build() => AppLockState.checking;

  /// Итог стартовой проверки: заперто или нет.
  void resolve({required bool configured}) {
    state = configured ? AppLockState.locked : AppLockState.unlocked;
  }

  void unlock() {
    _leftAt = null;
    _excursionAt = null;
    state = AppLockState.unlocked;
  }

  /// Приложение уходит в фон. Синхронно и из кэша: шторка обязана подняться в
  /// ЭТОМ кадре, иначе она попадёт в снимок для списка недавних задач уже после
  /// того, как он снят.
  void paused({DateTime? now}) {
    if (!ref.read(appLockServiceProvider).configuredCached) return;
    _leftAt = now ?? DateTime.now();
    state = AppLockState.locked;
  }

  /// Приложение вернулось. Своя отлучка (или очень короткая чужая) снимает
  /// шторку сама — настоящее сворачивание оставляет её и требует код.
  void resumed({DateTime? now}) {
    final at = now ?? DateTime.now();
    final left = _leftAt;
    // Отметка одноразовая независимо от исхода: второй возврат — это уже не
    // возврат из пикера.
    final expected = _excursionAt;
    _excursionAt = null;

    if (left == null || state != AppLockState.locked) return;

    final ourOwnTrip = expected != null && at.difference(expected) < _excursionTtl;
    // Пауза — страховка от ЧУЖИХ Activity, и только там, где они бывают. Своя
    // отлучка засчитывается всегда: её приложение отметило само.
    final forgiven = _systemUiBackgroundsApp && at.difference(left) < graceOnReturn;
    if (ourOwnTrip || forgiven) {
      unlock();
    }
  }
}

final appLockStateProvider =
    NotifierProvider<AppLockGate, AppLockState>(AppLockGate.new);

/// Что настроено сейчас — для экрана настроек и для самой шторки, которая
/// показывает клавиатуру только когда пин-код действительно есть. Инвалидируется
/// после любого изменения: источник правды — сервис, это лишь его чтение.
final appLockStatusProvider = FutureProvider<({bool pin, bool bio})>((ref) async {
  final service = ref.watch(appLockServiceProvider);
  return (pin: await service.isPinSet(), bio: await service.isBiometricEnabled());
});

/// Пометить вызов, который уводит человека в системный интерфейс, и выполнить
/// его.
///
/// Оборачивать нужно ВСЁ, что открывает чужую Activity: выбор файлов, лист
/// «Поделиться», «Открыть в…», сохранение в галерею (оно спрашивает
/// разрешение), удаление оригиналов, переход в магазин. Пропущенный вызов не
/// ломает ничего страшного — человек просто увидит код там, где не ожидал, —
/// но именно из таких пропусков и состоит ощущение, что замок капризный.
Future<T> awayInSystemUi<T>(AppLockGate gate, Future<T> Function() action) {
  gate.expectSystemUi();
  return action();
}
