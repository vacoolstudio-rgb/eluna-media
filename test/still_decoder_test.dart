import 'dart:io';

import 'package:eluna_media/core/still_decoder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Подстановка системного декодера — та часть починки плиточного HEIC, которую
/// можно проверить без устройства.
///
/// Проверять тут стоит не «сработало», а «когда не сработало, ничего не
/// сломалось»: класс стоит на входе КАЖДОЙ конверсии, и его ошибка стоила бы
/// не одной картинки, а всего конвейера. Поэтому почти все проверки ниже — про
/// пути отказа.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory work;

  setUp(() {
    work = Directory.systemTemp.createTempSync('still_decoder');
  });

  tearDown(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('eluna/share_intake'), null);
  });

  /// Подменяет платформу и запоминает, звали ли её вообще.
  ///
  /// «Звали ли» — не мелочь: лишний поход на платформу за каждым JPEG в батче
  /// это лишний межпроцессный вызов на ровном месте.
  List<MethodCall> mockPlatform(Future<Object?> Function(MethodCall) reply) {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('eluna/share_intake'),
            (call) async {
      calls.add(call);
      return reply(call);
    });
    return calls;
  }

  String heicAt(String name) {
    final path = '${work.path}/$name';
    File(path).writeAsBytesSync(List<int>.filled(64, 0));
    return path;
  }

  group('что вообще берётся в работу', () {
    test('только heic и heif, регистр не важен', () {
      expect(StillDecoder.handles('/tmp/a.heic'), isTrue);
      expect(StillDecoder.handles('/tmp/a.HEIC'), isTrue);
      expect(StillDecoder.handles('/tmp/a.heif'), isTrue);
      // У остальных дефекта нет, а лишний PNG на тридцать мегабайт есть.
      expect(StillDecoder.handles('/tmp/a.jpg'), isFalse);
      expect(StillDecoder.handles('/tmp/a.png'), isFalse);
      expect(StillDecoder.handles('/tmp/a.mp4'), isFalse);
    });

    test('имя без расширения не роняет разбор', () {
      expect(StillDecoder.handles('/tmp/heic'), isFalse);
      expect(StillDecoder.handles(''), isFalse);
    });

    test('worthDecoding согласуется с каталогом форматов', () {
      expect(StillDecoder.worthDecoding('/tmp/photo.heic'), isTrue);
      expect(StillDecoder.worthDecoding('/tmp/clip.mp4'), isFalse);
    });
  });

  group('пути отказа', () {
    test('чужое расширение до платформы не доходит', () async {
      final calls = mockPlatform((_) async => true);
      expect(await const StillDecoder().decode(heicAt('a.jpg')), isNull);
      expect(calls, isEmpty, reason: 'зря сходили на платформу за JPEG');
    });

    test('несуществующий файл до платформы не доходит', () async {
      final calls = mockPlatform((_) async => true);
      expect(await const StillDecoder().decode('${work.path}/нет.heic'), isNull);
      expect(calls, isEmpty);
    });

    test('платформы без этого канала отвечают null, а не падают', () async {
      // Android сегодня, десктоп и хост-тесты всегда: обработчика нет.
      mockPlatform((_) async => throw MissingPluginException());
      expect(await const StillDecoder().decode(heicAt('a.heic')), isNull);
    });

    test('ошибка платформы отвечает null, а не падает', () async {
      mockPlatform((_) async => throw PlatformException(code: 'boom'));
      expect(await const StillDecoder().decode(heicAt('a.heic')), isNull);
    });

    test('отказ платформы (false) отвечает null', () async {
      mockPlatform((_) async => false);
      expect(await const StillDecoder().decode(heicAt('a.heic')), isNull);
    });

    test('«получилось», но файла нет — всё равно null', () async {
      // Ответ платформы разошёлся с диском. Отдать этот путь дальше значило бы
      // скормить FFmpeg пустоту и превратить тихую обрезку в громкую ошибку.
      mockPlatform((_) async => true);
      expect(await const StillDecoder().decode(heicAt('a.heic')), isNull);
    });

    test('«получилось», но файл пуст — null, и пустышку убирают', () async {
      late String expected;
      mockPlatform((call) async {
        expected = (call.arguments as Map)['outputPath'] as String;
        File(expected).writeAsBytesSync(const []);
        return true;
      });
      expect(await const StillDecoder().decode(heicAt('a.heic')), isNull);
      expect(File(expected).existsSync(), isFalse,
          reason: 'пустой PNG остался лежать');
    });
  });

  group('удачный путь', () {
    test('отдаёт путь, который платформа заполнила', () async {
      final calls = mockPlatform((call) async {
        final out = (call.arguments as Map)['outputPath'] as String;
        File(out).writeAsBytesSync(List<int>.filled(1024, 7));
        return true;
      });

      final source = heicAt('photo.heic');
      final decoded = await const StillDecoder().decode(source);

      expect(decoded, isNotNull);
      expect(File(decoded!).existsSync(), isTrue);
      expect(calls.single.method, 'decodeStill');
      expect((calls.single.arguments as Map)['path'], source);

      // Рядом с исходником намеренно: исходник уже лежит в расходном кэше, и
      // промежуточный файл исчезнет вместе с ним, даже если процесс умрёт до
      // уборки.
      expect(decoded, startsWith(source));
      expect(decoded, endsWith('.png'));
    });
  });
}
