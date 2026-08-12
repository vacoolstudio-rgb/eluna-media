import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

/// What the bundled FFmpeg can actually do, asked of the binary itself.
///
/// This file exists because of a mistake worth not repeating. The app shipped
/// for a year believing the build had no AV1 encoder — the requirements
/// document said so in writing — while `libaom` sat inside `libavcodec.so` the
/// whole time. The belief was never checked against the binary, and greping the
/// shipped `.so` is only half a check: a linked symbol is not a registered
/// encoder, and `av1_mediacodec` in particular exists as a decoder on devices
/// that cannot encode AV1 at all.
///
/// So: ask FFmpeg, on a real device, and encode something.
///
/// The inventory group prints rather than asserts. It is a survey, and its
/// output is the input to "what else are we not using?" — a codec appearing
/// there is a lead, not a promise.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Directory work;
  late String videoSrc;
  final converter = FFmpegConverter();

  /// `-encoders` / `-muxers` output, once.
  Future<String> capabilities(String flag) async {
    final session = await FFmpegKit.executeWithArguments(['-hide_banner', flag]);
    return await session.getOutput() ?? '';
  }

  Future<void> synthesise(List<String> args) async {
    final session = await FFmpegKit.executeWithArgumentsAsync(args);
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
    work = Directory('${docs.path}/it_encoders');
    if (work.existsSync()) work.deleteSync(recursive: true);
    work.createSync(recursive: true);

    // Deliberately tiny. libaom is slow enough that a 320x240 two-second clip
    // is a meaningful wait even at its fastest speed setting.
    videoSrc = '${work.path}/src.mp4';
    await synthesise([
      '-y', '-f', 'lavfi',
      '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi',
      '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac',
      videoSrc,
    ]);
    expect(File(videoSrc).lengthSync(), greaterThan(0));
  });

  tearDownAll(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  group('inventory', () {
    test('report which encoders this build registers', () async {
      final out = await capabilities('-encoders');
      // Everything the full-gpl bundle plausibly carries that the app does not
      // currently offer. Present here means "worth considering", not "shipped".
      const watchlist = [
        'libaom-av1', 'av1_mediacodec', 'libsvtav1',
        'h264_mediacodec', 'hevc_mediacodec', 'vp9_mediacodec',
        'h264_videotoolbox', 'hevc_videotoolbox',
        'libwebp_anim', 'apng', 'gif',
        'alac', 'ac3', 'eac3', 'libopus', 'libvorbis', 'flac',
        'prores_ks', 'ffv1', 'libtheora', 'libvpx',
      ];
      final present = watchlist.where(out.contains).toList();
      final absent = watchlist.where((e) => !out.contains(e)).toList();
      // ignore: avoid_print
      print('ENCODERS present: ${present.join(', ')}');
      // ignore: avoid_print
      print('ENCODERS absent : ${absent.join(', ')}');
      expect(out, isNotEmpty, reason: 'ffmpeg -encoders produced nothing');
    });

    test('report which muxers this build registers', () async {
      final out = await capabilities('-muxers');
      const watchlist = ['avif', 'webp', 'apng', 'gif', 'matroska', 'webm', 'ipod', 'mp4'];
      final present = watchlist.where(out.contains).toList();
      // ignore: avoid_print
      print('MUXERS present: ${present.join(', ')}');
      expect(out, isNotEmpty, reason: 'ffmpeg -muxers produced nothing');
    });
  });

  group('AV1', () {
    test('the software encoder is registered, not merely linked', () async {
      final out = await capabilities('-encoders');
      // If this ever fails, AV1 must come back out of ContainerRules rather
      // than be left permanently hidden by the runtime gate — a codec the UI
      // filters away every time is dead weight pretending to be a feature.
      expect(out.contains('libaom-av1'), isTrue,
          reason: 'libaom-av1 is not in `ffmpeg -encoders`; AV1 output cannot work');
    });

    test('encodes AV1 into MP4 and the result decodes', () async {
      final out = '${work.path}/out_av1.mp4';
      final durationMs = await converter.probeDurationMs(videoSrc);
      final result = await converter.convert(
        inputPath: videoSrc,
        outputPath: out,
        settings: const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.av1,
          audioCodec: AudioCodec.aac,
          rateControl: RateControl.quality,
          crf: 50,
          // cpu-used 8. Anything slower turns this test into a coffee break.
          preset: EncodingPreset.ultrafast,
        ),
        totalDurationMs: durationMs,
      );
      expect(result.isSuccess, isTrue, reason: 'FFmpeg said: ${result.message}');
      expect(File(out).lengthSync(), greaterThan(0));

      // A file that exists proves the muxer ran; a duration proves the
      // bitstream is readable back.
      final ms = await converter.probeDurationMs(out);
      expect(ms, isNotNull);
      expect(ms, closeTo(1000, 400));
    }, timeout: const Timeout(Duration(minutes: 10)));

    test('encodes an AVIF still, and it comes out smaller than the JPEG', () async {
      final png = '${work.path}/still.png';
      await synthesise([
        '-y', '-f', 'lavfi',
        '-i', 'testsrc=size=320x240:duration=1:rate=1',
        '-frames:v', '1', '-update', '1',
        png,
      ]);

      Future<int> encode(ContainerFormat container, String name) async {
        final out = '${work.path}/$name';
        final result = await converter.convert(
          inputPath: png,
          outputPath: out,
          settings: ConversionSettings(
            container: container,
            imageQuality: 80,
            preset: EncodingPreset.ultrafast,
          ),
        );
        expect(result.isSuccess, isTrue,
            reason: '$name failed, FFmpeg said: ${result.message}');
        return File(out).lengthSync();
      }

      // The whole reason to offer AVIF. `-still-picture` is the one option in
      // this path that is not exercised anywhere else, and a wrong private
      // option is a hard FFmpeg error, so a green run here is what licenses
      // the feature.
      final avif = await encode(ContainerFormat.avif, 'still.avif');
      final jpeg = await encode(ContainerFormat.jpg, 'still.jpg');
      expect(avif, greaterThan(0));
      expect(avif, lessThan(jpeg),
          reason: 'AVIF ($avif B) should undercut JPEG ($jpeg B) at the same quality');
    }, timeout: const Timeout(Duration(minutes: 5)));

    test('encodes AV1 into WebM on the bitrate path', () async {
      final out = '${work.path}/out_av1.webm';
      final result = await converter.convert(
        inputPath: videoSrc,
        outputPath: out,
        settings: const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.av1,
          audioCodec: AudioCodec.opus,
          rateControl: RateControl.bitrate,
          videoBitrateKbps: 200,
          preset: EncodingPreset.ultrafast,
        ),
        totalDurationMs: await converter.probeDurationMs(videoSrc),
      );
      expect(result.isSuccess, isTrue, reason: 'FFmpeg said: ${result.message}');
      expect(File(out).lengthSync(), greaterThan(0));
    }, timeout: const Timeout(Duration(minutes: 10)));
  });

  group('ALAC', () {
    test('the encoder is registered', () async {
      final out = await capabilities('-encoders');
      expect(out.contains('alac'), isTrue,
          reason: 'alac is not in `ffmpeg -encoders`; the M4A lossless option cannot work');
    });

    test('extracts a lossless M4A, larger than the AAC one and still readable',
        () async {
      Future<int> encode(AudioCodec codec, String name) async {
        final out = '${work.path}/$name';
        final result = await converter.convert(
          inputPath: videoSrc,
          outputPath: out,
          settings: ConversionSettings(
            container: ContainerFormat.m4a,
            audioCodec: codec,
          ),
          totalDurationMs: await converter.probeDurationMs(videoSrc),
        );
        expect(result.isSuccess, isTrue,
            reason: '$name failed, FFmpeg said: ${result.message}');
        // Readable back, not merely written: an `ipod` muxer that accepted the
        // stream but wrote an unplayable one would still exit zero.
        expect(await converter.probeDurationMs(out), isNotNull);
        return File(out).lengthSync();
      }

      final alac = await encode(AudioCodec.alac, 'lossless.m4a');
      final aac = await encode(AudioCodec.aac, 'lossy.m4a');
      expect(alac, greaterThan(0));
      // The only claim ALAC makes. If it ever came out at AAC's size, FFmpeg
      // would have quietly encoded something other than what was asked for.
      expect(alac, greaterThan(aac),
          reason: 'ALAC ($alac B) cannot be smaller than AAC ($aac B) — that is not lossless');
    }, timeout: const Timeout(Duration(minutes: 5)));
  });

  group('animated WebP', () {
    test('the encoder is registered under its own name', () async {
      final out = await capabilities('-encoders');
      // `libwebp` alone is the still encoder; the animated one is a separate
      // entry, and having the first says nothing about the second.
      expect(out.contains('libwebp_anim'), isTrue,
          reason: 'libwebp_anim is not in `ffmpeg -encoders`; animated WebP cannot work');
    });

    test('a video becomes an animated WebP smaller than the same GIF', () async {
      Future<int> encode(ContainerFormat container, String name) async {
        final out = '${work.path}/$name';
        final result = await converter.convert(
          inputPath: videoSrc,
          outputPath: out,
          settings: ConversionSettings(
            container: container,
            fps: FpsPreset.fps15,
            imageQuality: 75,
          ),
          totalDurationMs: await converter.probeDurationMs(videoSrc),
        );
        expect(result.isSuccess, isTrue,
            reason: '$name failed, FFmpeg said: ${result.message}');
        return File(out).lengthSync();
      }

      final webp = await encode(ContainerFormat.webpAnimated, 'anim.webp');
      final gif = await encode(ContainerFormat.gif, 'anim.gif');

      // A single-frame file would be tiny; this must be a real animation.
      expect(webp, greaterThan(1000));
      // The entire pitch is "a GIF, only smaller". If that stops being true on
      // real footage, the feature needs rethinking rather than shipping.
      expect(webp, lessThan(gif),
          reason: 'animated WebP ($webp B) should undercut GIF ($gif B)');
    }, timeout: const Timeout(Duration(minutes: 5)));
  });
}
