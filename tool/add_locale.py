"""Записывает ARB нового языка, беря порядок и состав ключей из английского.

    python tool/add_locale.py nl < перевод.json

На вход — плоский JSON `{"ключ": "перевод", ...}`. Скрипт сам ставит `@@locale`,
сам расставляет ключи в порядке шаблона и сам ругается на недостающие и лишние:
руками этот порядок не удержать, а разошедшийся состав ключей ловится потом
только на чужом языке и обычно никем.

Метаданные `@ключ` в переводы не копируются — они описание для переводчика и
живут только в шаблоне.
"""

import collections
import io
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEMPLATE = os.path.join(ROOT, 'lib', 'l10n', 'app_en.arb')


def main():
    if len(sys.argv) != 2:
        raise SystemExit('использование: add_locale.py <код языка> < перевод.json')
    code = sys.argv[1]

    with io.open(TEMPLATE, encoding='utf-8') as f:
        template = json.load(f, object_pairs_hook=collections.OrderedDict)
    order = [k for k in template if not k.startswith('@')]

    # Читать надо байты и раскодировать самим. `sys.stdin.read()` на Windows
    # берёт кодировку консоли (cp1251), и UTF-8 арабского или японского
    # превращается в мусор молча: JSON остаётся валидным, файл записывается,
    # тесты на паритет ключей проходят — а на экране кракозябры.
    data = json.loads(sys.stdin.buffer.read().decode('utf-8'))

    missing = [k for k in order if k not in data]
    extra = [k for k in data if k not in order]
    if missing:
        raise SystemExit('нет перевода для %d ключей: %s' % (len(missing), missing[:8]))
    if extra:
        raise SystemExit('лишние ключи: %s' % extra[:8])

    out = collections.OrderedDict()
    out['@@locale'] = code
    for k in order:
        out[k] = data[k]

    path = os.path.join(ROOT, 'lib', 'l10n', 'app_%s.arb' % code)
    with io.open(path, 'w', encoding='utf-8', newline='\n') as f:
        f.write(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
    print('%s: %d ключей' % (os.path.basename(path), len(order)))


if __name__ == '__main__':
    main()
