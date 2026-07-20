import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:eluna_media/ui/queue_tab.dart' show formatEta;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('kindOfFile', () {
    test('recognises the formats the app writes', () {
      expect(ContainerFormat.kindOfFile('clip.MP4'), MediaKind.video);
      expect(ContainerFormat.kindOfFile('song.flac'), MediaKind.audio);
      expect(ContainerFormat.kindOfFile('photo.jpeg'), MediaKind.image);
    });

    test('recognises input-only formats it can decode but not write', () {
      expect(ContainerFormat.kindOfFile('IMG_001.HEIC'), MediaKind.image);
      expect(ContainerFormat.kindOfFile('recording.wma'), MediaKind.audio);
      expect(ContainerFormat.kindOfFile('movie.wmv'), MediaKind.video);
    });

    test('admits when it does not know', () {
      expect(ContainerFormat.kindOfFile('README'), isNull);
      expect(ContainerFormat.kindOfFile('archive.zip'), isNull);
    });
  });

  group('outputsFor', () {
    test('a photo can only become another photo', () {
      final outputs = ContainerFormat.outputsFor(MediaKind.image);
      expect(outputs, everyElement(predicate<ContainerFormat>((f) => f.kind == MediaKind.image)));
      expect(outputs, contains(ContainerFormat.jpg));
      expect(outputs, isNot(contains(ContainerFormat.mp4)));
    });

    test('a video can become video, GIF, or audio by extraction', () {
      final outputs = ContainerFormat.outputsFor(MediaKind.video);
      expect(outputs, contains(ContainerFormat.mp4));
      expect(outputs, contains(ContainerFormat.gif));
      expect(outputs, contains(ContainerFormat.mp3));
      // But never a still image: that is the nonsense the old dropdown allowed.
      expect(outputs, isNot(contains(ContainerFormat.jpg)));
    });

    test('audio stays audio', () {
      final outputs = ContainerFormat.outputsFor(MediaKind.audio);
      expect(outputs, everyElement(predicate<ContainerFormat>((f) => f.kind == MediaKind.audio)));
    });

    test('the recommended default is legal for its own source kind', () {
      for (final kind in MediaKind.values) {
        expect(
          ContainerFormat.outputsFor(kind),
          contains(ContainerFormat.defaultOutputFor(kind)),
        );
      }
    });
  });

  group('presets by kind', () {
    test('each kind has presets, and they all expect that kind', () {
      for (final kind in MediaKind.values) {
        final presets = QuickPreset.forKind(kind);
        expect(presets, isNotEmpty, reason: '$kind has no presets');
        expect(presets, everyElement(predicate<QuickPreset>((p) => p.expectsKind == kind)));
        expect(presets, contains(QuickPreset.defaultFor(kind)));
      }
    });

    test('every preset is covered by exactly one kind', () {
      final covered = [
        for (final kind in MediaKind.values) ...QuickPreset.forKind(kind),
      ];
      expect(covered.toSet(), QuickPreset.values.toSet());
      expect(covered.length, QuickPreset.values.length);
    });
  });

  group('estimatedRemaining', () {
    ConversionJob running({required double progress, required int startedMsAgo}) {
      final now = DateTime(2026, 7, 12, 12);
      return ConversionJob(
        id: 'j',
        inputPath: '/a.mp4',
        inputName: 'a.mp4',
        settings: const ConversionSettings(container: ContainerFormat.mp4),
        status: JobStatus.running,
        progress: progress,
        sourceDurationMs: 60000,
        startedAtMs: now.millisecondsSinceEpoch - startedMsAgo,
      );
    }

    final now = DateTime(2026, 7, 12, 12);

    test('extrapolates from elapsed time and progress', () {
      // 25% done after 10 s → 30 s left.
      final job = running(progress: 0.25, startedMsAgo: 10000);
      expect(job.estimatedRemaining(now: now), const Duration(seconds: 30));
    });

    test('stays silent until there is enough signal', () {
      expect(running(progress: 0.001, startedMsAgo: 500).estimatedRemaining(now: now), isNull);
    });

    test('a still image has no timeline, so no estimate', () {
      const still = ConversionJob(
        id: 'j',
        inputPath: '/a.png',
        inputName: 'a.png',
        settings: ConversionSettings(container: ContainerFormat.jpg),
        status: JobStatus.running,
        progress: 0.5,
        startedAtMs: 1,
      );
      expect(still.estimatedRemaining(now: now), isNull);
    });

    test('a job that is not running has nothing to estimate', () {
      final done = running(progress: 1, startedMsAgo: 10000)
          .copyWith(status: JobStatus.completed);
      expect(done.estimatedRemaining(now: now), isNull);
    });
  });

  group('formatEta', () {
    test('minutes and seconds below an hour', () {
      expect(formatEta(const Duration(seconds: 45)), '0:45');
      expect(formatEta(const Duration(minutes: 2, seconds: 5)), '2:05');
    });

    test('hours and minutes above one hour', () {
      expect(formatEta(const Duration(hours: 1, minutes: 12)), '1 h 12 m');
    });
  });
}
