import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../state/app_meta_controller.dart';
import '../state/settings_controller.dart';
import 'home_shell.dart';
import 'privacy_intro_screen.dart';
import 'theme.dart';
import 'widgets/ambient_background.dart';

class ElunaApp extends ConsumerWidget {
  const ElunaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(appPrefsProvider);
    final hasSeenIntro = ref.watch(appMetaProvider.select((m) => m.hasSeenIntro));

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final useDynamic = prefs.dynamicColor;
        return MaterialApp(
          onGenerateTitle: (context) => L10n.of(context).appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(dynamicScheme: useDynamic ? lightDynamic : null),
          darkTheme: AppTheme.dark(
            dynamicScheme: useDynamic ? darkDynamic : null,
            oled: prefs.oledDark,
          ),
          themeMode: prefs.themeMode,
          locale: prefs.locale,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          // Every screen sits on the ambient canvas, and the chrome is capped
          // at a 1.25 text scale so a huge system font cannot shred the
          // navigation while still scaling the content people read.
          builder: (context, child) {
            final mq = MediaQuery.of(context);
            return MediaQuery(
              data: mq.copyWith(
                textScaler: mq.textScaler.clamp(minScaleFactor: 0.9, maxScaleFactor: 1.25),
              ),
              child: AmbientBackground(emphasized: true, child: child!),
            );
          },
          // The privacy intro is the app's front door exactly once.
          home: hasSeenIntro ? const HomeShell() : const PrivacyIntroScreen(),
        );
      },
    );
  }
}
