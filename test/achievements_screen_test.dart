import 'package:eluna_media/l10n/app_localizations.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:eluna_media/ui/achievements_screen.dart';
import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The achievements shelf: three tabs that really filter, and a card that
/// really opens.
///
/// Worth a test because every one of those is a claim about *stored* state —
/// the tabs split on `unlocked`, which comes out of SharedPreferences through
/// the shared catalogue's `evaluate`, and a wrong key there shows up as a shelf
/// that is simply always empty.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SharedPreferences prefs;

  setUp(() async {
    // The detail sheet and the summary sign themselves with the app's name, and
    // `Eluna.config` throws rather than guessing.
    Eluna.configure(const ElunaAppConfig(
      appName: 'Eluna Media',
      packageId: 'com.lunara.eluna_media',
      supportEmail: 'support@eluna-apps.com',
      appIcons: [],
      tipProductIds: [],
    ));
    // One conversion: enough for "First steps" (target 1) and nothing else.
    SharedPreferences.setMockInitialValues({'ach.conversions': 1});
    prefs = await SharedPreferences.getInstance();
  });

  Future<void> pump(WidgetTester tester) async {
    // Tall enough that the whole shelf is built: `ListView.builder` only
    // creates what fits, and an assertion about "is this one on this tab" would
    // otherwise be an assertion about scroll offset.
    final view = tester.view;
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(420, 2600);
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: MaterialApp(
          locale: const Locale('en'),
          // The rings and the ambient canvas read Eluna's theme extension; the
          // bare Material default has none.
          theme: ElunaTheme.light(preset: kElunaThemes.first),
          localizationsDelegates: [
            ...L10n.localizationsDelegates,
            ElunaL10n.delegate,
            ...kFallbackLocalizationsDelegates,
          ],
          supportedLocales: L10n.supportedLocales,
          home: const AchievementsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('the tabs split the shelf by what is actually earned',
      (tester) async {
    await pump(tester);

    // "All" opens first and holds both.
    expect(find.text('First steps'), findsOneWidget);
    expect(find.text('Meme smith'), findsOneWidget);

    await tester.tap(find.text('Unlocked'));
    await tester.pumpAndSettle();
    expect(find.text('First steps'), findsOneWidget);
    expect(find.text('Meme smith'), findsNothing);

    await tester.tap(find.text('Locked'));
    await tester.pumpAndSettle();
    expect(find.text('First steps'), findsNothing);
    expect(find.text('Meme smith'), findsOneWidget);
  });

  testWidgets('the progress header counts the whole shelf on every tab',
      (tester) async {
    await pump(tester);
    // 1 of 18, wherever you are: the header describes the collection, not the
    // tab. `achievementsCount` renders as "1/18".
    expect(find.text('1/18'), findsOneWidget);

    await tester.tap(find.text('Locked'));
    await tester.pumpAndSettle();
    expect(find.text('1/18'), findsOneWidget);
  });

  testWidgets('a locked achievement still opens its detail sheet',
      (tester) async {
    await pump(tester);
    await tester.tap(find.text('Locked'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Meme smith'));
    await tester.pumpAndSettle();

    // The sheet is the only place with a share button, and sharing an
    // unfinished achievement is the point of having one at all.
    expect(find.text('Share'), findsOneWidget);
    // Title appears twice now: on the card behind and on the sheet.
    expect(find.text('Meme smith'), findsNWidgets(2));
  });
}
