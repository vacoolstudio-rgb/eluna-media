import 'dart:async';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_plus/share_plus.dart';

import '../core/output_paths.dart';
import '../domain/conversion_job.dart';
import '../domain/media_format.dart';
import '../l10n/app_localizations.dart';
import '../services/file_opener.dart';
import '../services/haptics.dart';
import '../services/media_saver.dart';
import '../state/queue_controller.dart';
import 'compare_screen.dart';
import 'convert_tab.dart' show accentOfKind, iconOfKind;
import 'queue_strings.dart';
import 'widgets/media_thumbnail.dart';
import 'widgets/progress_ring.dart';
import 'widgets/settings_summary.dart';

/// Formats a remaining duration the way a person would say it: "2:05", or
/// "1 h 12 m" once minutes stop being useful.
String formatEta(Duration d) {
  if (d.inHours >= 1) {
    final minutes = d.inMinutes.remainder(60);
    return '${d.inHours} h ${minutes.toString().padLeft(2, '0')} m';
  }
  final seconds = d.inSeconds.remainder(60);
  return '${d.inMinutes}:${seconds.toString().padLeft(2, '0')}';
}

/// Ticks once a second while a batch runs, so the time-remaining estimate
/// keeps counting down between FFmpeg's progress callbacks instead of freezing
/// on whatever it said when the last frame landed.
final _etaTickProvider = StreamProvider.autoDispose<int>((ref) {
  if (!ref.watch(queueProvider.select((q) => q.isRunning))) {
    return const Stream.empty();
  }
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
});

/// Two tabs, because a finished job and a waiting one answer different
/// questions: "what is happening now" and "where is my file". Mixing them
/// meant scrolling past yesterday's conversions to find today's progress.
class QueueTab extends ConsumerStatefulWidget {
  const QueueTab({super.key});

  @override
  ConsumerState<QueueTab> createState() => _QueueTabState();
}

class _QueueTabState extends ConsumerState<QueueTab> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    // The "clear finished" button only belongs on the Finished tab, and a
    // TabController does not rebuild its host on its own — without this the
    // button would be stuck in whatever state the last build left it in.
    _tabs.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabs.indexIsChanging || _tabs.index != _lastIndex) {
      _lastIndex = _tabs.index;
      if (mounted) setState(() {});
    }
  }

  int _lastIndex = 0;

  @override
  void dispose() {
    _tabs.removeListener(_onTabChanged);
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    // Deliberately *not* watching the whole QueueState: these change rarely,
    // so a progress tick repaints only the card that moved (each _JobCard
    // watches its own job).
    final activeIds = ref.watch(jobIdsProvider(QueueSection.active));
    final finishedIds = ref.watch(jobIdsProvider(QueueSection.finished));
    final isRunning = ref.watch(queueProvider.select((q) => q.isRunning));

    if (activeIds.isEmpty && finishedIds.isEmpty) {
      return _EmptyState(title: l10n.queueEmptyTitle, body: l10n.queueEmptyBody);
    }

    // Land the user where the news is: a finished batch jumps to the results.
    ref.listen<bool>(queueProvider.select((q) => q.isRunning), (was, now) {
      if (was == true && now == false && mounted) _tabs.animateTo(1);
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: TabBar(
                controller: _tabs,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  gradient: context.elunaColors.gradient,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: context.elunaColors.primary.withValues(alpha: 0.32),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                labelColor: Colors.white,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5),
                tabs: [
                  Tab(text: l10n.queueActiveTab(activeIds.length)),
                  Tab(text: l10n.queueFinishedTab(finishedIds.length)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabs,
                children: [
                  _JobList(
                    ids: activeIds,
                    header: isRunning ? const _BatchHeader() : null,
                    emptyTitle: l10n.queueNoActiveTitle,
                    emptyBody: l10n.queueNoActiveBody,
                  ),
                  _JobList(
                    ids: finishedIds,
                    emptyTitle: l10n.queueNoFinishedTitle,
                    emptyBody: l10n.queueNoFinishedBody,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          finishedIds.isEmpty || _tabs.index == 0 ? null : const _FinishedActions(),
    );
  }
}

/// The two things anyone does with a finished batch: take the results out of
/// the app, and then get rid of them.
///
/// Saving is the primary action because it is the one that answers "where is
/// my file". It disappears once nothing is left unsaved — with auto-save on,
/// that is the usual state, and a button that would do nothing should not be
/// on screen.
class _FinishedActions extends ConsumerWidget {
  const _FinishedActions();

  Future<void> _saveAll(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final queue = ref.read(queueProvider.notifier);
    final pending = _unsaved(ref.read(queueProvider).jobs);

    var saved = 0;
    for (final job in pending) {
      final destination = await queue.saveOutput(job.id);
      if (destination == SaveDestination.gallery ||
          destination == SaveDestination.downloads) {
        saved++;
      }
    }

    messenger.showSnackBar(SnackBar(
      content: Text(
        saved == pending.length ? l10n.savedAll(saved) : l10n.savedSome(saved, pending.length),
      ),
    ));
  }

  Future<void> _clear(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final removed = ref.read(queueProvider).finished;
    final queue = ref.read(queueProvider.notifier);
    queue.clearFinished();
    ref.read(hapticsProvider).destructiveTap();

    final closed = await ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(l10n.finishedClearedUndo),
            action: SnackBarAction(
              label: l10n.undo,
              onPressed: () => queue.restoreJobs(removed),
            ),
          ),
        )
        .closed;
    // The file goes only once undo is off the table. Deleting on the spot
    // would leave undo restoring a card pointing at nothing; never deleting is
    // how the output folder grew without bound.
    if (closed != SnackBarClosedReason.action) queue.purgeOutputs(removed);
  }

  /// Offers the sources of everything saved so far to the system's delete flow.
  ///
  /// The confirmation belongs to the platform, so there is deliberately no
  /// second one here: two dialogs asking the same question train people to
  /// dismiss both. The app's job is to report honestly afterwards — including
  /// the case where a file could not be matched in the gallery at all, which
  /// looks identical to "nothing happened" unless it is said out loud.
  Future<void> _deleteOriginals(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final ids = [for (final job in ref.read(queueProvider).reclaimable) job.id];

    final outcome = await ref.read(queueProvider.notifier).reclaimOriginals(ids);
    if (outcome.cancelled || outcome.unsupported) return;

    ref.read(hapticsProvider).destructiveTap();
    messenger.showSnackBar(SnackBar(
      content: Text(
        outcome.deletedCount == 0
            ? l10n.originalsNoneDeleted
            : l10n.originalsDeleted(OutputPaths.humanBytes(outcome.freedBytes)),
      ),
    ));
  }

  static List<ConversionJob> _unsaved(List<ConversionJob> jobs) => [
        for (final job in jobs)
          if (job.status == JobStatus.completed &&
              job.savedTo == null &&
              job.outputPath != null)
            job,
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final unsaved = ref.watch(queueProvider.select((q) => _unsaved(q.jobs).length));
    final reclaimable = ref.watch(queueProvider.select((q) => q.reclaimable.length));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton.small(
          heroTag: 'queue-clear',
          onPressed: () => _clear(context, ref),
          tooltip: l10n.clearFinished,
          child: const Icon(Icons.cleaning_services_outlined),
        ),
        const SizedBox(height: 10),
        // Only once the results are safely out of the sandbox — the reclaimable
        // set requires it. Saving is the first offer, freeing space the second.
        if (unsaved == 0 && reclaimable > 0)
          FloatingActionButton.extended(
            heroTag: 'queue-delete-originals',
            onPressed: () => _deleteOriginals(context, ref),
            icon: const Icon(Icons.delete_sweep_outlined),
            label: Text(l10n.deleteOriginalsAction(reclaimable)),
          ),
        if (unsaved > 0)
          FloatingActionButton.extended(
            heroTag: 'queue-save-all',
            onPressed: () => _saveAll(context, ref),
            icon: const Icon(Icons.download_outlined),
            label: Text(l10n.saveAll(unsaved)),
          ),
      ],
    );
  }
}

class _JobList extends StatelessWidget {
  const _JobList({
    required this.ids,
    required this.emptyTitle,
    required this.emptyBody,
    this.header,
  });

  final List<String> ids;
  final String emptyTitle;
  final String emptyBody;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    if (ids.isEmpty && header == null) {
      return _EmptyState(title: emptyTitle, body: emptyBody);
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
      children: [
        if (header != null) ...[header!, const SizedBox(height: 16)],
        for (final id in ids) ...[
          _JobCard(key: ValueKey(id), jobId: id),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

/// Batch-level progress: the ring answers "how far along", the caption answers
/// "how much longer".
class _BatchHeader extends ConsumerWidget {
  const _BatchHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    ref.watch(_etaTickProvider);

    final queue = ref.watch(queueProvider);
    if (queue.jobs.isEmpty) return const SizedBox.shrink();

    final running = queue.jobs.firstWhere(
      (j) => j.status == JobStatus.running,
      orElse: () => queue.jobs.first,
    );
    final eta = running.estimatedRemaining();

    return SectionCard(
      accent: context.elunaColors.primary,
      // Отступы задаёт список очереди, поэтому поле карточки обнулено.
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            icon: HugeIcons.strokeRoundedFlash,
            accent: context.elunaColors.primary,
            title: l10n.converting,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
            child: Row(
              children: [
                ProgressRing(value: queue.overallProgress, size: 62),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.batchSummary(queue.completedCount, queue.jobs.length),
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        running.inputName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                      if (eta != null) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule_rounded,
                              size: 13,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(l10n.timeLeft(formatEta(eta)),
                                style: theme.textTheme.labelSmall),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String? _failureText(L10n l10n, ConversionJob job) => switch (job.failure) {
      JobFailure.sourceMissing => l10n.sourceMissing,
      _ => job.errorMessage,
    };

/// Watches exactly one job, so a progress tick on the running file does not
/// rebuild the cards above and below it.
class _JobCard extends ConsumerWidget {
  const _JobCard({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final job = ref.watch(jobProvider(jobId));
    if (job == null) return const SizedBox.shrink();
    return _JobCardBody(job: job);
  }
}

class _JobCardBody extends ConsumerWidget {
  const _JobCardBody({required this.job});

  final ConversionJob job;

  /// Asks for the output's base name, without an extension.
  ///
  /// The extension is not editable because it is not the user's to choose: it
  /// follows the output format, and a name ending in the wrong one would make
  /// the system open the file with the wrong app. Anything typed after a dot is
  /// dropped by the same sanitiser the output path uses.
  Future<void> _rename(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final controller = TextEditingController(
      text: job.outputName ?? OutputPaths.sanitiseBaseName(job.inputName),
    );

    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.renameOutput),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: l10n.renameOutputHint,
                suffixText: '.${job.settings.container.extension}',
              ),
              onSubmitted: (value) => Navigator.of(context).pop(value),
            ),
            const SizedBox(height: 10),
            Text(l10n.renameOutputHelp, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: Text(l10n.commonOk),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name == null) return;
    ref.read(queueProvider.notifier).renameOutput(job.id, name);
  }

  Future<void> _share(BuildContext context) async {
    final path = job.outputPath;
    if (path == null) return;
    // iPads present the share sheet as a popover, which crashes without a
    // source rect; anchor it to the widget that was tapped.
    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(ShareParams(
      files: [XFile(path)],
      sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
    ));
  }

  Future<void> _open(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final path = job.outputPath;
    if (path == null) return;

    final outcome = await ref.read(fileOpenerProvider).openFile(path);
    switch (outcome) {
      case OpenOutcome.opened:
        return;
      case OpenOutcome.noApp:
        messenger.showSnackBar(SnackBar(content: Text(l10n.noAppToOpen)));
      case OpenOutcome.missing:
        messenger.showSnackBar(SnackBar(content: Text(l10n.sourceMissing)));
      case OpenOutcome.failed:
        messenger.showSnackBar(SnackBar(content: Text(l10n.openFailed)));
    }
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final opener = ref.read(fileOpenerProvider);
    final path = job.outputPath;
    if (path == null) return;

    // Routed through the queue rather than straight at the saver, so the job
    // records where it went and the card stops offering a save that already
    // happened.
    final destination = await ref.read(queueProvider.notifier).saveOutput(job.id);
    switch (destination) {
      case SaveDestination.gallery:
        messenger.showSnackBar(SnackBar(
          content: Text(l10n.savedToGallery),
          action: SnackBarAction(
            label: l10n.openFile,
            onPressed: () => opener.openFile(path),
          ),
        ));
      case SaveDestination.downloads:
        messenger.showSnackBar(SnackBar(
          content: Text(l10n.savedToDownloads),
          action: SnackBarAction(
            label: l10n.openFolder,
            onPressed: opener.openDownloads,
          ),
        ));
      case SaveDestination.unsupported:
        // iOS audio: the share sheet is how files leave the sandbox.
        if (context.mounted) await _share(context);
      case null:
        messenger.showSnackBar(SnackBar(content: Text(l10n.saveFailed)));
    }
  }

  void _showDetails(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final failure = _failureText(l10n, job);

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job.inputName, style: theme.textTheme.titleMedium),
                const SizedBox(height: 16),
                Text(
                  l10n.jobSettingsTitle.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                for (final line in summariseSettings(l10n, job))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_rounded,
                          size: 15,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(line, style: theme.textTheme.bodyMedium)),
                      ],
                    ),
                  ),
                if (failure != null) ...[
                  const SizedBox(height: 18),
                  Text(
                    l10n.errorDetailsTitle.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(failure, style: theme.textTheme.bodySmall),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final colors = context.elunaColors;

    final kind = ContainerFormat.kindOfFile(job.inputName) ?? job.settings.container.kind;
    final accent = switch (job.status) {
      JobStatus.completed => colors.success,
      JobStatus.failed => colors.danger,
      JobStatus.running => colors.primary,
      _ => accentOfKind(kind),
    };

    // The estimate must keep counting down between FFmpeg callbacks.
    if (job.status == JobStatus.running) ref.watch(_etaTickProvider);
    final eta = job.estimatedRemaining();
    final failureText = _failureText(l10n, job);

    final base = isDark ? scheme.surfaceContainer : Colors.white;
    Color tint(double amount, double alpha) =>
        Color.alphaBlend(accent.withValues(alpha: amount), base).withValues(alpha: alpha);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [tint(0.16, 0.60), tint(0.04, 0.42)]
              : [tint(0.12, 0.82), tint(0.02, 0.6)],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: accent.withValues(alpha: isDark ? 0.28 : 0.20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (job.status == JobStatus.running)
                  ProgressRing(
                    value: job.progress,
                    size: 46,
                    stroke: 4,
                    // A still has no timeline, so there is no honest percentage.
                    indeterminate: job.sourceDurationMs == null,
                  )
                else
                  MediaThumbnail(
                    path: job.inputPath,
                    bytes: job.inputBytes,
                    icon: iconOfKind(kind),
                    accent: accent,
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.inputName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      // A rename is invisible until the file lands, which is
                      // far too late to notice a typo.
                      if (job.outputName case final renamed?) ...[
                        const SizedBox(height: 2),
                        Text(
                          '→ $renamed.${job.settings.container.extension}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          for (final chip in summaryChips(l10n, job))
                            SummaryChip(label: chip, accent: accent),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _StatusChip(status: job.status),
              ],
            ),
            if (job.status == JobStatus.running && eta != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.schedule_rounded, size: 13, color: scheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(l10n.timeLeft(formatEta(eta)), style: theme.textTheme.labelSmall),
                ],
              ),
            ],
            if (job.status == JobStatus.completed) ...[
              const SizedBox(height: 10),
              _SizeSummary(job: job),
              // Answers "where is my file" before it is asked. Without this the
              // only honest answer was "inside the app, where you cannot get
              // to it".
              if (job.savedTo case final savedTo?) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 14, color: colors.success),
                    const SizedBox(width: 5),
                    Text(
                      switch (savedTo) {
                        SavedTo.gallery => l10n.savedToGallery,
                        SavedTo.downloads => l10n.savedToDownloads,
                      },
                      style: theme.textTheme.labelSmall?.copyWith(color: colors.success),
                    ),
                  ],
                ),
              ],
            ],
            if (job.status == JobStatus.failed && failureText != null) ...[
              const SizedBox(height: 8),
              Text(
                failureText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(color: scheme.error),
              ),
            ],
            const SizedBox(height: 2),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 2,
              runSpacing: 2,
              children: [
                TextButton.icon(
                  onPressed: () => _showDetails(context),
                  icon: const Icon(Icons.info_outline, size: 17),
                  label: Text(l10n.jobDetails),
                ),
                if (job.status == JobStatus.completed) ...[
                  // Stills only. A converted photo is otherwise invisible until
                  // it is opened somewhere else, by which point nobody is
                  // comparing it to anything.
                  if (job.settings.container.kind == MediaKind.image &&
                      !job.settings.container.isAnimatedImage &&
                      !job.isMerge)
                    TextButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => CompareScreen(
                            title: job.inputName,
                            beforePath: job.inputPath,
                            afterPath: job.outputPath!,
                            beforeBytes: job.inputBytes,
                            afterBytes: job.outputBytes,
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.compare_outlined, size: 17),
                      label: Text(l10n.compareAction),
                    ),
                  TextButton.icon(
                    onPressed: () => _open(context, ref),
                    icon: const Icon(Icons.play_circle_outline, size: 17),
                    label: Text(l10n.openFile),
                  ),
                  TextButton.icon(
                    onPressed: () => _save(context, ref),
                    icon: const Icon(Icons.download_outlined, size: 17),
                    label: Text(l10n.saveFile),
                  ),
                  Builder(
                    builder: (context) => TextButton.icon(
                      onPressed: () => _share(context),
                      icon: const Icon(Icons.ios_share, size: 17),
                      label: Text(l10n.shareFile),
                    ),
                  ),
                ],
                if (job.status == JobStatus.failed || job.status == JobStatus.cancelled)
                  TextButton.icon(
                    onPressed: () {
                      ref.read(queueProvider.notifier).retryJob(job.id);
                      // A retry outside a running batch should convert now, not
                      // sit queued until the user finds the other tab.
                      if (!ref.read(queueProvider).isRunning) {
                        ref.read(queueProvider.notifier).start(queueStringsFrom(l10n));
                      }
                    },
                    icon: const Icon(Icons.refresh, size: 17),
                    label: Text(l10n.retryJob),
                  ),
                // Queued only: see QueueController.renameOutput. Once the file
                // exists there is nothing honest left for this button to do.
                if (job.status == JobStatus.queued)
                  TextButton.icon(
                    onPressed: () => _rename(context, ref),
                    icon: const Icon(Icons.drive_file_rename_outline, size: 17),
                    label: Text(l10n.renameOutput),
                  ),
                if (job.status == JobStatus.running || job.status == JobStatus.queued)
                  TextButton.icon(
                    onPressed: () => ref.read(queueProvider.notifier).cancelJob(job.id),
                    icon: const Icon(Icons.close, size: 17),
                    label: Text(l10n.cancelJob),
                  ),
                if (job.status.isTerminal)
                  TextButton.icon(
                    onPressed: () async {
                      final queue = ref.read(queueProvider.notifier);
                      queue.removeJob(job.id);
                      ref.read(hapticsProvider).destructiveTap();
                      final closed = await ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(
                              content: Text(l10n.jobRemovedUndo),
                              action: SnackBarAction(
                                label: l10n.undo,
                                onPressed: () => queue.restoreJobs([job]),
                              ),
                            ),
                          )
                          .closed;
                      if (closed != SnackBarClosedReason.action) queue.purgeOutputs([job]);
                    },
                    icon: const Icon(Icons.delete_outline, size: 17),
                    label: Text(l10n.removeJob),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SizeSummary extends StatelessWidget {
  const _SizeSummary({required this.job});

  final ConversionJob job;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final ratio = job.sizeDeltaRatio;

    final sizes = l10n.sizeChange(
      OutputPaths.humanBytes(job.inputBytes),
      OutputPaths.humanBytes(job.outputBytes),
    );

    String? delta;
    Color? deltaColor;
    if (ratio != null) {
      final percent = (ratio.abs() * 100).round();
      if (percent >= 1) {
        delta = ratio > 0 ? l10n.savedPercent(percent) : l10n.grewPercent(percent);
        deltaColor = ratio > 0 ? context.elunaColors.success : theme.colorScheme.error;
      }
    }

    return Wrap(
      spacing: 8,
      runSpacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(sizes, style: theme.textTheme.bodyMedium),
        if (delta != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: deltaColor!.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              delta,
              style: theme.textTheme.labelSmall?.copyWith(
                color: deltaColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final JobStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = context.elunaColors;

    final (String label, Color color) = switch (status) {
      JobStatus.queued => (l10n.statusQueued, scheme.onSurfaceVariant),
      JobStatus.running => (l10n.statusRunning, colors.primary),
      JobStatus.completed => (l10n.statusCompleted, colors.success),
      JobStatus.failed => (l10n.statusFailed, colors.danger),
      JobStatus.cancelled => (l10n.statusCancelled, scheme.onSurfaceVariant),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Пустая очередь. Раскладку — значок, заголовок, пояснение — рисует общий
/// EmptyState; здесь остаётся только прозрачный Scaffold, чтобы сквозь него
/// был виден фоновый градиент приложения.
class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: EmptyState(
        icon: HugeIcons.strokeRoundedInbox,
        title: title,
        body: body,
      ),
    );
  }
}
