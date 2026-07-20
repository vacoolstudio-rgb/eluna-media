import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_filex/open_filex.dart';

/// What happened when we tried to hand a file to another app.
enum OpenOutcome { opened, noApp, missing, failed }

/// Opens a converted file in whatever app the system uses for it, and — once
/// the file has been saved somewhere public — the folder it landed in.
///
/// "I can't find the file afterwards" is one of the loudest complaints against
/// every converter in this category; a button that just opens the thing is the
/// cheapest possible answer.
class FileOpener {
  static const _channel = MethodChannel('eluna/share_intake');

  Future<OpenOutcome> openFile(String path) async {
    if (!File(path).existsSync()) return OpenOutcome.missing;
    try {
      final result = await OpenFilex.open(path);
      return switch (result.type) {
        ResultType.done => OpenOutcome.opened,
        ResultType.noAppToOpen => OpenOutcome.noApp,
        ResultType.fileNotFound => OpenOutcome.missing,
        _ => OpenOutcome.failed,
      };
    } catch (_) {
      return OpenOutcome.failed;
    }
  }

  /// Shows the system's Downloads view, where "Save" puts audio and any other
  /// non-gallery output. Android only: iOS has no browsable Downloads folder,
  /// and pretending otherwise would be a dead button.
  Future<bool> openDownloads() async {
    if (!Platform.isAndroid) return false;
    try {
      return await _channel.invokeMethod<bool>('openDownloads') ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  bool get canOpenFolder => Platform.isAndroid;
}

final fileOpenerProvider = Provider<FileOpener>((ref) => FileOpener());
