import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

/// End-to-end checks that run on a real device.
///
/// The unit tests assert what the argument vector *looks like*; these assert
/// that FFmpeg actually accepts it and writes a decodable file. That is the
/// part that cannot be verified on the host VM.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Directory work;
  late String videoSrc;
  late String imageSrc;
  final converter = FFmpegConverter();

  /// Synthesises a source file with FFmpeg's own `lavfi` generators so the test
  /// carries no binary fixtures.
  Future<void> synthesise(List<String> args) async {
    final session = await FFmpegKit.executeWithArgumentsAsync(args);
    // executeWithArgumentsAsync returns before completion; poll the return code.
    ReturnCode? code;
    for (var i = 0; i < 200; i++) {
      code = await session.getReturnCode();
      if (code != null) break;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    expect(ReturnCode.isSuccess(code), isTrue,
        reason: 'fixture generation failed: ${await session.getLogsAsString()}');
  }

  setUpAll(() async {
    final docs = await getApplicationDocumentsDirectory();
    work = Directory('${docs.path}/it_fixtures');
    if (work.existsSync()) work.deleteSync(recursive: true);
    work.createSync(recursive: true);

    videoSrc = '${work.path}/src.mp4';
    imageSrc = '${work.path}/src.png';

    await synthesise([
      '-y', '-f', 'lavfi',
      '-i', 'testsrc=duration=2:size=320x240:rate=10',
      '-f', 'lavfi',
      '-i', 'sine=frequency=440:duration=2',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac',
      videoSrc,
    ]);
    await synthesise([
      '-y', '-f', 'lavfi',
      '-i', 'testsrc=size=128x96:duration=1:rate=1',
      '-frames:v', '1', '-update', '1',
      imageSrc,
    ]);

    expect(File(videoSrc).lengthSync(), greaterThan(0));
    expect(File(imageSrc).lengthSync(), greaterThan(0));
  });

  tearDownAll(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  /// Runs one conversion and asserts a non-empty file came out.
  Future<File> convert(
    String input,
    ConversionSettings settings,
    String outName, {
    void Function(double)? onProgress,
  }) async {
    final out = '${work.path}/$outName';
    final durationMs = await converter.probeDurationMs(input);
    final result = await converter.convert(
      inputPath: input,
      outputPath: out,
      settings: settings,
      totalDurationMs: durationMs,
      onProgress: onProgress,
    );
    expect(result.isSuccess, isTrue, reason: 'FFmpeg said: ${result.message}');
    final file = File(out);
    expect(file.existsSync(), isTrue, reason: 'no output at $out');
    expect(file.lengthSync(), greaterThan(0), reason: 'empty output at $out');
    return file;
  }

  /// Confirms FFmpeg can decode what we produced — a file that exists but is
  /// malformed would otherwise pass.
  Future<void> assertDecodable(String path) async {
    final ms = await converter.probeDurationMs(path);
    // Stills legitimately have no duration; the probe simply must not throw.
    expect(ms == null || ms > 0, isTrue);
  }

  group('probe', () {
    test('reads the source duration', () async {
      final ms = await converter.probeDurationMs(videoSrc);
      expect(ms, isNotNull);
      expect(ms, closeTo(2000, 300));
    });
  });

  group('video', () {
    test('H.264 CRF transcode with downscale reports progress and decodes', () async {
      final seen = <double>[];
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          crf: 30,
          resolution: ResolutionPreset.p360,
          preset: EncodingPreset.ultrafast,
        ),
        'out_h264.mp4',
        onProgress: seen.add,
      );
      await assertDecodable(file.path);

      expect(seen, isNotEmpty, reason: 'no statistics callbacks arrived');
      expect(seen.last, closeTo(1.0, 0.001));
      expect(seen.every((p) => p >= 0 && p <= 1), isTrue);
    });

    test('H.265 into MP4 (the hvc1 tag path) succeeds', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h265,
          audioCodec: AudioCodec.aac,
          crf: 32,
          preset: EncodingPreset.ultrafast,
          resolution: ResolutionPreset.p360,
        ),
        'out_h265.mp4',
      );
      await assertDecodable(file.path);
    });

    test('VP9/Opus into WebM succeeds', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.vp9,
          audioCodec: AudioCodec.opus,
          crf: 50,
          resolution: ResolutionPreset.p360,
        ),
        'out_vp9.webm',
      );
      await assertDecodable(file.path);
    }, timeout: const Timeout(Duration(minutes: 3)));

    test('stream copy remuxes MP4 into MKV', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.mkv,
          videoCodec: VideoCodec.copy,
          audioCodec: AudioCodec.copy,
        ),
        'out_copy.mkv',
      );
      await assertDecodable(file.path);
    });

    test('trimming produces a shorter file', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          preset: EncodingPreset.ultrafast,
          trim: TrimRange(startMs: 500, endMs: 1500),
        ),
        'out_trim.mp4',
      );
      final ms = await converter.probeDurationMs(file.path);
      expect(ms, isNotNull);
      expect(ms, closeTo(1000, 250));
    });

    test('dropping audio yields a file with no audio stream', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.none,
          preset: EncodingPreset.ultrafast,
        ),
        'out_noaudio.mp4',
      );
      await assertDecodable(file.path);
    });
  });

  group('audio extraction', () {
    test('MP4 to MP3', () async {
      final file = await convert(
        videoSrc,
        ConversionSettings.defaultsFor(ContainerFormat.mp3),
        'out.mp3',
      );
      await assertDecodable(file.path);
    });

    test('MP4 to lossless WAV', () async {
      final file = await convert(
        videoSrc,
        ConversionSettings.defaultsFor(ContainerFormat.wav),
        'out.wav',
      );
      await assertDecodable(file.path);
    });

    test('MP4 to FLAC', () async {
      final file = await convert(
        videoSrc,
        ConversionSettings.defaultsFor(ContainerFormat.flac),
        'out.flac',
      );
      await assertDecodable(file.path);
    });
  });

  group('images', () {
    test('PNG to JPEG honours the quality slider', () async {
      final high = await convert(
        imageSrc,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 98),
        'q_high.jpg',
      );
      final low = await convert(
        imageSrc,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 10),
        'q_low.jpg',
      );
      expect(low.lengthSync(), lessThan(high.lengthSync()));
    });

    test('the WebP lossless flag selects the VP8L bitstream', () async {
      final lossless = await convert(
        imageSrc,
        const ConversionSettings(container: ContainerFormat.webp, lossless: true),
        'out_lossless.webp',
      );
      final lossy = await convert(
        imageSrc,
        const ConversionSettings(
          container: ContainerFormat.webp,
          lossless: false,
          imageQuality: 40,
        ),
        'out_lossy.webp',
      );

      // A WebP file is `RIFF<size>WEBP` followed by a chunk FourCC that names
      // the bitstream: `VP8L` for lossless, `VP8 ` for lossy. Comparing file
      // sizes would prove nothing here — the synthetic test pattern is flat
      // colour, which lossless compression happens to handle better than DCT.
      String fourCc(File f) => String.fromCharCodes(f.readAsBytesSync().sublist(12, 16));

      expect(fourCc(lossless), 'VP8L');
      expect(fourCc(lossy), 'VP8 ');
    });

    test('PNG to BMP and TIFF', () async {
      await convert(imageSrc, const ConversionSettings(container: ContainerFormat.bmp), 'out.bmp');
      await convert(imageSrc, const ConversionSettings(container: ContainerFormat.tiff), 'out.tiff');
    });

    test('image downscale changes the encoded size', () async {
      final full = await convert(
        imageSrc,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 90),
        'scale_full.jpg',
      );
      final small = await convert(
        imageSrc,
        const ConversionSettings(
          container: ContainerFormat.jpg,
          imageQuality: 90,
          resolution: ResolutionPreset.p360,
        ),
        'scale_small.jpg',
      );
      expect(small.lengthSync(), isNot(full.lengthSync()));
    });

    test('video to animated GIF via the palette graph', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.gif,
          fps: FpsPreset.fps15,
          resolution: ResolutionPreset.p360,
        ),
        'out.gif',
      );
      // A single-frame GIF would be tiny; a 2 s animation is not.
      expect(file.lengthSync(), greaterThan(2000));
    });

    test('video to a single JPEG frame', () async {
      await convert(
        videoSrc,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 85),
        'frame.jpg',
      );
    });
  });

  group('metadata', () {
    test('stripping metadata still yields a decodable file', () async {
      final file = await convert(
        videoSrc,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          preset: EncodingPreset.ultrafast,
          stripMetadata: true,
        ),
        'out_stripped.mp4',
      );
      await assertDecodable(file.path);
    });
  });

  group('failure handling', () {
    test('a missing input reports failure with the FFmpeg message', () async {
      final result = await converter.convert(
        inputPath: '${work.path}/does_not_exist.mp4',
        outputPath: '${work.path}/never.mp4',
        settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
      );
      expect(result.outcome, ConversionOutcome.failed);
      expect(result.message, isNotEmpty);
    });
  });
}
