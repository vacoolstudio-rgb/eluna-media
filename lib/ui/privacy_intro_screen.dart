import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../state/app_meta_controller.dart';
import 'theme.dart';
import 'widgets/gradient_button.dart';
import 'widgets/section_card.dart';

/// The first-run gate: three promises and one line on what the app costs
/// (nothing). Shown exactly once; acknowledging it stamps `hasSeenIntro`.
/// Trust is this app's differentiator, so it leads with it.
class PrivacyIntroScreen extends ConsumerWidget {
  const PrivacyIntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 76,
                        height: 76,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: AppTheme.brandGradient,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withValues(alpha: 0.4),
                              blurRadius: 28,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.shield_rounded, size: 38, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.introTitle,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 24),
                    _Promise(
                      icon: Icons.cloud_off,
                      accent: AppTheme.primary,
                      title: l10n.introOfflineTitle,
                      body: l10n.introOfflineBody,
                    ),
                    _Promise(
                      icon: Icons.visibility_off_outlined,
                      accent: Accents.audio,
                      title: l10n.introTelemetryTitle,
                      body: l10n.introTelemetryBody,
                    ),
                    _Promise(
                      icon: Icons.location_off_outlined,
                      accent: Accents.privacy,
                      title: l10n.introMetadataTitle,
                      body: l10n.introMetadataBody,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.introFreeNote,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GradientButton(
                label: l10n.introContinue,
                icon: Icons.arrow_forward_rounded,
                onPressed: () => ref.read(appMetaProvider.notifier).markIntroSeen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Promise extends StatelessWidget {
  const _Promise({
    required this.icon,
    required this.title,
    required this.body,
    required this.accent,
  });

  final IconData icon;
  final String title;
  final String body;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionIcon(icon: icon, accent: accent, size: 42),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleSmall),
                const SizedBox(height: 3),
                Text(body, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
