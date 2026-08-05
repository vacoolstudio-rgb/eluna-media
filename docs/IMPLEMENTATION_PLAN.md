# Eluna Media — План реализации v1.0

Соответствует docs/REQUIREMENTS.md. Порядок = порядок работ.

> **Исторический документ.** План выполнен целиком в июле 2026. Пункты про
> AdMob, `google_mobile_ads`, `ad_gate`/`banner_slot`, `PurchaseService` и
> `isPro` описывают то, что было построено и **удалено 2026-08-05**: владелец
> отменил монетизацию полностью. Актуальная норма — P2/P3 и FR-14/FR-15 в
> docs/REQUIREMENTS.md.

## Этап 0. Фундамент
1. Новые зависимости (все бесплатные, OSS):
   - `google_mobile_ads` — баннер (тестовые ID).
   - `in_app_review` — rate-us.
   - `gal` — сохранение фото/видео в галерею.
   - `receive_sharing_intent` — приём файлов «Поделиться/Открыть с помощью».
   - `dynamic_color` — Material You с фолбэком на фирменный seed.
   - `battery_plus` — проверка заряда перед стартом батча.
2. AndroidManifest: `INTERNET`, AdMob test APPLICATION_ID, intent-filters (SEND/SEND_MULTIPLE/VIEW для image/video/audio). iOS Info.plist: `GADApplicationIdentifier` (тестовый), `NSUserTrackingUsageDescription` не нужен (NPA-only).
3. `main.dart`: `runZonedGuarded` + `FlutterError.onError` → `ErrorScreen` (FR-20); инициализация AdMob (ленивая, только когда баннер разрешён гейтом).

## Этап 1. Домен и ядро
4. `domain/conversion_settings.dart`: `sizeTargetBytes`, `rotate` (enum), `flipH`, `speed`, `keepSubtitles` (+ JSON, копии, дефолты; обратная совместимость хранённых записей).
5. `domain/quick_presets.dart`: пресеты Simple-режима → фабрики `ConversionSettings` + иконка/название/описание.
6. `core/rate_calc.dart` (чистый Dart): битрейт из target-размера и длительности, оценка размера результата, признак «target недостижим».
7. `core/ffmpeg_args.dart`: rotate/flip (transpose/hflip), speed (setpts+atempo с чейнингом для 0.5×), субтитры (`-c:s mov_text`/`copy` + `-map`), target-битрейт (maxrate/bufsize), энергорежим → `-preset`.
8. Тесты на всё новое (args, rate_calc, presets, JSON-миграции).

## Этап 2. Состояние и сервисы
9. `state/app_meta_controller.dart`: firstLaunchAt (штамп на 1-й запуск), successfulConversions, hasRated, lastRatePromptDay, isPro, hasSeenIntro.
10. `services/ads/ad_gate.dart` (чистая логика: grace 14 дней, pro, батч активен → false) + `services/ads/banner_slot.dart` (виджет: adaptive banner, collapse-on-fail, refresh ≤ 1/2мин, только foreground). Тестовые unit ID; боевые — в одном файле `services/ads/ad_config.dart`.
11. `services/purchases/purchase_service.dart`: интерфейс + стаб (debug-успех), состояние Pro в prefs.
12. `services/review_service.dart`: майлстоуны (день 7/14, ≥2 успеха, 1/день, не после rated); платформенные ветки.
13. `services/haptics.dart`: обёртка с тумблером.
14. `services/media_saver.dart`: gal для фото/видео; аудио — в `Downloads` (Android, через SAF-совместимый путь) / Share (iOS).
15. `services/share_intake.dart`: receive_sharing_intent → очередь добавления файлов.
16. `state/queue_controller.dart`: retry(jobId), счётчик успехов → app_meta, проверка батареи перед start (диалог через колбэк UI), хаптика по завершении.

## Этап 3. UI/UX редизайн
17. `ui/theme.dart`: дизайн-токены, dynamic color (опция), OLED-тема, выразительные М3-компоненты; анимации (AnimatedSwitcher/AnimatedSize, Hero-переходы там, где уместно).
18. `ui/convert_tab.dart` → разделить: `simple_view.dart` (карточки пресетов + список файлов + оценка размера + большая кнопка) и `advanced_view.dart` (текущие секции + Transform + субтитры + trim + target-size). Сегмент-переключатель сверху, состояние в prefs.
19. `ui/queue_tab.dart`: Retry, «Сохранить», undo-снекбары, полный текст ошибки по тапу (bottom sheet), размер/длительность в тайле.
20. `ui/settings_tab.dart` (вместо about_tab): секции FR-22; экраны: `network_privacy_screen.dart`, `remove_ads_sheet.dart`, лицензии.
21. `ui/onboarding/privacy_intro_screen.dart`: гейт до HomeShell при первом запуске.
22. `ui/home_shell.dart`: слот баннера над NavigationBar/рядом с Rail; badge очереди (есть).
23. `ui/error_screen.dart`: дружелюбный fallback.
24. l10n: ~80 новых строк EN+RU; `flutter gen-l10n`.

## Этап 4. Платформа
25. Android: intent-filters, foreground-service без изменений; проверить merge манифеста AdMob.
26. iOS: Info.plist ключи; receive_sharing_intent конфигурация (activation rules) — минимально видео/фото/аудио.

## Этап 5. Проверка
27. `flutter analyze` — чисто.
28. `flutter test` — старые 103 + новые зелёные.
29. Обновить README (фичи, монетизация, приватность, что осталось «Not in this build»).

## Фаза 2 (после v1.0, не в этой итерации)
- Переводы на ~12 языков (ARB), RTL-проверка.
- Альтернативные иконки приложения; виджеты.
- Реальный `in_app_purchase` + боевые AdMob ID (владелец).
- HEIC/AVIF-входы (пересборка FFmpeg с libheif), AV1-энкодер.
- Двухпроходное кодирование для fit-to-size повышенной точности.

## Решения и обоснования
- **Один баннер, скрытый во время конверсии** — жалоба №1 в категории превращается в фичу («реклама никогда не прерывает конверсию»).
- **Grace 14 дней** — паттерн Reader/Cycle; новый пользователь сначала получает ценность.
- **Стаб покупок вместо RevenueCat** — принцип «без платных сервисов»; RC заменён интерфейсом.
- **Энергорежим меняет только `-preset`** — честная и предсказуемая ручка; ничего не троттлим тайком (жалоба «нарочно медленно, чтобы продать Pro»).
- **Simple-режим по умолчанию** — рейтинговая пропасть Panda (4.67) vs antvplayer (3.4) объясняется именно этим.
