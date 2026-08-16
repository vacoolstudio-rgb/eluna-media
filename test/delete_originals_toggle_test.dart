import 'package:eluna_media/l10n/app_localizations.dart';
import 'package:eluna_media/services/original_media.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:eluna_media/ui/settings_tab.dart';
import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Переключатель «удалять оригиналы» спрашивает доступ в момент включения.
///
/// Раньше он просто записывал настройку: человек включал функцию и не получал
/// никакого сигнала, что она вообще будет работать, а системный запрос
/// приходил через полчаса — когда закончится батч. На iOS хуже: системный
/// запрос показывается **один раз за установку**, и после отказа функция
/// осталась бы мёртвой навсегда, ни разу не сказав почему.
///
/// Поэтому проверяется не «запрос ушёл», а последствие: при отказе
/// переключатель **не включается** и говорит об этом. Включённый переключатель
/// над неработающей функцией — ровно то враньё, ради которого этот тест есть.
class _FakeOriginalMedia implements OriginalMediaService {
  _FakeOriginalMedia(this.granted);

  final bool granted;
  var accessRequests = 0;
  var settingsOpened = 0;

  @override
  Future<ReclaimOutcome> delete(List<OriginalRef> items) async =>
      const ReclaimOutcome();

  @override
  Future<bool> requestAccess() async {
    accessRequests++;
    return granted;
  }

  @override
  Future<bool> openSystemSettings() async {
    settingsOpened++;
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const kTitle = 'Delete originals after converting';
  const kDenied = 'Access to your media library is needed to delete originals.';

  Future<_FakeOriginalMedia> pump(
    WidgetTester tester, {
    required bool granted,
    bool alreadyOn = false,
  }) async {
    SharedPreferences.setMockInitialValues(
      alreadyOn ? {'app.deleteOriginalsAfterConversion': true} : {},
    );
    final prefs = await SharedPreferences.getInstance();
    final fake = _FakeOriginalMedia(granted);

    // Высоты хватает, чтобы построился весь список: секция хранилища живёт
    // ниже экрана телефона, а `ListView` строит только видимое.
    final view = tester.view;
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(420, 4000);
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        originalMediaProvider.overrideWithValue(fake),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        theme: ElunaTheme.light(preset: kElunaThemes.first),
        localizationsDelegates: [
          ...L10n.localizationsDelegates,
          ElunaL10n.delegate,
          ...kFallbackLocalizationsDelegates,
        ],
        supportedLocales: L10n.supportedLocales,
        home: const SettingsTab(),
      ),
    ));
    await tester.pumpAndSettle();
    return fake;
  }

  SwitchListTile tileOf(WidgetTester tester) => tester.widget<SwitchListTile>(
        find.ancestor(
          of: find.text(kTitle),
          matching: find.byType(SwitchListTile),
        ),
      );

  testWidgets('отказ в доступе не включает переключатель и говорит об этом',
      (tester) async {
    final fake = await pump(tester, granted: false);
    expect(tileOf(tester).value, isFalse, reason: 'исходно выключен');

    await tester.tap(find.text(kTitle));
    await tester.pumpAndSettle();

    expect(fake.accessRequests, 1, reason: 'доступ спрошен при включении');
    expect(tileOf(tester).value, isFalse,
        reason: 'без доступа функция не работает — переключатель обязан остаться выключенным');
    expect(find.text(kDenied), findsOneWidget, reason: 'молчаливый отказ читается как поломка');
  });

  testWidgets('из объяснения есть дорога в системные настройки', (tester) async {
    // Единственный путь назад: своего запроса у приложения после отказа
    // больше не будет — на iOS система его не покажет никогда.
    final fake = await pump(tester, granted: false);
    await tester.tap(find.text(kTitle));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(fake.settingsOpened, 1);
  });

  testWidgets('с доступом переключатель включается', (tester) async {
    final fake = await pump(tester, granted: true);

    await tester.tap(find.text(kTitle));
    await tester.pumpAndSettle();

    expect(fake.accessRequests, 1);
    expect(tileOf(tester).value, isTrue);
    expect(find.text(kDenied), findsNothing);
  });

  testWidgets('выключение ничего не спрашивает', (tester) async {
    // Отзывать разрешение приложение не умеет, и лишний системный диалог на
    // выключении был бы вопросом, на который нечего ответить.
    final fake = await pump(tester, granted: true, alreadyOn: true);
    expect(tileOf(tester).value, isTrue);

    await tester.tap(find.text(kTitle));
    await tester.pumpAndSettle();

    expect(fake.accessRequests, 0);
    expect(tileOf(tester).value, isFalse);
  });
}
