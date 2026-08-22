#!/usr/bin/env python3
"""Push the store listing in fastlane/metadata/android/ to Google Play.

Talks to the Play Android Publisher API v3 directly, so it needs neither Ruby
nor fastlane - only a service-account key with access to the Play Console.

    python tool/upload_play_listing.py --key play-service-account.json --dry-run
    python tool/upload_play_listing.py --key play-service-account.json
    python tool/upload_play_listing.py --key ... --only ru-RU ja-JP
    python tool/upload_play_listing.py --key ... --no-images

Everything happens inside one edit, which is committed at the end. If any
locale fails, nothing is committed - Play either gets all of it or none of it.

What this does NOT do, because the API cannot:

- create the app. The package must already exist in the Play Console.
- upload "What's new". Release notes belong to a release in a track, not to the
  listing, so `changelogs/7.txt` is applied when the AAB is rolled out, not
  here. `--release-notes-track production` will attach them to the draft
  release on that track if one already exists.
- answer the Data safety, content rating and target audience forms. Those are
  console-only; the answers are written out in store/play/CONSOLE.md.
"""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
import time
from pathlib import Path

import requests
from google.oauth2 import service_account
from google.auth.transport.requests import AuthorizedSession

ROOT = Path(__file__).resolve().parent.parent
META = ROOT / "fastlane" / "metadata" / "android"
PACKAGE = "com.eluna.media"
VERSION_CODE = "7"
API = "https://androidpublisher.googleapis.com/androidpublisher/v3"
UPLOAD_API = "https://androidpublisher.googleapis.com/upload/androidpublisher/v3"
SCOPES = ["https://www.googleapis.com/auth/androidpublisher"]

# Image sets fastlane keeps per locale, under images/. The API replaces a whole
# set at a time, so each one is deleted before it is re-uploaded.
IMAGE_SETS = {
    "icon": "icon.png",
    "featureGraphic": "featureGraphic.png",
}
SCREENSHOT_SETS = {
    "phoneScreenshots": "phoneScreenshots",
    "sevenInchScreenshots": "sevenInchScreenshots",
    "tenInchScreenshots": "tenInchScreenshots",
}

# Frames live outside the fastlane tree: 61 locales x 5 PNGs is tens of
# megabytes that regenerate from one command, so docs/ASO/screenshots/ is
# git-ignored and read from here by path. Layout: <root>/<locale>/<device>/.
SHOT_DEVICE_SETS = {
    "phone": "phoneScreenshots",
    "sevenInch": "sevenInchScreenshots",
    "tenInch": "tenInchScreenshots",
}

# Play shows screenshots in upload order, and the first three are the ones a
# user sees without swiping: what it does, that it does it in bulk, and the
# argument nobody else in this category can make.
SHOT_ORDER = ["01_convert", "06_finished", "02_queue", "04_privacy", "05_achievements", "03_settings"]


def shot_key(path: Path) -> tuple[int, str]:
    stem = path.stem
    return (SHOT_ORDER.index(stem) if stem in SHOT_ORDER else len(SHOT_ORDER), stem)


# Google отвечает 503 и 429 сам по себе, без нашей вины, а один сорвавшийся
# запрос из четырёхсот откатывает весь edit. Поэтому переходное — не ошибка, а
# повод подождать.
TRANSIENT = {408, 429, 500, 502, 503, 504}


class RetryingSession(AuthorizedSession):
    def request(self, method, url, **kwargs):
        delay = 2
        for attempt in range(6):
            response = super().request(method, url, **kwargs)
            if response.status_code not in TRANSIENT or attempt == 5:
                return response
            print(f"  HTTP {response.status_code}, повтор через {delay} c")
            time.sleep(delay)
            delay *= 2
        return response


def read(path: Path) -> str | None:
    if not path.exists():
        return None
    return path.read_text(encoding="utf-8").strip()


def locales(only: list[str] | None) -> list[str]:
    found = sorted(p.name for p in META.iterdir() if p.is_dir())
    if only:
        missing = [o for o in only if o not in found]
        if missing:
            sys.exit(f"no metadata for: {' '.join(missing)}")
        return only
    return found


def check(session: AuthorizedSession, r: requests.Response, what: str) -> dict:
    if r.status_code >= 400:
        raise SystemExit(f"{what} failed: HTTP {r.status_code}\n{r.text}")
    return r.json() if r.content else {}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--key", required=True, help="service account JSON key file")
    ap.add_argument("--package", default=PACKAGE)
    ap.add_argument("--only", nargs="*", help="upload only these locales")
    ap.add_argument("--no-images", action="store_true", help="text only")
    ap.add_argument("--devices", help="comma-separated screenshot sets to send (phone, sevenInch, tenInch); default all that exist")
    ap.add_argument("--screenshots-root", default="docs/ASO/screenshots",
                    help="tree of <locale>/<device>/<frame>.png rendered by integration_test/screenshots_test.dart")
    ap.add_argument("--dry-run", action="store_true", help="print what would be sent, touch nothing")
    ap.add_argument("--release-notes-track", help="also write changelogs/<code>.txt into the draft release on this track")
    ap.add_argument("--bundle", help="path to an .aab to upload; it is put on --track as a draft release with the changelogs attached")
    ap.add_argument("--track", default="internal", help="track for --bundle (internal, alpha, beta, production)")
    ap.add_argument("--release-status", default="draft", choices=["draft", "completed", "inProgress", "halted"],
                    help="draft leaves the release unpublished, for a human to release from the console")
    args = ap.parse_args()

    # Иначе прогресс не виден: при выводе в файл Python буферизует stdout
    # блоками, и получасовая заливка выглядит как молчащий процесс.
    sys.stdout.reconfigure(line_buffering=True)

    targets = locales(args.only)
    print(f"{len(targets)} locale(s): {' '.join(targets)}\n")

    payloads = {}
    for loc in targets:
        title = read(META / loc / "title.txt")
        short = read(META / loc / "short_description.txt")
        full = read(META / loc / "full_description.txt")
        if not (title and short and full):
            sys.exit(f"{loc}: incomplete listing, run tool/check_play_metadata.py first")
        payloads[loc] = {
            "language": loc,
            "title": title,
            "shortDescription": short,
            "fullDescription": full,
        }
        print(f"  {loc:<8} {len(title):>2}/30  {len(short):>2}/80  {len(full):>4}/4000")

    images = {}
    if not args.no_images:
        for name, filename in IMAGE_SETS.items():
            for loc in targets:
                p = META / loc / "images" / filename
                if p.exists():
                    images.setdefault(loc, {})[name] = [p]
        for name, dirname in SCREENSHOT_SETS.items():
            for loc in targets:
                d = META / loc / "images" / dirname
                if d.is_dir():
                    shots = sorted(q for q in d.iterdir() if q.suffix.lower() in {".png", ".jpg", ".jpeg"})
                    if shots:
                        images.setdefault(loc, {})[name] = shots

        shots_root = Path(args.screenshots_root)
        if not shots_root.is_absolute():
            shots_root = ROOT / shots_root
        # Наборы перезаливаются целиком, поэтому без выбора повторный прогон
        # ради планшетов гонит заново и все телефонные кадры.
        picked = [d.strip() for d in args.devices.split(",")] if args.devices else list(SHOT_DEVICE_SETS)
        for device, name in SHOT_DEVICE_SETS.items():
            if device not in picked:
                continue
            for loc in targets:
                d = shots_root / loc / device
                if d.is_dir():
                    shots = sorted((q for q in d.iterdir() if q.suffix.lower() == ".png"), key=shot_key)
                    if shots:
                        images.setdefault(loc, {})[name] = shots
        for loc, sets in images.items():
            for name, files in sets.items():
                print(f"  {loc:<8} {name}: {len(files)} file(s)")

    if args.dry_run:
        print("\ndry run: nothing was sent")
        return 0

    creds = service_account.Credentials.from_service_account_file(args.key, scopes=SCOPES)
    session = RetryingSession(creds)

    edit = check(session, session.post(f"{API}/applications/{args.package}/edits"), "opening an edit")
    eid = edit["id"]
    print(f"\nedit {eid} open")

    base = f"{API}/applications/{args.package}/edits/{eid}"
    try:
        for loc, body in payloads.items():
            check(session, session.put(f"{base}/listings/{loc}", json=body), f"listing {loc}")
            print(f"  text  {loc}")

        for loc, sets in images.items():
            for name, files in sets.items():
                check(session, session.delete(f"{base}/listings/{loc}/{name}"), f"clearing {name} for {loc}")
                for f in files:
                    mime = "image/png" if f.suffix.lower() == ".png" else "image/jpeg"
                    url = (
                        f"{UPLOAD_API}/applications/{args.package}/edits/{eid}"
                        f"/listings/{loc}/{name}?uploadType=media"
                    )
                    check(
                        session,
                        session.post(url, data=f.read_bytes(), headers={"Content-Type": mime}),
                        f"uploading {f.name} for {loc}",
                    )
                print(f"  image {loc} {name}")

        if args.bundle:
            aab = Path(args.bundle)
            if not aab.exists():
                raise SystemExit(f"no bundle at {aab}")
            # A release build signed with the debug key is the single most common
            # way this fails, and Play only says so after the whole upload. Cheap
            # to catch here: the debug certificate is always CN=Android Debug.
            certs = subprocess.run(
                ["keytool", "-printcert", "-jarfile", str(aab)],
                capture_output=True, text=True, errors="replace",
            ).stdout
            if "CN=Android Debug" in certs:
                raise SystemExit(
                    f"{aab.name} is signed with the debug key. Play rejects it - "
                    "fill android/key.properties and rebuild."
                )

            size_mb = aab.stat().st_size / 1024 / 1024
            print(f"  bundle {aab.name} ({size_mb:.0f} MB), uploading")
            up = check(
                session,
                session.post(
                    f"{UPLOAD_API}/applications/{args.package}/edits/{eid}/bundles?uploadType=media",
                    data=aab.read_bytes(),
                    headers={"Content-Type": "application/octet-stream"},
                ),
                f"uploading {aab.name}",
            )
            code = up["versionCode"]
            print(f"  bundle versionCode {code}")

            notes = []
            for loc in targets:
                text = read(META / loc / "changelogs" / f"{code}.txt")
                if text:
                    notes.append({"language": loc, "text": text})
            check(
                session,
                session.put(
                    f"{base}/tracks/{args.track}",
                    json={
                        "track": args.track,
                        "releases": [{
                            "versionCodes": [str(code)],
                            "status": args.release_status,
                            "releaseNotes": notes,
                        }],
                    },
                ),
                f"putting {code} on {args.track}",
            )
            print(f"  track {args.track}: versionCode {code} as {args.release_status}, {len(notes)} locale(s) of release notes")

        if args.release_notes_track:
            track = check(
                session,
                session.get(f"{base}/tracks/{args.release_notes_track}"),
                f"reading track {args.release_notes_track}",
            )
            releases = track.get("releases") or []
            if not releases:
                print(f"  ! track {args.release_notes_track} has no release, skipping release notes")
            else:
                notes = []
                for loc in targets:
                    text = read(META / loc / "changelogs" / f"{VERSION_CODE}.txt")
                    if text:
                        notes.append({"language": loc, "text": text})
                releases[-1]["releaseNotes"] = notes
                check(
                    session,
                    session.put(
                        f"{base}/tracks/{args.release_notes_track}",
                        json={"track": args.release_notes_track, "releases": releases},
                    ),
                    "writing release notes",
                )
                print(f"  notes {len(notes)} locale(s) on {args.release_notes_track}")

        check(session, session.post(f"{base}:commit"), "committing the edit")
        print("\ncommitted. The listing is live in the console; Play re-reviews changed text.")
    except SystemExit:
        session.delete(base)
        print("\nedit deleted, nothing was changed in the console", file=sys.stderr)
        raise

    return 0


if __name__ == "__main__":
    sys.exit(main())
