import 'dart:convert';
import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

import 'fixtures.dart';

/// Каждая конверсия, которую приложение вообще разрешает выбрать, — на живом
/// FFmpeg.
///
/// `conversion_test.dart` берёт представителей: один видеокодек, один
/// звуковой, пару картинок. Этого хватает, чтобы поймать сломанный конвейер, и
/// не хватает, чтобы поймать ОДНУ незаконную пару в таблице совместимости —
/// а именно она и доходит до пользователя, потому что UI её честно предлагает.
///
/// Поэтому матрица строится не списком, а из самих `ContainerRules`: добавили
/// кодек в таблицу — он появился здесь сам. Тест, который нужно дописывать
/// руками вслед за каталогом, рано или поздно от него отстаёт.
/// Форматы, которые приложение обещает читать, а этот FFmpeg писать не умеет:
/// муксера `heif` не существует вовсе, а у APE в FFmpeg никогда не было
/// энкодера. Синтезировать их нечем, поэтому единственный способ проверить
/// разбор — принести готовый файл.
///
/// Чтобы закрыть пробел, положите сюда base64 настоящего файла:
///
/// ```
/// # килобайты, не мегабайты — файл едет внутри исходника
/// base64 -w0 sample.heic
/// ```
///
/// **HEIC закрыт — и опасение подтвердилось.** [kHeicFixtureBase64] сделан
/// системным кодировщиком Apple и разложен плиткой в `grid`, как снимок с
/// айфона. На нём выяснилось, что собрать плитку эта сборка не умеет: см. тест
/// «плитка grid НЕ собирается» ниже. Слабая проверка «результат больше 2000
/// байт» это пропускала — одна плитка тоже весит килобайты.
///
/// APE всё ещё ждёт своего файла.
const Map<String, (MediaKind, String?)> _fixtures = {
  'heic': (MediaKind.image, kHeicFixtureBase64),
  'ape': (MediaKind.audio, null),
};

/// Кадр, из которого собран [kHeicFixtureBase64], и размер одной его плитки.
/// Apple режет по 512×512, так что 1024×768 — это ровно четыре плитки, и
/// демуксер, собравший одну вместо четырёх, отдаст первую.
const _heicWidth = 1024;
const _heicHeight = 768;
const _heicTileWidth = 512;
const _heicTileHeight = 512;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Directory work;
  final converter = FFmpegConverter();

  // Источники: движущийся, неподвижный, анимированный и звуковой.
  late String video;
  late String photo;
  late String gif;
  late String audio;
  late String video2; // для склейки

  /// Входные форматы, которые `ContainerFormat.kindOfFile` обещает понимать, но
  /// записать приложение их не умеет. Синтезируются здесь же — иначе обещание
  /// проверено ровно никак.
  final exotic = <String, String>{};

  Future<void> synthesise(String label, List<String> args) async {
    final session = await FFmpegKit.executeWithArgumentsAsync(args);
    ReturnCode? code;
    for (var i = 0; i < 300; i++) {
      code = await session.getReturnCode();
      if (code != null) break;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    expect(ReturnCode.isSuccess(code), isTrue,
        reason: 'не собрался исходник $label: ${await session.getLogsAsString()}');
  }

  setUpAll(() async {
    final docs = await getApplicationDocumentsDirectory();
    work = Directory('${docs.path}/it_matrix');
    if (work.existsSync()) work.deleteSync(recursive: true);
    work.createSync(recursive: true);

    String at(String name) => '${work.path}/$name';

    // Намеренно крошечные: матрица прогоняет под сотню кодирований, и libaom
    // на секунде 160×120 — это ожидание, а на десяти секундах 720p — это
    // прогон, который никто не станет запускать второй раз.
    video = at('src.mp4');
    await synthesise('video', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac', video,
    ]);

    video2 = at('src2.mp4');
    await synthesise('video2', [
      '-y', '-f', 'lavfi', '-i', 'smptebars=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=880:duration=1',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac', video2,
    ]);

    photo = at('src.png');
    await synthesise('photo', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=size=200x150:duration=1:rate=1',
      '-frames:v', '1', '-update', '1', photo,
    ]);

    gif = at('src.gif');
    await synthesise('gif', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=120x90:rate=8', gif,
    ]);

    audio = at('src.m4a');
    await synthesise('audio', [
      '-y', '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:a', 'aac', audio,
    ]);

    // Экзотика на вход. Кодеки взяты те, что этот контейнер носит в реальной
    // жизни, — иначе проверялось бы наше умение писать, а не читать.
    exotic['wmv'] = at('src.wmv');
    await synthesise('wmv', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'wmv2', '-c:a', 'wmav2', exotic['wmv']!,
    ]);
    exotic['3gp'] = at('src.3gp');
    await synthesise('3gp', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=176x144:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'mpeg4', '-c:a', 'aac', exotic['3gp']!,
    ]);
    exotic['mpg'] = at('src.mpg');
    await synthesise('mpg', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'mpeg2video', '-c:a', 'mp2', exotic['mpg']!,
    ]);
    exotic['ts'] = at('src.ts');
    await synthesise('ts', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'aac', exotic['ts']!,
    ]);
    exotic['flv'] = at('src.flv');
    await synthesise('flv', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'flv1', '-c:a', 'libmp3lame', exotic['flv']!,
    ]);
    exotic['aiff'] = at('src.aiff');
    await synthesise('aiff', [
      '-y', '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:a', 'pcm_s16be', exotic['aiff']!,
    ]);
    exotic['wma'] = at('src.wma');
    await synthesise('wma', [
      '-y', '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:a', 'wmav2', exotic['wma']!,
    ]);
    exotic['mpeg'] = at('src.mpeg');
    await synthesise('mpeg', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'mpeg2video', '-c:a', 'mp2', exotic['mpeg']!,
    ]);
    // Ни `.m2ts`, ни `.alac` не отображаются на муксер по имени файла, поэтому
    // формат задан явно. Содержимое при этом настоящее: Blu-ray-поток — это
    // MPEG-TS, а `.alac` — это ALAC в ISOBMFF.
    exotic['m2ts'] = at('src.m2ts');
    await synthesise('m2ts', [
      '-y', '-f', 'lavfi', '-i', 'testsrc=duration=1:size=160x120:rate=10',
      '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-c:a', 'ac3',
      '-f', 'mpegts', exotic['m2ts']!,
    ]);
    // AMR пишется по-настоящему: в сборке есть `libopencore_amrnb` и муксер
    // `amr`. Кодек жёстко требует 8 кГц моно — на любом другом входе он просто
    // откажется, и это будет похоже на сломанный тест.
    exotic['amr'] = at('src.amr');
    await synthesise('amr', [
      '-y', '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-ar', '8000', '-ac', '1', '-c:a', 'libopencore_amrnb', '-b:a', '12.2k',
      exotic['amr']!,
    ]);
    exotic['alac'] = at('src.alac');
    await synthesise('alac', [
      '-y', '-f', 'lavfi', '-i', 'sine=frequency=440:duration=1',
      '-c:a', 'alac', '-f', 'ipod', exotic['alac']!,
    ]);

    // Те же байты под другим именем — ровно то, что приносит пользователь.
    // Обещание читать их держится на определении формата по содержимому, и
    // проверять тут нужно именно это, а не умение FFmpeg писать ещё один
    // контейнер.
    final jpeg = at('src.jpg');
    await synthesise('jpeg', ['-y', '-i', photo, '-frames:v', '1', jpeg]);
    exotic['jfif'] = at('src.jfif');
    File(jpeg).copySync(exotic['jfif']!);
    exotic['m4v'] = at('src.m4v');
    File(video).copySync(exotic['m4v']!);
  });

  tearDownAll(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  Future<File> convert(
    String input,
    ConversionSettings settings,
    String outName, {
    List<String> extraInputs = const [],
  }) async {
    // The catalogue is the authority on which pairs are legal, and the app
    // never builds an illegal one: every container change goes through
    // `withContainer`, which coerces the codecs. A test that hand-builds
    // settings has no such guard, and `ConversionSettings` defaults to AAC —
    // so asking for an MP3 container and forgetting the codec asks FFmpeg to
    // put AAC in an MP3 muxer. That comes back as a bare "Conversion failed!"
    // and reads like a broken pipeline instead of a broken test.
    final s = settings;
    if (s.container.kind == MediaKind.audio || s.container.kind == MediaKind.video) {
      expect(ContainerRules.allowsAudio(s.container, s.audioCodec), isTrue,
          reason: 'тест просит незаконную пару: ${s.container.name} + ${s.audioCodec.name}');
    }
    if (s.container.kind == MediaKind.video) {
      expect(ContainerRules.allowsVideo(s.container, s.videoCodec), isTrue,
          reason: 'тест просит незаконную пару: ${s.container.name} + ${s.videoCodec.name}');
    }

    final out = '${work.path}/$outName';
    final result = await converter.convert(
      inputPath: input,
      outputPath: out,
      settings: settings,
      totalDurationMs: await converter.probeDurationMs(input),
      extraInputPaths: extraInputs,
      // Оба списка описывают ВСЕ входы, включая первый, — так их наполняет
      // `QueueController`, и так их индексирует граф concat.
      extraInputsHaveAudio: [
        if (extraInputs.isNotEmpty) await converter.probeHasAudio(input),
        for (final p in extraInputs) await converter.probeHasAudio(p),
      ],
      extraInputDurationsMs: [
        if (extraInputs.isNotEmpty) await converter.probeDurationMs(input),
        for (final p in extraInputs) await converter.probeDurationMs(p),
      ],
    );
    expect(result.isSuccess, isTrue, reason: 'FFmpeg сказал: ${result.message}');
    final file = File(out);
    expect(file.existsSync(), isTrue, reason: 'нет файла $out');
    expect(file.lengthSync(), greaterThan(0), reason: 'пустой файл $out');
    return file;
  }

  /// Записанное должно ещё и читаться: файл, который существует, но битый,
  /// проходит проверку на размер и не проходит эту.
  Future<void> decodable(String path, {bool moving = true}) async {
    final ms = await converter.probeDurationMs(path);
    if (moving) {
      expect(ms, isNotNull, reason: '$path не отдаёт длительность');
      expect(ms, greaterThan(0));
    } else {
      expect(ms == null || ms >= 0, isTrue);
    }
  }

  /// Медленным кодировщикам (libaom) — своё время.
  const long = Timeout(Duration(minutes: 6));

  group('видео → видео: каждый кодек в каждом контейнере', () {
    for (final container in ContainerFormat.ofKind(MediaKind.video)) {
      for (final codec in ContainerRules.videoCodecsFor(container)) {
        // `copy` — это «переложить как есть», и законность зависит от того, что
        // лежит в исходнике. Источник у нас H.264, поэтому WebM здесь
        // пропускается: его copy осмысленен для VP9/AV1-исходника и проверяется
        // ниже отдельно.
        if (codec == VideoCodec.copy && container == ContainerFormat.webm) {
          continue;
        }
        test('${container.name} + ${codec.name}', () async {
          final file = await convert(
            video,
            ConversionSettings(
              container: container,
              videoCodec: codec,
              audioCodec: ContainerRules.defaultAudioCodec(container),
              preset: EncodingPreset.ultrafast,
              crf: codec.maxCrf > 51 ? 50 : 30,
            ),
            'v_${container.name}_${codec.name}.${container.extension}',
          );
          await decodable(file.path);
        }, timeout: long);
      }
    }

    test('webm + copy переносит VP9 без перекодирования', () async {
      final vp9 = await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.vp9,
          audioCodec: AudioCodec.opus,
          crf: 50,
          preset: EncodingPreset.ultrafast,
        ),
        'vp9_source.webm',
      );
      final copied = await convert(
        vp9.path,
        const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.copy,
          audioCodec: AudioCodec.copy,
        ),
        'vp9_copy.webm',
      );
      await decodable(copied.path);
    }, timeout: long);
  });

  group('видео → звук: каждый звуковой контейнер и его кодеки', () {
    for (final container in ContainerFormat.ofKind(MediaKind.audio)) {
      for (final codec in ContainerRules.audioCodecsFor(container)) {
        test('${container.name} + ${codec.name}', () async {
          final file = await convert(
            video,
            ConversionSettings(container: container, audioCodec: codec),
            'a_${container.name}_${codec.name}.${container.extension}',
          );
          await decodable(file.path);
        });
      }
    }
  });

  group('видео → движущаяся картинка и кадр', () {
    test('GIF через palette-граф', () async {
      final file = await convert(
        video,
        const ConversionSettings(container: ContainerFormat.gif, fps: FpsPreset.fps15),
        'motion.gif',
      );
      await decodable(file.path);
    });

    test('анимированный WebP', () async {
      final file = await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.webpAnimated,
          fps: FpsPreset.fps15,
          imageQuality: 75,
        ),
        'motion.webp',
      );
      expect(file.lengthSync(), greaterThan(1000), reason: 'похоже на один кадр');
    });

    test('один кадр в JPEG', () async {
      final file = await convert(
        video,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 85),
        'frame.jpg',
      );
      await decodable(file.path, moving: false);
    });
  });

  group('фото → каждый формат изображения', () {
    for (final container in ContainerFormat.ofKind(MediaKind.image)) {
      // Анимированный WebP из неподвижной картинки — это просто худший WebP, и
      // приложение его для такого источника не предлагает.
      if (container.needsMovingSource) continue;
      test(container.name, () async {
        final file = await convert(
          photo,
          ConversionSettings(container: container, imageQuality: 85),
          'i_${container.name}.${container.extension}',
        );
        await decodable(file.path, moving: false);
      }, timeout: long);
    }

    test('WebP без потерь выбирает свой битстрим', () async {
      final lossy = await convert(
        photo,
        const ConversionSettings(container: ContainerFormat.webp, imageQuality: 60),
        'q_lossy.webp',
      );
      final lossless = await convert(
        photo,
        const ConversionSettings(container: ContainerFormat.webp, lossless: true),
        'q_lossless.webp',
      );
      // Размер здесь ничего не доказывает: источник — синтетический testsrc,
      // то есть плоская заливка, которую VP8L жмёт лучше, чем DCT на q60.
      // Формат сам называет свой битстрим: после `RIFF<размер>WEBP` идёт
      // FourCC — `VP8L` у без потерь, `VP8 ` у обычного.
      String fourCc(File f) => String.fromCharCodes(f.readAsBytesSync().sublist(12, 16));
      expect(fourCc(lossless), 'VP8L');
      expect(fourCc(lossy), 'VP8 ');
    });
  });

  group('GIF как источник движения', () {
    for (final target in [
      ContainerFormat.mp4,
      ContainerFormat.webm,
      ContainerFormat.webpAnimated,
    ]) {
      test('gif → ${target.name}', () async {
        final file = await convert(
          gif,
          ContainerFormat.mp4 == target
              ? const ConversionSettings(
                  container: ContainerFormat.mp4,
                  videoCodec: VideoCodec.h264,
                  audioCodec: AudioCodec.none,
                  preset: EncodingPreset.ultrafast,
                )
              : ContainerFormat.webm == target
                  ? const ConversionSettings(
                      container: ContainerFormat.webm,
                      videoCodec: VideoCodec.vp9,
                      audioCodec: AudioCodec.none,
                      crf: 50,
                      preset: EncodingPreset.ultrafast,
                    )
                  : const ConversionSettings(
                      container: ContainerFormat.webpAnimated,
                      imageQuality: 75,
                    ),
          'g_${target.name}.${target.extension}',
        );
        if (target != ContainerFormat.webpAnimated) await decodable(file.path);
      }, timeout: long);
    }

    test('gif → один кадр JPEG', () async {
      final file = await convert(
        gif,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 85),
        'g_frame.jpg',
      );
      await decodable(file.path, moving: false);
    });
  });

  group('звук → каждый звуковой контейнер', () {
    for (final container in ContainerFormat.ofKind(MediaKind.audio)) {
      for (final codec in ContainerRules.audioCodecsFor(container)) {
        test('${container.name} + ${codec.name}', () async {
          final file = await convert(
            audio,
            ConversionSettings(container: container, audioCodec: codec),
            's_${container.name}_${codec.name}.${container.extension}',
          );
          await decodable(file.path);
        });
      }
    }
  });

  group('входные форматы, которые приложение обещает читать', () {
    for (final entry in {
      'wmv': MediaKind.video,
      '3gp': MediaKind.video,
      'mpg': MediaKind.video,
      'ts': MediaKind.video,
      'flv': MediaKind.video,
      'm4v': MediaKind.video,
      'mpeg': MediaKind.video,
      'm2ts': MediaKind.video,
      'aiff': MediaKind.audio,
      'wma': MediaKind.audio,
      'alac': MediaKind.audio,
      'amr': MediaKind.audio,
      'jfif': MediaKind.image,
    }.entries) {
      test('.${entry.key} читается и конвертируется', () async {
        // Сначала обещание каталога, потом дело: если `kindOfFile` ошибается,
        // приложение предложит для файла не тот набор форматов.
        expect(ContainerFormat.kindOfFile('x.${entry.key}'), entry.value);

        final target = switch (entry.value) {
          MediaKind.video => const ConversionSettings(
              container: ContainerFormat.mp4,
              preset: EncodingPreset.ultrafast,
              crf: 30,
            ),
          MediaKind.audio => const ConversionSettings(
              container: ContainerFormat.mp3,
              audioCodec: AudioCodec.mp3,
            ),
          MediaKind.image => const ConversionSettings(
              container: ContainerFormat.jpg,
              imageQuality: 85,
            ),
        };
        final file = await convert(
          exotic[entry.key]!,
          target,
          'x_${entry.key}.${target.container.extension}',
        );
        await decodable(file.path, moving: entry.value != MediaKind.image);
      }, timeout: long);
    }

    // HEIC/HEIF и APE этот бинарник читает, но не пишет — ни муксера, ни
    // энкодера (проверено на устройстве: `-f heif` не существует, а файл с
    // именем `.heic` получается обычным MP4). Собрать здесь такой файл нечем,
    // и обещание `kindOfFile` нужно чем-то подпереть.
    //
    // Подпорка честная и заметно слабее прочих: она проверяет, что декодер в
    // сборке зарегистрирован, а не что настоящий файл прошёл насквозь. Молча
    // исчезнувший из нового варианта ffmpeg-kit декодер она поймает; HEIC с
    // айфона, где картинка разложена плиткой в grid-элемент, — нет. Закрыть
    // это может только настоящий файл, положенный в репозиторий фикстурой.
    for (final entry in {
      'heic/heif': 'hevc',
      'ape': 'ape',
    }.entries) {
      test('декодер для ${entry.key} зарегистрирован в этой сборке', () async {
        final session = await FFmpegKit.executeWithArguments(
            ['-hide_banner', '-decoders']);
        final output = await session.getOutput() ?? '';
        expect(output, contains(entry.value),
            reason: 'приложение обещает читать ${entry.key}, '
                'а декодера ${entry.value} в сборке нет');
      });
    }

    // Второй этаж той же проверки — и единственный, который доказывает разбор
    // файла, а не наличие кода. Фикстуры лежат прямо здесь в base64: на
    // устройстве нет доступа к файлам хоста, а `assets/` в pubspec означало бы
    // тестовые файлы внутри релизного APK.
    //
    // Пока словарь пуст, группа честно говорит об этом в вывод, а не молчит.
    _fixtures.forEach((name, spec) {
      final (kind, base64Data) = spec;
      test('.$name: настоящий файл читается насквозь', () async {
        if (base64Data == null) {
          // ignore: avoid_print
          print('НЕТ ФИКСТУРЫ .$name: разбор файла не проверен, проверена '
              'только регистрация декодера. Как закрыть — см. _fixtures.');
          return;
        }
        expect(ContainerFormat.kindOfFile('x.$name'), kind);
        final path = '${work.path}/fx.$name';
        File(path).writeAsBytesSync(base64Decode(base64Data));

        final target = kind == MediaKind.image
            ? const ConversionSettings(
                container: ContainerFormat.jpg, imageQuality: 85)
            : const ConversionSettings(
                container: ContainerFormat.mp3, audioCodec: AudioCodec.mp3);
        final file = await convert(path, target, 'fx_$name.${target.container.extension}');
        await decodable(file.path, moving: kind != MediaKind.image);

        // Картинка, которая «сконвертировалась» в 300 байт серого поля, прошла
        // бы все проверки выше. У HEIC это не теория: разложенный плиткой
        // снимок с айфона декодируется в одну плитку, если демуксер не собрал
        // grid.
        expect(file.lengthSync(), greaterThan(2000),
            reason: 'результат подозрительно мал — похоже, декодировалась '
                'не вся картинка');
      }, timeout: long);
    });

    // Третий этаж, и единственный, который отличает «декодировалось что-то» от
    // «декодировалось всё». Размер файла тут плохой свидетель: одна плитка из
    // четырёх — это тоже несколько килобайт JPEG, и проверка выше её честно
    // пропустила. Разрешение не спутать.
    //
    // Опасение из шапки файла подтвердилось, и в этом весь смысл фикстуры:
    // **сам FFmpeg плитку не собирает**. Кадр 1024×768, разрезанный Apple на
    // четыре плитки 512×512, выходил из его командного слоя как 512×512 —
    // левый верхний угол вместо картинки. Не ошибка, которую видно, а тихо
    // неправильный результат, то есть худший из возможных исходов: снимок с
    // айфона (а HEIC на входе — в первую очередь он) молча обрезался.
    //
    // Чинит это [StillDecoder]: HEIC раскодировывает система, и до FFmpeg
    // доезжает обычный полноразмерный PNG. Поэтому проверка требует именно
    // целый кадр — и **покраснеет на любой платформе, где системной половины
    // канала нет** (сегодня это Android). Так и задумано: молчаливо
    // обрезанная фотография — не то, о чём тест должен помалкивать.
    test('.heic: плитка grid собирается в полный кадр', () async {
      final path = '${work.path}/grid.heic';
      File(path).writeAsBytesSync(base64Decode(kHeicFixtureBase64));

      final file = await convert(
        path,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 85),
        'grid.jpg',
      );

      final info = await FFprobeKit.getMediaInformation(file.path);
      final streams = info.getMediaInformation()?.getStreams() ?? [];
      final video = streams.where((s) => s.getType() == 'video').toList();
      expect(video, isNotEmpty, reason: 'в результате нет картинки');

      final w = video.first.getWidth();
      final h = video.first.getHeight();
      // ignore: avoid_print
      print('HEIC grid: исходник $_heicWidth×$_heicHeight, получилось $w×$h');

      final oneTile = w == _heicTileWidth && h == _heicTileHeight;
      expect(w, _heicWidth,
          reason: oneTile
              ? 'пришла ровно одна плитка $w×$h — значит StillDecoder не '
                  'сработал и файл ушёл в FFmpeg как есть. На Android это '
                  'ожидаемо и означает ровно то, что написано в README: '
                  'половина канала `decodeStill` там не написана, потому что '
                  'писать её было не на чем. Не «почините тест» — почините '
                  'платформу или снимите обещание читать HEIC.'
              : 'ширина $w вместо $_heicWidth');
      expect(h, _heicHeight,
          reason: 'высота $h вместо $_heicHeight (плитка — $_heicTileHeight)');
    }, timeout: long);

    test('.heic: после подстановки не остаётся временного PNG', () async {
      // Промежуточный файл на 12-мегапиксельном снимке весит десятки
      // мегабайт. Один забытый на фотографию — и батч из сотни снимков
      // забивает телефон молча.
      final path = '${work.path}/leftover.heic';
      File(path).writeAsBytesSync(base64Decode(kHeicFixtureBase64));

      await convert(
        path,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 85),
        'leftover.jpg',
      );

      expect(File('$path.decoded.png').existsSync(), isFalse,
          reason: 'промежуточный PNG пережил конверсию');
    }, timeout: long);
  });

  group('обработка: каждая ручка отдельно', () {
    final knobs = <String, ConversionSettings>{
      'поворот 90°': const ConversionSettings(
          container: ContainerFormat.mp4, rotate: RotatePreset.cw90, preset: EncodingPreset.ultrafast),
      'поворот 180°': const ConversionSettings(
          container: ContainerFormat.mp4, rotate: RotatePreset.r180, preset: EncodingPreset.ultrafast),
      'зеркало': const ConversionSettings(
          container: ContainerFormat.mp4, flipH: true, preset: EncodingPreset.ultrafast),
      'кроп 1:1': const ConversionSettings(
          container: ContainerFormat.mp4, crop: CropPreset.square, preset: EncodingPreset.ultrafast),
      'кроп 9:16': const ConversionSettings(
          container: ContainerFormat.mp4, crop: CropPreset.vertical, preset: EncodingPreset.ultrafast),
      'кроп 16:9': const ConversionSettings(
          container: ContainerFormat.mp4, crop: CropPreset.wide, preset: EncodingPreset.ultrafast),
      'кроп 4:3': const ConversionSettings(
          container: ContainerFormat.mp4, crop: CropPreset.classic, preset: EncodingPreset.ultrafast),
      'скорость 0.5×': const ConversionSettings(
          container: ContainerFormat.mp4, speed: SpeedPreset.x050, preset: EncodingPreset.ultrafast),
      'скорость 2×': const ConversionSettings(
          container: ContainerFormat.mp4, speed: SpeedPreset.x200, preset: EncodingPreset.ultrafast),
      'скорость 4× (цепочка atempo)': const ConversionSettings(
          container: ContainerFormat.mp4, speed: SpeedPreset.x400, preset: EncodingPreset.ultrafast),
      'громкость 200%': const ConversionSettings(
          container: ContainerFormat.mp4, volumePercent: 200, preset: EncodingPreset.ultrafast),
      'громкость 0%': const ConversionSettings(
          container: ContainerFormat.mp4, volumePercent: 0, preset: EncodingPreset.ultrafast),
      'разрешение 360p': const ConversionSettings(
          container: ContainerFormat.mp4, resolution: ResolutionPreset.p360, preset: EncodingPreset.ultrafast),
      'кадры 15': const ConversionSettings(
          container: ContainerFormat.mp4, fps: FpsPreset.fps15, preset: EncodingPreset.ultrafast),
      'без звука': const ConversionSettings(
          container: ContainerFormat.mp4, audioCodec: AudioCodec.none, preset: EncodingPreset.ultrafast),
      'метаданные оставить': const ConversionSettings(
          container: ContainerFormat.mp4, stripMetadata: false, preset: EncodingPreset.ultrafast),
      'постоянный битрейт': const ConversionSettings(
          container: ContainerFormat.mp4,
          rateControl: RateControl.bitrate,
          videoBitrateKbps: 300,
          preset: EncodingPreset.ultrafast),
      'моно 22 кГц': const ConversionSettings(
          container: ContainerFormat.mp3,
          audioCodec: AudioCodec.mp3,
          audioChannels: AudioChannels.mono,
          sampleRate: SampleRate.hz22050),
    };

    knobs.forEach((name, settings) {
      test(name, () async {
        final file = await convert(
          video,
          settings,
          'k_${settings.hashCode}.${settings.container.extension}',
        );
        await decodable(file.path);
      }, timeout: long);
    });

    test('обрезка укорачивает файл', () async {
      final file = await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          preset: EncodingPreset.ultrafast,
          trim: TrimRange(startMs: 200, endMs: 700),
        ),
        'k_trim.mp4',
      );
      final ms = await converter.probeDurationMs(file.path);
      expect(ms, isNotNull);
      expect(ms!, lessThan(900), reason: 'обрезка не подействовала: $ms мс');
    });

    test('процентный ресайз фото уменьшает файл', () async {
      final full = await convert(
        photo,
        const ConversionSettings(container: ContainerFormat.jpg, imageQuality: 90),
        'k_full.jpg',
      );
      final half = await convert(
        photo,
        const ConversionSettings(
            container: ContainerFormat.jpg, imageQuality: 90, imageScale: ImageScale.p50),
        'k_half.jpg',
      );
      expect(half.lengthSync(), lessThan(full.lengthSync()));
    });
  });

  group('целевой размер', () {
    test('видео укладывается в заданные байты', () async {
      const target = 120 * 1024;
      final file = await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          rateControl: RateControl.size,
          sizeTargetBytes: target,
          preset: EncodingPreset.ultrafast,
        ),
        'sz_video.mp4',
      );
      expect(file.lengthSync(), lessThanOrEqualTo(target),
          reason: 'обещали не больше $target байт, вышло ${file.lengthSync()}');
      await decodable(file.path);
    }, timeout: long);

    test('фото укладывается в заданные байты', () async {
      const target = 40 * 1024;
      final file = await convert(
        photo,
        const ConversionSettings(
          container: ContainerFormat.jpg,
          sizeTargetBytes: target,
          imageQuality: 90,
        ),
        'sz_photo.jpg',
      );
      expect(file.lengthSync(), lessThanOrEqualTo(target),
          reason: 'обещали не больше $target байт, вышло ${file.lengthSync()}');
      await decodable(file.path, moving: false);
    }, timeout: long);
  });

  group('склейка', () {
    test('два клипа становятся одним и он длиннее каждого', () async {
      final merged = await convert(
        video,
        const ConversionSettings(
          container: ContainerFormat.mp4,
          preset: EncodingPreset.ultrafast,
          crf: 30,
        ),
        'merged.mp4',
        extraInputs: [video2],
      );
      final ms = await converter.probeDurationMs(merged.path);
      expect(ms, isNotNull);
      expect(ms!, greaterThan(1500),
          reason: 'склейка двух секундных клипов должна давать ~2 с, а вышло $ms мс');
    }, timeout: long);
  });
}
