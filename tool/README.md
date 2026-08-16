# tool/

Здесь остаётся только то, что знает про **это** приложение.

- `gen_app_icons.py` — иконки из мастеров в `design/app_icons`
- `add_locale.py` — новый язык в `lib/l10n`, с порядком ключей из шаблона
- `build_aso_en.py` — англоязычный листинг: собирает `docs/ASO/appstore-en.md`
  и считает длины полей

## Чего здесь больше нет

Скрипты, которые говорят с App Store Connect, переехали в общую репу
`vacoolstudio-rgb/eluna-store-tools`: они одинаковы для всей семьи, и держать
по копии в каждом приложении значит чинить одну и ту же поломку трижды.

```bash
export ASC_KEY_ID=… ASC_ISSUER_ID=…
cd ../eluna-store-tools

# тексты витрины на 50 локалях
node store/upload-listing.js 6801963204 ../eluna-media/docs/ASO

# кадры (раскладка Media: <локаль>/<набор>)
ASO_ROOT=../eluna-media/docs/ASO/screenshots ASO_LAYOUT=locale/set \
ASO_SETS='{"APP_IPHONE_67":"6.9","APP_IPAD_PRO_3GEN_129":"ipad13"}' \
node store/upload-screenshots.js <versionId> all

# чаевые
node store/create-iap.js 6801963204 _media
node store/upload-iap-screenshot.js 6801963204 ../eluna-media/docs/ASO/screenshots/iap/tip_screen.png tip_
```

Сами кадры снимаются здесь — им нужен код приложения:
`flutter drive --driver=test_driver/integration_test.dart --target=integration_test/screenshots_test.dart`.
