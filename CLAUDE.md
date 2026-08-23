# Eluna Media

Part of the Eluna family. Shared behaviour lives in the **`eluna_shared`
package**, never copied into an app — see `docs/CONTRACT.md` there.

## Read this before touching icons, the launch screen, or first-run flow

`eluna_shared/docs/NEW-APP-CHECKLIST.md` lists every defect this family has
already paid for once. All of them shipped, in more than one app, and **none of
them is caught by `flutter analyze`, `flutter test`, or by looking at the app on
the phone on your desk.** The two that bite hardest:

* **[ANDROID-ICONS.md]** — no `res/mipmap-anydpi-v26/*.xml` means Android 8+
  launchers shrink the square PNG onto a **white circle** of their own. Invisible
  on Samsung (One UI masks legacy icons), obvious on Pixel.
* **[ANDROID-SPLASH.md]** — the `flutter create` launch theme resolves against
  the **system** light/dark setting, so a phone in light mode gets a **white
  launch screen** even though the app is dark. The app's theme is its own
  setting and must not be decided by the system's.

Both are fixed here. Both come straight back if the resources below are
regenerated from a template.

## Rules that are not obvious from the code

1. **The launch screen never follows the system theme.** `eluna_splash_bg` is
   `#FF0D0F17` (eluna_shared's dark `ColorScheme.surface`) and lives only in
   `values/colors.xml`. Adding a `values-night/` twin of that colour re-creates
   the bug.
2. **`LaunchTheme` is identical in `values/` and `values-night/`** — same parent,
   same `windowSplashScreenBackground`. Take the parent from this app's own
   `values-night/styles.xml`; do not paste one in from another app.
3. **Never write `--` inside an Android XML comment.** XML forbids it, and the
   build dies at `processReleaseMainManifest` with a message that never mentions
   comments. Quoting a command line with flags is enough to do it.
   `test/android_xml_comments_test.dart` catches it.
4. **Audit with `git ls-files`, not `ls`.** A working tree can be missing files
   that git has; an icon audit once reported a healthy app as broken that way.
5. **A picker closes on pick, and a control does what its label promises.** Both
   rules exist because a tester tripped over the opposite.

## This app's icons

10 adaptive icons with **its own** naming: foreground `ic_launcher_fg`, background colours `ic_bg_*`, icons named by meaning (`ic_launcher_clamp`, `ic_launcher_envelope`).

* Do NOT run `gen_adaptive_icons.py` here. It writes Screen's naming (`_foreground` / `*_background`) and has already flattened Media's once. An app with its own adaptive-icon naming is a contract, not a gap.

## Verifying a launch screen

The failing case is a **light system theme with the app on Dark** — not the
other way round, and not your phone as it is now.

```powershell
adb shell cmd uimode night no
adb shell am force-stop com.eluna.media
adb shell am start -n com.eluna.media/.MainActivity
adb exec-out screencap -p > splash.png   # corner pixel must be (13, 15, 23)
```
