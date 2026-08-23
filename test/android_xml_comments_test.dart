import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Android XML that aapt2 will refuse, caught before it reaches a commit.
///
/// From a real one: `e42fcbe` moved the icon generator into eluna_shared and,
/// in the manifest comment explaining how to run it, quoted the command line
/// including its `--art` flag. XML forbids `--` inside a comment, full stop, so
/// AndroidManifest.xml stopped being well-formed and **every Android build
/// failed** — at `processReleaseMainManifest`, with `MergeFailureException:
/// Error parsing AndroidManifest.xml` and no mention of a comment. The commit
/// was green everywhere else: `flutter analyze` and `flutter test` never open
/// these files, so nothing noticed that HEAD could not produce an APK.
///
/// Two rules, both of which aapt2 enforces and neither of which is obvious
/// while writing prose in a comment:
///
///  * a comment may not contain `--` anywhere (so no flags, no `-->` inside,
///    and no `--` used as a dash);
///  * XML 1.0 allows no control characters except tab, CR and LF.
///
/// This is deliberately not a full well-formedness check: it needs no XML
/// parser, so it cannot be defeated by a dependency change, and it covers the
/// mistake that actually happens — a human writing English in a comment.
void main() {
  final files = [
    File('android/app/src/main/AndroidManifest.xml'),
    ...Directory('android/app/src/main/res')
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.xml')),
  ];

  test('there are Android XML files to check at all', () {
    // Guards against the globs above silently matching nothing, which would
    // make every test below pass by doing no work. The bar is low on purpose:
    // this file is meant to be copied into every app unchanged, and the
    // smallest of them ships six Android XML files in total.
    expect(files.length, greaterThan(3),
        reason: 'expected the manifest plus the res/ tree; got ${files.length}');
  });

  for (final file in files) {
    final path = file.path.replaceAll(r'\', '/');
    final source = file.readAsStringSync();

    test('$path: comments contain no "--"', () {
      var from = 0;
      while (true) {
        final start = source.indexOf('<!--', from);
        if (start < 0) break;
        final end = source.indexOf('-->', start + 4);
        expect(end, greaterThan(-1),
            reason: 'unterminated comment starting at offset $start');

        final body = source.substring(start + 4, end);
        final at = body.indexOf('--');
        expect(at, -1,
            reason: 'XML forbids "--" inside a comment; aapt2 fails the whole '
                'build on it. Found in:\n  ...${_around(body, at)}...\n'
                'Rewrite the prose: a command line with flags belongs in a doc, '
                'not in a comment.');
        from = end + 3;
      }
    });

    test('$path: no control characters', () {
      for (var i = 0; i < source.length; i++) {
        final c = source.codeUnitAt(i);
        final allowed = c == 0x09 || c == 0x0a || c == 0x0d;
        final control = c < 0x20 || (c >= 0x7f && c <= 0x9f);
        expect(control && !allowed, isFalse,
            reason: 'control character U+${c.toRadixString(16).padLeft(4, '0')} '
                'at offset $i is not valid XML');
      }
    });
  }
}

/// A window of [body] around [at], for a failure message that points at the
/// offending words rather than making someone grep the file.
String _around(String body, int at) {
  if (at < 0) return '';
  final start = (at - 60).clamp(0, body.length);
  final end = (at + 60).clamp(0, body.length);
  return body.substring(start, end).replaceAll('\n', ' ').trim();
}
