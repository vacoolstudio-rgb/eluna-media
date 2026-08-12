import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../state/app_lock_controller.dart';
import '../state/app_meta_controller.dart';
import '../state/settings_controller.dart';
import 'home_shell.dart';
import 'lock_screen.dart';
import 'privacy_intro_screen.dart';

class ElunaApp extends ConsumerStatefulWidget {
  const ElunaApp({super.key});

  @override
  ConsumerState<ElunaApp> createState() => _ElunaAppState();
}

class _ElunaAppState extends ConsumerState<ElunaApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycle) {
    // Шторка поднимается НА паузе, а не на возврате: тогда в снимок для списка
    // недавних задач попадает она, а не очередь с именами файлов. Снимается она
    // либо кодом, либо сама — если отлучка была короче паузы из
    // `AppLockGate.graceOnReturn` (системный пикер, лист «Поделиться», диалог
    // удаления оригиналов — это чужие Activity, и уход в них неотличим от
    // сворачивания).
    final gate = ref.read(appLockStateProvider.notifier);
    switch (lifecycle) {
      case AppLifecycleState.paused:
        gate.paused();
      case AppLifecycleState.resumed:
        gate.resumed();
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(appPrefsProvider);
    final hasSeenIntro = ref.watch(appMetaProvider.select((m) => m.hasSeenIntro));

    // Оформление живёт в общем контроллере, язык — по-прежнему в настройках
    // приложения: строк у Media свои 15 языков, и общий список из 59 к ним
    // отношения не имеет.
    //
    // ListenableBuilder, а не провайдер: riverpod 3 больше не умеет
    // ChangeNotifierProvider, а контроллер — синглтон и в провайдере не
    // нуждается.
    return ListenableBuilder(
      listenable: ElunaThemeController.instance,
      builder: (context, _) {
        final appearance = ElunaThemeController.instance;
        // `presetFor()`, а не `preset`: именно он подмешивает Material You.
        // Акцент обоев снят один раз в `main`, до первого кадра, и отдан
        // контроллеру — поэтому аргумент не нужен. Смена обоев на живом
        // приложении подхватится при перезапуске: за подпиской на неё пришлось
        // бы держать `DynamicColorBuilder` вокруг всего дерева, а он
        // перестраивает его целиком на каждое изменение настроек.
        final preset = appearance.presetFor();

        return MaterialApp(
          onGenerateTitle: (context) => L10n.of(context).appTitle,
          debugShowCheckedModeBanner: false,
          theme: ElunaTheme.light(preset: preset),
          darkTheme: ElunaTheme.dark(
            preset: preset,
            pureBlack: appearance.pureBlack,
          ),
          themeMode: appearance.mode,
          locale: prefs.locale,
          localizationsDelegates: [
            ...L10n.localizationsDelegates,
            // Таблица строк общих компонентов — РЯДОМ с таблицей приложения, а
            // не вместо неё. Без этой строки любой экран из пакета падает на
            // первом же обращении к ElunaL10n, и падает только в рантайме.
            ElunaL10n.delegate,
            // Последними: они отвечают «да» на любой язык и отдают английские
            // строки Material/Cupertino там, где перевода нет вовсе.
            ...kFallbackLocalizationsDelegates,
          ],
          supportedLocales: L10n.supportedLocales,
          // Every screen sits on the ambient canvas, and the chrome is capped
          // at a 1.25 text scale so a huge system font cannot shred the
          // navigation while still scaling the content people read.
          builder: (context, child) {
            final mq = MediaQuery.of(context);
            return AnnotatedRegion<SystemUiOverlayStyle>(
              // Экраны без AppBar иначе донашивают стиль системных панелей от
              // темы запуска: после смены темы там оказываются тёмные иконки на
              // тёмном фоне.
              value: ElunaTheme.overlayStyle(Theme.of(context).brightness),
              child: MediaQuery(
                data: mq.copyWith(
                  textScaler: mq.textScaler
                      .clamp(minScaleFactor: 0.9, maxScaleFactor: 1.25),
                ),
                child: AmbientBackground(
                  emphasized: true,
                  // Замок — слой над всем деревом, включая открытые диалоги и
                  // шторки. Маршрутом он был бы снимаемым: `pop`, системная
                  // кнопка «назад» или восстановление состояния провели бы мимо
                  // него.
                  child: Stack(
                    children: [
                      child!,
                      Consumer(
                        builder: (context, ref, _) =>
                            switch (ref.watch(appLockStateProvider)) {
                          AppLockState.unlocked => const SizedBox.shrink(),
                          AppLockState.locked => const LockScreen(),
                          // Пока ответ не пришёл — непрозрачный фон без
                          // клавиатуры: ни очередь, ни призрачный запрос кода
                          // показывать нельзя.
                          AppLockState.checking => const AmbientBackground(
                              emphasized: true,
                              child: SizedBox.expand(),
                            ),
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          // The privacy intro is the app's front door exactly once.
          home: hasSeenIntro ? const HomeShell() : const PrivacyIntroScreen(),
        );
      },
    );
  }
}
