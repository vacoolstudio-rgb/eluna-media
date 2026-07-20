import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/app_meta_controller.dart';
import '../../state/queue_controller.dart';
import 'ad_config.dart';

/// The one decision that governs the one banner. Pure so it can be tested on
/// the host VM.
///
/// The banner is suppressed:
///  * for Pro users — that is what they paid for;
///  * during the grace period — new users get the value before the ad;
///  * while a batch is converting — ads never share a screen with the app's
///    core work, and an idle radio saves battery mid-encode.
bool shouldShowBanner({
  required bool isPro,
  required DateTime firstLaunchAt,
  required DateTime now,
  required bool isQueueRunning,
}) {
  if (isPro) return false;
  if (isQueueRunning) return false;
  if (now.difference(firstLaunchAt) < AdConfig.gracePeriod) return false;
  return true;
}

/// Reactive form of [shouldShowBanner] for the UI.
final bannerAllowedProvider = Provider<bool>((ref) {
  final meta = ref.watch(appMetaProvider);
  final isRunning = ref.watch(queueProvider.select((q) => q.isRunning));
  return shouldShowBanner(
    isPro: meta.isPro,
    firstLaunchAt: DateTime.fromMillisecondsSinceEpoch(meta.firstLaunchAtMs),
    now: DateTime.now(),
    isQueueRunning: isRunning,
  );
});
