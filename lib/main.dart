import 'dart:async';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/logging/error_handlers.dart';
import 'domain/app_icons.dart';
import 'core/platform/eluna_adapters.dart';
import 'services/notification_service.dart';
import 'services/share_intake.dart';
import 'state/app_lock_controller.dart';
import 'state/data_erasers.dart';
import 'state/queue_controller.dart';
import 'state/settings_controller.dart';
import 'state/tips_controller.dart';
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
    // Ошибки фреймворка — в кольцевой лог и в краш-файл на устройстве. Никуда
    // не отправляется: на следующем запуске пользователь сам решает, показать
    // ли отчёт и отправить ли его своим почтовым клиентом.
    installFlutterErrorHandler();

    // Кто это приложение — для всех общих компонентов eluna_shared. Должно
    // выполниться до того, как построится хоть один общий экран: адрес
    // поддержки и ссылки на сторы читаются отсюда, и `Eluna.config` бросает
    // исключение, а не угадывает.
    //
    // Пустой список значков — не заглушка, а факт: альтернативных иконок у
    // Media нет, и общий экран прячет то, чего нет. Идентификаторы чаевых, в
    // отличие от него, теперь настоящие: пока таких товаров нет в Play Console,
    // магазин вернёт пустой список, и экран честно покажет, что покупать нечего.
    Eluna.configure(const ElunaAppConfig(
      appName: 'Eluna Media',
      // Идентификатор вне семейного шаблона `com.eluna.*` — так оно и есть на
      // устройствах, а переименование создало бы новое приложение.
      packageId: 'com.lunara.eluna_media',
      // Не `support@eluna.app`, зашитый в старом экране оценки: у семьи один
      // адрес, и письма со второго домена не приходили никуда.
      supportEmail: 'support@eluna-apps.com',
      websiteUrl: 'https://eluna-apps.com',
      appIcons: kAppIcons,
      defaultAppIconId: kDefaultAppIconId,
      tipProductIds: kTipProductIds,
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
    //
    // Отдаётся контроллеру, а не провайдеру: с v0.18 общий экран темы сам
    // предлагает и Material You, и «чисто чёрный», и ряд акцентов, — а
    // показать переключатель он может только зная, есть ли цвет вообще.
    // Приложению после этого не нужно протаскивать `Color?` ни в тему, ни в
    // настройки: `presetFor()` без аргумента берёт то, что здесь отдали.
    ElunaThemeController.instance
        .attachWallpaper(await const MediaDynamicColorAdapter().wallpaperAccent());

    // Второй переезд того же рода: якорь «дня 0» у Media лежал числом
    // миллисекунд под `meta.firstLaunchAtMs`, а общий сервис хранит его строкой
    // ISO под `rate_installed_at`. Без переноса день 0 сбросился бы на
    // обновлении, и все, кто уже прошёл окна 7–8 и 14–15 дней, зашли бы в них
    // заново — приложение просило бы оценку у тех, у кого уже просило.
    await RatingService().adoptLegacyInstalledAt('meta.firstLaunchAtMs');
    // А это — вторая половина того же: сам факт «уже оценил» жил под
    // `meta.hasRated`, и одна лишь дата установки его не переносит. Иначе
    // поставивший оценку на третий день получил бы вопрос ещё раз на седьмой.
    if (prefs.getBool('meta.hasRated') ?? false) {
      await RatingService().markRated();
    }

    final notifications = NotificationService.create();
    await notifications.init();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        notificationServiceProvider.overrideWithValue(notifications),
      ],
    );

    // «Удалить все мои данные» стирает то, что здесь зарегистрировано, и делает
    // это в фиксированном порядке: ключи, потом содержимое, настройки
    // последними (см. ElunaDataWipe). Регистрация — способ хранилища заявить о
    // себе; альтернатива, где одна функция знает про все хранилища приложения,
    // ровно так и перестаёт покрывать то, что добавили в прошлом месяце.
    //
    // Сам список — в `mediaDataErasers`, вместе с объяснением, чего в нём нет.
    ElunaDataWipe.registerAll(mediaDataErasers(
      container: container,
      notifications: notifications,
    ));

    // Замок — до первого кадра, иначе очередь с именами файлов успевает
    // мелькнуть под шторкой. Ответ заодно прогревает синхронный кэш сервиса,
    // из которого потом читает обработчик паузы: ему ждать нельзя.
    container.read(appLockStateProvider.notifier).resolve(
          configured: await container.read(appLockServiceProvider).isLockConfigured(),
        );

    // Announce readiness to the native side; files shared while the app was
    // dead flush through right after this.
    unawaited(container.read(shareIntakeProvider).start().catchError((Object e) {
      AppLogger.instance.w('share', 'intake channel unavailable', e);
    }));

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const ElunaApp(),
      ),
    );
  }, (error, stack) {
    // Local-only by principle: no telemetry, no upload.
    //
    // Media оборачивает весь запуск в эту зону, поэтому сюда приходит всё, что
    // не поймали, включая исключения непроавайченных Future. Кольцевой лог
    // живёт в памяти и умирает вместе с процессом — краш-файл переживает его и
    // на следующем запуске предлагается пользователю.
    AppLogger.instance.e('uncaught', error.toString(), shortStack(stack));
    CrashLog.record(error, stack, context: 'uncaught');
    // Остаётся последним рубежом: если сломался сам логгер, печать в консоль —
    // единственное, что ещё может сказать хоть что-то.
    debugPrint('Uncaught: $error\n$stack');
  });
}
