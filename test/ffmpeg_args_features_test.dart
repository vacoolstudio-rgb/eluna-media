import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:flutter_test/flutter_test.dart';

String? valueOf(List<String> args, String flag) {
  final i = args.indexOf(flag);
  if (i == -1 || i + 1 >= args.length) return null;
  return args[i + 1];
}

List<String> build(ConversionSettings s, {int? durationMs}) => FFmpegArgs.build(
      inputPath: '/in.mp4',
      outputPath: '/out',
      settings: s,
      sourceDurationMs: durationMs,
    );

void main() {
  group('target size mode', () {
    const base = ConversionSettings(
      container: ContainerFormat.mp4,
      videoCodec: VideoCodec.h264,
      audioCodec: AudioCodec.aac,
      rateControl: RateControl.size,
      sizeTargetBytes: 10 * 1000 * 1000,
      audioBitrateKbps: 96,
    );

    test('computes -b:v from the budget and pins maxrate/bufsize', () {
      final args = build(base, durationMs: 60 * 1000);
      expect(valueOf(args, '-b:v'), '1144k');
      expect(valueOf(args, '-maxrate'), '1258k');
      expect(valueOf(args, '-bufsize'), '2288k');
      expect(args, isNot(contains('-crf')));
    });

    test('falls back to CRF when the duration is unknown', () {
      final args = build(base, durationMs: null);
      expect(valueOf(args, '-crf'), isNotNull);
      expect(args, isNot(contains('-maxrate')));
    });

    test('falls back to CRF when the target is unreachable', () {
      final args = build(
        base.copyWith(sizeTargetBytes: 500 * 1000),
        durationMs: 10 * 60 * 1000,
      );
      expect(valueOf(args, '-crf'), isNotNull);
    });

    test('a copied audio track makes the budget unknowable → CRF fallback', () {
      // Budgeting 128 kbps for a track that might be 1.5 Mbps PCM would
      // overshoot the hard limit this mode exists to respect.
      final args = build(
        base.copyWith(audioCodec: AudioCodec.copy),
        durationMs: 60 * 1000,
      );
      expect(valueOf(args, '-crf'), isNotNull);
      expect(args, isNot(contains('-maxrate')));
    });

    test('PCM audio is budgeted at its real rate, not the slider value', () {
      // 10 MB, 60 s, PCM at 1536 kbps: total 1240 − 1536 < 0 → unreachable.
      final args = build(
        base.copyWith(
          container: ContainerFormat.mov,
          audioCodec: AudioCodec.pcm16,
        ),
        durationMs: 60 * 1000,
      );
      expect(valueOf(args, '-crf'), isNotNull);
    });

    test('a trim shortens the encoded stretch and raises the bitrate', () {
      final trimmed = build(
        base.copyWith(trim: const TrimRange(startMs: 0, endMs: 30 * 1000)),
        durationMs: 60 * 1000,
      );
      // Half the duration, double the budget per second.
      expect(valueOf(trimmed, '-b:v'), '2384k');
    });
  });

  group('transforms', () {
    const base = ConversionSettings(
      container: ContainerFormat.mp4,
      videoCodec: VideoCodec.h264,
      audioCodec: AudioCodec.aac,
    );

    test('rotate 90° becomes transpose=1, before scaling', () {
      final args = build(base.copyWith(
        rotate: RotatePreset.cw90,
        resolution: ResolutionPreset.p720,
      ));
      expect(valueOf(args, '-vf'), 'transpose=1,scale=-2:720');
    });

    test('180° uses hflip+vflip and mirror appends hflip', () {
      expect(
        valueOf(build(base.copyWith(rotate: RotatePreset.r180)), '-vf'),
        'hflip,vflip',
      );
      expect(
        valueOf(build(base.copyWith(flipH: true)), '-vf'),
        'hflip',
      );
    });

    test('speed retimes video and audio together', () {
      final args = build(base.copyWith(speed: SpeedPreset.x200));
      expect(valueOf(args, '-vf'), contains('setpts=PTS/2.0'));
      expect(valueOf(args, '-af'), 'atempo=2.0');
    });

    test('no transforms — no filters', () {
      final args = build(base);
      expect(args, isNot(contains('-vf')));
      expect(args, isNot(contains('-af')));
    });

    test('extreme speeds chain atempo stages inside the legal range', () {
      expect(FFmpegArgs.atempoChain(0.25), [0.5, 0.5]);
      expect(FFmpegArgs.atempoChain(4.0), [2.0, 2.0]);
      expect(FFmpegArgs.atempoChain(1.5), [1.5]);
      final args = build(base.copyWith(speed: SpeedPreset.x025));
      expect(valueOf(args, '-af'), 'atempo=0.5,atempo=0.5');
    });

    test('crop is centred, ratio-based, comma-escaped, and even-sized', () {
      // Even dimensions are load-bearing: a 9:16 crop of 1080p is 607.5px
      // wide, crop truncates to an odd 607, and yuv420p encoders reject odd
      // sizes when no scale filter follows.
      final args = build(base.copyWith(crop: CropPreset.square));
      expect(
        valueOf(args, '-vf'),
        'crop=w=2*floor(min(iw\\,ih*1/1)/2):h=2*floor(min(ih\\,iw*1/1)/2)',
      );
    });

    test('crop comes after orientation and before scaling', () {
      final args = build(base.copyWith(
        rotate: RotatePreset.cw90,
        crop: CropPreset.vertical,
        resolution: ResolutionPreset.p720,
      ));
      expect(
        valueOf(args, '-vf'),
        'transpose=1,'
        'crop=w=2*floor(min(iw\\,ih*9/16)/2):h=2*floor(min(ih\\,iw*16/9)/2),'
        'scale=-2:720',
      );
    });

    test('volume becomes an audio filter and composes with atempo', () {
      expect(
        valueOf(build(base.copyWith(volumePercent: 150)), '-af'),
        'volume=1.50',
      );
      expect(
        valueOf(build(base.copyWith(volumePercent: 50, speed: SpeedPreset.x200)), '-af'),
        'atempo=2.0,volume=0.50',
      );
      expect(build(base), isNot(contains('-af')));
    });

    test('a leftover speed value is inert when audio is stream-copied', () {
      // The UI disables the speed control once audio is Copy, but the stale
      // value stays in settings; retiming video without audio would desync.
      final args = build(base.copyWith(
        speed: SpeedPreset.x200,
        audioCodec: AudioCodec.copy,
      ));
      final vf = valueOf(args, '-vf');
      expect(vf, isNull);
      expect(args, isNot(contains('-af')));
    });

    test('audio-only outputs never get atempo from a leftover speed value', () {
      final args = build(const ConversionSettings(
        container: ContainerFormat.mp3,
        audioCodec: AudioCodec.mp3,
        speed: SpeedPreset.x200,
      ));
      expect(args, isNot(contains('-af')));
    });
  });

  group('hardware encoder', () {
    const bitrate = ConversionSettings(
      container: ContainerFormat.mp4,
      videoCodec: VideoCodec.h264,
      audioCodec: AudioCodec.aac,
      rateControl: RateControl.bitrate,
      videoBitrateKbps: 2500,
    );

    List<String> buildHw(ConversionSettings s, {int? durationMs}) => FFmpegArgs.build(
          inputPath: '/in.mp4',
          outputPath: '/out',
          settings: s,
          sourceDurationMs: durationMs,
          hwVideoEncoder: 'h264_mediacodec',
        );

    test('bitrate mode uses the hardware encoder, no preset, no pix_fmt', () {
      final args = buildHw(bitrate);
      expect(valueOf(args, '-c:v'), 'h264_mediacodec');
      expect(args, isNot(contains('-preset')));
      expect(args, isNot(contains('-pix_fmt')));
      expect(valueOf(args, '-b:v'), '2500k');
    });

    test('fit-to-size with a known duration also goes hardware', () {
      final args = buildHw(
        bitrate.copyWith(
          rateControl: RateControl.size,
          sizeTargetBytes: 10 * 1000 * 1000,
          audioBitrateKbps: 96,
        ),
        durationMs: 60 * 1000,
      );
      expect(valueOf(args, '-c:v'), 'h264_mediacodec');
      expect(valueOf(args, '-maxrate'), isNotNull);
    });

    test('constant quality (CRF) always stays on the software encoder', () {
      final args = buildHw(bitrate.copyWith(rateControl: RateControl.quality));
      expect(valueOf(args, '-c:v'), 'libx264');
      expect(valueOf(args, '-crf'), isNotNull);
      expect(valueOf(args, '-pix_fmt'), 'yuv420p');
    });

    test('unreachable size target falls back to CRF and therefore software', () {
      final args = buildHw(
        bitrate.copyWith(
          rateControl: RateControl.size,
          sizeTargetBytes: 100 * 1000,
        ),
        durationMs: 10 * 60 * 1000,
      );
      expect(valueOf(args, '-c:v'), 'libx264');
    });
  });

  group('subtitles', () {
    const base = ConversionSettings(
      container: ContainerFormat.mp4,
      videoCodec: VideoCodec.h264,
      audioCodec: AudioCodec.aac,
      keepSubtitles: true,
    );

    test('MP4 maps all streams and converts subs to mov_text', () {
      final args = build(base);
      expect(valueOf(args, '-c:s'), 'mov_text');
      expect(args, containsAllInOrder(['-map', '0:v:0', '-map', '0:a:0?', '-map', '0:s?']));
    });

    test('MKV copies subtitle tracks as-is', () {
      final args = build(base.copyWith(container: ContainerFormat.mkv));
      expect(valueOf(args, '-c:s'), 'copy');
    });

    test('containers that cannot hold subs get no subtitle args', () {
      final args = build(base.withContainer(ContainerFormat.webm));
      expect(args, isNot(contains('-c:s')));
      expect(args, isNot(contains('-map')));
    });

    test('off by default: no maps, no -c:s', () {
      final args = build(base.copyWith(keepSubtitles: false));
      expect(args, isNot(contains('-c:s')));
      expect(args, isNot(contains('-map')));
    });
  });

  group('settings JSON round-trip', () {
    test('new fields survive a round trip', () {
      const s = ConversionSettings(
        container: ContainerFormat.mp4,
        rateControl: RateControl.size,
        sizeTargetBytes: 25 * 1000 * 1000,
        rotate: RotatePreset.ccw90,
        flipH: true,
        speed: SpeedPreset.x050,
        keepSubtitles: true,
      );
      final restored = ConversionSettings.fromJson(s.toJson());
      expect(restored.rateControl, RateControl.size);
      expect(restored.sizeTargetBytes, 25 * 1000 * 1000);
      expect(restored.rotate, RotatePreset.ccw90);
      expect(restored.flipH, isTrue);
      expect(restored.speed, SpeedPreset.x050);
      expect(restored.keepSubtitles, isTrue);
    });

    test('crop and volume survive a round trip and default safely', () {
      const s = ConversionSettings(
        container: ContainerFormat.mp4,
        crop: CropPreset.vertical,
        volumePercent: 150,
      );
      final restored = ConversionSettings.fromJson(s.toJson());
      expect(restored.crop, CropPreset.vertical);
      expect(restored.volumePercent, 150);

      final legacy = ConversionSettings.fromJson({'container': 'mp4'});
      expect(legacy.crop, CropPreset.none);
      expect(legacy.volumePercent, 100);
    });

    test('entries written by older builds decode to safe defaults', () {
      final restored = ConversionSettings.fromJson({'container': 'mp4'});
      expect(restored.rotate, RotatePreset.none);
      expect(restored.flipH, isFalse);
      expect(restored.speed, SpeedPreset.keep);
      expect(restored.keepSubtitles, isFalse);
      expect(restored.sizeTargetBytes, isNull);
    });
  });
}
