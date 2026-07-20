import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings_controller.dart';

/// Long-lived facts about this install: when it appeared, what the user has
/// done with it, and whether they paid to remove the banner. These drive the
/// ad grace period and the review milestones, so they are stamped once and
/// never recomputed.
class AppMeta {
  const AppMeta({
    required this.firstLaunchAtMs,
    this.successfulConversions = 0,
    this.hasRated = false,
    this.lastRatePromptEpochDay = -1,
    this.isPro = false,
    this.hasSeenIntro = false,
    this.lastSeenVersion,
  });

  /// Wall-clock of the very first launch, stamped on first read.
  final int firstLaunchAtMs;

  /// Completed (not failed, not cancelled) conversions over the app's life.
  final int successfulConversions;

  /// The user went through the rating flow once; never ask again.
  final bool hasRated;

  /// Day (epoch ms ~/ day) of the last review prompt — at most one per day.
  final int lastRatePromptEpochDay;

  /// One-time "remove ads" purchase.
  final bool isPro;

  /// The first-run privacy intro was acknowledged.
  final bool hasSeenIntro;

  /// App version whose what's-new the user has seen. Null on installs that
  /// predate the dialog and on fresh installs.
  final String? lastSeenVersion;

  AppMeta copyWith({
    int? successfulConversions,
    bool? hasRated,
    int? lastRatePromptEpochDay,
    bool? isPro,
    bool? hasSeenIntro,
    String? lastSeenVersion,
  }) =>
      AppMeta(
        firstLaunchAtMs: firstLaunchAtMs,
        successfulConversions: successfulConversions ?? this.successfulConversions,
        hasRated: hasRated ?? this.hasRated,
        lastRatePromptEpochDay: lastRatePromptEpochDay ?? this.lastRatePromptEpochDay,
        isPro: isPro ?? this.isPro,
        hasSeenIntro: hasSeenIntro ?? this.hasSeenIntro,
        lastSeenVersion: lastSeenVersion ?? this.lastSeenVersion,
      );
}

class AppMetaController extends Notifier<AppMeta> {
  static const _kFirstLaunch = 'meta.firstLaunchAtMs';
  static const _kConversions = 'meta.successfulConversions';
  static const _kHasRated = 'meta.hasRated';
  static const _kLastPromptDay = 'meta.lastRatePromptDay';
  static const _kIsPro = 'meta.isPro';
  static const _kSeenIntro = 'meta.hasSeenIntro';
  static const _kSeenVersion = 'meta.lastSeenVersion';

  @override
  AppMeta build() {
    final p = ref.read(sharedPreferencesProvider);

    // Stamped exactly once. Installs that predate this field start their
    // 14-day ad grace period now rather than being treated as day-15 users.
    var firstLaunch = p.getInt(_kFirstLaunch);
    if (firstLaunch == null) {
      firstLaunch = DateTime.now().millisecondsSinceEpoch;
      p.setInt(_kFirstLaunch, firstLaunch);
    }

    return AppMeta(
      firstLaunchAtMs: firstLaunch,
      successfulConversions: p.getInt(_kConversions) ?? 0,
      hasRated: p.getBool(_kHasRated) ?? false,
      lastRatePromptEpochDay: p.getInt(_kLastPromptDay) ?? -1,
      isPro: p.getBool(_kIsPro) ?? false,
      hasSeenIntro: p.getBool(_kSeenIntro) ?? false,
      lastSeenVersion: p.getString(_kSeenVersion),
    );
  }

  void recordSuccessfulConversions(int count) {
    if (count <= 0) return;
    state = state.copyWith(successfulConversions: state.successfulConversions + count);
    ref.read(sharedPreferencesProvider).setInt(_kConversions, state.successfulConversions);
  }

  void markRated() {
    state = state.copyWith(hasRated: true);
    ref.read(sharedPreferencesProvider).setBool(_kHasRated, true);
  }

  void markRatePromptShown(int epochDay) {
    state = state.copyWith(lastRatePromptEpochDay: epochDay);
    ref.read(sharedPreferencesProvider).setInt(_kLastPromptDay, epochDay);
  }

  void setPro(bool value) {
    state = state.copyWith(isPro: value);
    ref.read(sharedPreferencesProvider).setBool(_kIsPro, value);
  }

  void markIntroSeen() {
    state = state.copyWith(hasSeenIntro: true);
    ref.read(sharedPreferencesProvider).setBool(_kSeenIntro, true);
  }

  void markVersionSeen(String version) {
    state = state.copyWith(lastSeenVersion: version);
    ref.read(sharedPreferencesProvider).setString(_kSeenVersion, version);
  }
}

final appMetaProvider = NotifierProvider<AppMetaController, AppMeta>(AppMetaController.new);
