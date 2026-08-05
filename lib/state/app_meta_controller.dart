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

/// Правило показа «что нового», вынесенное из виджета.
///
/// Раньше оно жило четырьмя `return` внутри `HomeShell._maybeShowWhatsNew` и
/// проверить его можно было только запуском приложения. Теперь версия приходит
/// с платформы (`ElunaVersion.name()`), то есть сравнение стало ещё и
/// асинхронным — тем более незачем держать его в колбэке первого кадра.
abstract final class WhatsNewGate {
  /// Показывать ли окно новинок.
  ///
  /// [version] — строго `ElunaVersion.name()`, без номера сборки: `full()` дал
  /// бы «0.4.0 (2)», и та же версия, пересобранная с другим номером, показала
  /// бы окно заново. У всех, кто обновляется, в `meta.lastSeenVersion` лежит
  /// «0.4.0», записанное прежней константой, — `name()` возвращает ровно эту
  /// строку, поэтому повторного показа не будет ни у кого.
  static bool shouldShow(AppMeta meta, String version) {
    // Платформа не назвала версию (тестовый хост, сборка без метаданных).
    // Сравнивать не с чем — и записывать пустую строку в «уже видел» нельзя,
    // иначе окно не покажется уже никогда.
    if (version.isEmpty) return false;
    if (meta.lastSeenVersion == version) return false;
    // Свежая установка: человеку, который ещё ничего не конвертировал,
    // рассказывать «что нового» не о чем — для него всё новое.
    if (meta.lastSeenVersion == null && meta.successfulConversions == 0) {
      return false;
    }
    return true;
  }

  /// Помечать ли версию просмотренной. Шире, чем [shouldShow], намеренно: тот,
  /// кому окно не показали (свежая установка), тоже не должен увидеть его при
  /// следующем запуске той же версии.
  static bool shouldMark(AppMeta meta, String version) =>
      version.isNotEmpty && meta.lastSeenVersion != version;
}
