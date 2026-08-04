import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/core/quality_search.dart';
import 'package:eluna_media/core/time_input.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:eluna_media/services/device_storage.dart';
import 'package:eluna_media/services/thumbnails.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QualitySearch', () {
    // Stands in for a JPEG encoder: bytes rise monotonically with quality.
    int bytesAt(int quality) => quality * 10000;

    int? run({required int target, int? maxSteps}) {
      final search =
          maxSteps == null ? QualitySearch() : QualitySearch(maxSteps: maxSteps);
      while (true) {
        final quality = search.next();
        if (quality == null) break;
        search.record(
          quality: quality,
          bytes: bytesAt(quality),
          targetBytes: target,
        );
      }
      return search.bestFitting;
    }

    test('finds the highest quality that fits', () {
      // 70 * 10000 = 700 000 fits in 705 000; 71 does not.
      final best = run(target: 705000);
      expect(best, isNotNull);
      expect(bytesAt(best!), lessThanOrEqualTo(705000));
      expect(bytesAt(best + 1), greaterThan(705000));
    });

    test('never returns a quality that overshoots', () {
      for (final target in [60000, 250000, 480000, 990000]) {
        final best = run(target: target);
        if (best != null) expect(bytesAt(best), lessThanOrEqualTo(target));
      }
    });

    test('reports nothing when even the floor overshoots', () {
      // The floor is quality 5 = 50 000 bytes; 20 000 is unreachable, and the
      // converter answers that by shrinking the frame instead.
      expect(run(target: 20000), isNull);
    });

    test('takes the top of the range when everything fits', () {
      expect(run(target: 10000000), 100);
    });

    test('stays inside its probe budget', () {
      final search = QualitySearch(maxSteps: 4);
      var probes = 0;
      while (true) {
        final quality = search.next();
        if (quality == null) break;
        probes++;
        search.record(quality: quality, bytes: bytesAt(quality), targetBytes: 1);
      }
      expect(probes, lessThanOrEqualTo(4));
    });
  });

  group('TimeInput', () {
    test('reads the shapes a person types', () {
      expect(TimeInput.parse('12'), 12000);
      expect(TimeInput.parse('1:23'), 83000);
      expect(TimeInput.parse('1:02:03'), 3723000);
      expect(TimeInput.parse('  2:00  '), 120000);
      expect(TimeInput.parse('1:23.5'), 83500);
      // A leading field may run over: "90:00" is a minute count, not an error.
      expect(TimeInput.parse('90:00'), 5400000);
    });

    test('refuses what it cannot read rather than guessing', () {
      for (final bad in ['', ' ', 'abc', '1:75', '-3', '1:2:3:4', '1::2', '1:-2']) {
        expect(TimeInput.parse(bad), isNull, reason: bad);
      }
    });

    test('round-trips through format', () {
      for (final ms in [0, 1000, 59000, 60000, 3599000, 3600000, 7325000]) {
        expect(TimeInput.parse(TimeInput.format(ms)), ms);
      }
    });

    test('formats the way a player would', () {
      expect(TimeInput.format(0), '0:00');
      expect(TimeInput.format(5000), '0:05');
      expect(TimeInput.format(65000), '1:05');
      expect(TimeInput.format(3725000), '1:02:05');
    });
  });

  group('SpaceCheck', () {
    test('an unknown free figure never blocks a batch', () {
      expect(SpaceCheck.fits(totalInputBytes: 1 << 40, freeBytes: null), isTrue);
    });

    test('passes when there is room for the sources plus headroom', () {
      expect(SpaceCheck.fits(totalInputBytes: 100, freeBytes: 116), isTrue);
    });

    test('fails when the volume cannot hold the batch', () {
      expect(SpaceCheck.fits(totalInputBytes: 1000, freeBytes: 900), isFalse);
    });

    test('budgets more than the sources, never less', () {
      expect(SpaceCheck.requiredBytes(1000), greaterThan(1000));
      expect(SpaceCheck.requiredBytes(0), 0);
    });
  });

  group('animated sources', () {
    test('a GIF may become a video, a JPEG may not', () {
      expect(ContainerFormat.isAnimatedSource('cat.gif'), isTrue);
      expect(ContainerFormat.isAnimatedSource('CAT.GIF'), isTrue);
      expect(ContainerFormat.isAnimatedSource('photo.jpg'), isFalse);
      // An animated WebP is indistinguishable from a still one by name, so it
      // is deliberately not claimed.
      expect(ContainerFormat.isAnimatedSource('sticker.webp'), isFalse);
    });

    test('the video containers open up only for an animated source', () {
      final still = ContainerFormat.outputsFor(MediaKind.image);
      expect(still, isNot(contains(ContainerFormat.mp4)));

      final animated = ContainerFormat.outputsFor(MediaKind.image, animatedSource: true);
      expect(animated, contains(ContainerFormat.mp4));
      // It keeps its still targets: one frame out as a JPEG is a real ask.
      expect(animated, contains(ContainerFormat.jpg));
      // And audio is still nonsense for a picture.
      expect(animated, isNot(contains(ContainerFormat.mp3)));
    });
  });

  group('image filter chain', () {
    ConversionSettings image({
      ImageScale scale = ImageScale.keep,
      ResolutionPreset resolution = ResolutionPreset.keep,
    }) =>
        ConversionSettings(
          container: ContainerFormat.jpg,
          imageScale: scale,
          resolution: resolution,
        );

    test('no scale filter when nothing asks for one', () {
      expect(FFmpegArgs.imageFilters(image()), isEmpty);
    });

    test('a percentage becomes an even-dimensioned scale', () {
      final filters = FFmpegArgs.imageFilters(image(scale: ImageScale.p50));
      expect(filters, hasLength(1));
      expect(filters.single, contains('0.500'));
      // Odd dimensions are what the JPEG/yuv420p path chokes on.
      expect(filters.single, contains('2*trunc(iw*'));
    });

    test('the percentage and the fit-to-size fallback multiply into one pass', () {
      final filters = FFmpegArgs.imageFilters(image(scale: ImageScale.p50), downscale: 0.5);
      expect(filters.where((f) => f.startsWith('scale=')), hasLength(1));
      expect(filters.single, contains('0.250'));
    });

    test('a resolution target and a percentage compose rather than fight', () {
      final filters = FFmpegArgs.imageFilters(
        image(scale: ImageScale.p50, resolution: ResolutionPreset.p1080),
      );
      expect(filters.where((f) => f.contains('scale=')).length, 2);
      expect(filters.first, contains(':1080'));
      expect(filters.last, contains('0.500'));
    });
  });

  group('audio channel and rate arguments', () {
    List<String> argsFor(ConversionSettings settings) => FFmpegArgs.build(
          inputPath: 'in.m4a',
          outputPath: 'out.mp3',
          settings: settings,
        );

    test('original layout and rate add no flags at all', () {
      final args = argsFor(const ConversionSettings(
        container: ContainerFormat.mp3,
        audioCodec: AudioCodec.mp3,
      ));
      expect(args, isNot(contains('-ac')));
      expect(args, isNot(contains('-ar')));
    });

    test('mono at a reduced rate reaches FFmpeg', () {
      final args = argsFor(const ConversionSettings(
        container: ContainerFormat.mp3,
        audioCodec: AudioCodec.mp3,
        audioChannels: AudioChannels.mono,
        sampleRate: SampleRate.hz22050,
      ));
      expect(args[args.indexOf('-ac') + 1], '1');
      expect(args[args.indexOf('-ar') + 1], '22050');
    });

    test('a copied stream is never told to resample', () {
      final args = FFmpegArgs.build(
        inputPath: 'in.mkv',
        outputPath: 'out.mkv',
        settings: const ConversionSettings(
          container: ContainerFormat.mkv,
          audioCodec: AudioCodec.copy,
          audioChannels: AudioChannels.mono,
          sampleRate: SampleRate.hz16000,
        ),
      );
      expect(args, isNot(contains('-ac')));
      expect(args, isNot(contains('-ar')));
    });
  });

  group('photo fit-to-size preset', () {
    test('carries a byte budget and expects a picture', () {
      const preset = QuickPreset.fitPhotoToSize;
      expect(preset.expectsKind, MediaKind.image);
      expect(preset.needsSizeTarget, isTrue);

      final settings = preset.settings(sizeTargetBytes: PhotoSizeTarget.kb300.bytes);
      expect(settings.container, ContainerFormat.jpg);
      expect(settings.sizeTargetBytes, 300000);
    });

    test('the photo budgets stay in kilobyte territory', () {
      // A 10 MB messenger limit is a budget every phone photo already fits.
      for (final target in PhotoSizeTarget.values) {
        expect(target.bytes, lessThanOrEqualTo(2 * 1000 * 1000));
      }
    });

    test('it survives a settings round-trip through storage', () {
      final settings = QuickPreset.fitPhotoToSize
          .settings(sizeTargetBytes: PhotoSizeTarget.kb100.bytes)
          .copyWith(imageScale: ImageScale.p75);
      final restored = ConversionSettings.fromJson(settings.toJson());
      expect(restored.sizeTargetBytes, 100000);
      expect(restored.imageScale, ImageScale.p75);
    });
  });

  group('thumbnail cache keys', () {
    test('are stable for the same file', () {
      expect(
        ThumbnailCache.cacheKey('/a/b/clip.mp4', 1234),
        ThumbnailCache.cacheKey('/a/b/clip.mp4', 1234),
      );
    });

    test('separate different files and different contents', () {
      expect(
        ThumbnailCache.cacheKey('/a/b/clip.mp4', 1234),
        isNot(ThumbnailCache.cacheKey('/a/b/other.mp4', 1234)),
      );
      // A picker handing back a different file under a reused name must not
      // inherit the old preview.
      expect(
        ThumbnailCache.cacheKey('/a/b/clip.mp4', 1234),
        isNot(ThumbnailCache.cacheKey('/a/b/clip.mp4', 9999)),
      );
    });

    test('produce a filename-safe key', () {
      final key = ThumbnailCache.cacheKey(r'C:\Users\a b\пример.mp4', 12);
      expect(RegExp(r'^[0-9a-f]+_\d+$').hasMatch(key), isTrue, reason: key);
    });
  });
}
