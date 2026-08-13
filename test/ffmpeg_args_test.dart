import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:flutter_test/flutter_test.dart';

/// Finds the value that follows [flag] in an argument vector.
String? valueOf(List<String> args, String flag) {
  final i = args.indexOf(flag);
  if (i == -1 || i + 1 >= args.length) return null;
  return args[i + 1];
}

List<String> build(ConversionSettings s, {String input = '/in.mp4', String output = '/out'}) =>
    FFmpegArgs.build(inputPath: input, outputPath: output, settings: s);

void main() {
  group('formatTimestamp', () {
    test('renders hours, minutes, seconds and milliseconds', () {
      expect(FFmpegArgs.formatTimestamp(0), '00:00:00.000');
      expect(FFmpegArgs.formatTimestamp(1500), '00:00:01.500');
      expect(FFmpegArgs.formatTimestamp(3661001), '01:01:01.001');
    });
  });

  group('jpegQscale', () {
    test('inverts the 1..100 slider onto FFmpeg 2..31', () {
      expect(FFmpegArgs.jpegQscale(100), 2);
      expect(FFmpegArgs.jpegQscale(1), 31);
    });

    test('is monotonically decreasing in quality', () {
      var previous = 32;
      for (var q = 1; q <= 100; q++) {
        final current = FFmpegArgs.jpegQscale(q);
        expect(current, lessThanOrEqualTo(previous));
        previous = current;
      }
    });

    test('clamps out-of-range input', () {
      expect(FFmpegArgs.jpegQscale(0), 31);
      expect(FFmpegArgs.jpegQscale(500), 2);
    });
  });

  group('argument vector shape', () {
    test('input and output are separate tokens, so no shell escaping is needed', () {
      final args = build(
        ConversionSettings.defaultsFor(ContainerFormat.mp4),
        input: r'/sdcard/My Videos/отпуск "2024".mov',
        output: '/data/out file.mp4',
      );
      expect(valueOf(args, '-i'), r'/sdcard/My Videos/отпуск "2024".mov');
      expect(args.last, '/data/out file.mp4');
    });

    test('overwrites without prompting', () {
      expect(build(ConversionSettings.defaultsFor(ContainerFormat.mp4)), contains('-y'));
    });
  });

  group('video', () {
    test('h264 CRF mode emits -crf and a preset but no -b:v', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h264,
        audioCodec: AudioCodec.aac,
        rateControl: RateControl.quality,
        crf: 20,
        preset: EncodingPreset.slow,
      ));
      expect(valueOf(args, '-c:v'), 'libx264');
      expect(valueOf(args, '-crf'), '20');
      expect(valueOf(args, '-preset'), 'slow');
      expect(args, isNot(contains('-b:v')));
    });

    test('bitrate mode emits -b:v and no -crf', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h264,
        rateControl: RateControl.bitrate,
        videoBitrateKbps: 3000,
      ));
      expect(valueOf(args, '-b:v'), '3000k');
      expect(args, isNot(contains('-crf')));
    });

    test('VP9 pins -b:v to 0 so that -crf is honoured', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.webm,
        videoCodec: VideoCodec.vp9,
        audioCodec: AudioCodec.opus,
        rateControl: RateControl.quality,
        crf: 32,
      ));
      expect(valueOf(args, '-crf'), '32');
      expect(valueOf(args, '-b:v'), '0');
      expect(args, isNot(contains('-preset')));
    });

    test('AV1 pins -b:v to 0 and steers libaom with -cpu-used, not -preset', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.av1,
        audioCodec: AudioCodec.aac,
        rateControl: RateControl.quality,
        crf: 35,
        preset: EncodingPreset.veryfast,
      ));
      expect(valueOf(args, '-crf'), '35');
      expect(valueOf(args, '-b:v'), '0');
      // libaom rejects -preset outright; its knob is -cpu-used, and without
      // row threading it encodes on one core.
      expect(args, isNot(contains('-preset')));
      expect(valueOf(args, '-cpu-used'), '7');
      expect(valueOf(args, '-row-mt'), '1');
    });

    test('AV1 on the bitrate path takes -b:v and still gets -cpu-used', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.webm,
        videoCodec: VideoCodec.av1,
        audioCodec: AudioCodec.opus,
        rateControl: RateControl.bitrate,
        videoBitrateKbps: 1200,
        preset: EncodingPreset.medium,
      ));
      expect(valueOf(args, '-b:v'), '1200k');
      expect(args, isNot(contains('-crf')));
      expect(valueOf(args, '-cpu-used'), '6');
    });

    test('a hardware AV1 encoder replaces libaom and drops its knobs', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out',
        settings: const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.av1,
          audioCodec: AudioCodec.aac,
          rateControl: RateControl.bitrate,
          videoBitrateKbps: 2000,
        ),
        hwVideoEncoder: 'av1_mediacodec',
      );
      expect(valueOf(args, '-c:v'), 'av1_mediacodec');
      // -cpu-used and -row-mt are libaom options; MediaCodec errors on them.
      expect(args, isNot(contains('-cpu-used')));
      expect(args, isNot(contains('-row-mt')));
    });

    test('constant-quality AV1 stays on software even when hardware is offered', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out',
        settings: const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.av1,
          audioCodec: AudioCodec.aac,
          rateControl: RateControl.quality,
          crf: 30,
        ),
        hwVideoEncoder: 'av1_mediacodec',
      );
      expect(valueOf(args, '-c:v'), 'libaom-av1');
      expect(valueOf(args, '-crf'), '30');
    });

    test('a hardware VP9 encoder replaces libvpx on the bitrate path', () {
      // `EncoderCatalog` probes for vp9_mediacodec and the queue passes whatever
      // it finds, so a VP9 job on a phone that has the block must land on it.
      // Left out of the builder's hardware list, the encoder is discovered,
      // handed over, and silently ignored — libvpx encodes the file instead, at
      // the battery cost the probe exists to avoid.
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out',
        settings: const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.vp9,
          audioCodec: AudioCodec.opus,
          rateControl: RateControl.bitrate,
          videoBitrateKbps: 1500,
        ),
        hwVideoEncoder: 'vp9_mediacodec',
      );
      expect(valueOf(args, '-c:v'), 'vp9_mediacodec');
      expect(args, isNot(contains('-crf')));
    });

    test('constant-quality VP9 stays on software even when hardware is offered', () {
      final args = FFmpegArgs.build(
        inputPath: '/in.mp4',
        outputPath: '/out',
        settings: const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.vp9,
          audioCodec: AudioCodec.opus,
          rateControl: RateControl.quality,
          crf: 32,
        ),
        hwVideoEncoder: 'vp9_mediacodec',
      );
      expect(valueOf(args, '-c:v'), 'libvpx-vp9');
      expect(valueOf(args, '-crf'), '32');
    });

    test('CRF is clamped to the codec range', () {
      final vp9 = build(const ConversionSettings(
        container: ContainerFormat.webm,
        videoCodec: VideoCodec.vp9,
        audioCodec: AudioCodec.opus,
        crf: 63,
      ));
      expect(valueOf(vp9, '-crf'), '63');

      final h264 = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h264,
        crf: 63,
      ));
      expect(valueOf(h264, '-crf'), '51');
    });

    test('mpeg4 cannot use CRF, so quality mode still falls back to bitrate', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.avi,
        videoCodec: VideoCodec.mpeg4,
        audioCodec: AudioCodec.mp3,
        rateControl: RateControl.quality,
        videoBitrateKbps: 1800,
      ));
      expect(args, isNot(contains('-crf')));
      expect(valueOf(args, '-b:v'), '1800k');
    });

    test('copy remuxes and emits no filters or encoder flags', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mkv,
        videoCodec: VideoCodec.copy,
        audioCodec: AudioCodec.copy,
        resolution: ResolutionPreset.p720,
        fps: FpsPreset.fps30,
      ));
      expect(valueOf(args, '-c:v'), 'copy');
      expect(valueOf(args, '-c:a'), 'copy');
      expect(args, isNot(contains('-vf')));
      expect(args, isNot(contains('-crf')));
    });

    test('scale uses -2 to keep width even for yuv420p', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h264,
        resolution: ResolutionPreset.p1080,
        fps: FpsPreset.fps30,
      ));
      expect(valueOf(args, '-vf'), 'scale=-2:1080,fps=30');
    });

    test('HEVC in MP4 is tagged hvc1 for Apple players, but not in MKV', () {
      final mp4 = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h265,
      ));
      expect(valueOf(mp4, '-tag:v'), 'hvc1');

      final mkv = build(const ConversionSettings(
        container: ContainerFormat.mkv,
        videoCodec: VideoCodec.h265,
      ));
      expect(mkv, isNot(contains('-tag:v')));
    });

    test('mp4 and mov get +faststart; mkv does not', () {
      expect(
        valueOf(build(ConversionSettings.defaultsFor(ContainerFormat.mp4)), '-movflags'),
        '+faststart',
      );
      expect(
        build(ConversionSettings.defaultsFor(ContainerFormat.mkv)),
        isNot(contains('-movflags')),
      );
    });

    test('audioCodec none emits -an', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h264,
        audioCodec: AudioCodec.none,
      ));
      expect(args, contains('-an'));
      expect(args, isNot(contains('-c:a')));
    });
  });

  group('trimming', () {
    test('-ss precedes -i for fast seek and -t follows it', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        trim: TrimRange(startMs: 5000, endMs: 12000),
      ));
      final ss = args.indexOf('-ss');
      final i = args.indexOf('-i');
      final t = args.indexOf('-t');

      expect(ss, lessThan(i));
      expect(t, greaterThan(i));
      expect(valueOf(args, '-ss'), '00:00:05.000');
      // -t is a duration, not an end timestamp.
      expect(valueOf(args, '-t'), '00:00:07.000');
    });

    test('an invalid range is ignored rather than passed to FFmpeg', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        trim: TrimRange(startMs: 9000, endMs: 1000),
      ));
      expect(args, isNot(contains('-ss')));
      expect(args, isNot(contains('-t')));
    });
  });

  group('audio-only containers', () {
    test('mp3 drops video, including embedded cover art', () {
      final args = build(ConversionSettings.defaultsFor(ContainerFormat.mp3));
      expect(args, contains('-vn'));
      expect(valueOf(args, '-c:a'), 'libmp3lame');
      expect(valueOf(args, '-b:a'), '128k');
    });

    test('lossless audio codecs omit -b:a', () {
      final wav = build(ConversionSettings.defaultsFor(ContainerFormat.wav));
      expect(valueOf(wav, '-c:a'), 'pcm_s16le');
      expect(wav, isNot(contains('-b:a')));

      final flac = build(ConversionSettings.defaultsFor(ContainerFormat.flac));
      expect(valueOf(flac, '-c:a'), 'flac');
      expect(flac, isNot(contains('-b:a')));
    });
  });

  group('images', () {
    test('jpeg writes a single frame at the mapped qscale', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.jpg,
        imageQuality: 100,
      ));
      expect(valueOf(args, '-frames:v'), '1');
      expect(valueOf(args, '-update'), '1');
      expect(valueOf(args, '-q:v'), '2');
    });

    test('lossy webp passes quality through unchanged', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.webp,
        imageQuality: 75,
        lossless: false,
      ));
      expect(valueOf(args, '-c:v'), 'libwebp');
      expect(valueOf(args, '-quality'), '75');
      expect(args, isNot(contains('-lossless')));
    });

    test('lossless webp sets -lossless 1 and drops the quality flag', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.webp,
        lossless: true,
      ));
      expect(valueOf(args, '-lossless'), '1');
      expect(args, isNot(contains('-quality')));
    });

    test('image scaling uses -1 width, since stills tolerate odd dimensions', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.jpg,
        resolution: ResolutionPreset.p720,
      ));
      // Lanczos rather than the bicubic default: a downscaled photo is looked
      // at, not played back, and the sharper kernel is worth the few extra ms.
      expect(valueOf(args, '-vf'), 'scale=-1:720:flags=lanczos');
    });

    test('gif builds a palettegen/paletteuse graph rather than a naive encode', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.gif,
        fps: FpsPreset.fps15,
        resolution: ResolutionPreset.p480,
      ));
      final graph = valueOf(args, '-filter_complex');
      expect(graph, isNotNull);
      expect(graph, contains('fps=15'));
      expect(graph, contains('scale=-1:480:flags=lanczos'));
      expect(graph, contains('palettegen'));
      expect(graph, contains('paletteuse'));
      expect(valueOf(args, '-loop'), '0');
      expect(args, contains('-an'));
      // A GIF is a sequence: it must not be truncated to one frame.
      expect(args, isNot(contains('-frames:v')));
    });

    test('avif encodes one AV1 still and never sends -update', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.avif,
        imageQuality: 80,
        preset: EncodingPreset.medium,
      ));
      expect(valueOf(args, '-c:v'), 'libaom-av1');
      expect(valueOf(args, '-frames:v'), '1');
      expect(valueOf(args, '-still-picture'), '1');
      expect(valueOf(args, '-b:v'), '0');
      expect(valueOf(args, '-cpu-used'), '6');
      expect(valueOf(args, '-crf'), FFmpegArgs.avifCrf(80).toString());
      // -update belongs to the image2 muxer; the AVIF muxer has no such
      // option and FFmpeg treats an unknown private option as fatal.
      expect(args, isNot(contains('-update')));
    });

    test('avif quality maps onto an inverted CRF scale that stops short of lossless', () {
      expect(FFmpegArgs.avifCrf(100), 1);
      expect(FFmpegArgs.avifCrf(1), 63);
      expect(FFmpegArgs.avifCrf(100), lessThan(FFmpegArgs.avifCrf(50)));
      expect(FFmpegArgs.avifCrf(50), lessThan(FFmpegArgs.avifCrf(10)));
      // Clamped rather than extrapolated.
      expect(FFmpegArgs.avifCrf(0), 63);
      expect(FFmpegArgs.avifCrf(999), 1);
    });

    test('avif keeps the shared still-image enhancement chain', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.avif,
        imageQuality: 80,
        sharpen: EnhanceLevel.medium,
        autoColor: true,
      ));
      final vf = valueOf(args, '-vf');
      expect(vf, isNotNull);
      expect(vf, contains('normalize='));
      expect(vf, contains('unsharp='));
    });

    test('animated webp uses libwebp_anim and loops, without a palette graph', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.webpAnimated,
        fps: FpsPreset.fps15,
        resolution: ResolutionPreset.p480,
        imageQuality: 75,
      ));
      expect(valueOf(args, '-c:v'), 'libwebp_anim');
      expect(valueOf(args, '-loop'), '0');
      expect(valueOf(args, '-quality'), '75');
      expect(args, contains('-an'));
      // It is a sequence, like GIF.
      expect(args, isNot(contains('-frames:v')));
      // WebP carries a real bitstream, so none of GIF's palette machinery.
      expect(args, isNot(contains('-filter_complex')));

      final vf = valueOf(args, '-vf');
      expect(vf, contains('fps=15'));
      // -2, not -1: libwebp encodes yuv420p and rejects an odd width.
      expect(vf, contains('scale=-2:480:flags=lanczos'));
    });

    test('lossless animated webp swaps quality for the lossless flag', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.webpAnimated,
        lossless: true,
        imageQuality: 75,
      ));
      expect(valueOf(args, '-lossless'), '1');
      expect(args, isNot(contains('-quality')));
    });
  });

  group('metadata', () {
    test('stripping is on by default and maps metadata away', () {
      final args = build(ConversionSettings.defaultsFor(ContainerFormat.mp4));
      expect(valueOf(args, '-map_metadata'), '-1');
    });

    test('disabling it leaves the source metadata alone', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp4,
        stripMetadata: false,
      ));
      expect(args, isNot(contains('-map_metadata')));
    });
  });
}
