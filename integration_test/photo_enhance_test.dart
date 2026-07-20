import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

/// The class of bug the host tests cannot catch: an argument vector that is
/// well-formed Dart and still makes FFmpeg exit non-zero — a filter that is not
/// compiled into this build, an option name that does not exist, a chain that
/// the graph parser rejects. Every enhancement level is actually run here,
/// because "the string looked right" is not evidence that it encodes.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Directory work;
  final converter = FFmpegConverter();

  Future<void> synthesise(List<String> args) async {
    final session = await FFmpegKit.executeWithArgumentsAsync(args);
    ReturnCode? code;
    for (var i = 0; i < 300; i++) {
      code = await session.getReturnCode();
      if (code != null) break;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    expect(ReturnCode.isSuccess(code), isTrue,
        reason: 'fixture generation failed: ${await session.getLogsAsString()}');
  }

  setUpAll(() async {
    final docs = await getApplicationDocumentsDirectory();
    work = Directory('${docs.path}/enhance_fixtures');
    if (work.existsSync()) work.deleteSync(recursive: true);
    work.createSync(recursive: true);
  });

  tearDownAll(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  /// A photo with something to fix: soft, grainy and flat — the state of every
  /// snapshot the enhance preset exists for.
  Future<String> softNoisyPhoto(String name) async {
    final path = '${work.path}/$name';
    await synthesise([
      '-y', '-f', 'lavfi',
      '-i', 'testsrc=size=1024x768:duration=1:rate=1',
      '-vf', 'boxblur=2:1,noise=alls=18:allf=t+u,eq=contrast=0.8:saturation=0.7',
      '-frames:v', '1', '-update', '1',
      path,
    ]);
    return path;
  }

  Future<File> convert(String source, ConversionSettings settings, String name) async {
    final output = '${work.path}/$name';
    final result = await converter.convert(
      inputPath: source,
      outputPath: output,
      settings: settings,
    );
    expect(result.isSuccess, isTrue,
        reason: 'FFmpeg rejected ${FFmpegArgs.imageFilters(settings)}: '
            '${result.message ?? 'no message'}');
    final file = File(output);
    expect(file.existsSync(), isTrue);
    expect(file.lengthSync(), greaterThan(0));
    return file;
  }

  testWidgets('every enhancement level FFmpeg is asked for actually runs',
      (tester) async {
    final source = await softNoisyPhoto('soft.png');

    // The combinatorial sweep is the point: each level string is a separate
    // chance to have misspelled an option that only FFmpeg can catch.
    var n = 0;
    for (final level in EnhanceLevel.values) {
      await convert(
        source,
        ConversionSettings(container: ContainerFormat.jpg, sharpen: level),
        'sharpen_${level.name}_${n++}.jpg',
      );
      await convert(
        source,
        ConversionSettings(container: ContainerFormat.jpg, denoise: level),
        'denoise_${level.name}_${n++}.jpg',
      );
    }

    await convert(
      source,
      const ConversionSettings(container: ContainerFormat.jpg, autoColor: true),
      'autocolor.jpg',
    );

    await convert(
      source,
      const ConversionSettings(container: ContainerFormat.jpg, upscale2x: true),
      'upscaled.jpg',
    );

    // The full chain, including the scale that sits in the middle of it.
    await convert(
      source,
      const ConversionSettings(
        container: ContainerFormat.jpg,
        sharpen: EnhanceLevel.strong,
        denoise: EnhanceLevel.strong,
        autoColor: true,
        resolution: ResolutionPreset.p720,
      ),
      'everything.jpg',
    );
  });

  testWidgets('the enhance preset changes the picture it is given', (tester) async {
    final source = await softNoisyPhoto('flat.png');

    final plain = await convert(
      source,
      QuickPreset.enhancePhoto.settings().copyWith(
            sharpen: EnhanceLevel.none,
            denoise: EnhanceLevel.none,
            autoColor: false,
          ),
      'plain.jpg',
    );
    final enhanced = await convert(source, QuickPreset.enhancePhoto.settings(), 'enhanced.jpg');

    // A filter chain that FFmpeg silently ignored would produce byte-identical
    // output at the same quality setting — which is exactly the failure this
    // catches, and the one a "conversion succeeded" check would sail past.
    expect(
      enhanced.readAsBytesSync(),
      isNot(equals(plain.readAsBytesSync())),
      reason: 'the enhancement filters had no effect on the output',
    );
  });

  /// The decoded pixel dimensions of [path]. A probe that comes back with real
  /// numbers is also proof the file is a valid JPEG rather than a truncated
  /// one that merely has bytes in it.
  Future<(int, int)> dimensionsOf(String path) async {
    final session = await FFprobeKit.getMediaInformation(path);
    final streams = session.getMediaInformation()?.getStreams();
    expect(streams, isNotNull, reason: 'could not probe $path');
    final video = streams!.firstWhere((s) => s.getType() == 'video');
    final w = video.getWidth();
    final h = video.getHeight();
    expect(w, isNotNull);
    expect(h, isNotNull);
    return (w!, h!);
  }

  testWidgets('enhancement alone does not resize the photo', (tester) async {
    final source = await softNoisyPhoto('sized.png');
    final out = await convert(source, QuickPreset.enhancePhoto.settings(), 'sized_out.jpg');

    expect(await dimensionsOf(out.path), await dimensionsOf(source));
  });

  testWidgets('2× upscale really doubles the pixels', (tester) async {
    final source = await softNoisyPhoto('small.png');
    final (sw, sh) = await dimensionsOf(source);

    final out = await convert(
      source,
      QuickPreset.enhancePhoto.settings().copyWith(upscale2x: true),
      'doubled.jpg',
    );

    expect(await dimensionsOf(out.path), (sw * 2, sh * 2));
  });

  testWidgets('a downscale target wins over the upscale toggle', (tester) async {
    // The stored-settings case the host test can only assert on the argument
    // vector: FFmpeg must produce a 720-high photo, not a doubled one.
    final source = await softNoisyPhoto('conflict.png');
    final out = await convert(
      source,
      QuickPreset.enhancePhoto.settings().copyWith(
            upscale2x: true,
            resolution: ResolutionPreset.p720,
          ),
      'conflict_out.jpg',
    );

    final (_, h) = await dimensionsOf(out.path);
    expect(h, 720);
  });
}
