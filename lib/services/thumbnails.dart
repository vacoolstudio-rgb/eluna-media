import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/media_format.dart';

/// Small preview frames for the file lists.
///
/// A queue of twenty `IMG_20260712_143355.jpg` rows tells nobody which photo is
/// which, which makes both "is this the right selection" and "remove that one"
/// guesswork. FFmpeg is already here and can produce the frame itself, so this
/// costs no new dependency.
class ThumbnailCache {
  ThumbnailCache({this.edge = 96});

  /// Long edge in logical-ish pixels. Deliberately small: these are 46–56 px on
  /// screen, and decoding a full 4000 px photo per row is how a file list drops
  /// frames.
  final int edge;

  Directory? _dir;

  /// One at a time. Adding thirty files would otherwise start thirty FFmpeg
  /// sessions at once and fight the conversion itself for the CPU.
  Future<void> _gate = Future<void>.value();

  Future<Directory> _cacheDir() async {
    final existing = _dir;
    if (existing != null) return existing;
    final base = await getTemporaryDirectory();
    final dir = Directory('${base.path}${Platform.pathSeparator}thumbs');
    if (!await dir.exists()) await dir.create(recursive: true);
    return _dir = dir;
  }

  /// A stable name for the cached frame of [sourcePath].
  ///
  /// `String.hashCode` is stable within a run but not across them, and this
  /// cache outlives the process — so the key is an explicit FNV-1a over the
  /// path, plus the file's size to invalidate the entry when a picker hands
  /// back a different file under a reused name.
  static String cacheKey(String sourcePath, int sizeBytes) {
    var hash = 0x811c9dc5;
    for (final byte in utf8.encode(sourcePath)) {
      hash = ((hash ^ byte) * 0x01000193) & 0xFFFFFFFF;
    }
    return '${hash.toRadixString(16)}_$sizeBytes';
  }

  /// The path of a cached thumbnail for [sourcePath], generating it if needed.
  /// Null when the source has no picture to show (audio) or FFmpeg could not
  /// produce one — every caller falls back to the type icon.
  Future<String?> thumbnailFor(String sourcePath, {int sizeBytes = 0}) async {
    final kind = ContainerFormat.kindOfFile(sourcePath);
    if (kind == MediaKind.audio) return null;

    final Directory dir;
    try {
      dir = await _cacheDir();
    } on FileSystemException {
      return null;
    }

    final target = '${dir.path}${Platform.pathSeparator}'
        '${cacheKey(sourcePath, sizeBytes)}.jpg';
    if (File(target).existsSync()) return target;
    if (!File(sourcePath).existsSync()) return null;

    // Serialised behind the gate, and the result is re-checked afterwards: two
    // rows asking for the same file must not both encode it.
    final completer = Completer<String?>();
    _gate = _gate.then((_) async {
      if (File(target).existsSync()) {
        completer.complete(target);
        return;
      }
      completer.complete(await _extract(sourcePath, target, kind));
    });
    return completer.future;
  }

  Future<String?> _extract(String source, String target, MediaKind? kind) async {
    // A second in is past the fade-in and the black leader that most clips
    // start with; if the clip is shorter than that the seek lands past the end
    // and produces nothing, so the retry takes the very first frame instead.
    final seeks = kind == MediaKind.video ? <String?>['1', null] : <String?>[null];

    for (final seek in seeks) {
      final args = <String>[
        '-hide_banner', '-nostdin', '-y',
        if (seek != null) ...['-ss', seek],
        '-i', source,
        '-frames:v', '1',
        '-update', '1',
        // Shrink only: upscaling a 40 px icon to 96 px buys nothing but blur.
        '-vf', "scale='min($edge,iw)':-2:flags=bilinear",
        '-q:v', '6',
        target,
      ];
      try {
        final session = await FFmpegKit.executeWithArguments(args);
        final code = await session.getReturnCode();
        if (ReturnCode.isSuccess(code) && File(target).existsSync()) {
          if (File(target).lengthSync() > 0) return target;
          File(target).deleteSync();
        }
      } catch (_) {
        return null; // No FFmpeg on this host (tests, desktop).
      }
    }
    return null;
  }

  /// Drops the whole cache. Called when the app clears its stored outputs —
  /// keeping preview frames for files that no longer exist would be exactly
  /// the invisible growth this app is trying to stop having.
  Future<void> clear() async {
    try {
      final dir = await _cacheDir();
      if (await dir.exists()) await dir.delete(recursive: true);
      _dir = null;
    } on FileSystemException {
      // Best effort; the OS purges the temp directory under pressure anyway.
    }
  }
}

final thumbnailCacheProvider = Provider<ThumbnailCache>((ref) => ThumbnailCache());

/// The cached preview for one source file. Kept alive for the session: a
/// thumbnail that regenerates every time a list scrolls is worse than no
/// thumbnail at all.
final thumbnailProvider =
    FutureProvider.family<String?, ({String path, int bytes})>((ref, source) {
  return ref.read(thumbnailCacheProvider).thumbnailFor(source.path, sizeBytes: source.bytes);
});
