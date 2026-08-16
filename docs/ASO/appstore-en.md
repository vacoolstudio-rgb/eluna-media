# App Store — англоязычный листинг Eluna Media

Готово к вставке в App Store Connect. Длины проверены скриптом:
Apple обрезает молча, а не предупреждает.

| Поле | Символов | Предел |
|---|---|---|
| App Name | 28 | 30 |
| Subtitle | 28 | 30 |
| Keywords | 99 | 100 |
| Promotional Text | 131 | 170 |
| Description | 2411 | 4000 |
| What's New | 417 | 4000 |

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
network requests at all; you can verify this in Settings → Network and privacy,
which lists every network channel the app has (none).

To try it: open the app, add any photo or video from the library, pick a preset
(for example "Fit to size" with a 10 MB budget) and start. The result is saved
to the Photos album "Eluna Media".

The app bundles FFmpeg compiled with x264/x265 and is therefore distributed
under the GNU GPL v3; the source is public.

## Чего в тексте нет намеренно

- **Фоновой конвертации.** iOS её не даёт, и обещание в описании превратилось бы
  в поток одинаковых отзывов. Вместо обещания — честная строка в конце описания.
- **Приёма из листа «Поделиться».** Расширение написано, но в этой сборке его
  нет: подпись ждёт App Group. Появится — строку добавим.
- **Названий чужих сервисов** (Discord, WhatsApp) в ключевых словах. Это чужие
  торговые марки; Apple такие ключи отклоняет, а бюджет в 100 символов дороже.
- **Слова «AI»** и любых обещаний улучшения нейросетью. Их в приложении нет.

## Скриншоты

Нужны два размера: 6.5" (1242×2688) и iPad 13". Порядок кадров — тот же, что
у читалки: первым идёт кадр, который объясняет главное обещание, а не главный
экран.

1. Точный размер: выбран бюджет 10 МБ и виден результат под лимитом
2. Форматы: строка «Конвертировать в» с раскрытым списком
3. Очередь: батч в работе, проценты и оставшееся время
4. Приватность: экран сетевого аудита с пустым списком каналов
5. Обработка: обрезка и кроп
6. Достижения или настройки с темами — как «живой» кадр

## App Name

```
Eluna Media: Video Converter
```

## Subtitle

```
Compress video, audio, photo
```

## Keywords

```
mp4,mp3,gif,heic,mov,mkv,webm,avi,wav,flac,m4a,webp,avif,shrink,reduce,size,trim,crop,batch,offline
```

## Promotional Text

```
Convert and compress on the phone itself. No account, no ads, no subscriptions, and no internet — the app has no networking at all.
```

## Description

```
Eluna Media converts and compresses video, audio and photos entirely on your iPhone. No account, no ads, no subscriptions, no watermarks — and no internet connection, because the app has no networking code in it at all. Your files never leave the device. Airplane mode changes nothing.

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
EXIF, GPS and timestamps are stripped from every result by default. A Network and privacy screen inside the app lists every network channel it has, which is none — and the system's own permission list will confirm it. Lock the app with a passcode or Face ID.

FREE, AND FREE MEANS FREE
Every feature is yours from the start, batch conversion included. There is no paid tier, no trial and no watermark. The only thing that can be bought is a tip, and it unlocks nothing.

ONE HONEST NOTE
iOS suspends apps that are not on screen, so a conversion pauses when you leave Eluna Media. Keep it open while a long job runs.

Free and open source. Support: support@eluna-apps.com
```

## What's New

```
First release on the App Store.

Eluna Media converts and compresses video, audio and photos on the device itself — no account, no ads, no subscriptions and no network access at all.

- Hit an exact file size: 10, 16, 25, 50, 100 MB or your own number
- Video, audio and photo formats including AV1, AVIF and animated WebP
- Batch queue that survives a restart
- Metadata stripped by default; passcode or Face ID lock
```
