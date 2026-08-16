import 'package:eluna_shared/eluna_shared.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../core/encoders.dart';
import '../core/output_paths.dart';
import '../core/rate_calc.dart';
import '../core/time_input.dart';
import '../domain/conversion_job.dart';
import '../domain/conversion_settings.dart';
import '../domain/media_format.dart';
import '../domain/quick_presets.dart';
import '../l10n/app_localizations.dart';
import 'format_labels.dart';
import '../services/device_storage.dart';
import '../state/queue_controller.dart';
import '../state/selection_controller.dart';
import '../state/app_lock_controller.dart';
import '../state/settings_controller.dart';
import 'queue_strings.dart';
import 'widgets/adaptive_content.dart';
import 'widgets/media_thumbnail.dart';
import 'widgets/section_card.dart';

/// [FileType.media] opens the platform's photo/video picker — thumbnails,
/// newest first — which is what people expect for media. Audio and anything
/// exotic go through the generic document picker via the secondary button.
Future<void> pickFilesIntoQueue(WidgetRef ref, {FileType type = FileType.media}) async {
  // Пикер — чужая Activity, и для замка это неотличимо от сворачивания.
  // Предупреждаем его заранее, иначе выбор файла, занявший больше минуты (а он
  // столько и занимает: открыть папку, переключить фильтр, найти нужное),
  // встречает человека запросом кода.
  final result = await awayInSystemUi(
    ref.read(appLockStateProvider.notifier),
    () => FilePicker.pickFiles(allowMultiple: true, type: type),
  );
  if (result == null) return;

  final files = <({String path, String name})>[
    for (final f in result.files)
      if (f.path != null) (path: f.path!, name: f.name),
  ];
  if (files.isEmpty) return;

  ref.read(queueProvider.notifier).addFiles(files, ref.read(settingsProvider));
  // Immediately restamp every pending job with the profile its own kind will
  // really use. Without this a photo inherits the stored (video) profile and
  // sits in the queue announcing that it is about to become an MP4.
  syncPendingSettings(ref);
}

/// Каждый вид носителя держит свой оттенок из палитры пакета: раньше те же
/// цвета назывались по домену (video/audio/image), теперь — по цвету.
Color accentOfKind(MediaKind kind) => switch (kind) {
      MediaKind.video => SectionAccents.violet,
      MediaKind.audio => SectionAccents.blue,
      MediaKind.image => SectionAccents.amber,
    };

HugeIconData iconOfKind(MediaKind? kind) => switch (kind) {
      MediaKind.video => HugeIcons.strokeRoundedVideo01,
      MediaKind.audio => HugeIcons.strokeRoundedMusicNote01,
      MediaKind.image => HugeIcons.strokeRoundedImage01,
      null => HugeIcons.strokeRoundedFile01,
    };

String labelOfKind(L10n l10n, MediaKind? kind) => switch (kind) {
      MediaKind.video => l10n.sourceVideo,
      MediaKind.audio => l10n.sourceAudio,
      MediaKind.image => l10n.sourceImage,
      null => l10n.sourceUnknown,
    };

/// Блок настроек: общая карточка пакета с её же шапкой над содержимым.
///
/// На этой вкладке одиннадцать одинаковых по форме секций, поэтому композиция
/// SectionCard + SectionHeader собрана один раз, а не переписана в каждой.
class _Section extends StatelessWidget {
  const _Section({
    required this.icon,
    required this.accent,
    required this.title,
    required this.children,
    this.trailing,
  });

  final HugeIconData icon;
  final Color accent;
  final String title;
  final List<Widget> children;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      accent: accent,
      // Промежутки между секциями расставляет сама вкладка, поэтому поле
      // карточки обнулено — иначе отступ удвоился бы.
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            icon: icon,
            accent: accent,
            title: title,
            trailing: trailing,
          ),
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

class ConvertTab extends ConsumerWidget {
  const ConvertTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleMode = ref.watch(appPrefsProvider.select((p) => p.simpleMode));
    final queue = ref.watch(queueProvider);
    final pending = queue.pending;

    // Any change to the controls re-stamps the pending jobs, so the Queue tab
    // never shows a profile the Convert tab has already moved on from.
    ref.listen(selectedPresetProvider, (_, __) => syncPendingSettings(ref));
    ref.listen(formatOverrideProvider, (_, __) => syncPendingSettings(ref));
    ref.listen(sizeTargetProvider, (_, __) => syncPendingSettings(ref));
    ref.listen(photoSizeTargetProvider, (_, __) => syncPendingSettings(ref));
    ref.listen(settingsProvider, (_, __) => syncPendingSettings(ref));
    ref.listen(appPrefsProvider, (_, __) => syncPendingSettings(ref));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: AdaptiveContent(
          child: _CenteredWhenShort(
            padding: EdgeInsets.fromLTRB(
                context.space.lg, context.space.sm, context.space.lg, context.space.lg),
            children: [
              _ModeSwitch(simpleMode: simpleMode),
              SizedBox(height: context.space.md),
              _SourceCard(pending: pending),
              SizedBox(height: context.space.lg),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: simpleMode
                    ? const _SimpleView(key: ValueKey('simple'))
                    : const _AdvancedView(key: ValueKey('advanced')),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _StartBar(
        pendingCount: pending.length,
        isRunning: queue.isRunning,
      ),
    );
  }
}

/// Прокручиваемая колонка, которая на просторной поверхности встаёт по центру,
/// пока ей хватает места, и ведёт себя как обычный список, когда не хватает.
///
/// Нужна из-за пустого состояния. На телефоне форма занимает экран целиком, а
/// на планшете в портрете она занимает верхнюю треть — и оставшиеся две трети
/// читаются не как воздух, а как «здесь что-то не загрузилось». Стоит поставить
/// тот же блок по центру, и пустота становится полем вокруг, то есть намеренной.
///
/// Как только файлы добавлены и содержимое перерастает экран, `minHeight`
/// перестаёт что-либо значить, центрирование выключается само, и это снова
/// обычная прокрутка.
///
/// На телефоне (`compact`) не включается вовсе: там центрировать нечего, а
/// смена `ListView` на `SingleChildScrollView` без нужды меняла бы поведение
/// прокрутки на экране, который и так в порядке.
class _CenteredWhenShort extends StatelessWidget {
  const _CenteredWhenShort({required this.padding, required this.children});

  final EdgeInsets padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (context.sizeClass == WindowSizeClass.compact) {
      return ListView(padding: padding, children: children);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: padding,
          child: ConstrainedBox(
            // Минус поля: иначе колонка ровно во весь экран плюс отступы даёт
            // прокрутку на несколько точек там, где прокручивать нечего.
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - padding.vertical,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        );
      },
    );
  }
}

class _ModeSwitch extends ConsumerWidget {
  const _ModeSwitch({required this.simpleMode});

  final bool simpleMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    return Center(
      child: SegmentedButton<bool>(
        segments: [
          ButtonSegment(
            value: true,
            label: Text(l10n.modeSimple),
            icon: const Icon(Icons.auto_awesome, size: 18),
          ),
          ButtonSegment(
            value: false,
            label: Text(l10n.modeAdvanced),
            icon: const Icon(Icons.tune, size: 18),
          ),
        ],
        selected: {simpleMode},
        showSelectedIcon: false,
        onSelectionChanged: (s) => ref.read(appPrefsProvider.notifier).setSimpleMode(s.first),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Source files
// -----------------------------------------------------------------------------

/// The files waiting to convert: what they are, how big, and a way to drop any
/// one of them. A bare count told the user nothing about what they had
/// actually queued.
class _SourceCard extends ConsumerWidget {
  const _SourceCard({required this.pending});

  final List<ConversionJob> pending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final mixed = ref.watch(isMixedSelectionProvider);
    final kind = ref.watch(primaryKindProvider);
    final ordered = ref.watch(appPrefsProvider.select((p) => p.simpleMode)) &&
        ref.watch(selectedPresetProvider).isMerge;

    if (pending.isEmpty) return _EmptyPicker(onPick: () => pickFilesIntoQueue(ref));

    return _Section(
      title: l10n.filesTitle,
      icon: iconOfKind(kind),
      accent: accentOfKind(kind),
      trailing: Text(
        l10n.selectedFiles(pending.length),
        style: theme.textTheme.labelSmall,
      ),
      children: [
        for (final (index, job) in pending.indexed)
          _FileRow(
            job: job,
            // Order is only meaningful for a merge — everywhere else the queue
            // runs jobs independently and arrows would be noise.
            position: ordered ? (index: index, total: pending.length) : null,
            onMove: (delta) => ref.read(queueProvider.notifier).movePending(job.id, delta),
            onRemove: () => ref.read(queueProvider.notifier).removeJob(job.id),
          ),
        if (mixed) ...[
          const SizedBox(height: 8),
          _Notice(
            icon: Icons.info_outline,
            title: l10n.mixedSelectionTitle,
            body: l10n.mixedSelectionBody,
            color: theme.colorScheme.tertiary,
          ),
        ],
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => pickFilesIntoQueue(ref),
                icon: const Icon(Icons.add_photo_alternate_outlined, size: 18),
                label: Text(l10n.addFiles),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.outlined(
              onPressed: () => pickFilesIntoQueue(ref, type: FileType.any),
              icon: const Icon(Icons.audio_file_outlined),
              tooltip: l10n.addAudioFiles,
            ),
          ],
        ),
      ],
    );
  }
}

class _EmptyPicker extends ConsumerWidget {
  const _EmptyPicker({required this.onPick});

  final VoidCallback onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colors = context.elunaColors;

    return PressableScale(
      onTap: onPick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.primary.withValues(alpha: isDark ? 0.22 : 0.14),
              colors.secondary.withValues(alpha: isDark ? 0.10 : 0.06),
            ],
          ),
          border: Border.all(
            color: colors.primary.withValues(alpha: isDark ? 0.35 : 0.25),
          ),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withValues(alpha: isDark ? 0.0 : 0.12),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: colors.gradient,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.4),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(Icons.add_rounded, size: 30, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Text(l10n.emptySelectionTitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              l10n.emptySelectionBody,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              alignment: WrapAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: onPick,
                  icon: const Icon(Icons.photo_library_outlined, size: 18),
                  label: Text(l10n.addFiles),
                ),
                TextButton.icon(
                  // The system media picker cannot show audio; anything the
                  // gallery will not list goes through the document picker.
                  onPressed: () => pickFilesIntoQueue(ref, type: FileType.any),
                  icon: const Icon(Icons.audio_file_outlined, size: 18),
                  label: Text(l10n.addAudioFiles),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FileRow extends StatelessWidget {
  const _FileRow({
    required this.job,
    required this.onRemove,
    required this.onMove,
    this.position,
  });

  final ConversionJob job;
  final VoidCallback onRemove;

  /// Called with -1 or +1 to move this file earlier or later in the merge.
  final void Function(int delta) onMove;

  /// Non-null when the order matters, i.e. during a merge.
  final ({int index, int total})? position;

  static String _duration(int? ms) {
    if (ms == null || ms <= 0) return '';
    final total = ms ~/ 1000;
    final m = total ~/ 60;
    final s = total % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final kind = ContainerFormat.kindOfFile(job.inputName);
    final accent = kind == null ? theme.colorScheme.outline : accentOfKind(kind);
    final duration = _duration(job.sourceDurationMs);

    final meta = [
      if (job.inputBytes > 0) OutputPaths.humanBytes(job.inputBytes),
      if (duration.isNotEmpty) duration,
    ].join('  ·  ');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // The picture, not a generic icon: twenty rows of IMG_20260712_1433xx
          // are indistinguishable, and "remove that one" needs to be aimable.
          MediaThumbnail(
            path: job.inputPath,
            bytes: job.inputBytes,
            icon: iconOfKind(kind),
            accent: accent,
            size: 34,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.inputName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
                if (meta.isNotEmpty)
                  Text(meta, style: theme.textTheme.labelSmall),
              ],
            ),
          ),
          if (position case final at?) ...[
            IconButton(
              onPressed: at.index == 0 ? null : () => onMove(-1),
              icon: const Icon(Icons.keyboard_arrow_up_rounded, size: 20),
              visualDensity: VisualDensity.compact,
              tooltip: L10n.of(context).moveUp,
            ),
            IconButton(
              onPressed: at.index == at.total - 1 ? null : () => onMove(1),
              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
              visualDensity: VisualDensity.compact,
              tooltip: L10n.of(context).moveDown,
            ),
          ],
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close_rounded, size: 18),
            visualDensity: VisualDensity.compact,
            tooltip: L10n.of(context).removeFile,
          ),
        ],
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({
    required this.icon,
    required this.title,
    required this.body,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String body;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(color: color),
                ),
                const SizedBox(height: 2),
                Text(body, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Simple view: outcome-first presets + an explicit format choice
// -----------------------------------------------------------------------------

/// Иконки пресетов. Сжатие видео и сжатие фото делят «стрелки внутрь»: в
/// hugeicons нет отдельного «compress», а в один список эти два пресета не
/// попадают никогда — набор всегда отфильтрован по виду носителя.
HugeIconData _presetIcon(QuickPreset p) => switch (p) {
      QuickPreset.compressVideo => HugeIcons.strokeRoundedArrowShrink02,
      QuickPreset.fitToSize => HugeIcons.strokeRoundedRuler,
      QuickPreset.compatibleMp4 => HugeIcons.strokeRoundedMp401,
      QuickPreset.extractAudio => HugeIcons.strokeRoundedMusicNote01,
      QuickPreset.videoToGif => HugeIcons.strokeRoundedGif01,
      QuickPreset.mergeVideos => HugeIcons.strokeRoundedCombine,
      QuickPreset.compressImage => HugeIcons.strokeRoundedArrowShrink02,
      QuickPreset.fitPhotoToSize => HugeIcons.strokeRoundedRuler,
      QuickPreset.enhancePhoto => HugeIcons.strokeRoundedSparkles,
      QuickPreset.imageToWebp => HugeIcons.strokeRoundedImage01,
      QuickPreset.audioToMp3 => HugeIcons.strokeRoundedMp301,
      QuickPreset.compressAudio => HugeIcons.strokeRoundedAudioWave01,
    };

(String, String) _presetTexts(L10n l10n, QuickPreset p) => switch (p) {
      QuickPreset.compressVideo => (l10n.presetCompressVideoTitle, l10n.presetCompressVideoBody),
      QuickPreset.fitToSize => (l10n.presetFitToSizeTitle, l10n.presetFitToSizeBody),
      QuickPreset.compatibleMp4 => (l10n.presetCompatibleMp4Title, l10n.presetCompatibleMp4Body),
      QuickPreset.extractAudio => (l10n.presetExtractAudioTitle, l10n.presetExtractAudioBody),
      QuickPreset.videoToGif => (l10n.presetVideoToGifTitle, l10n.presetVideoToGifBody),
      QuickPreset.mergeVideos => (l10n.presetMergeTitle, l10n.presetMergeBody),
      QuickPreset.compressImage => (l10n.presetCompressImageTitle, l10n.presetCompressImageBody),
      QuickPreset.fitPhotoToSize => (l10n.presetFitPhotoTitle, l10n.presetFitPhotoBody),
      QuickPreset.enhancePhoto => (l10n.presetEnhancePhotoTitle, l10n.presetEnhancePhotoBody),
      QuickPreset.imageToWebp => (l10n.presetImageToWebpTitle, l10n.presetImageToWebpBody),
      QuickPreset.audioToMp3 => (l10n.presetAudioToMp3Title, l10n.presetAudioToMp3Body),
      QuickPreset.compressAudio => (l10n.presetCompressAudioTitle, l10n.presetCompressAudioBody),
    };

class _SimpleView extends ConsumerWidget {
  const _SimpleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final preset = ref.watch(selectedPresetProvider);
    final kind = ref.watch(primaryKindProvider);
    final targetBytes = ref.watch(sizeTargetProvider);
    final photoTargetBytes = ref.watch(photoSizeTargetProvider);
    final pending = ref.watch(queueProvider.select((q) => q.pending));
    final accent = accentOfKind(kind);

    // Only the presets that can act on what is actually queued. A photo must
    // never be offered "compress video" — and, before this, it *was*.
    final presets = QuickPreset.forKind(kind);

    return Column(
      key: const ValueKey('simple-column'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            _PromiseChip(icon: Icons.cloud_off, label: l10n.promiseOffline),
            _PromiseChip(icon: Icons.all_inclusive, label: l10n.promiseBatchFree),
            _PromiseChip(icon: Icons.verified_outlined, label: l10n.promiseNoWatermark),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (context, constraints) {
          final twoColumns = constraints.maxWidth >= 560;
          final cards = [
            for (final p in presets)
              _PresetCard(
                preset: p,
                accent: accent,
                selected: p == preset,
                onTap: () => ref.read(selectedPresetProvider.notifier).select(p),
              ),
          ];
          if (!twoColumns) {
            return Column(
              children: [
                for (final c in cards)
                  Padding(padding: const EdgeInsets.only(bottom: 8), child: c),
              ],
            );
          }
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in cards) SizedBox(width: (constraints.maxWidth - 8) / 2, child: c),
            ],
          );
        }),
        const SizedBox(height: 8),
        // The answer to "I want AVI → MP4 and I can't find where": an explicit
        // format row, listing only what this source can legally become.
        _FormatSection(kind: kind, preset: preset, accent: accent),
        if (preset.needsSizeTarget) ...[
          const SizedBox(height: 12),
          _Section(
            title: l10n.sizeTargetTitle,
            icon: HugeIcons.strokeRoundedRuler,
            accent: accent,
            children: preset.expectsKind == MediaKind.image
                ? [
                    _PhotoSizeTargetPicker(targetBytes: photoTargetBytes),
                    const SizedBox(height: 8),
                    Text(l10n.photoFitHint, style: theme.textTheme.bodySmall),
                  ]
                : [
                    _SizeTargetPicker(targetBytes: targetBytes),
                    const SizedBox(height: 8),
                    _SizeEstimate(
                      settings: preset.settings(sizeTargetBytes: targetBytes),
                      targetBytes: targetBytes,
                    ),
                  ],
          ),
        ],
        if (preset.isMerge && pending.length < 2) ...[
          const SizedBox(height: 10),
          _Notice(
            icon: Icons.info_outline,
            title: l10n.presetMergeTitle,
            body: l10n.mergeNeedsTwo,
            color: theme.colorScheme.tertiary,
          ),
        ],
      ],
    );
  }
}

/// The output-format row. Chips rather than a dropdown: the choice is short,
/// and the recommendation deserves to be visible rather than buried.
class _FormatSection extends ConsumerWidget {
  const _FormatSection({required this.kind, required this.preset, required this.accent});

  final MediaKind kind;
  final QuickPreset preset;
  final Color accent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    final recommended = preset.settings().container;
    final selected = ref.watch(formatOverrideProvider) ?? recommended;
    // A format whose encoder this build could not confirm is dropped, unless
    // it is the one already chosen — removing the selection under the user is
    // worse than showing a chip that may fail.
    final unavailable = ref.watch(unavailableContainersProvider);
    final options = [
      for (final f in ContainerFormat.outputsFor(
        kind,
        animatedSource: ref.watch(animatedSourceProvider),
      ))
        if (!unavailable.contains(f) || f == selected) f,
    ];

    return _Section(
      title: l10n.convertTo,
      icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
      accent: SectionAccents.teal,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final format in options)
              _FormatChip(
                format: format,
                selected: format == selected,
                recommended: format == recommended,
                onTap: () => ref
                    .read(formatOverrideProvider.notifier)
                    .set(format == recommended ? null : format),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Text(l10n.formatSectionHint, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _FormatChip extends StatelessWidget {
  const _FormatChip({
    required this.format,
    required this.selected,
    required this.recommended,
    required this.onTap,
  });

  final ContainerFormat format;
  final bool selected;
  final bool recommended;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = context.elunaColors;

    return PressableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          gradient: selected ? colors.gradient : null,
          color: selected ? null : scheme.surfaceContainerHigh.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.transparent : scheme.outlineVariant.withValues(alpha: 0.5),
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              format.extension.toUpperCase(),
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : scheme.onSurface,
              ),
            ),
            if (recommended) ...[
              const SizedBox(width: 6),
              Icon(
                Icons.star_rounded,
                size: 14,
                color: selected ? Colors.white : colors.warning,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PromiseChip extends StatelessWidget {
  const _PromiseChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final success = context.elunaColors.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: success.withValues(alpha: isDark ? 0.16 : 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: success.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: success),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: success,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PresetCard extends StatelessWidget {
  const _PresetCard({
    required this.preset,
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  final QuickPreset preset;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final (title, body) = _presetTexts(l10n, preset);
    final base = isDark ? theme.colorScheme.surfaceContainer : Colors.white;

    Color tint(double amount, double alpha) =>
        Color.alphaBlend(accent.withValues(alpha: amount), base).withValues(alpha: alpha);

    return PressableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: selected
                ? (isDark ? [tint(0.30, 0.85), tint(0.12, 0.6)] : [tint(0.22, 0.95), tint(0.06, 0.8)])
                : (isDark ? [tint(0.10, 0.5), tint(0.03, 0.35)] : [tint(0.06, 0.7), tint(0.02, 0.5)]),
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: accent.withValues(alpha: selected ? 0.7 : (isDark ? 0.2 : 0.14)),
            width: selected ? 1.6 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: isDark ? 0.25 : 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            SectionIcon(icon: _presetIcon(preset), accent: accent, size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(body, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
            AnimatedScale(
              duration: const Duration(milliseconds: 180),
              scale: selected ? 1 : 0,
              child: Icon(Icons.check_circle_rounded, color: accent, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _SizeTargetPicker extends ConsumerWidget {
  const _SizeTargetPicker({required this.targetBytes});

  final int targetBytes;

  Future<void> _askCustom(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final controller = TextEditingController();
    final mb = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.sizeTargetDialogTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(suffixText: 'MB'),
          onSubmitted: (v) => Navigator.of(context).pop(int.tryParse(v)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(int.tryParse(controller.text)),
            child: Text(l10n.commonOk),
          ),
        ],
      ),
    );
    controller.dispose();
    if (mb != null && mb > 0) {
      ref.read(sizeTargetProvider.notifier).set(mb * 1000 * 1000);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final isNamed = SizeTarget.values.any((t) => t.bytes == targetBytes);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final t in SizeTarget.values)
          ChoiceChip(
            label: Text(
              switch (sizeTargetService(l10n, t)) {
                final service? => l10n.sizeTargetNamed(service, t.megabytes),
                _ => l10n.sizeTargetMb(t.megabytes),
              },
            ),
            selected: targetBytes == t.bytes,
            onSelected: (_) => ref.read(sizeTargetProvider.notifier).set(t.bytes),
          ),
        ChoiceChip(
          label: Text(
            isNamed ? l10n.sizeTargetCustom : l10n.sizeTargetMb(targetBytes ~/ (1000 * 1000)),
          ),
          selected: !isNamed,
          onSelected: (_) => _askCustom(context, ref),
        ),
      ],
    );
  }
}

/// The photo budgets: kilobytes, not megabytes.
///
/// The numbers people actually meet for a photo are upload caps on web forms
/// and applications — "under 500 KB", "max 2 MB" — which is a different scale
/// from the messenger limits the video picker offers.
class _PhotoSizeTargetPicker extends ConsumerWidget {
  const _PhotoSizeTargetPicker({required this.targetBytes});

  final int targetBytes;

  Future<void> _askCustom(BuildContext context, WidgetRef ref) async {
    final l10n = L10n.of(context);
    final controller = TextEditingController();
    final kb = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.sizeTargetDialogTitleKb),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(suffixText: 'KB'),
          onSubmitted: (v) => Navigator.of(context).pop(int.tryParse(v)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(int.tryParse(controller.text)),
            child: Text(l10n.commonOk),
          ),
        ],
      ),
    );
    controller.dispose();
    if (kb != null && kb > 0) {
      ref.read(photoSizeTargetProvider.notifier).set(kb * 1000);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final isNamed = PhotoSizeTarget.values.any((t) => t.bytes == targetBytes);

    String label(int kilobytes) => kilobytes >= 1000
        ? l10n.sizeTargetMb(kilobytes ~/ 1000)
        : l10n.sizeTargetKb(kilobytes);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final t in PhotoSizeTarget.values)
          ChoiceChip(
            label: Text(label(t.kilobytes)),
            selected: targetBytes == t.bytes,
            onSelected: (_) => ref.read(photoSizeTargetProvider.notifier).set(t.bytes),
          ),
        ChoiceChip(
          label: Text(isNamed ? l10n.sizeTargetCustom : label(targetBytes ~/ 1000)),
          selected: !isNamed,
          onSelected: (_) => _askCustom(context, ref),
        ),
      ],
    );
  }
}

/// Live output estimate for the size mode, and a warning when the budget is
/// not physically reachable for one of the queued files.
class _SizeEstimate extends ConsumerWidget {
  const _SizeEstimate({required this.settings, required this.targetBytes});

  final ConversionSettings settings;
  final int targetBytes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final pending = ref.watch(queueProvider.select((q) => q.pending));

    final unreachable = pending.any((j) {
      final ms = j.sourceDurationMs;
      if (ms == null) return false;
      return RateCalc.videoKbpsForTarget(
            targetBytes: targetBytes,
            durationMs: ms,
            audioKbps: settings.audioCodec == AudioCodec.none ? 0 : settings.audioBitrateKbps,
          ) ==
          null;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.estimatePerFile(OutputPaths.humanBytes(targetBytes)),
          style: theme.textTheme.bodySmall,
        ),
        if (unreachable) ...[
          const SizedBox(height: 6),
          Text(
            l10n.sizeTargetTooSmall,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
          ),
        ],
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Advanced view
// -----------------------------------------------------------------------------

String _resolutionLabel(L10n l10n, ResolutionPreset r) =>
    r == ResolutionPreset.keep ? l10n.presetOriginal : r.label;

String _fpsLabel(L10n l10n, FpsPreset f) =>
    f == FpsPreset.keep ? l10n.presetOriginal : f.label;

class _AdvancedView extends ConsumerWidget {
  const _AdvancedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final settings = ref.watch(settingsProvider);
    final controller = ref.read(settingsProvider.notifier);
    final sourceKind = ref.watch(primaryKindProvider);

    return Column(
      key: const ValueKey('advanced-column'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _OutputSection(
          settings: settings,
          controller: controller,
          sourceKind: sourceKind,
          animatedSource: ref.watch(animatedSourceProvider),
        ),
        const SizedBox(height: 16),
        if (settings.kind == MediaKind.video) ...[
          _VideoSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
          _AudioSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
          _TransformSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
          _TrimSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
        ],
        if (settings.kind == MediaKind.audio) ...[
          _AudioSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
          _TrimSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
        ],
        if (settings.kind == MediaKind.image) ...[
          _ImageSection(settings: settings, controller: controller),
          const SizedBox(height: 16),
          // GIF goes down a separate palette pipeline that these filters are
          // not part of, so offering them there would be a lie.
          if (!settings.container.isAnimatedImage) ...[
            _EnhanceSection(settings: settings, controller: controller),
            const SizedBox(height: 16),
          ],
        ],
        _Section(
          title: l10n.sectionPrivacy,
          icon: HugeIcons.strokeRoundedShield01,
          accent: SectionAccents.green,
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.stripMetadata),
              subtitle: Text(l10n.stripMetadataHint),
              value: settings.stripMetadata,
              onChanged: controller.setStripMetadata,
            ),
          ],
        ),
      ],
    );
  }
}

class _OutputSection extends ConsumerWidget {
  const _OutputSection({
    required this.settings,
    required this.controller,
    required this.sourceKind,
    required this.animatedSource,
  });

  final ConversionSettings settings;
  final SettingsController controller;
  final MediaKind sourceKind;

  /// A GIF selection, which may also be written to the video containers.
  final bool animatedSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    // Only the containers this source can legally become. The old dropdown
    // listed all seventeen, so an MP3 could be told to become a JPEG. Formats
    // whose encoder the build could not confirm come out too — except the one
    // currently selected, which must stay or the dropdown throws on a value
    // that is not among its items.
    final unavailable = ref.watch(unavailableContainersProvider);
    final options = [
      for (final f in ContainerFormat.outputsFor(sourceKind, animatedSource: animatedSource))
        if (!unavailable.contains(f) || f == settings.container) f,
    ];
    final value = options.contains(settings.container)
        ? settings.container
        : ContainerFormat.defaultOutputFor(sourceKind);

    return _Section(
      title: l10n.sectionOutput,
      icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
      accent: SectionAccents.teal,
      children: [
        LabelledDropdown<ContainerFormat>(
          label: l10n.outputFormat,
          value: value,
          items: options,
          labelOf: (f) => '${containerLabel(l10n, f)}  ·  .${f.extension}',
          onChanged: controller.setContainer,
        ),
        const SizedBox(height: 8),
        Text(l10n.formatSectionHint, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _VideoSection extends ConsumerWidget {
  const _VideoSection({required this.settings, required this.controller});

  final ConversionSettings settings;
  final SettingsController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final codec = settings.videoCodec;
    final av1Available = ref.watch(av1AvailableProvider).value ?? false;

    final isReencoding = codec != VideoCodec.copy && codec != VideoCodec.none;
    final useCrf = settings.rateControl == RateControl.quality && codec.supportsCrf;
    final useSize = settings.rateControl == RateControl.size && codec.supportsCrf;

    final subtitleCapable = settings.container == ContainerFormat.mp4 ||
        settings.container == ContainerFormat.mov ||
        settings.container == ContainerFormat.mkv;

    return _Section(
      title: l10n.sectionVideo,
      icon: HugeIcons.strokeRoundedVideo01,
      accent: SectionAccents.violet,
      children: [
        LabelledDropdown<VideoCodec>(
          label: l10n.videoCodec,
          value: codec,
          // AV1 is dropped until the binary has confirmed it can encode it.
          // The currently selected codec always stays in the list: a dropdown
          // whose value is not among its items throws, and a stored job can
          // carry AV1 from a build or device where the probe said yes.
          items: [
            for (final c in ContainerRules.videoCodecsFor(settings.container))
              if (c != VideoCodec.av1 || c == codec || av1Available) c,
          ],
          labelOf: (c) => videoCodecLabel(l10n, c),
          onChanged: controller.setVideoCodec,
        ),
        if (isReencoding) ...[
          const SizedBox(height: 16),
          LabelledDropdown<ResolutionPreset>(
            label: l10n.resolution,
            value: settings.resolution,
            items: ResolutionPreset.values,
            labelOf: (r) => _resolutionLabel(l10n, r),
            onChanged: controller.setResolution,
          ),
          const SizedBox(height: 16),
          LabelledDropdown<FpsPreset>(
            label: l10n.frameRate,
            value: settings.fps,
            items: FpsPreset.values,
            labelOf: (f) => _fpsLabel(l10n, f),
            onChanged: controller.setFps,
          ),
          const SizedBox(height: 16),
          if (codec.supportsCrf)
            SegmentedButton<RateControl>(
              segments: [
                ButtonSegment(value: RateControl.quality, label: Text(l10n.rateControlQuality)),
                ButtonSegment(value: RateControl.bitrate, label: Text(l10n.rateControlBitrate)),
                ButtonSegment(value: RateControl.size, label: Text(l10n.rateControlSize)),
              ],
              selected: {settings.rateControl},
              showSelectedIcon: false,
              onSelectionChanged: (s) => controller.setRateControl(s.first),
            ),
          const SizedBox(height: 12),
          if (useSize) ...[
            _SizeTargetPicker(targetBytes: ref.watch(sizeTargetProvider)),
            const SizedBox(height: 8),
            _SizeEstimate(settings: settings, targetBytes: ref.watch(sizeTargetProvider)),
          ] else if (useCrf)
            LabelledSlider(
              label: l10n.crfLabel(settings.crf),
              value: settings.crf,
              min: 0,
              max: codec.maxCrf,
              hint: l10n.crfHint,
              onChanged: controller.setCrf,
            )
          else ...[
            LabelledSlider(
              label: l10n.videoBitrate(settings.videoBitrateKbps),
              value: settings.videoBitrateKbps,
              min: 200,
              max: 20000,
              divisions: 99,
              onChanged: controller.setVideoBitrate,
            ),
            // A fixed bitrate has a knowable output size; CRF does not, which
            // is why no estimate is offered there rather than a made-up one.
            _BitrateEstimate(settings: settings),
          ],
          if (codec.supportsPreset) ...[
            const SizedBox(height: 8),
            LabelledDropdown<EncodingPreset>(
              label: l10n.encodingPreset,
              value: settings.preset,
              items: EncodingPreset.values,
              labelOf: (p) => p.name,
              onChanged: controller.setPreset,
            ),
            const SizedBox(height: 8),
            Text(l10n.encodingPresetHint, style: Theme.of(context).textTheme.bodySmall),
          ],
        ],
        if (isReencoding && useCrf) ...[
          const SizedBox(height: 4),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.capBitrateLabel),
            subtitle: Text(l10n.capBitrateHint),
            value: settings.capBitrateToSource,
            onChanged: controller.setCapBitrateToSource,
          ),
        ],
        if (subtitleCapable && codec != VideoCodec.none) ...[
          const SizedBox(height: 4),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.keepSubtitles),
            subtitle: Text(l10n.keepSubtitlesHint),
            value: settings.keepSubtitles,
            onChanged: controller.setKeepSubtitles,
          ),
        ],
      ],
    );
  }
}

/// Expected output size for a fixed-bitrate encode, summed over the files
/// whose duration is known. This is the same arithmetic FFmpeg's ABR aims at,
/// so it is honest — unlike a CRF "estimate", which would be a guess.
class _BitrateEstimate extends ConsumerWidget {
  const _BitrateEstimate({required this.settings});

  final ConversionSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final pending = ref.watch(queueProvider.select((q) => q.pending));

    final audioKbps = settings.audioCodec == AudioCodec.none ||
            !settings.audioCodec.supportsBitrate
        ? 0
        : settings.audioBitrateKbps;

    var total = 0;
    var known = false;
    for (final job in pending) {
      var ms = job.sourceDurationMs;
      if (ms == null || ms <= 0) continue;
      final trim = settings.trim;
      if (trim != null && trim.isValid) ms = trim.durationMs;
      if (settings.speed.isChanged) ms = (ms / settings.speed.factor).round();
      known = true;
      total += RateCalc.estimatedBytes(
        videoKbps: settings.videoBitrateKbps,
        audioKbps: audioKbps,
        durationMs: ms,
      );
    }

    if (!known) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        l10n.estimateTotal(OutputPaths.humanBytes(total)),
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}

class _AudioSection extends StatelessWidget {
  const _AudioSection({required this.settings, required this.controller});

  final ConversionSettings settings;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final choices = ContainerRules.audioCodecsFor(settings.container);
    final codec = settings.audioCodec;

    return _Section(
      title: l10n.sectionAudio,
      icon: HugeIcons.strokeRoundedMusicNote01,
      accent: SectionAccents.blue,
      children: [
        LabelledDropdown<AudioCodec>(
          label: l10n.audioCodec,
          value: codec,
          items: choices,
          onChanged: choices.length > 1 ? controller.setAudioCodec : null,
          labelOf: (c) => audioCodecLabel(l10n, c),
        ),
        if (codec.supportsBitrate) ...[
          const SizedBox(height: 8),
          LabelledSlider(
            label: l10n.audioBitrate(settings.audioBitrateKbps),
            value: settings.audioBitrateKbps,
            min: 32,
            max: 320,
            divisions: 18,
            onChanged: controller.setAudioBitrate,
          ),
        ],
        // Neither survives a remux: `-ac`/`-ar` need an encoder to act on.
        if (codec != AudioCodec.copy && codec != AudioCodec.none) ...[
          const SizedBox(height: 8),
          LabelledDropdown<AudioChannels>(
            label: l10n.audioChannelsLabel,
            value: settings.audioChannels,
            items: AudioChannels.values,
            labelOf: (c) => switch (c) {
              AudioChannels.keep => l10n.presetOriginal,
              AudioChannels.mono => l10n.audioMono,
              AudioChannels.stereo => l10n.audioStereo,
            },
            onChanged: controller.setAudioChannels,
          ),
          const SizedBox(height: 16),
          LabelledDropdown<SampleRate>(
            label: l10n.sampleRateLabel,
            value: settings.sampleRate,
            items: SampleRate.values,
            labelOf: (r) => r == SampleRate.keep ? l10n.presetOriginal : r.label,
            onChanged: controller.setSampleRate,
          ),
          const SizedBox(height: 6),
          Text(l10n.voiceAudioHint, style: Theme.of(context).textTheme.bodySmall),
        ],
      ],
    );
  }
}

class _TransformSection extends StatelessWidget {
  const _TransformSection({required this.settings, required this.controller});

  final ConversionSettings settings;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    final canTransform = settings.videoCodec != VideoCodec.copy &&
        settings.videoCodec != VideoCodec.none &&
        settings.audioCodec != AudioCodec.copy;

    return _Section(
      title: l10n.sectionTransform,
      icon: HugeIcons.strokeRoundedRotateCrop,
      accent: SectionAccents.pink,
      children: [
        LabelledDropdown<RotatePreset>(
          label: l10n.rotateLabel,
          value: settings.rotate,
          items: RotatePreset.values,
          labelOf: (r) => r.label,
          onChanged: canTransform ? controller.setRotate : null,
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.flipLabel),
          value: settings.flipH,
          onChanged: canTransform ? controller.setFlipH : null,
        ),
        const SizedBox(height: 8),
        LabelledDropdown<SpeedPreset>(
          label: l10n.speedLabel,
          value: settings.speed,
          items: SpeedPreset.values,
          labelOf: (s) => s.label,
          onChanged: canTransform ? controller.setSpeed : null,
        ),
        const SizedBox(height: 16),
        LabelledDropdown<CropPreset>(
          label: l10n.cropLabel,
          value: settings.crop,
          items: CropPreset.values,
          labelOf: (c) => c == CropPreset.none ? l10n.presetOriginal : c.label,
          onChanged: canTransform ? controller.setCrop : null,
        ),
        if (settings.crop.isChanged && canTransform) ...[
          const SizedBox(height: 6),
          Text(l10n.cropHint, style: theme.textTheme.bodySmall),
        ],
        const SizedBox(height: 8),
        if (canTransform && settings.audioCodec != AudioCodec.none)
          LabelledSlider(
            label: l10n.volumeLabel(settings.volumePercent),
            value: settings.volumePercent,
            min: 0,
            max: 200,
            divisions: 40,
            onChanged: controller.setVolumePercent,
          ),
        if (!canTransform) ...[
          const SizedBox(height: 8),
          Text(l10n.transformNeedsReencode, style: theme.textTheme.bodySmall),
        ],
      ],
    );
  }
}

class _TrimSection extends ConsumerWidget {
  const _TrimSection({required this.settings, required this.controller});

  final ConversionSettings settings;
  final SettingsController controller;

  /// Types an exact timestamp. The slider is fine for "drop the intro" and
  /// hopeless for "start at 12:04": across a two-hour video one pixel is about
  /// ten seconds, so the only way to land on a second is to say which one.
  Future<void> _editBound(
    BuildContext context, {
    required bool isStart,
    required TrimRange trim,
    required int durationMs,
  }) async {
    final l10n = L10n.of(context);
    final current = isStart ? trim.startMs : trim.endMs;
    final field = TextEditingController(text: TimeInput.format(current));

    final entered = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isStart ? l10n.trimStart : l10n.trimEnd),
        content: TextField(
          controller: field,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: l10n.trimTimeHint,
            helperText: l10n.trimTimeHelp(TimeInput.format(durationMs)),
          ),
          onSubmitted: (v) => Navigator.of(context).pop(TimeInput.parse(v)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(TimeInput.parse(field.text)),
            child: Text(l10n.commonOk),
          ),
        ],
      ),
    );
    field.dispose();
    if (entered == null) return;

    final clamped = entered.clamp(0, durationMs);
    // A range that starts after it ends is not a range; the edited bound wins
    // and the other one gives way rather than the edit being thrown out.
    final next = isStart
        ? TrimRange(startMs: clamped, endMs: clamped < trim.endMs ? trim.endMs : durationMs)
        : TrimRange(startMs: clamped > trim.startMs ? trim.startMs : 0, endMs: clamped);
    if (next.isValid) controller.setTrim(next);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final pending = ref.watch(queueProvider.select((q) => q.pending));

    final int? durationMs = pending.length == 1 ? pending.first.sourceDurationMs : null;
    final available = durationMs != null && durationMs > 0;

    final trim = settings.trim;
    final enabled = available && trim != null;

    return _Section(
      title: l10n.sectionTrim,
      icon: HugeIcons.strokeRoundedScissor01,
      accent: SectionAccents.pink,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.trimEnable),
          subtitle: available ? null : Text(l10n.trimHint),
          value: enabled,
          onChanged: !available
              ? null
              : (on) {
                  if (on) {
                    controller.setTrim(TrimRange(startMs: 0, endMs: durationMs));
                  } else {
                    controller.clearTrim();
                  }
                },
        ),
        if (enabled) ...[
          RangeSlider(
            values: RangeValues(
              trim.startMs.toDouble().clamp(0, durationMs.toDouble()),
              trim.endMs.toDouble().clamp(0, durationMs.toDouble()),
            ),
            max: durationMs.toDouble(),
            onChanged: (v) {
              final start = v.start.round();
              final end = v.end.round();
              if (end > start) {
                controller.setTrim(TrimRange(startMs: start, endMs: end));
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _editBound(
                    context,
                    isStart: true,
                    trim: trim,
                    durationMs: durationMs,
                  ),
                  child: Text('${l10n.trimStart}  ${TimeInput.format(trim.startMs)}'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _editBound(
                    context,
                    isStart: false,
                    trim: trim,
                    durationMs: durationMs,
                  ),
                  child: Text('${l10n.trimEnd}  ${TimeInput.format(trim.endMs)}'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            l10n.trimRangeLabel(
              TimeInput.format(trim.startMs),
              TimeInput.format(trim.endMs),
            ),
            style: theme.textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({required this.settings, required this.controller});

  final ConversionSettings settings;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final container = settings.container;

    // AVIF reads the same slider through libaom's CRF scale; animated WebP
    // reads it as libwebp's -quality, exactly as the still one does.
    final losslessCapable = container == ContainerFormat.webp ||
        container == ContainerFormat.webpAnimated;
    final hasQuality = container == ContainerFormat.jpg ||
        container == ContainerFormat.avif ||
        (losslessCapable && !settings.lossless);
    final hasLosslessToggle = losslessCapable;

    return _Section(
      title: l10n.sectionImage,
      icon: HugeIcons.strokeRoundedImage01,
      accent: SectionAccents.amber,
      children: [
        LabelledDropdown<ResolutionPreset>(
          label: l10n.resolution,
          value: settings.resolution,
          items: ResolutionPreset.values,
          labelOf: (r) => _resolutionLabel(l10n, r),
          onChanged: controller.setResolution,
        ),
        if (!container.isAnimatedImage) ...[
          const SizedBox(height: 16),
          // "Half the size" is how people think about a photo; the height
          // presets above only ever answered "make it 1080p".
          LabelledDropdown<ImageScale>(
            label: l10n.imageScaleLabel,
            value: settings.imageScale,
            items: ImageScale.values,
            labelOf: (s) => s == ImageScale.keep ? l10n.presetOriginal : s.label,
            onChanged: controller.setImageScale,
          ),
        ],
        if (container.isAnimatedImage) ...[
          const SizedBox(height: 16),
          LabelledDropdown<FpsPreset>(
            label: l10n.frameRate,
            value: settings.fps,
            items: FpsPreset.values,
            labelOf: (f) => _fpsLabel(l10n, f),
            onChanged: controller.setFps,
          ),
        ],
        if (hasLosslessToggle)
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.lossless),
            subtitle: Text(l10n.losslessHint),
            value: settings.lossless,
            onChanged: controller.setLossless,
          ),
        if (hasQuality) ...[
          const SizedBox(height: 8),
          LabelledSlider(
            label: l10n.imageQuality(settings.imageQuality),
            value: settings.imageQuality,
            min: 1,
            max: 100,
            divisions: 99,
            onChanged: controller.setImageQuality,
          ),
        ],
      ],
    );
  }
}

String _enhanceLabel(L10n l10n, EnhanceLevel level) => switch (level) {
      EnhanceLevel.none => l10n.enhanceOff,
      EnhanceLevel.light => l10n.enhanceLight,
      EnhanceLevel.medium => l10n.enhanceMedium,
      EnhanceLevel.strong => l10n.enhanceStrong,
    };

class _EnhanceSection extends StatelessWidget {
  const _EnhanceSection({required this.settings, required this.controller});

  final ConversionSettings settings;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final downscaling = settings.resolution != ResolutionPreset.keep;

    return _Section(
      title: l10n.sectionEnhance,
      icon: HugeIcons.strokeRoundedSparkles,
      accent: SectionAccents.amber,
      children: [
        LabelledDropdown<EnhanceLevel>(
          label: l10n.sharpenLabel,
          value: settings.sharpen,
          items: EnhanceLevel.values,
          labelOf: (l) => _enhanceLabel(l10n, l),
          onChanged: controller.setSharpen,
        ),
        const SizedBox(height: 6),
        // The honest sentence. Every competitor's "AI enhance" implies it can
        // rescue a blurred shot; sharpening raises edge contrast and nothing
        // more, and a user who expects a rescue leaves a one-star review.
        Text(
          settings.sharpen == EnhanceLevel.strong ? l10n.sharpenStrongHint : l10n.sharpenHint,
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        LabelledDropdown<EnhanceLevel>(
          label: l10n.denoiseLabel,
          value: settings.denoise,
          items: EnhanceLevel.values,
          labelOf: (l) => _enhanceLabel(l10n, l),
          onChanged: controller.setDenoise,
        ),
        const SizedBox(height: 6),
        Text(l10n.denoiseHint, style: theme.textTheme.bodySmall),
        const SizedBox(height: 8),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.autoColorLabel),
          subtitle: Text(l10n.autoColorHint),
          value: settings.autoColor,
          onChanged: controller.setAutoColor,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.upscaleLabel),
          // A downscale target and a 2× upscale are the same filter slot. The
          // toggle goes dead rather than silently doing nothing, and says why.
          subtitle: Text(downscaling ? l10n.upscaleConflictHint : l10n.upscaleHint),
          value: settings.upscaleActive,
          onChanged: downscaling ? null : controller.setUpscale2x,
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Start bar
// -----------------------------------------------------------------------------

class _StartBar extends ConsumerWidget {
  const _StartBar({required this.pendingCount, required this.isRunning});

  final int pendingCount;
  final bool isRunning;

  /// Conversion is the heaviest thing a phone does; below 20% and unplugged,
  /// ask instead of silently draining what is left. Any battery API hiccup
  /// (emulators, desktops) counts as "fine, go ahead".
  Future<bool> _confirmBattery(BuildContext context) async {
    int level;
    BatteryState state;
    try {
      final battery = Battery();
      level = await battery.batteryLevel;
      state = await battery.batteryState;
    } catch (_) {
      return true;
    }
    final charging = state == BatteryState.charging || state == BatteryState.full;
    if (level >= 20 || charging) return true;
    if (!context.mounted) return true;

    final l10n = L10n.of(context);
    final proceed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.battery_alert),
        title: Text(l10n.lowBatteryTitle),
        content: Text(l10n.lowBatteryBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.lowBatteryContinue),
          ),
        ],
      ),
    );
    return proceed ?? false;
  }

  /// Checks there is somewhere to put the results before spending an hour of
  /// battery on them.
  ///
  /// FFmpeg's own answer to a full disk is `No space left on device` on the
  /// last line of a log, delivered at 98% of a batch — the single worst way to
  /// learn this. A platform that declines to report free space is not a reason
  /// to block anybody, so an unknown figure means "go ahead".
  Future<bool> _confirmSpace(BuildContext context, WidgetRef ref) async {
    final pending = ref.read(queueProvider).pending;
    final total = pending.fold<int>(0, (sum, job) => sum + job.inputBytes);
    final free = await ref.read(deviceStorageProvider).freeBytes();
    if (SpaceCheck.fits(totalInputBytes: total, freeBytes: free)) return true;
    if (!context.mounted) return true;

    final l10n = L10n.of(context);
    final proceed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.sd_card_alert_outlined),
        title: Text(l10n.lowSpaceTitle),
        content: Text(l10n.lowSpaceBody(
          OutputPaths.humanBytes(SpaceCheck.requiredBytes(total)),
          OutputPaths.humanBytes(free ?? 0),
        )),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.lowBatteryContinue),
          ),
        ],
      ),
    );
    return proceed ?? false;
  }

  /// The Advanced profile, with the batch-scoped bits filled in.
  ConversionSettings _advancedSettings(WidgetRef ref) {
    var s = ref.read(settingsProvider);
    // Only video reads the size mode. A stale `size` left over from a video
    // profile must not attach a megabyte-scale budget to a photo, where it
    // would send the fit-to-size search hunting for a limit the picture is
    // nowhere near.
    if (s.rateControl == RateControl.size && s.container.kind == MediaKind.video) {
      s = s.copyWith(sizeTargetBytes: ref.read(sizeTargetProvider));
    }
    // Trim is offered only while exactly one file is queued, but the range
    // survives in settings; if more files arrived since, it must not silently
    // cut every one of them.
    if (ref.read(queueProvider).pending.length != 1) {
      s = s.copyWith(clearTrim: true);
    }
    return s;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);

    // A hairline above the docked action, so it reads as a bar rather than a
    // button floating over the last card.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 1, color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
        SafeArea(
          top: false,
          // Полоса во всю ширину, а кнопка внутри неё — по той же колонке, что
          // и содержимое над ней. Кнопка шириной в тысячу точек не становится
          // удобнее, зато перестаёт читаться как продолжение списка.
          child: AdaptiveContent(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.space.lg, vertical: context.space.sm + 2),
              child: SizedBox(
                height: 52,
                child: isRunning
                  ? GradientButton(
                      label: l10n.cancelBatch,
                      icon: HugeIcons.strokeRoundedStop,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFEF4444), Color(0xFFF87171)],
                      ),
                      onPressed: () => ref.read(queueProvider.notifier).cancelBatch(),
                    )
                  : GradientButton(
                      label: l10n.startConversion(pendingCount),
                      icon: HugeIcons.strokeRoundedFlash,
                      onPressed: pendingCount == 0
                          ? null
                          : () async {
                              if (!await _confirmSpace(context, ref)) return;
                              if (!context.mounted) return;
                              if (!await _confirmBattery(context)) return;
                              if (!context.mounted) return;

                              final queue = ref.read(queueProvider.notifier);
                              final prefs = ref.read(appPrefsProvider);

                              // Every pending job already carries the profile it
                              // will convert with (the queue is kept in sync as
                              // the controls change); this only re-asserts it and
                              // strips a trim that no longer applies.
                              syncPendingSettings(ref);
                              if (!prefs.simpleMode) {
                                queue.updatePendingSettings(_advancedSettings(ref));
                              }

                              if (prefs.simpleMode &&
                                  ref.read(selectedPresetProvider).isMerge) {
                                final count = ref.read(queueProvider).pending.length;
                                if (count < 2) return;
                                queue.mergePending(
                                  ref.read(effectiveSettingsProvider(MediaKind.video)),
                                  L10n.of(context).mergedVideoName(count),
                                );
                              }

                              queue.start(queueStringsFrom(L10n.of(context)));
                            },
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
