import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/output_paths.dart';
import '../services/thumbnails.dart';
import 'achievements_controller.dart';
import 'app_meta_controller.dart';
import 'queue_controller.dart';
import 'settings_controller.dart';

/// What the app's own output folder currently costs, so Settings can say it out
/// loud.
///
/// Converted files live inside the sandbox until the user saves or shares them.
/// That is the right default — nothing lands in the gallery uninvited — but it
/// also means the folder is invisible: it shows up only as "app data", and no
/// file manager can reach it. Without this the app was a bucket with no drain.
final storageUsageProvider =
    FutureProvider.autoDispose<({int files, int bytes})>((ref) => OutputPaths.usage());

/// Drops every finished job and deletes the files behind them, returning the
/// bytes reclaimed.
///
/// Active jobs and their outputs are left alone: the sweep keeps whatever the
/// remaining queue entries still point at.
Future<int> clearStoredOutputs(WidgetRef ref) async {
  final queue = ref.read(queueProvider.notifier);
  queue.clearFinished();
  final freed = await queue.sweepOrphanedOutputs();
  // The preview frames of files that are no longer listed are the same kind of
  // invisible residue. Anything still queued regenerates its own on next draw.
  await ref.read(thumbnailCacheProvider).clear();
  ref.invalidate(thumbnailProvider);
  ref.invalidate(storageUsageProvider);
  return freed;
}

/// Приводит состояние в памяти в соответствие с тем, что от него осталось после
/// «удалить все мои данные».
///
/// Стирает не это: стирает `ElunaDataWipe` по списку, зарегистрированному в
/// `main`, и последним шагом чистит SharedPreferences целиком. Здесь только
/// последствие — контроллеры, которые держат прочитанное оттуда, о стирании не
/// знают, и без сброса экран продолжал бы показывать удалённые данные, а первая
/// же правка настройки вернула бы часть из них обратно в prefs.
///
/// Это riverpod-эквивалент того, что Subs делает одним `onFinished:
/// subscriptions.load`: провайдеры перечитывают уже пустой prefs.
void resetAfterDataWipe(WidgetRef ref) {
  ref.invalidate(queueProvider);
  ref.invalidate(achievementsProvider);
  ref.invalidate(settingsProvider);
  ref.invalidate(appPrefsProvider);
  ref.invalidate(thumbnailProvider);
  ref.invalidate(storageUsageProvider);
  // Последним: вместе с настройками исчез и `meta.hasSeenIntro`, поэтому
  // приложение возвращается к вступительному экрану о приватности — как на
  // свежей установке. Так и должно быть: «удалить всё» стирает и тот факт, что
  // человек здесь уже был.
  //
  // Тема — исключение, и намеренно: её держит общий контроллер пакета, ключи
  // `eluna.theme.*` пакет же и стёр, а в памяти выбранный пресет останется до
  // перезапуска. Возвращать его руками нечем и незачем — приложение не должно
  // моргнуть на светлую тему поверх удаления.
  ref.invalidate(appMetaProvider);
}
