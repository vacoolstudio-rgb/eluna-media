#!/usr/bin/env python3
"""Взять ключ подписи у другого приложения семьи и прописать его здесь.

    python tool/copy_signing_key.py
    python tool/copy_signing_key.py ../eluna_pets/android/key.properties

Одним ключом загрузки можно подписывать сколько угодно приложений, поэтому
семье незачем плодить хранилища: у трекера сериалов ключ уже настроен и
проверен загрузками в Play.

Скрипт читает чужой `key.properties`, разворачивает `storeFile` в абсолютный
путь (относительный указывал на чужой каталог) и пишет `android/key.properties`
здесь. Пароль при этом никуда не печатается: на экран уходят только владелец
сертификата, отпечаток и срок годности — то, что и так видно всем, кто скачает
приложение из магазина.

Перед записью хранилище открывается этим паролем. Если он не подходит, файл не
создаётся: узнать об этом лучше сейчас, чем из отказа консоли после выгрузки
полутора сотен мегабайт.
"""

from __future__ import annotations

import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
PROPS = ROOT / "android" / "key.properties"
DEFAULT_SOURCE = ROOT.parent / "eluna_tv_show_traker_flutter" / "android" / "key.properties"


def read_props(path: pathlib.Path) -> dict[str, str]:
    values: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if line and not line.startswith("#") and "=" in line:
            key, _, value = line.partition("=")
            values[key.strip()] = value.strip()
    return values


def main() -> int:
    source = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_SOURCE
    if not source.exists():
        return fail(f"нет исходного файла: {source}")
    if PROPS.exists():
        return fail(f"{PROPS} уже существует — удалите его, если правда хотите заменить ключ")

    props = read_props(source)
    missing = [k for k in ("storeFile", "storePassword", "keyAlias", "keyPassword") if not props.get(k)]
    if missing:
        return fail(f"в {source} не хватает полей: {', '.join(missing)}")

    store = pathlib.Path(props["storeFile"])
    if not store.is_absolute():
        store = (source.parent / store).resolve()
    if not store.exists():
        return fail(f"хранилище не найдено: {store}")

    # Проверка пароля до записи: keytool молча ничего не выведет, если он не тот.
    listed = subprocess.run(
        ["keytool", "-list", "-v", "-keystore", str(store),
         "-alias", props["keyAlias"], "-storepass", props["storePassword"]],
        capture_output=True, text=True, errors="replace",
    )
    if listed.returncode != 0:
        return fail("пароль не подходит к хранилищу или нет такого алиаса:\n"
                    + (listed.stderr or listed.stdout).strip())

    PROPS.write_text(
        f"storeFile={store.as_posix()}\n"
        f"storePassword={props['storePassword']}\n"
        f"keyAlias={props['keyAlias']}\n"
        f"keyPassword={props['keyPassword']}\n",
        encoding="utf-8",
    )

    print(f"хранилище: {store}")
    print(f"алиас:     {props['keyAlias']}")
    for line in listed.stdout.splitlines():
        if re.match(r"\s*(Owner|Владелец|Valid from|Действителен с|SHA256):", line.strip()):
            print("  " + line.strip()[:120])
    print(f"\nзаписан {PROPS} — он в .gitignore, в коммит не попадёт")
    return 0


def fail(message: str) -> int:
    print(message, file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
