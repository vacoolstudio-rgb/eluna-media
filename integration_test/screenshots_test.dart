import 'dart:io';

import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/l10n/app_localizations.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:eluna_media/ui/achievements_screen.dart';
import 'package:eluna_media/ui/home_shell.dart';
import 'package:eluna_media/ui/privacy_intro_screen.dart';
import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Снимки для витрины магазина.
///
/// Почему не «запустить приложение и потыкать»: чтобы кадр показывал очередь с
/// файлами, файлы надо выбрать в системном выборщике, а нажать в нём некому.
/// Поэтому состояние засевается в хранилище — очередь его восстанавливает при
/// старте, ровно как после перезапуска у пользователя, — и экраны строятся
/// напрямую. Картинка при этом настоящая: рендерит устройство, а не хост.
///
/// Локаль приходит снаружи: `--dart-define=SHOT_LOCALE=de`. Имя кадра несёт
/// папку — драйвер просто кладёт байты по этому пути.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Две разные вещи, которые легко спутать. `SHOT_LOCALE` — код витрины
  // магазина (`zh-Hans`, `pt-BR`), он идёт только в имя папки. `SHOT_LANG` —
  // код языка приложения (`zh`, `pt_BR`), которым рисуется экран. У Apple и у
  // Flutter эти списки не совпадают, и подстановка одного вместо другого даёт
  // не ошибку, а молча английский кадр в папке с китайским именем.
  const locale = String.fromEnvironment('SHOT_LOCALE', defaultValue: 'en-US');
  const lang = String.fromEnvironment('SHOT_LANG', defaultValue: 'en');
  const device = String.fromEnvironment('SHOT_DEVICE', defaultValue: 'phone');

  final parts = lang.split('_');
  final shotLocale = parts.length > 1 ? Locale(parts[0], parts[1]) : Locale(parts[0]);

  late Directory work;
  late SharedPreferences prefs;

  setUp(() async {
    work = await Directory.systemTemp.createTemp('eluna_shots');
    SharedPreferences.setMockInitialValues(_seed(work));
    prefs = await SharedPreferences.getInstance();
  });

  tearDown(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  Future<void> shoot(WidgetTester tester, String name, Widget home,
      {Future<void> Function(WidgetTester)? after}) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: shotLocale,
        theme: ElunaTheme.dark(preset: kElunaThemes.first),
        localizationsDelegates: [
          ...L10n.localizationsDelegates,
          ElunaL10n.delegate,
          ...kFallbackLocalizationsDelegates,
        ],
        supportedLocales: L10n.supportedLocales,
        home: home,
      ),
    ));
    // Достижения и очередь читают хранилище асинхронно; один pump поймал бы
    // экран до того, как на нём появились данные.
    await tester.pumpAndSettle(const Duration(seconds: 1));
    if (after != null) await after(tester);
    await binding.takeScreenshot('$locale/$device/$name');
  }

  testWidgets('01 конвертация', (tester) async {
    await shoot(tester, '01_convert', const HomeShell());
  });

  testWidgets('02 очередь', (tester) async {
    // Вкладки переключаются по иконке, а не по подписи: подпись переведена на
    // 61 язык, иконка одна.
    await shoot(tester, '02_queue', const HomeShell(),
        after: (tester) async {
      await tester.tap(find.byIcon(Icons.layers_rounded));
      await tester.pumpAndSettle();
    });
  });

  testWidgets('03 настройки', (tester) async {
    await shoot(tester, '03_settings', const HomeShell(),
        after: (tester) async {
      await tester.tap(find.byIcon(Icons.settings_rounded));
      await tester.pumpAndSettle();
    });
  });

  testWidgets('04 приватность', (tester) async {
    // Вступительный экран, а НЕ «Сеть и приватность». Тот написан под Android
    // и на снимке говорит «Play Store» и «разрешение на доступ в интернет» —
    // в витрине App Store это не только неправда, но и упоминание чужого
    // магазина, за которое отклоняют. Сам экран надо чинить отдельно.
    await shoot(tester, '04_privacy', const PrivacyIntroScreen());
  });

  testWidgets('05 достижения', (tester) async {
    await shoot(tester, '05_achievements', const AchievementsScreen());
  });
}

/// Состояние, которое видно на кадрах.
///
/// Один файл готов, второй в работе — вместе они показывают и результат, и
/// процесс. Имена нарочно обычные: «VID_20260816_183045.mov» узнаётся как своё,
/// а «sample.mp4» выглядит как витринная заглушка, каковой и является.
Map<String, Object> _seed(Directory work) {
  File make(String name, int mb) => File('${work.path}/$name')
    ..writeAsBytesSync(List.filled(mb * 1024 * 1024, 7));

  final clip = make('VID_20260816_183045.mov', 48);
  final clipOut = make('VID_20260816_183045.mp4', 9);
  final photo = make('IMG_4417.HEIC', 4);
  final second = make('IMG_4418.HEIC', 5);
  final song = make('Interview.wav', 62);

  ConversionJob queued(String id, File f, String name, ContainerFormat to, int mb) =>
      ConversionJob(
        id: id,
        inputPath: f.path,
        inputName: name,
        settings: ConversionSettings.defaultsFor(to),
        status: JobStatus.queued,
        inputBytes: mb * 1024 * 1024,
      );

  return {
    'queue.v1': QueueStorage.encode([
      // Готовое — оно и есть обещание: 48 МБ стали 9.
      ConversionJob(
        id: 'shot1',
        inputPath: clip.path,
        inputName: 'VID_20260816_183045.mov',
        settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
        status: JobStatus.completed,
        outputPath: clipOut.path,
        inputBytes: 48 * 1024 * 1024,
        outputBytes: 9 * 1024 * 1024,
      ),
      // Ожидающее — чтобы вкладка «Активные» показывала батч, а не одну
      // карточку в пустоте: витрина должна показывать работу, а не заготовку.
      queued('shot2', photo, 'IMG_4417.HEIC', ContainerFormat.jpg, 4),
      queued('shot3', second, 'IMG_4418.HEIC', ContainerFormat.jpg, 5),
      queued('shot4', song, 'Interview.wav', ContainerFormat.mp3, 62),
    ]),
    'meta.hasSeenIntro': true,
    'ach.conversions': 34,
    'ach.savedBytes': 2 * 1024 * 1024 * 1024,
  };
}
