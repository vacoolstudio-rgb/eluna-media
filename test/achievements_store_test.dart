import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/state/achievements_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Переезд достижений на общий фреймворк не имеет права стоить людям их шкаф.
/// Формы теперь считает пакет, но хранилище осталось приложению — и именно оно
/// проверяется здесь, потому что ломается оно молча и только у тех, кто уже
/// пользовался приложением.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const job = ConversionJob(
    id: 'j1',
    inputPath: '/in.mp4',
    inputName: 'in.mp4',
    settings: ConversionSettings(container: ContainerFormat.mp4),
    status: JobStatus.completed,
    inputBytes: 2000,
    outputBytes: 1000,
  );

  Future<ProviderContainer> boot(Map<String, Object> seed) async {
    SharedPreferences.setMockInitialValues(seed);
    final prefs = await SharedPreferences.getInstance();
    return ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
  }

  test('a 1.0 install keeps every achievement it had earned', () async {
    final container = await boot({
      'ach.conversions': 12,
      'ach.maxBatch': 5,
      'ach.flags': <String>['fitToSize', 'video'],
      'ach.unlocked': <String>['firstConversion', 'tenConversions', 'batchOfFive', 'sniper'],
    });
    addTearDown(container.dispose);

    final snapshot = container.read(achievementsProvider);
    final unlocked = {
      for (final e in snapshot.entries)
        if (e.unlocked) e.def.id,
    };
    expect(
      unlocked,
      containsAll(<String>['firstConversion', 'tenConversions', 'batchOfFive', 'sniper']),
    );
    expect(snapshot.stats.conversions, 12);
    // Даты у них взяться неоткуда — до переезда их не хранили, и подставлять
    // выдуманную честнее не стало бы.
    expect(snapshot.entries.every((e) => e.unlockedAt == null), isTrue);
  });

  test('the next batch does not re-celebrate what was already earned', () async {
    final container = await boot({
      'ach.conversions': 12,
      'ach.maxBatch': 5,
      'ach.flags': <String>['fitToSize', 'video'],
      'ach.unlocked': <String>['firstConversion', 'tenConversions', 'batchOfFive', 'sniper'],
    });
    addTearDown(container.dispose);

    final fresh = container
        .read(achievementsProvider.notifier)
        .recordBatch([job], now: DateTime(2026, 8, 6, 12));
    expect(fresh.map((e) => e.def.id), isNot(contains('firstConversion')));
    expect(fresh.map((e) => e.def.id), isNot(contains('tenConversions')));
  });

  test('unlocks are still written by name under the key they always used',
      () async {
    final container = await boot({});
    addTearDown(container.dispose);

    final fresh = container
        .read(achievementsProvider.notifier)
        .recordBatch([job], now: DateTime(2026, 8, 6, 12));
    expect(fresh.map((e) => e.def.id), contains('firstConversion'));

    final prefs = container.read(sharedPreferencesProvider);
    expect(prefs.getStringList('ach.unlocked'), contains('firstConversion'));
    expect(prefs.getInt('ach.conversions'), 1);
    // Даты — отдельный, новый ключ: старая версия приложения его не знает и
    // спокойно проходит мимо, а список разблокированных читает как читала.
    expect(
      prefs.getStringList('ach.unlockedAt'),
      contains(startsWith('firstConversion|')),
    );
  });
}
