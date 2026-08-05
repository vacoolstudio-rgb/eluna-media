import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../domain/achievements.dart';
import '../l10n/app_localizations.dart';
import '../state/achievements_controller.dart';
import 'theme.dart';

(String, String) achievementTexts(L10n l10n, Achievement a) => switch (a) {
      Achievement.firstConversion => (l10n.achFirstConversionTitle, l10n.achFirstConversionBody),
      Achievement.tenConversions => (l10n.achTenConversionsTitle, l10n.achTenConversionsBody),
      Achievement.fiftyConversions => (l10n.achFiftyConversionsTitle, l10n.achFiftyConversionsBody),
      Achievement.twoHundredConversions =>
        (l10n.achTwoHundredConversionsTitle, l10n.achTwoHundredConversionsBody),
      Achievement.thousandConversions =>
        (l10n.achThousandConversionsTitle, l10n.achThousandConversionsBody),
      Achievement.saved100Mb => (l10n.achSaved100MbTitle, l10n.achSaved100MbBody),
      Achievement.saved1Gb => (l10n.achSaved1GbTitle, l10n.achSaved1GbBody),
      Achievement.saved10Gb => (l10n.achSaved10GbTitle, l10n.achSaved10GbBody),
      Achievement.batchOfFive => (l10n.achBatchOfFiveTitle, l10n.achBatchOfFiveBody),
      Achievement.batchOfTwenty => (l10n.achBatchOfTwentyTitle, l10n.achBatchOfTwentyBody),
      Achievement.sniper => (l10n.achSniperTitle, l10n.achSniperBody),
      Achievement.memeSmith => (l10n.achMemeSmithTitle, l10n.achMemeSmithBody),
      Achievement.soundHunter => (l10n.achSoundHunterTitle, l10n.achSoundHunterBody),
      Achievement.subtitleKeeper => (l10n.achSubtitleKeeperTitle, l10n.achSubtitleKeeperBody),
      Achievement.director => (l10n.achDirectorTitle, l10n.achDirectorBody),
      Achievement.allRounder => (l10n.achAllRounderTitle, l10n.achAllRounderBody),
      Achievement.nightOwl => (l10n.achNightOwlTitle, l10n.achNightOwlBody),
      Achievement.platinum => (l10n.achPlatinumTitle, l10n.achPlatinumBody),
    };

HugeIconData _tierIcon(Achievement a) => switch (a) {
      Achievement.platinum => HugeIcons.strokeRoundedMedal01,
      _ => HugeIcons.strokeRoundedChampion,
    };

Color _tierColor(AchievementTier tier) => switch (tier) {
      AchievementTier.bronze => const Color(0xFFB07A45),
      AchievementTier.silver => const Color(0xFF9BA4B0),
      AchievementTier.gold => const Color(0xFFD4A017),
      AchievementTier.platinum => AppTheme.primary,
    };

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final state = ref.watch(achievementsProvider);
    final total = Achievement.values.length;
    final done = state.unlocked.length;

    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(l10n.achievementsTitle)),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                // Золото трофея — не из палитры секций: у этой карточки цвет
                // значит «золотая ступень», а не «такой-то блок настроек».
                accent: const Color(0xFFD4A017),
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SectionHeader(
                      icon: HugeIcons.strokeRoundedChampion,
                      accent: const Color(0xFFD4A017),
                      title: l10n.achievementsProgress(done, total),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: total == 0 ? 0 : done / total),
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeOutCubic,
                              builder: (context, value, _) => LinearProgressIndicator(
                                value: value,
                                minHeight: 10,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(l10n.achievementsPrivacyNote,
                              style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              for (final a in Achievement.values)
                _AchievementTile(achievement: a, unlocked: state.unlocked.contains(a)),
            ],
          ),
        ),
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({required this.achievement, required this.unlocked});

  final Achievement achievement;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final (title, body) = achievementTexts(l10n, achievement);
    final tier = _tierColor(achievement.tier);
    final accent = unlocked ? tier : theme.colorScheme.outline;
    final base = isDark ? theme.colorScheme.surfaceContainer : Colors.white;

    Color tint(double amount, double alpha) =>
        Color.alphaBlend(accent.withValues(alpha: amount), base).withValues(alpha: alpha);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: PressableScale(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: unlocked
                  ? (isDark ? [tint(0.18, 0.62), tint(0.05, 0.44)] : [tint(0.14, 0.8), tint(0.03, 0.55)])
                  : [base.withValues(alpha: isDark ? 0.35 : 0.5), base.withValues(alpha: isDark ? 0.25 : 0.4)],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: accent.withValues(alpha: unlocked ? (isDark ? 0.35 : 0.25) : 0.12),
            ),
            boxShadow: unlocked
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              // A locked trophy is dimmed, not hidden: the point is to show
              // what is still out there.
              Opacity(
                opacity: unlocked ? 1 : 0.45,
                child: SectionIcon(icon: _tierIcon(achievement), accent: accent, size: 42),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: unlocked ? null : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(body, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                unlocked ? Icons.check_circle_rounded : Icons.lock_outline_rounded,
                color: unlocked ? tier : theme.colorScheme.outlineVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
