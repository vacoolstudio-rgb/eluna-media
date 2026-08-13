import 'dart:io';

import 'package:eluna_media/domain/app_icons.dart';
import 'package:flutter_test/flutter_test.dart';

/// Одна и та же девятка описана в четырёх местах: в Dart, в манифесте, в белом
/// списке MainActivity и в файлах ресурсов. Ни одна из копий не знает об
/// остальных, компилятор их не сверяет, и цена расхождения не одинакова:
///
///  * нет ресурса — сборка падает, это заметно сразу;
///  * нет записи в манифесте или в белом списке — сборка проходит, а иконка
///    просто не переключается;
///  * включены две записи разом — приложение появляется на рабочем столе
///    ДВАЖДЫ, и убрать вторую можно только переустановкой.
///
/// Последние два случая ловятся только здесь.
void main() {
  final manifest =
      File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
  final kotlin = File(
    'android/app/src/main/kotlin/com/lunara/eluna_media/MainActivity.kt',
  ).readAsStringSync();

  test('каталог не пуст и иконка по умолчанию в нём есть', () {
    expect(kAppIcons, isNotEmpty);
    expect(kAppIcons.map((i) => i.id), contains(kDefaultAppIconId));
    expect(kAppIcons.map((i) => i.id).toSet().length, kAppIcons.length,
        reason: 'повторяющийся id');
    expect(kAppIcons.map((i) => i.alias).toSet().length, kAppIcons.length,
        reason: 'повторяющийся alias');
  });

  test('у каждой иконки есть запись в манифесте', () {
    for (final icon in kAppIcons) {
      expect(manifest, contains('android:name=".${icon.alias}"'),
          reason: '${icon.id}: нет <activity-alias> в манифесте');
      expect(manifest, contains('@mipmap/ic_launcher_${icon.id}'),
          reason: '${icon.id}: запись не ссылается на свою иконку');
    }
  });

  test('в манифесте включена ровно одна запись, и это иконка по умолчанию', () {
    // Комментарии выбрасываются до разбора: в манифесте есть пояснение, которое
    // само упоминает `<activity-alias>`, и без этого оно считалось десятой
    // записью.
    final xml = manifest.replaceAll(RegExp(r'<!--.*?-->', dotAll: true), '');
    final aliases = RegExp(r'<activity-alias(.*?)>', dotAll: true)
        .allMatches(xml)
        .map((m) => m.group(1)!)
        .toList();
    expect(aliases.length, kAppIcons.length);

    final enabled = [
      for (final a in aliases)
        if (RegExp(r'android:enabled="true"').hasMatch(a))
          RegExp(r'android:name="\.(\w+)"').firstMatch(a)!.group(1)!,
    ];
    expect(enabled.length, 1,
        reason: 'включено записей: ${enabled.length} — на рабочем столе будет '
            'столько же ярлыков');
    final defaultIcon = kAppIcons.firstWhere((i) => i.id == kDefaultAppIconId);
    expect(enabled.single, defaultIcon.alias);
  });

  test('белый список в MainActivity совпадает с каталогом', () {
    final block =
        RegExp(r'iconAliases = listOf\((.*?)\)', dotAll: true).firstMatch(kotlin);
    expect(block, isNotNull, reason: 'не нашёлся iconAliases в MainActivity.kt');
    final names = RegExp('"(\\w+)"')
        .allMatches(block!.group(1)!)
        .map((m) => m.group(1)!)
        .toSet();
    expect(names, kAppIcons.map((i) => i.alias).toSet());
  });

  test('файлы каждой иконки лежат на месте', () {
    for (final icon in kAppIcons) {
      expect(File(icon.asset).existsSync(), isTrue,
          reason: 'нет превью ${icon.asset}');
      expect(
        File('android/app/src/main/res/drawable-nodpi/${icon.largeIcon}.webp')
            .existsSync(),
        isTrue,
        reason: '${icon.id}: нет картинки для уведомления',
      );
      for (final dpi in ['mdpi', 'hdpi', 'xhdpi', 'xxhdpi', 'xxxhdpi']) {
        final dir = 'android/app/src/main/res/mipmap-$dpi';
        expect(File('$dir/ic_launcher_${icon.id}.webp').existsSync(), isTrue,
            reason: '${icon.id}: нет растра в $dpi');
        expect(File('$dir/ic_launcher_${icon.id}_fg.webp').existsSync(), isTrue,
            reason: '${icon.id}: нет слоя адаптивной иконки в $dpi');
      }
      expect(
        File('android/app/src/main/res/mipmap-anydpi-v26/ic_launcher_${icon.id}.xml')
            .existsSync(),
        isTrue,
        reason: '${icon.id}: нет описания адаптивной иконки',
      );
    }
  });

  test('иконка по умолчанию доступна ещё и под именем ic_launcher', () {
    // На неё ссылается android:icon у <application>; без неё сборка падает, но
    // с чужой иконкой под этим именем — нет, а увидит её тот, кто ставит
    // приложение впервые.
    for (final dpi in ['mdpi', 'hdpi', 'xhdpi', 'xxhdpi', 'xxxhdpi']) {
      final dir = 'android/app/src/main/res/mipmap-$dpi';
      expect(File('$dir/ic_launcher.webp').existsSync(), isTrue);
      expect(File('$dir/ic_launcher_fg.webp').existsSync(), isTrue);
    }
    final xml =
        File('android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml')
            .readAsStringSync();
    expect(xml, contains('@color/ic_bg_$kDefaultAppIconId'));
  });

  test('iOS знает каждую альтернативную иконку по имени', () {
    // Имя набора из каталога ассетов — оно же уходит в `setAlternateIconName`
    // (lib/services/app_icon.dart собирает его как `AppIcon-<id>`), оно же
    // должно стоять в настройке сборки. Забыть настройку легко: наборы лежат в
    // каталоге, выглядят подключёнными, а в бандл не попадают — и переключение
    // молча отказывает на устройстве.
    final pbxproj = File('ios/Runner.xcodeproj/project.pbxproj').readAsStringSync();
    final alternates = RegExp(r'ASSETCATALOG_COMPILER_ALTERNATE_APPICON_NAMES = "([^"]*)"')
        .allMatches(pbxproj)
        .map((m) => m.group(1)!.split(' ').toSet())
        .toList();
    expect(alternates, isNotEmpty,
        reason: 'настройка не прописана ни в одной конфигурации');
    expect(alternates.length, 3,
        reason: 'конфигураций у Runner три (Debug/Release/Profile), '
            'а настройка стоит в ${alternates.length} — сборка, где её нет, '
            'соберётся без альтернативных иконок');

    final expected = {
      for (final i in kAppIcons)
        if (i.id != kDefaultAppIconId) 'AppIcon-${i.id}',
    };
    for (final set in alternates) {
      expect(set, expected);
    }
    expect(pbxproj, contains('ASSETCATALOG_COMPILER_INCLUDE_ALL_APPICON_ASSETS = YES'));

    for (final icon in kAppIcons) {
      if (icon.id == kDefaultAppIconId) continue;
      final dir = 'ios/Runner/Assets.xcassets/AppIcon-${icon.id}.appiconset';
      expect(File('$dir/Contents.json').existsSync(), isTrue,
          reason: '${icon.id}: нет описания набора');
      // 60pt — та самая иконка на домашнем экране iPhone; без неё сборка
      // ругается, а на устройстве видно пустое место.
      for (final f in ['60x60@2x', '60x60@3x']) {
        expect(File('$dir/AppIcon-${icon.id}-$f.png').existsSync(), isTrue,
            reason: '${icon.id}: нет $f');
      }
    }
  });

  test('Info.plist не перечисляет иконки вручную', () {
    // Xcode генерирует CFBundleIcons из каталога ассетов. Рукописный блок
    // рядом либо перезапишет сгенерированный, либо будет ссылаться на файлы в
    // корне бандла, которых в этом проекте больше нет.
    final plist = File('ios/Runner/Info.plist').readAsStringSync();
    expect(plist, isNot(contains('<key>CFBundleIcons</key>')));
    expect(plist, isNot(contains('CFBundleAlternateIcons')));
  });
}
