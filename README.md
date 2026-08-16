# Eluna Media

Offline photo / video / audio converter for Android and iOS, built with
Flutter. Every conversion runs on the device through a bundled FFmpeg build;
files never leave the phone. Nothing in the app touches the network — the
release build does not even hold the `INTERNET` permission. Free, with no ads
and no subscriptions; the one in-app purchase is a **tip**, which unlocks
nothing and is carried out by the Play Store app rather than by this one.

Product docs: `docs/REQUIREMENTS.md` (что и почему) and
`docs/IMPLEMENTATION_PLAN.md` (как, по этапам). Both are grounded in a
competitor/review analysis from July 2026.

**`docs/IOS.md` — read this before touching iOS.** Every line of iOS code here
was written without a Mac. On 16 August 2026 it was compiled and run for the
first time, on an iPhone 17 Pro Max simulator: it built unchanged, and all 165
integration tests passed. That document now says what the simulator proved,
what it could not prove, and what is left — a real device above all.

## What works

### Converting
- **Video** — MP4, MKV, MOV, WebM, AVI. Encoders: H.264, H.265 (tagged `hvc1`
  for Apple players), AV1 (`libaom`, driven by `-cpu-used` rather than
  `-preset`), VP9, MPEG-4, or stream copy (remux without re-encoding). AV1 is
  offered but never the default: it is the better codec and the worse default —
  an order of magnitude slower, and older players cannot open it. It is absent
  from MOV on purpose, because QuickTime will not read it there.
- **Audio** — MP3, M4A (AAC, or ALAC for lossless), WAV, FLAC, OGG Vorbis,
  Opus. Extracts from video.
- **Images** — JPEG, PNG, WebP (lossy and lossless), AVIF (AV1 stills, roughly
  half a JPEG at the same quality), BMP, TIFF, animated GIF built with a
  `palettegen`/`paletteuse` graph, and animated WebP — the same motion as a GIF
  at a fraction of the bytes, because it is a real video codec instead of a
  palette per frame.
- **Every codec the bundle's contents are not obvious about is confirmed at
  runtime.** `EncoderCatalog` asks the binary (`ffmpeg -encoders`) once and
  caches the answer; AV1, AVIF and animated WebP stay out of the pickers until
  it comes back. The app spent its first year believing this build had no AV1
  encoder while `libaom` sat in `libavcodec.so` the whole time — a probe cannot
  make that mistake twice.
- **Fit to size** — pick a byte budget (Discord 10 MB, WhatsApp 16 MB, Email
  25 MB, 50/100 MB, or custom) and the bitrate is computed from the source
  duration with a 7% safety margin plus `maxrate`/`bufsize` pinning, so the
  output actually lands *under* the limit. Falls back to CRF when duration is unknown or the target
  is physically unreachable (and says so in the UI).
- **A conversion never inflates the file.** Constant quality has no ceiling of
  its own, so an already-efficient source (anything that has been through a
  messenger) used to come out *larger*. Both streams are now held to what the
  source itself spent: the picture gets a `maxrate` at 85% of the source's own
  video rate, and the audio is never re-encoded upward (a 64 kbps voice track
  does not become a 128 kbps one). The ceiling is never allowed above the
  source — a device test caught an earlier version doing exactly that. Toggle
  it off in Advanced to deliberately encode *up*.

  **Known hole, measured:** below roughly 10 kbps of video the promise stops
  holding. 85 % of 6 kbps is a ceiling x264 physically cannot meet at 640×480 —
  per-frame overhead alone costs more — so the cap is computed, ignored by the
  encoder, and the file grows by about a percent. Nothing in the argument
  builder can fix that; the honest fix is for the app to keep the original when
  a re-encode comes out bigger. From 11 kbps upward the cap bites as intended:
  a 200 kbps source shrinks 5 % with it and grows 62 % without.
  `integration_test/no_growth_test.dart` carries the numbers.
- Constant-quality (CRF) or target-bitrate rate control, resolution and frame
  rate presets, encoder speed presets, trimming (single file, range slider).
- **Hardware encoding** (MediaCodec / VideoToolbox) in bitrate and fit-to-size
  modes — discovered at runtime by asking the bundled FFmpeg what it has, so
  the toggle can never select an encoder that isn't there. A failed hardware
  job retries on the software encoder automatically; CRF mode always uses
  software, because hardware encoders take a bitrate, not a quality target.
- **Transforms** — rotate 90/180/270°, mirror, centre crop to 1:1 / 9:16 /
  16:9 / 4:3 (feeds and stories), audio volume 0–200%, playback speed
  0.25–4× (video `setpts` + chained audio `atempo`, kept in sync; all
  disabled during remux).
- **Subtitle preservation** — MKV→MP4/MOV converts text subs to `mov_text`,
  MKV→MKV copies them. Off by default; explicit stream maps only when on.
- **Merge videos** — the concat *filter* (not the demuxer), so mismatched
  codecs/resolutions/frame rates are fine: every clip is letterboxed onto a
  common canvas and re-encoded. A Simple-mode preset; needs 2+ files.
- **Two-pass fit-to-size** (opt-in setting) — an analysis pass plus the real
  encode hit the byte budget noticeably more precisely, at roughly double the
  time. Both passes budget for the audio track, so they aim at one number.
- EXIF/GPS/timestamp stripping, **on by default**.

### The queue
- **Two tabs: Active and Finished.** A running batch and yesterday's results
  answer different questions ("what is happening" vs "where is my file"), and
  the app lands on the results as soon as a batch ends.
- Every pending job carries the profile it will *actually* be converted with —
  the queue is re-stamped whenever a control changes, so a photo can never sit
  there claiming it is about to become an MP4 (it used to inherit the stored
  video profile).
- Batch queue with per-file progress, cancellation, per-file failure isolation
  (one bad file never kills the batch), and a completion notice.
- **The queue survives a restart**, and a batch the process death interrupted
  resumes by itself on the next launch.
- **Background conversion on Android**: a foreground service keeps the batch
  running when the app is backgrounded, with live progress in its notification.
- **Retry** on failed/cancelled jobs — restarts immediately, not "when the
  user finds the button".
- **Percentage, time remaining and a settings summary on every job.** A dial
  shows the percentage, the estimate extrapolates from elapsed time against
  the *encoded* duration (trim and speed included), and "Details" reprints the
  exact profile the job is running with — because an hour later nobody
  remembers what they picked.
- **Open** hands the finished file to the system player/viewer; **Save** puts
  it where people look (gallery album "Eluna Media" via `gal`; audio into
  public Downloads via MediaStore) and the confirmation offers to open the
  file or the folder.
- **Rename the result** before it is encoded. The extension is not editable —
  it follows the output format — and a blank name goes back to naming the
  result after the source. Queued jobs only: once the file exists, and with
  auto-save on a copy of it is already in the gallery, "rename" would either
  lie about the saved copy or start a second export.
- **Delete the originals** once the results are saved — the other half of
  "compress to free space", which otherwise leaves the user paying for both
  copies. The app unlinks nothing itself: Android raises
  `MediaStore.createDeleteRequest` and iOS raises `PHPhotoLibrary`, both of
  which show the real items and wait for approval. Offered as a button on the
  Finished tab, or automatically after a batch if the setting is on (off by
  default). Settings keeps a running total of the space it has freed.
- Undo snackbars for "remove job" and "clear finished".

### Product surface
- **Simple / Advanced modes.** Simple is outcome-first preset cards, and it
  only ever shows the presets that fit **what is actually queued**: add
  photos and the video presets disappear, with "Compress photo" selected for
  you. Advanced is the full codec control surface. The toggle persists.
- **Explicit output format.** A "Convert to" row lists every container the
  source can legally become — video → video / GIF / audio-extraction, photo →
  photo, audio → audio — with the recommended one starred and selected. AVI →
  MP4 (or the reverse) is two taps, and an MP3 can no longer be told to become
  a JPEG, which the old all-formats dropdown allowed.
- **Mixed selections convert correctly.** Photos and videos in one batch each
  get the right profile for their own kind, rather than one preset being
  forced onto both.
- **The file list is real**: name, kind, size, duration, and a per-file remove
  button, instead of a bare count.
- **Thumbnailed pickers**: the primary button opens the platform photo/video
  picker (thumbnails, newest first); a secondary button opens the document
  picker for audio and anything exotic.
- **Files from other apps**: Android takes "Share → Eluna Media" and "Open
  with" (SEND/SEND_MULTIPLE/VIEW, multi-file included); iOS takes "Open with"
  via registered document types. Both native sides copy the incoming file off
  the main thread and buffer it across a cold start, then hand it to the same
  method channel. (The iOS *share sheet* would additionally need a share
  extension target — that is the one piece still missing.)
- First-run **privacy intro** (three promises, one line on what the app costs)
  and a **Network & privacy audit screen** in Settings listing every network
  channel — for this app, none at all, which the system's own permission list
  will confirm, plus the two permissions the tip jar brings and what they can
  and cannot do.
- **App lock** — a PIN (PBKDF2 hash with an escalating lockout, never the code
  itself) and/or biometrics, either one valid alone. The shade goes up when the
  app is paused, so the recents snapshot shows it instead of the queue, and it
  comes down by itself if the app was away for less than 30 seconds. That grace
  is deliberate: the system file picker, the share sheet and the delete-originals
  dialog are all other people's activities, and a converter visits them a dozen
  times a session — without it the PIN would be asked after every file pick.
- **More from us** — the family catalogue, with the app you are in filtered out.
- **Power mode** (Settings): Cool & fast / Balanced / Max compression — maps
  1:1 onto the x264/x265 `-preset` flag (`ultrafast`/`veryfast`/`medium`).
  Nothing else is throttled, ever. A low-battery confirmation dialog appears
  before starting a batch below 20% unplugged.
- In-app review follows store policy per platform: milestones (day 7+, ≥2
  successful conversions, once a day, never after rating) gate *when* it is
  asked, and then **iOS** gets Apple's native prompt only — guideline 5.6.1
  forbids pre-screening — while **Android** gets a star sheet where 5★ opens
  the Play review and anything less opens an e-mail the user writes themselves.
  Nothing is transmitted by the app either way.
- Haptic feedback on batch start/success/failure (toggleable).
- **Achievements** — 18 of them, common to a platinum capstone, counted
  entirely on-device (the screen says so): conversion counts, storage saved,
  batch sizes, first GIF, first exact-size hit, night owl. The shelf has three
  tabs (all / unlocked / locked), a progress header broken down by rarity, and
  a hex medal per card whose finish is the rarity. Tapping any card — earned or
  not — opens a detail sheet that shares it as a picture; an unfinished one
  shares its progress, which is the only reason the sheet is worth having on
  day one. Earning one is celebrated with confetti and a single haptic thump
  (through the app's own haptics switch), where it used to be a snackbar in the
  same voice the app says "file saved" in. Which achievements exist and what
  they are called is Media's; the rarity, the medal, the progress maths and
  every word on the screen but their names come from `eluna_shared`, so the
  shelf reads identically in Eluna Screen.
- **What's-new dialog** once per version — shown only to people who actually
  used the previous version, never on a fresh install's first minute.
- **The Eluna design language**, shared with the other apps in the family:
  hand-authored violet color schemes (no `ColorScheme.fromSeed`), the Manrope
  variable font, an ambient gradient canvas with brand glows behind every
  transparent scaffold, accent-tinted translucent section cards (one hue per
  domain — video violet, audio blue, photo amber, privacy green), a frosted
  glass navigation bar, gradient CTAs with a violet glow, press-to-shrink
  feedback on everything tappable, and a swept-gradient progress dial.
  None of it lives here any more: the theme, the font and the shared widgets
  come from the `eluna_shared` package, and `lib/ui/widgets/` keeps only what
  belongs to the converter itself.
- Themes: system/light/dark, an **accent row**, an **OLED true-black** variant
  and optional **Material You** — all of it on the package's own appearance
  screen, which Settings links to with a row that names what is on. The app
  keeps no theme switches of its own: it hands the wallpaper accent to
  `ElunaThemeController` at startup and reads the result back. **15 languages**
  (en, ru, de, es, fr, it,
  pt, tr, pl, uk, hi, id, ja, ko, zh — full key parity, native plural
  rules), phone and tablet layouts, checked at 320dp and 1.5× text scale.
- Release builds render a calm bilingual fallback instead of the grey error
  rectangle; errors are logged locally only.

### Monetization
Nothing is sold. No ads, no subscriptions, no feature paywalls, no watermarks;
batch conversion is free like everything else. The single purchase in the app
is a **tip** — consumable, repeatable, and it unlocks nothing. There is no
entitlement, no "owned" state and no restore, because restoring a thank-you is
not a coherent idea.

The app shipped an AdMob banner and a one-time "remove ads" purchase through
v0.4.0. Both were removed outright: the banner was the last thing in the
process that needed the network *and* the last closed-source binary sitting
next to GPL code (see `NOTICE.md`). What is left is an app that cannot phone
home even if it wanted to — `android/app/src/release/AndroidManifest.xml`
strips the `INTERNET` permission with `tools:node="remove"`, so a dependency
cannot merge it back in unnoticed. Debug and profile builds keep it; the
Flutter tool needs it for hot reload.

The tip jar (1.0.0) does not undo that, and the merged release manifest is the
proof: **no `INTERNET`**. Play Billing talks to the Play Store app over IPC and
that app does the networking. It does add `com.android.vending.BILLING` and
`ACCESS_NETWORK_STATE`, and the in-app network audit screen names both rather
than letting a curious user find them in the system's permission list first.

Two things about it are open questions for the owner rather than settled facts:

1. **Play Billing is a closed-source library inside a GPL-v3 app.** That is the
   same objection that removed AdMob — the GPL comes from the bundled `full-gpl`
   FFmpeg and covers the whole binary. It is a smaller surface (no ad SDK, no
   identifiers, no network in-process) but it is the same class of problem, and
   `NOTICE.md` records the reasoning either way.
2. **The products must exist in the Play Console** (`tip_coffee`, `tip_snack`,
   `tip_generous`, all *consumable*). Until they do, the store returns an empty
   list and the screen honestly shows nothing to buy.

## Architecture

```
lib/
  domain/     media_format.dart      containers, codecs, compatibility tables
              conversion_settings.dart   + rotate/flip/speed/subtitles/size target
              conversion_job.dart
              quick_presets.dart     Simple-mode outcome presets
  core/       ffmpeg_args.dart       settings -> FFmpeg argument vector (pure)
              rate_calc.dart         fit-to-size bitrate maths (pure)
              converter.dart         FFmpegKit session -> awaitable + progress
              output_paths.dart      collision-free output naming
              queue_storage.dart
  state/      settings_controller.dart   conversion profile + app prefs
              app_meta_controller.dart   install date, successes, intro
              queue_controller.dart      serial batch runner
              logging/               error handlers over the package's logger
              platform/              adapters the package cannot implement
  services/   media_saver.dart       gallery/Downloads export
              original_media.dart    system-confirmed source deletion
              share_intake.dart      inbound share channel
              thumbnails.dart        device_storage.dart      file_opener.dart
              haptics.dart           foreground_service.dart  notification_service.dart
  ui/         convert_tab (simple/advanced), queue_tab, settings_tab,
              home_shell, privacy_intro_screen, network_privacy_screen,
              achievements_screen, compare_screen, support_screen,
              error_screen, widgets/ (converter-specific only)
  l10n/       app_en.arb + 14 more
```

What is *not* in this tree is the point of the last few releases: the theme,
the design system, the font, the licences and language screens, the rating
prompt, the crash log and "delete all my data" all come from `eluna_shared`.
`services/review_service.dart` and `ui/theme.dart` used to be here and are
gone, not moved.

Decisions worth knowing about (the older ones are unchanged and still true):

**One engine, not two.** Images go through FFmpeg alongside video: one code
path, one progress mechanism, one set of format rules.

**Argument vectors, not command strings.** `FFmpegArgs.build` returns a
`List<String>`; no shell is involved, so paths need no escaping.

**Compatibility is data, not error handling.** `ContainerRules` encodes which
codecs each container may hold; the UI only ever offers legal pairs, and the
Simple presets are tested against those tables.

**The queue runs one job at a time.** FFmpeg already saturates the cores per
job; concurrency would buy nothing and cost thermal headroom — battery drain
is a top-5 complaint against competitor converters.

**Fit-to-size is arithmetic, not magic.** `RateCalc` divides a byte budget by
the *encoded* duration (trim and speed change it), hands 93% of it to the
encoders, and refuses targets below 100 kbps of video — a refusal shown in
the UI up front rather than a smeared output delivered late.

**Progress is throttled at the source, and cards repaint alone.** FFmpeg
reports statistics several times a second; `FFmpegConverter` publishes only a
≥1% move (or a half-second of silence), and the queue list watches an id list
while each card watches its own job through `jobProvider(id)`. A tick on the
running file therefore repaints one card, not the list.

**The persisted queue is repaired, not merely reloaded** — unchanged; see
`QueueStorage.restore`. Auto-resume still turns on a flag, not a heuristic,
and the foreground service still holds the process rather than hosting work.

## Verification

`flutter test` — 148 host tests: everything from before (argument builder,
container matrix, output paths, foreground service, queue storage/restore,
auto-resume, 320dp layouts in both locales) plus the fit-to-size maths, the
new argument features (target size, transforms, crop, volume, atempo
chaining, hardware-encoder branch selection, subtitles, JSON migration),
preset legality against `ContainerRules`, the review milestone
rules, the achievements catalogue (thresholds, platinum), concat-graph
construction, the merge job model, and both two-pass argument sets.

`flutter test integration_test/...` — device suites for real conversions, the
foreground service, and queue persistence. `no_growth_test.dart` is the one to
know about: it synthesises a deliberately *already-compressed* clip, converts
it for real, and asserts the bytes on disk did not grow. It is there because
it caught two versions of the fix that looked right and were not — the second
capped a 25 kbps picture at a "sane minimum" of 32 kbps, which is not a cap at
all. Host tests could not have found that.

`flutter analyze` — clean.

Manual checks worth repeating on device: share a video from the gallery into
the app (cold and warm), convert with a 10 MB target and verify the output is
under 10 MB, save a video to the gallery and an MP3 to Downloads, and open the
system app info to confirm the release build lists no permissions beyond
notifications, the foreground service, legacy storage, biometrics and the two
that billing brings — no internet.

**Check the merged release manifest after touching dependencies**, not the
source one:

```
flutter build apk --release --split-per-abi
grep uses-permission build/app/intermediates/merged_manifest/release/*/AndroidManifest.xml
```

`INTERNET` appearing there means a dependency merged it back in and the app's
central promise is broken; that is a release blocker, not a note. The list as of
1.0.0: notifications, foreground service (+ data sync, media processing),
read/write external storage, read media images/video/audio, vibrate, biometrics
(`USE_BIOMETRIC`, `USE_FINGERPRINT`, from the app lock), `com.android.vending.BILLING`
and `ACCESS_NETWORK_STATE` (both from Play Billing — the latter only reads
whether a connection exists; it does not grant one).

## Building

```
flutter pub get
flutter gen-l10n
flutter build apk --release --split-per-abi
```

Requirements: Android `minSdk` 24, NDK 27, core library desugaring; iOS
deployment target 14.0.

**Before a store release**: add release signing. That is the whole list —
there are no ad ids to swap and no billing to wire, because there is neither.

## Licensing

Full text in `LICENSE`; the component table is in `NOTICE.md`.

`ffmpeg_kit_flutter_new` bundles the **full-gpl** FFmpeg build (x264, x265),
so the application as a whole is **GPL v3**: shipping it means publishing its
source. This trade-off is forced by H.264/H.265 encoding being the core
feature. Every other dependency is free, open-source and paid-license-free.

The one real GPL conflict was the Google Mobile Ads SDK — a closed-source
binary linked into the same process as x264/x265, which GPL v3 does not permit
distributing. It is gone (see "Monetization"), so the licence position is now
plain: GPL v3 in, GPL v3 out, F-Droid included, nothing to argue.

## Not in this build

- **The iOS share sheet** as a *destination* ("Share → Eluna Media" from
  Photos). It needs a share-extension target, which cannot be added or built
  on a Windows host. iOS "Open with" works (document types + AppDelegate), and
  the Swift side is written but has not been exercised on a device from here —
  verify it on a Mac.
- **Background execution on iOS** — the OS gives no equivalent of a foreground
  service; `ForegroundService` is a deliberate no-op there.
- **Deleting originals on iOS has not been run on a device** — no Mac here.
  The Swift side is written against `PHPhotoLibrary` and fails closed: every
  path that is not a confirmed deletion reports zero deleted, so the worst
  outcome is the button doing nothing. Android is the tested path. Note also
  that iOS matches library items by original filename alone (`PHAsset` does
  not publish file size, and the ways to read it are private API), where
  Android matches on name *and* exact byte count.
- **HEIC output** — needs `libheif`, which this build genuinely does not carry,
  so it would take a custom FFmpeg. Confirmed on a device: there is no `heif`
  muxer at all, and forcing a `.heic` filename just writes an MP4. (AV1 output
  used to be listed here on the same grounds and the grounds were wrong:
  `libaom` was in the bundle all along, and AV1, AVIF and animated WebP shipped
  in 0.5.0.)
- ~~**Reading a *tiled* HEIC on Android.**~~ **Closed 16 August 2026 — on both
  platforms.** Kept here because the defect is worth knowing about and the entry
  is what the fix is measured against.

  A real HEIC written by Apple's own encoder lives in
  `integration_test/fixtures.dart`. On it, FFmpeg decoded **one 512×512 tile
  instead of the assembled 1024×768 frame** — an iPhone stores photos exactly
  that way, so a snapshot converted to its top-left corner and the job reported
  success. Not an error anyone could see: a quietly wrong result.

  It is not a missing-FFmpeg problem. The demuxer parses the grid and announces
  the true size (`Stream group #0:0: Tile Grid: hevc, 1024x768`); only the CLI's
  stitching is absent, so the default mapping, `-map 0:g:0` and `-map 0:v` all
  hand over a single tile. **iOS now sidesteps it entirely**: `StillDecoder`
  asks the platform to decode HEIC through ImageIO into a full-resolution PNG,
  and FFmpeg gets an ordinary picture — which also settles EXIF orientation and
  colour space for free. `docs/IOS.md` §8 has the measurements and the
  alternative that was rejected.

  **Android now does the same** through `ImageDecoder` (`MainActivity.decodeStill`)
  — the platform decoder, not `BitmapFactory`, which cannot read HEIF before
  API 30 and honours EXIF orientation nowhere, and so would have traded a
  cropped photo for a sideways one. Verified rather than assumed: on an API 36
  emulator `conversion_matrix_test.dart` now prints
  `HEIC grid: исходник 1024×768, получилось 1024×768` where it used to report
  the single 512×512 tile. Below API 28 the method returns false and the old behaviour stands —
  the system has no HEIF decoder there to borrow.

  This entry stood open for months for one reason worth recording: there was no
  Android SDK on the machine, and writing the twenty lines blind is what had
  already produced a year of wrong claims elsewhere in this file. The SDK is
  installed now, and every `integration_test/` suite has been run on Android.

  APE is still unproven for the older reason: FFmpeg has never had an encoder
  for it, so there is nothing to synthesise a fixture with.
- **Reverse playback** — FFmpeg's `reverse` buffers the whole clip in RAM,
  which on phones means OOM crashes on real-world videos; crashes on large
  files are the category's #6 complaint, so the feature is omitted rather
  than shipped booby-trapped.
- AI upscaling / denoise, in-app preview.
- **A monochrome layer for Android 13+ themed icons.** The nine launcher icons
  are detailed 3D renders, and a silhouette derived from one automatically reads
  as a blob — this needs a drawn single-colour layer, not a filter over the
  artwork. Everything else about the icons is in place: adaptive layers, nine
  alternates, and a picker.
- Resolution presets larger than the source will upscale rather than clamp.
