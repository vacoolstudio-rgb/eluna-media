import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:eluna_media/services/ads/ad_gate.dart';
import 'package:eluna_media/services/review_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('shouldShowBanner', () {
    final installed = DateTime(2026, 1, 1);

    test('grace period: silent for 14 days, live on day 15', () {
      expect(
        shouldShowBanner(
          isPro: false,
          firstLaunchAt: installed,
          now: installed.add(const Duration(days: 13)),
          isQueueRunning: false,
        ),
        isFalse,
      );
      expect(
        shouldShowBanner(
          isPro: false,
          firstLaunchAt: installed,
          now: installed.add(const Duration(days: 15)),
          isQueueRunning: false,
        ),
        isTrue,
      );
    });

    test('never for Pro users', () {
      expect(
        shouldShowBanner(
          isPro: true,
          firstLaunchAt: installed,
          now: installed.add(const Duration(days: 365)),
          isQueueRunning: false,
        ),
        isFalse,
      );
    });

    test('never while a batch is converting', () {
      expect(
        shouldShowBanner(
          isPro: false,
          firstLaunchAt: installed,
          now: installed.add(const Duration(days: 365)),
          isQueueRunning: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldPromptReview', () {
    final installed = DateTime(2026, 1, 1);
    final day8 = installed.add(const Duration(days: 8));

    test('asks only after day 7 with two successes', () {
      expect(
        shouldPromptReview(
          hasRated: false,
          firstLaunchAt: installed,
          now: day8,
          successfulConversions: 2,
          lastPromptEpochDay: -1,
        ),
        isTrue,
      );
    });

    test('too early, too few conversions, or already rated — silent', () {
      expect(
        shouldPromptReview(
          hasRated: false,
          firstLaunchAt: installed,
          now: installed.add(const Duration(days: 3)),
          successfulConversions: 10,
          lastPromptEpochDay: -1,
        ),
        isFalse,
      );
      expect(
        shouldPromptReview(
          hasRated: false,
          firstLaunchAt: installed,
          now: day8,
          successfulConversions: 1,
          lastPromptEpochDay: -1,
        ),
        isFalse,
      );
      expect(
        shouldPromptReview(
          hasRated: true,
          firstLaunchAt: installed,
          now: day8,
          successfulConversions: 10,
          lastPromptEpochDay: -1,
        ),
        isFalse,
      );
    });

    test('at most once per day', () {
      final today = day8.millisecondsSinceEpoch ~/ Duration.millisecondsPerDay;
      expect(
        shouldPromptReview(
          hasRated: false,
          firstLaunchAt: installed,
          now: day8,
          successfulConversions: 5,
          lastPromptEpochDay: today,
        ),
        isFalse,
      );
    });
  });

  group('quick presets', () {
    test('every preset produces a legal container/codec pair', () {
      for (final p in QuickPreset.values) {
        final s = p.settings();
        if (s.kind == MediaKind.video) {
          expect(ContainerRules.allowsVideo(s.container, s.videoCodec), isTrue,
              reason: '$p pairs ${s.container} with ${s.videoCodec}');
        }
        if (s.kind != MediaKind.image) {
          expect(ContainerRules.allowsAudio(s.container, s.audioCodec), isTrue,
              reason: '$p pairs ${s.container} with ${s.audioCodec}');
        }
      }
    });

    test('fit-to-size carries the chosen budget', () {
      final s = QuickPreset.fitToSize.settings(sizeTargetBytes: 25 * 1000 * 1000);
      expect(s.sizeTargetBytes, 25 * 1000 * 1000);
      expect(s.rateControl, RateControl.size);
    });
  });
}
