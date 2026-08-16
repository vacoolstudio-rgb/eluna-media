import 'package:eluna_media/services/original_media.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Запрос доступа к медиатеке — тот, что уходит на платформу при **включении**
/// «удалять оригиналы».
///
/// До 16.08.2026 доступ просился внутри самого удаления: переключатель
/// включался молча, а системный запрос приходил через полчаса, когда батч
/// закончился. На iOS это к тому же единственный шанс спросить — системный
/// запрос показывается один раз за установку.
///
/// Проверяется здесь ровно то, что нельзя проверить на устройстве: имена
/// методов канала и поведение на каждом пути отказа. Имя метода — не
/// придирка: опечатка в нём даёт `MissingPluginException`, то есть «доступа
/// нет» вместо запроса, и переключатель молча перестаёт включаться на обеих
/// платформах.
///
/// Живой запрос в наборе на устройстве не проверяется намеренно: он поднимает
/// системный диалог, нажать в котором некому, и прогон встанет до таймаута —
/// см. шапку `integration_test/ios_platform_test.dart`.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('eluna/share_intake');
  const service = ChannelOriginalMediaService();

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  List<MethodCall> mockPlatform(Future<Object?> Function(MethodCall) reply) {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return reply(call);
    });
    return calls;
  }

  group('запрос доступа', () {
    test('зовёт requestMediaAccess и возвращает ответ платформы', () async {
      final calls = mockPlatform((_) async => true);

      expect(await service.requestAccess(), isTrue);
      expect(calls.single.method, 'requestMediaAccess');
    });

    test('отказ платформы — это отказ', () async {
      mockPlatform((_) async => false);
      expect(await service.requestAccess(), isFalse);
    });

    // Отказывает закрыто на каждом пути: включить переключатель, не получив
    // внятного «да», значит пообещать удаление, которого потом не будет.
    test('канала нет — доступа нет', () async {
      // Обработчик не установлен вовсе: хост-машина, десктоп, старая сборка.
      expect(await service.requestAccess(), isFalse);
    });

    test('исключение платформы — доступа нет', () async {
      mockPlatform((_) async => throw PlatformException(code: 'boom'));
      expect(await service.requestAccess(), isFalse);
    });

    test('null вместо ответа — доступа нет', () async {
      mockPlatform((_) async => null);
      expect(await service.requestAccess(), isFalse);
    });
  });

  group('дорога в системные настройки', () {
    test('зовёт openAppSettings', () async {
      final calls = mockPlatform((_) async => true);

      expect(await service.openSystemSettings(), isTrue);
      expect(calls.single.method, 'openAppSettings');
    });

    test('не открылось — говорит об этом, а не притворяется', () async {
      mockPlatform((_) async => false);
      expect(await service.openSystemSettings(), isFalse);
    });

    test('канала нет — не открылось', () async {
      expect(await service.openSystemSettings(), isFalse);
    });
  });
}
