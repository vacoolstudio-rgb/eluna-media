import 'package:eluna_media/domain/app_icons.dart';
import 'package:eluna_media/l10n/app_localizations.dart';
import 'package:eluna_media/state/tips_controller.dart';
import 'package:eluna_media/ui/tip_screen.dart';
import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Снимок экрана чаевых для проверяющего Apple.
///
/// Без него покупки не выходят из состояния «не хватает метаданных»: Apple
/// требует показать, **где именно** в приложении предлагается товар.
///
/// Товары подставляются заглушкой, и это не подлог. На симуляторе StoreKit не
/// отдаёт ничего, и настоящий экран показал бы «покупать нечего» — то есть не
/// показал бы проверяющему ровно то, ради чего снимок нужен. Идентификаторы,
/// названия и цены здесь те же, что заведены в App Store Connect, а рисует их
/// тот же самый экран, что увидит человек.
class _StubStore implements ElunaPurchaseAdapter {
  @override
  Future<bool> isAvailable() async => true;

  @override
  Future<List<ElunaTipProduct>> queryProducts(Set<String> ids) async => const [
        ElunaTipProduct(
          id: kTipCoffee,
          title: 'Coffee',
          description: 'A small thank you',
          price: r'$1.99',
        ),
        ElunaTipProduct(
          id: kTipSnack,
          title: 'Snack',
          description: 'A bigger thank you',
          price: r'$4.99',
        ),
        ElunaTipProduct(
          id: kTipGenerous,
          title: 'Generous',
          description: 'A very generous thank you',
          price: r'$9.99',
        ),
      ];

  @override
  Future<ElunaPurchaseResult> buy(String productId) async =>
      throw UnimplementedError('снимок не покупает');
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Общие компоненты пакета читают, что это за приложение, из `Eluna.config`;
  // без этого `TipsController.init` падает, не дойдя до магазина.
  setUpAll(() {
    Eluna.configure(const ElunaAppConfig(
      appName: 'Eluna Media',
      packageId: 'com.eluna.media',
      supportEmail: 'support@eluna-apps.com',
      websiteUrl: 'https://eluna-apps.com',
      appIcons: kAppIcons,
      defaultAppIconId: kDefaultAppIconId,
      tipProductIds: kTipProductIds,
      notificationSmallIcon: '@mipmap/ic_launcher',
    ));
  });

  testWidgets('экран чаевых', (tester) async {
    final controller = TipsController(_StubStore())..init();
    addTearDown(controller.dispose);

    await tester.pumpWidget(ProviderScope(
      overrides: [tipsControllerProvider.overrideWithValue(controller)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        theme: ElunaTheme.dark(preset: kElunaThemes.first),
        localizationsDelegates: [
          ...L10n.localizationsDelegates,
          ElunaL10n.delegate,
          ...kFallbackLocalizationsDelegates,
        ],
        supportedLocales: L10n.supportedLocales,
        home: const TipScreen(),
      ),
    ));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await binding.takeScreenshot('iap/tip_screen');
  });
}
