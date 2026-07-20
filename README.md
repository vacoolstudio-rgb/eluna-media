# Eluna Media

Offline photo / video / audio converter for Android and iOS, built with
Flutter. Every conversion runs on the device through a bundled FFmpeg build;
files never leave the phone. The only thing in the app that touches the
network is a single non-personalized ad banner — and it never loads while a
conversion is running.

Product docs: `docs/REQUIREMENTS.md` (что и почему) and
`docs/IMPLEMENTATION_PLAN.md` (как, по этапам). Both are grounded in a
competitor/review analysis from July 2026.

## What works

### Converting
- **Video** — MP4, MKV, MOV, WebM, AVI. Encoders: H.264, H.265 (tagged `hvc1`
  for Apple players), VP9, MPEG-4, or stream copy (remux without re-encoding).
- **Audio** — MP3, M4A/AAC, WAV, FLAC, OGG Vorbis, Opus. Extracts from video.
- **Images** — JPEG, PNG, WebP (lossy and lossless), BMP, TIFF, and animated
  GIF built with a `palettegen`/`paletteuse` graph.
- **Fit to size** — pick a byte budget (Discord 10 MB, Email 25 MB, 50/100 MB,
  or custom) and the bitrate is computed from the source duration with a 7%
  safety margin plus `maxrate`/`bufsize` pinning, so the output actually lands
  *under* the limit. Falls back to CRF when duration is unknown or the target
  is physically unreachable (and says so in the UI).
- **A conversion never inflates the file.** Constant quality has no ceiling of
  its own, so an already-efficient source (anything that has been through a
  messenger) used to come out *larger*. Both streams are now held to what the
  source itself spent: the picture gets a `maxrate` at 85% of the source's own
  video rate, and the audio is never re-encoded upward (a 64 kbps voice track
  does not become a 128 kbps one). The ceiling is never allowed above the
  source — a device test caught an earlier version doing exactly that. Toggle
  it off in Advanced to deliberately encode *up*.
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
- First-run **privacy intro** (three promises, one honest sentence about the
  banner) and a **Network & privacy audit screen** in Settings listing every
  network channel — for this app, exactly one.
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
- **Achievements** — 18 of them, bronze to a platinum capstone, counted
  entirely on-device (the screen says so): conversion counts, storage saved,
  batch sizes, first GIF, first exact-size hit, night owl. One quiet snackbar
  per batch, never a popup. `Achievement.evaluate` is pure and unit-tested.
- **What's-new dialog** once per version — shown only to people who actually
  used the previous version, never on a fresh install's first minute.
- **The Eluna design language**, shared with the other apps in the family:
  hand-authored violet color schemes (no `ColorScheme.fromSeed`), the Manrope
  variable font, an ambient gradient canvas with brand glows behind every
  transparent scaffold, accent-tinted translucent section cards (one hue per
  domain — video violet, audio blue, photo amber, privacy green), a frosted
  glass navigation bar, gradient CTAs with a violet glow, press-to-shrink
  feedback on everything tappable, and a swept-gradient progress dial.
  See `lib/ui/theme.dart` and `lib/ui/widgets/`.
- Themes: system/light/dark, **OLED true-black** variant, optional
  **Material You** dynamic color. **15 languages** (en, ru, de, es, fr, it,
  pt, tr, pl, uk, hi, id, ja, ko, zh — full key parity, native plural
  rules), phone and tablet layouts, checked at 320dp and 1.5× text scale.
- Release builds render a calm bilingual fallback instead of the grey error
  rectangle; errors are logged locally only.

### Monetization (test mode)
- **One anchored adaptive AdMob banner.** Google's published *test* ids are
  wired in (`AndroidManifest.xml`, `Info.plist`, `lib/services/ads/ad_config.dart`);
  swap them for real ones at release. Requests are
  `nonPersonalizedAds: true`, so no consent wall is needed.
- The banner is gated by pure logic (`ad_gate.dart`, host-tested): hidden for
  Pro, hidden for the first **14 days** after install, hidden while the queue
  runs, collapsed (zero height) when a load fails, refreshed at most every
  2 minutes and only on foreground. The SDK is not even initialized until the
  first allowed load.
- **"Remove ads"** is a one-time purchase behind `PurchaseService` — currently
  a stub that succeeds in debug builds; wire `in_app_purchase` at release by
  swapping one provider. No subscriptions, no feature paywalls, no watermarks,
  batch is free: family principles, non-negotiable.

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
              app_meta_controller.dart   install date, successes, pro, intro
              queue_controller.dart      serial batch runner
  services/   ads/                   ad_config, ad_gate (pure), banner_slot
              purchases/             PurchaseService interface + stub
              review_service.dart    milestone logic (pure) + native prompt
              media_saver.dart       gallery/Downloads export
              share_intake.dart      inbound share channel
              haptics.dart           foreground_service.dart  notification_service.dart
  ui/         convert_tab (simple/advanced), queue_tab, settings_tab,
              home_shell, privacy_intro_screen, network_privacy_screen,
              remove_ads_sheet, error_screen, theme
  l10n/       app_en.arb, app_ru.arb
```

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

**Ads are governed by one pure function.** `shouldShowBanner` is the single
authority; the widget only renders what the gate allows. The gate's rules are
unit-tested next to the review-prompt rules in `monetization_rules_test.dart`.

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
preset legality against `ContainerRules`, the ad gate, the review milestone
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
under 10 MB, save a video to the gallery and an MP3 to Downloads, and watch
the banner disappear the moment a batch starts (test ids show Google's sample
banner).

## Building

```
flutter pub get
flutter gen-l10n
flutter build apk --release --split-per-abi
```

Requirements: Android `minSdk` 24, NDK 27, core library desugaring; iOS
deployment target 14.0.

**Before a store release** (deliberately not done in test mode):
1. Replace the AdMob application ids in `AndroidManifest.xml` / `Info.plist`
   and the banner unit ids in `lib/services/ads/ad_config.dart`.
2. Swap `StubPurchaseService` for an `in_app_purchase` implementation and
   register the one-time "remove ads" product in both stores.
3. Add release signing.

## Licensing

Full text in `LICENSE`; the component table and the open question below are in
`NOTICE.md`.

`ffmpeg_kit_flutter_new` bundles the **full-gpl** FFmpeg build (x264, x265),
so the application as a whole is **GPL v3**: shipping it means publishing its
source. This trade-off is forced by H.264/H.265 encoding being the core
feature. All other dependencies are free, open-source, and paid-license-free
(a family principle — hence no RevenueCat; billing goes through the free
`in_app_purchase` when wired).

**Open decision before release — GPL vs. the ads SDK.** The `google_mobile_ads`
*plugin* is Apache-2.0, but it links Google's closed-source Mobile Ads SDK
into the same process as GPL code (x264/x265), which GPL v3 does not permit
for distribution, and nobody can grant an exception on x264's behalf. The
audited options: ship the store build as-is and accept the (industry-common)
compliance risk; or publish an **ad-free FOSS flavor** (F-Droid) where GPL is
clean and keep the banner only in the store flavor — the practical middle
ground; or drop ads entirely. This is the owner's call at release time; the
code isolates ads behind `services/ads/` either way, so a no-ads flavor is a
one-provider change.

## Not in this build

- **Real ad unit ids and real billing** — test ids and a stub on purpose; see
  "Before a store release".
- **The iOS share sheet** as a *destination* ("Share → Eluna Media" from
  Photos). It needs a share-extension target, which cannot be added or built
  on a Windows host. iOS "Open with" works (document types + AppDelegate), and
  the Swift side is written but has not been exercised on a device from here —
  verify it on a Mac.
- **Background execution on iOS** — the OS gives no equivalent of a foreground
  service; `ForegroundService` is a deliberate no-op there.
- **AV1 output** (decoder only in the bundle) and **HEIC** (needs `libheif`,
  not bundled). Both need a custom FFmpeg build.
- **Reverse playback** — FFmpeg's `reverse` buffers the whole clip in RAM,
  which on phones means OOM crashes on real-world videos; crashes on large
  files are the category's #6 complaint, so the feature is omitted rather
  than shipped booby-trapped.
- AI upscaling / denoise, in-app preview.
- Alternative app icons — the switching plumbing is straightforward, but it
  needs designed icon assets; wire it when those exist.
- Resolution presets larger than the source will upscale rather than clamp.
