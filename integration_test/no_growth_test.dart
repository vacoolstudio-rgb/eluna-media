import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

/// The bug this file exists for: "I converted a video and it got *bigger*".
///
/// Constant quality has no upper bound, so a source that is already compressed
/// efficiently — anything that has been through a messenger, or any low-motion
/// clip — can come out larger than it went in. These run FFmpeg for real,
/// because the only proof that matters is the size of the file on disk.
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
    work = Directory('${docs.path}/growth_fixtures');
    if (work.existsSync()) work.deleteSync(recursive: true);
    work.createSync(recursive: true);
  });

  tearDownAll(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  /// A source that is *already* squeezed: low motion, aggressive CRF. Exactly
  /// the kind of file a naive re-encode inflates.
  Future<String> alreadyCompressedVideo(String name) async {
    final path = '${work.path}/$name';
    await synthesise([
      '-y', '-f', 'lavfi',
      // A near-static gradient compresses to almost nothing…
      '-i', 'gradients=size=640x480:duration=6:rate=24',
      '-f', 'lavfi',
      '-i', 'sine=frequency=440:duration=6',
      '-c:v', 'libx264', '-preset', 'veryslow', '-crf', '34',
      '-pix_fmt', 'yuv420p',
      '-c:a', 'aac', '-b:a', '64k',
      path,
    ]);
    return path;
  }

  Future<int> convert({
    required String source,
    required String output,
    required bool cap,
  }) async {
    final durationMs = await converter.probeDurationMs(source);
    final rates = await converter.probeRates(source);
    expect(rates.effectiveVideoKbps, isNotNull,
        reason: 'the source must report a rate to cap against');

    final result = await converter.convert(
      inputPath: source,
      outputPath: output,
      settings: QuickPreset.compressVideo.settings().copyWith(capBitrateToSource: cap),
      totalDurationMs: durationMs,
      sourceRates: rates,
    );
    expect(result.isSuccess, isTrue, reason: result.message ?? 'conversion failed');
    return File(output).lengthSync();
  }

  testWidgets('compressing an already-compressed video does not inflate it',
      (tester) async {
    final source = await alreadyCompressedVideo('squeezed.mp4');
    final inputBytes = File(source).lengthSync();

    final outBytes = await convert(
      source: source,
      output: '${work.path}/capped.mp4',
      cap: true,
    );

    expect(
      outBytes,
      lessThanOrEqualTo(inputBytes),
      reason: 'compressing $inputBytes bytes produced $outBytes bytes',
    );
  });

  testWidgets('the capped output is still a decodable video', (tester) async {
    final out = '${work.path}/capped.mp4';
    final duration = await converter.probeDurationMs(out);
    expect(duration, isNotNull);
    expect(duration!, greaterThan(4000));
  });

  testWidgets('a normal video still converts, and still shrinks', (tester) async {
    // A busy source has plenty of redundancy to remove: the cap must not stop
    // a real compression from happening.
    final source = '${work.path}/busy.mp4';
    await synthesise([
      '-y', '-f', 'lavfi',
      '-i', 'testsrc=duration=4:size=1280x720:rate=30',
      '-f', 'lavfi',
      '-i', 'sine=frequency=440:duration=4',
      '-c:v', 'libx264', '-preset', 'ultrafast', '-crf', '18',
      '-pix_fmt', 'yuv420p', '-c:a', 'aac',
      source,
    ]);
    final inputBytes = File(source).lengthSync();

    final outBytes = await convert(
      source: source,
      output: '${work.path}/busy_out.mp4',
      cap: true,
    );

    expect(outBytes, lessThan(inputBytes));
  });

  testWidgets('a photo converts to the image container, never to video',
      (tester) async {
    // The other reported bug: the queue announced ".mp4" for a photo, because
    // the job inherited the stored video profile. The profile a photo resolves
    // to must be an image one, and FFmpeg must accept it.
    final source = '${work.path}/photo.png';
    await synthesise([
      '-y', '-f', 'lavfi',
      '-i', 'testsrc=size=800x600:duration=1:rate=1',
      '-frames:v', '1', '-update', '1',
      source,
    ]);

    final settings = QuickPreset.defaultFor(MediaKind.image).settings();
    expect(settings.container.kind, MediaKind.image);
    expect(settings.container, ContainerFormat.jpg);

    final output = '${work.path}/photo_out.${settings.container.extension}';
    final result = await converter.convert(
      inputPath: source,
      outputPath: output,
      settings: settings,
    );

    expect(result.isSuccess, isTrue, reason: result.message ?? 'conversion failed');
    expect(File(output).existsSync(), isTrue);
    expect(File(output).lengthSync(), greaterThan(0));
  });
}
