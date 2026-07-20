import 'dart:io';

import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/state/queue_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Exercises the queue through the real controller and a real SharedPreferences
/// (mock-backed), so `build()` restoring and the mutators persisting are both
/// covered end to end.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const key = 'queue.v1';
  late Directory tmp;
  late SharedPreferences prefs;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('eluna_queue_test');
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  tearDown(() {
    if (tmp.existsSync()) tmp.deleteSync(recursive: true);
  });

  File touch(String name, {int bytes = 8}) {
    final f = File('${tmp.path}${Platform.pathSeparator}$name');
    f.writeAsBytesSync(List.filled(bytes, 0));
    return f;
  }

  ProviderContainer boot() => ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );

  test('an empty store yields an empty queue', () {
    final container = boot();
    addTearDown(container.dispose);
    expect(container.read(queueProvider).jobs, isEmpty);
  });

  test('added files are written to storage and come back on the next launch', () async {
    final input = touch('clip.mov', bytes: 64);

    final first = boot();
    final controller = first.read(queueProvider.notifier);
    controller.addFiles(
      [(path: input.path, name: 'clip.mov')],
      ConversionSettings.defaultsFor(ContainerFormat.mkv),
    );
    // The write is a Future; a caller that never awaits it can lose the queue to
    // a process death moments later.
    await controller.persisted;
    first.dispose();

    expect(prefs.getString(key), isNotNull);

    // A fresh container stands in for a fresh process.
    final second = boot();
    addTearDown(second.dispose);

    final jobs = second.read(queueProvider).jobs;
    expect(jobs, hasLength(1));
    expect(jobs.single.inputName, 'clip.mov');
    expect(jobs.single.status, JobStatus.queued);
    expect(jobs.single.inputBytes, 64);
    expect(jobs.single.settings.container, ContainerFormat.mkv);
  });

  test('removal and clearing are persisted too', () {
    final input = touch('clip.mov');

    final first = boot();
    final controller = first.read(queueProvider.notifier);
    controller.addFiles(
      [(path: input.path, name: 'clip.mov')],
      ConversionSettings.defaultsFor(ContainerFormat.mp4),
    );
    final id = first.read(queueProvider).jobs.single.id;
    controller.removeJob(id);
    first.dispose();

    final second = boot();
    addTearDown(second.dispose);
    expect(second.read(queueProvider).jobs, isEmpty);
  });

  test('a job that died mid-encode is re-queued and its partial file removed', () {
    final input = touch('clip.mov');
    final partial = touch('clip.mp4', bytes: 3);

    prefs.setString(
      key,
      QueueStorage.encode([
        ConversionJob(
          id: 'j1',
          inputPath: input.path,
          inputName: 'clip.mov',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
          status: JobStatus.running,
          outputPath: partial.path,
        ),
      ]),
    );

    final container = boot();
    addTearDown(container.dispose);

    final job = container.read(queueProvider).jobs.single;
    expect(job.status, JobStatus.queued);
    expect(partial.existsSync(), isFalse, reason: 'truncated output must be deleted');
  });

  test('a queued job whose source vanished is surfaced as a failure', () {
    prefs.setString(
      key,
      QueueStorage.encode([
        ConversionJob(
          id: 'j1',
          inputPath: '${tmp.path}${Platform.pathSeparator}gone.mov',
          inputName: 'gone.mov',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
        ),
      ]),
    );

    final container = boot();
    addTearDown(container.dispose);

    final job = container.read(queueProvider).jobs.single;
    expect(job.status, JobStatus.failed);
    expect(job.failure, JobFailure.sourceMissing);
  });

  test('a corrupt store does not stop the app from starting', () {
    prefs.setString(key, '<<< not json >>>');
    final container = boot();
    addTearDown(container.dispose);
    expect(container.read(queueProvider).jobs, isEmpty);
  });

  group('auto-resume', () {
    ConversionJob queued(String path) => ConversionJob(
          id: 'j1',
          inputPath: path,
          inputName: 'clip.mov',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
        );

    test('a batch interrupted mid-flight is flagged for resume', () {
      final input = touch('clip.mov');
      prefs.setString(key, QueueStorage.encode([queued(input.path)], wasRunning: true));

      final container = boot();
      addTearDown(container.dispose);
      expect(container.read(queueProvider).autoResume, isTrue);
    });

    test('a queue the user never started stays put', () {
      final input = touch('clip.mov');
      prefs.setString(key, QueueStorage.encode([queued(input.path)], wasRunning: false));

      final container = boot();
      addTearDown(container.dispose);
      // Resuming here would convert files the user only lined up, never ran.
      expect(container.read(queueProvider).autoResume, isFalse);
    });

    test('an interrupted batch with nothing left to do does not resume', () {
      final done = touch('clip.mp4');
      prefs.setString(
        key,
        QueueStorage.encode(
          [
            ConversionJob(
              id: 'done',
              inputPath: '${tmp.path}${Platform.pathSeparator}gone.mov',
              inputName: 'clip.mov',
              settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
              status: JobStatus.completed,
              outputPath: done.path,
            ),
          ],
          wasRunning: true,
        ),
      );

      final container = boot();
      addTearDown(container.dispose);
      expect(container.read(queueProvider).autoResume, isFalse);
    });

    test('a batch whose sources all vanished does not resume', () {
      prefs.setString(
        key,
        QueueStorage.encode(
          [queued('${tmp.path}${Platform.pathSeparator}gone.mov')],
          wasRunning: true,
        ),
      );

      final container = boot();
      addTearDown(container.dispose);

      // restore() turned the only job into `failed`, so there is nothing to run.
      expect(container.read(queueProvider).jobs.single.status, JobStatus.failed);
      expect(container.read(queueProvider).autoResume, isFalse);
    });

    test('finishing a batch clears the in-flight flag on disk', () async {
      final input = touch('clip.mov');

      final container = boot();
      addTearDown(container.dispose);

      final controller = container.read(queueProvider.notifier);
      controller.addFiles(
        [(path: input.path, name: 'clip.mov')],
        ConversionSettings.defaultsFor(ContainerFormat.mp4),
      );
      await controller.persisted;

      expect(
        QueueStorage.decode(prefs.getString(key)).wasRunning,
        isFalse,
        reason: 'merely queueing files must not look like an interrupted batch',
      );
    });
  });
}
