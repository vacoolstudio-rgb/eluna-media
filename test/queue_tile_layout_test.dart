import 'dart:io';

import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/l10n/app_localizations.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:eluna_media/ui/convert_tab.dart';
import 'package:eluna_media/ui/queue_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The job tile's action row must fit on a small phone.
///
/// A `RenderFlex` overflow raises a Flutter error, which `flutter_test` turns
/// into a test failure — so simply rendering the tile at a narrow width and in a
/// verbose locale is the whole assertion.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmp;
  late SharedPreferences prefs;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('eluna_layout');
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  tearDown(() {
    if (tmp.existsSync()) tmp.deleteSync(recursive: true);
  });

  /// A completed job shows the widest action row: Open, Save, Share, Remove.
  Future<void> seedCompleted() async {
    final source = File('${tmp.path}${Platform.pathSeparator}a_rather_long_source_name.mov')
      ..writeAsBytesSync(List.filled(64, 1));
    final output = File('${tmp.path}${Platform.pathSeparator}a_rather_long_source_name.mp4')
      ..writeAsBytesSync(List.filled(32, 1));

    await prefs.setString(
      'queue.v1',
      QueueStorage.encode([
        ConversionJob(
          id: 'j1',
          inputPath: source.path,
          inputName: 'a_rather_long_source_name.mov',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
          status: JobStatus.completed,
          outputPath: output.path,
          inputBytes: 64,
          outputBytes: 32,
        ),
      ]),
    );
  }

  /// A queued job, which belongs on the Active tab.
  Future<void> seedQueued() async {
    final source = File('${tmp.path}${Platform.pathSeparator}waiting.mov')
      ..writeAsBytesSync(List.filled(64, 1));

    await prefs.setString(
      'queue.v1',
      QueueStorage.encode([
        ConversionJob(
          id: 'j2',
          inputPath: source.path,
          inputName: 'waiting.mov',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
          inputBytes: 64,
        ),
      ]),
    );
  }

  /// Finished jobs live on the second tab now, so the layout assertions have
  /// to go there to find the action row at all.
  Future<void> openFinishedTab(WidgetTester tester, String label) async {
    await tester.tap(find.textContaining(label));
    await tester.pumpAndSettle();
  }

  Future<void> pumpAt(WidgetTester tester, Size logical, Locale locale) async {
    final view = tester.view;
    view.devicePixelRatio = 1;
    view.physicalSize = logical;
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: MaterialApp(
          locale: locale,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: const QueueTab(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  // 320dp is the narrowest width Android asks apps to support.
  const narrow = Size(320, 640);

  testWidgets('the action row fits a 320dp phone in English', (tester) async {
    await seedCompleted();
    await pumpAt(tester, narrow, const Locale('en'));
    await openFinishedTab(tester, 'Finished');
    expect(find.text('Share'), findsOneWidget);
    expect(find.text('Remove'), findsOneWidget);
  });

  testWidgets('the action row fits a 320dp phone in Russian', (tester) async {
    // Russian labels are noticeably longer; this is the case that overflowed.
    await seedCompleted();
    await pumpAt(tester, narrow, const Locale('ru'));
    await openFinishedTab(tester, 'Завершённые');
    expect(find.text('Поделиться'), findsOneWidget);
    expect(find.text('Удалить'), findsOneWidget);
  });

  testWidgets('the queue lays out right-to-left in Arabic', (tester) async {
    // Arabic is the first RTL language the app ships, and RTL is not a
    // translation problem — it is a layout one. Flutter mirrors the tree only
    // where widgets ask for directional geometry; a stray EdgeInsets.only(left:)
    // or a hand-placed Positioned stays put and lands under something else.
    // Nothing had ever rendered this app in an RTL locale before.
    await seedCompleted();
    await pumpAt(tester, narrow, const Locale('ar'));
    expect(Directionality.of(tester.element(find.byType(QueueTab))),
        TextDirection.rtl);
    await openFinishedTab(tester, 'مكتمل');
    expect(find.text('مشاركة'), findsOneWidget);
    expect(find.text('إزالة'), findsOneWidget);
  });

  // Три остальных языка справа налево. Дело не в повторении: у иврита,
  // фарси и урду заметно разная длина слов, а ряд кнопок на 320 dp — самое
  // узкое место в приложении, и переполняется он именно от длины подписи.
  for (final (code, finished, share, remove) in <(String, String, String, String)>[
    ('he', "הושלמו", "שיתוף", "הסרה"),
    ('fa', "پایان‌یافته", "اشتراک‌گذاری", "حذف"),
    ('ur', "مکمل", "شیئر کریں", "ہٹائیں"),
  ]) {
    testWidgets('the queue lays out right-to-left in $code', (tester) async {
      await seedCompleted();
      await pumpAt(tester, narrow, Locale(code));
      expect(Directionality.of(tester.element(find.byType(QueueTab))),
          TextDirection.rtl);
      await openFinishedTab(tester, finished.split(' ').first);
      expect(find.text(share), findsOneWidget);
      expect(find.text(remove), findsOneWidget);
    });
  }

  testWidgets('the action row survives a large text scale', (tester) async {
    await seedCompleted();

    final view = tester.view;
    view.devicePixelRatio = 1;
    view.physicalSize = narrow;
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: MaterialApp(
          locale: const Locale('ru'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(1.5)),
            child: const QueueTab(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await openFinishedTab(tester, 'Завершённые');

    expect(find.text('Поделиться'), findsOneWidget);
  });

  testWidgets('the queue separates active jobs from finished ones', (tester) async {
    await seedCompleted();
    await pumpAt(tester, narrow, const Locale('en'));

    // Active is the landing tab, and a finished job does not belong on it.
    expect(find.text('Active · 0'), findsOneWidget);
    expect(find.text('Finished · 1'), findsOneWidget);
    expect(find.text('a_rather_long_source_name.mov'), findsNothing);
    expect(find.text('Nothing in progress'), findsOneWidget);

    await openFinishedTab(tester, 'Finished');
    expect(find.text('a_rather_long_source_name.mov'), findsOneWidget);
  });

  testWidgets('a waiting job shows on the active tab, not the finished one',
      (tester) async {
    await seedQueued();
    await pumpAt(tester, narrow, const Locale('en'));

    expect(find.text('Active · 1'), findsOneWidget);
    expect(find.text('Finished · 0'), findsOneWidget);
    expect(find.text('waiting.mov'), findsOneWidget);

    await openFinishedTab(tester, 'Finished');
    expect(find.text('waiting.mov'), findsNothing);
    expect(find.text('Nothing finished yet'), findsOneWidget);
  });

  testWidgets('the convert tab lays out on a 320dp phone in Russian', (tester) async {
    final view = tester.view;
    view.devicePixelRatio = 1;
    view.physicalSize = narrow;
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: MaterialApp(
          locale: const Locale('ru'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: const ConvertTab(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Добавить файлы'), findsOneWidget);
  });
}
