import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/platform/eluna_adapters.dart';
import '../state/settings_controller.dart';

/// Экран обратной связи — общий из пакета; здесь только то, чего пакет знать не
/// может: чем отправлять письмо и что дописать в диагностику.
///
/// Это единственное место, откуда отчёт о падении вообще может куда-то уйти, и
/// уходит он только так: полный текст лежит в поле описания, пользователь его
/// читает и правит, а отправляет своим почтовым клиентом. Ни сборщика крашей,
/// ни загрузки — у релизной сборки Media нет даже разрешения INTERNET.
///
/// Скриншоты не прикладываются ([ElunaSupportScreen.files] = null): для этого
/// нужен пикер изображений, то есть ещё один плагин ради строки в письме.
class SupportScreen extends ConsumerWidget {
  /// Отчёт о падении, если пользователь пришёл сюда из баннера «в прошлый раз
  /// приложение закрылось с ошибкой».
  final String? crashReport;

  const SupportScreen({super.key, this.crashReport});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(appPrefsProvider);

    return ElunaSupportScreen(
      crashReport: crashReport,
      mail: const MediaMailAdapter(),
      languageCode: prefs.localeCode,
      diagnostics: () async => _diagnostics(),
    );
  }

  /// Строки, которых нет ни у кого, кроме Media. ОС, версию приложения, язык и
  /// сам краш-лог общий экран собирает сам.
  ///
  /// Ни одного имени файла и ни одного пути: содержимое очереди — это список
  /// того, что человек конвертировал, и в письме ему делать нечего. Тема
  /// читается у общего контроллера, а не у настроек приложения: настройки её
  /// больше не хранят, и отчёт с устаревшим значением хуже отчёта без него.
  List<String> _diagnostics() {
    final appearance = ElunaThemeController.instance;
    return [
      'Theme: ${appearance.mode.name}'
          '${appearance.pureBlack ? ' (OLED)' : ''}'
          '${appearance.dynamicColor ? ' (dynamic)' : ''}',
    ];
  }
}
