# Play Console — everything that is not the listing text

The store listing is only half of what Play asks for. This file is the answer
sheet for the other half: the declarations, the graphics specs and the upload
path. Answers are given as they should be entered, with the reason, so a
different person can re-enter them next year and get the same result.

## 1. Store settings

| Field | Value |
|---|---|
| App name (default listing) | Eluna Media |
| Default language | English (United States) |
| Application ID | `com.eluna.media` |
| App or game | App |
| Free or paid | **Free** — and it can never be switched to paid afterwards |
| Category | **Video Players & Editors**. Tools is the alternative: less traffic, but also less competition from the video-editor giants. Pick one and leave it alone; changing category resets ranking signals. |
| Tags | Up to five, from Play's fixed list. Closest to this app: video editing, video players, photo editing, file management, productivity. |
| Contact email | required, must be monitored — Play mails policy notices there |
| Website | optional, but a real page raises install rate; the privacy policy page can double as it |
| Privacy policy URL | **mandatory**, see section 5 |

## 2. App content — the declarations

**Ads.** No ads. The app contains no ad SDK; the AdMob banner was removed
before 1.0 and the release build has no `INTERNET` permission at all.

**App access.** All functionality is available without restrictions. No login,
no account, no region lock — say exactly that in the free-text box, otherwise a
reviewer who cannot find a way in may reject the build.

**Content rating (IARC questionnaire).** Category: *Utility, Productivity,
Communication or Other*. Answers:

- Violence, sexuality, profanity, controlled substances, horror, gambling: **no** to all.
- Does the app allow users to interact or exchange content? **No** — there is no
  network. Sharing a converted file goes through the Android share sheet, which
  is the system's, not the app's.
- Does the app share the user's location? **No.**
- Does the app allow purchases of digital goods? **Yes** — consumable tips.
- Does the app contain user-generated content? **No.**

Expected result: Everyone / PEGI 3 / USK 0 / ESRB Everyone.

**Target audience.** Select **13 and over** and up. The app has nothing for
children and no ads, so nothing in the Families policy applies; declaring an
under-13 audience would pull in Families requirements for no benefit.

**Data safety.** This is the section that sells the app, so fill it precisely:

- Does your app collect or share any of the required user data types? **No.**
- Data collected: **none**. Data shared: **none**.
- No analytics, no crash reporting, no advertising ID, no device identifiers.
- The app declares **no `INTERNET` permission** in the release build, so it
  cannot transmit anything even in principle. Android's own permission list on
  the store page will show this — the strongest possible corroboration of a
  data-safety form.
- Purchases go through Play Billing over IPC to the Play Store app; that app
  does the networking and Google, not this app, processes the purchase data.
- Data deletion request URL: not applicable, nothing is collected.

**Advertising ID.** Not used, and the permission
`com.google.android.gms.permission.AD_ID` is not in the manifest. Declare "no".

**Government app / news app / financial features / health:** no to all.

**Foreground service permissions.** The manifest declares
`FOREGROUND_SERVICE_DATA_SYNC` and `FOREGROUND_SERVICE_MEDIA_PROCESSING`, and
Play asks for a justification and a short video for each. The justification is
one sentence: *a conversion is a long-running user-initiated media job that must
survive the app being backgrounded, and its progress is shown in the
notification the whole time.* The demo video only needs to show a batch
converting while the user leaves the app, with the notification visible.

## 3. In-app products

Three consumables must exist before the tip screen shows anything — until they
do, Play returns an empty list and the screen honestly says there is nothing to
buy:

| Product ID | Type |
|---|---|
| `tip_coffee_media` | Consumable |
| `tip_snack_media` | Consumable |
| `tip_generous_media` | Consumable |

Prices are set per country by Play's own tiers. Nothing is unlocked by any of
them, which is worth stating in the product description as well, so a refund
request never turns into "I paid and got nothing".

## 4. Graphics

| Asset | Spec | State |
|---|---|---|
| App icon | 512×512 PNG, 32-bit | **done** — `fastlane/metadata/android/en-US/images/icon.png`, rendered from `design/app_icons/loop.webp` by `tool/make_play_graphics.py` |
| Feature graphic | 1024×500 PNG or JPEG, no transparency | **done** — same tool. Deliberately wordless apart from the brand name and container names, so one image serves all 61 listings |
| Phone screenshots | 2–8, PNG or JPEG, 16:9 or 9:16, each side 320–3840 px; 1080×1920 is the safe size | **missing** — needs a device or emulator |
| 7" tablet screenshots | up to 8, same rules | **missing** — required for the "designed for tablets" badge |
| 10" tablet screenshots | up to 8, same rules | **missing** — Play now surfaces large-screen quality in ranking |
| Promo video | YouTube URL, optional | not planned for 1.0 |

Screenshots are per-locale in fastlane
(`fastlane/metadata/android/<locale>/images/phoneScreenshots/`). Any locale
without its own set falls back to the default listing's, so shipping one strong
English set on day one is fine; localised captions can be added market by
market afterwards.

What the eight phone screenshots should show, in order — first three matter
most, they are what a user sees without swiping:

1. Fit to size: the size picker with a real "under 10 MB" result on screen.
2. The queue mid-batch, with percentage and time remaining.
3. Simple mode's outcome cards.
4. Advanced mode's codec controls.
5. The trim / rotate / crop surface.
6. The Network & privacy audit screen — the empty list is the whole argument.
7. Achievements shelf.
8. Themes: OLED black next to light.

## 5. Privacy policy

Play requires a **publicly reachable URL** on the listing, and a file inside
the repository does not satisfy it. The text is written and lives at
`store/play/PRIVACY_POLICY.md`; it still needs hosting. Cheapest honest option
that fits an app with no backend: GitHub Pages on the project repository, which
costs nothing and stays under the developer's control.

The same URL can be used as the app's website field.

## 6. Uploading the metadata

The tree under `fastlane/metadata/android/` is exactly what
[`fastlane supply`](https://docs.fastlane.tools/actions/supply/) expects:

```
fastlane supply init            # pull down whatever is already in the console
fastlane supply --skip_upload_apk --skip_upload_aab   # push text and images only
```

It needs a Google Play service account JSON key with the *Release manager* role.
Without fastlane, every field can be pasted by hand from the same files — the
directory names are the locale codes the console uses.

Before every upload:

```
python tool/check_play_metadata.py
```

It counts characters the way Play does, and refuses anything over a limit, any
named third-party app, any mojibake from a wrongly-encoded write, and any locale
that is still a copy of the English master.
