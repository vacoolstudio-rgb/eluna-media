import '../l10n/app_localizations.dart';
import '../state/queue_controller.dart';

/// Snapshots the strings the queue will need once it is running without a
/// `BuildContext` of its own.
QueueStrings queueStringsFrom(L10n l10n) => QueueStrings(
      appTitle: l10n.appTitle,
      progress: l10n.batchSummary,
      completed: l10n.batchCompleted,
      completedWithFailures: l10n.batchCompletedWithFailures,
      cancelLabel: l10n.cancelBatch,
    );
