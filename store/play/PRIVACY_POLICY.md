# Privacy Policy — Eluna Media

_Last updated: 20 August 2026_

Eluna Media is an offline photo, video and audio converter. This policy
describes what the app does with your information. It is short because the app
does very little: it collects nothing, sends nothing, and has no server behind
it.

**Before publishing:** replace `<support e-mail>` below with a mailbox that is
actually read, and host this page at a public URL — Google Play requires a
reachable link, and a file in a repository does not count.

## The short version

Eluna Media does not collect, transmit, store or share any personal data. The
release build of the app does not hold Android's `INTERNET` permission, so it
has no way to send anything anywhere. You can verify that yourself in Android's
app info screen under permissions, and in the app's own **Network & privacy
audit** screen in Settings.

## Your files

Photos, videos and audio files you open in the app are read from your device and
converted on your device, by a copy of FFmpeg included inside the app. The
results are written to your device. No file, no part of a file and no
information about a file ever leaves it.

The app never uploads your media to a server, because there is no server.

When you tap Save, the converted file is written to your gallery or to your
Downloads folder using Android's own media APIs. When you ask the app to delete
the originals, it does not delete anything itself: Android shows you the real
files and waits for your approval.

## What the app does not do

- No accounts, no sign-in, no profile.
- No analytics, no telemetry, no usage statistics.
- No crash reporting.
- No advertising, no ad SDKs, no advertising ID. The app does not declare the
  `AD_ID` permission.
- No device identifiers, no fingerprinting, no location access.
- No cookies, no trackers, no third-party SDKs beyond Google Play Billing
  described below.

## Metadata in your files

By default, the app **removes** EXIF metadata, GPS coordinates and timestamps
from the files it produces, so a converted photo does not carry the place and
time it was taken. This happens entirely on your device, and it can be turned
off in the app's settings if you want the metadata kept.

## Permissions the app requests, and why

- **Notifications** — to show the progress of a conversion and tell you when a
  batch is finished.
- **Foreground service (data sync / media processing)** — so a conversion keeps
  running when you leave the app, instead of being killed mid-file.
- **Storage (`WRITE_EXTERNAL_STORAGE`, only on Android 9 and older)** — to save
  results on devices that predate the modern media APIs. On Android 10 and
  newer the app does not request it.
- **Billing (`com.android.vending.BILLING`) and network state
  (`ACCESS_NETWORK_STATE`)** — brought in by Google Play Billing, described
  below.
- **`INTERNET` — not requested.** It is explicitly removed from the release
  build.

## Tips and Google Play Billing

The app contains an optional tip. Tipping is entirely voluntary, it unlocks no
features, and the app works identically whether or not you ever use it.

Tips are processed by **Google Play Billing**. The app talks to the Google Play
Store app already installed on your device; that app, not this one, performs the
payment and any network communication involved. Eluna Media never sees your
payment details, and it stores no purchase history, no receipt and no
entitlement.

Google's handling of that transaction is covered by
[Google's Privacy Policy](https://policies.google.com/privacy) and by the Google
Play terms of service.

## App lock

If you enable the PIN lock, the PIN is stored only as a salted PBKDF2 hash in
the app's private storage on your device. The PIN itself is never stored, never
recoverable and never leaves the device. If you enable biometric unlock, the
comparison is performed by Android; the app receives only a yes or no.

## Children

The app is not directed at children, collects no data from anyone, and contains
no advertising and no user-to-user communication.

## Changes to this policy

If the app ever starts doing something this document does not describe, the
document will be updated before that version is published, and the date at the
top will change.

## Contact

Questions about this policy: `<support e-mail>`.
