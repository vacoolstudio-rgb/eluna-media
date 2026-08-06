import 'package:eluna_media/core/ffmpeg_args.dart';
import 'package:eluna_media/domain/achievements.dart';
import 'package:eluna_media/domain/conversion_job.dart';
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
  group('achievements', () {
    // Пороги считает общий каталог, поэтому и тест спрашивает его, а не
    // выпиленный `earnedBy`: проверяем, что формы Media сложены правильно.
    Set<Achievement> unlockedBy(ConversionStats stats) => {
          for (final e in mediaAchievements.evaluate(stats, unlockedAt: const {}))
            if (e.unlocked) Achievement.values.byName(e.def.id),
        };

    test('thresholds unlock at their exact counts', () {
      expect(unlockedBy(const ConversionStats()), isNot(contains(Achievement.firstConversion)));
      expect(
        unlockedBy(const ConversionStats(conversions: 1)),
        contains(Achievement.firstConversion),
      );
      expect(
        unlockedBy(const ConversionStats(conversions: 9)),
        isNot(contains(Achievement.tenConversions)),
      );
      expect(
        unlockedBy(const ConversionStats(bytesSaved: 1000 * 1000 * 1000)),
        contains(Achievement.saved1Gb),
      );
    });

    test('progress is reported on the way to the target', () {
      final ten = mediaAchievements
          .evaluate(const ConversionStats(conversions: 4), unlockedAt: const {})
          .firstWhere((e) => e.def.id == Achievement.tenConversions.name);
      expect(ten.unlocked, isFalse);
      expect(ten.current, 4);
      expect(ten.progress, closeTo(0.4, 0.001));
    });

    test('platinum requires the whole catalogue', () {
      const everything = ConversionStats(
        conversions: 1000,
        bytesSaved: 10 * 1000 * 1000 * 1000,
        maxBatch: 20,
        usedFitToSize: true,
        madeGif: true,
        extractedAudio: true,
        keptSubtitles: true,
        usedTransform: true,
        convertedVideo: true,
        convertedAudio: true,
        convertedImage: true,
        nightConversion: true,
      );
      expect(unlockedBy(everything), containsAll(Achievement.values));

      final short = unlockedBy(const ConversionStats(conversions: 1000));
      expect(short, isNot(contains(Achievement.platinum)));
    });

    test('ids stay the SharedPreferences keys they always were', () {
      // Разблокировки лежат в `ach.unlocked` по имени значения enum'а ещё с
      // 1.0 — если id разъедутся с именами, у людей обнулится весь шкаф.
      expect(
        mediaAchievements.all.map((d) => d.id),
        Achievement.values.map((a) => a.name),
      );
    });
  });

  group('concat args', () {
    final settings = QuickPreset.mergeVideos.settings();

    test('normalises every input onto one canvas and concats', () {
      final args = FFmpegArgs.buildConcat(
        inputPaths: ['/a.mp4', '/b.mov', '/c.mkv'],
        outputPath: '/out.mp4',
        settings: settings,
      );
      expect(args.where((a) => a == '-i').length, 3);
      final graph = valueOf(args, '-filter_complex')!;
      expect(graph, contains('concat=n=3:v=1:a=1[v][a]'));
      expect(graph, contains('scale=1280:720:force_original_aspect_ratio=decrease'));
      expect(graph, contains('pad=1280:720:(ow-iw)/2:(oh-ih)/2'));
      expect(graph, contains('aformat=sample_rates=48000:channel_layouts=stereo'));
      expect(args, containsAllInOrder(['-map', '[v]', '-map', '[a]']));
      expect(valueOf(args, '-c:v'), 'libx264');
      expect(args.last, '/out.mp4');
    });

    test('a known-silent clip gets synthesised silence of its length', () {
      final args = FFmpegArgs.buildConcat(
        inputPaths: ['/a.mp4', '/silent.mp4'],
        outputPath: '/out.mp4',
        settings: settings,
        inputsHaveAudio: [true, false],
        inputDurationsMs: [10000, 5500],
      );
      final graph = valueOf(args, '-filter_complex')!;
      expect(graph, contains('anullsrc=r=48000:cl=stereo,atrim=duration=5.500[a1]'));
      expect(graph, contains('concat=n=2:v=1:a=1[v][a]'));
    });

    test('a silent clip of unknown length drops audio instead of desyncing', () {
      final args = FFmpegArgs.buildConcat(
        inputPaths: ['/a.mp4', '/silent.mp4'],
        outputPath: '/out.mp4',
        settings: settings,
        inputsHaveAudio: [true, false],
        inputDurationsMs: [10000, null],
      );
      final graph = valueOf(args, '-filter_complex')!;
      expect(graph, contains('concat=n=2:v=1:a=0[v]'));
      expect(args, contains('-an'));
      expect(args, isNot(contains('-c:a')));
    });

    test('unsupported merge codecs fall back to H.264', () {
      final args = FFmpegArgs.buildConcat(
        inputPaths: ['/a.mp4', '/b.mp4'],
        outputPath: '/out.mp4',
        settings: settings.copyWith(videoCodec: VideoCodec.vp9),
      );
      expect(valueOf(args, '-c:v'), 'libx264');
    });

    test('strips metadata and applies faststart like any other mp4', () {
      final args = FFmpegArgs.buildConcat(
        inputPaths: ['/a.mp4', '/b.mp4'],
        outputPath: '/out.mp4',
        settings: settings,
      );
      expect(args, contains('-map_metadata'));
      expect(args, contains('-movflags'));
    });
  });

  group('merge job model', () {
    test('extra inputs survive a JSON round trip', () {
      const job = ConversionJob(
        id: 'j1',
        inputPath: '/a.mp4',
        inputName: 'merged.mp4',
        settings: ConversionSettings(container: ContainerFormat.mp4),
        extraInputPaths: ['/b.mp4', '/c.mp4'],
      );
      final restored = ConversionJob.fromJson(job.toJson())!;
      expect(restored.isMerge, isTrue);
      expect(restored.extraInputPaths, ['/b.mp4', '/c.mp4']);

      final plain = ConversionJob.fromJson({
        'id': 'j2',
        'inputPath': '/a.mp4',
        'inputName': 'a.mp4',
        'settings': const ConversionSettings(container: ContainerFormat.mp4).toJson(),
      })!;
      expect(plain.isMerge, isFalse);
    });
  });

  group('two-pass args', () {
    const settings = ConversionSettings(
      container: ContainerFormat.mp4,
      videoCodec: VideoCodec.h264,
      audioCodec: AudioCodec.aac,
      rateControl: RateControl.size,
      sizeTargetBytes: 10 * 1000 * 1000,
      audioBitrateKbps: 96,
    );

    List<String> pass(int n) => FFmpegArgs.build(
          inputPath: '/in.mp4',
          outputPath: n == 1 ? '/dev/null' : '/out.mp4',
          settings: settings,
          sourceDurationMs: 60 * 1000,
          passNumber: n,
          passLogFile: '/out.mp4.passlog',
        );

    test('pass 1 analyses video only into the null muxer', () {
      final args = pass(1);
      expect(valueOf(args, '-pass'), '1');
      expect(valueOf(args, '-passlogfile'), '/out.mp4.passlog');
      expect(args, contains('-an'));
      expect(args, isNot(contains('-c:a')));
      expect(args, isNot(contains('-movflags')));
      expect(valueOf(args, '-f'), 'null');
    });

    test('both passes aim at the same bitrate, audio budget included', () {
      expect(valueOf(pass(1), '-b:v'), valueOf(pass(2), '-b:v'));
      expect(valueOf(pass(1), '-b:v'), '1144k');
    });

    test('pass 2 writes the real file with audio', () {
      final args = pass(2);
      expect(valueOf(args, '-pass'), '2');
      expect(valueOf(args, '-c:a'), 'aac');
      expect(args.last, '/out.mp4');
    });
  });
}
