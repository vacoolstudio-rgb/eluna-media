# Google Play store listing — master brief

Everything a localiser needs to write the Play listing for **Eluna Media** in
one language. The English listing in `fastlane/metadata/android/en-US/` is the
reference; this file says what may be claimed, how Play ranks it, and what Play
will reject.

## 1. The app in one paragraph

Eluna Media is an offline photo / video / audio converter and compressor for
Android and iOS, written in Flutter, with FFmpeg bundled inside the APK. Every
conversion runs on the device. The release build ships **without the `INTERNET`
permission**, so the app physically cannot upload anything — that is the single
strongest selling point in a category whose best-known alternatives are
upload-to-a-server web tools. It is free: no ads, no subscription, no paywalled
feature, no watermark, no export limit. The only purchase is a **tip**, which
unlocks nothing.

## 2. Hard facts

| | |
|---|---|
| Package | `com.eluna.media` |
| Version | 1.0.0, versionCode **7** → changelog file `changelogs/7.txt` |
| Min Android | 7.0 (API 24) |
| Price | Free |
| In-app purchases | Yes — consumable tips only (`tip_coffee_media`, `tip_snack_media`, `tip_generous_media`) |
| Ads | None |
| Accounts / login | None |
| Data collected | None. No analytics, no crash reporting, no identifiers |
| Permissions in release | notifications, foreground service (data sync / media processing), `WRITE_EXTERNAL_STORAGE` on API ≤ 28 only, `com.android.vending.BILLING`, `ACCESS_NETWORK_STATE`. **No `INTERNET`.** |
| Suggested category | Video Players & Editors (alternative: Tools) |
| Licence | GPL-3.0, because the bundled FFmpeg is `full-gpl` |

## 3. Truth list — what may be claimed

Claim only what is on this list. Do not invent features: no AI, no 4K upscaling,
no cloud sync, no editing timeline, no format that is not named here.

**Formats.** Video: MP4, MKV, MOV, WebM, AVI. Video codecs: H.264, H.265, AV1,
VP9, MPEG-4, and stream copy (remux without re-encoding). Audio: MP3, M4A
(AAC or ALAC), WAV, FLAC, OGG Vorbis, Opus; audio can be extracted from video.
Images: JPEG, PNG, WebP, AVIF, BMP, TIFF, animated GIF, animated WebP.

**Fit to size.** The user picks a byte budget (10 / 16 / 25 / 50 / 100 MB or a
custom number) and the bitrate is computed from the source duration with a
safety margin and a ceiling, so the output lands *under* the limit. Optional
two-pass mode is more precise and about twice as slow.

**Never inflates a file.** Both streams are capped at what the source itself
spent, so an already-compressed clip does not come back bigger. Can be switched
off deliberately.

**Batch queue.** Many files at once, per-file progress and time remaining, one
failure never kills the batch, retry with one tap, keeps running in the
background with progress in the notification, survives an app restart or
process death.

**Editing.** Trim to a range, rotate 90/180/270°, mirror, crop to 1:1 / 9:16 /
16:9 / 4:3, speed 0.25x–4x with audio kept in sync, volume 0–200%, merge several
clips even when codec / resolution / frame rate differ, keep subtitles on
MKV → MP4 / MOV / MKV.

**Hardware encoding** (MediaCodec) in bitrate and fit-to-size modes, discovered
at runtime, with an automatic software retry.

**Free up storage.** After saving results the app can ask Android to delete the
originals — the system dialog shows the real files and waits for approval.
Settings shows the total space reclaimed.

**Privacy.** EXIF / GPS / timestamps stripped by default. A Network & privacy
audit screen in Settings lists every network channel (there are none). App lock
with PIN and/or biometrics, plus a shade over the recents snapshot.

**Surface.** Simple mode (outcome cards, filtered by what is queued) and
Advanced mode (full codec controls). Accepts files shared from other apps.
Light / dark / OLED-black themes, accent picker, optional Material You, phone
and tablet layouts, 61 languages, 18 on-device achievements.

## 4. How Play ranking actually works — write for this

- Play has **no keyword field**. The index is built from the **title**, the
  **short description** and the **full description**, in that order of weight.
  Every keyword you want to rank for must appear in the text itself.
- The **title carries the most weight per character**. Brand plus the strongest
  category keyword, nothing else.
- The **short description** is both a ranking field and the line a user reads
  before tapping "read more". It has to rank *and* convert.
- In the full description, the **first two or three lines** are what a user
  actually reads. Put the promise there, not a feature dump.
- Repeat the main keyword naturally **four to six times** across the full
  description; more reads as stuffing and Play demotes it. A comma-separated
  keyword salad is the classic rejection.
- Cover the *real search phrases of that market*, not translations of English
  ones: people search "video compressor", "reduce video size", "video to mp3",
  "convert to mp4", "gif maker", "compress photo" — in their own words, and
  often in Latin script even in non-Latin languages.
- Numerals and format names (MP4, MP3, GIF, HEVC, WebP) stay in Latin script in
  every language.

## 5. Play policy — hard bans, these cause rejection

1. **No third-party brands or trademarks.** Never name WhatsApp, Discord,
   Telegram, Instagram, TikTok, YouTube, iPhone, or any competing app — not
   even as "works with". Say "10 MB", "25 MB", "a chat size limit", "vertical
   9:16" instead.
2. **No superlatives or rankings**: "best", "#1", "top", "fastest in the
   world", "must-have". No invented awards or Editor's Choice claims.
3. **No emoji, no ALL-CAPS words, no decorative symbols in the title.** Avoid
   emoji in the description too; this listing must read as a serious tool.
4. **No promotional or price text in the title**: no "Free", "Sale", "New".
5. **No misleading claims.** Everything on the truth list is verifiable;
   nothing else may be stated.
6. **No user testimonials, ratings or download counts** in the text.
7. **No calls to rate the app**, no "please give 5 stars".
8. **Do not mention other app stores** or sideloading.
9. Keep "no ads / no subscription / no watermark" as plain factual statements —
   they are true — and never phrase them as an attack on a named competitor.

## 6. Character limits — hard, counted in characters

| Field | File | Limit |
|---|---|---|
| Title | `title.txt` | **30** |
| Short description | `short_description.txt` | **80** |
| Full description | `full_description.txt` | **4000** |
| What's new | `changelogs/7.txt` | **500** |

Play counts characters, not bytes: a CJK character counts as one but carries
more meaning, so a Japanese or Chinese title should feel complete rather than
like compressed English. Aim for 85–100% of each limit; a 2000-character full
description ranks worse than a 3900-character one, and an under-used 80-char
short description wastes the second-heaviest ranking field in the store.

Never exceed a limit. Never end a file with a truncated word.

## 7. Terminology must match the app

The app is already translated into this language. Read
`lib/l10n/app_<arb>.arb` (the `arb` code for each listing is in
`store/play/locales.json`) and use **its** words for the features you describe:
whatever that file says for "Convert", "Queue", "Compress", "Quality", "Trim",
"Merge" must be the word the user then sees on screen.

If the ARB translation of a term is bad for search — a rare formal synonym where
the market actually searches for a common loanword — use the searchable word in
the listing **and report the mismatch**, so the ARB can be fixed later.

For Arabic, Hebrew, Persian and Urdu: natural RTL text, format names left in
Latin script, punctuation on the correct side.

## 8. Method for each language

1. Read the master listing in `fastlane/metadata/android/en-US/`.
2. Read `lib/l10n/app_<arb>.arb` for the app's own terminology.
3. Research the market: which words this audience types when they want to
   shrink a video for a chat app, turn a video into MP3, or change a photo to
   JPEG; whether loanwords or native terms dominate; what converter listings in
   that language put in their titles. Use web search where it is available, and
   native knowledge of the language where it is not.
4. Write the four files. **Localise, do not translate.** The English structure
   is a starting point, not a template: if the market responds to something
   else first, lead with it.
5. Verify every character count before finishing.

## 9. Deliverables

```
fastlane/metadata/android/<play-locale>/
  title.txt
  short_description.txt
  full_description.txt
  changelogs/7.txt
```

Plain UTF-8, no BOM, no trailing blank line, no Markdown syntax — Play renders
the full description as plain text with line breaks, so `•` bullets and blank
lines between blocks are fine, `#` and `**` are not.
