# -*- coding: utf-8 -*-
"""Собирает англоязычный листинг для App Store и проверяет длины полей."""
import io, os

NAME = "Eluna Media: Video Converter"
SUBTITLE = "Audio, photo & GIF compressor"
KEYWORDS = ("mp4,mp3,jpg,png,heic,mov,mkv,webm,avi,wav,flac,m4a,webp,avif,"
            "shrink,reduce,size,trim,crop,batch")
PROMO = ("Convert and compress on the phone itself. No account, no ads, "
         "no subscriptions. The app makes no network requests of its own.")

DESCRIPTION = """Eluna Media converts and compresses video, audio and photos entirely on your iPhone. No account, no ads, no subscriptions, no watermarks — and the app makes no network requests of its own. Your files never leave the device: conversion works in airplane mode.

HIT AN EXACT SIZE
Pick a byte budget — 10 MB, 16 MB, 25 MB, 50 MB, 100 MB or your own number — and the bitrate is worked out from the real duration with a safety margin, so the result lands under the limit instead of somewhere near it. For photos the quality is searched the same way.

COMPRESSION THAT CANNOT BACKFIRE
An already-compressed clip used to come out bigger than it went in. Now both picture and sound are held to what the source itself spent, so "compress" can no longer inflate a file.

EVERY FORMAT THAT MATTERS
Video: MP4, MKV, MOV, WebM, AVI — with H.264, H.265, AV1, VP9, MPEG-4, or a straight remux with no re-encoding at all.
Audio: MP3, M4A (AAC or ALAC), WAV, FLAC, OGG, Opus — including pulling the sound out of any video.
Photos: JPEG, PNG, WebP, AVIF, BMP, TIFF, plus animated GIF and animated WebP.
Camera-roll HEIC is read properly, tiles and all — no more photos quietly cropped to a corner.

EDIT WHAT ACTUALLY NEEDS EDITING
Trim to a range, rotate, mirror, crop to 1:1, 9:16, 16:9 or 4:3, change speed from 0.25x to 4x, adjust volume, resize by percent, merge several clips into one, sharpen or denoise a photo, upscale 2x.

A BATCH THAT KEEPS ITS PROMISES
Put hundreds of files in one queue. A single broken file never kills the batch, every job shows its own progress and time remaining, and the queue survives a restart — an interrupted batch picks itself up on the next launch.

PRIVACY YOU CAN VERIFY, NOT JUST BELIEVE
EXIF, GPS and timestamps are stripped from every result by default. A Network and privacy screen inside the app lists every channel that can touch the network, and what each one is for. Lock the app with a passcode or Face ID.

FREE, AND FREE MEANS FREE
Every feature is yours from the start, batch conversion included. There is no paid tier, no trial and no watermark. The only thing that can be bought is a tip, and it unlocks nothing.

ONE HONEST NOTE
iOS suspends apps that are not on screen, so a conversion pauses when you leave Eluna Media. Keep it open while a long job runs.

Support: support@eluna-apps.com"""

WHATS_NEW = """First release on the App Store.

Eluna Media converts and compresses video, audio and photos on the device itself — no account, no ads, no subscriptions and no network access at all.

- Hit an exact file size: 10, 16, 25, 50, 100 MB or your own number
- Video, audio and photo formats including AV1, AVIF and animated WebP
- Batch queue that survives a restart
- Metadata stripped by default; passcode or Face ID lock"""


EXTRA = """
## Категории

- Основная: **Photo & Video**
- Дополнительная: **Utilities**

Photo & Video — то, чем приложение является; Utilities ловит тех, кто ищет
«конвертер» среди инструментов. Productivity здесь не подходит: там ищут
органайзеры и заметки, и конкуренция дороже, а совпадение намерения ниже.

## Ссылки

- Support URL: https://eluna-apps.com
- Marketing URL: https://eluna-apps.com
- Support email: support@eluna-apps.com

## Возрастной рейтинг

**4+**. Нет пользовательского контента, сети, рекламы, ссылок наружу кроме
поддержки и магазина.

## Конфиденциальность (App Privacy)

**Data Not Collected** — по всем пунктам без исключения. Это не позиция, а
факт: у приложения нет сетевого кода вовсе, и на Android релизная сборка не
несёт даже разрешения INTERNET. При заполнении анкеты отвечать «No» на сбор
любых данных, включая аналитику, идентификаторы и диагностику.

## Заметка для проверяющего (App Review Information)

Sign-in is not required — the app has no accounts and no server.

Everything runs on the device through a bundled FFmpeg build. The app makes no
network requests of its own — there is no analytics, no update check and no
content server. The only networking that can happen is StoreKit's, when someone
opens the optional tip screen; that request belongs to the system framework,
not to app code. Settings → Network and privacy inside the app states the same.

To try it: open the app, add any photo or video from the library, pick a preset
(for example "Fit to size" with a 10 MB budget) and start. The result is saved
to the Photos album "Eluna Media".

The app bundles a build of FFmpeg and is distributed under the GNU GPL v3.
The corresponding source is available to anyone who asks at
support@eluna-apps.com.

## Лицензия: риск, который надо посчитать до релиза

Приложение несёт `ffmpeg-kit` **full-gpl** — с `--enable-gpl`, `libx264` и
`libx265`. Значит целиком распространяется под **GNU GPL v3**, и это
записано в заметке проверяющему.

Проблема не в раскрытии, а в самом сочетании. Условия App Store и GPL
конфликтуют: Apple навязывает свои ограничения на использование, чего GPL не
допускает. Прецеденты прямые — VLC сняли из App Store в январе 2011 года, до
того сняли GNU Go по письму FSF. Apple лицензии не сканирует; удаление идёт
**по жалобе правообладателя**, а выдать дополнительное разрешение мы не можем:
копирайт на FFmpeg, x264 и x265 принадлежит сотням людей, не нам.

**Обход существует и он не теоретический.** На pub.dev есть не-GPL сборки того
же пакета: `ffmpeg_kit_flutter_new_full` (LGPL, без x264/x265) и другие. H.264 и
H.265 тогда кодируются через VideoToolbox на iOS и MediaCodec на Android; AV1 и
VP9 у нас и так на BSD-лицензированных libaom и libvpx, AVIF и анимированный
WebP тоже остаются.

**Цена обхода, и она немаленькая.** Аппаратные энкодеры принимают битрейт, а не
целевое качество, — значит для H.264 и H.265 **исчезает режим постоянного
качества (CRF)**, а он у приложения основной. Плюс на Android аппаратный путь
доказанно ненадёжен: наш же тест поймал устройство, которое объявляет энкодер и
отвечает `NAME_NOT_FOUND`, а эмулятор пишет ноль кадров и рапортует успех. Без
программного x264 откатываться будет некуда.

**Разумный компромисс:** LGPL-сборка для App Store, full-gpl для Play и F-Droid.
Пакет подменяется через `pubspec_overrides.yaml` на профиль сборки — ровно так
это уже сделано в eluna-budget (`profiles/foss.yaml`).

Решение владельца, не моё. Но принимать его надо **до** релиза: снятие
приложения после публикации стоит дороже, чем недельная работа сейчас.

## Что здесь сделано ради снижения риска — и чего текст сделать не может

**Сразу прямо: листинг риск снятия не снижает.** Снимают не за формулировки, а
за то, что GPL-код раздаётся на условиях магазина. Лечится это сборкой, а не
описанием. Всё, что может текст, — не мешать будущему переходу и не врать.

**Убрано «Free and open source».** Репозиторий `vacoolstudio-rgb/eluna-media`
сегодня **приватный** — проверено. Пока это так, фраза в описании неправда, а
для GPL это ещё и нарушение само по себе: получивший бинарник имеет право на
исходники. Причём это как раз то нарушение, из-за которого жалобы и пишут:
«собрали наш x264 и не отдали исходники» — понятный повод, в отличие от
юридических тонкостей про условия магазина.

Вернуть фразу — и вместе с ней ссылку на репозиторий — можно в тот день, когда
репозиторий станет публичным. **Это самый дешёвый шаг из всех, что снижают
риск:** он ничего не стоит и снимает самый очевидный повод для претензии.

**В заметке проверяющему появилось предложение исходников.** GPL требует либо
приложить исходники, либо дать письменное предложение их выдать. Второе теперь
записано и указывает на почту поддержки.

**Ни одного обещания, которое сломается после перехода на LGPL.** В тексте
намеренно нет слов про постоянное качество и CRF, нет названий конкретных
реализаций кодировщиков (x264, x265) — только названия форматов, которые
останутся верными и на аппаратном пути. «Уложиться в размер» и «сжатие не
раздувает файл» держатся на битрейте и переживут смену сборки без правки строки.

## Чего в тексте нет намеренно

- **Фоновой конвертации.** iOS её не даёт, и обещание в описании превратилось бы
  в поток одинаковых отзывов. Вместо обещания — честная строка в конце описания.
- **Приёма из листа «Поделиться».** Расширение написано, но в этой сборке его
  нет: подпись ждёт App Group. Появится — строку добавим.
- **Названий чужих сервисов** (Discord, WhatsApp) в ключевых словах. Это чужие
  торговые марки; Apple такие ключи отклоняет, а бюджет в 100 символов дороже.
- **Слова «AI»** и любых обещаний улучшения нейросетью. Их в приложении нет.

## Скриншоты

Снимать в **6.9" (1320×2868)** и iPad 13". Именно 6.9 — это родное разрешение
симулятора iPhone 17 Pro Max, на котором снимает наш конвейер, то есть кадры
уходят без единого пересчёта. Для читалки мы гнали их в 6.5" (1242×2688) и
Apple их приняла — размер живой, — но там это стоило лишнего прогона
масштабирования, а выигрыша не дало.

Порядок кадров — тот же, что у читалки: первым идёт кадр, который объясняет
главное обещание, а не главный экран.

1. Точный размер: выбран бюджет 10 МБ и виден результат под лимитом
2. Форматы: строка «Конвертировать в» с раскрытым списком
3. Очередь: батч в работе, проценты и оставшееся время
4. Приватность: экран сетевого аудита с пустым списком каналов
5. Обработка: обрезка и кроп

**Не ставить в кадр ползунок качества (CRF).** Если приложение переедет на
LGPL-сборку, режим постоянного качества для H.264 и H.265 исчезнет, и снимок
станет обещанием того, чего нет. Битрейт и «уложиться в размер» показывать
можно — они останутся.
6. Достижения или настройки с темами — как «живой» кадр
"""

FIELDS = [
    ("App Name", NAME, 30),
    ("Subtitle", SUBTITLE, 30),
    ("Keywords", KEYWORDS, 100),
    ("Promotional Text", PROMO, 170),
    ("Description", DESCRIPTION, 4000),
    ("What's New", WHATS_NEW, 4000),
]

out = ["# App Store — англоязычный листинг Eluna Media",
       "",
       "Готово к вставке в App Store Connect. Длины проверены скриптом:",
       "Apple обрезает молча, а не предупреждает.",
       "",
       "| Поле | Символов | Предел |",
       "|---|---|---|"]
bad = []
for label, value, limit in FIELDS:
    out.append(f"| {label} | {len(value)} | {limit} |")
    if len(value) > limit:
        bad.append(f"{label}: {len(value)} > {limit}")
out.append("")

out.append(EXTRA.strip())
out.append("")

for label, value, limit in FIELDS:
    out.append(f"## {label}")
    out.append("")
    out.append("```")
    out.append(value)
    out.append("```")
    out.append("")

io.open(os.path.expanduser("~/Documents/Eluna/eluna-media/docs/ASO/appstore-en.md"),
        "w", encoding="utf-8").write("\n".join(out))
print("\n".join(f"{l}: {len(v)}/{lim}" for l, v, lim in FIELDS))
print("ПРЕВЫШЕНИЯ:", bad or "нет")
