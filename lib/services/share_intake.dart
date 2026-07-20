import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/queue_controller.dart';
import '../state/settings_controller.dart';

/// Count of files accepted from other apps since launch. The UI watches this
/// to jump to the Convert tab and confirm the import with a snackbar.
class SharedFilesCount extends Notifier<int> {
  @override
  int build() => 0;

  void add(int n) => state += n;
}

final sharedFilesCountProvider = NotifierProvider<SharedFilesCount, int>(SharedFilesCount.new);

/// Receives files other apps hand over ("Share → Eluna Media" on Android,
/// "Open with Eluna Media" on both platforms).
///
/// Both native sides copy the incoming file into the app cache on a background
/// thread and push `{path, name}` maps over this one channel; files that
/// arrive before Flutter is up are buffered natively and flushed when Dart
/// calls `ready`. Android handles SEND/SEND_MULTIPLE/VIEW intents
/// (MainActivity.kt); iOS handles document-type open-in URLs (AppDelegate.swift).
///
/// Not supported: the iOS *share sheet* (as opposed to "Open with"), which
/// needs a separate share-extension target.
class ShareIntake {
  ShareIntake(this._ref);

  static const _channel = MethodChannel('eluna/share_intake');

  final Ref _ref;

  Future<void> start() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;

    _channel.setMethodCallHandler((call) async {
      if (call.method != 'filesShared') return null;
      final batch = (call.arguments as List<dynamic>)
          .whereType<Map<dynamic, dynamic>>()
          .map((m) => (path: m['path'] as String, name: m['name'] as String))
          .toList();
      if (batch.isEmpty) return null;

      _ref.read(queueProvider.notifier).addFiles(batch, _ref.read(settingsProvider));
      _ref.read(sharedFilesCountProvider.notifier).add(batch.length);
      return null;
    });

    try {
      await _channel.invokeMethod<void>('ready');
    } on MissingPluginException {
      // Host tests and platforms without the native side.
    }
  }
}

final shareIntakeProvider = Provider<ShareIntake>(ShareIntake.new);
