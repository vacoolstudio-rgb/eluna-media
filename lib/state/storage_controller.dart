import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/output_paths.dart';
import '../services/thumbnails.dart';
import 'queue_controller.dart';

/// What the app's own output folder currently costs, so Settings can say it out
/// loud.
///
/// Converted files live inside the sandbox until the user saves or shares them.
/// That is the right default — nothing lands in the gallery uninvited — but it
/// also means the folder is invisible: it shows up only as "app data", and no
/// file manager can reach it. Without this the app was a bucket with no drain.
final storageUsageProvider =
    FutureProvider.autoDispose<({int files, int bytes})>((ref) => OutputPaths.usage());

/// Drops every finished job and deletes the files behind them, returning the
/// bytes reclaimed.
///
/// Active jobs and their outputs are left alone: the sweep keeps whatever the
/// remaining queue entries still point at.
Future<int> clearStoredOutputs(WidgetRef ref) async {
  final queue = ref.read(queueProvider.notifier);
  queue.clearFinished();
  final freed = await queue.sweepOrphanedOutputs();
  // The preview frames of files that are no longer listed are the same kind of
  // invisible residue. Anything still queued regenerates its own on next draw.
  await ref.read(thumbnailCacheProvider).clear();
  ref.invalidate(thumbnailProvider);
  ref.invalidate(storageUsageProvider);
  return freed;
}
