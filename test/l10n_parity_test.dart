import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Сверяет все ARB между собой.
///
/// Отсутствующий ключ не ломает сборку: генератор молча берёт английскую
/// строку, и человек с турецким интерфейсом видит английскую фразу посреди
/// своего языка. Заметить это можно только глазами и только на нужном языке,
/// то есть практически никогда.
///
/// Ещё тише ломается подстановка. Если в переводе потерять `{codec}`, строка
/// соберётся и покажется без имени кодека; если написать `{codek}` —
/// генератор выдаст ошибку сборки, но уже после того, как файл попал в
/// репозиторий.
void main() {
  final dir = Directory('lib/l10n');
  final files = dir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.arb'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  Map<String, dynamic> read(File f) =>
      jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;

  String codeOf(File f) =>
      f.uri.pathSegments.last.replaceFirst('app_', '').replaceFirst('.arb', '');

  final template = read(File('lib/l10n/app_en.arb'));
  final expected = template.keys.where((k) => !k.startsWith('@')).toSet();

  /// Имена подстановок: `{count}` и управляющая переменная `{count, plural,`.
  ///
  /// Разбирать проще нельзя: в ICU фигурные скобки открывают ещё и ветки
  /// множественного числа (`other{Converted {done} files}`), и наивное «слово
  /// после скобки» считает подстановкой первое слово ветки — то есть текст
  /// перевода. Сами ветки не сверяются намеренно: у польского их шесть, у
  /// японского одна, и это законная разница между языками, а не ошибка.
  Set<String> placeholders(String s) => {
        for (final m in RegExp(r'\{(\w+)\}').allMatches(s)) m.group(1)!,
        for (final m in RegExp(r'\{(\w+),\s*(?:plural|select)\b').allMatches(s))
          m.group(1)!,
      };

  test('файлы есть и английский среди них', () {
    expect(files, isNotEmpty);
    expect(files.map(codeOf), contains('en'));
  });

  test('множественных форм нет ни в одном языке', () {
    // Решение принято сознательно: число выносится в конец за двоеточие
    // («Выбрано файлов: 21») или в скобки у кнопок, и падеж существительного
    // перестаёт зависеть от числа.
    //
    // Причина — цена ошибки. В славянских языках категория `one` покрывает и
    // 21, и 31; в словенском есть двойственное число; у арабского шесть
    // категорий. Ошибку в любой из них не видно ни компилятору, ни тестам, а
    // на 61 языке без носителей проверить каждую невозможно. Форма с числом в
    // конце верна во всех языках сразу и не требует ни одной категории.
    //
    // Если плюрал понадобится осознанно — этот тест придётся снять вместе с
    // объяснением, почему для той строки порядок слов важнее.
    for (final file in files) {
      final text = file.readAsStringSync();
      expect(RegExp(r',\s*plural\s*,').hasMatch(text), isFalse,
          reason: '${codeOf(file)}: вернулась форма множественного числа');
    }
  });

  for (final file in files) {
    final code = codeOf(file);
    group('app_$code.arb', () {
      final arb = read(file);
      final keys = arb.keys.where((k) => !k.startsWith('@')).toSet();

      test('@@locale совпадает с именем файла', () {
        // Расходится это ровно при копировании соседнего файла как заготовки, и
        // тогда Flutter грузит перевод не тому языку.
        expect(arb['@@locale'], code.replaceAll('_', '_'));
      });

      test('ключи те же, что в английском', () {
        expect(keys.difference(expected), isEmpty,
            reason: 'лишние ключи: ${keys.difference(expected)}');
        expect(expected.difference(keys), isEmpty,
            reason: 'не переведено: ${expected.difference(keys)}');
      });

      test('подстановки на месте', () {
        for (final key in expected.intersection(keys)) {
          final tpl = template[key];
          final own = arb[key];
          if (tpl is! String || own is! String) continue;
          expect(placeholders(own), placeholders(tpl),
              reason: '$key: подстановки разошлись с английским');
        }
      });

      test('кодировка не испорчена', () {
        // Перепутанная кодировка — самая тихая из поломок перевода: JSON
        // остаётся валидным, ключи на месте, подстановки на месте, тесты выше
        // зелёные. Видно только на экране и только тому, кто читает на этом
        // языке.
        //
        // Ловится так: UTF-8, прочитанный как cp1251 (кодировка консоли
        // Windows), всегда даёт кириллицу — «Kopiëren» превращается в
        // «KopiÐ«ren», арабский в «Щ…ЩѓШЄЩ…Щ„». Поэтому в файле языка, который
        // кириллицей не пишется, кириллицы быть не должно.
        const cyrillicScript = {'ru', 'uk', 'sr', 'bg', 'kk', 'mk', 'be', 'ky', 'tg', 'mn'};
        if (cyrillicScript.contains(code.split('_').first)) return;
        final cyrillic = RegExp(r'[Ѐ-ӿ]');
        for (final key in keys) {
          final v = arb[key];
          if (v is String && cyrillic.hasMatch(v)) {
            fail('$key: кириллица в нерусском переводе — похоже на перепутанную '
                'кодировку: «${v.substring(0, v.length.clamp(0, 40))}»');
          }
        }
      });

      test('пустых строк нет', () {
        for (final key in keys) {
          final v = arb[key];
          if (v is String) {
            expect(v.trim(), isNotEmpty, reason: '$key пуст');
          }
        }
      });
    });
  }
}
