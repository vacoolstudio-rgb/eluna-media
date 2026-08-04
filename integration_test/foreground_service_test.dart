import 'dart:io';

import 'package:eluna_media/services/foreground_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Verifies the Android foreground service against the real platform.
///
/// A misdeclared `foregroundServiceType`, a missing `FOREGROUND_SERVICE_*`
/// permission, or a `startForeground()` that arrives too late all raise on the
/// platform side and take the process down with them. So "these calls returned
/// and the isolate is still alive" is a meaningful assertion, not a tautology.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('starts, updates and stops without killing the process', (tester) async {
    if (!Platform.isAndroid) return;

    final service = ForegroundService();

    await service.start(title: 'Eluna Media', text: '0 of 3', progress: 0, cancelLabel: 'Stop');

    // Long enough to cross Android's 5 s startForeground() deadline: if
    // startForeground() were never called, the system would kill us here.
    await tester.runAsync(() => Future<void>.delayed(const Duration(seconds: 8)));

    await service.update(title: 'Eluna Media', text: '1 of 3', progress: 0.33);
    await service.update(title: 'Eluna Media', text: '2 of 3', progress: 0.66);

    await tester.runAsync(() => Future<void>.delayed(const Duration(seconds: 6)));

    await service.stop();
    await tester.runAsync(() => Future<void>.delayed(const Duration(seconds: 2)));

    // A restart after stop must work; the service is not a one-shot.
    await service.start(title: 'Eluna Media', text: 'again', progress: 0.5, cancelLabel: 'Stop');
    await service.stop();
  }, timeout: const Timeout(Duration(minutes: 2)));
}
