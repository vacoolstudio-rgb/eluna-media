import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_plus/share_plus.dart';

import '../core/app_version.dart';
import '../core/output_paths.dart';
import '../domain/achievements.dart';
import '../l10n/app_localizations.dart';
import '../state/achievements_controller.dart';
import '../state/app_meta_controller.dart';
import '../state/settings_controller.dart';
import '../state/storage_controller.dart';
import 'achievements_screen.dart';
import 'network_privacy_screen.dart';
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
          _Section(
            title: l10n.appearance,
            icon: HugeIcons.strokeRoundedPaintBoard,
            accent: SectionAccents.purple,
            children: [
              LabelledDropdown<ThemeMode>(
                label: l10n.theme,
                value: prefs.themeMode,
                items: ThemeMode.values,
                labelOf: (m) => switch (m) {
                  ThemeMode.system => l10n.themeSystem,
                  ThemeMode.light => l10n.themeLight,
                  ThemeMode.dark => l10n.themeDark,
                },
                onChanged: controller.setThemeMode,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.oledDark),
                subtitle: Text(l10n.oledDarkHint),
                value: prefs.oledDark,
                onChanged: controller.setOledDark,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.dynamicColorLabel),
                subtitle: Text(l10n.dynamicColorHint),
                value: prefs.dynamicColor,
                onChanged: controller.setDynamicColor,
              ),
              const SizedBox(height: 8),
              // Выбор языка — общий экран пакета: список с поиском по родному
              // названию, английскому и коду. Автонимы больше не переписаны
              // здесь от руки — их знает `kAppLanguages`, и пятнадцатая копия
              // такого списка в семье была пятнадцатым местом, где опечатка
              // живёт до жалобы.
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.translate),
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
                leading: const Icon(Icons.wifi_off_outlined),
                title: Text(l10n.networkPrivacyTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const NetworkPrivacyScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: l10n.sectionSupport,
            icon: HugeIcons.strokeRoundedFavourite,
            accent: SectionAccents.purple,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.emoji_events_outlined),
                title: Text(l10n.achievementsTitle),
                subtitle: Text(l10n.achievementsProgress(
                  ref.watch(achievementsProvider.select((s) => s.unlocked.length)),
                  Achievement.values.length,
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
                leading: const Icon(Icons.star_outline),
                title: Text(l10n.rateApp),
                onTap: () => showElunaRateAppModal(context),
              ),
              Builder(
                builder: (context) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.share_outlined),
                  title: Text(l10n.shareApp),
                  onTap: () {
                    // iPads present the share sheet as a popover and crash
                    // without a source rect; anchor it to this tile.
                    final box = context.findRenderObject() as RenderBox?;
                    SharePlus.instance.share(ShareParams(
                      text: l10n.shareAppText,
                      sharePositionOrigin:
                          box == null ? null : box.localToGlobal(Offset.zero) & box.size,
                    ));
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.info_outline),
                title: Text(l10n.appVersionLabel(kAppVersion)),
                subtitle: Text(l10n.appTitle),
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
                alignment: Alignment.centerLeft,
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
          ],
        ),
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
          onChanged:
              ref.read(appPrefsProvider.notifier).setDeleteOriginalsAfterConversion,
        ),
        // The payoff of compressing, stated. Hidden at zero: a counter that
        // starts at "0 B freed" advertises a feature the user has not used
        // rather than reporting anything.
        if (ref.watch(appMetaProvider.select((m) => m.reclaimedBytes)) case final freed
            when freed > 0) ...[
          const SizedBox(height: 4),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.cleaning_services_outlined),
            title: Text(l10n.reclaimedTotal(OutputPaths.humanBytes(freed))),
          ),
        ],
        const SizedBox(height: 4),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.save_outlined),
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
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => _confirmAndClear(context, ref),
              icon: const Icon(Icons.delete_sweep_outlined, size: 18),
              label: Text(l10n.storageClearAction),
              style: TextButton.styleFrom(foregroundColor: theme.colorScheme.error),
            ),
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
