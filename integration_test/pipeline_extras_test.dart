import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/core/encoders.dart';
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

/// The parts of the pipeline the format matrix cannot reach.
///
/// `conversion_matrix_test.dart` walks the catalogue: every container, every
/// codec, every knob. Four things sit outside it, and each was, until this
/// file, executed by nothing at all:
///
///  * **Hardware encoders.** `encoder_inventory_test` prints which ones the
///    phone registers, and stops there. Whether our argument set actually
///    *runs* on MediaCodec is a different question — the block rejects flags
///    libx264 accepts, and the failure is a job that dies on the user's phone
///    and nowhere else.
///  * **Two-pass fit-to-size**, which is a separate code path in the converter
///    with its own bitrate maths and its own stats file.
///  * **Subtitle carry-through**, which changes the muxer's stream map.
///  * **The quick presets** — the Simple view, which is what most people
///    actually press. Only `enhancePhoto` had ever been run end to end.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Directory work;
  final converter = FFmpegConverter();
  final catalog = EncoderCatalog();

  late String video;
  late String video2;
  late String photo;
  late String audio;
  late String subtitled;

  Future<void> run(String label, List<String> args) async {
    final session = await FFmpegKit.executeWithArgumentsAsync(args);
    ReturnCode? code;
    for (var i = 0; i < 600; i++) {
      code = await session.getReturnCode();
      if (code != null) break;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    expect(ReturnCode.isSuccess(code), isTrue,
        reason: '$label: ${await session.getLogsAsString()}');
  }

  /// Codecs of the streams in a file, by type. The subtitle tests need to see
  /// a track that no duration or file size would reveal.
  Future<List<String>> streamsOfType(String path, String type) async {
    final session = await FFprobeKit.getMediaInformation(path);
    final streams = session.getMediaInformation()?.getStreams() ?? [];
    return [
      for (final s in streams)
        if (s.getType() == type) s.getCodec() ?? '?',
    ];
  }

  setUpAll(() async {
    final docs = await getApplicationDocumentsDirectory();
    work = Directory('${docs.path}/it_extras');
    if (work.existsSync()) work.deleteSync(recursive: true);
    work.createSync(recursive: true);
    String at(String name) => '${work.path}/$name';

    // 320×240 rather than the matrix's 160×120: MediaCodec encoders refuse
    // frames below their own minimum, and the refusal looks exactly like a
    // broken argument list.
    video = at('src.mp4');
    await run('src', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=2:size=320x240:rate=15',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=2',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac', video,
    ]);

    video2 = at('src2.mp4');
    await run('src2', [
      '-y', '-f', 'lavfi', '-i', 'smptebars=duration=2:size=320x240:rate=15',
      '-f', 'lavfi', '-i', 'sine=frequency=880:duration=2',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac', video2,
    ]);

    photo = at('src.png');
    await run('photo', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=size=640x480:duration=1:rate=1',
      '-frames:v', '1', '-update', '1', photo,
    ]);

    audio = at('src.m4a');
    await run('audio', [
      '-y', '-f', 'lavfi', '-i', 'sine=frequency=440:duration=2',
      '-c:a', 'aac', audio,
    ]);

    final srt = File(at('subs.srt'))
      ..writeAsStringSync('1\n00:00:00,200 --> 00:00:01,500\nтекстовая дорожка\n\n');
    subtitled = at('subbed.mkv');
    await run('subbed', [
      '-y', '-i', video, '-i', srt.path,
      '-c:v', 'copy', '-c:a', 'copy', '-c:s', 'srt', subtitled,
    ]);
  });

  tearDownAll(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  Future<File> convert(
    String input,
    ConversionSettings settings,
    String outName, {
    String? hwVideoEncoder,
    bool twoPass = false,
    List<String> extraInputs = const [],
  }) async {
    // Both lists describe *every* input, the first one included — that is how
    // `QueueController` fills them, and the concat graph indexes them that way.
    // Handing over only the extras shifts the whole list by one, which is
    // invisible while every clip has sound and wrong the moment one does not.
    final hasAudio = <bool?>[];
    final durations = <int?>[];
    if (extraInputs.isNotEmpty) {
      hasAudio.add(await converter.probeHasAudio(input));
      durations.add(await converter.probeDurationMs(input));
      for (final p in extraInputs) {
        hasAudio.add(await converter.probeHasAudio(p));
        durations.add(await converter.probeDurationMs(p));
      }
    }

    final out = '${work.path}/$outName';
    final result = await converter.convert(
      inputPath: input,
      outputPath: out,
      settings: settings,
      totalDurationMs: await converter.probeDurationMs(input),
      sourceRates: await converter.probeRates(input),
      hwVideoEncoder: hwVideoEncoder,
      twoPass: twoPass,
      extraInputPaths: extraInputs,
      extraInputsHaveAudio: hasAudio,
      extraInputDurationsMs: durations,
    );
    expect(result.isSuccess, isTrue, reason: 'FFmpeg сказал: ${result.message}');
    final file = File(out);
    expect(file.existsSync(), isTrue, reason: 'нет файла $out');
    expect(file.lengthSync(), greaterThan(0), reason: 'пустой файл $out');
    return file;
  }

  const long = Timeout(Duration(minutes: 6));

  group('аппаратные энкодеры', () {
    // Each pair is the container the codec is actually offered in, plus the
    // stream codec name FFprobe reports for it.
    const cases = <VideoCodec, (ContainerFormat, String)>{
      VideoCodec.h264: (ContainerFormat.mp4, 'h264'),
      VideoCodec.h265: (ContainerFormat.mp4, 'hevc'),
      VideoCodec.vp9: (ContainerFormat.webm, 'vp9'),
      VideoCodec.av1: (ContainerFormat.mp4, 'av1'),
    };

    cases.forEach((codec, spec) {
      final (container, streamCodec) = spec;
      test('${codec.name}: то, что нашёл каталог, доходит до FFmpeg и кодирует',
          () async {
        final hw = await catalog.hardwareEncoderFor(codec);
        if (hw == null) {
          // Not a silent pass: a phone without the block is a fact about the
          // phone, and the run should say which ones it skipped.
          // ignore: avoid_print
          print('ПРОПУЩЕНО: у этого устройства нет аппаратного ${codec.name}');
          return;
        }

        final settings = ConversionSettings(
          container: container,
          videoCodec: codec,
          audioCodec: ContainerRules.defaultAudioCodec(container),
          rateControl: RateControl.bitrate,
          videoBitrateKbps: 800,
        );

        // First claim: the builder uses what the catalogue found. This is the
        // half that was broken for VP9 — probed, handed over, dropped on the
        // floor — and it is the half that is unconditionally the app's fault.
        final out = '${work.path}/hw_${codec.name}.${container.extension}';
        final args = FFmpegArgs.build(
          inputPath: video,
          outputPath: out,
          settings: settings,
          sourceDurationMs: 2000,
          hwVideoEncoder: hw,
        );
        expect(args, contains(hw),
            reason: 'каталог нашёл $hw, а сборщик аргументов его не поставил');

        // Second claim, and the one that has to be stated carefully: encoding
        // may legitimately fail here. `ffmpeg -encoders` lists a `*_mediacodec`
        // wrapper because the *build* has it, not because the *phone* does —
        // this device advertises `vp9_mediacodec` and MediaCodec answers
        // NAME_NOT_FOUND when asked for one. That is precisely the case the
        // queue's software retry exists for, so the guarantee under test is
        // "hardware works, or the fallback does", not "hardware works".
        final session = await FFmpegKit.executeWithArgumentsAsync(args);
        ReturnCode? code;
        for (var i = 0; i < 600; i++) {
          code = await session.getReturnCode();
          if (code != null) break;
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }

        if (ReturnCode.isSuccess(code)) {
          // ignore: avoid_print
          print('АППАРАТНО: ${codec.name} закодирован через $hw');
          expect(await streamsOfType(out, 'video'), contains(streamCodec));
          return;
        }

        // ignore: avoid_print
        print('НЕТ БЛОКА: $hw объявлен сборкой, но устройство его не даёт — '
            'проверяется откат на software');
        final logs = await session.getLogsAsString();
        expect(logs, contains('Conversion failed'),
            reason: 'аппаратный энкодер упал не на инициализации, а как-то иначе: $logs');

        // The fallback is what the user actually gets, so it is what must work.
        final file = await convert(video, settings, 'hw_soft_${codec.name}.${container.extension}');
        expect(await streamsOfType(file.path, 'video'), contains(streamCodec));
      }, timeout: long);
    });

    test('на пути постоянного качества аппаратный энкодер не используется',
        () async {
      // Hardware encoders take a bitrate, not a CRF. Handing one to a
      // constant-quality job must leave the software encoder in place instead
      // of producing a file at some bitrate the user never asked for.
      final args = FFmpegArgs.build(
        inputPath: video,
        outputPath: '${work.path}/hw_crf.mp4',
        settings: const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          rateControl: RateControl.quality,
          crf: 28,
        ),
        hwVideoEncoder: 'h264_mediacodec',
      );
      expect(args, isNot(contains('h264_mediacodec')));
      expect(args, contains('libx264'));
    });
  });

  group('два прохода', () {
    test('укладывается в бюджет и файл читается', () async {
      const target = 200 * 1024;
      final file = await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          rateControl: RateControl.size,
          sizeTargetBytes: target,
          preset: EncodingPreset.ultrafast,
        ),
        'two_pass.mp4',
        twoPass: true,
      );
      expect(file.lengthSync(), lessThanOrEqualTo(target),
          reason: 'обещали не больше $target байт, вышло ${file.lengthSync()}');
      expect(await converter.probeDurationMs(file.path), greaterThan(0));
    }, timeout: long);

    test('второй проход не оставляет после себя файл статистики', () async {
      // libx264 writes its pass-1 stats next to wherever it is told, and a
      // leftover file in the app's documents directory is storage that leaks
      // and never gets swept.
      final before = work.listSync().length;
      await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          rateControl: RateControl.size,
          sizeTargetBytes: 200 * 1024,
          preset: EncodingPreset.ultrafast,
        ),
        'two_pass_clean.mp4',
        twoPass: true,
      );
      final added = work
          .listSync()
          .whereType<File>()
          .where((f) => f.path.contains('log') || f.path.contains('mbtree'))
          .toList();
      expect(added, isEmpty,
          reason: 'после двух проходов остались: ${added.map((f) => f.path)}');
      expect(work.listSync().length, before + 1);
    }, timeout: long);
  });

  group('субтитры', () {
    test('MKV → MP4 переносит дорожку как mov_text', () async {
      final file = await convert(
        subtitled,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          preset: EncodingPreset.ultrafast,
          keepSubtitles: true,
        ),
        'subs_kept.mp4',
      );
      expect(await streamsOfType(file.path, 'subtitle'), contains('mov_text'));
    }, timeout: long);

    test('MKV → MKV оставляет дорожку как есть', () async {
      final file = await convert(
        subtitled,
        const ConversionSettings(
          container: ContainerFormat.mkv,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          preset: EncodingPreset.ultrafast,
          keepSubtitles: true,
        ),
        'subs_kept.mkv',
      );
      expect(await streamsOfType(file.path, 'subtitle'), contains('subrip'));
    }, timeout: long);

    test('выключенный тумблер выбрасывает дорожку', () async {
      final file = await convert(
        subtitled,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h264,
          audioCodec: AudioCodec.aac,
          preset: EncodingPreset.ultrafast,
        ),
        'subs_dropped.mp4',
      );
      expect(await streamsOfType(file.path, 'subtitle'), isEmpty);
    }, timeout: long);
  });

  group('отмена', () {
    late String longClip;

    setUpAll(() async {
      // Long and deliberately expensive to encode: the cancel has to land
      // while FFmpeg is still working, and a job that finishes first would
      // make this test pass without ever testing anything.
      longClip = '${work.path}/long.mp4';
      await run('long', [
        '-y', '-f', 'lavfi', '-i', 'testsrc=duration=20:size=1280x720:rate=30',
        '-f', 'lavfi', '-i', 'sine=frequency=440:duration=20',
        '-c:v', 'libx264', '-preset', 'ultrafast', '-pix_fmt', 'yuv420p',
        '-c:a', 'aac', longClip,
      ]);
    });

    test('отменённая работа заканчивается как отменённая, а не как ошибка',
        () async {
      // The distinction matters to the user: a cancelled job leaves the queue
      // quietly, a failed one shows an error. Getting this wrong makes the
      // app look broken every time somebody changes their mind.
      final out = '${work.path}/cancelled.mp4';
      var cancelled = false;

      final future = converter.convert(
        inputPath: longClip,
        outputPath: out,
        settings: const ConversionSettings(
          container: ContainerFormat.mp4,
          videoCodec: VideoCodec.h265,
          audioCodec: AudioCodec.aac,
          preset: EncodingPreset.slow,
          crf: 20,
        ),
        totalDurationMs: 20000,
        onSession: (id) async {
          await Future<void>.delayed(const Duration(seconds: 1));
          cancelled = true;
          converter.cancel(id);
        },
      );

      final result = await future.timeout(const Duration(minutes: 3));
      expect(cancelled, isTrue, reason: 'сессия не пришла — отменять было нечего');
      expect(result.outcome, ConversionOutcome.cancelled,
          reason: 'отмена вернулась как ${result.outcome}: ${result.message}');
    }, timeout: long);
  });

  group('склейка с беззвучным клипом', () {
    late String silent;

    setUpAll(() async {
      silent = '${work.path}/silent.mp4';
      await run('silent', [
        '-y', '-f', 'lavfi', '-i', 'testsrc=duration=2:size=320x240:rate=15',
        '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-an', silent,
      ]);
    });

    test('клип без звука дополняется тишиной, а не роняет склейку', () async {
      // The concat filter needs the same number of streams from every input,
      // so a clip with no audio track has to be padded with generated silence.
      // Without that the whole merge dies, and it is the ordinary case: phone
      // screen recordings and muted exports carry no audio at all.
      final merged = await convert(
        video,
        QuickPreset.mergeVideos.settings(),
        'merged_silent.mp4',
        extraInputs: [silent],
      );
      final ms = await converter.probeDurationMs(merged.path);
      expect(ms!, greaterThan(3000), reason: 'склейка дала $ms мс вместо ~4000');
      expect(await streamsOfType(merged.path, 'audio'), isNotEmpty,
          reason: 'у результата пропала звуковая дорожка целиком');
    }, timeout: long);

    test('беззвучный клип первым — тот же результат', () async {
      final merged = await convert(
        silent,
        QuickPreset.mergeVideos.settings(),
        'merged_silent_first.mp4',
        extraInputs: [video],
      );
      expect((await converter.probeDurationMs(merged.path))!, greaterThan(3000));
      expect(await streamsOfType(merged.path, 'audio'), isNotEmpty);
    }, timeout: long);
  });

  group('быстрые пресеты: каждый выполняется на своём источнике', () {
    for (final preset in QuickPreset.values) {
      test(preset.name, () async {
        final settings = preset.settings();
        final source = switch (preset.expectsKind) {
          MediaKind.video => video,
          MediaKind.image => photo,
          MediaKind.audio => audio,
        };
        final file = await convert(
          source,
          settings,
          'p_${preset.name}.${settings.container.extension}',
          extraInputs: preset.isMerge ? [video2] : const [],
        );

        if (preset.needsSizeTarget) {
          expect(file.lengthSync(), lessThanOrEqualTo(settings.sizeTargetBytes!),
              reason: '${preset.name} обещал бюджет и не уложился');
        }
        if (settings.container.kind != MediaKind.image) {
          expect(await converter.probeDurationMs(file.path), greaterThan(0));
        }
        if (preset.isMerge) {
          final ms = await converter.probeDurationMs(file.path);
          expect(ms!, greaterThan(3000),
              reason: 'склейка двух двухсекундных клипов дала $ms мс');
        }
      }, timeout: long);
    }
  });
}
