import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/achievements.dart';
import '../domain/conversion_job.dart';
import '../domain/media_format.dart';
import 'settings_controller.dart';

class AchievementsState {
  const AchievementsState({required this.stats, required this.unlocked});

  final ConversionStats stats;
  final Set<Achievement> unlocked;
}

/// Owns the lifetime stats and the unlocked set. The queue reports each
/// finished batch through [recordBatch]; anything newly earned is returned so
/// the UI can celebrate it. Unlocks are persisted by *name*, so removing an
/// achievement from a future catalogue cannot corrupt the rest.
class AchievementsController extends Notifier<AchievementsState> {
  static const _kConversions = 'ach.conversions';
  static const _kBytesSaved = 'ach.bytesSaved';
  static const _kMaxBatch = 'ach.maxBatch';
  static const _kFlags = 'ach.flags'; // StringList of boolean stat names.
  static const _kUnlocked = 'ach.unlocked';

  @override
  AchievementsState build() {
    final p = ref.read(sharedPreferencesProvider);
    final flags = (p.getStringList(_kFlags) ?? const []).toSet();
    final stats = ConversionStats(
      conversions: p.getInt(_kConversions) ?? 0,
      bytesSaved: p.getInt(_kBytesSaved) ?? 0,
      maxBatch: p.getInt(_kMaxBatch) ?? 0,
      usedFitToSize: flags.contains('fitToSize'),
      madeGif: flags.contains('gif'),
      extractedAudio: flags.contains('audioExtract'),
      keptSubtitles: flags.contains('subtitles'),
      usedTransform: flags.contains('transform'),
      convertedVideo: flags.contains('video'),
      convertedAudio: flags.contains('audio'),
      convertedImage: flags.contains('image'),
      nightConversion: flags.contains('night'),
    );
    final unlocked = <Achievement>{
      for (final name in p.getStringList(_kUnlocked) ?? const <String>[])
        for (final a in Achievement.values)
          if (a.name == name) a,
    };
    return AchievementsState(stats: stats, unlocked: unlocked);
  }

  /// Ingests one finished batch and returns what it newly unlocked.
  List<Achievement> recordBatch(List<ConversionJob> completedJobs, {DateTime? now}) {
    if (completedJobs.isEmpty) return const [];

    var s = state.stats;
    s = s.copyWith(
      conversions: s.conversions + completedJobs.length,
      maxBatch: completedJobs.length > s.maxBatch ? completedJobs.length : s.maxBatch,
    );

    var saved = 0;
    for (final job in completedJobs) {
      if (job.inputBytes > 0 && job.outputBytes > 0 && job.outputBytes < job.inputBytes) {
        saved += job.inputBytes - job.outputBytes;
      }
      final settings = job.settings;
      s = s.copyWith(
        usedFitToSize: s.usedFitToSize || settings.sizeTargetBytes != null,
        madeGif: s.madeGif || settings.container == ContainerFormat.gif,
        extractedAudio: s.extractedAudio || settings.kind == MediaKind.audio,
        keptSubtitles: s.keptSubtitles || settings.keepSubtitles,
        usedTransform: s.usedTransform || settings.transforms,
        convertedVideo: s.convertedVideo || settings.kind == MediaKind.video,
        convertedAudio: s.convertedAudio || settings.kind == MediaKind.audio,
        convertedImage: s.convertedImage || settings.kind == MediaKind.image,
      );
    }
    s = s.copyWith(bytesSaved: s.bytesSaved + saved);

    final hour = (now ?? DateTime.now()).hour;
    if (hour < 5) s = s.copyWith(nightConversion: true);

    // Once unlocked, always unlocked: the earned set only ever grows, even if
    // a future catalogue tightens a threshold.
    final earned = Achievement.evaluate(s);
    final fresh = earned.difference(state.unlocked).toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    state = AchievementsState(stats: s, unlocked: {...state.unlocked, ...earned});
    _persist();
    return fresh;
  }

  void _persist() {
    final p = ref.read(sharedPreferencesProvider);
    final s = state.stats;
    p.setInt(_kConversions, s.conversions);
    p.setInt(_kBytesSaved, s.bytesSaved);
    p.setInt(_kMaxBatch, s.maxBatch);
    p.setStringList(_kFlags, [
      if (s.usedFitToSize) 'fitToSize',
      if (s.madeGif) 'gif',
      if (s.extractedAudio) 'audioExtract',
      if (s.keptSubtitles) 'subtitles',
      if (s.usedTransform) 'transform',
      if (s.convertedVideo) 'video',
      if (s.convertedAudio) 'audio',
      if (s.convertedImage) 'image',
      if (s.nightConversion) 'night',
    ]);
    p.setStringList(_kUnlocked, [for (final a in state.unlocked) a.name]);
  }
}

final achievementsProvider =
    NotifierProvider<AchievementsController, AchievementsState>(AchievementsController.new);

/// The most recent batch's unlocks, for the toast host. Consumed by the UI.
class FreshUnlocks extends Notifier<List<Achievement>> {
  @override
  List<Achievement> build() => const [];

  void publish(List<Achievement> unlocks) {
    if (unlocks.isNotEmpty) state = unlocks;
  }

  void consume() => state = const [];
}

final freshUnlocksProvider = NotifierProvider<FreshUnlocks, List<Achievement>>(FreshUnlocks.new);
