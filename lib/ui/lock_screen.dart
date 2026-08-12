import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/app_lock_controller.dart';

/// Шторка поверх всего приложения, пока оно заперто. Клавиатура пин-кода,
/// отсчёт паузы после неверных попыток, системный запрос биометрии и вариант
/// «только биометрия» живут в `eluna_shared`.
///
/// Это именно СЛОЙ, а не маршрут: маршрут можно снять, обойти по ссылке или
/// восстановить мимо — слой над Navigator нельзя. Поэтому разблокировка
/// сообщается колбэком в состояние приложения, а не `pop`.
class LockScreen extends ConsumerWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(appLockStatusProvider).value;
    return ElunaLockScreen(
      // null, пока хранилище отвечает: общий экран тогда рисует один фон и
      // ничего больше. Клавиатура, мигнувшая тому, кто не заводил пин-кода, —
      // это то, ради чего в состоянии есть отдельное `checking`.
      status: status == null
          ? null
          : ElunaLockStatus(pin: status.pin, biometric: status.bio),
      lock: ref.read(appLockServiceProvider),
      biometrics: BiometricGate(),
      onUnlocked: () => ref.read(appLockStateProvider.notifier).unlock(),
    );
  }
}
