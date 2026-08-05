import 'dart:async';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/eluna_adapters.dart';
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

    // Оформление переезжает в общий контроллер. Прежние значения передаются
    // семенами и читаются РОВНО ОДИН РАЗ — пока в `eluna.theme.*` пусто; дальше
    // источник истины только там.
    //
    // Это и есть опасное место переезда: не передай сюда сохранённое — и у
    // каждого пользователя оформление молча сбросится на обновлении, а семена
    // читаются единожды, поэтому неправильный первый запуск уже не исправить.
    final prefsThemeMode = switch (prefs.getString('app.themeMode')) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => null,
    };
    await ElunaThemeController.instance.load(
      seedMode: prefsThemeMode,
      seedPureBlack: prefs.getBool('app.oledDark'),
      seedDynamicColor: prefs.getBool('app.dynamicColor'),
    );

    // Цвет обоев снимаем до первого кадра и независимо от переключателя:
    // включение Material You тогда перекрашивает приложение сразу, а не со
    // следующего запуска. Ошибку адаптер гасит сам и возвращает null.
    final wallpaperAccent =
        await const MediaDynamicColorAdapter().wallpaperAccent();

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
        child: ElunaApp(wallpaperAccent: wallpaperAccent),
      ),
    );
  }, (error, stack) {
    // Local-only by principle: no telemetry, no upload.
    debugPrint('Uncaught: $error\n$stack');
  });
}
