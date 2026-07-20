import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';

import '../domain/media_format.dart';

/// Where a saved file ended up, so the confirmation can tell the user where
/// to look — "can't find my file" is a chronic complaint in this category.
enum SaveDestination { gallery, downloads, unsupported }

/// Puts a finished output somewhere the user can find without a file manager
/// safari: images and videos go to the system gallery, audio (and everything
/// else on Android) goes to public Downloads.
class MediaSaver {
  static const _channel = MethodChannel('eluna/share_intake');

  Future<SaveDestination> save({
    required String path,
    required String name,
    required MediaKind kind,
  }) async {
    if (!File(path).existsSync()) {
      throw const FileSystemException('Output file is gone');
    }

    // Old Androids gate gallery *and* Downloads writes behind the same
    // runtime storage permission; iOS gates album placement behind photo
    // access. `gal` requests whatever the platform actually needs — on
    // API 29+ it short-circuits to granted.
    if (!await Gal.hasAccess(toAlbum: true)) {
      final granted = await Gal.requestAccess(toAlbum: true);
      if (!granted) {
        throw const FileSystemException('Storage access declined');
      }
    }

    switch (kind) {
      case MediaKind.image:
        await Gal.putImage(path, album: 'Eluna Media');
        return SaveDestination.gallery;
      case MediaKind.video:
        await Gal.putVideo(path, album: 'Eluna Media');
        return SaveDestination.gallery;
      case MediaKind.audio:
        // No gallery concept for audio. Android gets a public Downloads copy
        // via MediaStore; on iOS the share sheet is the idiomatic route and
        // the caller falls back to it.
        if (Platform.isAndroid) {
          await _channel.invokeMethod<String>('saveToDownloads', {
            'path': path,
            'name': name,
          });
          return SaveDestination.downloads;
        }
        return SaveDestination.unsupported;
    }
  }
}

final mediaSaverProvider = Provider<MediaSaver>((ref) => MediaSaver());
