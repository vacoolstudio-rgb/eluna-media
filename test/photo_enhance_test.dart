import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:flutter_test/flutter_test.dart';

String? _valueOf(List<String> args, String flag) {
  final i = args.indexOf(flag);
  if (i == -1 || i + 1 >= args.length) return null;
  return args[i + 1];
}

List<String> _build(ConversionSettings s) => FFmpegArgs.build(
      inputPath: '/in.jpg',
      outputPath: '/out.jpg',
      settings: s,
    );

/// The index of the first filter whose name is [name], or -1.
int _indexOfFilter(List<String> chain, String name) =>
    chain.indexWhere((f) => f == name || f.startsWith('$name='));

void main() {
  const jpg = ConversionSettings(container: ContainerFormat.jpg);

  group('image filter chain', () {
    test('a plain conversion adds no filters at all', () {
      expect(FFmpegArgs.imageFilters(jpg), isEmpty);
      expect(_build(jpg), isNot(contains('-vf')));
    });

    test('sharpen levels map onto unsharp, luma only', () {
      for (final level in [EnhanceLevel.light, EnhanceLevel.medium, EnhanceLevel.strong]) {
        final chain = FFmpegArgs.imageFilters(jpg.copyWith(sharpen: level));
        expect(chain, hasLength(1));
        expect(chain.single, startsWith('unsharp='));
        // Sharpened chroma is what produces coloured fringes; the builder must
        // always pin it off.
        expect(chain.single, contains('chroma_amount=0'));
      }
    });

    test('sharpening gets stronger as the level rises', () {
      double amountOf(EnhanceLevel level) {
        final filter = FFmpegArgs.imageFilters(jpg.copyWith(sharpen: level)).single;
        final match = RegExp(r'luma_amount=([\d.]+)').firstMatch(filter);
        return double.parse(match!.group(1)!);
      }

      expect(amountOf(EnhanceLevel.light), lessThan(amountOf(EnhanceLevel.medium)));
      expect(amountOf(EnhanceLevel.medium), lessThan(amountOf(EnhanceLevel.strong)));
    });

    test('denoise levels map onto hqdn3d', () {
      final chain = FFmpegArgs.imageFilters(jpg.copyWith(denoise: EnhanceLevel.medium));
      expect(chain, ['hqdn3d=4:3']);
    });

    test('auto colour normalises before it saturates', () {
      final chain = FFmpegArgs.imageFilters(jpg.copyWith(autoColor: true));
      expect(_indexOfFilter(chain, 'normalize'), 0);
      expect(_indexOfFilter(chain, 'eq'), 1);
    });

    test('denoise runs before scaling, sharpening runs after it', () {
      // The whole point of the ordering: sharpening amplified noise cannot be
      // undone, and sharpening before a downscale throws the acutance away.
      final chain = FFmpegArgs.imageFilters(
        jpg.copyWith(
          denoise: EnhanceLevel.light,
          autoColor: true,
          sharpen: EnhanceLevel.medium,
          resolution: ResolutionPreset.p1080,
        ),
      );

      final denoise = _indexOfFilter(chain, 'hqdn3d');
      final normalize = _indexOfFilter(chain, 'normalize');
      final scale = _indexOfFilter(chain, 'scale');
      final sharpen = _indexOfFilter(chain, 'unsharp');

      expect(denoise, isNonNegative);
      expect(denoise, lessThan(normalize));
      expect(normalize, lessThan(scale));
      expect(scale, lessThan(sharpen));
    });

    test('the chain reaches FFmpeg as a single comma-joined -vf', () {
      final args = _build(jpg.copyWith(sharpen: EnhanceLevel.light, autoColor: true));
      final vf = _valueOf(args, '-vf');
      expect(vf, isNotNull);
      expect(vf!.split(',').where((f) => f.startsWith('unsharp=')), hasLength(1));
      expect('-vf'.allMatches(args.join(' ')), hasLength(1));
    });

    test('2× upscale doubles both dimensions with lanczos', () {
      final chain = FFmpegArgs.imageFilters(jpg.copyWith(upscale2x: true));
      expect(chain, ['scale=iw*2:ih*2:flags=lanczos']);
    });

    test('a downscale target beats the upscale toggle, and only one scale runs', () {
      // Both are the same filter in the same slot; emitting two scales would
      // shrink the photo and then blow the shrunken pixels back up.
      final settings = jpg.copyWith(
        upscale2x: true,
        resolution: ResolutionPreset.p720,
      );
      final chain = FFmpegArgs.imageFilters(settings);

      expect(chain.where((f) => f.startsWith('scale=')), hasLength(1));
      expect(chain, contains('scale=-1:720:flags=lanczos'));
      expect(settings.upscaleActive, isFalse);
    });

    test('upscaling is sharpened after it, not before', () {
      // Resampling softens; sharpening the small original and then doubling it
      // would blur away the acutance it just added.
      final chain = FFmpegArgs.imageFilters(
        jpg.copyWith(upscale2x: true, sharpen: EnhanceLevel.medium),
      );
      expect(_indexOfFilter(chain, 'scale'), lessThan(_indexOfFilter(chain, 'unsharp')));
    });

    test('GIF keeps its palette pipeline and ignores enhancement', () {
      final args = _build(
        const ConversionSettings(container: ContainerFormat.gif).copyWith(
          sharpen: EnhanceLevel.strong,
          denoise: EnhanceLevel.strong,
          autoColor: true,
        ),
      );
      expect(args, contains('-filter_complex'));
      expect(args.join(' '), contains('palettegen'));
      expect(args.join(' '), isNot(contains('unsharp')));
    });
  });

  group('enhance photo preset', () {
    test('is offered for images and produces the full chain', () {
      expect(QuickPreset.forKind(MediaKind.image), contains(QuickPreset.enhancePhoto));

      final settings = QuickPreset.enhancePhoto.settings();
      expect(settings.container, ContainerFormat.jpg);
      expect(settings.enhances, isTrue);

      final chain = FFmpegArgs.imageFilters(settings);
      expect(_indexOfFilter(chain, 'hqdn3d'), isNonNegative);
      expect(_indexOfFilter(chain, 'normalize'), isNonNegative);
      expect(_indexOfFilter(chain, 'unsharp'), isNonNegative);
    });

    test('does not re-compress away what the filters just recovered', () {
      // Enhancing at the compress preset's quality 80 would be self-defeating.
      expect(
        QuickPreset.enhancePhoto.settings().imageQuality,
        greaterThan(QuickPreset.compressImage.settings().imageQuality),
      );
    });
  });

  group('persistence', () {
    test('enhancement survives a storage round-trip', () {
      final settings = jpg.copyWith(
        sharpen: EnhanceLevel.strong,
        denoise: EnhanceLevel.light,
        autoColor: true,
        upscale2x: true,
      );
      final restored = ConversionSettings.fromJson(settings.toJson());
      expect(restored.sharpen, EnhanceLevel.strong);
      expect(restored.denoise, EnhanceLevel.light);
      expect(restored.autoColor, isTrue);
      expect(restored.upscale2x, isTrue);
    });

    test('an entry written before the feature existed decodes to off', () {
      final old = jpg.toJson()
        ..remove('sharpen')
        ..remove('denoise')
        ..remove('autoColor')
        ..remove('upscale2x');
      final restored = ConversionSettings.fromJson(old);
      expect(restored.enhances, isFalse);
    });
  });
}
