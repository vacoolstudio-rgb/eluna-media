import 'package:eluna_media/state/app_lock_controller.dart';
import 'package:eluna_shared/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Когда шторка встаёт и когда снимается.
///
/// Это единственная часть замка, которая принадлежит приложению, а не пакету, —
/// и единственная, где легко ошибиться в сторону «удобно»: пауза на возврате
/// существует потому, что системный пикер и лист «Поделиться» уводят Activity в
/// фон точно так же, как сворачивание, а конвертер ходит в них постоянно.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppLockService service;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    service = AppLockService();
  });

  /// [systemUiBackgroundsApp] задаёт платформу явно: `true` — андроидная
  /// картина мира (пикер это чужая Activity), `false` — iOS, где системные
  /// листы показываются поверх нашего же процесса.
  ProviderContainer boot({bool systemUiBackgroundsApp = true}) {
    final container = ProviderContainer(
      overrides: [
        appLockServiceProvider.overrideWithValue(service),
        appLockStateProvider.overrideWith(
          () => AppLockGate(systemUiBackgroundsApp: systemUiBackgroundsApp),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('без настроенного замка приложение не запирается вообще', () async {
    final container = boot();
    await service.isLockConfigured(); // прогрев синхронного кэша
    final gate = container.read(appLockStateProvider.notifier);

    gate.resolve(configured: false);
    expect(container.read(appLockStateProvider), AppLockState.unlocked);

    gate.paused();
    expect(container.read(appLockStateProvider), AppLockState.unlocked,
        reason: 'пауза не должна поднимать шторку тому, кто не заводил замок');
  });

  test('короткая отлучка снимает шторку сама, длинная требует кода', () async {
    await service.setPin('1234');
    await service.isLockConfigured();

    final container = boot();
    final gate = container.read(appLockStateProvider.notifier);
    gate.resolve(configured: true);
    expect(container.read(appLockStateProvider), AppLockState.locked,
        reason: 'холодный старт с настроенным замком начинается запертым');

    gate.unlock();
    final left = DateTime(2026, 8, 13, 12);
    gate.paused(now: left);
    expect(container.read(appLockStateProvider), AppLockState.locked,
        reason: 'шторка встаёт НА паузе — иначе она не попадёт в снимок для '
            'списка недавних задач');

    // Сходили в системный пикер и вернулись.
    gate.resumed(now: left.add(const Duration(seconds: 5)));
    expect(container.read(appLockStateProvider), AppLockState.unlocked);

    gate.paused(now: left);
    gate.resumed(now: left.add(AppLockGate.graceOnReturn * 2));
    expect(container.read(appLockStateProvider), AppLockState.locked,
        reason: 'настоящая отлучка обязана спросить код');
  });

  test('своя отлучка в системный интерфейс кода не требует, сколько бы ни длилась',
      () async {
    await service.setPin('1234');
    await service.isLockConfigured();

    final container = boot();
    final gate = container.read(appLockStateProvider.notifier);
    gate.resolve(configured: true);
    gate.unlock();

    // Устройство поймало это на живом человеке: выбор файла в системном пикере
    // занял 75 секунд — больше паузы, — и приложение потребовало код у того,
    // кто из него никуда не уходил.
    final opened = DateTime(2026, 8, 13, 12);
    gate.expectSystemUi(now: opened);
    gate.paused(now: opened);
    gate.resumed(now: opened.add(const Duration(minutes: 3)));
    expect(container.read(appLockStateProvider), AppLockState.unlocked);

    // И тут же следующее сворачивание — уже настоящее: отметка одноразовая.
    final left = opened.add(const Duration(minutes: 4));
    gate.paused(now: left);
    gate.resumed(now: left.add(const Duration(minutes: 1)));
    expect(container.read(appLockStateProvider), AppLockState.locked,
        reason: 'одна отлучка — одна поблажка, иначе она открывает замок навсегда');
  });

  test('возврат после холодного старта код всё равно спрашивает', () async {
    await service.setPin('1234');
    await service.isLockConfigured();

    final container = boot();
    final gate = container.read(appLockStateProvider.notifier);
    gate.resolve(configured: true);

    // Паузы не было: приложение только что запустилось. Снимать здесь шторку
    // не с чего — иначе первый же переход в другое приложение и обратно открыл
    // бы запертую очередь.
    gate.resumed(now: DateTime(2026, 8, 13, 12));
    expect(container.read(appLockStateProvider), AppLockState.locked);
  });

  // ─────────────────────────────────────────────────────────────────────────
  // iOS: паузы нет вовсе
  // ─────────────────────────────────────────────────────────────────────────

  test('на iOS короткая отлучка код всё равно требует', () async {
    // Живой баг, найденный на iPhone 13: свернул, вернулся через десять
    // секунд — пауза снимала замок ровно в тот момент, когда шторка запускала
    // Face ID. Системный лист висел поверх УЖЕ открытого приложения: очередь,
    // имена файлов и настройки были видны под ним. Замок стоял и не защищал
    // ничего.
    //
    // Паузе неоткуда взяться на iOS: пикер, лист «Поделиться» и подтверждение
    // удаления там не уводят приложение в фон, а `paused` означает буквально
    // «свернули».
    final container = boot(systemUiBackgroundsApp: false);
    await service.setPin('4321');
    await service.isLockConfigured();
    final gate = container.read(appLockStateProvider.notifier);
    gate.resolve(configured: true);
    gate.unlock();

    final left = DateTime(2026, 8, 16, 12);
    gate.paused(now: left);
    gate.resumed(now: left.add(const Duration(seconds: 5)));

    expect(container.read(appLockStateProvider), AppLockState.locked,
        reason: 'на iOS возврат из фона обязан спрашивать код');
  });

  test('на iOS своя отлучка в системный лист кода не требует', () async {
    // Обратная сторона: без паузы единственное, что отличает поход в пикер от
    // сворачивания, — отметка, которую приложение ставит само. Если сломать и
    // её, замок станет спрашивать код после каждого выбора файла.
    final container = boot(systemUiBackgroundsApp: false);
    await service.setPin('4321');
    await service.isLockConfigured();
    final gate = container.read(appLockStateProvider.notifier);
    gate.resolve(configured: true);
    gate.unlock();

    final opened = DateTime(2026, 8, 16, 12);
    gate.expectSystemUi(now: opened);
    gate.paused(now: opened);
    gate.resumed(now: opened.add(const Duration(minutes: 3)));

    expect(container.read(appLockStateProvider), AppLockState.unlocked);
  });
}
