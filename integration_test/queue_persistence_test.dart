import 'dart:io';

import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/state/queue_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Proves the queue reaches the device's own storage.
///
/// The trap this avoids: SharedPreferences keeps an in-memory cache, so reading
/// a value straight back after writing it proves nothing about the disk. Every
/// assertion below goes through `reload()`, which re-reads the backing file, or
/// through a `SharedPreferences` handle obtained after that reload.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const key = 'queue.v1';

  testWidgets('a queue written by the controller is readable from disk', (tester) async {
    final docs = await getApplicationDocumentsDirectory();
    final source = File('${docs.path}/persist_source.mp4')..writeAsBytesSync(List.filled(2048, 7));
    addTearDown(() {
      if (source.existsSync()) source.deleteSync();
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);

    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    final controller = container.read(queueProvider.notifier);
    controller.addFiles(
      [(path: source.path, name: 'persist_source.mp4')],
      ConversionSettings.defaultsFor(ContainerFormat.webm),
    );

    // The write is asynchronous; without this the next reload can race it.
    await controller.persisted;

    // Drop the cache and re-read the file the platform actually wrote.
    await prefs.reload();

    final decoded = QueueStorage.decode(prefs.getString(key)).jobs;
    expect(decoded, hasLength(1), reason: 'nothing reached the SharedPreferences file');

    final job = decoded.single;
    expect(job.inputName, 'persist_source.mp4');
    expect(job.status, JobStatus.queued);
    expect(job.settings.container, ContainerFormat.webm);
    expect(job.inputBytes, 2048);
  });

  testWidgets('restore repairs a queue left behind by a killed process', (tester) async {
    final docs = await getApplicationDocumentsDirectory();
    final source = File('${docs.path}/restore_source.mp4')..writeAsBytesSync(List.filled(16, 1));
    final partial = File('${docs.path}/restore_partial.webm')..writeAsBytesSync(List.filled(4, 1));
    addTearDown(() {
      for (final f in [source, partial]) {
        if (f.existsSync()) f.deleteSync();
      }
    });

    final prefs = await SharedPreferences.getInstance();

    // Exactly the state a process death mid-encode leaves on disk.
    await prefs.setString(
      key,
      QueueStorage.encode([
        ConversionJob(
          id: 'interrupted',
          inputPath: source.path,
          inputName: 'restore_source.mp4',
          settings: ConversionSettings.defaultsFor(ContainerFormat.webm),
          status: JobStatus.running,
          outputPath: partial.path,
        ),
        ConversionJob(
          id: 'orphan',
          inputPath: '${docs.path}/deleted_by_the_system.mp4',
          inputName: 'deleted_by_the_system.mp4',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
        ),
      ]),
    );
    await prefs.reload();

    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    final jobs = container.read(queueProvider).jobs;
    expect(jobs, hasLength(2));

    final interrupted = jobs.firstWhere((j) => j.id == 'interrupted');
    expect(interrupted.status, JobStatus.queued, reason: 're-queued from the start');
    expect(partial.existsSync(), isFalse, reason: 'truncated output must be deleted from disk');

    final orphan = jobs.firstWhere((j) => j.id == 'orphan');
    expect(orphan.status, JobStatus.failed);
    expect(orphan.failure, JobFailure.sourceMissing);

    await prefs.remove(key);
  });
}
