import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../state/app_meta_controller.dart';
import '../state/settings_controller.dart';
import 'home_shell.dart';
import 'privacy_intro_screen.dart';

class ElunaApp extends ConsumerWidget {
  const ElunaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(appPrefsProvider);
    final hasSeenIntro = ref.watch(appMetaProvider.select((m) => m.hasSeenIntro));

    // Акцент обоев снят один раз в `main`, до первого кадра, и независимо от
    // того, включён ли Material You: тогда включение переключателя перекрашивает
    // приложение сразу. Смена обоев на живом приложении подхватится при
    // перезапуске — за подпиской на неё пришлось бы держать `DynamicColorBuilder`
    // вокруг всего дерева, а он перестраивает его целиком на каждое изменение
    // настроек.
    final wallpaperAccent = ref.watch(wallpaperAccentProvider);

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
        final preset = appearance.presetFor(wallpaperAccent);

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
                child: AmbientBackground(emphasized: true, child: child!),
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
