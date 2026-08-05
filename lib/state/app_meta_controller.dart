import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings_controller.dart';

/// Long-lived facts about this install: when it appeared and what the user has
/// done with it. These drive the what's-new dialog and the achievements, so
/// they are stamped once and never recomputed.
///
/// Состояние оценки здесь больше не живёт: и «уже оценил», и «спрашивали
/// сегодня» держит `RatingService` из пакета, в своих ключах `rate_*`. Две
/// копии одного факта — это ровно та расходимость, ради которой пакет и есть.
class AppMeta {
  const AppMeta({
    required this.firstLaunchAtMs,
    this.successfulConversions = 0,
    this.hasSeenIntro = false,
    this.lastSeenVersion,
    this.reclaimedBytes = 0,
  });

  /// Bytes of source media the user has had the app delete, over the app's
  /// life. The point of compressing is usually space, and until the number is
  /// stated the user only ever sees the app's folder growing.
  final int reclaimedBytes;

  /// Wall-clock of the very first launch, stamped on first read.
  ///
  /// «День 0» теперь считает `RatingService.installedAt()`; этот штамп остался
  /// затем, что под его ключом он лежит у всех, кто поставил Media до переезда,
  /// и `main` переносит его в пакет. Новый код должен спрашивать пакет.
  final int firstLaunchAtMs;

  /// Completed (not failed, not cancelled) conversions over the app's life.
  final int successfulConversions;

  /// The first-run privacy intro was acknowledged.
  final bool hasSeenIntro;

  /// App version whose what's-new the user has seen. Null on installs that
  /// predate the dialog and on fresh installs.
  final String? lastSeenVersion;

  AppMeta copyWith({
    int? successfulConversions,
    bool? hasSeenIntro,
    String? lastSeenVersion,
    int? reclaimedBytes,
  }) =>
      AppMeta(
        firstLaunchAtMs: firstLaunchAtMs,
        successfulConversions: successfulConversions ?? this.successfulConversions,
        hasSeenIntro: hasSeenIntro ?? this.hasSeenIntro,
        lastSeenVersion: lastSeenVersion ?? this.lastSeenVersion,
        reclaimedBytes: reclaimedBytes ?? this.reclaimedBytes,
      );
}

class AppMetaController extends Notifier<AppMeta> {
  static const _kFirstLaunch = 'meta.firstLaunchAtMs';
  static const _kConversions = 'meta.successfulConversions';
  static const _kSeenIntro = 'meta.hasSeenIntro';
  static const _kSeenVersion = 'meta.lastSeenVersion';
  static const _kReclaimed = 'meta.reclaimedBytes';

  @override
  AppMeta build() {
    final p = ref.read(sharedPreferencesProvider);

    // Stamped exactly once; the review milestones count days from it.
    var firstLaunch = p.getInt(_kFirstLaunch);
    if (firstLaunch == null) {
      firstLaunch = DateTime.now().millisecondsSinceEpoch;
      p.setInt(_kFirstLaunch, firstLaunch);
    }

    return AppMeta(
      firstLaunchAtMs: firstLaunch,
      successfulConversions: p.getInt(_kConversions) ?? 0,
      hasSeenIntro: p.getBool(_kSeenIntro) ?? false,
      lastSeenVersion: p.getString(_kSeenVersion),
      reclaimedBytes: p.getInt(_kReclaimed) ?? 0,
    );
  }

  void recordSuccessfulConversions(int count) {
    if (count <= 0) return;
    state = state.copyWith(successfulConversions: state.successfulConversions + count);
    ref.read(sharedPreferencesProvider).setInt(_kConversions, state.successfulConversions);
  }

  void markIntroSeen() {
    state = state.copyWith(hasSeenIntro: true);
    ref.read(sharedPreferencesProvider).setBool(_kSeenIntro, true);
  }

  void addReclaimedBytes(int bytes) {
    if (bytes <= 0) return;
    state = state.copyWith(reclaimedBytes: state.reclaimedBytes + bytes);
    ref.read(sharedPreferencesProvider).setInt(_kReclaimed, state.reclaimedBytes);
  }

  void markVersionSeen(String version) {
    state = state.copyWith(lastSeenVersion: version);
    ref.read(sharedPreferencesProvider).setString(_kSeenVersion, version);
  }
}

final appMetaProvider = NotifierProvider<AppMetaController, AppMeta>(AppMetaController.new);
