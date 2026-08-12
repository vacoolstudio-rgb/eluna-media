import 'dart:async';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/achievements.dart';
import '../domain/conversion_job.dart';
import '../l10n/app_localizations.dart';
import '../state/achievements_controller.dart';
import '../state/app_meta_controller.dart';
import '../services/haptics.dart';
import 'achievement_celebration.dart';
import '../services/share_intake.dart';
import '../state/queue_controller.dart';
import 'convert_tab.dart';
import 'queue_strings.dart';
import 'queue_tab.dart';
import 'settings_tab.dart';
import 'support_screen.dart';

/// Switches between a bottom navigation bar and a side rail so the app is
/// usable on a phone and on a tablet without a second layout.
class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _index = 0;

  static const _railBreakpoint = 720.0;

  @override
  void initState() {
    super.initState();
    // After the first frame: `L10n.of(context)` needs a built context, and the
    // queue needs its localised strings before it can run headless.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resumeInterruptedBatch();
      unawaited(_maybeShowStartupPrompts());
    });
  }

  /// Разговоры первого кадра, по одному за раз и в порядке важности: сначала
  /// «в прошлый раз приложение закрылось с ошибкой», и только если краша не
  /// было — «что нового».
  Future<void> _maybeShowStartupPrompts() async {
    if (await _maybeOfferCrashReport()) return;
    await _maybeShowWhatsNew();
  }

  /// Баннер о падении прошлого запуска. Возвращает true, если показан.
  ///
  /// Единственное место, откуда отчёт вообще может куда-то уйти, — и уходит он
  /// только после того, как пользователь увидел его целиком на следующем
  /// экране. Отказ удаляет файл: телефон не хранит запись, которой ему сказали
  /// «нет».
  Future<bool> _maybeOfferCrashReport() async {
    final crash = await CrashLog.pending();
    if (crash == null || !mounted) return false;

    // Строки общие: тот же баннер теми же словами показывают Screen и Subs, и
    // переводы к нему пакет уже возит — своих ARB-ключей на это не заведено.
    final l = ElunaL10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    messenger.showMaterialBanner(
      MaterialBanner(
        content: Text(l.crashPrompt),
        actions: [
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              unawaited(CrashLog.clear());
            },
            child: Text(l.crashDismiss),
          ),
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => SupportScreen(crashReport: crash),
                ),
              );
            },
            child: Text(l.crashSend),
          ),
        ],
      ),
    );
    return true;
  }

  /// Once per version, and only for people who actually used the previous
  /// one — a fresh install (or a pre-dialog install with zero conversions)
  /// gets a silent stamp, not a popup on their first minute in the app.
  Future<void> _maybeShowWhatsNew() async {
    // Версию теперь называет бандл, а не константа рядом с pubspec, которую
    // забывали двигать. `name()`, а НЕ `full()`: с номером сборки («0.4.0 (2)»)
    // окно вылезало бы заново на каждой пересборке той же версии, а у всех, кто
    // обновляется, в meta.lastSeenVersion лежит ровно «0.4.0».
    //
    // Чтение идёт через канал платформы, поэтому await — и он здесь безопасен:
    // это колбэк ПОСЛЕ первого кадра, задерживать нечего.
    final version = await ElunaVersion.name();
    if (!mounted) return;

    final meta = ref.read(appMetaProvider);
    final show = WhatsNewGate.shouldShow(meta, version);
    if (WhatsNewGate.shouldMark(meta, version)) {
      ref.read(appMetaProvider.notifier).markVersionSeen(version);
    }
    if (!show) return;

    final l10n = L10n.of(context);
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.new_releases_outlined),
        title: Text(l10n.whatsNewTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final line in [
              l10n.whatsNew1,
              l10n.whatsNew2,
              l10n.whatsNew3,
              l10n.whatsNew4,
              l10n.whatsNew5,
            ])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  '),
                    Expanded(child: Text(line)),
                  ],
                ),
              ),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonOk),
          ),
        ],
      ),
    );
  }

  /// Picks up a batch that process death interrupted. The flag is set once, in
  /// `QueueController.build()`, so this cannot fire twice.
  void _resumeInterruptedBatch() {
    if (!mounted) return;
    if (!ref.read(queueProvider).autoResume) return;

    final l10n = L10n.of(context);
    final notifier = ref.read(queueProvider.notifier);

    setState(() => _index = 1); // Show the queue rather than resuming invisibly.
    notifier.start(queueStringsFrom(l10n));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.batchResumed),
        // Resuming is the app's decision, not the user's, so give them a way
        // straight back out of it.
        action: SnackBarAction(label: l10n.cancelBatch, onPressed: notifier.cancelBatch),
        duration: const Duration(seconds: 6),
      ),
    );
  }

  /// Просьба оценить приложение — после удачного пакета, если общий сервис
  /// разрешает: вехи 7–8 и 14–15 дней от установки, не чаще раза в день и
  /// никогда после того, как оценку уже поставили.
  ///
  /// Условие про две удачные конвертации — своё, не пакетное, и остаётся:
  /// назойливые окна с оценкой — одна из главных претензий к конкурентам, и
  /// просить у того, кому приложение ещё ничего не сделало, здесь не готовы.
  /// Порог — про конвертацию, то есть про то, о чём Media, и по контракту
  /// пакета живёт в приложении.
  Future<void> _maybeAskForRating() async {
    if (ref.read(appMetaProvider).successfulConversions < 2) return;

    final rating = RatingService();
    if (!await rating.shouldPrompt()) return;
    await rating.markPromptedToday();
    if (!mounted) return;
    await showElunaRateAppModal(context);
  }

  /// Files arriving over the share channel land in the queue; the UI's part
  /// is to surface that instead of importing invisibly.
  void _onFilesReceived(int previous, int current) {
    if (!mounted || current <= previous) return;
    setState(() => _index = 0);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(L10n.of(context).filesReceived(current - previous))),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(
      sharedFilesCountProvider,
      (prev, next) => _onFilesReceived(prev ?? 0, next),
    );
    // Review milestones are checked when a batch finishes, not on a timer:
    // the moment right after a success is the honest time to ask.
    ref.listen<bool>(queueProvider.select((q) => q.isRunning), (was, is_) {
      if (was == true && is_ == false && mounted) {
        _maybeAskForRating();
      }
    });
    // Одно празднование на батч, даже если он открыл несколько наград: первая
    // (с наименьшим индексом) выходит на сцену, остальные ждут на своём экране.
    //
    // Празднование, а не снекбар: снекбаром приложение сообщает, что файл
    // сохранён, — а медаль здесь одна на несколько дней работы, и говорить о
    // ней тем же голосом значит не сказать ничего. Так же это устроено в
    // Eluna Screen.
    ref.listen<List<AchievementState<ConversionStats>>>(freshUnlocksProvider, (_, unlocks) {
      if (unlocks.isEmpty || !mounted) return;
      final first = unlocks.first;
      final haptics = ref.read(hapticsProvider);
      // Диалог не открывается из колбэка провайдера напрямую: тот срабатывает
      // посреди сборки кадра, а `showDialog` в этот момент — исключение.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        showAchievementCelebration(context, first, haptics: haptics);
      });
      ref.read(freshUnlocksProvider.notifier).consume();
    });

    final l10n = L10n.of(context);
    final runningCount = ref.watch(
      queueProvider.select((q) => q.jobs.where((j) => !j.status.isTerminal).length),
    );

    final destinations = [
      (icon: Icons.bolt_rounded, label: l10n.tabConvert, badge: 0),
      (icon: Icons.layers_rounded, label: l10n.tabQueue, badge: runningCount),
      (icon: Icons.settings_rounded, label: l10n.tabSettings, badge: 0),
    ];

    const pages = [ConvertTab(), QueueTab(), SettingsTab()];

    final scheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= _railBreakpoint;

        if (wide) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    for (final d in destinations)
                      NavigationRailDestination(
                        icon: _Badged(count: d.badge, child: Icon(d.icon)),
                        label: Text(d.label),
                      ),
                  ],
                ),
                VerticalDivider(
                  width: 1,
                  color: scheme.outlineVariant.withValues(alpha: 0.4),
                ),
                Expanded(child: pages[_index]),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: pages[_index],
          // Frosted glass over the ambient canvas: the content scrolls under
          // the bar instead of stopping dead at an opaque slab. Стекло —
          // общее: те же тона, кромка и радиус размытия во всех трёх
          // приложениях семьи, поэтому оно живёт в пакете, а не здесь.
          bottomNavigationBar: FrostedBar(
            child: NavigationBar(
              selectedIndex: _index,
              onDestinationSelected: (i) => setState(() => _index = i),
              destinations: [
                for (final d in destinations)
                  NavigationDestination(
                    icon: _Badged(count: d.badge, child: Icon(d.icon)),
                    label: d.label,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Badged extends StatelessWidget {
  const _Badged({required this.count, required this.child});

  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (count == 0) return child;
    return Badge(label: Text('$count'), child: child);
  }
}
