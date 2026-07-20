import 'dart:convert';

import '../domain/conversion_job.dart';

/// What was on disk: the queue, plus whether a batch was mid-flight.
class StoredQueue {
  const StoredQueue({required this.jobs, required this.wasRunning});

  final List<ConversionJob> jobs;

  /// True when the last thing written happened while a batch was converting —
  /// i.e. the process was killed rather than the batch finishing. This is the
  /// only signal that distinguishes "resume this" from "the user built a queue
  /// and never pressed Convert".
  final bool wasRunning;

  static const empty = StoredQueue(jobs: [], wasRunning: false);
}

/// Serialises the batch queue and repairs it on the way back in.
///
/// Everything here is pure: file existence and deletion are injected, so the
/// restore rules can be exercised on the host VM.
abstract final class QueueStorage {
  /// Bumped whenever the on-disk shape changes incompatibly. A mismatch drops
  /// the stored queue rather than half-reading it.
  static const schemaVersion = 1;

  static String encode(List<ConversionJob> jobs, {bool wasRunning = false}) => jsonEncode({
        'version': schemaVersion,
        'running': wasRunning,
        'jobs': [for (final j in jobs) j.toJson()],
      });

  /// Returns an empty queue for anything unreadable — a corrupt store must never
  /// stop the app from launching.
  static StoredQueue decode(String? raw) {
    if (raw == null || raw.isEmpty) return StoredQueue.empty;

    Object? parsed;
    try {
      parsed = jsonDecode(raw);
    } on FormatException {
      return StoredQueue.empty;
    }

    if (parsed is! Map) return StoredQueue.empty;
    if (parsed['version'] != schemaVersion) return StoredQueue.empty;

    final jobs = parsed['jobs'];
    if (jobs is! List) return StoredQueue.empty;

    return StoredQueue(
      // Absent in entries written before auto-resume existed, which is exactly
      // the conservative answer: do not start converting on their behalf.
      wasRunning: parsed['running'] == true,
      jobs: [
        for (final entry in jobs)
          if (ConversionJob.fromJson(entry) case final job?) job,
      ],
    );
  }

  /// Reconciles a decoded queue with the filesystem as it is *now*.
  ///
  /// Three things can have changed while the process was dead:
  ///
  /// * A job was mid-encode. Its output is a truncated, unplayable file, so it
  ///   is deleted and the job is re-queued from the start. FFmpeg cannot resume
  ///   a partial encode, and no sessions survive the process anyway.
  /// * A source file vanished. Picked files are copies in a cache directory the
  ///   system is free to purge, so this is expected rather than exceptional; the
  ///   job is failed with a reason the UI can translate.
  /// * A finished job's output was moved or deleted by the user. There is
  ///   nothing left to share, so the row is dropped instead of offering a
  ///   button that cannot work.
  static List<ConversionJob> restore(
    List<ConversionJob> jobs, {
    required bool Function(String path) exists,
    required void Function(String path) delete,
  }) {
    final restored = <ConversionJob>[];

    for (final job in jobs) {
      var current = job;

      if (current.status == JobStatus.running) {
        final partial = current.outputPath;
        if (partial != null && exists(partial)) delete(partial);
        current = current.copyWith(status: JobStatus.queued, progress: 0, clearSession: true);
      }

      if (current.status == JobStatus.completed) {
        final output = current.outputPath;
        if (output == null || !exists(output)) continue;
        restored.add(current);
        continue;
      }

      if (!current.status.isTerminal && !exists(current.inputPath)) {
        restored.add(current.copyWith(
          status: JobStatus.failed,
          failure: JobFailure.sourceMissing,
        ));
        continue;
      }

      restored.add(current);
    }

    return restored;
  }
}
