#!/usr/bin/env python3
"""Render the two Play Console graphics that are not screenshots.

    python tool/make_play_graphics.py

Writes, next to the default store listing:

    fastlane/metadata/android/en-US/images/icon.png            512x512
    fastlane/metadata/android/en-US/images/featureGraphic.png  1024x500

The icon is the shipping launcher art (`loop`, which `ic_launcher.webp` is a
copy of) at Play's required size and without the adaptive mask - Play applies
its own shape.

The feature graphic carries no sentence on purpose. The same image is used in
all 61 store listings, so everything on it has to read identically in Arabic
and in Japanese: the brand name, and container names, which stay in Latin
script in every language. `MOV -> MP4` says "this converts media" without using
a word that would need translating.
"""

from __future__ import annotations

import math
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "fastlane" / "metadata" / "android" / "en-US" / "images"
ICON_SRC = ROOT / "design" / "app_icons" / "loop.webp"
FONT = Path.home() / (
    "AppData/Local/Pub/Cache/git/"
    "eluna-shared-0412ffbb0ac6335df88d38e8117644edc134e5b6/"
    "assets/fonts/Manrope-Variable.ttf"
)

VIOLET = (124, 58, 237)
ORCHID = (168, 85, 247)
INK = (16, 10, 32)
DEEP = (58, 42, 102)
WHITE = (255, 255, 255)
LAVENDER = (227, 215, 255)


def font(size: int, weight: str = "Bold") -> ImageFont.FreeTypeFont:
    f = ImageFont.truetype(str(FONT), size)
    try:
        f.set_variation_by_name(weight)
    except Exception:
        pass  # static build of the font, or FreeType without variation support
    return f


def rounded(img: Image.Image, radius: int) -> Image.Image:
    mask = Image.new("L", img.size, 0)
    ImageDraw.Draw(mask).rounded_rectangle([0, 0, img.width - 1, img.height - 1], radius, fill=255)
    out = img.convert("RGBA")
    out.putalpha(mask)
    return out


def make_icon() -> None:
    icon = Image.open(ICON_SRC).convert("RGB").resize((512, 512), Image.LANCZOS)
    OUT.mkdir(parents=True, exist_ok=True)
    icon.save(OUT / "icon.png", "PNG")
    print(f"icon.png            512x512")


def make_feature_graphic() -> None:
    w, h = 1024, 500

    # Diagonal wash from ink to the deep violet container colour, so the art
    # sits in light while the text side stays dark enough for white type.
    base = Image.new("RGB", (w, h))
    px = base.load()
    for y in range(h):
        for x in range(w):
            t = (x / w) * 0.5 + (1 - y / h) * 0.5
            px[x, y] = tuple(int(INK[i] + (DEEP[i] - INK[i]) * t) for i in range(3))

    # The brand glow behind the icon: the ambient light the app itself uses.
    glow = Image.new("RGBA", (w, h), (0, 0, 0, 0))
    gpx = glow.load()
    cx, cy, r = 262, 250, 330
    for y in range(max(0, cy - r), min(h, cy + r)):
        for x in range(max(0, cx - r), min(w, cx + r)):
            d = math.hypot(x - cx, y - cy) / r
            if d < 1:
                gpx[x, y] = (*VIOLET, int(150 * (1 - d) ** 2))

    canvas = base.convert("RGBA")
    canvas.alpha_composite(glow)
    draw = ImageDraw.Draw(canvas)

    icon = Image.open(ICON_SRC).convert("RGB").resize((300, 300), Image.LANCZOS)
    canvas.alpha_composite(rounded(icon, 66), (112, 100))

    draw.text((500, 152), "Eluna Media", font=font(70, "ExtraBold"), fill=WHITE)

    # Container names and an arrow drawn as geometry: legible as "this converts
    # media" in every language on the store, because none of it is a word.
    chip = font(30, "SemiBold")
    x, top, height = 502, 272, 62

    def chip_box(label: str, filled: bool, x: int) -> int:
        tw = draw.textlength(label, font=chip)
        box = [x, top, x + tw + 44, top + height]
        if filled:
            draw.rounded_rectangle(box, height // 2, fill=VIOLET)
            draw.text((x + 22, top + 13), label, font=chip, fill=WHITE)
        else:
            draw.rounded_rectangle(box, height // 2, outline=ORCHID, width=2)
            draw.text((x + 22, top + 13), label, font=chip, fill=LAVENDER)
        return box[2]

    x = chip_box("MOV", False, x) + 22
    mid = top + height // 2
    draw.line([(x, mid), (x + 42, mid)], fill=ORCHID, width=4)
    draw.polygon([(x + 42, mid - 10), (x + 62, mid), (x + 42, mid + 10)], fill=ORCHID)
    x += 84
    x = chip_box("MP4", True, x) + 16
    chip_box("MP3", True, x)

    OUT.mkdir(parents=True, exist_ok=True)
    canvas.convert("RGB").save(OUT / "featureGraphic.png", "PNG")
    print(f"featureGraphic.png  {w}x{h}")


if __name__ == "__main__":
    if not FONT.exists():
        raise SystemExit(f"Manrope not found at {FONT} - point FONT at the eluna_shared checkout in use")
    make_icon()
    make_feature_graphic()
