# Licensing notice — Eluna Media

## The application

Eluna Media is distributed under the **GNU General Public License v3** (see
`LICENSE`). The reason is not a preference: the app bundles FFmpeg built with
x264 and x265 through `ffmpeg_kit_flutter_new`, and those are GPL-licensed, so
the combined work must be too. H.264/H.265 encoding is the core feature, and
the LGPL FFmpeg build cannot do it — the trade-off is forced, not incidental.

Shipping this app therefore means publishing its source.

## Third-party components

| Component | License |
|---|---|
| FFmpeg (full-gpl: x264, x265, xvidcore, vid.stab) via `ffmpeg_kit_flutter_new` | GPL v3 |
| Flutter, `flutter_riverpod`, `file_picker`, `path_provider`, `share_plus`, `shared_preferences`, `flutter_local_notifications`, `intl`, `battery_plus`, `url_launcher` | BSD-3-Clause / MIT |
| `in_app_review`, `gal`, `open_filex` | MIT / BSD-3-Clause |
| `dynamic_color`, `google_mobile_ads` (Flutter plugin) | Apache-2.0 |
| Manrope typeface (`assets/fonts/`) | SIL Open Font License 1.1 (`assets/fonts/OFL.txt`) |

Every dependency is free and open source, and none requires a paid licence or
a paid service.

## Open decision before release: GPL v3 and the Google Mobile Ads SDK

The `google_mobile_ads` *plugin* is Apache-2.0, but it links Google's
**closed-source** Mobile Ads binary into the same process as GPL code. GPL v3
does not permit distributing that combination, and nobody can grant an
exception on x264's behalf.

Three honest options, in order of practicality:

1. **Two flavours.** Ship the store build with the banner, and publish an
   **ad-free FOSS build** (e.g. F-Droid) where the GPL obligation is cleanly
   met. Ads are already isolated behind `lib/services/ads/`, so the ad-free
   flavour is a one-provider change.
2. **Drop ads entirely** and keep only the one-time "remove ads"… which then
   has nothing to remove — i.e. make the app free and donation-funded.
3. **Ship as-is** and accept the (industry-common, but real) compliance risk.

This is the owner's call at release time; the code does not presuppose it.
