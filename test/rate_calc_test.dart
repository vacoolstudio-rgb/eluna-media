import 'package:eluna_media/core/rate_calc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('videoKbpsForTarget', () {
    test('splits the budget between video and audio with the safety margin', () {
      // 10 MB over 60 s: 10e6 * 8 * 0.93 / 60 / 1000 = 1240 kbps total.
      final kbps = RateCalc.videoKbpsForTarget(
        targetBytes: 10 * 1000 * 1000,
        durationMs: 60 * 1000,
        audioKbps: 96,
      );
      expect(kbps, 1144);
    });

    test('the resulting encode fits under the target', () {
      const target = 10 * 1000 * 1000;
      const durationMs = 60 * 1000;
      final kbps = RateCalc.videoKbpsForTarget(
        targetBytes: target,
        durationMs: durationMs,
        audioKbps: 96,
      )!;
      final estimated = RateCalc.estimatedBytes(
        videoKbps: kbps,
        audioKbps: 96,
        durationMs: durationMs,
      );
      expect(estimated, lessThan(target));
    });

    test('returns null when audio alone eats the budget', () {
      // 1 MB over 10 minutes: ~12 kbps total, all consumed by audio.
      expect(
        RateCalc.videoKbpsForTarget(
          targetBytes: 1000 * 1000,
          durationMs: 10 * 60 * 1000,
          audioKbps: 96,
        ),
        isNull,
      );
    });

    test('returns null below the minimum watchable bitrate', () {
      final kbps = RateCalc.videoKbpsForTarget(
        targetBytes: 2 * 1000 * 1000,
        durationMs: 10 * 60 * 1000,
        audioKbps: 0,
      );
      // ~24 kbps of video is a smear, not a video.
      expect(kbps, isNull);
    });

    test('rejects nonsense input', () {
      expect(
        RateCalc.videoKbpsForTarget(targetBytes: 0, durationMs: 1000, audioKbps: 0),
        isNull,
      );
      expect(
        RateCalc.videoKbpsForTarget(targetBytes: 1000, durationMs: 0, audioKbps: 0),
        isNull,
      );
    });
  });
}
