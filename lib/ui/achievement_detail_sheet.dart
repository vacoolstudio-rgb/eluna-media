import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../domain/achievements.dart';
import '../l10n/app_localizations.dart';
import '../state/app_lock_controller.dart';
import 'achievement_texts.dart';
import 'widgets/progress_ring.dart';
import 'widgets/share_capture.dart';

/// Одно достижение крупно, с кнопкой «Поделиться».
///
/// Делится и незакрытое тоже — карточка тогда показывает прогресс, а не факт.
/// Это единственное, что делает шторку осмысленной для 17 медалей из 18 в
/// первый день: «мне осталось 12 из 50» — тоже новость.
Future<void> showAchievementDetail(
  BuildContext context,
  AchievementState<ConversionStats> state, {
  String? summary,
}) {
  return showAdaptiveModal<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => SheetScroller(
      child: _AchievementDetailSheet(state: state, summary: summary),
    ),
  );
}

/// Текст, который уходит в мессенджер вместе с картинкой: шапка, описание и
/// строка состояния — «получено» либо текущий прогресс.
String achievementShareMessage(
  L10n l10n,
  ElunaL10n shared,
  AchievementState<ConversionStats> state,
) {
  final (title, body) = achievementTexts(l10n, state.def);
  final status = state.unlocked
      ? shared.achievementGot
      : shared.achievementShareProgress(
          state.current.clamp(0, state.def.target), state.def.target);
  return shared.achievementShareMessage(
    Eluna.config.appName,
    title,
    rarityLabel(state.def.rarity, shared),
    body,
    status,
  );
}

class _AchievementDetailSheet extends ConsumerStatefulWidget {
  const _AchievementDetailSheet({required this.state, this.summary});

  final AchievementState<ConversionStats> state;

  /// «7 из 18» — подпись всей коллекции, впечатанная в низ картинки.
  final String? summary;

  @override
  ConsumerState<_AchievementDetailSheet> createState() =>
      _AchievementDetailSheetState();
}

class _AchievementDetailSheetState extends ConsumerState<_AchievementDetailSheet> {
  final _cardKey = GlobalKey();
  bool _sharing = false;

  Future<void> _share() async {
    if (_sharing) return;
    setState(() => _sharing = true);
    final message =
        achievementShareMessage(L10n.of(context), ElunaL10n.of(context), widget.state);
    final origin = shareOrigin(context);
    try {
      await awayInSystemUi(
        ref.read(appLockStateProvider.notifier),
        () => shareBoundaryAsImage(
          boundaryKey: _cardKey,
          message: message,
          origin: origin,
          fileName: 'eluna_achievement_${widget.state.def.id}',
        ),
      );
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final color = rarityColor(widget.state.def.rarity);
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: EdgeInsets.fromLTRB(16, 6, 16, 12 + bottomInset),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: scheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),
            // Карточка, которая и уходит картинкой. На низком окне (телефон в
            // ландшафте) она целиком выше самой шторки, а «оно прокручивается»
            // читается как «оно обрезано», — поэтому там она ужимается целиком.
            // Захват при этом работает: снимается то, что нарисовано.
            Builder(builder: (context) {
              final card = RepaintBoundary(
                key: _cardKey,
                child: ShareBackdrop(
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _CaptureCard(state: widget.state, summary: widget.summary),
                  ),
                ),
              );
              // Плавно, а не порогом: у порога остаётся полоса высот (и кадры
              // посреди поворота), где карточка снова не влезает. Ей отдаётся
              // ровно то, что осталось от шторки после её же обвязки.
              final available = MediaQuery.sizeOf(context).height * 0.9 - 140;
              if (available >= 380) return card;
              return SizedBox(
                height: available.clamp(140.0, 380.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(width: 340, child: card),
                ),
              );
            }),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: _sharing ? null : _share,
                icon: _sharing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : const HugeIcon(icon: HugeIcons.strokeRoundedShare08, size: 18),
                label: Text(ElunaL10n.of(context).achievementShare),
              ),
            ),
            // Обещание приложения повторяется там, где человек собирается
            // что-то из него отправить: уходит картинка, которую он видит, и
            // ничего больше.
            const SizedBox(height: 8),
            Text(
              l10n.achievementsPrivacyNote,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall
                  ?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

/// Статичная медальная карточка — ровно то, что снимается в PNG.
class _CaptureCard extends StatelessWidget {
  const _CaptureCard({required this.state, this.summary});

  final AchievementState<ConversionStats> state;
  final String? summary;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final shared = ElunaL10n.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final def = state.def;
    final color = rarityColor(def.rarity);
    final unlocked = state.unlocked;
    final (title, body) = achievementTexts(l10n, def);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProgressRing(
          value: unlocked ? 1 : state.progress,
          done: unlocked,
          size: 100,
          stroke: 7,
          center: Stack(
            alignment: Alignment.center,
            children: [
              HexMedal(
                icon: def.icon,
                rarity: def.rarity,
                unlocked: unlocked,
                size: 66,
                animate: true,
                trackColor: scheme.surfaceContainerHighest,
                mutedColor: scheme.onSurfaceVariant,
              ),
              if (!unlocked)
                PositionedDirectional(
                  bottom: 4,
                  end: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.cardColor,
                      border: Border.all(color: scheme.outlineVariant),
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedSquareLock01,
                      size: 13,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedAward01, size: 14, color: color),
              const SizedBox(width: 5),
              Text(
                rarityLabel(def.rarity, shared),
                style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(
          body,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
        ),
        const SizedBox(height: 12),
        if (unlocked)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                size: 18,
                color: rarityColor(AchRarity.common),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  _earnedLabel(context, shared),
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        else ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: state.progress,
              minHeight: 8,
              backgroundColor: scheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            achievementProgressText(state, shared),
            style: theme.textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant),
          ),
        ],
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: HugeIcons.strokeRoundedDiamond02, size: 12, color: color),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                '${Eluna.config.appName} · ${summary ?? l10n.achievementsTitle}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// «Получено» и дата, когда она известна. У медалей, открытых до того, как
  /// приложение начало запоминать даты, её нет — и придумывать её задним числом
  /// нечестно. Формат берётся у локали, а не собирается из точек руками: 15
  /// языков пишут дату по-разному, и `dd.mm.yyyy` верен примерно в трети из них.
  String _earnedLabel(BuildContext context, ElunaL10n shared) {
    final at = state.unlockedAt;
    if (at == null) return shared.achievementGot;
    final date = MaterialLocalizations.of(context).formatShortDate(at.toLocal());
    return '${shared.achievementGot} · $date';
  }
}
