import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../core/output_paths.dart';
import '../domain/conversion_job.dart';
import '../domain/media_format.dart';
import '../l10n/app_localizations.dart';
import '../services/file_opener.dart';
import '../services/haptics.dart';
import '../services/media_saver.dart';
import '../state/queue_controller.dart';
import 'convert_tab.dart' show accentOfKind, iconOfKind;
import 'queue_strings.dart';
import 'theme.dart';
import 'widgets/progress_ring.dart';
import 'widgets/section_card.dart';
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
                  gradient: AppTheme.brandGradient,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.32),
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
      floatingActionButton: finishedIds.isEmpty || _tabs.index == 0
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                final removed = ref.read(queueProvider).finished;
                ref.read(queueProvider.notifier).clearFinished();
                ref.read(hapticsProvider).destructiveTap();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.finishedClearedUndo),
                    action: SnackBarAction(
                      label: l10n.undo,
                      onPressed: () => ref.read(queueProvider.notifier).restoreJobs(removed),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.cleaning_services_outlined),
              label: Text(l10n.clearFinished),
            ),
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
      title: l10n.converting,
      icon: Icons.bolt_rounded,
      accent: AppTheme.primary,
      children: [
        Row(
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
                        Text(l10n.timeLeft(formatEta(eta)), style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
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

    try {
      final destination = await ref.read(mediaSaverProvider).save(
            path: path,
            name: OutputPaths.fileName(path),
            kind: job.settings.container.kind,
          );
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
      }
    } catch (_) {
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

    final kind = ContainerFormat.kindOfFile(job.inputName) ?? job.settings.container.kind;
    final accent = switch (job.status) {
      JobStatus.completed => AppTheme.success,
      JobStatus.failed => AppTheme.danger,
      JobStatus.running => AppTheme.primary,
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
                  SectionIcon(icon: iconOfKind(kind), accent: accent, size: 46),
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
                if (job.status == JobStatus.running || job.status == JobStatus.queued)
                  TextButton.icon(
                    onPressed: () => ref.read(queueProvider.notifier).cancelJob(job.id),
                    icon: const Icon(Icons.close, size: 17),
                    label: Text(l10n.cancelJob),
                  ),
                if (job.status.isTerminal)
                  TextButton.icon(
                    onPressed: () {
                      ref.read(queueProvider.notifier).removeJob(job.id);
                      ref.read(hapticsProvider).destructiveTap();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.jobRemovedUndo),
                          action: SnackBarAction(
                            label: l10n.undo,
                            onPressed: () =>
                                ref.read(queueProvider.notifier).restoreJobs([job]),
                          ),
                        ),
                      );
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
        deltaColor = ratio > 0 ? AppTheme.success : theme.colorScheme.error;
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

    final (String label, Color color) = switch (status) {
      JobStatus.queued => (l10n.statusQueued, scheme.onSurfaceVariant),
      JobStatus.running => (l10n.statusRunning, AppTheme.primary),
      JobStatus.completed => (l10n.statusCompleted, AppTheme.success),
      JobStatus.failed => (l10n.statusFailed, AppTheme.danger),
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

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SectionIcon(
                icon: Icons.inbox_outlined,
                accent: theme.colorScheme.primary,
                size: 64,
              ),
              const SizedBox(height: 18),
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(body, textAlign: TextAlign.center, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
