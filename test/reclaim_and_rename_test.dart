import 'dart:io';

import 'package:eluna_media/core/converter.dart';
import 'package:eluna_media/core/output_paths.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/services/foreground_service.dart';
import 'package:eluna_media/services/media_saver.dart';
import 'package:eluna_media/services/notification_service.dart';
import 'package:eluna_media/services/original_media.dart';
import 'package:eluna_media/state/app_meta_controller.dart';
import 'package:eluna_media/state/queue_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _StubConverter extends FFmpegConverter {
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
    File(outputPath).writeAsBytesSync(List.filled(16, 0));
    return const ConversionResult(ConversionOutcome.success);
  }

  @override
  Future<void> cancel(int sessionId) async {}
}

/// Stands in for the gallery so `savedTo` gets stamped without a plugin.
class _FakeSaver extends MediaSaver {
  @override
  Future<SaveDestination> save({
    required String path,
    required String name,
    required MediaKind kind,
  }) async =>
      SaveDestination.gallery;
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

/// Answers as the platform would, without a platform. [deleteIndices] chooses
/// which of the requested items "the user approved".
class _FakeOriginalMedia implements OriginalMediaService {
  _FakeOriginalMedia({this.deleteIndices, this.cancelled = false});

  final List<int>? deleteIndices;
  final bool cancelled;

  final calls = <List<OriginalRef>>[];

  @override
  Future<ReclaimOutcome> delete(List<OriginalRef> items) async {
    calls.add(items);
    if (cancelled) return const ReclaimOutcome(cancelled: true);
    final chosen = deleteIndices ?? [for (var i = 0; i < items.length; i++) i];
    final ids = <String>{};
    var freed = 0;
    for (final index in chosen) {
      if (index < 0 || index >= items.length) continue;
      if (ids.add(items[index].jobId)) freed += items[index].bytes;
    }
    return ReclaimOutcome(deletedJobIds: ids, freedBytes: freed);
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

  late Directory tmp;
  late SharedPreferences prefs;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('eluna_reclaim');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => tmp.path,
    );
    // Saving would reach for the gallery plugin; these tests stamp savedTo
    // themselves where they need it.
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

  ProviderContainer boot({OriginalMediaService? media}) => ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          converterProvider.overrideWithValue(_StubConverter()),
          notificationServiceProvider.overrideWithValue(_SilentNotifications()),
          foregroundServiceProvider.overrideWithValue(ForegroundService(supported: false)),
          mediaSaverProvider.overrideWithValue(_FakeSaver()),
          if (media != null) originalMediaProvider.overrideWithValue(media),
        ],
      );

  ({String path, String name}) source(String name, {int bytes = 64}) {
    final file = File('${tmp.path}${Platform.pathSeparator}$name')
      ..writeAsBytesSync(List.filled(bytes, 1));
    return (path: file.path, name: name);
  }

  group('renaming the output', () {
    test('a renamed job writes its file under the new name', () async {
      final container = boot();
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      queue.addFiles([source('VID_0001.mp4')], const ConversionSettings(container: ContainerFormat.mp4));
      final id = container.read(queueProvider).jobs.single.id;
      queue.renameOutput(id, 'Holiday clip');

      await queue.start(_strings);

      final job = container.read(queueProvider).jobs.single;
      expect(job.status, JobStatus.completed);
      expect(OutputPaths.fileName(job.outputPath!), 'Holiday clip.mp4');
    });

    test('a typed extension is dropped rather than doubled', () async {
      final container = boot();
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      queue.addFiles([source('VID_0002.mp4')], const ConversionSettings(container: ContainerFormat.mp4));
      final id = container.read(queueProvider).jobs.single.id;
      queue.renameOutput(id, 'clip.mp4');

      expect(container.read(queueProvider).jobs.single.outputName, 'clip');
    });

    test('illegal characters are replaced, and a blank name restores the default', () {
      final container = boot();
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      queue.addFiles([source('VID_0003.mp4')], const ConversionSettings(container: ContainerFormat.mp4));
      final id = container.read(queueProvider).jobs.single.id;

      queue.renameOutput(id, 'a/b:c');
      expect(container.read(queueProvider).jobs.single.outputName, 'a_b_c');

      queue.renameOutput(id, '   ');
      expect(container.read(queueProvider).jobs.single.outputName, isNull);
    });

    test('a finished job cannot be renamed — its file already exists', () async {
      final container = boot();
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      queue.addFiles([source('VID_0004.mp4')], const ConversionSettings(container: ContainerFormat.mp4));
      await queue.start(_strings);

      final id = container.read(queueProvider).jobs.single.id;
      queue.renameOutput(id, 'too late');
      expect(container.read(queueProvider).jobs.single.outputName, isNull);
    });
  });

  group('which originals may be offered for deletion', () {
    ConversionJob job({
      required String id,
      JobStatus status = JobStatus.completed,
      SavedTo? savedTo = SavedTo.gallery,
      bool originalDeleted = false,
      List<String> extraInputs = const [],
      int inputBytes = 100,
    }) =>
        ConversionJob(
          id: id,
          inputPath: '/tmp/$id.mp4',
          inputName: '$id.mp4',
          settings: const ConversionSettings(container: ContainerFormat.mp4),
          status: status,
          savedTo: savedTo,
          originalDeleted: originalDeleted,
          extraInputPaths: extraInputs,
          inputBytes: inputBytes,
        );

    test('only completed, saved, undeleted, non-merge jobs qualify', () {
      final state = QueueState(jobs: [
        job(id: 'ok'),
        job(id: 'unfinished', status: JobStatus.queued),
        job(id: 'failed', status: JobStatus.failed),
        // The result is still inside the sandbox, where no file manager can
        // reach it — deleting the source would strand the user.
        job(id: 'unsaved', savedTo: null),
        job(id: 'already', originalDeleted: true),
        // A merge has N sources and one display name; none of them can be
        // looked up safely.
        job(id: 'merged', extraInputs: const ['/tmp/b.mp4']),
        job(id: 'sizeless', inputBytes: 0),
      ]);

      expect([for (final j in state.reclaimable) j.id], ['ok']);
    });
  });

  group('reclaiming originals', () {
    /// Runs a batch with auto-save on, so the jobs come out saved — which is
    /// what `reclaimable` insists on before it will offer anything.
    Future<ProviderContainer> converted(
      _FakeOriginalMedia media,
      List<({String path, String name})> files,
    ) async {
      SharedPreferences.setMockInitialValues({'app.autoSaveResults': true});
      final saving = await SharedPreferences.getInstance();
      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(saving),
          converterProvider.overrideWithValue(_StubConverter()),
          notificationServiceProvider.overrideWithValue(_SilentNotifications()),
          foregroundServiceProvider.overrideWithValue(ForegroundService(supported: false)),
          mediaSaverProvider.overrideWithValue(_FakeSaver()),
          originalMediaProvider.overrideWithValue(media),
        ],
      );
      final queue = container.read(queueProvider.notifier);
      queue.addFiles(files, const ConversionSettings(container: ContainerFormat.mp4));
      await queue.start(_strings);
      return container;
    }

    test('deleted sources are marked, counted once, and not offered again', () async {
      final media = _FakeOriginalMedia();
      final container = await converted(media, [source('a.mp4', bytes: 30), source('b.mp4', bytes: 70)]);
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      final ids = [for (final j in container.read(queueProvider).reclaimable) j.id];
      expect(ids, hasLength(2));

      final outcome = await queue.reclaimOriginals(ids);
      expect(outcome.deletedCount, 2);
      expect(outcome.freedBytes, 100);
      expect(container.read(appMetaProvider).reclaimedBytes, 100);
      expect(container.read(queueProvider).reclaimable, isEmpty);

      // Asking again finds nothing left to ask about.
      final again = await queue.reclaimOriginals(ids);
      expect(again.deletedCount, 0);
      expect(container.read(appMetaProvider).reclaimedBytes, 100);
    });

    test('a partial answer marks only what the platform actually deleted', () async {
      final media = _FakeOriginalMedia(deleteIndices: [1]);
      final container = await converted(media, [source('c.mp4', bytes: 30), source('d.mp4', bytes: 70)]);
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      final ids = [for (final j in container.read(queueProvider).reclaimable) j.id];
      final outcome = await queue.reclaimOriginals(ids);

      expect(outcome.freedBytes, 70);
      expect(container.read(queueProvider).reclaimable, hasLength(1));
      expect(container.read(appMetaProvider).reclaimedBytes, 70);
    });

    test('a cancelled dialog changes nothing', () async {
      final media = _FakeOriginalMedia(cancelled: true);
      final container = await converted(media, [source('e.mp4')]);
      addTearDown(container.dispose);
      final queue = container.read(queueProvider.notifier);

      final ids = [for (final j in container.read(queueProvider).reclaimable) j.id];
      final outcome = await queue.reclaimOriginals(ids);

      expect(outcome.cancelled, isTrue);
      expect(outcome.deletedCount, 0);
      expect(container.read(queueProvider).reclaimable, hasLength(1));
      expect(container.read(appMetaProvider).reclaimedBytes, 0);
    });
  });

  group('the channel reply', () {
    test('indices map back to jobs, and a repeated job is counted once', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('eluna/share_intake'),
        (call) async => {'deleted': [0, 2, 2, 9, -1], 'cancelled': false},
      );
      addTearDown(() {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(const MethodChannel('eluna/share_intake'), null);
      });

      const service = ChannelOriginalMediaService();
      final outcome = await service.delete(const [
        OriginalRef(jobId: 'a', name: 'a.mp4', bytes: 10),
        OriginalRef(jobId: 'b', name: 'b.mp4', bytes: 20),
        OriginalRef(jobId: 'c', name: 'c.mp4', bytes: 40),
      ]);

      // Out-of-range indices are ignored rather than trusted.
      expect(outcome.deletedJobIds, {'a', 'c'});
      expect(outcome.freedBytes, 50);
    });

    test('a platform without the method reports unsupported, not failure', () async {
      const service = ChannelOriginalMediaService();
      final outcome = await service.delete(const [
        OriginalRef(jobId: 'a', name: 'a.mp4', bytes: 10),
      ]);
      expect(outcome.unsupported, isTrue);
      expect(outcome.deletedCount, 0);
    });
  });
}
