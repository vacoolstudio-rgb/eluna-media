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
| `dynamic_color` | Apache-2.0 |
| `hugeicons` | MIT |
| Manrope typeface — bundled inside `eluna_shared`, not in this repo | SIL Open Font License 1.1 (registered by `Eluna.configure()` from the package's own `assets/fonts/OFL.txt`, and listed on the licences screen) |
| `eluna_shared` — the family's shared code (theme, design system, licences, language picker, rating, logging) | Owned by Eluna (Lunara); see the open question below |

Every third-party dependency is free and open source, and none requires a paid
licence or a paid service.

## Open: `eluna_shared` and the GPL

`eluna_shared` is the owner's own package, and its `LICENSE` currently reads
"All rights reserved". This app is GPL v3 by force — FFmpeg with x264/x265
leaves no choice — and the GPL applies to the *combined* work, so shipping a
proprietary in-house library inside it is the same shape of problem the ads SDK
turned out to be, minus the part nobody could fix: the owner owns both sides
here and can simply license the package under GPL v3 (or dual-license it) for
this app. It needs to be stated somewhere before release, not assumed.

## Settled: GPL v3 and the Google Mobile Ads SDK

This used to be an open question. The `google_mobile_ads` *plugin* is
Apache-2.0, but it links Google's **closed-source** Mobile Ads binary into the
same process as GPL code, which GPL v3 does not permit distributing — and
nobody can grant an exception on x264's behalf.

**Resolved by the owner: the app carries no advertising at all.** The SDK, the
banner, the consent flow and the one-time "remove ads" purchase were removed
outright rather than isolated behind a build flavour, so there is no
closed-source binary in the process and the GPL obligation is met with nothing
left to argue about. Eluna Media is free, complete, and has no monetization.

The side effect is worth stating plainly, because it is now a product claim:
the release build does not hold the `INTERNET` permission
(`android/app/src/release/AndroidManifest.xml` strips it so no dependency can
merge it back in), so the app cannot reach the network at all.
