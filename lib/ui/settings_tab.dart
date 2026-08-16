import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_plus/share_plus.dart';

import '../core/output_paths.dart';
import '../domain/achievements.dart';
import '../domain/app_icons.dart';
import '../l10n/app_localizations.dart';
import '../services/app_icon.dart';
import '../services/original_media.dart';
import '../state/achievements_controller.dart';
import '../state/app_lock_controller.dart';
import '../state/app_meta_controller.dart';
import '../state/settings_controller.dart';
import '../state/storage_controller.dart';
import 'achievements_screen.dart';
import 'network_privacy_screen.dart';
import 'support_screen.dart';
import 'tip_screen.dart';
import 'widgets/adaptive_content.dart';
import 'widgets/section_card.dart';

/// Один блок настроек: общая карточка пакета плюс её же шапка.
///
/// Собран здесь один раз, потому что на этом экране шесть одинаковых по форме
/// секций, и шесть развёрнутых копий композиции читались бы как шум.
class _Section extends StatelessWidget {
  const _Section({
    required this.icon,
    required this.accent,
    required this.title,
    required this.children,
  });

  final HugeIconData icon;
  final Color accent;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      accent: accent,
      // Поля даёт сам список экрана, у карточки они обнулены.
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(icon: icon, accent: accent, title: title),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

/// Оформление: одна строка, ведущая на общий экран темы.
///
/// Своих ручек здесь больше нет. До v0.18 «чисто чёрный» и Material You жили
/// тут, потому что общий экран их не предлагал; теперь предлагает — вместе с
/// рядом акцентов, которого у Media не было вовсе, — и держать вторую пару
/// переключателей над тем же контроллером значит однажды разойтись с ним в
/// показаниях. Ровно так это устроено в Eluna Screen.
///
/// Подписка на контроллер, а не на провайдер: подзаголовок называет и OLED, и
/// Material You, а «чисто чёрный» в светлой теме `ThemeData` не меняет вовсе —
/// без подписки строка залипала бы в прежнем виде.
///
/// Слова берутся из таблицы пакета: те же самые там переведены на 59 языков
/// вместо пятнадцати и ровно так, как подпишет себя сам экран. Исключение —
/// «Системная»: в общей таблице её нет, и она приходит из ARB приложения.
/// Иконка строки настроек в цветной плашке.
///
/// До этого все строки экрана несли серые иконки размера по умолчанию: восемь
/// пунктов подряд, ни один из которых не отличался от соседа, — глазу не за что
/// зацепиться, и раздел читался как список, а не как набор разных дел.
///
/// Цвет берётся у секции, а не у строки: «один оттенок на домен» — правило
/// всего приложения, и радуга внутри одной карточки нарушила бы его громче,
/// чем помогла. Исключение — разрушающие действия: у них красный, потому что
/// цвет здесь несёт смысл, а не украшает.
class _RowIcon extends StatelessWidget {
  const _RowIcon(this.icon, this.accent);

  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // Плашка лежит на карточке ТОГО ЖЕ оттенка, поэтому заливки в 14%
        // не хватало: на снимке иконки читались как грязь на фоне. Плотнее
        // заливка плюс контурная линия — и плашка отделяется от карточки, не
        // становясь при этом кнопкой, которой она не является.
        color: accent.withValues(alpha: 0.26),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accent.withValues(alpha: 0.42)),
      ),
      child: Icon(icon, size: 19, color: accent),
    );
  }
}

class _AppearanceControls extends ConsumerWidget {
  const _AppearanceControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final l = ElunaL10n.of(context);

    return ListenableBuilder(
      listenable: ElunaThemeController.instance,
      builder: (context, _) {
        final appearance = ElunaThemeController.instance;

        // Что включено, то и перечислено. OLED и Material You называют себя
        // самими собой: как и имена пресетов, это имена собственные, и ни в
        // одном приложении семьи они не переводятся.
        final parts = <String>[
          // Имя пресета — только когда их больше одного. Пока в семье одна
          // тема, экран прячет свою сетку, и «Violet» в подзаголовке называл бы
          // выбор, которого не предлагали.
          if (kElunaThemes.length > 1) appearance.preset.name,
          switch (appearance.mode) {
            ThemeMode.system => l10n.themeSystem,
            ThemeMode.dark => l.themeDark,
            ThemeMode.light => l.themeLight,
          },
          // Только там, где ему есть что делать. Сама настройка переезжает
          // между устройствами, поэтому телефон без цвета обоев (iOS, Android
          // до 12) вполне может держать её включённой — и назвать её здесь
          // значило бы описать цвет, которого на этом экране нет.
          if (appearance.dynamicColor && appearance.wallpaperAvailable)
            'Material You',
          if (appearance.pureBlack) 'OLED',
        ];

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const _RowIcon(Icons.palette_outlined, SectionAccents.purple),
          title: Text(l.theme),
          subtitle: Text(parts.join(' · ')),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const ElunaThemeScreen()),
          ),
        );
      },
    );
  }
}

class SettingsTab extends ConsumerWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final prefs = ref.watch(appPrefsProvider);
    final controller = ref.read(appPrefsProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: AdaptiveContent(
          child: ListView(
          padding: EdgeInsets.all(context.space.lg),
          children: [
          _Section(
            title: l10n.appearance,
            icon: HugeIcons.strokeRoundedPaintBoard,
            accent: SectionAccents.purple,
            children: [
              // Оформление целиком — общий экран пакета: яркость, ряд акцентов,
              // «чисто чёрный» и Material You. Здесь остаётся строка, которая
              // туда ведёт и называет выбранное.
              const _AppearanceControls(),
              // Иконка на рабочем столе. Экран выбора — общий, а сам арт живёт
              // в приложении: иконка и есть то единственное, чем приложения
              // семьи отличаются друг от друга снаружи.
              Builder(builder: (context) {
                final el = ElunaL10n.of(context);
                final current = resolveAppIcon(
                  kAppIcons,
                  prefs.appIconId,
                  defaultId: kDefaultAppIconId,
                );
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: current == null
                      ? const Icon(Icons.apps_outlined)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(current.asset, width: 24, height: 24),
                        ),
                  title: Text(el.appIconTitle),
                  subtitle: Text(el.appIconDesc),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => ElunaAppIconScreen(
                        currentId: prefs.appIconId,
                        onSelect: (id) async {
                          final icon = resolveAppIcon(kAppIcons, id,
                              defaultId: kDefaultAppIconId);
                          if (icon == null) return false;
                          final ok =
                              await ref.read(appIconServiceProvider).apply(icon);
                          // Сохраняем ТОЛЬКО после согласия платформы: иначе
                          // выбор переживёт перезапуск и будет спорить с тем,
                          // что человек видит на рабочем столе.
                          if (ok) controller.setAppIconId(id);
                          return ok;
                        },
                      ),
                    ),
                  ),
                );
              }),
              // Выбор языка — общий экран пакета: список с поиском по родному
              // названию, английскому и коду. Автонимы больше не переписаны
              // здесь от руки — их знает `kAppLanguages`, и пятнадцатая копия
              // такого списка в семье была пятнадцатым местом, где опечатка
              // живёт до жалобы.
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const _RowIcon(Icons.translate, SectionAccents.purple),
                title: Text(l10n.language),
                subtitle: Text(
                  languageByCode(prefs.localeCode)?.nativeName ?? l10n.languageSystem,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ElunaLanguageScreen(
                      currentCode: prefs.localeCode,
                      onSelected: (code) async => controller.setLocale(code),
                      // Только те языки, на которых у Media есть строки: пакет
                      // возит 59, а выбрать из них можно было бы такой, для
                      // которого приложение молча откатится на английский.
                      languages: _mediaLanguages,
                      // Дорога обратно к языку системы. В прежнем выпадающем
                      // списке это был обычный пункт, и без него выбравший
                      // язык однажды остался бы с ним навсегда.
                      systemLabel: l10n.languageSystem,
                      onSystemSelected: () async => controller.setLocale(null),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: l10n.sectionConversionPrefs,
            icon: HugeIcons.strokeRoundedDashboardSpeed01,
            accent: SectionAccents.violet,
            children: [
              // The mode also lives on the Convert tab, where it is used; it
              // is here too because that is where people look for it.
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.modeAdvanced),
                subtitle: Text(l10n.modeAdvancedHint),
                value: !prefs.simpleMode,
                onChanged: (advanced) => controller.setSimpleMode(!advanced),
              ),
              const SizedBox(height: 8),
              LabelledDropdown<PowerMode>(
                label: l10n.powerModeLabel,
                value: prefs.powerMode,
                items: PowerMode.values,
                labelOf: (m) => switch (m) {
                  PowerMode.efficiency => l10n.powerEfficiency,
                  PowerMode.balanced => l10n.powerBalanced,
                  PowerMode.quality => l10n.powerQuality,
                },
                onChanged: controller.setPowerMode,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.powerModeHint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.hwEncoderLabel),
                subtitle: Text(l10n.hwEncoderHint),
                value: prefs.useHardwareEncoder,
                onChanged: controller.setUseHardwareEncoder,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.twoPassLabel),
                subtitle: Text(l10n.twoPassHint),
                value: prefs.twoPassFitToSize,
                onChanged: controller.setTwoPassFitToSize,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.hapticsLabel),
                value: prefs.hapticsEnabled,
                onChanged: controller.setHapticsEnabled,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _StorageSection(),
          const SizedBox(height: 16),
          _Section(
            title: l10n.privacyTitle,
            icon: HugeIcons.strokeRoundedShield01,
            accent: SectionAccents.green,
            children: [
              // The same switch as on the Convert tab, bound to the same
              // setting — this is the screen people go to when they want to
              // check that metadata stripping is still on.
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.stripMetadata),
                subtitle: Text(l10n.stripMetadataHint),
                value: ref.watch(settingsProvider.select((s) => s.stripMetadata)),
                onChanged: ref.read(settingsProvider.notifier).setStripMetadata,
              ),
              const SizedBox(height: 8),
              Text(l10n.privacyBody, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 4),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const _RowIcon(Icons.wifi_off_outlined, SectionAccents.green),
                title: Text(l10n.networkPrivacyTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const NetworkPrivacyScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _SecuritySection(),
          const SizedBox(height: 16),
          _Section(
            title: l10n.sectionSupport,
            icon: HugeIcons.strokeRoundedFavourite,
            accent: SectionAccents.purple,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const _RowIcon(Icons.emoji_events_outlined, SectionAccents.purple),
                title: Text(l10n.achievementsTitle),
                subtitle: Text(l10n.achievementsProgress(
                  ref.watch(achievementsProvider.select((s) => s.unlockedCount)),
                  mediaAchievements.all.length,
                )),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const AchievementsScreen()),
                ),
              ),
              // Модалка оценки — общая, как в Screen и Subs. Свой лист Media
              // уводил всё, что ниже пяти звёзд, в письмо вместо стора: это
              // фильтрация отзывов, Apple отклоняет её по Guideline 1.1.7, а
              // Play запрещает выбирать, кого спрашивать. Заодно с листом ушёл
              // и адрес `support@eluna.app` — у семьи он один и живёт в
              // `Eluna.configure`.
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const _RowIcon(Icons.star_outline, SectionAccents.purple),
                title: Text(l10n.rateApp),
                // Пятизвёздочная оценка уводит в магазин — тоже отлучка.
                onTap: () => awayInSystemUi(
                  ref.read(appLockStateProvider.notifier),
                  () => showElunaRateAppModal(context),
                ),
              ),
              // Чаевые. Ничего не открывают и ничего не обещают: приложение
              // целиком бесплатно, и эта строка — единственное место, где о
              // деньгах вообще заходит речь.
              // Кнопкой, а не строкой списка. Строкой она стояла шестой среди
              // одинаковых пунктов и не читалась вовсе — а это единственное
              // место во всём приложении, где вообще заходит речь о деньгах.
              // Градиент здесь не «продажа»: приложение бесплатно целиком, и
              // чаевые ничего не открывают. Он про видимость — пропустить их
              // теперь можно намеренно, а не по недосмотру.
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GradientButton(
                  icon: HugeIcons.strokeRoundedCoffee01,
                  label: ElunaL10n.of(context).tipTitle,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (_) => const TipScreen()),
                  ),
                ),
              ),
              // Остальные приложения семьи. Каталог, тексты и ссылки на сторы
              // знает пакет; сама Media в списке не появится, пока не выйдет —
              // `showElunaOurAppsSheet` вычёркивает приложение, из которого его
              // открыли, а в `kElunaFamily` её ещё нет.
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const _RowIcon(Icons.apps_rounded, SectionAccents.purple),
                title: Text(ElunaL10n.of(context).settingsOurApps),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => showElunaOurAppsSheet(context),
              ),
              Builder(
                builder: (context) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const _RowIcon(Icons.share_outlined, SectionAccents.purple),
                  title: Text(l10n.shareApp),
                  onTap: () {
                    // iPads present the share sheet as a popover and crash
                    // without a source rect; anchor it to this tile.
                    final box = context.findRenderObject() as RenderBox?;
                    awayInSystemUi(
                      ref.read(appLockStateProvider.notifier),
                      () => SharePlus.instance.share(ShareParams(
                        text: l10n.shareAppText,
                        sharePositionOrigin: box == null
                            ? null
                            : box.localToGlobal(Offset.zero) & box.size,
                      )),
                    );
                  },
                ),
              ),
              // Обратная связь и отчёт о падении — общий экран пакета. Письмо
              // собирается на устройстве и уходит почтовым клиентом
              // пользователя: у релизной сборки нет разрешения INTERNET, и
              // отправить что-либо самостоятельно приложение не может.
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const _RowIcon(Icons.bug_report_outlined, SectionAccents.purple),
                title: Text(ElunaL10n.of(context).supportTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const SupportScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: l10n.licenseTitle,
            // Молотка судьи в hugeicons нет; «правовой документ» ближе к тому,
            // что кнопка открывает, чем весы правосудия.
            icon: HugeIcons.strokeRoundedLegalDocument01,
            accent: SectionAccents.teal,
            children: [
              // ЭТОТ АБЗАЦ НЕ ПЕРЕЕЗЖАЕТ В ОБЩИЙ ЭКРАН И НЕ УДАЛЯЕТСЯ.
              //
              // Media везёт сборку FFmpeg с GPL-компонентами, из-за чего под
              // GPL v3 оказывается всё приложение целиком (см. LICENSE и
              // NOTICE.md) — больше ни у кого в семье такого обязательства нет.
              // Общий `ElunaLicensesScreen` перечисляет лицензии пакетов из
              // LicenseRegistry и принять вводный текст не умеет, поэтому
              // обязательство остаётся здесь, над кнопкой, — там же, где было.
              Text(l10n.licenseBody, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 12),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const ElunaLicensesScreen(),
                    ),
                  ),
                  child: Text(l10n.openLicenses),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Версия — подписью под всем списком, как в Eluna Screen. Строкой «О
          // приложении» она была пунктом, который выглядит нажимаемым и никуда
          // не ведёт; внизу это выходные данные, куда и приходят посмотреть.
          const Center(child: _VersionCaption()),
          ],
          ),
        ),
      ),
    );
  }
}

/// Пин-код и биометрия — как в Eluna Screen и Eluna Cycle.
///
/// Замок закрывает интерфейс, а не данные: файлы очереди лежат в песочнице
/// приложения, и настоящей границей всегда была она. Пин хранится хешем
/// (PBKDF2) с нарастающей паузой после неверных попыток — всё это в пакете, тут
/// только строки и переходы.
///
/// Своя карточка, а не строка в «Приватности»: она перерисовывается, когда
/// приходит ответ о настроенном замке, и незачем перерисовывать вместе с ней
/// весь экран.
class _SecuritySection extends ConsumerWidget {
  const _SecuritySection();

  Future<void> _setup(
      BuildContext context, WidgetRef ref, ElunaPinSetupMode mode) async {
    await Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (_) => ElunaPinSetupScreen(
          mode: mode,
          lock: ref.read(appLockServiceProvider),
        ),
      ),
    );
    ref.invalidate(appLockStatusProvider);
  }

  Future<void> _pinTap(BuildContext context, WidgetRef ref, bool hasPin) async {
    if (!hasPin) return _setup(context, ref, ElunaPinSetupMode.create);
    final l = ElunaL10n.of(context);
    await showAdaptiveModal<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => SheetScroller(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const _RowIcon(Icons.edit_outlined, SectionAccents.teal),
                title: Text(l.lockChangeCode),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _setup(context, ref, ElunaPinSetupMode.change);
                },
              ),
              ListTile(
                leading: const _RowIcon(Icons.delete_outline, SectionAccents.teal),
                title: Text(l.lockRemoveCode),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _setup(context, ref, ElunaPinSetupMode.disable);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _toggleBiometrics(
      BuildContext context, WidgetRef ref, bool enable) async {
    final service = ref.read(appLockServiceProvider);
    if (!enable) {
      await service.setBiometricEnabled(false);
      ref.invalidate(appLockStatusProvider);
      return;
    }
    // Сначала доказать, что датчик работает, и только потом доверять ему ключ:
    // включённая биометрия, которая не срабатывает, оставляет человека набирать
    // код — при том что переключатель обещал обратное.
    final reason = ElunaL10n.of(context).lockBiometricPrompt(Eluna.config.appName);
    if (await BiometricGate().authenticate(reason)) {
      await service.setBiometricEnabled(true);
    }
    ref.invalidate(appLockStatusProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = ElunaL10n.of(context);
    final status = ref.watch(appLockStatusProvider).value;
    final hasPin = status?.pin ?? false;

    return _Section(
      title: l.lockSectionTitle,
      icon: HugeIcons.strokeRoundedSquareLock02,
      accent: SectionAccents.teal,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const _RowIcon(Icons.lock_outline, SectionAccents.teal),
          title: Text(l.lockPinTitle),
          subtitle: Text(hasPin ? l.lockEnabled : l.lockPinSubtitleOff),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _pinTap(context, ref, hasPin),
        ),
        // Независимо от пин-кода, намеренно: биометрия сама по себе — законный
        // замок, у системного запроса есть собственный запасной вход по коду
        // устройства.
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: const _RowIcon(Icons.fingerprint, SectionAccents.teal),
          title: Text(l.lockBiometricTitle),
          subtitle: Text(l.lockBiometricSubtitle),
          value: status?.bio ?? false,
          onChanged: (v) => _toggleBiometrics(context, ref, v),
        ),
      ],
    );
  }
}

/// «Версия 1.0.0» мелким шрифтом в самом низу настроек.
///
/// Версия приходит из бандла (канал платформы), поэтому FutureBuilder, а не
/// константа: строка появляется кадром позже, зато она всегда та, что реально
/// установлена, и её не забудут подвинуть. Пока ответ едет, показываем уже
/// прочитанное значение — «что нового» на первом кадре обычно успевает его
/// запросить, и мигания нет.
///
/// `name()`, а НЕ `full()`: номер сборки здесь читался как часть версии
/// («0.5.0 (2003)») и вызывал ровно тот вопрос, на который отвечать нечем.
/// Само число при этом не выдумано: `--split-per-abi` прибавляет к номеру
/// сборки 2000 за arm64 — это правило Flutter, а не наше. В отчёте об ошибке
/// номер сборки по-прежнему есть, там он и нужен.
class _VersionCaption extends StatelessWidget {
  const _VersionCaption();

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    return FutureBuilder<String>(
      future: ElunaVersion.name(),
      builder: (context, snapshot) => Text(
        l10n.appVersionLabel(snapshot.data ?? ElunaVersion.cachedName),
        style: theme.textTheme.labelSmall
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
      ),
    );
  }
}

/// What the app is holding on to, and the one button that gives it back.
///
/// Converted files stay inside the app until they are saved or shared, which
/// is the right privacy default and was, until this section existed, a leak:
/// the folder is not reachable from any file manager, so the only way to
/// reclaim the space was to wipe the app's data entirely.
class _StorageSection extends ConsumerWidget {
  const _StorageSection();

  /// Включение «удалять оригиналы» сначала спрашивает доступ к медиатеке.
  ///
  /// Раньше переключатель просто записывал настройку, а системный запрос
  /// приходил через полчаса — в момент, когда батч закончился. Человек включал
  /// функцию и не получал никакого сигнала, что она вообще будет работать.
  ///
  /// На iOS это к тому же единственный шанс спросить: системный запрос
  /// показывается один раз за установку, и после отказа функция осталась бы
  /// мёртвой без объяснения. Поэтому при отказе переключатель **не включается**
  /// и предлагает дорогу в системные настройки.
  ///
  /// Выключение ничего не спрашивает: отзывать разрешение приложение не умеет,
  /// да и незачем.
  Future<void> _setDeleteOriginals(
    BuildContext context,
    WidgetRef ref,
    bool on,
  ) async {
    final controller = ref.read(appPrefsProvider.notifier);
    if (!on) {
      controller.setDeleteOriginalsAfterConversion(false);
      return;
    }

    final service = ref.read(originalMediaProvider);
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final granted = await service.requestAccess();
    if (granted) {
      controller.setDeleteOriginalsAfterConversion(true);
      return;
    }

    // Переключатель остаётся выключенным — он и так не включался, значение
    // меняется только по успеху. Сказать об этом всё равно надо: молчащий
    // переключатель, который не переключается, читается как поломка.
    messenger.showSnackBar(SnackBar(
      content: Text(l10n.mediaAccessRequired),
      action: SnackBarAction(
        label: l10n.tabSettings,
        onPressed: service.openSystemSettings,
      ),
    ));
  }

  Future<void> _confirmAndClear(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.delete_sweep_outlined),
        title: Text(l10n.storageClearTitle),
        content: Text(l10n.storageClearBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.storageClearAction),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final freed = await clearStoredOutputs(ref);
    messenger.showSnackBar(
      SnackBar(content: Text(l10n.storageCleared(OutputPaths.humanBytes(freed)))),
    );
  }

  /// «Удалить все данные» — шит из пакета поверх [ElunaDataWipe].
  ///
  /// Он стирает ВСЁ, что приложение зарегистрировало в `main`, в фиксированном
  /// порядке и говорит, что именно стёрлось. Обещание «удалить все мои данные»
  /// перестаёт зависеть от того, вспомнил ли кто-то про хранилище, добавленное
  /// в прошлом месяце: новое хранилище регистрирует себя само.
  ///
  /// `onDeleteCloud` не передаётся — и это не пропуск: у Media нет ни облачного
  /// бэкенда, ни вольта. Без него шит не показывает галочку про облачную копию,
  /// то есть не предлагает удалить то, чего никогда не существовало.
  Future<void> _deleteAllData(BuildContext context, WidgetRef ref) async {
    await showDeleteAllDataSheet(
      context,
      onFinished: () async => resetAfterDataWipe(ref),
      // По той же причине не трогаем ключ вольта: Media его никогда не
      // записывала. Стирать его — поднять Keystore ради ничего, а при ошибке
      // назвать в отчёте хранилище, о котором пользователь не слышал.
      alsoClearVaultKey: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final usage = ref.watch(storageUsageProvider);

    // While the folder is being measured the row shows the last known answer
    // rather than a spinner: the number is informational, and a card that
    // flickers every time Settings is opened reads as instability.
    final value = usage.value;
    final isEmpty = value == null || value.files == 0;

    return _Section(
      title: l10n.storageTitle,
      icon: HugeIcons.strokeRoundedFolder01,
      accent: SectionAccents.teal,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.autoSaveLabel),
          subtitle: Text(l10n.autoSaveHint),
          value: ref.watch(appPrefsProvider.select((p) => p.autoSaveResults)),
          onChanged: ref.read(appPrefsProvider.notifier).setAutoSaveResults,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.deleteOriginalsAuto),
          subtitle: Text(l10n.deleteOriginalsHint),
          value: ref.watch(
            appPrefsProvider.select((p) => p.deleteOriginalsAfterConversion),
          ),
          onChanged: (on) => _setDeleteOriginals(context, ref, on),
        ),
        // The payoff of compressing, stated. Hidden at zero: a counter that
        // starts at "0 B freed" advertises a feature the user has not used
        // rather than reporting anything.
        if (ref.watch(appMetaProvider.select((m) => m.reclaimedBytes)) case final freed
            when freed > 0) ...[
          const SizedBox(height: 4),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const _RowIcon(Icons.cleaning_services_outlined, SectionAccents.teal),
            title: Text(l10n.reclaimedTotal(OutputPaths.humanBytes(freed))),
          ),
        ],
        const SizedBox(height: 4),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const _RowIcon(Icons.save_outlined, SectionAccents.teal),
          title: Text(
            isEmpty
                ? l10n.storageEmpty
                : l10n.storageUsage(OutputPaths.humanBytes(value.bytes)),
          ),
          subtitle: Text(l10n.storageBody),
          isThreeLine: true,
        ),
        if (!isEmpty)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              onPressed: () => _confirmAndClear(context, ref),
              icon: const Icon(Icons.delete_sweep_outlined, size: 18),
              label: Text(l10n.storageClearAction),
              style: TextButton.styleFrom(foregroundColor: theme.colorScheme.error),
            ),
          ),
        // Внизу «Хранилища» и в цвете ошибки — потому что это не соседний по
        // силе пункт, а другой порядок величины: кнопка выше освобождает место,
        // эта стирает приложение до состояния свежей установки. Разделитель
        // нужен ровно затем, чтобы их нельзя было перепутать взглядом.
        const Divider(height: 28),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const _RowIcon(Icons.delete_forever_outlined, SectionAccents.red),
          title: Text(
            l10n.deleteAllData,
            style: TextStyle(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(l10n.deleteAllDataHint),
          isThreeLine: true,
          onTap: () => _deleteAllData(context, ref),
        ),
      ],
    );
  }
}

/// Языки, которые показывает общий экран выбора, — пересечение семейного
/// каталога с теми локалями, для которых у Media реально сгенерированы строки.
///
/// Считается из `L10n.supportedLocales`, а не выписывается списком: добавление
/// нового ARB-файла тогда доходит до списка само, а не через год, когда кто-то
/// заметит, что перевод есть, а выбрать его нельзя. Порядок берётся из
/// `kAppLanguages` (по охвату), а не из алфавита сгенерированного списка.
final _mediaLanguages = () {
  final own = {for (final locale in L10n.supportedLocales) locale.languageCode};
  return [
    for (final language in kAppLanguages)
      if (own.contains(language.code)) language,
  ];
}();
