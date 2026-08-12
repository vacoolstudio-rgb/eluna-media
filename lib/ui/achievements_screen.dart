import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../domain/achievements.dart';
import '../l10n/app_localizations.dart';
import '../state/achievements_controller.dart';
import '../state/app_lock_controller.dart';
import 'achievement_detail_sheet.dart';
import 'achievement_texts.dart';
import 'widgets/progress_ring.dart';
import 'widgets/share_capture.dart';

/// Шкаф с наградами: три вкладки, шапка с общим прогрессом и медаль на каждой
/// карточке. Устроен как в Eluna Screen — тот же общий каталог, те же медали,
/// та же шторка с деталями; своё у Media только то, что вообще можно заслужить.
class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final shared = ElunaL10n.of(context);
    final snapshot = ref.watch(achievementsProvider);

    final all = snapshot.entries;
    final unlocked = [for (final e in all) if (e.unlocked) e];
    final locked = [for (final e in all) if (!e.unlocked) e];
    // Одна и та же подпись на всех трёх вкладках: она про коллекцию целиком, а
    // не про то подмножество, которое сейчас на экране.
    final summary = shared.achievementsCount(unlocked.length, all.length);

    return AmbientBackground(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(l10n.achievementsTitle),
            // Три равные вкладки режут «Не полученные», поэтому полоса
            // прокручиваемая — но по центру: там, где все три помещаются (а это
            // обычный случай), они читаются группой, а не уезжают к левому краю.
            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(text: shared.achievementsAll),
                Tab(text: shared.achievementsUnlocked),
                Tab(text: shared.achievementsLocked),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                _AchievementList(entries: all, header: all, summary: summary),
                _AchievementList(entries: unlocked, header: all, summary: summary),
                _AchievementList(entries: locked, header: all, summary: summary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AchievementList extends StatelessWidget {
  const _AchievementList({
    required this.entries,
    required this.header,
    required this.summary,
  });

  final List<AchievementState<ConversionStats>> entries;

  /// Полный список, на котором считается шапка: общий прогресс одинаков на
  /// любой вкладке, что бы она ни перечисляла.
  final List<AchievementState<ConversionStats>> header;

  final String summary;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    if (entries.isEmpty) {
      // Пустой бывает только «Полученные» и только у новичка. «Не полученных»
      // пустых не бывает до платины, и это уже победа, а не пустота.
      return EmptyState(
        icon: HugeIcons.strokeRoundedChampion,
        title: l10n.achievementsTitle,
      );
    }
    // Шапка едет ВНУТРИ списка, а не отдельным соседом над TabBarView: соседом
    // она отнимала высоту у ландшафтного окна, где на AppBar, вкладки, карточку
    // и сам список остаётся чуть больше трёхсот точек, — и список переполнялся.
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: entries.length + 1,
      itemBuilder: (context, i) => i == 0
          ? _SummaryCard(entries: header)
          : _AchievementTile(entry: entries[i - 1], summary: summary),
    );
  }
}

/// Шапка «сколько пройдено»: кольцо, разбивка по редкости и кнопка, которая
/// отправляет саму эту карточку картинкой.
///
/// Карточка обёрнута в [RepaintBoundary] — уходит ровно то, что человек видит,
/// а не собранное отдельно изображение, которое однажды разойдётся с UI.
class _SummaryCard extends ConsumerStatefulWidget {
  const _SummaryCard({required this.entries});

  final List<AchievementState<ConversionStats>> entries;

  @override
  ConsumerState<_SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends ConsumerState<_SummaryCard> {
  final _cardKey = GlobalKey();
  bool _sharing = false;

  Future<void> _share() async {
    if (_sharing) return;
    setState(() => _sharing = true);

    final shared = ElunaL10n.of(context);
    final total = widget.entries.length;
    final unlocked = widget.entries.where((e) => e.unlocked).length;
    final pct = total == 0 ? 0 : ((unlocked / total) * 100).round();
    // Не общий `achievementsShareSummary`: та строка называет Eluna Screen
    // прямо в тексте на всех 59 языках, и Media отправила бы чужое имя. Из
    // процента и имени приложения то же сообщение собирается честно.
    final message = '${shared.achievementsSharePct(pct)} · '
        '${shared.achievementsCount(unlocked, total)} · ${Eluna.config.appName}';

    final origin = shareOrigin(context);
    try {
      await awayInSystemUi(
        ref.read(appLockStateProvider.notifier),
        () => shareBoundaryAsImage(
          boundaryKey: _cardKey,
          message: message,
          origin: origin,
          fileName: 'eluna_achievements_progress',
        ),
      );
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final shared = ElunaL10n.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final total = widget.entries.length;
    final unlocked = widget.entries.where((e) => e.unlocked).length;
    final fraction = total == 0 ? 0.0 : (unlocked / total).clamp(0.0, 1.0);
    final pct = (fraction * 100).round();
    final done = total > 0 && unlocked >= total;
    // Цвет шапки — общий «легендарный» янтарь, а не местный хекс: медали внизу
    // покрашены им же, и трофей должен быть одного золота с ними.
    final trophy = rarityColor(AchRarity.legendary);

    final byRarity = <AchRarity, ({int unlocked, int total})>{
      for (final r in AchRarity.values)
        r: (
          unlocked: widget.entries
              .where((e) => e.def.rarity == r && e.unlocked)
              .length,
          total: widget.entries.where((e) => e.def.rarity == r).length,
        ),
    };

    return Column(
      children: [
        RepaintBoundary(
          key: _cardKey,
          child: ShareBackdrop(
            padding: EdgeInsets.zero,
            child: SectionCard(
              accent: trophy,
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionHeader(
                    icon: HugeIcons.strokeRoundedChampion,
                    accent: trophy,
                    title: shared.achievementsMyProgress,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            ProgressRing(
                              value: fraction,
                              done: done,
                              size: 92,
                              stroke: 8,
                              center: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '$pct%',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: done
                                          ? context.elunaColors.success
                                          : scheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    shared.achievementsCount(unlocked, total),
                                    style: theme.textTheme.labelSmall
                                        ?.copyWith(color: scheme.onSurfaceVariant),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (final r in AchRarity.values)
                                    if (byRarity[r]!.total > 0)
                                      _RarityRow(
                                        color: rarityColor(r),
                                        label: rarityLabel(r, shared),
                                        unlocked: byRarity[r]!.unlocked,
                                        total: byRarity[r]!.total,
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // В приложении это подпись, в отправленной картинке —
                        // водяной знак.
                        Text(
                          l10n.achievementsPrivacyNote,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _sharing ? null : _share,
            icon: _sharing
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const HugeIcon(icon: HugeIcons.strokeRoundedShare08, size: 18),
            label: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(shared.achievementsShareProgress, maxLines: 1),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

/// Один уровень редкости: точка цвета, название и сколько из него взято.
class _RarityRow extends StatelessWidget {
  const _RarityRow({
    required this.color,
    required this.label,
    required this.unlocked,
    required this.total,
  });

  final Color color;
  final String label;
  final int unlocked;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final complete = unlocked >= total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: complete
                  ? [BoxShadow(color: color.withValues(alpha: 0.6), blurRadius: 6)]
                  : null,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$unlocked/$total',
            style: theme.textTheme.labelSmall?.copyWith(
              color: complete ? color : theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({required this.entry, required this.summary});

  final AchievementState<ConversionStats> entry;
  final String summary;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    // Слово «Легендарное» и подпись «12 из 50» приходят из ОБЩЕЙ таблицы: это
    // те строки, которые во всех приложениях Eluna обязаны значить одно и то
    // же, поэтому переводить их у себя — значит разъехаться с роднёй.
    final shared = ElunaL10n.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final (title, body) = achievementTexts(l10n, entry.def);
    final unlocked = entry.unlocked;
    // Цвет редкости стоит на карточке ВСЕГДА — и у взятой, и у запертой. Это
    // метка уровня, а не награда за него: пока он гас у запертых, вся полка
    // читалась одним серым списком, при том что шапка над ней тут же
    // показывала разбивку по цветам. Разницу между «взято» и «не взято» несут
    // медаль (у неё редкость не проступает), насыщенность заливки и замок
    // справа — три признака, из которых цвет был лишним четвёртым.
    final rarity = rarityColor(entry.def.rarity);
    final base = isDark ? theme.colorScheme.surfaceContainer : Colors.white;

    Color tint(double amount, double alpha) =>
        Color.alphaBlend(rarity.withValues(alpha: amount), base).withValues(alpha: alpha);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: PressableScale(
        // Открыта или нет — шторка есть у каждой: у незакрытой она показывает,
        // сколько осталось, и этим тоже можно поделиться.
        onTap: () => showAchievementDetail(context, entry, summary: summary),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Запертая карточка — тот же цвет, вполсилы: заметно тусклее
              // взятой, но по-прежнему своего уровня.
              colors: unlocked
                  ? (isDark
                      ? [tint(0.18, 0.62), tint(0.05, 0.44)]
                      : [tint(0.14, 0.8), tint(0.03, 0.55)])
                  : (isDark
                      ? [tint(0.08, 0.38), tint(0.02, 0.28)]
                      : [tint(0.06, 0.55), tint(0.015, 0.42)]),
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: rarity.withValues(
                alpha: unlocked ? (isDark ? 0.35 : 0.25) : (isDark ? 0.2 : 0.15),
              ),
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
              // Запертую медаль видно, но она обесцвечена: смысл в том, чтобы
              // показать, что ещё есть. Гасит её сама медаль — у запертой
              // редкость не проступает.
              HexMedal(
                icon: entry.def.icon,
                rarity: entry.def.rarity,
                unlocked: unlocked,
                size: 52,
                trackColor: theme.colorScheme.surfaceContainerHighest,
                mutedColor: theme.colorScheme.onSurfaceVariant,
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
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          rarityLabel(entry.def.rarity, shared).toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: rarity,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Цифра прогресса нужна только пока цель не взята:
                        // у взятой она всегда «50 из 50» и не сообщает ничего.
                        if (!unlocked) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              achievementProgressText(entry, shared),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                unlocked ? Icons.check_circle_rounded : Icons.lock_outline_rounded,
                color: unlocked ? rarity : theme.colorScheme.outlineVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
