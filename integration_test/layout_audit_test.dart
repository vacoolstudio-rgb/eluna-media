// Аудит раскладки: каждая вкладка, каждый лист и каждый диалог приложения — на
// самом узком телефоне, который Android просит поддерживать, крупным шрифтом,
// на трёх языках и с поднятой клавиатурой.
//
// Утверждений в привычном смысле здесь почти нет, и это не небрежность.
// `RenderFlex`, которому не хватило места, бросает ошибку, а flutter_test
// превращает любую пойманную ошибку в провал теста — значит, сам факт того, что
// кадр отрисовался, и есть проверка. Всё, что делает этот файл, — доводит экран
// до состояния, в котором места заведомо мало, и рисует его.
//
// Зачем понадобилось. У соседнего приложения семьи такой же аудит нашёл 54
// переполнения на 14 экранах, и половину из них — только по-русски и только
// при шрифте крупнее обычного. У Media эти состояния глазами не смотрели ни
// разу: очередь с работающей задачей, отчёт FFmpeg под карточкой, имя файла во
// всю строку — всё это появляется у пользователя, а не на скриншотах витрины.
//
// Почему integration_test, а не test/. Половина экранов спрашивает платформу
// (свободное место — у нативной стороны, миниатюры — у FFmpeg, замок — у
// хранилища ключей), и без устройства эти вызовы бросают или отдают заглушку:
// рисуется не тот экран, что у пользователя. Шрифт тоже настоящий только здесь
// — в headless-тестах Flutter подставляет Ahem, у которого все буквы одной
// ширины на всех языках, а переполняются экраны ровно от длины слова.
//
//   flutter test integration_test/layout_audit_test.dart -d <device>
//
// Телефон при этом обязан быть разбужен и разблокирован, и экран не должен
// гаснуть за время прогона. Причина не в удобстве: `tester.pump()` в живом
// режиме ждёт настоящего кадра, а погасший или закрытый шторкой экран кадров не
// рисует — прогон встаёт намертво и выглядит как зависший тест. Полчаса ушло
// ровно на это, поэтому:
//
//   adb -s <device> shell input keyevent 224            # разбудить
//   adb -s <device> shell settings put system screen_off_timeout 3600000
//   adb -s <device> shell dumpsys deviceidle disable    # без Doze
//
// Контекст здесь берётся у верхнего маршрута заново перед каждым вызовом
// (`_App.topContext`), поэтому «через await» он не переносится ни разу —
// анализатор же видит только то, что между вызовами есть await.
// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// `Override` — тип списка подмен у контейнера — из основного файла пакета не
// экспортируется, только отсюда.
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:eluna_media/core/encoders.dart';
import 'package:eluna_media/domain/app_icons.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:eluna_media/domain/quick_presets.dart';
import 'package:eluna_media/services/device_storage.dart';
import 'package:eluna_media/services/haptics.dart';
import 'package:eluna_media/state/achievements_controller.dart';
import 'package:eluna_media/state/app_lock_controller.dart';
import 'package:eluna_media/state/queue_controller.dart';
import 'package:eluna_media/state/selection_controller.dart';
import 'package:eluna_media/state/settings_controller.dart';
import 'package:eluna_media/state/storage_controller.dart';
import 'package:eluna_media/state/tips_controller.dart';
import 'package:eluna_media/ui/achievement_celebration.dart';
import 'package:eluna_media/ui/achievement_detail_sheet.dart';
import 'package:eluna_media/ui/achievements_screen.dart';
import 'package:eluna_media/ui/app.dart';
import 'package:eluna_media/ui/compare_screen.dart';
import 'package:eluna_media/ui/lock_screen.dart';
import 'package:eluna_media/ui/network_privacy_screen.dart';
import 'package:eluna_media/ui/support_screen.dart';
import 'package:eluna_media/ui/tip_screen.dart';

// ---------------------------------------------------------------------------
// Условия показа
// ---------------------------------------------------------------------------

/// 320×640 — самый узкий телефон, который Android просит поддерживать.
const _phone = Size(320, 640);

/// Маленький телефон целиком: та же ширина, но высоты на треть меньше.
///
/// 320×480 — это Android начала прошлого десятилетия и дешёвые аппараты,
/// которые до сих пор продаются. Ширину аудит и так берёт самую узкую, а вот
/// высоту — щедрую, и экран, посчитавший себя «на весь экран», на ней
/// помещается. Вкладка конвертации в расширенном режиме — одиннадцать секций
/// подряд, и ломается она именно по высоте.
const _smallPhone = Size(320, 480);

/// Тот же телефон с поднятой клавиатурой.
///
/// Клавиатуру из теста не поднять: она системная, и `viewInsets` появляются
/// только от настоящего фокуса в настоящем поле. Поэтому вьюпорту просто
/// урезается высота — для раскладки диалога это ровно то же самое: и там и там
/// содержимое считает свободной высотой то, что осталось от экрана. Диалоги
/// Media поднимают клавиатуру сами (`autofocus: true` в поле ввода), так что
/// без этого размера они проверялись бы в состоянии, которого не бывает.
const _phoneWithKeyboard = Size(320, 340);

/// Язык и масштаб шрифта.
///
/// Русский — не для полноты списка: у него заметно длиннее слова, и в соседнем
/// приложении оба найденных руками дефекта показывались именно на нём.
/// Арабский — потому что справа налево это задача раскладки, а не перевода:
/// `EdgeInsets.only(left:)` и вручную расставленный `Positioned` не зеркалятся
/// и уезжают под соседа.
///
/// Про 1.5. Столько выставляет система, но столько до содержимого НЕ доходит:
/// `ElunaApp.builder` зажимает шкалу в 0.9…1.25 на всё дерево, включая диалоги
/// и листы. То есть колонка «×1.5» здесь — это «человек попросил 1.5, а
/// приложение показало 1.25»; ровно это он и увидит. Ставить в аудите шкалу
/// выше зажима бессмысленно — она не переживёт `MediaQuery` в корне.
class _Cond {
  final String name;
  final Locale locale;
  final double scale;

  const _Cond(this.name, this.locale, this.scale);

  @override
  String toString() => name;
}

const _conditions = <_Cond>[
  _Cond('en ×1.0', Locale('en'), 1.0),
  _Cond('en ×1.5', Locale('en'), 1.5),
  _Cond('ru ×1.0', Locale('ru'), 1.0),
  _Cond('ru ×1.5', Locale('ru'), 1.5),
  _Cond('ar ×1.0', Locale('ar'), 1.0),
  _Cond('ar ×1.5', Locale('ar'), 1.5),
];

// ---------------------------------------------------------------------------
// Сбор ошибок
// ---------------------------------------------------------------------------

/// Рисует [body] и складывает всё, на что пожаловался Flutter, в [into].
///
/// Почему не дать тесту просто упасть на первой же ошибке. Аудит обязан назвать
/// все места разом: иначе следующее переполнение находится только после починки
/// предыдущего, то есть за столько заходов, сколько в приложении дефектов. На
/// время показа обработчик ошибок подменяется своим — тогда flutter_test не
/// считает пойманное провалом сразу, и решение принимает уже сам тест.
Future<void> _watch(
  String label,
  List<String> into,
  Future<void> Function() body,
) async {
  final previous = FlutterError.onError;
  final caught = <String>[];
  FlutterError.onError = (details) => caught.add(_describe(details));
  try {
    await body();
  } on Object catch (e) {
    caught.add(_shorten('$e'));
  } finally {
    FlutterError.onError = previous;
  }
  for (final message in caught) {
    into.add('  $label — $message');
  }
}

/// Что случилось и ГДЕ.
///
/// Первая строка отчёта Flutter говорит размер переполнения, но не место;
/// место лежит ниже, в справке «виновный виджет», вместе с файлом и строкой.
/// Без него отчёт аудита пришлось бы каждый раз доискивать руками.
String _describe(FlutterErrorDetails details) {
  final lines = details.toString().split('\n');
  // Первые строки отчёта — рамка «EXCEPTION CAUGHT BY…» и подпись «во время
  // раскладки»: они одинаковы у всех ошибок и места не называют.
  final summary = lines.map((l) => l.trim()).firstWhere(
        (l) => l.isNotEmpty && !l.startsWith('═') && !l.startsWith('The following'),
        orElse: () => '${details.exception}',
      );
  // Flutter пишет виновника двумя-тремя строками: имя виджета, а под ним —
  // файл и позиция. Без второй половины находка называет «Row» и ничего
  // больше, а такой Row в приложении не один.
  final marker = lines.indexWhere((l) => l.contains('error-causing widget was'));
  final where = marker < 0
      ? ''
      : ' ← ${_shorten(lines.skip(marker + 1).take(3).map((l) => l.trim()).where((l) => l.isNotEmpty && !l.startsWith('═')).join(' '), 160)}';
  return '${_shorten(summary, 140)}$where';
}

String _shorten(String message, [int limit = 240]) {
  final line = message.split('\n').first.trim();
  return line.length > limit ? '${line.substring(0, limit)}…' : line;
}

/// Виджет [T] вместе с его подклассами.
///
/// `FilledButton.icon`, `OutlinedButton.icon` и их родня строят приватный
/// ПОДКЛАСС, а `find.byType` сравнивает `runtimeType` строго и таких кнопок не
/// видит вовсе.
Finder _byKind<T extends Widget>() => find.byWidgetPredicate((w) => w is T);

// ---------------------------------------------------------------------------
// Приложение под аудитом
// ---------------------------------------------------------------------------

/// Живое приложение и всё, что тесту нужно, чтобы им управлять.
class _App {
  _App(this.tester, this.container);

  final WidgetTester tester;

  /// Контейнер провайдеров того же приложения: через него состояние доводится
  /// туда, куда пальцем не дотянуться (батч «в работе», настроенный замок).
  final ProviderContainer container;

  NavigatorState get _nav => tester.state<NavigatorState>(find.byType(Navigator).first);

  /// Контекст верхнего маршрута — из него открываются модальные окна ровно так
  /// же, как их открывает само приложение.
  BuildContext get topContext => tester.element(find.byType(Scaffold).last);

  /// Пампы вместо `pumpAndSettle`: на экранах есть бесконечные анимации
  /// (кольцо прогресса, ambient-градиент, тикер оставшегося времени в очереди —
  /// `Stream.periodic` раз в секунду), на которых `pumpAndSettle` висит до
  /// таймаута.
  Future<void> settle([int frames = 10]) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
  }

  /// Ждёт настоящего времени: первый кадр экрана и ответы платформы приходят в
  /// реальном времени, а не в пампах.
  Future<void> real([Duration d = const Duration(milliseconds: 150)]) =>
      tester.runAsync(() => Future<void>.delayed(d));

  Future<void> _breathe() async {
    await settle();
    await real();
    await settle();
  }

  Future<void> push(Widget screen) async {
    unawaited(_nav.push(MaterialPageRoute<void>(builder: (_) => screen)));
    await _breathe();
  }

  /// Переключает вкладку вызовом колбэка панели: тап требует, чтобы кнопка
  /// оказалась под пальцем, а при крупном шрифте подпись вкладки съезжает.
  Future<void> tab(int index) async {
    tester.widget<NavigationBar>(find.byType(NavigationBar)).onDestinationSelected!(index);
    await _breathe();
  }

  /// Внутренние вкладки очереди («Активные» / «Завершённые»). Тем же способом и
  /// по той же причине: подпись вкладки — это `queueActiveTab(n)`, и на 320
  /// точках она уезжает.
  Future<void> innerTab(int index) async {
    tester.widget<TabBar>(find.byType(TabBar)).controller!.animateTo(index);
    await _breathe();
  }

  /// Доводит ленивый список до строки, которую [target] находит: элемента, до
  /// которого не долистали, в дереве ещё нет.
  Future<void> reveal(Finder target) async {
    final scrollables = find.byType(Scrollable);
    if (scrollables.evaluate().isEmpty) return;
    final position = tester.state<ScrollableState>(scrollables.last).position;
    for (var i = 0; i < 40 && target.evaluate().isEmpty; i++) {
      if (position.pixels >= position.maxScrollExtent) break;
      position.jumpTo((position.pixels + 200).clamp(0.0, position.maxScrollExtent));
      await settle(2);
    }
  }

  /// Нажимает строку списка, найденную по значку слева, — вызовом её колбэка, а
  /// не тапом. Аудиту важно открыть окно, а не проверить попадание пальцем, а
  /// тап на 320 точках упирался бы в то, что строка ушла под нижнюю панель.
  Future<void> tapTile(IconData icon) async {
    final row = find.ancestor(of: find.byIcon(icon), matching: find.byType(ListTile));
    // Несколько заходов, а не один. Под баннером об аварийном завершении на
    // экране 320×480 списку настроек остаётся полсотни точек высоты, и на
    // первом кадре он не успевает построить ни одной строки: `ListView`
    // создаёт только то, что попадает в окно просмотра, а окна ещё нет. Через
    // кадр-другой баннер доезжает, высота устаканивается, и строка появляется.
    // Без этой петли аудит сообщал «строка не найдена» — то есть свою
    // собственную поспешность вместо дефекта приложения.
    for (var attempt = 0; attempt < 6 && row.evaluate().isEmpty; attempt++) {
      await real();
      await settle();
      await reveal(row);
    }
    final tile = tester.widgetList<ListTile>(row).firstWhere(
          (t) => t.onTap != null,
          orElse: () => throw StateError('строка со значком $icon не найдена'),
        );
    tile.onTap!();
    await _breathe();
  }

  /// Кнопка, узнаваемая по значку внутри неё.
  ///
  /// Порядковым номером такие не найти: на карточке завершённой задачи кнопок
  /// шесть, и часть из них появляется только у картинки или только у
  /// сохранённого файла.
  Future<void> tapButtonWithIcon(IconData icon) async {
    await reveal(find.byIcon(icon));
    final button =
        find.ancestor(of: find.byIcon(icon), matching: _byKind<ButtonStyleButton>()).first;
    tester.widget<ButtonStyleButton>(button).onPressed!();
    await _breathe();
  }

  /// Нажимает кнопку по её типу.
  ///
  /// Кнопку приходится сперва добыть: `ListView` строит лишь видимые элементы,
  /// и на 320 точках при крупном шрифте она уезжает за нижний край и не
  /// создаётся вовсе. Без прокрутки тест падал на пустом списке с «RangeError
  /// (length)» — и выглядело это как ошибка раскладки, хотя раскладка тут ни
  /// при чём.
  Future<void> tapButton<T extends ButtonStyleButton>({int at = 0}) async {
    final finder = _byKind<T>();
    var buttons = tester.widgetList<T>(finder).toList();
    for (var attempt = 0; buttons.length <= at && attempt < 6; attempt++) {
      await real();
      await settle();
      await reveal(finder);
      buttons = tester.widgetList<T>(finder).toList();
    }
    if (buttons.length <= at) {
      throw StateError('$T №$at на экране не появилась: найдено ${buttons.length}');
    }
    buttons[at].onPressed!();
    await _breathe();
  }

  /// Кнопка [T] без значка внутри.
  ///
  /// Так отличаются кнопки границ обрезки от кнопки «добавить файлы»: у первых
  /// внутри только текст, у второй — значок. Порядковым номером их не
  /// различить, и это не мелочь: `OutlinedButton.icon` начиная с Flutter 3.2x
  /// строит НЕ приватный подкласс, а сам `OutlinedButton`, поэтому строгий
  /// `find.byType` его больше не отсеивает. Аудит из-за этого двенадцать раз
  /// подряд открывал системный выборщик файлов — чужую Activity, поверх
  /// которой наше приложение перестаёт получать кадры, — и прогон вставал
  /// намертво.
  Future<void> tapButtonWithoutIcon<T extends ButtonStyleButton>() async {
    await reveal(find.byType(_Never));
    final buttons = find.byType(T);
    for (final element in buttons.evaluate()) {
      final hasIcon = find
          .descendant(of: find.byElementPredicate((e) => e == element), matching: find.byType(Icon))
          .evaluate()
          .isNotEmpty;
      final button = element.widget as T;
      if (!hasIcon && button.onPressed != null) {
        button.onPressed!();
        await _breathe();
        return;
      }
    }
    throw StateError('$T без значка на экране не найдена');
  }

  /// Последняя кнопка этого типа на экране. Так нажимается «Лицензии»: она
  /// стоит в самом низу настроек и от соседних `TextButton` отличается только
  /// местом.
  Future<void> tapLastButton<T extends ButtonStyleButton>() async {
    await reveal(find.byType(_Never));
    final buttons = tester.widgetList<T>(_byKind<T>()).where((b) => b.onPressed != null);
    buttons.last.onPressed!();
    await _breathe();
  }

  /// Главная кнопка вкладки конвертации — она не `ButtonStyleButton`, а
  /// градиентная кнопка пакета.
  Future<void> tapStart() async {
    final button = tester.widgetList<GradientButton>(find.byType(GradientButton)).last;
    button.onPressed!();
    await _breathe();
  }

  /// Последняя фишка в ряду выбора размера — та самая «Свой…», что открывает
  /// диалог ввода. Остальные фишки диалога не открывают.
  Future<void> tapLastChip() async {
    await reveal(find.byType(ChoiceChip));
    tester.widgetList<ChoiceChip>(find.byType(ChoiceChip)).last.onSelected!(true);
    await _breathe();
  }

  /// Кнопка внутри открытого диалога (кнопки действий стоят там подряд).
  Future<void> tapDialogButton<T extends ButtonStyleButton>({int at = 0}) async {
    final buttons = tester
        .widgetList<T>(find.descendant(of: find.byType(AlertDialog), matching: _byKind<T>()))
        .toList();
    buttons[at].onPressed!();
    await _breathe();
  }
}

/// Показывать ли поверх экранов баннер «в прошлый раз приложение закрылось с
/// ошибкой».
///
/// Баннер садится в тот же `ScaffoldMessenger`, что и содержимое экрана, и
/// отбирает у него высоту сверху. Экран, посчитавший свою высоту по целому
/// экрану, ломается именно здесь. Проверять этим стоит не один экран, а все:
/// посчитать высоту «на весь экран» может любой.
bool _crashBanner = false;

/// Размер поверхности для экранов: [_audit] прогоняет каждый через оба.
Size _screenSize = _phone;

/// Версия из бандла. Нужна, чтобы окно «что нового» НЕ выскакивало поверх всех
/// экранов подряд: показывается оно ровно тогда, когда `meta.lastSeenVersion`
/// не совпал с текущей версией.
String _version = '';

/// Контейнер предыдущего показа: живёт до следующего кадра, потому что дерево
/// ещё держит его провайдеры.
ProviderContainer? _previous;

/// Собирает приложение целиком — настоящее `ElunaApp`, а не его подобие: тема,
/// ambient-фон, замок и нижняя панель участвуют в раскладке наравне с
/// содержимым, и аудит без них проверял бы другое приложение.
Future<_App> _pumpApp(
  WidgetTester tester,
  _Cond cond, {
  Size? size,
  List<ConversionJob> jobs = const [],
  bool running = false,
  bool simpleMode = true,
  QuickPreset? preset,
  ConversionSettings? settings,
  int? sizeTargetBytes,
  int? photoSizeTargetBytes,
  Map<String, Object> prefs = const {},
  List<Override> overrides = const [],
}) async {
  final view = tester.view;
  final surface = size ?? _screenSize;
  view.devicePixelRatio = 1;
  view.physicalSize = surface;
  tester.platformDispatcher.textScaleFactorTestValue = cond.scale;

  // Хранилище — единственный вход в настройки приложения: язык, простой режим и
  // счётчики достижений читаются оттуда синхронно в `build()` нотифаеров.
  SharedPreferences.setMockInitialValues(<String, Object>{
    'meta.hasSeenIntro': true,
    'meta.lastSeenVersion': _version,
    'app.locale': cond.locale.languageCode,
    'app.simpleMode': simpleMode,
    ...prefs,
  });
  final store = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(store),
      // Очередь засевается подменённым `build()`, а не «добавь файлы»: настоящий
      // `addFiles` идёт в системный выборщик и спрашивает у FFmpeg длительность,
      // а состояние «батч в работе» вообще недостижимо иначе как запуском
      // конвертации.
      queueProvider.overrideWith(() => _SeededQueue(jobs, running: running)),
      // Наличие энкодеров спрашивается у FFmpeg и отвечается секундами. Здесь
      // ответ «есть всё»: это худший случай для раскладки — на ряд форматов
      // приходится больше фишек, чем при любом другом ответе.
      av1AvailableProvider.overrideWith((ref) async => true),
      animatedWebpAvailableProvider.overrideWith((ref) async => true),
      // Магазин, который отвечает, — иначе экран чаевых честно показывает
      // «покупать нечего», и раскладки трёх карточек аудит не увидит.
      tipsControllerProvider.overrideWith((ref) {
        final controller = TipsController(const _FakeStore())..init();
        ref.onDispose(controller.dispose);
        return controller;
      }),
      ...overrides,
    ],
  );

  // Замок отвечает до первого кадра — иначе поверх всего дерева лежит
  // непрозрачная шторка «проверяем», и аудит рисует пустой прямоугольник.
  container.read(appLockStateProvider.notifier).resolve(configured: false);
  if (settings != null) container.read(settingsProvider.notifier).update(settings);
  if (preset != null) container.read(selectedPresetProvider.notifier).select(preset);
  if (sizeTargetBytes != null) {
    container.read(sizeTargetProvider.notifier).set(sizeTargetBytes);
  }
  if (photoSizeTargetBytes != null) {
    container.read(photoSizeTargetProvider.notifier).set(photoSizeTargetBytes);
  }

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      // Свежий ключ на каждый показ: иначе Flutter переиспользует прежнее
      // состояние экранов, и вторая локаль рисуется поверх раскладки первой.
      child: KeyedSubtree(
        key: ValueKey('audit-${cond.name}-${surface.height}-'
            '${DateTime.now().microsecondsSinceEpoch}'),
        child: const ElunaApp(),
      ),
    ),
  );

  _previous?.dispose();
  _previous = container;

  final app = _App(tester, container);
  await app.settle();
  await app.real();
  await app.settle();
  if (_crashBanner) {
    // Баннер приходит из постфреймового колбэка, который сначала читает файл
    // отчёта с диска, — без настоящей паузы кадр успевает нарисоваться без него.
    await app.real(const Duration(milliseconds: 400));
    await app.settle();
  }
  return app;
}

// ---------------------------------------------------------------------------
// Подставные объекты
// ---------------------------------------------------------------------------

/// Очередь с заранее набранным содержимым.
///
/// Подменён только `build()` — всё остальное поведение настоящее. Кроме
/// `start()`: аудит не конвертирует. Без этой заглушки диалоги «мало места» и
/// «мало заряда», которые как раз и проверяются нажатием «Конвертировать»,
/// после подтверждения запускали бы FFmpeg на телефоне разработчика.
class _SeededQueue extends QueueController {
  _SeededQueue(this.seed, {this.running = false});

  final List<ConversionJob> seed;
  final bool running;

  @override
  QueueState build() => QueueState(jobs: seed, isRunning: running);

  @override
  Future<void> start(QueueStrings strings) async {}
}

/// Замок, о котором хранилище говорит «настроен»: у строки пин-кода тогда
/// другая подпись, а нажатие открывает лист с двумя вариантами вместо экрана
/// создания кода. Настоящий сервис читает `SharedPreferences`, и подменить его
/// значением нельзя — только ответами.
class _ConfiguredLock extends AppLockService {
  @override
  Future<bool> isPinSet() async => true;

  @override
  Future<bool> isBiometricEnabled() async => true;

  @override
  Future<bool> isLockConfigured() async => true;
}

/// Свободное место на диске, назначенное тестом. Настоящее спрашивается у
/// нативной стороны, и на телефоне с полтерабайтом свободного места диалог
/// «мало места» не показать никак.
class _FreeSpace extends DeviceStorage {
  const _FreeSpace(this.value);

  final int? value;

  @override
  Future<int?> freeBytes() async => value;
}

/// Магазин чаевых, который отвечает. Цены и названия те же, что заведены в
/// консоли, — рисует их настоящий экран пакета.
class _FakeStore implements ElunaPurchaseAdapter {
  const _FakeStore();

  @override
  Future<bool> isAvailable() async => true;

  @override
  Future<List<ElunaTipProduct>> queryProducts(Set<String> ids) async => const [
        ElunaTipProduct(
          id: kTipCoffee,
          title: 'Coffee',
          description: 'A small thank-you',
          price: r'$1.99',
        ),
        ElunaTipProduct(
          id: kTipSnack,
          title: 'Snack',
          description: 'A bigger thank-you',
          price: r'$4.99',
        ),
        ElunaTipProduct(
          id: kTipGenerous,
          title: 'Generous Tip',
          description: 'A generous thank-you',
          price: r'$9.99',
        ),
      ];

  @override
  Future<ElunaPurchaseResult> buy(String productId) async =>
      throw UnsupportedError('аудит ничего не покупает');
}

// ---------------------------------------------------------------------------
// Данные
// ---------------------------------------------------------------------------

/// Пути нарочно несуществующие.
///
/// Кэш миниатюр первым делом проверяет, есть ли файл, и для отсутствующего
/// сразу отдаёт запасной значок — то есть ровно тот виджет, который и участвует
/// в раскладке. Настоящие файлы стоили бы по сессии FFmpeg на строку на каждый
/// из сотен показов и ничего бы к проверке не добавили.
String _path(String name) => '/data/audit/$name';

/// Имя, которого не бывает, — но именно такое и приходит с камеры, из
/// мессенджера и из папки «Загрузки» после третьего скачивания подряд.
const _longName =
    'VID_20260816_183045_SUPER_SLOW_MOTION_PANORAMA_backup(2)_окончательный_вариант.mov';

final _mp4 = ConversionSettings.defaultsFor(ContainerFormat.mp4);

ConversionJob _job(
  String id,
  String name, {
  JobStatus status = JobStatus.queued,
  double progress = 0,
  int mb = 48,
  int? durationMs = 90 * 1000,
  ContainerFormat to = ContainerFormat.mp4,
  String? error,
  JobFailure? failure,
  int outMb = 0,
  SavedTo? savedTo,
  String? outputName,
  int? startedAtMs,
}) =>
    ConversionJob(
      id: id,
      inputPath: _path(name),
      inputName: name,
      settings: ConversionSettings.defaultsFor(to),
      status: status,
      progress: progress,
      inputBytes: mb * 1000 * 1000,
      outputBytes: outMb * 1000 * 1000,
      sourceDurationMs: durationMs,
      outputPath: status == JobStatus.completed ? _path('out_$id.${to.extension}') : null,
      errorMessage: error,
      failure: failure,
      savedTo: savedTo,
      outputName: outputName,
      startedAtMs: startedAtMs,
    );

/// Обычная очередь на конвертацию: три видео, одно из них с именем во всю
/// строку.
List<ConversionJob> _pendingVideos() => [
      _job('a', 'VID_20260816_183045.mov'),
      _job('b', _longName, mb: 1240, durationMs: 3 * 3600 * 1000),
      _job('c', 'Отпуск в Карелии, день третий.mkv', mb: 320),
    ];

/// Разнородный выбор — вкладка показывает предупреждение «файлы разного типа».
List<ConversionJob> _mixedPending() => [
      _job('v', 'VID_20260816_183045.mov'),
      _job('i', 'IMG_4417.HEIC', mb: 4, durationMs: null, to: ContainerFormat.jpg),
      _job('s', 'Интервью с оператором, часть вторая.wav',
          mb: 62, durationMs: 45 * 60 * 1000, to: ContainerFormat.mp3),
    ];

List<ConversionJob> _pendingPhotos() => [
      _job('p1', 'IMG_4417.HEIC', mb: 4, durationMs: null, to: ContainerFormat.jpg),
      _job('p2', _longName.replaceAll('.mov', '.HEIC'),
          mb: 9, durationMs: null, to: ContainerFormat.jpg),
    ];

/// Одна работающая задача с честным остатком времени.
///
/// Прогресс и время старта подобраны так, чтобы `estimatedRemaining` дал больше
/// часа: у оценки две формы записи, «m:ss» и «1 ч 12 м», и переполняет строку
/// именно вторая.
ConversionJob _runningJob() => _job(
      'run',
      _longName,
      status: JobStatus.running,
      progress: 0.08,
      mb: 1240,
      durationMs: 3 * 3600 * 1000,
      startedAtMs: DateTime.now().millisecondsSinceEpoch - 6 * 60 * 1000,
    );

/// Всё, чем заканчивается работа: успех с сохранением в галерею, успех с
/// переименованием, отказ FFmpeg целой строкой лога и отменённая задача.
List<ConversionJob> _finishedJobs() => [
      _job(
        'ok',
        'VID_20260816_183045.mov',
        status: JobStatus.completed,
        mb: 48,
        outMb: 9,
        savedTo: SavedTo.gallery,
      ),
      _job(
        'ok2',
        _longName,
        status: JobStatus.completed,
        mb: 1240,
        outMb: 1290,
        outputName: 'Свадьба Кати и Миши, финальный монтаж без цветокоррекции',
        savedTo: SavedTo.downloads,
      ),
      _job(
        'bad',
        'Интервью с оператором, часть вторая.wav',
        status: JobStatus.failed,
        mb: 62,
        to: ContainerFormat.mp3,
        failure: JobFailure.ffmpeg,
        // Настоящая последняя строка лога, а не одно слово: именно её карточка
        // показывает под именем файла, и она не переведена ни на один язык.
        error: 'Error while filtering: Cannot allocate memory — '
            '[libmp3lame @ 0x7b2c1f] Queue input is backward in time; '
            'conversion failed at 00:41:12.480',
      ),
      _job('stop', 'Отпуск в Карелии, день третий.mkv', status: JobStatus.cancelled, mb: 320),
    ];

// ---------------------------------------------------------------------------
// Прогон
// ---------------------------------------------------------------------------

/// Показывает [render] во всех [conditions] и падает один раз — списком всего,
/// что переполнилось или бросило.
Future<void> _audit(
  WidgetTester tester,
  Future<void> Function(_Cond cond) render, {
  List<Size> sizes = const [_phone, _smallPhone],
}) async {
  final problems = <String>[];
  for (final size in sizes) {
    _screenSize = size;
    for (final cond in _conditions) {
      await _watch(
        '${cond.name} @${size.width.toInt()}×${size.height.toInt()}',
        problems,
        () => render(cond),
      );
    }
  }
  _screenSize = _phone;
  expect(problems, isEmpty, reason: 'раскладка не выдержала:\n${problems.join('\n')}');
}

/// Диалоги с полем ввода показываются ещё и на экране, у которого клавиатура
/// отобрала нижнюю половину.
const _withKeyboard = [_phone, _phoneWithKeyboard];

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Личность приложения для общих компонентов: без неё экран поддержки, банк
    // чаевых и лист «наши приложения» бросают на первом же обращении к
    // `Eluna.config`.
    Eluna.configure(const ElunaAppConfig(
      appName: 'Eluna Media',
      packageId: 'com.eluna.media',
      supportEmail: 'support@eluna-apps.com',
      websiteUrl: 'https://eluna-apps.com',
      appIcons: kAppIcons,
      defaultAppIconId: kDefaultAppIconId,
      tipProductIds: kTipProductIds,
      notificationSmallIcon: '@mipmap/ic_launcher',
    ));
    await ElunaThemeController.instance.load();
    _version = await ElunaVersion.name();

    // Отчёт о падении, оставшийся на телефоне от настоящего запуска, лёг бы
    // баннером поверх всех экранов подряд — и аудит проверял бы не то, что
    // собирался. Свою папку каждый тест наполняет сам.
    final crashDir = await Directory.systemTemp.createTemp('audit_crash');
    CrashLog.directory = () async => crashDir;
    await CrashLog.clear();
  });

  // -------------------------------------------------------------------------
  // Экраны
  // -------------------------------------------------------------------------

  // Каждый экран проверяется дважды: сам по себе и под баннером об аварийном
  // завершении. Баннер отбирает высоту сверху у того же экрана, и тот, кто
  // посчитал высоту по целому экрану, ломается только с ним.
  for (final underCrash in [false, true]) {
    group(underCrash ? 'экраны под отчётом о падении' : 'экраны', () {
      setUp(() async {
        _crashBanner = underCrash;
        if (underCrash) {
          await CrashLog.record(
            StateError('аудит раскладки'),
            StackTrace.current,
            context: 'layout audit',
          );
        }
      });
      tearDown(() async {
        _crashBanner = false;
        await CrashLog.clear();
      });

      testWidgets('конвертация: пустая очередь', (tester) async {
        await _audit(tester, (cond) async {
          await _pumpApp(tester, cond);
        });
      });

      testWidgets('конвертация: файлы в очереди', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond, jobs: _pendingVideos());
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: разнородный выбор', (tester) async {
        // Появляется предупреждение о смешанном выборе — лишний блок между
        // списком файлов и кнопками.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond, jobs: _mixedPending());
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: склейка по порядку', (tester) async {
        // Худший случай строки файла: к имени добавляются две кнопки
        // перестановки, и на длинном имени они отбирают у него ширину. Плюс
        // предупреждение «нужно хотя бы два файла».
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: [_job('m', _longName, mb: 1240, durationMs: 3 * 3600 * 1000)],
            preset: QuickPreset.mergeVideos,
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: точный размер видео, цель недостижима', (tester) async {
        // Под оценкой размера дописывается строка красным — тот самый случай,
        // когда содержимое посчитано, а потом снизу вырастает ещё одна строка.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _pendingVideos(),
            preset: QuickPreset.fitToSize,
            sizeTargetBytes: 1000 * 1000,
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: точный размер фото', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _pendingPhotos(),
            preset: QuickPreset.fitPhotoToSize,
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: расширенный режим, видео', (tester) async {
        // Одиннадцать секций подряд: контейнер, видео, звук, преобразования,
        // обрезка, приватность. Самая длинная страница приложения.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _pendingVideos(),
            simpleMode: false,
            settings: _mp4,
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: расширенный, размер и обрезка', (tester) async {
        // Обрезка включается только когда в очереди ровно один файл с известной
        // длительностью; тогда появляются ползунок диапазона и две кнопки с
        // временными метками.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: [_job('single', _longName, mb: 1240, durationMs: 3 * 3600 * 1000)],
            simpleMode: false,
            settings: _mp4.copyWith(
              rateControl: RateControl.size,
              trim: const TrimRange(startMs: 61200, endMs: 3 * 3600 * 1000 - 1),
            ),
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: расширенный, звук', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _mixedPending(),
            simpleMode: false,
            settings: ConversionSettings.defaultsFor(ContainerFormat.mp3),
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('конвертация: расширенный, изображение', (tester) async {
        // Здесь ещё и блок «улучшить»: у него подпись меняется на длинную,
        // когда включено уменьшение, — и высота строки растёт.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _pendingPhotos(),
            simpleMode: false,
            settings: ConversionSettings.defaultsFor(ContainerFormat.jpg)
                .copyWith(resolution: ResolutionPreset.p720, sharpen: EnhanceLevel.strong),
          );
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('очередь: пусто', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.tab(1);
        });
      });

      testWidgets('очередь: батч в работе', (tester) async {
        // Шапка батча с кольцом прогресса и остатком времени плюс карточка
        // работающей задачи со своим кольцом и своей строкой остатка.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: [_runningJob(), ..._pendingVideos()],
            running: true,
          );
          await app.tab(1);
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('очередь: завершённые', (tester) async {
        // Успех, отказ FFmpeg целой строкой лога и отмена — вместе. У успешной
        // карточки шесть кнопок действий, и на 320 точках они переносятся в три
        // ряда.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond, jobs: _finishedJobs());
          await app.tab(1);
          await app.innerTab(1);
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('настройки', (tester) async {
        // Хранилище отвечает большим числом: тогда у строки длинный заголовок и
        // рядом появляется кнопка очистки, которой при пустой папке нет.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            prefs: const {'meta.reclaimedBytes': 12884901888},
            overrides: [
              storageUsageProvider.overrideWith(
                (ref) async => (files: 128, bytes: 999900000000),
              ),
            ],
          );
          await app.tab(2);
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('настройки: замок настроен', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            overrides: [appLockServiceProvider.overrideWithValue(_ConfiguredLock())],
          );
          await app.tab(2);
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('достижения', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond, prefs: const {
            'ach.conversions': 137,
            'ach.bytesSaved': 42949672960,
            'ach.maxBatch': 24,
            'ach.unlocked': <String>[],
          });
          await app.push(const AchievementsScreen());
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('приветственный экран', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond, prefs: const {'meta.hasSeenIntro': false});
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('сеть и приватность', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.push(const NetworkPrivacyScreen());
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('чаевые', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.push(const TipScreen());
          await app.real(const Duration(milliseconds: 400));
          await app.settle();
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('обратная связь с отчётом о падении', (tester) async {
        // Отчёт попадает в поле описания целиком — самое длинное содержимое,
        // какое этот экран вообще показывает.
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.push(SupportScreen(
            crashReport: CrashLog.compose(
              StateError('аудит раскладки'),
              StackTrace.current,
              context: 'layout audit',
            ),
          ));
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('сравнение до и после', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.push(CompareScreen(
            title: _longName.replaceAll('.mov', '.HEIC'),
            beforePath: _path('before.heic'),
            afterPath: _path('after.jpg'),
            beforeBytes: 9 * 1000 * 1000,
            afterBytes: 1400 * 1000,
          ));
        });
      });

      testWidgets('экран замка', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            overrides: [appLockServiceProvider.overrideWithValue(_ConfiguredLock())],
          );
          await app.push(const LockScreen());
        });
      });

      testWidgets('оформление', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.tab(2);
          await app.tapTile(Icons.palette_outlined);
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('язык', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.tab(2);
          await app.tapTile(Icons.translate);
          await app.reveal(find.byType(_Never));
        });
      });

      testWidgets('лицензии', (tester) async {
        await _audit(tester, (cond) async {
          final app = await _pumpApp(tester, cond);
          await app.tab(2);
          await app.tapLastButton<TextButton>();
          await app.reveal(find.byType(_Never));
        });
      });
    });
  }

  // -------------------------------------------------------------------------
  // Листы
  // -------------------------------------------------------------------------

  group('листы', () {
    testWidgets('подробности задачи с ошибкой', (tester) async {
      // Единственное место, где отчёт FFmpeg виден целиком, а не двумя
      // строками с многоточием, — и под ним ещё список всех настроек задачи.
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond, jobs: _finishedJobs());
        await app.tab(1);
        await app.innerTab(1);
        await app.tapButtonWithIcon(Icons.info_outline);
      });
    });

    testWidgets('достижение крупно', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond, prefs: const {
          'ach.conversions': 137,
          'ach.bytesSaved': 42949672960,
        });
        final entries = app.container.read(achievementsProvider).entries;
        unawaited(showAchievementDetail(
          app.topContext,
          entries.last,
          summary: '7 / ${entries.length}',
        ));
        await app.settle();
        await app.real();
        await app.settle();
      });
    });

    testWidgets('наши приложения', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond);
        await app.tab(2);
        await app.tapTile(Icons.apps_rounded);
      });
    });

    testWidgets('удалить все мои данные', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond);
        await app.tab(2);
        await app.tapTile(Icons.delete_forever_outlined);
      });
    });

    testWidgets('варианты пин-кода', (tester) async {
      // Лист с «сменить код» и «убрать код» открывается только когда код уже
      // заведён; без настроенного замка та же строка ведёт на экран создания.
      await _audit(tester, (cond) async {
        final app = await _pumpApp(
          tester,
          cond,
          overrides: [appLockServiceProvider.overrideWithValue(_ConfiguredLock())],
        );
        await app.tab(2);
        await app.tapTile(Icons.lock_outline);
      });
    });
  });

  // -------------------------------------------------------------------------
  // Диалоги
  // -------------------------------------------------------------------------

  group('диалоги', () {
    testWidgets('что нового', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond, prefs: const {
          // Версия, которой у этой сборки быть не может, плюс непустой счётчик:
          // окно показывается только тому, кто уже чем-то пользовался.
          'meta.lastSeenVersion': '0.0.1',
          'meta.successfulConversions': 12,
        });
        await app.real(const Duration(milliseconds: 400));
        await app.settle();
        expect(find.byType(AlertDialog), findsOneWidget);
      });
    });

    testWidgets('переименование результата', (tester) async {
      await _audit(
        tester,
        (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: [_job('q', _longName, mb: 1240)],
          );
          await app.tab(1);
          await app.tapButtonWithIcon(Icons.drive_file_rename_outline);
        },
        sizes: _withKeyboard,
      );
    });

    testWidgets('размер видео вручную', (tester) async {
      await _audit(
        tester,
        (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _pendingVideos(),
            preset: QuickPreset.fitToSize,
          );
          await app.tapLastChip();
        },
        sizes: _withKeyboard,
      );
    });

    testWidgets('размер фото вручную', (tester) async {
      await _audit(
        tester,
        (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: _pendingPhotos(),
            preset: QuickPreset.fitPhotoToSize,
          );
          await app.tapLastChip();
        },
        sizes: _withKeyboard,
      );
    });

    testWidgets('границы обрезки', (tester) async {
      // Самый высокий из диалогов ввода: под полем стоят и подсказка, и строка
      // «всего 3:00:00», и поле поднимает клавиатуру само.
      await _audit(
        tester,
        (cond) async {
          final app = await _pumpApp(
            tester,
            cond,
            jobs: [_job('single', _longName, mb: 1240, durationMs: 3 * 3600 * 1000)],
            simpleMode: false,
            settings: _mp4.copyWith(
              trim: const TrimRange(startMs: 61200, endMs: 3 * 3600 * 1000 - 1),
            ),
          );
          // Кнопка без значка: с ним — «добавить файлы», и она открыла бы
          // системный выборщик вместо диалога.
          await app.tapButtonWithoutIcon<OutlinedButton>();
        },
        sizes: _withKeyboard,
      );
    });

    testWidgets('мало места на диске', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(
          tester,
          cond,
          jobs: _pendingVideos(),
          overrides: [deviceStorageProvider.overrideWithValue(const _FreeSpace(2000000))],
        );
        await app.tapStart();
        expect(find.byType(AlertDialog), findsOneWidget);
      });
    });

    testWidgets('мало заряда', (tester) async {
      // Заряд спрашивается у battery_plus по каналу платформы, провайдера у
      // него нет — поэтому подменяется сам канал. Место при этом должно
      // хватить: проверка свободного места идёт первой и иначе перекрыла бы
      // этот диалог своим.
      const battery = MethodChannel('dev.fluttercommunity.plus/battery');
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(battery, (call) async {
        return switch (call.method) {
          'getBatteryLevel' => 4,
          'getBatteryState' => 'discharging',
          _ => null,
        };
      });
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(battery, null),
      );

      await _audit(tester, (cond) async {
        final app = await _pumpApp(
          tester,
          cond,
          jobs: _pendingVideos(),
          overrides: [deviceStorageProvider.overrideWithValue(const _FreeSpace(null))],
        );
        await app.tapStart();
        expect(find.byType(AlertDialog), findsOneWidget);
      });
    });

    testWidgets('очистка хранилища', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(
          tester,
          cond,
          overrides: [
            storageUsageProvider.overrideWith(
              (ref) async => (files: 128, bytes: 999900000000),
            ),
          ],
        );
        await app.tab(2);
        await app.tapButtonWithIcon(Icons.delete_sweep_outlined);
        expect(find.byType(AlertDialog), findsOneWidget);
      });
    });

    testWidgets('празднование награды', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond, prefs: const {
          'ach.conversions': 137,
          'ach.bytesSaved': 42949672960,
        });
        final entries = app.container.read(achievementsProvider).entries;
        unawaited(showAchievementCelebration(
          app.topContext,
          entries.first,
          haptics: app.container.read(hapticsProvider),
          lock: app.container.read(appLockStateProvider.notifier),
        ));
        await app.settle();
        await app.real();
        await app.settle();
      });
    });

    testWidgets('оценка приложения', (tester) async {
      await _audit(tester, (cond) async {
        final app = await _pumpApp(tester, cond);
        unawaited(showElunaRateAppModal(app.topContext));
        await app.settle();
        await app.real();
        await app.settle();
      });
    });
  });
}

/// Заведомо ненаходимый тип: `reveal` с ним просто доводит список до конца.
///
/// Прокрутка до упора — часть проверки, а не подготовка к ней: переполняется
/// обычно не первая карточка, а та, до которой на 320 точках надо долистать.
class _Never extends StatelessWidget {
  const _Never();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
