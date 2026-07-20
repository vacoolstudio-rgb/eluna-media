import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'theme.dart';
import 'widgets/ambient_background.dart';
import 'widgets/section_card.dart';

/// The full network audit, as a designed trust feature: every channel that
/// can touch the network, stated as fact. For this app the list has exactly
/// one entry — the ad banner — and two prominent "nothing here" sections.
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
              SectionCard(
                title: l10n.netAuditAdTitle,
                icon: Icons.ad_units_outlined,
                accent: AppTheme.warning,
                children: [Text(l10n.netAuditAdBody, style: theme.textTheme.bodyMedium)],
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: l10n.netAuditConversionTitle,
                icon: Icons.cloud_off,
                accent: Accents.privacy,
                children: [
                  Text(l10n.netAuditConversionBody, style: theme.textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: l10n.netAuditTelemetryTitle,
                icon: Icons.visibility_off_outlined,
                accent: Accents.privacy,
                children: [
                  Text(l10n.netAuditTelemetryBody, style: theme.textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
