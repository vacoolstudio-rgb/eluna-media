import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../l10n/app_localizations.dart';

/// The full network audit, as a designed trust feature: every channel that
/// can touch the network, stated as fact. For this app the list is empty —
/// the app does not even hold the INTERNET permission — so the screen is
/// three "nothing here" sections, and each one is literally checkable.
class NetworkPrivacyScreen extends StatelessWidget {
  const NetworkPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(l10n.networkPrivacyTitle)),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(l10n.netAuditIntro, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 16),
              _AuditSection(
                icon: HugeIcons.strokeRoundedWifiDisconnected01,
                title: l10n.netAuditNoneTitle,
                body: l10n.netAuditNoneBody,
              ),
              const SizedBox(height: 12),
              _AuditSection(
                icon: HugeIcons.strokeRoundedCloudOff,
                title: l10n.netAuditConversionTitle,
                body: l10n.netAuditConversionBody,
              ),
              const SizedBox(height: 12),
              _AuditSection(
                icon: HugeIcons.strokeRoundedViewOffSlash,
                title: l10n.netAuditTelemetryTitle,
                body: l10n.netAuditTelemetryBody,
              ),
              const SizedBox(height: 12),
              // Единственное место, где список перестал быть пустым. Чаевые не
              // выводят приложение в сеть — платит приложение магазина, — но в
              // системных сведениях появляются две строки от библиотеки покупок,
              // и экран, обещающий «полный список», обязан назвать их первым.
              // Умолчать здесь значило бы, что аудит проверяет сам себя.
              _AuditSection(
                icon: HugeIcons.strokeRoundedCoffee02,
                title: l10n.netAuditTipsTitle,
                body: l10n.netAuditTipsBody,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Одна строка аудита: заголовок канала и абзац о том, почему он молчит.
///
/// Три секции этого экрана отличаются только словами, поэтому композиция
/// общих SectionCard + SectionHeader собрана здесь один раз, а не трижды.
class _AuditSection extends StatelessWidget {
  const _AuditSection({
    required this.icon,
    required this.title,
    required this.body,
  });

  final HugeIconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionCard(
      accent: SectionAccents.green,
      // Отступы уже даёт ListView экрана, поэтому поле карточки обнулено.
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(icon: icon, accent: SectionAccents.green, title: title),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
            child: Text(body, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
