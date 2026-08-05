import 'dart:async';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/notification_service.dart';
import 'services/share_intake.dart';
import 'state/queue_controller.dart';
import 'state/settings_controller.dart';
import 'ui/app.dart';
import 'ui/error_screen.dart';

Future<void> main() async {
  // Everything, including the async init, runs inside one guarded zone so an
  // uncaught error anywhere ends up logged locally instead of killing the app
  // silently. There is deliberately no crash-reporting SDK to send it to.
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // A build-phase exception in release renders a calm apology instead of
    // the grey void (debug keeps the red screen, which is more useful).
    if (kReleaseMode) {
      ErrorWidget.builder = (details) => const ErrorFallback();
    }
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
    };

    // Кто это приложение — для всех общих компонентов eluna_shared. Должно
    // выполниться до того, как построится хоть один общий экран: адрес
    // поддержки и ссылки на сторы читаются отсюда, и `Eluna.config` бросает
    // исключение, а не угадывает.
    //
    // Пустые списки — не заглушки, а факты: у Media нет ни страницы в сторе,
    // ни альтернативных значков, ни покупок. Общие экраны прячут то, чего нет,
    // поэтому врать им нечем.
    Eluna.configure(const ElunaAppConfig(
      appName: 'Eluna Media',
      // Идентификатор вне семейного шаблона `com.eluna.*` — так оно и есть на
      // устройствах, а переименование создало бы новое приложение.
      packageId: 'com.lunara.eluna_media',
      // Не `support@eluna.app`, зашитый в старом экране оценки: у семьи один
      // адрес, и письма со второго домена не приходили никуда.
      supportEmail: 'support@eluna-apps.com',
      websiteUrl: 'https://eluna-apps.com',
      appIcons: [],
      tipProductIds: [],
      // Монохромной ic_notification в drawable нет, а ненайденный ресурс роняет
      // инициализацию плагина уведомлений — молча, вместе со всеми
      // уведомлениями сразу.
      notificationSmallIcon: '@mipmap/ic_launcher',
    ));

    // Loaded up front so the settings notifiers can read it synchronously in
    // their `build()`.
    final prefs = await SharedPreferences.getInstance();

    final notifications = NotificationService.create();
    await notifications.init();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        notificationServiceProvider.overrideWithValue(notifications),
      ],
    );

    // Announce readiness to the native side; files shared while the app was
    // dead flush through right after this.
    unawaited(container.read(shareIntakeProvider).start());

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const ElunaApp(),
      ),
    );
  }, (error, stack) {
    // Local-only by principle: no telemetry, no upload.
    debugPrint('Uncaught: $error\n$stack');
  });
}
