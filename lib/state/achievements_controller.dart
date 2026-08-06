import 'package:eluna_shared/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/achievements.dart';
import '../domain/conversion_job.dart';
import '../domain/media_format.dart';
import 'settings_controller.dart';

/// Снимок всего каталога плюс счётчики, из которых он посчитан.
///
/// Назван «снимком», а не состоянием, нарочно: у общего фреймворка есть свой
/// `AchievementState` — состояние ОДНОГО достижения, — и два типа, отличающихся
/// одной буквой, рано или поздно перепутали бы на месте вызова.
class AchievementsSnapshot {
  const AchievementsSnapshot({required this.stats, required this.entries});

  final ConversionStats stats;

  /// Весь каталог в порядке показа, уже посчитанный общим `evaluate`.
  final List<AchievementState<ConversionStats>> entries;

  int get total => entries.length;
  int get unlockedCount => entries.where((e) => e.unlocked).length;
}

/// Owns the lifetime stats and the unlocked set. The queue reports each
/// finished batch through [recordBatch]; anything newly earned is returned so
/// the UI can celebrate it.
///
/// Считает не он: пороги, прогресс и правило платины — общий
/// [mediaAchievements]. Контроллеру остаётся хранилище, потому что пакет своего
/// не имеет и намеренно: «Nothing here writes — the store is the app's».
class AchievementsController extends Notifier<AchievementsSnapshot> {
  static const _kConversions = 'ach.conversions';
  static const _kBytesSaved = 'ach.bytesSaved';
  static const _kMaxBatch = 'ach.maxBatch';
  static const _kFlags = 'ach.flags'; // StringList of boolean stat names.
  static const _kUnlocked = 'ach.unlocked'; // StringList of achievement ids.
  static const _kUnlockedAt = 'ach.unlockedAt'; // StringList of 'id|iso8601'.

  /// id → когда открыто. Набор ключей — это «открытые когда-либо»; значение
  /// null стоит у тех, кто открыл достижение до переезда: дат тогда не
  /// хранилось, и выдумывать их задним числом нечестно.
  final Map<String, DateTime?> _unlockedAt = {};

  /// Достижение, которого в каталоге больше нет, молча игнорируется — как и
  /// раньше, чужое имя в хранилище не должно портить остальной список.
  bool _known(String id) => mediaAchievements.all.any((d) => d.id == id);

  @override
  AchievementsSnapshot build() {
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

    // Совместимость с уже установленными приложениями — самое опасное место
    // переезда. Ключи и их формат не меняются вообще: `ach.unlocked` как был
    // списком ИМЁН, так и остался, а имена enum'а и id общего каталога — это
    // одно и то же значение. Поэтому переносить (как делали в main.dart для
    // даты установки) здесь нечего: старый список читается как есть.
    for (final id in p.getStringList(_kUnlocked) ?? const <String>[]) {
      if (_known(id)) _unlockedAt[id] = null;
    }
    // Даты появились только сейчас и лежат отдельным, новым ключом — у
    // разблокировок «до переезда» их просто нет.
    for (final row in p.getStringList(_kUnlockedAt) ?? const <String>[]) {
      final sep = row.indexOf('|');
      if (sep <= 0) continue;
      final id = row.substring(0, sep);
      final at = DateTime.tryParse(row.substring(sep + 1));
      if (at != null && _known(id)) _unlockedAt[id] = at;
    }

    return AchievementsSnapshot(stats: stats, entries: _evaluate(stats));
  }

  List<AchievementState<ConversionStats>> _evaluate(ConversionStats stats) {
    final dated = <String, DateTime>{
      for (final e in _unlockedAt.entries)
        if (e.value != null) e.key: e.value!,
    };
    return [
      for (final e in mediaAchievements.evaluate(stats, unlockedAt: dated))
        // Once unlocked, always unlocked: счётчики только растут, но если
        // будущий каталог поднимет порог, сохранённый список всё равно удержит
        // медаль на месте.
        if (e.unlocked || !_unlockedAt.containsKey(e.def.id))
          e
        else
          AchievementState(e.def, e.current, true, e.unlockedAt, false),
    ];
  }

  /// Ingests one finished batch and returns what it newly unlocked.
  List<AchievementState<ConversionStats>> recordBatch(
    List<ConversionJob> completedJobs, {
    DateTime? now,
  }) {
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

    final at = now ?? DateTime.now();
    if (at.hour < 5) s = s.copyWith(nightConversion: true);

    // `isNew` общий код ставит тому, кто дошёл до цели и не имеет записанной
    // даты. У открытых до переезда даты нет вовсе, поэтому новизну
    // подтверждает ещё и отсутствие id среди когда-либо открытых — иначе на
    // первом же батче после обновления человеку заново отпраздновали бы весь
    // его шкаф.
    final fresh = [
      for (final e in _evaluate(s))
        if (e.isNew && !_unlockedAt.containsKey(e.def.id)) e,
    ];
    for (final e in fresh) {
      _unlockedAt[e.def.id] = at;
    }

    state = AchievementsSnapshot(stats: s, entries: _evaluate(s));
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
    // Старый ключ пишется в старом формате и остаётся источником правды про
    // «открыто ли»: даже откат на предыдущую версию приложения ничего не
    // потеряет, а даты для неё — просто лишний ключ.
    p.setStringList(_kUnlocked, _unlockedAt.keys.toList());
    p.setStringList(_kUnlockedAt, [
      for (final e in _unlockedAt.entries)
        if (e.value != null) '${e.key}|${e.value!.toIso8601String()}',
    ]);
  }
}

final achievementsProvider =
    NotifierProvider<AchievementsController, AchievementsSnapshot>(AchievementsController.new);

/// The most recent batch's unlocks, for the toast host. Consumed by the UI.
class FreshUnlocks extends Notifier<List<AchievementState<ConversionStats>>> {
  @override
  List<AchievementState<ConversionStats>> build() => const [];

  void publish(List<AchievementState<ConversionStats>> unlocks) {
    if (unlocks.isNotEmpty) state = unlocks;
  }

  void consume() => state = const [];
}

final freshUnlocksProvider =
    NotifierProvider<FreshUnlocks, List<AchievementState<ConversionStats>>>(FreshUnlocks.new);
