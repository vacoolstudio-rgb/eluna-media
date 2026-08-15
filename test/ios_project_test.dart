import 'dart:io';

import 'package:eluna_media/domain/app_icons.dart';
import 'package:flutter_test/flutter_test.dart';

/// Проектные файлы iOS, сверенные с тем, что заявляет Dart.
///
/// Двойник `app_icons_test.dart`, который делает ту же работу для Android, и
/// существует по той же причине: расхождение между Dart и платформенным
/// описанием компилятор не ловит, а цена у каждого расхождения своя.
///
///  * нет набора в каталоге ассетов — иконка просто не переключится;
///  * набор есть, но не перечислен в `ASSETCATALOG_..._ALTERNATE_APPICON_NAMES`
///    — Xcode не положит его в бандл, и будет то же самое;
///  * перечислен не во всех трёх конфигурациях — работает в Debug и молча
///    отваливается в релизе, то есть ровно у пользователей;
///  * нет строки NSFaceIDUsageDescription — iOS **убивает процесс** в момент,
///    когда приложение впервые трогает Face ID. Не исключение в Dart, которое
///    можно поймать, а SIGABRT от системы.
///
/// Всё это видно только на устройстве и только в тот момент, когда уже поздно.
void main() {
  final pbxproj =
      File('ios/Runner.xcodeproj/project.pbxproj').readAsStringSync();
  final infoPlist = File('ios/Runner/Info.plist').readAsStringSync();
  final assets = Directory('ios/Runner/Assets.xcassets');

  /// Сколько раз строка встречается в pbxproj. Конфигураций три —
  /// Debug, Release и Profile, — и настройка иконок нужна в каждой.
  int occurrences(String needle) =>
      needle.allMatches(pbxproj).length;

  group('иконки', () {
    test('у основной иконки свой набор, и проект указывает именно на него', () {
      expect(Directory('${assets.path}/AppIcon.appiconset').existsSync(), isTrue);
      expect(occurrences('ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;'), 3,
          reason: 'основная иконка задана не во всех трёх конфигурациях');
    });

    test('у каждой сменной иконки есть свой набор в каталоге ассетов', () {
      for (final icon in kAppIcons) {
        if (icon.id == kDefaultAppIconId) continue;
        final set = Directory('${assets.path}/AppIcon-${icon.id}.appiconset');
        expect(set.existsSync(), isTrue,
            reason: '${icon.id}: нет AppIcon-${icon.id}.appiconset');
        expect(File('${set.path}/Contents.json').existsSync(), isTrue,
            reason: '${icon.id}: набор без Contents.json Xcode не соберёт');
        // 60×60@2x — размер домашнего экрана iPhone. Набор без него собирается,
        // но переключаться будет не на что.
        expect(File('${set.path}/AppIcon-${icon.id}-60x60@2x.png').existsSync(),
            isTrue,
            reason: '${icon.id}: в наборе нет размера домашнего экрана');
      }
    });

    test('каждая сменная иконка перечислена во всех трёх конфигурациях', () {
      final lists = RegExp(
        r'ASSETCATALOG_COMPILER_ALTERNATE_APPICON_NAMES = "([^"]*)"',
      ).allMatches(pbxproj).map((m) => m.group(1)!).toList();
      expect(lists.length, 3,
          reason: 'список сменных иконок задан в ${lists.length} конфигурациях '
              'из трёх — в остальных иконки в бандл не попадут');

      for (final list in lists) {
        final names = list.split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toSet();
        for (final icon in kAppIcons) {
          if (icon.id == kDefaultAppIconId) continue;
          expect(names, contains('AppIcon-${icon.id}'),
              reason: '${icon.id}: набор есть, но Xcode о нём не сказано');
        }
        // Обратная сторона: имя без набора — ошибка сборки каталога ассетов.
        expect(names.length, kAppIcons.length - 1,
            reason: 'в списке лишние имена: $names');
      }

      expect(occurrences('ASSETCATALOG_COMPILER_INCLUDE_ALL_APPICON_ASSETS = YES'), 3,
          reason: 'без этого флага Xcode кладёт в бандл только основную иконку');
    });

    test('Info.plist не перечисляет иконки руками', () {
      // `CFBundleIcons` целиком генерирует Xcode из каталога ассетов.
      // Рукописный блок рядом либо перезапишет сгенерированный, либо будет
      // ссылаться на файлы, которых в бандле нет.
      expect(infoPlist, isNot(contains('CFBundleAlternateIcons')),
          reason: 'рукописный CFBundleAlternateIcons поспорит с каталогом ассетов');
    });
  });

  group('строки разрешений', () {
    // Каждая из них — не формальность: iOS завершает процесс, когда приложение
    // трогает защищённое API без объяснения, зачем.
    const required = <String, String>{
      'NSPhotoLibraryAddUsageDescription': 'сохранение результата в галерею',
      'NSPhotoLibraryUsageDescription': 'удаление оригиналов через PHPhotoLibrary',
      'NSFaceIDUsageDescription': 'замок приложения через local_auth',
    };

    for (final entry in required.entries) {
      test('${entry.key} на месте (${entry.value})', () {
        expect(infoPlist, contains('<key>${entry.key}</key>'),
            reason: 'без этой строки iOS убивает процесс при первом же '
                'обращении: ${entry.value}');
      });
    }

    test('ни одна строка разрешения не пуста', () {
      for (final key in required.keys) {
        final match = RegExp(
          '<key>$key</key>\\s*<string>([^<]*)</string>',
        ).firstMatch(infoPlist);
        expect(match, isNotNull, reason: '$key объявлен не строкой');
        expect(match!.group(1)!.trim(), isNotEmpty,
            reason: '$key пуст — App Review отклоняет пустое объяснение');
      }
    });
  });

  group('приём файлов извне', () {
    test('объявлены все три вида документов', () {
      // Без них «Открыть в Eluna Media» не появится в системном меню, и
      // AppDelegate.handle(url:) никто не позовёт.
      for (final type in ['public.movie', 'public.audio', 'public.image']) {
        expect(infoPlist, contains('<string>$type</string>'),
            reason: 'приложение не предлагает себя для $type');
      }
    });
  });
}
