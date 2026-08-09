import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/converter.dart';
import '../core/ffmpeg_args.dart';
import '../core/encoders.dart';
import '../core/output_paths.dart';
import '../core/queue_storage.dart';
import '../domain/conversion_job.dart';
import '../domain/conversion_settings.dart';
import '../domain/media_format.dart';
import '../services/foreground_service.dart';
import '../services/haptics.dart';
import '../services/media_saver.dart';
import '../services/notification_service.dart';
import '../services/original_media.dart';
import 'achievements_controller.dart';
import 'app_meta_controller.dart';
import 'settings_controller.dart';

final converterProvider = Provider<FFmpegConverter>((ref) => FFmpegConverter());

final notificationServiceProvider = Provider<NotificationService>(
  (ref) => NotificationService.create(),
);

final foregroundServiceProvider = Provider<ForegroundService>((ref) => ForegroundService());

/// Localised text the queue needs while it runs headless.
///
/// The controller has no `BuildContext`, so the strings are resolved by the UI
/// at the moment the user presses Convert and handed over.
class QueueStrings {
  const QueueStrings({
    required this.appTitle,
    required this.progress,
    required this.completed,
    required this.completedWithFailures,
    required this.cancelLabel,
  });

  final String appTitle;

  /// Label for the Cancel action on the ongoing notification.
  final String cancelLabel;

  /// e.g. "3 of 8 done"
  final String Function(int done, int total) progress;
  final String Function(int done) completed;
  final String Function(int done, int failed) completedWithFailures;
}

class QueueState {
  const QueueState({
    this.jobs = const [],
    this.isRunning = false,
    this.autoResume = false,
  });

  final List<ConversionJob> jobs;
  final bool isRunning;

  /// Set at launch when a batch was interrupted by process death and still has
  /// work left. Consumed once by the UI, which owns the localised strings the
  /// queue needs and can tell the user what just happened.
  final bool autoResume;

  List<ConversionJob> get pending =>
      jobs.where((j) => j.status == JobStatus.queued).toList();

  List<ConversionJob> get finished => jobs.where((j) => j.status.isTerminal).toList();

  int get completedCount => jobs.where((j) => j.status == JobStatus.completed).length;

  int get failedCount => jobs.where((j) => j.status == JobStatus.failed).length;

  bool get hasPending => pending.isNotEmpty;

  /// Jobs whose source file it is safe to offer for deletion.
  ///
  /// Three conditions, and all of them are about not stranding the user:
  ///
  /// * The job completed, so a result exists at all.
  /// * The result was saved out of the sandbox ([ConversionJob.savedTo]). The
  ///   app's own folder is unreachable from any file manager, so deleting the
  ///   original while the only copy lives there would hand the user a file they
  ///   cannot open and take away the one they could.
  /// * The source has not already been deleted.
  ///
  /// Merges are excluded. Their [ConversionJob.inputName] is a display name for
  /// N sources rather than any real file, and the media library is looked up by
  /// name — offering to delete "3 clips" while only being able to name one of
  /// them is exactly the kind of guess this feature must never make.
  List<ConversionJob> get reclaimable => [
        for (final j in jobs)
          if (j.status == JobStatus.completed &&
              j.savedTo != null &&
              !j.originalDeleted &&
              !j.isMerge &&
              j.inputBytes > 0)
            j,
      ];

  /// Batch progress: finished jobs count as whole units, the running one
  /// contributes its fraction.
  double get overallProgress {
    if (jobs.isEmpty) return 0;
    final total = jobs.fold<double>(0, (sum, j) {
      if (j.status == JobStatus.completed) return sum + 1;
      if (j.status == JobStatus.running) return sum + j.progress;
      return sum;
    });
    return (total / jobs.length).clamp(0.0, 1.0);
  }

  QueueState copyWith({List<ConversionJob>? jobs, bool? isRunning, bool? autoResume}) => QueueState(
        jobs: jobs ?? this.jobs,
        isRunning: isRunning ?? this.isRunning,
        autoResume: autoResume ?? this.autoResume,
      );
}

/// Owns the batch queue and drives it **one job at a time**.
///
/// Serial execution is deliberate: FFmpeg already saturates the available cores
/// per job, and running several transcodes concurrently on a phone buys no
/// throughput while it does cost thermal headroom and battery — the single most
/// common complaint about offline converters.
class QueueController extends Notifier<QueueState> {
  static const _storageKey = 'queue.v1';

  var _idCounter = 0;
  var _cancelBatch = false;
  QueueStrings? _strings;

  /// Output paths handed to jobs that have not written their file yet. Only
  /// meaningful while stills run concurrently; see [OutputPaths.resolve].
  final _reservedOutputs = <String>{};

  /// Saves are funnelled through this so two finished stills cannot ask the
  /// platform for gallery access at the same moment — on the Androids that
  /// still prompt, that is two dialogs racing each other.
  Future<void> _saveGate = Future<void>.value();

  /// How many stills may encode at once.
  ///
  /// Three is deliberate rather than "as many as there are cores": the point is
  /// to hide process start-up and I/O latency, which two or three in flight
  /// already does, while leaving the phone enough headroom that a photo batch
  /// never becomes the thermal event a video batch is. A single-core host runs
  /// them serially, which is what the tests see.
  static int get _stillConcurrency {
    final cores = Platform.numberOfProcessors;
    return cores < 2 ? 1 : (cores < 4 ? 2 : 3);
  }

  /// The run of pending stills at the head of the queue, up to the concurrency
  /// limit. Stops at the first job that is not one, so queue order is still
  /// what the user sees happen.
  List<ConversionJob> _nextStillBatch() {
    final batch = <ConversionJob>[];
    for (final job in state.pending) {
      if (!_isStill(job)) break;
      batch.add(job);
      if (batch.length >= _stillConcurrency) break;
    }
    return batch;
  }

  /// A single frame in, a single frame out. An animated GIF target goes down
  /// the palette pipeline, which is a real encode over a whole timeline, and a
  /// merge is never a still no matter what it is writing.
  static bool _isStill(ConversionJob job) =>
      job.settings.container.kind == MediaKind.image &&
      !job.settings.container.isAnimatedImage &&
      !job.isMerge;

  @override
  QueueState build() {
    final stored = QueueStorage.decode(ref.read(sharedPreferencesProvider).getString(_storageKey));
    final jobs = QueueStorage.restore(
      stored.jobs,
      exists: (p) => File(p).existsSync(),
      delete: _deletePartial,
    );

    // Only offer to resume a batch that was actually converting when the process
    // died, and only if repairing the queue left something to convert. A job
    // whose source vanished is now `failed`, not `queued`, so a queue of nothing
    // but corpses will not restart itself.
    final resumable = jobs.any((j) => j.status == JobStatus.queued);

    // Anything in the output folder that no restored job points at is dead
    // weight: the file of a job the user removed, or of a batch that died
    // before its entry was written. Nobody can see or reach these — the folder
    // is inside the sandbox — so left alone they accumulate until the app is
    // several gigabytes of "app data". Unawaited: reclaiming space is not
    // something the first frame should wait on.
    // ignore: discarded_futures
    sweepOrphanedOutputs(jobs);

    return QueueState(jobs: jobs, autoResume: stored.wasRunning && resumable);
  }

  /// Deletes outputs no queue entry refers to, and returns the bytes freed.
  Future<int> sweepOrphanedOutputs([List<ConversionJob>? jobs]) {
    final keep = <String>{
      for (final job in jobs ?? state.jobs)
        if (job.outputPath case final path?) path,
    };
    return OutputPaths.deleteOrphans(keep);
  }

  /// Removes a finished job's output from disk. Called once the user's chance
  /// to undo the removal has passed — deleting on the spot would leave undo
  /// restoring a card whose file no longer exists.
  void purgeOutputs(List<ConversionJob> jobs) {
    final live = {for (final j in state.jobs) j.id};
    for (final job in jobs) {
      // Undo put it back; its file has to stay.
      if (live.contains(job.id)) continue;
      if (job.outputPath case final path?) _deletePartial(path);
    }
  }

  Future<void>? _pendingWrite;

  /// Resolves once the most recent [_persist] has reached the platform. The
  /// point of persisting is to survive process death, so callers that can wait
  /// for the write should, and tests must.
  Future<void> get persisted => _pendingWrite ?? Future<void>.value();

  /// Called only on structural changes. Progress deliberately does not persist:
  /// writing on every FFmpeg statistics callback would hammer storage to record
  /// a number that a restored job discards anyway.
  Future<void> _persist() {
    final write = ref.read(sharedPreferencesProvider).setString(
          _storageKey,
          // `isRunning` is what a later launch reads to decide whether the batch
          // was interrupted or simply finished.
          QueueStorage.encode(state.jobs, wasRunning: state.isRunning),
        );
    return _pendingWrite = write;
  }

  String _nextId() => 'job_${DateTime.now().microsecondsSinceEpoch}_${_idCounter++}';

  void addFiles(List<({String path, String name})> files, ConversionSettings settings) {
    final added = files.map((f) {
      var size = 0;
      try {
        size = File(f.path).lengthSync();
      } on FileSystemException {
        size = 0;
      }
      return ConversionJob(
        id: _nextId(),
        inputPath: f.path,
        inputName: f.name,
        settings: settings,
        inputBytes: size,
      );
    });
    final jobs = added.toList();
    state = state.copyWith(jobs: [...state.jobs, ...jobs]);
    _persist();

    // Durations arrive lazily so adding files never blocks on ffprobe. The
    // Convert tab uses them for output-size estimates; the encode itself
    // re-probes and does not depend on this.
    for (final job in jobs) {
      _probeDuration(job.id);
    }
  }

  Future<void> _probeDuration(String id) async {
    int? ms;
    try {
      final job = _find(id);
      if (job == null) return;
      ms = await ref.read(converterProvider).probeDurationMs(job.inputPath);
    } catch (_) {
      return; // No probe on this platform/test host; estimates just stay off.
    }
    // The probe outlives the provider when the app (or a test) tears down
    // mid-flight; touching `state` then throws.
    if (!ref.mounted) return;

    final current = _find(id);
    if (ms != null && current != null && current.status == JobStatus.queued) {
      _replace(current.copyWith(sourceDurationMs: ms));
    }
  }

  void removeJob(String id) {
    final job = _find(id);
    if (job == null || job.status.isActive) return;
    state = state.copyWith(jobs: state.jobs.where((j) => j.id != id).toList());
    _persist();
  }

  void clearFinished() {
    state = state.copyWith(
      jobs: state.jobs.where((j) => !j.status.isTerminal).toList(),
    );
    _persist();
  }

  void clearAll() {
    if (state.isRunning) return;
    state = const QueueState();
    _persist();
  }

  /// Стирает очередь целиком — часть «удалить все мои данные».
  ///
  /// Отдельный метод, а не [clearAll]: тот намеренно ничего не делает во время
  /// пакета, потому что вычистить список из-под работающего FFmpeg — это
  /// осиротевшие сессии и файлы, которые уже никто не удалит. Здесь пакет
  /// сначала отменяется, и только потом список исчезает. Сами файлы удаляет
  /// свой стиратель (папка вывода), поэтому здесь только список.
  Future<void> eraseAll() async {
    if (state.isRunning) await cancelBatch();
    state = const QueueState();
    await _persist();
  }

  /// Names the result of a still-queued job.
  ///
  /// Queued only, on purpose. Once the encode has run, the file exists — and
  /// with auto-save on, a copy of it is already in the gallery under the old
  /// name. Renaming then would either lie about the saved copy or start a
  /// second export, and neither is what "rename" means to anyone.
  ///
  /// A blank name restores the default (name the output after the source).
  void renameOutput(String id, String name) {
    final job = _find(id);
    if (job == null || job.status != JobStatus.queued) return;

    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      _replace(job.copyWith(clearOutputName: true));
    } else {
      // The same sanitiser the output path uses, applied here so the queue card
      // shows the name that will really be on disk rather than the one that was
      // typed. It also strips a typed extension, which is why "clip.mp4" comes
      // out as "clip" and still lands as clip.mp4.
      _replace(job.copyWith(outputName: OutputPaths.sanitiseBaseName(trimmed)));
    }
    _persist();
  }

  /// Hands the sources of [jobIds] to the operating system's delete flow and
  /// records what actually went.
  ///
  /// The app deletes nothing itself: Android raises `createDeleteRequest` and
  /// iOS raises `PHPhotoLibrary`, both of which show the user the real items
  /// and wait for approval. Whatever comes back as deleted is marked so the
  /// offer is not repeated, and the reclaimed bytes are added to the lifetime
  /// counter — the number that makes "compress to free space" visible.
  Future<ReclaimOutcome> reclaimOriginals(List<String> jobIds) async {
    final wanted = jobIds.toSet();
    final items = [
      for (final job in state.reclaimable)
        if (wanted.contains(job.id))
          OriginalRef(jobId: job.id, name: job.inputName, bytes: job.inputBytes),
    ];
    if (items.isEmpty) return const ReclaimOutcome();

    final outcome = await ref.read(originalMediaProvider).delete(items);
    // The dialog is a whole trip through another process; the provider can be
    // gone by the time it comes back.
    if (!ref.mounted || outcome.deletedJobIds.isEmpty) return outcome;

    state = state.copyWith(jobs: [
      for (final job in state.jobs)
        if (outcome.deletedJobIds.contains(job.id))
          job.copyWith(originalDeleted: true)
        else
          job,
    ]);
    ref.read(appMetaProvider.notifier).addReclaimedBytes(outcome.freedBytes);
    await _persist();
    return outcome;
  }

  /// Collapses all pending jobs into one merge job that concatenates them in
  /// the order they were added. No-op below two files.
  void mergePending(ConversionSettings settings, String displayName) {
    final pending = state.pending;
    if (pending.length < 2) return;

    final merged = ConversionJob(
      id: _nextId(),
      inputPath: pending.first.inputPath,
      inputName: displayName,
      settings: settings,
      inputBytes: pending.fold(0, (sum, j) => sum + j.inputBytes),
      extraInputPaths: [for (final j in pending.skip(1)) j.inputPath],
    );

    final pendingIds = {for (final j in pending) j.id};
    state = state.copyWith(
      jobs: [
        for (final j in state.jobs)
          if (!pendingIds.contains(j.id)) j,
        merged,
      ],
    );
    _persist();
  }

  /// Moves a pending job one place earlier (-1) or later (+1) among the other
  /// pending ones.
  ///
  /// Merge concatenates in queue order, and the system picker hands files back
  /// in whatever order it likes — usually by date, never by the order they were
  /// tapped. Without this, fixing the order of a merge meant emptying the
  /// queue and adding the clips again one at a time.
  void movePending(String id, int delta) {
    final jobs = [...state.jobs];
    final slots = [
      for (var i = 0; i < jobs.length; i++)
        if (jobs[i].status == JobStatus.queued) i,
    ];
    final from = slots.indexWhere((i) => jobs[i].id == id);
    if (from < 0) return;
    final to = from + delta;
    if (to < 0 || to >= slots.length) return;

    // Swapping the *slots* rather than the list positions leaves any finished
    // jobs interleaved between them exactly where they were.
    final a = slots[from];
    final b = slots[to];
    final held = jobs[a];
    jobs[a] = jobs[b];
    jobs[b] = held;

    state = state.copyWith(jobs: jobs);
    _persist();
  }

  /// Applies new settings to every job that has not started yet.
  void updatePendingSettings(ConversionSettings settings) =>
      updatePendingSettingsPerFile((_) => settings);

  /// Per-file variant: the resolver sees each queued job and returns the
  /// profile for it. A mixed selection (photos *and* videos) must not force
  /// one profile onto both — that is how a photo ends up being "compressed"
  /// as a video.
  void updatePendingSettingsPerFile(
    ConversionSettings Function(ConversionJob job) resolve,
  ) {
    state = state.copyWith(
      jobs: [
        for (final j in state.jobs)
          j.status == JobStatus.queued ? j.copyWith(settings: resolve(j)) : j,
      ],
    );
    _persist();
  }

  /// Reinstates jobs that an undo wants back. Only terminal jobs can have been
  /// removed, so re-appending them cannot collide with the run loop.
  void restoreJobs(List<ConversionJob> jobs) {
    if (jobs.isEmpty) return;
    final existing = state.jobs.map((j) => j.id).toSet();
    final restored = jobs.where((j) => !existing.contains(j.id)).toList();
    if (restored.isEmpty) return;
    state = state.copyWith(jobs: [...state.jobs, ...restored]);
    _persist();
  }

  /// Puts a failed or cancelled job back in line, from scratch. The output of
  /// the failed attempt was already deleted when the job reached its terminal
  /// state.
  void retryJob(String id) {
    final job = _find(id);
    if (job == null || !(job.status == JobStatus.failed || job.status == JobStatus.cancelled)) {
      return;
    }
    _replace(job.copyWith(
      status: JobStatus.queued,
      progress: 0,
      clearError: true,
      clearSession: true,
    ));
    _persist();
  }

  ConversionJob? _find(String id) {
    for (final j in state.jobs) {
      if (j.id == id) return j;
    }
    return null;
  }

  void _replace(ConversionJob updated) {
    state = state.copyWith(
      jobs: [
        for (final j in state.jobs) j.id == updated.id ? updated : j,
      ],
    );
  }

  Future<void> cancelJob(String id) async {
    final job = _find(id);
    if (job == null || job.status.isTerminal) return;

    if (job.status == JobStatus.running && job.sessionId != null) {
      // The FFmpeg completion callback reports `cancel`, and the run loop turns
      // that into the terminal state. Nothing to set here.
      await ref.read(converterProvider).cancel(job.sessionId!);
      return;
    }
    _replace(job.copyWith(status: JobStatus.cancelled, clearSession: true));
    await _persist();
  }

  Future<void> cancelBatch() async {
    _cancelBatch = true;
    for (final job in state.jobs) {
      if (job.status == JobStatus.queued) {
        _replace(job.copyWith(status: JobStatus.cancelled));
      }
    }
    await _persist();

    final running = state.jobs.where((j) => j.status.isActive).toList();
    for (final job in running) {
      if (job.sessionId != null) {
        await ref.read(converterProvider).cancel(job.sessionId!);
      }
    }
  }

  /// Processes every queued job in order. Safe to call while already running —
  /// it returns immediately.
  Future<void> start(QueueStrings strings) async {
    if (state.isRunning) return;
    if (!state.hasPending) return;

    _cancelBatch = false;
    _strings = strings;
    state = state.copyWith(isRunning: true, autoResume: false);

    final completedBefore = state.completedCount;
    final completedIdsBefore = {
      for (final j in state.jobs)
        if (j.status == JobStatus.completed) j.id,
    };
    ref.read(hapticsProvider).batchStarted();

    // Record "a batch is in flight" before any long work, so a process killed
    // even during the first job is recognised as interrupted on the next launch.
    await _persist();

    final notifications = ref.read(notificationServiceProvider);
    await notifications.requestPermission();

    final foreground = ref.read(foregroundServiceProvider);
    final converter = ref.read(converterProvider);

    // Transcoding is the longest, hottest thing the phone does, and the person
    // who wants to stop it is usually not in the app — they are watching the
    // battery drop from somewhere else. The notification's Cancel action lands
    // here.
    foreground.onCancelRequested = cancelBatch;
    foreground.bindCancelHandler();

    // Started while the app is still in the foreground, which is what Android
    // requires for a dataSync service.
    await foreground.start(
      title: strings.appTitle,
      text: strings.progress(state.completedCount, state.jobs.length),
      cancelLabel: strings.cancelLabel,
      progress: state.overallProgress,
    );

    try {
      while (!_cancelBatch) {
        final next = state.pending.firstOrNull;
        if (next == null) break;

        // Stills are the exception to the one-at-a-time rule. A transcode
        // already saturates every core it can reach, so running two costs heat
        // and buys nothing — but a JPEG encode is milliseconds of work that
        // leaves the CPU mostly idle, and a batch of two hundred photos spent
        // most of its wall-clock waiting for FFmpeg to start up again. Video
        // and audio still go strictly in order.
        final stills = _nextStillBatch();
        if (stills.length > 1) {
          await Future.wait([
            for (final job in stills) _runJob(job.id, converter),
          ]);
        } else {
          await _runJob(next.id, converter);
        }
      }
    } finally {
      // Reservations only guard concurrent name resolution inside one batch;
      // afterwards the files themselves are on disk and speak for themselves.
      _reservedOutputs.clear();
      // The service must come down even if a job threw, or the notification
      // sticks around forever and the process stays pinned.
      await foreground.stop();
      state = state.copyWith(isRunning: false);
      // Clears the interrupted flag: the batch ended on its own terms, so the
      // next launch must not resume it.
      await _persist();
    }

    // Lifetime success counter feeds the review milestones; the buzz reports
    // the batch's outcome without the user having to look.
    final newlyCompleted = state.completedCount - completedBefore;
    ref.read(appMetaProvider.notifier).recordSuccessfulConversions(newlyCompleted);

    // Achievements ingest exactly the jobs this run finished; the toast host
    // watches freshUnlocksProvider and celebrates whatever comes back.
    final batchJobs = [
      for (final j in state.jobs)
        if (j.status == JobStatus.completed && !completedIdsBefore.contains(j.id)) j,
    ];
    final unlocks = ref.read(achievementsProvider.notifier).recordBatch(batchJobs);
    ref.read(freshUnlocksProvider.notifier).publish(unlocks);
    final haptics = ref.read(hapticsProvider);
    if (state.failedCount > 0) {
      haptics.batchFailed();
    } else if (newlyCompleted > 0) {
      haptics.batchSucceeded();
    }

    await _notifyBatchDone(notifications, strings);

    if (ref.read(appPrefsProvider).deleteOriginalsAfterConversion) {
      await _offerToDeleteOriginals(batchJobs);
    }
  }

  /// The automatic half of "delete originals": ask, once, for the sources this
  /// batch just converted.
  ///
  /// Only while the app is actually on screen. The confirmation belongs to the
  /// system, and Android will not let a backgrounded app raise it anyway — but
  /// even where it would work, a phone that throws up a delete dialog while its
  /// owner is in another app has earned every bit of the panic that follows.
  /// A batch finished in the background simply leaves the button on the
  /// Finished tab, which is where the manual path already lives.
  Future<void> _offerToDeleteOriginals(List<ConversionJob> batchJobs) async {
    if (WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      return;
    }
    final ids = {for (final j in batchJobs) j.id};
    final eligible = [
      for (final job in state.reclaimable)
        if (ids.contains(job.id)) job.id,
    ];
    if (eligible.isEmpty) return;
    await reclaimOriginals(eligible);
  }

  /// Mirrors batch progress into the foreground notification.
  Future<void> _syncForeground() async {
    final strings = _strings;
    if (strings == null || !state.isRunning) return;
    await ref.read(foregroundServiceProvider).update(
          title: strings.appTitle,
          text: strings.progress(state.completedCount, state.jobs.length),
          progress: state.overallProgress,
        );
  }

  Future<void> _runJob(String id, FFmpegConverter converter) async {
    var job = _find(id);
    if (job == null) return;

    final outputPath = await OutputPaths.resolve(
      inputFileName: job.outputName ?? job.inputName,
      extension: job.settings.container.extension,
      reserved: _reservedOutputs,
    );
    // Claimed before the first await that follows, so a sibling still resolving
    // the same source name in parallel is handed " (1)" rather than the same
    // path and a silent overwrite.
    _reservedOutputs.add(outputPath);

    // Stills have no timeline, so FFmpeg's `time=` statistic cannot drive a
    // percentage; the UI shows an indeterminate bar for them instead. A merge
    // progresses over the *sum* of its inputs; one unknown input makes the
    // total unknowable, and the bar honestly goes indeterminate. Per-input
    // audio presence feeds the concat graph — a silent clip must be padded
    // with silence, not crash the whole merge.
    int? durationMs;
    final mergeDurations = <int?>[];
    final mergeHasAudio = <bool?>[];
    if (job.settings.container.kind != MediaKind.image ||
        job.settings.container.isAnimatedImage) {
      durationMs = await converter.probeDurationMs(job.inputPath);
      if (job.isMerge) {
        mergeDurations.add(durationMs);
        mergeHasAudio.add(await converter.probeHasAudio(job.inputPath));
        var total = durationMs;
        for (final extra in job.extraInputPaths) {
          final extraMs = await converter.probeDurationMs(extra);
          mergeDurations.add(extraMs);
          mergeHasAudio.add(await converter.probeHasAudio(extra));
          total = (total == null || extraMs == null) ? null : total + extraMs;
        }
        durationMs = total;
      }
    }
    // Probing is async and can outlive the provider if the app tears down
    // mid-batch; from here on `state` would throw.
    if (!ref.mounted) return;

    // What the progress bar divides by is the duration of what will be
    // *encoded*: a trim shortens it, an active speed change compresses it.
    // The raw duration still goes to the bitrate maths separately.
    int? progressMs = durationMs;
    final trim = job.settings.trim;
    if (!job.isMerge && trim != null && trim.isValid) progressMs = trim.durationMs;
    if (progressMs != null && FFmpegArgs.speedActive(job.settings)) {
      progressMs = (progressMs / job.settings.speed.factor).round();
    }

    job = _find(id);
    if (job == null || job.status.isTerminal) return;

    // outputPath is committed *before* the encode so that, if the process dies
    // mid-job, the next launch knows which truncated file to delete.
    _replace(job.copyWith(
      status: JobStatus.running,
      progress: 0,
      outputPath: outputPath,
      sourceDurationMs: durationMs,
      // Anchors the time-remaining estimate. Transient by design: a restored
      // job starts from zero, and a stale start time would make the first
      // estimate absurd.
      startedAtMs: DateTime.now().millisecondsSinceEpoch,
      clearError: true,
    ));
    await _persist();

    // What the source spent per stream is the ceiling a constant-quality
    // encode must not exceed, or "compressing" an already-efficient video
    // inflates it.
    final sourceRates = job.isMerge
        ? const SourceRates()
        : await converter.probeRates(job.inputPath);
    if (!ref.mounted) return;

    final prefs = ref.read(appPrefsProvider);

    // Two-pass only when it can deliver what it promises: an opted-in user,
    // a size-mode job whose bitrate is actually computable, and H.264
    // specifically — libx265 routes its stats through `-x265-params`, not
    // ffmpeg's generic pass plumbing, and would fail trying to write
    // x265_2pass.log into an unwritable working directory.
    final twoPass = prefs.twoPassFitToSize &&
        !job.isMerge &&
        job.settings.rateControl == RateControl.size &&
        job.settings.videoCodec == VideoCodec.h264 &&
        FFmpegArgs.targetKbps(job.settings, durationMs) != null;

    // Hardware encoding is opportunistic: only when the user allows it, only
    // when this FFmpeg build actually has the encoder, and — enforced inside
    // the argument builder — only on bitrate-driven jobs. Two-pass overrides
    // it: pass logs are an x264/x265 concept.
    String? hwEncoder;
    if (!twoPass && prefs.useHardwareEncoder) {
      hwEncoder =
          await ref.read(encoderCatalogProvider).hardwareEncoderFor(job.settings.videoCodec);
      if (!ref.mounted) return;
    }

    Future<ConversionResult> attempt(String? hw) {
      return converter.convert(
        inputPath: job!.inputPath,
        outputPath: outputPath,
        settings: job.settings,
        totalDurationMs: durationMs,
        progressDurationMs: progressMs,
        sourceRates: sourceRates,
        hwVideoEncoder: hw,
        extraInputPaths: job.extraInputPaths,
        extraInputsHaveAudio: mergeHasAudio,
        extraInputDurationsMs: mergeDurations,
        twoPass: twoPass,
        onSession: (sessionId) {
          final current = _find(id);
          if (current == null) return;
          _replace(current.copyWith(sessionId: sessionId));
          // A cancel that arrived while the session id was still unknown had
          // nothing to kill; honour it the moment the handle exists, or the
          // "cancelled" encode burns battery to completion.
          if (_cancelBatch || current.status == JobStatus.cancelled) {
            converter.cancel(sessionId);
          }
        },
        onProgress: (p) {
          final current = _find(id);
          if (current != null && current.status.isActive) {
            _replace(current.copyWith(progress: p));
            // ForegroundService throttles this down to whole-percentage changes.
            _syncForeground();
          }
        },
      );
    }

    var result = await attempt(hwEncoder);
    if (!ref.mounted) return;

    // MediaCodec in particular fails on inputs the spec says it should take
    // (odd dimensions, exotic profiles, vendor quirks). A hardware failure is
    // an implementation detail the user should never see: clean up and run
    // the same job again on the software encoder — unless the user cancelled
    // meanwhile.
    if (hwEncoder != null &&
        result.outcome == ConversionOutcome.failed &&
        _find(id)?.status.isActive == true) {
      _deletePartial(outputPath);
      final current = _find(id);
      if (current != null) _replace(current.copyWith(progress: 0, clearSession: true));
      result = await attempt(null);
      if (!ref.mounted) return;
    }

    final current = _find(id);
    if (current == null) return;

    // A cancel can land while the session id was still unknown, marking the
    // job terminal before FFmpeg reported back. That decision stands: a
    // completed file the user cancelled is deleted, not resurrected.
    if (current.status.isTerminal) {
      _deletePartial(outputPath);
      await _persist();
      return;
    }

    switch (result.outcome) {
      case ConversionOutcome.success:
        var outBytes = 0;
        try {
          outBytes = File(outputPath).lengthSync();
        } on FileSystemException {
          outBytes = 0;
        }
        _replace(current.copyWith(
          status: JobStatus.completed,
          progress: 1,
          outputPath: outputPath,
          outputBytes: outBytes,
          clearSession: true,
        ));
      case ConversionOutcome.cancelled:
        _deletePartial(outputPath);
        _replace(current.copyWith(status: JobStatus.cancelled, clearSession: true));
      case ConversionOutcome.failed:
        _deletePartial(outputPath);
        _replace(current.copyWith(
          status: JobStatus.failed,
          errorMessage: result.message,
          failure: JobFailure.ffmpeg,
          clearSession: true,
        ));
    }

    await _persist();

    // Put the result where the user already looks, unless they asked us not
    // to. Done per job rather than at the end of the batch so a batch that is
    // cancelled half-way still leaves its finished files somewhere reachable.
    if (result.outcome == ConversionOutcome.success &&
        ref.read(appPrefsProvider).autoSaveResults) {
      final turn = _saveGate.then((_) => saveOutput(id));
      _saveGate = turn.then((_) {}, onError: (_) {});
      await turn;
      if (!ref.mounted) return;
    }

    // One job finished, so the batch percentage jumped; push it immediately
    // rather than waiting for the next job's first statistics callback.
    await _syncForeground();
  }

  /// Copies one finished output out of the sandbox and records where it went.
  ///
  /// Never throws: null means the copy failed. A save can fail for reasons
  /// that have nothing to do with the conversion — permission declined, the
  /// gallery volume full — and none of them should turn a successful encode
  /// into a failed job. The file stays where it is and the card keeps offering
  /// the button. [SaveDestination.unsupported] is a different answer: there is
  /// nowhere on this platform to put it (iOS audio), and the caller offers the
  /// share sheet instead.
  Future<SaveDestination?> saveOutput(String id) async {
    final job = _find(id);
    if (job == null || job.status != JobStatus.completed) return null;
    final path = job.outputPath;
    if (path == null) return null;

    try {
      final destination = await ref.read(mediaSaverProvider).save(
            path: path,
            name: OutputPaths.fileName(path),
            kind: job.settings.container.kind,
          );
      if (!ref.mounted) return destination;

      if (destination.savedTo case final savedTo?) {
        final current = _find(id);
        if (current != null) _replace(current.copyWith(savedTo: savedTo));
        await _persist();
      }
      return destination;
    } catch (_) {
      return null;
    }
  }

  /// A cancelled or failed encode leaves a truncated, unplayable file behind.
  void _deletePartial(String path) {
    try {
      final file = File(path);
      if (file.existsSync()) file.deleteSync();
    } on FileSystemException {
      // Nothing useful to do; the file simply stays.
    }
  }

  Future<void> _notifyBatchDone(
    NotificationService notifications,
    QueueStrings strings,
  ) async {
    final done = state.completedCount;
    final failed = state.failedCount;
    if (done == 0 && failed == 0) return;

    await notifications.showBatchComplete(
      title: strings.appTitle,
      body: failed == 0
          ? strings.completed(done)
          : strings.completedWithFailures(done, failed),
    );
  }
}

final queueProvider =
    NotifierProvider<QueueController, QueueState>(QueueController.new);

/// One job, by id. A card watches only this, so a progress tick on the running
/// job repaints that card alone instead of every card in the list.
final jobProvider = Provider.family<ConversionJob?, String>((ref, id) {
  return ref.watch(queueProvider.select((q) {
    for (final job in q.jobs) {
      if (job.id == id) return job;
    }
    return null;
  }));
});

/// Which half of the queue a tab shows.
enum QueueSection { active, finished }

/// The ids in queue order, for one section. Changes only when jobs are added,
/// removed or change status — never on a progress tick.
///
/// The selector yields a *String*, not a List, on purpose: Riverpod compares
/// selected values with `==`, and two equal Lists are never `==`, so a List
/// selector would notify on every rebuild and defeat the whole point.
final jobIdsProvider = Provider.family<List<String>, QueueSection>((ref, section) {
  final joined = ref.watch(queueProvider.select((q) {
    final wantTerminal = section == QueueSection.finished;
    return q.jobs
        .where((j) => j.status.isTerminal == wantTerminal)
        .map((j) => j.id)
        .join(',');
  }));
  return joined.isEmpty ? const [] : joined.split(',');
});

extension _FirstOrNull<E> on List<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
