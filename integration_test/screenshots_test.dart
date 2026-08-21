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
  // Две разные вещи, которые легко спутать. `SHOT_LOCALE` — код витрины
  // магазина (`zh-Hans`, `pt-BR`), он идёт только в имя папки. `SHOT_LANG` —
  // код языка приложения (`zh`, `pt_BR`), которым рисуется экран. У Apple и у
  // Flutter эти списки не совпадают, и подстановка одного вместо другого даёт
  // не ошибку, а молча английский кадр в папке с китайским именем.
  const locale = String.fromEnvironment('SHOT_LOCALE', defaultValue: 'en-US');
  const lang = String.fromEnvironment('SHOT_LANG', defaultValue: 'en');
  const device = String.fromEnvironment('SHOT_DEVICE', defaultValue: 'phone');

  // `SHOT_LOCALES=en-US:en,ru-RU:ru,…` снимает несколько витрин за один
  // запуск. Сборка приложения занимает больше времени, чем все кадры вместе, и
  // повторять её по разу на язык — это часы вместо минут. Пустое значение
  // оставляет прежнее поведение: одна локаль из `SHOT_LOCALE`/`SHOT_LANG`.
  const locales = String.fromEnvironment('SHOT_LOCALES');

  final targets = locales.isEmpty
      ? <List<String>>[
          [locale, lang]
        ]
      : locales
          .split(',')
          .map((pair) => pair.trim())
          .where((pair) => pair.contains(':'))
          .map((pair) => [
                pair.split(':')[0].trim(),
                pair.split(':')[1].trim(),
              ])
          .toList();

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

  Future<void> shoot(
    WidgetTester tester,
    String store,
    Locale ui,
    String name,
    Widget home, {
    Future<void> Function(WidgetTester)? after,
  }) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: ui,
        theme: ElunaTheme.dark(preset: kElunaThemes.first),
        localizationsDelegates: [
          ...L10n.localizationsDelegates,
          ElunaL10n.delegate,
          ...kFallbackLocalizationsDelegates,
        ],
        supportedLocales: L10n.supportedLocales,
        // Каждый экран приложения сидит на фирменном градиенте, который рисует
        // корневой `ElunaApp`, а сами Scaffold'ы прозрачные. Без этой обёртки
        // кадр выходит с прозрачным фоном — в PNG это альфа, а в витрине
        // магазина белый лист под тёмным интерфейсом.
        builder: (context, child) => AmbientBackground(
          emphasized: true,
          child: child!,
        ),
        home: home,
      ),
    ));
    // Достижения и очередь читают хранилище асинхронно; один pump поймал бы
    // экран до того, как на нём появились данные.
    await tester.pumpAndSettle(const Duration(seconds: 1));
    if (after != null) await after(tester);
    // Android снимает не Flutter, а поверхность SurfaceView, и до конвертации
    // её содержимое системе недоступно: `takeScreenshot` бросает StateError.
    // На iOS этого шага нет — оттого оснастка, написанная под App Store,
    // падала на каждом кадре в эмуляторе.
    if (Platform.isAndroid) {
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
    }
    await binding.takeScreenshot('$store/$device/$name');
  }

  for (final target in targets) {
    final store = target[0];
    final parts = target[1].split('_');
    final ui = parts.length > 1 ? Locale(parts[0], parts[1]) : Locale(parts[0]);

    testWidgets('$store 01 конвертация', (tester) async {
      await shoot(tester, store, ui, '01_convert', const HomeShell());
    });

    testWidgets('$store 02 очередь', (tester) async {
      // Вкладки переключаются по иконке, а не по подписи: подпись переведена на
      // 61 язык, иконка одна.
      await shoot(tester, store, ui, '02_queue', const HomeShell(),
          after: (tester) async {
        await tester.tap(find.byIcon(Icons.layers_rounded));
        await tester.pumpAndSettle();
      });
    });

    testWidgets('$store 03 настройки', (tester) async {
      await shoot(tester, store, ui, '03_settings', const HomeShell(),
          after: (tester) async {
        await tester.tap(find.byIcon(Icons.settings_rounded));
        await tester.pumpAndSettle();
      });
    });

    testWidgets('$store 04 приватность', (tester) async {
      // Вступительный экран, а НЕ «Сеть и приватность». Тот написан под Android
      // и на снимке говорит «Play Store» и «разрешение на доступ в интернет» —
      // в витрине App Store это не только неправда, но и упоминание чужого
      // магазина, за которое отклоняют. Сам экран надо чинить отдельно.
      await shoot(tester, store, ui, '04_privacy', const PrivacyIntroScreen());
    });

    testWidgets('$store 05 достижения', (tester) async {
      await shoot(tester, store, ui, '05_achievements', const AchievementsScreen());
    });

    testWidgets('$store 06 готово', (tester) async {
      // Обещание витрины целиком: 48 МБ стали 9. Вкладка выбирается по
      // индексу, а не по подписи, — подписи переведены на 61 язык, порядок
      // вкладок один.
      await shoot(tester, store, ui, '06_finished', const HomeShell(),
          after: (tester) async {
        await tester.tap(find.byIcon(Icons.layers_rounded));
        await tester.pumpAndSettle();
        await tester.tap(find.byType(Tab).at(1));
        await tester.pumpAndSettle();
      });
    });
  }
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
