import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:flutter_test/flutter_test.dart';

String? valueOf(List<String> args, String flag) {
  final i = args.indexOf(flag);
  if (i == -1 || i + 1 >= args.length) return null;
  return args[i + 1];
}

void main() {
  group('a conversion must never inflate the file', () {
    // The reported bug: "I converted a video and it got bigger". CRF has no
    // ceiling, so a source that is already efficiently compressed grows.
    final compress = QuickPreset.compressVideo.settings();

    test('constant quality is capped at what the source spent on its picture', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out.mp4',
        settings: compress,
        sourceVideoKbps: 1200,
        sourceAudioKbps: 192,
      );
      expect(valueOf(args, '-crf'), '28');
      // 85% of 1200 leaves headroom for container overhead and VBV slack.
      expect(valueOf(args, '-maxrate'), '1020k');
      expect(valueOf(args, '-bufsize'), '2040k');
      // The source spent more on audio than we would, so our own 128 stands.
      expect(valueOf(args, '-b:a'), '128k');
    });

    test('audio is never re-encoded upward — half of how files grow', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out.mp4',
        settings: compress,
        sourceVideoKbps: 900,
        sourceAudioKbps: 64,
      );
      // A 64 kbps voice track must not become a 128 kbps one.
      expect(valueOf(args, '-b:a'), '64k');
    });

    test('no cap when the source bitrate is unknown', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out.mp4',
        settings: compress,
      );
      expect(valueOf(args, '-crf'), '28');
      expect(args, isNot(contains('-maxrate')));
    });

    test('the cap can be turned off for a deliberate quality-up encode', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out.mp4',
        settings: compress.copyWith(capBitrateToSource: false),
        sourceVideoKbps: 1200,
        sourceAudioKbps: 64,
      );
      expect(args, isNot(contains('-maxrate')));
      // …and the audio goes back to the profile's own bitrate.
      expect(valueOf(args, '-b:a'), '128k');
    });

    test('a downscale lowers the ceiling in proportion to the pixels dropped', () {
      final cap = FFmpegArgs.sourceVideoCapKbps(
        compress.copyWith(resolution: ResolutionPreset.p720),
        4000,
      );
      // 720p carries (720/1080)² ≈ 44% of 1080p's pixels, so 44% of the bits.
      expect(cap, (4000 * 0.85 * (720 * 720) / (1080 * 1080)).round());
    });

    test('the cap is never above the source — a device test caught this', () {
      // A 25 kbps picture given a 32 kbps "minimum sane" ceiling constrains
      // nothing, and the file grows. Whatever the source spent is the limit.
      for (final sourceKbps in [500, 100, 25, 8, 1]) {
        final cap = FFmpegArgs.sourceVideoCapKbps(compress, sourceKbps);
        expect(cap, isNotNull);
        expect(
          cap!,
          lessThanOrEqualTo(sourceKbps),
          reason: 'a $sourceKbps kbps source was capped at $cap kbps',
        );
      }
    });

    test('the size and bitrate modes are untouched by the cap', () {
      final size = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out.mp4',
        settings: QuickPreset.fitToSize.settings(sizeTargetBytes: 10 * 1000 * 1000),
        sourceDurationMs: 60 * 1000,
        sourceVideoKbps: 8000,
      );
      // The budget rules here, not the source rate.
      expect(valueOf(size, '-maxrate'), '1258k');
    });
  });

  group('a queued file announces the format it will really become', () {
    // The reported bug: a photo sat in the queue claiming ".mp4", because the
    // job inherited the stored (video) profile instead of one for its kind.
    test('every kind resolves to a preset whose container matches it', () {
      for (final kind in MediaKind.values) {
        final settings = QuickPreset.defaultFor(kind).settings();
        final outputs = ContainerFormat.outputsFor(kind);
        expect(
          outputs,
          contains(settings.container),
          reason: '$kind would be given a ${settings.container} it cannot become',
        );
      }
    });

    test('an image never resolves to a video container', () {
      final image = QuickPreset.defaultFor(MediaKind.image).settings();
      expect(image.container.kind, MediaKind.image);
      expect(image.container, ContainerFormat.jpg);
    });

    test('an advanced video profile is illegal for a photo, and is replaced', () {
      // This is the substitution `effectiveSettingsProvider` performs: a photo
      // cannot use an MP4/H.264 profile.
      const advancedVideo = ConversionSettings(container: ContainerFormat.mp4);
      expect(
        ContainerFormat.outputsFor(MediaKind.image),
        isNot(contains(advancedVideo.container)),
      );
      final repaired = advancedVideo.withContainer(
        ContainerFormat.defaultOutputFor(MediaKind.image),
      );
      expect(repaired.container, ContainerFormat.jpg);
      expect(repaired.kind, MediaKind.image);
    });

    test('video → audio stays legal: that is extraction, not a mistake', () {
      expect(
        ContainerFormat.outputsFor(MediaKind.video),
        contains(ContainerFormat.mp3),
      );
    });
  });
}
