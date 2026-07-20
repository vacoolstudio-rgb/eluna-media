import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/conversion_settings.dart';
import '../domain/media_format.dart';
import '../domain/quick_presets.dart';
import 'queue_controller.dart';
import 'settings_controller.dart';

/// What kinds of file are waiting to be converted, as guessed from their
/// names. Everything the Convert tab offers is derived from this: a photo must
/// never be offered "compress video", and MP3 must never be offered "JPEG".
final pendingKindsProvider = Provider<Set<MediaKind>>((ref) {
  final pending = ref.watch(queueProvider.select((q) => q.pending));
  return {
    for (final job in pending)
      if (ContainerFormat.kindOfFile(job.inputName) case final kind?) kind,
  };
});

/// The kind the UI organises itself around. With a mixed selection the app
/// still has to *lead* with something; it leads with video, because a mixed
/// batch that contains video is nearly always a video job with stray
/// thumbnails, and never the other way round.
final primaryKindProvider = Provider<MediaKind>((ref) {
  final kinds = ref.watch(pendingKindsProvider);
  if (kinds.contains(MediaKind.video)) return MediaKind.video;
  if (kinds.contains(MediaKind.audio)) return MediaKind.audio;
  if (kinds.contains(MediaKind.image)) return MediaKind.image;
  return MediaKind.video;
});

final isMixedSelectionProvider = Provider<bool>(
  (ref) => ref.watch(pendingKindsProvider).length > 1,
);

/// Which Simple-view preset is active, kept legal for what is actually queued:
/// adding photos to an empty queue switches the preset to "Compress photo"
/// rather than leaving "Compress video" selected and failing later.
class SelectedPresetNotifier extends Notifier<QuickPreset> {
  @override
  QuickPreset build() {
    // `listen`, not `watch`: a kind change must *correct* the selection, not
    // rebuild the notifier and throw the user's choice away on every unrelated
    // queue edit.
    ref.listen<MediaKind>(primaryKindProvider, (_, kind) {
      if (state.expectsKind != kind) state = QuickPreset.defaultFor(kind);
    });
    return QuickPreset.defaultFor(ref.read(primaryKindProvider));
  }

  void select(QuickPreset p) => state = p;
}

/// An explicit output container chosen by the user, overriding the preset's
/// own. Null means "whatever the preset recommends".
class FormatOverride extends Notifier<ContainerFormat?> {
  @override
  ContainerFormat? build() {
    // A new preset comes with its own recommended container; an override held
    // over from the previous one would be stale, and possibly illegal.
    ref.listen(selectedPresetProvider, (_, __) => state = null);
    return null;
  }

  void set(ContainerFormat? container) => state = container;
}

final selectedPresetProvider =
    NotifierProvider<SelectedPresetNotifier, QuickPreset>(SelectedPresetNotifier.new);

final formatOverrideProvider =
    NotifierProvider<FormatOverride, ContainerFormat?>(FormatOverride.new);

/// Size budget for the fit-to-size preset, in bytes.
class SizeTargetNotifier extends Notifier<int> {
  @override
  int build() => SizeTarget.discord.bytes;

  void set(int bytes) {
    if (bytes > 0) state = bytes;
  }
}

final sizeTargetProvider = NotifierProvider<SizeTargetNotifier, int>(SizeTargetNotifier.new);

/// The profile a queued file of this kind will *actually* be converted with,
/// in whichever mode the user is in. Single source of truth: the queue stamps
/// it onto every pending job, so the Queue tab shows what will really happen
/// instead of a stale stored default.
final effectiveSettingsProvider = Provider.family<ConversionSettings, MediaKind>((ref, kind) {
  if (ref.watch(appPrefsProvider.select((p) => p.simpleMode))) {
    return ref.watch(simpleSettingsProvider(kind));
  }

  var s = ref.watch(settingsProvider);
  // The advanced profile is authored against one container. A file of another
  // kind cannot use it — a photo queued while the profile says MP4 is not
  // going to become a video — so it falls back to that kind's own default.
  // Video → audio is the one legitimate crossing: that is audio extraction.
  final targetKind = s.container.kind;
  final legal = targetKind == kind || (kind == MediaKind.video && targetKind == MediaKind.audio);
  if (!legal) {
    s = s.withContainer(ContainerFormat.defaultOutputFor(kind));
  }
  if (s.rateControl == RateControl.size) {
    s = s.copyWith(sizeTargetBytes: ref.watch(sizeTargetProvider));
  }
  return s;
});

/// The profile the Simple view applies to a file of a given kind.
///
/// The selected preset governs its own kind; every other kind falls back to
/// that kind's default preset, so a mixed batch converts each file sensibly
/// instead of forcing one profile onto all of them.
final simpleSettingsProvider = Provider.family<ConversionSettings, MediaKind>((ref, kind) {
  final selected = ref.watch(selectedPresetProvider);
  final preset = selected.expectsKind == kind ? selected : QuickPreset.defaultFor(kind);

  var settings = preset.settings(sizeTargetBytes: ref.watch(sizeTargetProvider));

  // The explicit format choice only applies to the kind the user was looking
  // at when they made it.
  final override = ref.watch(formatOverrideProvider);
  if (override != null && preset == selected && override != settings.container) {
    settings = settings.withContainer(override);
  }

  final prefs = ref.watch(appPrefsProvider);
  return settings.copyWith(
    preset: prefs.powerMode.encodingPreset,
    stripMetadata: ref.watch(settingsProvider.select((s) => s.stripMetadata)),
  );
});

/// Rewrites every pending job with the profile it would be converted with
/// right now. Call after adding files, and whenever a control changes.
void syncPendingSettings(WidgetRef ref) {
  final fallback = ref.read(primaryKindProvider);
  ref.read(queueProvider.notifier).updatePendingSettingsPerFile((job) {
    final kind = ContainerFormat.kindOfFile(job.inputName) ?? fallback;
    return ref.read(effectiveSettingsProvider(kind));
  });
}
