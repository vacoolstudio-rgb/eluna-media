import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Where converted files land, and how their names are chosen.
///
/// Output stays inside the app's own directory: nothing is written to shared
/// storage without the user explicitly sharing it, and nothing leaves the
/// device.
abstract final class OutputPaths {
  static const _folderName = 'Eluna';

  static Future<Directory> outputDirectory() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}${Platform.pathSeparator}$_folderName');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// Strips the extension and any characters that are illegal in a filename on
  /// either platform.
  static String sanitiseBaseName(String fileName) {
    final dot = fileName.lastIndexOf('.');
    var base = dot > 0 ? fileName.substring(0, dot) : fileName;
    base = base.replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1F]'), '_').trim();
    if (base.isEmpty) base = 'output';
    // Keep well clear of the 255-byte limit once a suffix and extension are on.
    if (base.length > 80) base = base.substring(0, 80);
    return base;
  }

  /// Returns a path under [directory] that does not yet exist, appending
  /// ` (1)`, ` (2)`, ... when needed.
  ///
  /// [exists] is injected so this can be exercised without touching the disk.
  static String uniquePath({
    required String directory,
    required String baseName,
    required String extension,
    required bool Function(String path) exists,
    String? separator,
  }) {
    final sep = separator ?? Platform.pathSeparator;
    String candidate(String suffix) =>
        '$directory$sep$baseName$suffix.$extension';

    if (!exists(candidate(''))) return candidate('');

    for (var i = 1; i < 10000; i++) {
      final path = candidate(' ($i)');
      if (!exists(path)) return path;
    }
    throw StateError('Could not find a free filename for $baseName.$extension');
  }

  static Future<String> resolve({
    required String inputFileName,
    required String extension,
  }) async {
    final dir = await outputDirectory();
    return uniquePath(
      directory: dir.path,
      baseName: sanitiseBaseName(inputFileName),
      extension: extension,
      exists: (p) => File(p).existsSync(),
    );
  }

  /// The final path segment, for display and for naming saved copies.
  static String fileName(String path) {
    final i = path.lastIndexOf(RegExp(r'[/\\]'));
    return i < 0 ? path : path.substring(i + 1);
  }

  /// What the output folder currently costs the user.
  ///
  /// Everything the app converts lands here and, until this existed, stayed
  /// here forever: the folder is inside the app's own sandbox, so it shows up
  /// as "app data" and no file manager will ever let anyone find it. An app
  /// that quietly grows to several gigabytes is a worse bug than any missing
  /// feature, which is why the size is now something the app can state and the
  /// user can act on.
  ///
  /// Catches everything: this is housekeeping, and on a host VM (tests) it
  /// cannot even reach the platform channel that names the directory. Nothing
  /// here is worth failing anything else over.
  static Future<({int files, int bytes})> usage() async {
    try {
      final dir = await outputDirectory();
      var files = 0;
      var bytes = 0;
      await for (final entity in dir.list()) {
        if (entity is! File) continue;
        files++;
        try {
          bytes += entity.lengthSync();
        } on FileSystemException {
          // Vanished between listing and measuring; it costs nothing now.
        }
      }
      return (files: files, bytes: bytes);
    } catch (_) {
      return (files: 0, bytes: 0);
    }
  }

  /// Deletes every output the app is no longer tracking, and returns the bytes
  /// reclaimed.
  ///
  /// [keep] holds the paths still referenced by a queue entry. Anything else in
  /// the folder is an orphan: the file of a job the user removed, or of a batch
  /// that process death interrupted before its entry was ever written. Running
  /// this at launch is what stops the folder growing without bound across
  /// versions, including for people upgrading from a build that never cleaned
  /// up at all.
  /// Runs unawaited at launch, so like [usage] it swallows everything: a host
  /// VM has no path_provider, and a sweep that throws into the void would take
  /// the zone's error handler with it.
  static Future<int> deleteOrphans(Set<String> keep) async {
    var freed = 0;
    try {
      final dir = await outputDirectory();
      await for (final entity in dir.list()) {
        if (entity is! File || keep.contains(entity.path)) continue;
        try {
          final size = entity.lengthSync();
          entity.deleteSync();
          freed += size;
        } on FileSystemException {
          // Locked or already gone; the next sweep will get it.
        }
      }
    } catch (_) {
      return freed;
    }
    return freed;
  }

  static String humanBytes(int bytes) {
    if (bytes <= 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB'];
    var value = bytes.toDouble();
    var unit = 0;
    while (value >= 1024 && unit < units.length - 1) {
      value /= 1024;
      unit++;
    }
    final precision = value >= 100 || unit == 0 ? 0 : 1;
    return '${value.toStringAsFixed(precision)} ${units[unit]}';
  }
}
