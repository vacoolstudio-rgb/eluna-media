import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// One source file, as the media library would know it.
///
/// The path the app holds is a *copy*: both pickers hand back a cached
/// duplicate rather than the original, so the original cannot be addressed by
/// path at all. What survives the copy is the display name and the byte count,
/// and that pair is what the native side looks the real item up by.
class OriginalRef {
  const OriginalRef({required this.jobId, required this.name, required this.bytes});

  final String jobId;
  final String name;
  final int bytes;
}

/// Which of the requested originals are actually gone.
///
/// [deletedJobIds] is authoritative and may be empty even on success: an item
/// the media library does not hold (a file picked out of Downloads, a name that
/// matches two different rows) is skipped rather than guessed at.
class ReclaimOutcome {
  const ReclaimOutcome({
    this.deletedJobIds = const {},
    this.freedBytes = 0,
    this.cancelled = false,
    this.unsupported = false,
  });

  final Set<String> deletedJobIds;
  final int freedBytes;

  /// The user dismissed the system's confirmation dialog. Not an error, and
  /// deliberately distinguished from "nothing matched" so the UI can stay quiet
  /// instead of reporting a failure the user caused on purpose.
  final bool cancelled;

  /// The platform offers no way to do this at all; the caller hides the option
  /// rather than showing a button that cannot work.
  final bool unsupported;

  int get deletedCount => deletedJobIds.length;
}

/// Removes converted sources from the device's media library.
///
/// Deletion always goes through the operating system's own confirmation —
/// `MediaStore.createDeleteRequest` on Android, `PHPhotoLibrary` on iOS — so
/// the user sees the actual items, with thumbnails, and approves them. The app
/// never unlinks a file the user has not been shown.
abstract class OriginalMediaService {
  Future<ReclaimOutcome> delete(List<OriginalRef> items);
}

class ChannelOriginalMediaService implements OriginalMediaService {
  const ChannelOriginalMediaService();

  /// The same channel the share intake and the free-space probe already use;
  /// both native sides own the media library work anyway.
  static const _channel = MethodChannel('eluna/share_intake');

  @override
  Future<ReclaimOutcome> delete(List<OriginalRef> items) async {
    if (items.isEmpty) return const ReclaimOutcome();

    final Map<Object?, Object?>? reply;
    try {
      reply = await _channel.invokeMethod<Map<Object?, Object?>>(
        'deleteOriginals',
        {
          'items': [
            for (final item in items) {'name': item.name, 'size': item.bytes},
          ],
        },
      );
    } on MissingPluginException {
      // A host VM, or a platform where this was never wired up.
      return const ReclaimOutcome(unsupported: true);
    } on PlatformException {
      return const ReclaimOutcome();
    }
    if (reply == null) return const ReclaimOutcome();

    if (reply['unsupported'] == true) {
      return const ReclaimOutcome(unsupported: true);
    }

    // Indices, not names: two queued jobs can carry the same file name, and an
    // answer keyed by name could then credit the wrong one.
    final indices = reply['deleted'];
    final deleted = <String>{};
    var freed = 0;
    if (indices is List) {
      for (final index in indices) {
        if (index is! int || index < 0 || index >= items.length) continue;
        final item = items[index];
        if (deleted.add(item.jobId)) freed += item.bytes;
      }
    }

    return ReclaimOutcome(
      deletedJobIds: deleted,
      freedBytes: freed,
      cancelled: reply['cancelled'] == true,
    );
  }
}

final originalMediaProvider = Provider<OriginalMediaService>(
  (ref) => const ChannelOriginalMediaService(),
);
