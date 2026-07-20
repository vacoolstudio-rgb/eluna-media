import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Local-only completion notices. Nothing here touches the network — there is
/// no push channel, no token, no remote config.
class NotificationService {
  NotificationService(this._plugin);

  factory NotificationService.create() =>
      NotificationService(FlutterLocalNotificationsPlugin());

  final FlutterLocalNotificationsPlugin _plugin;

  static const _channelId = 'eluna_conversion';
  static const _channelName = 'Conversion progress';

  bool _ready = false;

  Future<void> init() async {
    if (_ready) return;
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      settings: const InitializationSettings(android: android, iOS: darwin),
    );
    _ready = true;
  }

  /// Asked for lazily, the first time the user actually starts a batch, rather
  /// than on first launch.
  Future<bool> requestPermission() async {
    await init();
    if (Platform.isAndroid) {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      return await android?.requestNotificationsPermission() ?? false;
    }
    if (Platform.isIOS) {
      final ios = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
      return await ios?.requestPermissions(alert: true, sound: true) ?? false;
    }
    return false;
  }

  Future<void> showBatchComplete({
    required String title,
    required String body,
  }) async {
    await init();
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: 'Tells you when a conversion batch has finished.',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await _plugin.show(
      id: 1001,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }

  Future<void> cancelAll() => _plugin.cancelAll();
}
