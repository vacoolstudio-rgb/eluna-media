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
