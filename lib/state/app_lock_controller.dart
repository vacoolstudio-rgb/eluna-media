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
  /// Когда приложение ушло в фон. Нужно на возврате: см. [resumed].
  DateTime? _leftAt;

  /// Пауза, короче которой возврат считается тем же сеансом.
  ///
  /// Без неё пин-код спрашивался бы после КАЖДОГО выбора файла: системный
  /// пикер, лист «Поделиться», диалог удаления оригиналов и «Открыть в…» — это
  /// чужие Activity, и наша уходит при них в `paused` ровно так же, как при
  /// сворачивании. Конвертер ходит в них по десять раз за сеанс.
  ///
  /// Шторку при этом поднимает и короткая отлучка — в списке недавних задач
  /// снимок экрана всегда закрыт. Разница только в том, спросят ли код на
  /// возврате.
  static const graceOnReturn = Duration(seconds: 30);

  @override
  AppLockState build() => AppLockState.checking;

  /// Итог стартовой проверки: заперто или нет.
  void resolve({required bool configured}) {
    state = configured ? AppLockState.locked : AppLockState.unlocked;
  }

  void unlock() {
    _leftAt = null;
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

  /// Приложение вернулось. Короткая отлучка снимает шторку сама — длинная
  /// оставляет её и требует код.
  void resumed({DateTime? now}) {
    final left = _leftAt;
    if (left == null || state != AppLockState.locked) return;
    if ((now ?? DateTime.now()).difference(left) < graceOnReturn) {
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
