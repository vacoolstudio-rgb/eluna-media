import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Приёмник снимков для `flutter drive`.
///
/// Сам тест снимает кадры и называет их; сюда приходят готовые байты, и
/// единственная задача — положить их туда, где их ждёт выгрузка в магазин:
/// `docs/ASO/screenshots/<локаль>/<устройство>/<кадр>.png`. Папку задаёт тест
/// через имя, потому что о локали и устройстве знает он, а не драйвер.
Future<void> main() async {
  await integrationDriver(
    onScreenshot: (String name, List<int> bytes, [Map<String, Object?>? args]) async {
      final file = File('docs/ASO/screenshots/$name.png');
      await file.parent.create(recursive: true);
      await file.writeAsBytes(bytes);
      // ignore: avoid_print
      print('СНИМОК $name — ${bytes.length} байт');
      return true;
    },
  );
}
