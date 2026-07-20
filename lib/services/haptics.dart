import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/settings_controller.dart';

/// One switchable place for every buzz in the app. Kept deliberately sparse:
/// batch start, batch end, and destructive taps — not every button.
class Haptics {
  const Haptics(this._enabled);

  final bool _enabled;

  void batchStarted() {
    if (_enabled) HapticFeedback.mediumImpact();
  }

  void batchSucceeded() {
    if (_enabled) HapticFeedback.lightImpact();
  }

  void batchFailed() {
    if (_enabled) HapticFeedback.heavyImpact();
  }

  void destructiveTap() {
    if (_enabled) HapticFeedback.selectionClick();
  }
}

final hapticsProvider = Provider<Haptics>((ref) {
  return Haptics(ref.watch(appPrefsProvider.select((p) => p.hapticsEnabled)));
});
