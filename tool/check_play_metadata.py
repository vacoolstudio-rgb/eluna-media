#!/usr/bin/env python3
"""Validate Google Play store-listing metadata under fastlane/metadata/android/.

Checks what Play checks (hard character limits, required files) plus the two
things that break silently: an untranslated copy of the English master, and
mojibake from a tool that wrote the file in the console codepage instead of
UTF-8 (see tool/add_locale.py for the same trap on the ARB side).

    python tool/check_play_metadata.py            # every locale
    python tool/check_play_metadata.py ru-RU ja-JP  # only these
"""

from __future__ import annotations

import json
import re
import sys
import unicodedata
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
META = ROOT / "fastlane" / "metadata" / "android"
VERSION_CODE = "7"
MASTER = "en-US"

LIMITS = {
    "title.txt": 30,
    "short_description.txt": 80,
    "full_description.txt": 4000,
    f"changelogs/{VERSION_CODE}.txt": 500,
}

# Named third-party apps and devices: Play's metadata policy rejects these.
BANNED_SUBSTRINGS = [
    "whatsapp", "discord", "telegram", "instagram", "tiktok", "youtube",
    "facebook", "snapchat", "iphone", "app store",
    "google play store", "handbrake", "vlc", "capcut", "#1", "№1",
]

# Locales whose listing text is legitimately written in Cyrillic. Cyrillic
# anywhere else means a file was decoded with the wrong codepage.
CYRILLIC_OK = {"ru-RU", "uk", "sr", "bg", "kk"}

# Sequences that appear when UTF-8 text is read as cp1251/latin-1 and written
# back out as UTF-8. Cheap, and they never occur in real text.
MOJIBAKE = ["Ð", "Ñ", "Ã©", "Ã¤", "Ð«", "Щ…Щ", "â€", "Â "]


def chars(text: str) -> int:
    """Characters as Play counts them, ignoring the trailing newline."""
    return len(text.rstrip("\n"))


def read(path: Path) -> str | None:
    try:
        raw = path.read_bytes()
    except FileNotFoundError:
        return None
    if raw.startswith(b"\xef\xbb\xbf"):
        return "﻿BOM"  # sentinel, reported below
    try:
        return raw.decode("utf-8")
    except UnicodeDecodeError:
        return None


def check_locale(locale: str) -> tuple[list[str], list[str]]:
    errors: list[str] = []
    warnings: list[str] = []
    d = META / locale

    if not d.is_dir():
        return [f"{locale}: directory missing"], []

    master_texts = {
        name: (META / MASTER / name).read_text(encoding="utf-8")
        for name in LIMITS
        if (META / MASTER / name).exists()
    }

    for name, limit in LIMITS.items():
        path = d / name
        text = read(path)

        if text is None:
            errors.append(f"{locale}/{name}: missing or not valid UTF-8")
            continue
        if text.startswith("﻿"):
            errors.append(f"{locale}/{name}: starts with a UTF-8 BOM")
            continue

        body = text.rstrip("\n")
        n = chars(text)

        if not body.strip():
            errors.append(f"{locale}/{name}: empty")
            continue
        if n > limit:
            errors.append(f"{locale}/{name}: {n} chars, limit {limit} (over by {n - limit})")
        elif n < limit * 0.55 and name != "title.txt":
            warnings.append(f"{locale}/{name}: only {n} of {limit} chars used")

        if text != body + "\n" and text != body:
            warnings.append(f"{locale}/{name}: trailing blank lines")

        low = body.lower()
        for bad in BANNED_SUBSTRINGS:
            if bad in low:
                errors.append(f"{locale}/{name}: mentions {bad.strip()!r} (Play metadata policy)")

        if re.search(r"\*\*|^#{1,6} |^\s*[-*] ", body, re.MULTILINE):
            warnings.append(f"{locale}/{name}: Markdown syntax, Play renders plain text")

        for seq in MOJIBAKE:
            if seq in body:
                errors.append(f"{locale}/{name}: mojibake sequence {seq!r} - written in the wrong codepage")
                break

        if locale not in CYRILLIC_OK and not locale.startswith("en"):
            cyr = [c for c in body if "Ѐ" <= c <= "ӿ"]
            if cyr:
                errors.append(f"{locale}/{name}: {len(cyr)} Cyrillic characters in a non-Cyrillic locale")

        if name == "title.txt":
            emoji = [c for c in body if unicodedata.category(c) == "So"]
            if emoji:
                errors.append(f"{locale}/{name}: emoji or symbol {emoji[0]!r} in the title")
            if "Eluna" not in body:
                warnings.append(f"{locale}/{name}: the brand name is not in the title")

        if locale != MASTER and name in master_texts:
            if body.strip() == master_texts[name].strip():
                errors.append(f"{locale}/{name}: byte-identical to {MASTER} - not localised")

    return errors, warnings


def main() -> int:
    wanted = sys.argv[1:]
    if not META.is_dir():
        print(f"no metadata directory at {META}")
        return 1

    locales = sorted(p.name for p in META.iterdir() if p.is_dir())
    if wanted:
        locales = [l for l in locales if l in wanted]
        missing = [w for w in wanted if w not in locales]
        for m in missing:
            print(f"FAIL {m}: not written yet")

    expected = []
    map_file = ROOT / "store" / "play" / "locales.json"
    if map_file.exists():
        expected = [e["play"] for e in json.loads(map_file.read_text(encoding="utf-8"))["locales"]]

    total_err = 0
    for locale in locales:
        errors, warnings = check_locale(locale)
        total_err += len(errors)
        status = "FAIL" if errors else ("warn" if warnings else "ok  ")
        counts = []
        for name, limit in LIMITS.items():
            text = read(META / locale / name)
            counts.append(f"{chars(text) if text else 0}/{limit}")
        print(f"{status} {locale:<8} {' '.join(counts)}")
        for e in errors:
            print(f"       ! {e}")
        for w in warnings:
            print(f"       . {w}")

    if not wanted and expected:
        absent = [e for e in expected if e not in locales]
        if absent:
            print(f"\n{len(absent)} locale(s) not written yet: {' '.join(absent)}")

    print(f"\n{len(locales)} locale(s) checked, {total_err} error(s)")
    return 1 if total_err else 0


if __name__ == "__main__":
    sys.exit(main())
