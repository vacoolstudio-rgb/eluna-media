"""Собирает все иконочные ресурсы обеих платформ из мастеров в design/app_icons.

Запуск: python tool/gen_app_icons.py

ПРОИСХОЖДЕНИЕ МАСТЕРОВ. Файлы в `design/app_icons` — не оригиналы, а WebP q92
из отрисовок, которые лежали в `tmp/` (12 PNG по ~1,7 МБ). Папка не
отслеживается git и в историю не попадала: пока её не удалили, оригиналы целы,
но держатся они ровно на этом. Если их не сохранить, мастера останутся
единственным источником, и он сжат с потерями.

Замерено, прежде чем так делать: иконка 1024 для App Store, полученная через
мастер, даёт 43 dB к оригиналу — то есть визуально без потерь; хранить мастера
lossless стоило бы +7,9 МБ при всём отслеживаемом содержимом репозитория в
2,9 МБ, ради разницы, которой не видно. Обмен сознательный. Но если оригиналы
понадобятся для чего-то крупнее 1024 (печать, витрина магазина) — их надо
брать из архива, а не отсюда.

Почему скрипт, а не разовая ручная нарезка: иконок девять, каждая существует в
пяти плотностях, в двух слоях, плюс превью и картинка для уведомления — это 100+
файлов, которые обязаны совпадать между собой. Ручная нарезка расходится с
мастерами на первой же правке, и расхождение видно только на телефоне.

Ключевое место — АДАПТИВНАЯ иконка. Android рисует слой на холсте 108dp, а
показывает лишь круг диаметром 72dp по центру: видно 66% ширины слоя. Арт,
положенный во весь холст, теряет края — у «чемодана» отрезает ручки, у конверта
низ. Поэтому арт кладётся долей FOREGROUND_SCALE от холста, а остальное
заливается цветом, взятым из угла самого арта: тогда шва между артом и заливкой
не видно, а под менее агрессивной маской-squircle получается просто чуть больше
полей.
"""

import json
import os
import shutil
from PIL import Image, ImageChops

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MASTERS = os.path.join(ROOT, 'design', 'app_icons')
RES = os.path.join(ROOT, 'android', 'app', 'src', 'main', 'res')
ASSETS = os.path.join(ROOT, 'assets', 'icons')
IOS = os.path.join(ROOT, 'ios', 'Runner')

# Доля холста 108dp, которую занимает арт. 0.80 подобрано просмотром всех
# девяти под настоящей круглой маской: при 1.00 режет сюжет, при 0.78 уже
# заметны поля.
FOREGROUND_SCALE = 0.80

# id -> (файл мастера, alias в манифесте). Порядок — порядок в выборе иконки.
ICONS = [
    ('loop', 'IconLoop'),
    ('petals', 'IconPetals'),
    ('toolbox', 'IconToolbox'),
    ('neon', 'IconNeon'),
    ('orbit', 'IconOrbit'),
    ('unbox', 'IconUnbox'),
    ('clamp', 'IconClamp'),
    ('envelope', 'IconEnvelope'),
    ('satchel', 'IconSatchel'),
]
DEFAULT_ID = 'loop'

# dpi -> (сторона legacy-иконки, сторона слоя адаптивной 108dp)
DENSITIES = {
    'mdpi': (48, 108),
    'hdpi': (72, 162),
    'xhdpi': (96, 216),
    'xxhdpi': (144, 324),
    'xxxhdpi': (192, 432),
}

# iOS: каждая иконка — свой `.appiconset` в каталоге ассетов, а не свободные
# файлы в корне бандла.
#
# Свободные файлы — исторический способ, и у него есть шаг, который нельзя
# выполнить вне Xcode: добавить их в target вручную. Каталог ассетов такого шага
# не требует — набор подхватывается по имени из
# ASSETCATALOG_COMPILER_ALTERNATE_APPICON_NAMES, и вся iOS-часть собирается из
# файлов репозитория. Для проекта, который собирают на чужой машине, это
# решающее отличие.
#
# `ios-marketing` (1024) остаётся только у основной: он нужен App Store, а не
# лаунчеру, и восемь лишних мегабайт в бандле не нужны никому.
IOS_APPICON = [
    ('Icon-App-20x20@1x.png', 20), ('Icon-App-20x20@2x.png', 40),
    ('Icon-App-20x20@3x.png', 60), ('Icon-App-29x29@1x.png', 29),
    ('Icon-App-29x29@2x.png', 58), ('Icon-App-29x29@3x.png', 87),
    ('Icon-App-40x40@1x.png', 40), ('Icon-App-40x40@2x.png', 80),
    ('Icon-App-40x40@3x.png', 120), ('Icon-App-60x60@2x.png', 120),
    ('Icon-App-60x60@3x.png', 180), ('Icon-App-76x76@1x.png', 76),
    ('Icon-App-76x76@2x.png', 152), ('Icon-App-83.5x83.5@2x.png', 167),
    ('Icon-App-1024x1024@1x.png', 1024),
]

def ios_contents(entries):
    """Contents.json набора: те же поля, что пишет сам Xcode."""
    images = ',\n'.join(
        '    {\n'
        '      "size" : "%s",\n'
        '      "idiom" : "%s",\n'
        '      "filename" : "%s",\n'
        '      "scale" : "%s"\n'
        '    }' % (size, idiom, filename, scale)
        for size, idiom, filename, scale in entries
    )
    return ('{\n  "images" : [\n%s\n  ],\n  "info" : {\n'
            '    "version" : 1,\n    "author" : "xcode"\n  }\n}\n' % images)


# (имя файла, сторона в пикселях, размер в пунктах, идиом, множитель).
IOS_SIZES = [
    ('20x20@2x', 40, '20x20', 'iphone', '2x'),
    ('20x20@3x', 60, '20x20', 'iphone', '3x'),
    ('29x29@2x', 58, '29x29', 'iphone', '2x'),
    ('29x29@3x', 87, '29x29', 'iphone', '3x'),
    ('40x40@2x', 80, '40x40', 'iphone', '2x'),
    ('40x40@3x', 120, '40x40', 'iphone', '3x'),
    ('60x60@2x', 120, '60x60', 'iphone', '2x'),
    ('60x60@3x', 180, '60x60', 'iphone', '3x'),
    ('20x20@1x', 20, '20x20', 'ipad', '1x'),
    ('20x20-ipad@2x', 40, '20x20', 'ipad', '2x'),
    ('29x29@1x', 29, '29x29', 'ipad', '1x'),
    ('29x29-ipad@2x', 58, '29x29', 'ipad', '2x'),
    ('40x40@1x', 40, '40x40', 'ipad', '1x'),
    ('40x40-ipad@2x', 80, '40x40', 'ipad', '2x'),
    ('76x76@2x', 152, '76x76', 'ipad', '2x'),
    ('83.5x83.5@2x', 167, '83.5x83.5', 'ipad', '2x'),
]


def load(icon_id):
    path = os.path.join(MASTERS, icon_id + '.webp')
    if not os.path.exists(path):
        raise SystemExit('нет мастера: ' + path)
    return Image.open(path).convert('RGB')


def edge_colour(im):
    """Цвет заливки фона адаптивной иконки.

    Проба берётся с СЕРЕДИН кромок, а не из углов: мастер — скруглённый бейдж
    во весь кадр, и в углах лежит чёрный фон за скруглением. Проба из угла
    давала #000000 даже у иконок на кремовом фоне.

    Сама кромка ищется, а не берётся по размеру кадра: у части мастеров бейдж
    не доходит до края на 10-18 px, и фиксированный отступ снова попадал бы в
    чёрное.
    """
    black = Image.new('RGB', im.size, (0, 0, 0))
    lit = ImageChops.difference(im, black).convert('L').point(
        lambda v: 255 if v > 14 else 0)
    x0, y0, x1, y1 = lit.getbbox() or (0, 0) + im.size
    inset = max(4, (x1 - x0) // 24)
    cx, cy = (x0 + x1) // 2, (y0 + y1) // 2
    pts = [(cx, y0 + inset), (cx, y1 - inset - 1),
           (x0 + inset, cy), (x1 - inset - 1, cy)]
    px = [im.getpixel(p) for p in pts]
    return tuple(sum(c[i] for c in px) // len(px) for i in range(3))


def write_webp(im, path, quality=92):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    im.save(path, 'WEBP', quality=quality, method=6)


def write_png(im, path):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    im.save(path, 'PNG')


def square(im, side):
    return im.resize((side, side), Image.LANCZOS)


def foreground(im, canvas):
    """Слой переднего плана: арт по центру прозрачного холста 108dp."""
    side = int(round(canvas * FOREGROUND_SCALE))
    layer = Image.new('RGBA', (canvas, canvas), (0, 0, 0, 0))
    layer.paste(square(im, side), ((canvas - side) // 2,) * 2)
    return layer


def main():
    colours = {}
    for icon_id, _alias in ICONS:
        im = load(icon_id)
        colours[icon_id] = edge_colour(im)

        # Превью для экрана выбора — контракт eluna_shared: <id>-512.webp.
        write_webp(square(im, 512), os.path.join(ASSETS, icon_id + '-512.webp'))

        # Картинка для уведомления. Обязана быть drawable, а не mipmap:
        # DrawableResourceAndroidBitmap ищет только в drawable.
        write_webp(square(im, 256),
                   os.path.join(RES, 'drawable-nodpi', 'notif_%s.webp' % icon_id))

        for dpi, (legacy, canvas) in DENSITIES.items():
            d = os.path.join(RES, 'mipmap-' + dpi)
            write_webp(square(im, legacy),
                       os.path.join(d, 'ic_launcher_%s.webp' % icon_id))
            write_webp(foreground(im, canvas),
                       os.path.join(d, 'ic_launcher_%s_fg.webp' % icon_id), quality=95)
            if icon_id == DEFAULT_ID:
                # Иконка по умолчанию живёт ещё и под именем ic_launcher:
                # на неё ссылается android:icon у <application>, и она же
                # достаётся тем, кто ставит приложение впервые.
                write_webp(square(im, legacy), os.path.join(d, 'ic_launcher.webp'))
                write_webp(foreground(im, canvas),
                           os.path.join(d, 'ic_launcher_fg.webp'), quality=95)

        anydpi = os.path.join(RES, 'mipmap-anydpi-v26')
        os.makedirs(anydpi, exist_ok=True)
        names = ['ic_launcher_' + icon_id]
        if icon_id == DEFAULT_ID:
            names.append('ic_launcher')
        for name in names:
            fg = name + '_fg' if name == 'ic_launcher' else 'ic_launcher_%s_fg' % icon_id
            with open(os.path.join(anydpi, name + '.xml'), 'w', encoding='utf-8') as f:
                f.write(
                    '<?xml version="1.0" encoding="utf-8"?>\n'
                    '<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">\n'
                    '    <background android:drawable="@color/ic_bg_%s"/>\n'
                    '    <foreground android:drawable="@mipmap/%s"/>\n'
                    '</adaptive-icon>\n' % (icon_id, fg))

    # Цвета фона адаптивных иконок.
    lines = ['<?xml version="1.0" encoding="utf-8"?>', '<resources>']
    for icon_id, _ in ICONS:
        r, g, b = colours[icon_id]
        lines.append('    <color name="ic_bg_%s">#%02X%02X%02X</color>'
                     % (icon_id, r, g, b))
    lines += ['</resources>', '']
    with open(os.path.join(RES, 'values', 'ic_launcher_colors.xml'), 'w',
              encoding='utf-8') as f:
        f.write('\n'.join(lines))

    # iOS. Основная иконка сохраняет имена файлов, которые уже прописаны в её
    # Contents.json; альтернативные получают по собственному набору.
    xcassets = os.path.join(IOS, 'Assets.xcassets')
    master = load(DEFAULT_ID)
    appicon = os.path.join(xcassets, 'AppIcon.appiconset')
    for name, side in IOS_APPICON:
        write_png(square(master, side), os.path.join(appicon, name))

    # Прежний способ со свободными файлами. Удаляется, чтобы в репозитории не
    # осталось двух наборов иконок, из которых один ни на что не влияет.
    legacy_alt = os.path.join(IOS, 'AltIcons')
    if os.path.isdir(legacy_alt):
        shutil.rmtree(legacy_alt)

    for icon_id, _ in ICONS:
        if icon_id == DEFAULT_ID:
            continue
        im = load(icon_id)
        setdir = os.path.join(xcassets, 'AppIcon-%s.appiconset' % icon_id)
        if os.path.isdir(setdir):
            shutil.rmtree(setdir)
        entries = []
        for suffix, side, size, idiom, scale in IOS_SIZES:
            filename = 'AppIcon-%s-%s.png' % (icon_id, suffix)
            write_png(square(im, side), os.path.join(setdir, filename))
            entries.append((size, idiom, filename, scale))
        with open(os.path.join(setdir, 'Contents.json'), 'w', encoding='utf-8') as f:
            f.write(ios_contents(entries))

    print(json.dumps({'icons': [i for i, _ in ICONS], 'default': DEFAULT_ID,
                      'colours': {k: '#%02X%02X%02X' % v for k, v in colours.items()}},
                     ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
