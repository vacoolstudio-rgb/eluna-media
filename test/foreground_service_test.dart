import 'package:eluna_media/services/foreground_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('eluna/foreground_service');
  late List<MethodCall> calls;

  setUp(() {
    calls = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  ForegroundService service({bool supported = true}) =>
      ForegroundService(channel: channel, supported: supported);

  test('does nothing at all on an unsupported platform', () async {
    final s = service(supported: false);
    await s.start(title: 't', text: 'x', progress: 0, cancelLabel: 'Stop');
    await s.update(title: 't', text: 'y', progress: 0.5);
    await s.stop();
    expect(calls, isEmpty);
  });

  test('start posts the service intent with a whole percentage', () async {
    await service().start(title: 'Eluna', text: '0 of 3', progress: 0.25, cancelLabel: 'Stop');

    expect(calls, hasLength(1));
    expect(calls.single.method, 'start');
    expect(calls.single.arguments, {
      'title': 'Eluna',
      'text': '0 of 3',
      'progress': 25,
      // Carried on every post: the platform rebuilds the whole notification
      // from these arguments, so a missing label would drop the Cancel button.
      'cancelLabel': 'Stop',
    });
  });

  test('null progress is sent as the indeterminate sentinel', () async {
    await service().start(title: 'Eluna', text: 'working', cancelLabel: 'Stop');
    expect(calls.single.arguments['progress'], -1);
  });

  test('update is dropped before start', () async {
    await service().update(title: 'Eluna', text: '1 of 3', progress: 0.3);
    expect(calls, isEmpty);
  });

  test('sub-percent progress changes are throttled away', () async {
    final s = service();
    await s.start(title: 'Eluna', text: 'a', progress: 0.10, cancelLabel: 'Stop');
    calls.clear();

    // All of these round to 10%, and the caption is unchanged.
    await s.update(title: 'Eluna', text: 'a', progress: 0.1001);
    await s.update(title: 'Eluna', text: 'a', progress: 0.1042);
    expect(calls, isEmpty);

    // Crossing to 11% must reach the platform.
    await s.update(title: 'Eluna', text: 'a', progress: 0.11);
    expect(calls, hasLength(1));
    expect(calls.single.arguments['progress'], 11);
  });

  test('a changed caption is posted even at the same percentage', () async {
    final s = service();
    await s.start(title: 'Eluna', text: '1 of 3', progress: 0.5, cancelLabel: 'Stop');
    calls.clear();

    await s.update(title: 'Eluna', text: '2 of 3', progress: 0.5);
    expect(calls, hasLength(1));
    expect(calls.single.arguments['text'], '2 of 3');
  });

  test('stop is sent once, and only when running', () async {
    final s = service();
    await s.stop();
    expect(calls, isEmpty, reason: 'stop before start is a no-op');

    await s.start(title: 'Eluna', text: 'a', progress: 0, cancelLabel: 'Stop');
    calls.clear();

    await s.stop();
    await s.stop();
    expect(calls.map((c) => c.method), ['stop']);
  });

  test('updates after stop are ignored', () async {
    final s = service();
    await s.start(title: 'Eluna', text: 'a', progress: 0, cancelLabel: 'Stop');
    await s.stop();
    calls.clear();

    await s.update(title: 'Eluna', text: 'b', progress: 0.9);
    expect(calls, isEmpty);
  });

  test('a platform failure does not propagate to the caller', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      throw PlatformException(code: 'boom');
    });

    final s = service();
    // The conversion must survive losing its notification.
    await expectLater(s.start(title: 'Eluna', text: 'a', progress: 0, cancelLabel: 'Stop'), completes);
    await expectLater(s.stop(), completes);
  });
}
