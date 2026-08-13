# Building a slimmer FFmpeg for Eluna Media

The app currently ships `ffmpeg-kit` **full-gpl 2.2.1** (FFmpeg 8.1.2), whose
configuration was read straight out of the shipped `libavutil.so`:

```
--enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-gmp
--enable-gnutls --enable-libmp3lame --enable-libass --enable-iconv
--enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp
--enable-libxml2 --enable-libopencore-amrnb --enable-libshine --enable-libspeex
--enable-libdav1d --enable-libkvazaar --enable-libx264 --enable-libxvid
--enable-libx265 --enable-libvidstab --enable-librubberband --enable-libilbc
--enable-libopus --enable-libsnappy --enable-libsoxr --enable-libaom
--enable-chromaprint --enable-libtwolame --enable-libtesseract
--enable-libopenh264 --enable-libvo-amrwbenc --enable-libzimg --enable-libsrt
--enable-libharfbuzz --enable-zlib --enable-mediacodec --enable-gpl
```

That is 37 external libraries. The app calls **eight** of them.

Measured cost of the current build, per architecture:

| | arm64-v8a |
|---|---|
| APK (split per ABI) | 64.4 MB |
| of which FFmpeg + `libc++_shared` | 41.7 MB on disk, 20.4 MB compressed |
| Play download | ~32 MB |

("Compressed" is what a Play delivery actually costs: the native libraries are
stored uncompressed in the APK — `extractNativeLibs=false` — so the APK figure
and the download figure are legitimately different numbers.)

## What the app actually needs

Derived from the code, not from guesswork.

**Encoders it names** — `lib/domain/media_format.dart`, `lib/core/ffmpeg_args.dart`:

| Encoder | Provided by | Needed for |
|---|---|---|
| `libx264` | x264 (GPL) | every MP4/MOV/MKV/AVI video target |
| `libx265` | x265 (GPL) | HEVC target |
| `libvpx-vp9` | libvpx | WebM target |
| `libmp3lame` | LAME | MP3 target — FFmpeg has **no** native MP3 encoder |
| `libopus` | Opus | Opus target, WebM audio |
| `libvorbis` | libvorbis | OGG target, WebM audio |
| `libwebp` | libwebp | WebP image target |
| `mpeg4`, `aac`, `flac`, `pcm_s16le`, `mjpeg`, `png`, `tiff`, `bmp`, `gif`, `mov_text` | FFmpeg native | the rest |

**Decoders it must keep.** Everything, plus specifically `dav1d` — it is what
decodes AV1 and AVIF, and `ContainerFormat.kindOfFile` accepts `.avif`. HEIC and
HEIF still images are expected to decode through the mov demuxer plus the
*native* HEVC decoder; the shipped `libavformat` lists `avif,heic,heif` among
the mov demuxer's extensions, so no libheif should be needed to read them.
libheif would only be needed to **write** HEIC.

That last claim rests on a string found in the binary, not on a file that ever
went through: the build cannot write a HEIC, so no test can make one to read.
The doubtful part is the *tiled grid* an iPhone stores its photos as, which is
what reading HEIC mostly means in practice. See step 4 of the verification pass.

**What the shipped binary actually is** (2026-08-13, read off the device rather
than inferred): `ffmpeg version n8.1.2`, built with `--enable-mediacodec
--enable-gpl` and, among others, `libx264 libx265 libvpx libaom libdav1d
libmp3lame libopus libvorbis libwebp libopencore-amrnb libvo-amrwbenc libass
libvidstab librubberband libsoxr`. **No libheif**, which settles HEIC output.
`integration_test/encoder_inventory_test.dart` prints the whole banner and
configure line on every run, so this never has to be guessed again — and the
last two entries above are capabilities the app does not use yet (see
`FEATURE_AUDIT.md`).

**Filters it uses** — all native, none from an external library:
`anullsrc atempo aformat atrim concat crop eq fps hqdn3d normalize pad
palettegen paletteuse scale setpts setsar split transpose unsharp volume hflip
vflip`.

**Hardware encoding**: `mediacodec` (see `lib/core/encoders.dart`).

## The build

`android.sh` enables **nothing** by default — every external library is opt-in —
so the recipe is exactly the keep-list:

```bash
./android.sh --lts \
  --enable-gpl \
  --enable-x264 \
  --enable-x265 \
  --enable-libvpx \
  --enable-lame \
  --enable-opus \
  --enable-libvorbis \
  --enable-libwebp \
  --enable-dav1d \
  --enable-android-media-codec \
  --enable-android-zlib
```

`--lts` is required: it targets API 24, which is the app's `minSdk`.

Requires Linux or macOS — the scripts are bash and need autotools, cmake,
pkg-config, nasm/yasm and the Android NDK. On Windows this means WSL.

### What is being dropped, and why it is safe

| Dropped | Why it cannot break us |
|---|---|
| `libtesseract` | OCR. Never invoked. The single largest piece of dead weight. |
| `libaom` | AV1 **encoder**. We never encode AV1; dav1d keeps AV1/AVIF decoding. |
| `libass`, `libfreetype`, `libfontconfig`, `libfribidi`, `libharfbuzz` | Subtitle **rendering** (burn-in) and `drawtext`. We pass subtitles through as `mov_text`/`copy` and never rasterise them. |
| `gnutls`, `gmp`, `libsrt`, `libxml2` | Network protocols and DASH/IMF. The app has no network path at all. |
| `libopencore-amrnb`, `libvo-amrwbenc` | AMR **encoding**. `.amr` input still decodes — FFmpeg's AMR-NB/WB decoders are native. |
| `libxvid`, `libkvazaar`, `libopenh264`, `libtheora`, `libshine`, `libtwolame` | Alternative encoders for formats we already encode (or never encode). Their **decoders** are native and unaffected. |
| `libspeex`, `libilbc` | Codecs the app neither claims on input nor offers on output. |
| `libvidstab`, `librubberband`, `libzimg`, `libsnappy`, `chromaprint` | Filters and a fingerprinter that no argument builder in this app ever emits. |

Two judgement calls worth revisiting if quality regressions appear:

- **`libsoxr`** — a higher-quality resampler than swresample's built-in. Now
  that the audio section exposes a sample-rate control it is more relevant than
  it was. It is small; add `--enable-libsoxr` if resampled audio sounds worse.
- **`iconv`** — subtitle charset conversion in some demuxers. Tiny. Add
  `--enable-iconv` if a legacy-encoded subtitle track comes through as mojibake.

### Expected saving

Measured against the published `min-gpl` package, which is exactly `min` plus
the GPL encoders — `libx264 libx265 libxvid libvidstab` — and nothing else.
Both figures are arm64, same set of libraries, like for like:

| | on disk | compressed |
|---|---|---|
| `full-gpl` (what we ship) | 41.7 MB | 20.4 MB |
| `min-gpl` | 19.1 MB | 9.2 MB |
| **difference** | **22.6 MB** | **11.2 MB** |

The headline result: **x264 and x265 are cheap.** Everything the app actually
encodes video with costs 9.2 MB of download; the other thirty-odd libraries
cost 11.2 MB more, and it calls six of them.

A build limited to the keep-list lands between the two — `min-gpl` plus lame,
opus, vorbis, vpx, webp and dav1d, which are a subset of that 11.2 MB. Estimate
**12–14 MB compressed per architecture**, so a Play download of roughly
**24–26 MB against today's 32 MB**.

Worth saying plainly: that is a real saving but a moderate one, and it is not
worth taking any functional risk for. 32 MB is already unremarkable for an
offline converter and is nowhere near a threshold that costs installs.

## Why this cannot be built yet

The app depends on `com.antonkarpenko:ffmpeg-kit-full-gpl`, and **the sources
for that artifact are not public**. The Flutter plugin
([sk3llo/ffmpeg_kit_flutter](https://github.com/sk3llo/ffmpeg_kit_flutter)) is
open, but it only binds to the AAR; the repository that produces the AAR does
not exist publicly, and the POM's `url` points at a deleted one. The
maintainer's own publish workflow says why:

> Relay a **locally-built**, signed Maven Central bundle to the Central Portal.

The native build happens on the maintainer's machine; only the signed bundle is
published. A GitHub-wide code search for `com.antonkarpenko.ffmpegkit` returns
consumers of the plugin and nothing else.

The one public alternative, `arthenica/ffmpeg-kit`, is archived and builds
**FFmpeg 6.0**. Ours is **FFmpeg 8.1.2** (`com.antonkarpenko:ffmpeg-kit-full-gpl:2.2.1`
on Android, the matching `8.1.2` frameworks on iOS). Rebuilding on it would mean
going back two major versions, and HEIF/HEIC support in the mov demuxer is a
7.x-era addition — the extension list `avif,heic,heif` that makes iPhone photos
openable comes from the 8.x build. Trading that for ~8 MB is not a trade worth
making.

**So the route is to ask, not to build**: the maintainer already publishes eight
package variants from an automated pipeline, and a converter-shaped ninth is a
configuration change on their side.

That request is filed as
[sk3llo/ffmpeg_kit_flutter#166](https://github.com/sk3llo/ffmpeg_kit_flutter/issues/166)
(2026-08-04) — it carries the measurements below and the exact library list.
**Everything in this document is on hold behind it.** If it lands, swap the
dependency and run the verification pass; if it is declined, the size question
is closed and 32 MB stands.

Measured sizes of what exists today, whole AAR, all four ABIs:

| variant | version | AAR |
|---|---|---|
| min | 2.2.2 | 37.1 MB |
| min-gpl | 2.2.2 | 46.4 MB |
| https | 2.2.1 | 48.3 MB |
| audio | 2.2.2 | 48.9 MB |
| https-gpl | 2.2.1 | 57.6 MB |
| video | 2.2.1 | 57.6 MB |
| full | 2.2.1 | 66.6 MB |
| full-gpl | 2.2.1 | 103.8 MB |

None of them fits: `min-gpl` and `https-gpl` have no MP3, Opus, Vorbis, VP9 or
WebP encoder and no AV1 decoder; `video` and `full` have no x264 or x265 at all,
because those are the GPL ones.

## Verification before shipping the new binary

Size is worthless if something silently stops working, and the failure mode of a
missing encoder is a job that dies with one line of FFmpeg log. Run all of it:

Most of this used to say "by hand". It does not any more —
`integration_test/conversion_matrix_test.dart` builds the matrix *out of
`ContainerRules` itself*, so a codec added to the catalogue appears in the run
without anyone remembering to add it.

1. `flutter test` — `test/ffmpeg_args_test.dart` and friends assert the argument
   vectors, not the binary, so they will pass either way. They are necessary,
   not sufficient.
2. `flutter test integration_test -d <device>` — all eight suites on a real
   phone. Between them they cover every container×codec pair the catalogue
   allows, every processing control, target size, two-pass, subtitles, all
   twelve quick presets, merging (including a silent clip), cancellation, and
   every input extension the app claims **except** `heic`, `heif` and `ape` —
   see below.
3. Read the run's own notes. `encoder_inventory_test` prints the FFmpeg banner
   and which encoders and muxers are registered; the hardware group prints
   `АППАРАТНО` or `НЕТ БЛОКА` per codec. A rebuild that quietly drops a library
   shows up there before it shows up as a failure.
4. The three formats no test can synthesise, because this build has no encoder
   or muxer for them: `heic`, `heif`, `ape`. They are covered only by a
   decoder-registration check. To cover them properly, paste a real file into
   `_fixtures` at the top of `conversion_matrix_test.dart` — for HEIC use an
   iPhone photo, since the tiled-grid layout is the part in doubt.
5. Hardware encoding on a real device (`useHardwareEncoder`), since
   `--enable-android-media-codec` is what makes `h264_mediacodec` exist.

**A hardware encoder in `-encoders` does not mean the phone has one.** The
`*_mediacodec` entries are wrappers the build carries unconditionally; whether
silicon sits behind one is only discovered by asking MediaCodec at encode time.
The WP30 Pro lists `vp9_mediacodec` and answers `NAME_NOT_FOUND`. So a rebuild
that appears to gain or lose a hardware encoder has changed the *build*, and
says nothing about any device — and the thing that keeps users unaffected is
the software retry in `QueueController`, not the probe. Measured on device: the
failed hardware attempt costs 50 ms against a 5.3 s software encode, which is
why no failure memo was added.

## Later, in the same rebuild

The two things already on the roadmap that need a custom FFmpeg anyway:

- **libheif** — HEIC/AVIF as an *output* format.
- **SVT-AV1** or aom — AV1 encoding. Note that re-adding aom undoes a large part
  of the saving; SVT-AV1 is the better trade.
