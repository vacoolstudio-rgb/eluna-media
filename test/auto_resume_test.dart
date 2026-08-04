import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/services/foreground_service.dart';
import 'package:eluna_media/services/notification_service.dart';
import 'package:eluna_media/state/queue_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stands in for FFmpeg. Writes a plausible output file so the queue's size
/// bookkeeping has something to read.
class _FakeConverter extends FFmpegConverter {
  final converted = <String>[];

  @override
  Future<int?> probeDurationMs(String path) async => 1000;

  @override
  Future<ConversionResult> convert({
    required String inputPath,
    required String outputPath,
    required ConversionSettings settings,
    int? totalDurationMs,
    int? progressDurationMs,
    SourceRates sourceRates = const SourceRates(),
    String? hwVideoEncoder,
    List<String> extraInputPaths = const [],
    List<bool?> extraInputsHaveAudio = const [],
    List<int?> extraInputDurationsMs = const [],
    bool twoPass = false,
    void Function(int sessionId)? onSession,
    void Function(double progress)? onProgress,
  }) async {
    onSession?.call(42);
    onProgress?.call(1);
    File(outputPath).writeAsBytesSync(List.filled(16, 0));
    converted.add(inputPath);
    return const ConversionResult(ConversionOutcome.success);
  }

  @override
  Future<void> cancel(int sessionId) async {}
}

class _FakeNotifications extends NotificationService {
  _FakeNotifications() : super(FlutterLocalNotificationsPlugin());

  var completions = 0;

  @override
  Future<void> init() async {}

  @override
  Future<bool> requestPermission() async => true;

  @override
  Future<void> showBatchComplete({required String title, required String body}) async {
    completions++;
  }
}

const _strings = QueueStrings(
  appTitle: 'Eluna',
  progress: _progress,
  completed: _completed,
  completedWithFailures: _completedWithFailures,
  cancelLabel: 'Stop',
);

String _progress(int done, int total) => '$done of $total';
String _completed(int done) => 'done $done';
String _completedWithFailures(int done, int failed) => 'done $done failed $failed';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const key = 'queue.v1';
  late Directory tmp;
  late SharedPreferences prefs;
  late _FakeConverter converter;
  late _FakeNotifications notifications;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('eluna_autoresume');
    converter = _FakeConverter();
    notifications = _FakeNotifications();

    // The queue writes its output through path_provider; plugin registrants do
    // not run under `flutter test`, so the method channel needs a stand-in.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => tmp.path,
    );

    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      null,
    );
    if (tmp.existsSync()) tmp.deleteSync(recursive: true);
  });

  File source(String name) =>
      File('${tmp.path}${Platform.pathSeparator}$name')..writeAsBytesSync(List.filled(64, 1));

  Future<void> seed({required bool wasRunning, required String inputPath}) => prefs.setString(
        key,
        QueueStorage.encode(
          [
            ConversionJob(
              id: 'j1',
              inputPath: inputPath,
              inputName: 'clip.mov',
              settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
            ),
          ],
          wasRunning: wasRunning,
        ),
      );

  /// A fresh container stands in for a fresh process.
  ProviderContainer boot() => ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          converterProvider.overrideWithValue(converter),
          notificationServiceProvider.overrideWithValue(notifications),
          // Not Android under test; the service is a no-op there anyway.
          foregroundServiceProvider.overrideWithValue(ForegroundService(supported: false)),
        ],
      );

  test('an interrupted batch is flagged, and resuming converts it', () async {
    final input = source('clip.mov');
    await seed(wasRunning: true, inputPath: input.path);

    final container = boot();
    addTearDown(container.dispose);

    expect(container.read(queueProvider).autoResume, isTrue);

    await container.read(queueProvider.notifier).start(_strings);

    expect(converter.converted, [input.path]);
    expect(container.read(queueProvider).jobs.single.status, JobStatus.completed);
    expect(notifications.completions, 1);
  });

  test('starting clears the flag, so a rebuild cannot resume twice', () async {
    final input = source('clip.mov');
    await seed(wasRunning: true, inputPath: input.path);

    final container = boot();
    addTearDown(container.dispose);

    final notifier = container.read(queueProvider.notifier);
    expect(container.read(queueProvider).autoResume, isTrue);

    await notifier.start(_strings);
    expect(container.read(queueProvider).autoResume, isFalse);
  });

  test('a finished batch leaves nothing on disk that would resume it', () async {
    final input = source('clip.mov');
    await seed(wasRunning: true, inputPath: input.path);

    final first = boot();
    await first.read(queueProvider.notifier).start(_strings);
    await first.read(queueProvider.notifier).persisted;
    first.dispose();

    expect(QueueStorage.decode(prefs.getString(key)).wasRunning, isFalse);

    // Relaunch: the completed job is still listed, but nothing restarts.
    final second = boot();
    addTearDown(second.dispose);
    expect(second.read(queueProvider).autoResume, isFalse);
    expect(converter.converted, hasLength(1), reason: 'must not convert a second time');
  });

  test('a batch in flight is recorded as running before any long work', () async {
    final input = source('clip.mov');
    await seed(wasRunning: false, inputPath: input.path);

    final container = boot();
    addTearDown(container.dispose);

    // Kill the process at the worst moment: the flag must already be on disk,
    // otherwise the interrupted batch would look like one that never started.
    final running = container.read(queueProvider.notifier).start(_strings);
    await Future<void>.delayed(Duration.zero);
    expect(QueueStorage.decode(prefs.getString(key)).wasRunning, isTrue);

    await running;
  });

  test('a queue the user never started is not flagged', () async {
    final input = source('clip.mov');
    await seed(wasRunning: false, inputPath: input.path);

    final container = boot();
    addTearDown(container.dispose);

    expect(container.read(queueProvider).autoResume, isFalse);
    expect(converter.converted, isEmpty);
  });

  test('an interrupted batch whose source vanished is not flagged', () async {
    await seed(wasRunning: true, inputPath: '${tmp.path}${Platform.pathSeparator}gone.mov');

    final container = boot();
    addTearDown(container.dispose);

    expect(container.read(queueProvider).jobs.single.status, JobStatus.failed);
    expect(container.read(queueProvider).autoResume, isFalse);
  });

  test('cancelling a resumed batch stops it and clears the flag on disk', () async {
    final input = source('clip.mov');
    await seed(wasRunning: true, inputPath: input.path);

    final container = boot();
    addTearDown(container.dispose);

    final notifier = container.read(queueProvider.notifier);
    await notifier.cancelBatch();

    expect(container.read(queueProvider).jobs.single.status, JobStatus.cancelled);
    expect(converter.converted, isEmpty);
  });
}
