import 'dart:io';

import 'package:eluna_shared/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/app_icons.dart';

/// Меняет иконку приложения на рабочем столе.
///
/// Возвращает `false`, а не бросает: экран выбора помечает плитку выбранной
/// только после того, как платформа согласилась, и галочка рядом с иконкой,
/// которой на рабочем столе нет, — это ложь, которую видно.
///
/// Android переключает `<activity-alias>`; iOS зовёт
/// `setAlternateIconName`. Ни там, ни там результат не мгновенный: лаунчеру
/// нужно время, чтобы перерисовать, и в тексте экрана это сказано прямо.
class AppIconService {
  const AppIconService();

  static const _channel = MethodChannel('eluna/share_intake');

  Future<bool> apply(ElunaAppIcon icon) async {
    if (!Platform.isAndroid && !Platform.isIOS) return false;
    try {
      final ok = await _channel.invokeMethod<bool>('setAppIcon', {
        'alias': icon.alias,
        // iOS адресует альтернативную иконку именем набора, а «вернуть
        // стандартную» — это null, а не имя. Отдаём обе формы, чтобы у
        // платформы не было причин угадывать.
        'iosName': icon.id == kDefaultAppIconId ? null : 'AppIcon-${icon.id}',
      });
      return ok ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      // Хост-тесты и десктоп: канала нет, менять нечего.
      return false;
    }
  }

  /// Псевдоним, который платформа держит включённым прямо сейчас.
  ///
  /// Не то же самое, что сохранённый выбор: сохранённое — намерение, а это
  /// факт. Расхождение и есть тот случай, ради которого чтение существует —
  /// вызов, который «не бросил», ещё не значит, что запись в лаунчере сменилась.
  Future<String?> currentAlias() async {
    if (!Platform.isAndroid) return null;
    try {
      return await _channel.invokeMethod<String>('appIconAlias');
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }
}

final appIconServiceProvider = Provider<AppIconService>((_) => const AppIconService());
