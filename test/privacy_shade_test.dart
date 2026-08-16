import 'package:eluna_media/services/privacy_shade.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Флажок, от которого зависит нативная накладка на iOS.
///
/// Проверять здесь можно ровно одно, и это одно — единственное, чем тут можно
/// ошибиться: имя метода и то, что отказ платформы никого не роняет. Саму
/// накладку хост-тест не увидит: она рисуется в `applicationWillResignActive`,
/// куда Flutter не заглядывает.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('eluna/share_intake');
  const shade = PrivacyShade();

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('включение и выключение уходят на платформу как есть', () async {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return null;
    });

    await shade.setEnabled(true);
    await shade.setEnabled(false);

    expect(calls.map((c) => c.method), everyElement('setPrivacyShade'));
    expect(calls.map((c) => (c.arguments as Map)['enabled']), [true, false]);
  });

  test('платформы нет — молчит, а не падает', () async {
    // Android и хост: метод не реализован. Замок от этого не должен ломаться.
    await expectLater(shade.setEnabled(true), completes);
  });

  test('ошибка платформы гасится', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (_) async {
      throw PlatformException(code: 'boom');
    });
    await expectLater(shade.setEnabled(true), completes);
  });
}
