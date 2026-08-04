import 'dart:io';

import 'package:eluna_media/core/converter.dart';
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

/// Records how many conversions are in flight at once, which is the only thing
/// these tests are actually about.
class _OverlapConverter extends FFmpegConverter {
  int inFlight = 0;
  int peak = 0;
  final started = <String>[];

  @override
  Future<int?> probeDurationMs(String path) async => 1000;

  @override
  Future<SourceRates> probeRates(String path) async => const SourceRates();

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
    started.add(inputPath);
    inFlight++;
    if (inFlight > peak) peak = inFlight;

    // Long enough that anything running concurrently is still here when the
    // next job starts, short enough not to slow the suite down.
    await Future<void>.delayed(const Duration(milliseconds: 20));

    onSession?.call(started.length);
    onProgress?.call(1);
    File(outputPath).writeAsBytesSync(List.filled(16, 0));
    inFlight--;
    return const ConversionResult(ConversionOutcome.success);
  }

  @override
  Future<void> cancel(int sessionId) async {}
}

class _SilentNotifications extends NotificationService {
  _SilentNotifications() : super(FlutterLocalNotificationsPlugin());

  @override
  Future<void> init() async {}

  @override
  Future<bool> requestPermission() async => true;

  @override
  Future<void> showBatchComplete({required String title, required String body}) async {}
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

  late Directory tmp;
  late SharedPreferences prefs;
  late _OverlapConverter converter;

  // The concurrency ceiling scales with the host, so a single-core machine
  // legitimately runs everything one at a time.
  final concurrent = Platform.numberOfProcessors >= 4;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('eluna_parallel');
    converter = _OverlapConverter();

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => tmp.path,
    );

    // Auto-save would reach for the gallery plugin, which is not what these
    // tests are measuring.
    SharedPreferences.setMockInitialValues({'app.autoSaveResults': false});
    prefs = await SharedPreferences.getInstance();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      null,
    );
    if (tmp.existsSync()) tmp.deleteSync(recursive: true);
  });

  ProviderContainer boot() => ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          converterProvider.overrideWithValue(converter),
          notificationServiceProvider.overrideWithValue(_SilentNotifications()),
          foregroundServiceProvider.overrideWithValue(ForegroundService(supported: false)),
        ],
      );

  ({String path, String name}) source(String name) {
    final file = File('${tmp.path}${Platform.pathSeparator}$name')
      ..writeAsBytesSync(List.filled(64, 1));
    return (path: file.path, name: name);
  }

  Future<ProviderContainer> run(
    List<({String path, String name})> files,
    ConversionSettings settings,
  ) async {
    final container = boot();
    addTearDown(container.dispose);
    container.read(queueProvider.notifier).addFiles(files, settings);
    await container.read(queueProvider.notifier).start(_strings);
    return container;
  }

  final jpeg = ConversionSettings.defaultsFor(ContainerFormat.jpg);
  final mp4 = ConversionSettings.defaultsFor(ContainerFormat.mp4);

  test('stills encode several at a time', () async {
    await run([source('a.jpg'), source('b.jpg'), source('c.jpg'), source('d.jpg')], jpeg);

    expect(converter.started, hasLength(4));
    expect(converter.peak, greaterThan(1));
    // Deliberately capped: a photo batch must never become the thermal event a
    // video batch is.
    expect(converter.peak, lessThanOrEqualTo(3));
  }, skip: concurrent ? false : 'single-core host runs everything serially');

  test('video is still converted strictly one at a time', () async {
    await run([source('a.mov'), source('b.mov'), source('c.mov')], mp4);

    expect(converter.started, hasLength(3));
    // A transcode already saturates every core it can reach; two at once buys
    // no throughput and costs heat and battery.
    expect(converter.peak, 1);
  });

  test('an animated target is not treated as a still', () async {
    final gif = ConversionSettings.defaultsFor(ContainerFormat.gif);
    await run([source('a.gif'), source('b.gif'), source('c.gif')], gif);

    // The GIF palette pipeline is a real encode over a whole timeline.
    expect(converter.peak, 1);
  });

  test('a video behind a run of stills waits for them', () async {
    final container = boot();
    addTearDown(container.dispose);
    final queue = container.read(queueProvider.notifier);

    queue.addFiles([source('a.jpg'), source('b.jpg')], jpeg);
    queue.addFiles([source('c.mov')], mp4);
    await queue.start(_strings);

    // Queue order is what the user watches happen; parallelism must not
    // reorder it.
    expect(converter.started.last, endsWith('c.mov'));
    expect(container.read(queueProvider).jobs.every((j) => j.status == JobStatus.completed),
        isTrue);
  });

  test('same-named sources never resolve to the same output', () async {
    final nested = Directory('${tmp.path}${Platform.pathSeparator}sub')..createSync();
    final duplicate = File('${nested.path}${Platform.pathSeparator}photo.jpg')
      ..writeAsBytesSync(List.filled(64, 2));

    final container = await run(
      [source('photo.jpg'), (path: duplicate.path, name: 'photo.jpg')],
      jpeg,
    );

    final outputs = container.read(queueProvider).jobs.map((j) => j.outputPath).toList();
    expect(outputs, hasLength(2));
    expect(outputs.first, isNot(outputs.last));
    // Both files survive: an overwrite would leave one of them missing.
    for (final path in outputs) {
      expect(File(path!).existsSync(), isTrue, reason: path);
    }
  });
}
