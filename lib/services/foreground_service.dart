import 'dart:io';

import 'package:flutter/services.dart';

/// Controls the Android foreground service that keeps the process alive while a
/// batch converts.
///
/// On every other platform this is a no-op. iOS has no equivalent: a background
/// app gets a few tens of seconds via `beginBackgroundTask` and `BGProcessingTask`
/// only schedules work for a moment the *system* chooses, neither of which lets
/// a long transcode keep running the instant the user switches away. Pretending
/// otherwise in the API would be worse than admitting it here.
class ForegroundService {
  ForegroundService({MethodChannel? channel, bool? supported})
      : _channel = channel ?? const MethodChannel('eluna/foreground_service'),
        _supported = supported ?? Platform.isAndroid;

  final MethodChannel _channel;

  /// Injectable so the throttling logic can be exercised off-device.
  final bool _supported;

  /// Progress is a whole percentage, or null for an indeterminate spinner.
  static const _indeterminate = -1;

  bool _running = false;

  /// Percentage last handed to the platform, so a moving progress bar does not
  /// cross the method channel dozens of times per second.
  int _lastPercent = -2;
  String _lastText = '';

  /// Label for the notification's Cancel action, in the user's language. Held
  /// because every progress update re-posts the whole notification, and a
  /// re-post without the label would drop the button mid-batch.
  String _cancelLabel = '';

  /// Invoked when the user presses Cancel in the notification. Set once, by
  /// the queue.
  void Function()? onCancelRequested;

  /// Installs the handler for requests coming *from* the platform. Idempotent.
  void bindCancelHandler() {
    if (!_supported) return;
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'cancelRequested') onCancelRequested?.call();
      return null;
    });
  }

  Future<void> start({
    required String title,
    required String text,
    required String cancelLabel,
    double? progress,
  }) async {
    if (!_supported) return;
    _running = true;
    _lastPercent = -2;
    _lastText = '';
    _cancelLabel = cancelLabel;
    await _post('start', title: title, text: text, progress: progress);
  }

  /// Ignored when nothing is running, and skipped when neither the caption nor
  /// the rounded percentage has actually changed.
  Future<void> update({required String title, required String text, double? progress}) async {
    if (!_supported || !_running) return;

    final percent = progress == null ? _indeterminate : (progress * 100).round().clamp(0, 100);
    if (percent == _lastPercent && text == _lastText) return;

    await _post('update', title: title, text: text, progress: progress);
  }

  Future<void> stop() async {
    if (!_supported || !_running) return;
    _running = false;
    try {
      await _channel.invokeMethod<void>('stop');
    } on PlatformException {
      // The service may already be gone; there is nothing to recover.
    }
  }

  Future<void> _post(
    String method, {
    required String title,
    required String text,
    double? progress,
  }) async {
    final percent = progress == null ? _indeterminate : (progress * 100).round().clamp(0, 100);
    _lastPercent = percent;
    _lastText = text;
    try {
      await _channel.invokeMethod<void>(method, {
        'title': title,
        'text': text,
        'progress': percent,
        'cancelLabel': _cancelLabel,
      });
    } on PlatformException {
      // Losing the notification must not abort the conversion itself.
      _running = method != 'stop' && _running;
    }
  }
}
