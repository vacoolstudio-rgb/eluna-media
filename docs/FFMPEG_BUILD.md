# Building a slimmer FFmpeg for Eluna Media

The app currently ships `ffmpeg-kit` **full-gpl 6.0.LTS**, whose configuration
was read straight out of the shipped `libavutil.so`:

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
| of which FFmpeg `.so` | 45.9 MB |
| Play download | ~32 MB |

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
HEIF still images decode through the mov demuxer plus the *native* HEVC decoder;
the shipped `libavformat` lists `avif,heic,heif` among the mov demuxer's
extensions, so this works without libheif. libheif would only be needed to
**write** HEIC.

**Filters it uses** — all native, none from an external library:
`anullsrc atempo aformat atrim concat crop eq fps hqdn3d normalize pad
palettegen paletteuse scale setpts setsar split transpose unsharp volume hflip
vflip`.

**Hardware encoding**: `mediacodec` (see `lib/core/hw_encoders.dart`).

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

Not measured — this is an estimate from the dropped libraries' usual sizes, and
the only honest number will come from the first build. Order of magnitude:
tesseract, aom and the libass stack alone should account for well over 10 MB of
the 45.9 MB of FFmpeg `.so`. A landing zone of ~25–30 MB per architecture would
put the app level with its FFmpeg-based peers.

## Verification before shipping the new binary

Size is worthless if something silently stops working, and the failure mode of a
missing encoder is a job that dies with one line of FFmpeg log. Run all of it:

1. `flutter test` — `test/ffmpeg_args_test.dart` and friends assert the argument
   vectors, not the binary, so they will pass either way. They are necessary,
   not sufficient.
2. `integration_test/conversion_test.dart` and
   `integration_test/photo_enhance_test.dart` on a device — these run **real**
   FFmpeg and are the only things that catch a filter or encoder that is no
   longer there.
3. `integration_test/no_growth_test.dart` — guards the "compression never
   inflates" promise.
4. By hand, one file per output container the UI offers: MP4/H.264, MP4/H.265,
   MKV, WebM/VP9, AVI, MOV, GIF, JPEG, PNG, WebP (lossy **and** lossless), BMP,
   TIFF, MP3, M4A, WAV, FLAC, OGG, Opus. Every one of these is a promise the
   format chips make.
5. By hand, one input per exotic decoder the app claims:
   `heic heif avif jfif ico 3gp m4v mpg mpeg ts wmv flv m2ts wma aiff alac amr ape`.
6. Hardware encoding on a real device (`useHardwareEncoder`), since
   `--enable-android-media-codec` is what makes `h264_mediacodec` exist.

## Later, in the same rebuild

The two things already on the roadmap that need a custom FFmpeg anyway:

- **libheif** — HEIC/AVIF as an *output* format.
- **SVT-AV1** or aom — AV1 encoding. Note that re-adding aom undoes a large part
  of the saving; SVT-AV1 is the better trade.
