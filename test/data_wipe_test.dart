import 'package:eluna_shared/core.dart';

import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/services/notification_service.dart';
import 'package:eluna_media/state/app_meta_controller.dart';
import 'package:eluna_media/state/data_erasers.dart';
import 'package:eluna_media/state/queue_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Две вещи, которые ломаются молча и которые можно проверить без устройства:
/// список стирателей и правило показа «что нового».
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('data erasers', () {
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    ProviderContainer boot() => ProviderContainer(
          overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        );

    List<ElunaEraser> erasersOf(ProviderContainer container) => mediaDataErasers(
          container: container,
          notifications: NotificationService.create(),
        );

    test('every store Media keeps is registered, queue first', () {
      final container = boot();
      addTearDown(container.dispose);

      // Порядок значим: очередь отменяет пакет до того, как следующий стиратель
      // начнёт удалять файлы, в которые FFmpeg ещё пишет.
      expect(
        erasersOf(container).map((e) => e.name).toList(),
        [
          'conversion queue',
          'converted files',
          'preview thumbnails',
          'shared file copies',
          'notifications',
          // Пин-код и биометрия. Последними намеренно: они ничего не держат и
          // ни во что не пишут, а стирание, начатое с замка, оставило бы
          // приложение открытым на всё время уборки.
          'app lock',
        ],
        reason: 'новое хранилище должно попасть в этот список, '
            'иначе «удалить все мои данные» станет неправдой',
      );
    });

    test('building the list touches no provider', () {
      final container = boot();
      addTearDown(container.dispose);

      erasersOf(container);

      // Если бы `container.read` стоял снаружи замыкания, регистрация в `main`
      // поднимала бы очередь до первого кадра — вместе с разбором сохранённого
      // состояния и подметанием папки вывода.
      expect(container.exists(queueProvider), isFalse);
    });

    test('the queue eraser empties both the list and the stored copy', () async {
      final job = ConversionJob(
        id: 'job_1',
        inputPath: '/tmp/a.mov',
        inputName: 'a.mov',
        settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
      );
      SharedPreferences.setMockInitialValues({
        'queue.v1': QueueStorage.encode([job]),
      });
      prefs = await SharedPreferences.getInstance();

      final container = boot();
      addTearDown(container.dispose);
      expect(container.read(queueProvider).jobs, hasLength(1));

      await erasersOf(container)
          .firstWhere((e) => e.name == 'conversion queue')
          .erase();

      expect(container.read(queueProvider).jobs, isEmpty);
      expect(QueueStorage.decode(prefs.getString('queue.v1')).jobs, isEmpty);
    });
  });

  group("what's-new gate", () {
    const version = '0.4.0';

    AppMeta meta({String? seen, int conversions = 0}) => AppMeta(
          firstLaunchAtMs: 0,
          lastSeenVersion: seen,
          successfulConversions: conversions,
        );

    test('the version already stored by the old constant shows nothing', () {
      // Ровно та строка, которую писала прежняя `kAppVersion`.
      // `ElunaVersion.name()` возвращает её же — без номера сборки, — поэтому
      // переезд на пакет не показывает окно новинок повторно никому.
      final m = meta(seen: version, conversions: 12);
      expect(WhatsNewGate.shouldShow(m, version), isFalse);
      expect(WhatsNewGate.shouldMark(m, version), isFalse);
    });

    test('a build number would have re-shown it — hence name(), not full()', () {
      // Что было бы при `full()`: та же версия, другая сборка — и окно заново.
      final m = meta(seen: version, conversions: 12);
      expect(WhatsNewGate.shouldShow(m, '$version (3)'), isTrue);
    });

    test('an existing user upgrading sees it once', () {
      final m = meta(seen: '0.3.0', conversions: 4);
      expect(WhatsNewGate.shouldShow(m, version), isTrue);
      expect(WhatsNewGate.shouldMark(m, version), isTrue);
    });

    test('a fresh install is stamped silently, not shown a popup', () {
      final m = meta();
      expect(WhatsNewGate.shouldShow(m, version), isFalse);
      expect(WhatsNewGate.shouldMark(m, version), isTrue);
    });

    test('an install that predates the dialog but has been used does see it', () {
      final m = meta(conversions: 7);
      expect(WhatsNewGate.shouldShow(m, version), isTrue);
    });

    test('an unknown version neither shows nor stamps', () {
      // Хост без метаданных бандла: `ElunaVersion.name()` отдаёт пустую строку.
      // Записать её в «уже видел» значило бы не показать окно уже никогда.
      final m = meta(conversions: 9);
      expect(WhatsNewGate.shouldShow(m, ''), isFalse);
      expect(WhatsNewGate.shouldMark(m, ''), isFalse);
    });
  });
}
