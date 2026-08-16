import 'package:eluna_media/ui/widgets/adaptive_content.dart';
import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Два решения, на которых держится планшетная вёрстка, и оба легко испортить
/// незаметно: экраны в тестах не смотрят, а на телефоне обе поломки невидимы.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpAt(WidgetTester tester, Size logical, Widget child) async {
    final view = tester.view;
    view.devicePixelRatio = 1;
    view.physicalSize = logical;
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: child)));
    await tester.pumpAndSettle();
  }

  // iPad Pro 13" в портрете, айфон, и он же положенный набок.
  const tablet = Size(1032, 1376);
  const phone = Size(400, 800);
  const phoneLandscape = Size(900, 400);

  group('предел ширины', () {
    testWidgets('на планшете колонка не шире формы', (tester) async {
      await pumpAt(tester, tablet,
          const AdaptiveContent(child: SizedBox.expand(key: ValueKey('body'))));

      expect(tester.getSize(find.byKey(const ValueKey('body'))).width,
          AdaptiveContent.formMaxWidth,
          reason: 'колонка растянулась шире, чем читается');
    });

    testWidgets('на телефоне предел не вмешивается', (tester) async {
      await pumpAt(tester, phone,
          const AdaptiveContent(child: SizedBox.expand(key: ValueKey('body'))));

      // Ровно ширина экрана: телефон обязан остаться таким, каким был, иначе
      // «планшетная» правка тихо переверстала основную платформу.
      expect(tester.getSize(find.byKey(const ValueKey('body'))).width, phone.width);
    });

    testWidgets('колонка стоит по центру, а не у края', (tester) async {
      await pumpAt(tester, tablet,
          const AdaptiveContent(child: SizedBox.expand(key: ValueKey('body'))));

      final box = tester.getRect(find.byKey(const ValueKey('body')));
      expect(box.left, closeTo((tablet.width - AdaptiveContent.formMaxWidth) / 2, 0.5));
    });
  });

  group('размерный класс решает форму оболочки', () {
    /// Читает класс изнутри дерева — то же самое делает `HomeShell`, выбирая
    /// между рейкой и нижней панелью.
    Future<WindowSizeClass> classAt(WidgetTester tester, Size size) async {
      late WindowSizeClass seen;
      await pumpAt(
        tester,
        size,
        Builder(builder: (context) {
          seen = context.sizeClass;
          return const SizedBox();
        }),
      );
      return seen;
    }

    testWidgets('телефон набок остаётся телефоном', (tester) async {
      // Ради этого случая порог и переехал с ширины на короткую сторону.
      // Прежнее правило («ширина ≥ 720») выдавало положенному набок телефону
      // планшетную рейку: 900 точек ширины при 400 высоты — поверхность
      // телефонная, а оболочка получалась чужая.
      expect(await classAt(tester, phoneLandscape), WindowSizeClass.compact);
    });

    testWidgets('телефон стоймя — тоже', (tester) async {
      expect(await classAt(tester, phone), WindowSizeClass.compact);
    });

    testWidgets('планшет — не телефон', (tester) async {
      expect(await classAt(tester, tablet), isNot(WindowSizeClass.compact));
    });
  });
}
