import 'package:eluna_media/l10n/app_localizations.dart';
import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Проверяет каждый заявленный язык на живом дереве виджетов.
///
/// Список поддерживаемых языков и список языков, которые умеет сам Flutter, —
/// разные списки, и расходятся они молча. `flutter_localizations` знает 116
/// локалей; у нас есть хауса, которого там нет. Локаль, объявленная в
/// `supportedLocales`, но неизвестная `GlobalMaterialLocalizations`, роняет
/// приложение на первом же виджете Material, спросившем подсказку, — и только
/// у того, у кого телефон на этом языке.
///
/// Спасают `kFallbackLocalizationsDelegates` из общего пакета: они отвечают
/// «да» на любой язык и отдают английские строки Material там, где перевода
/// нет. Этот тест существует, чтобы порядок делегатов нельзя было испортить
/// незаметно.
void main() {
  /// Ровно тот же список, что в `lib/ui/app.dart`. Расхождение здесь означало
  /// бы, что тест проверяет не то, что собирается.
  final delegates = <LocalizationsDelegate<dynamic>>[
    ...L10n.localizationsDelegates,
    ElunaL10n.delegate,
    ...kFallbackLocalizationsDelegates,
  ];

  /// Языки, которые пишутся справа налево. Flutter определяет направление сам
  /// по коду языка; список нужен, чтобы проверить, что он это делает.
  const rtl = {'ar', 'he', 'fa', 'ur'};

  testWidgets('языков достаточно много, чтобы проверка имела смысл', (t) async {
    expect(L10n.supportedLocales.length, greaterThanOrEqualTo(61));
  });

  for (final locale in L10n.supportedLocales) {
    final code = locale.countryCode == null
        ? locale.languageCode
        : '${locale.languageCode}_${locale.countryCode}';

    testWidgets('$code: экран строится и находит все таблицы строк', (t) async {
      late BuildContext ctx;
      await t.pumpWidget(MaterialApp(
        locale: locale,
        localizationsDelegates: delegates,
        supportedLocales: L10n.supportedLocales,
        home: Builder(builder: (context) {
          ctx = context;
          // Tooltip намеренно: он лезет в MaterialLocalizations при первой же
          // отрисовке, то есть воспроизводит ровно тот путь, на котором
          // непокрытая локаль и падает.
          return const Tooltip(message: 'x', child: Text('x'));
        }),
      ));

      // Все три таблицы обязаны найтись: своя, общая для пакета и Material.
      expect(L10n.of(ctx).appTitle, isNotEmpty);
      expect(ElunaL10n.of(ctx).appIconTitle, isNotEmpty);
      expect(MaterialLocalizations.of(ctx).okButtonLabel, isNotEmpty);

      // И направление письма — то, которого язык требует.
      expect(
        Directionality.of(ctx),
        rtl.contains(locale.languageCode) ? TextDirection.rtl : TextDirection.ltr,
        reason: '$code: направление письма определилось неверно',
      );
    });
  }
}
