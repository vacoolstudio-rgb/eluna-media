# Тестовые экспорты медиа-трекеров (синтетические данные)

Сгенерировано 2026-07-15 для тестирования импорта в eluna_media. Все данные синтетические
(вымышленный пользователь `elunatester`), но **структуры файлов воспроизводят реальные,
документированные форматы экспортов** — на основе настоящих выгрузок, тестовых фикстур
продакшн-парсеров (в т.ч. trakt-web), официальных API-блюпринтов и исходного кода генераторов.

ID тайтлов (IMDb tt-ID, TMDB ID, TVDB series ID, MAL ID) — реальные для известных тайтлов,
чтобы матчинг при импорте работал по-настоящему. Внутренние ID сервисов (trakt id, simkl id,
uuid, boxd.it-ссылки) — правдоподобные синтетические.

## Статус достоверности по сервисам

| Сервис | Файлы | Статус |
|---|---|---|
| **TV Time** GDPR: `tracking-prod-records-v2.csv` (29 колонок), `lists-prod-lists.csv` (Go-map в `objects`) | gdpr-data/ | ✅ CONFIRMED — реальные анонимизированные фикстуры из продакшн-парсера Trakt (trakt/trakt-web) |
| **TV Time** GDPR: `tracking-prod-records.csv` (v1, фильмы), `followed_tv_show.csv` | gdpr-data/ | ⚠️ PARTIAL — заголовки из спеков Trakt, выведенных из реальных репортов; маркеры колонок (`type-uuid-n`, `notification_offset`) подтверждены продакшн-кодом |
| **TV Time** GDPR: `user_tv_show_data.csv`, `user_show_special_status.csv`, `tv_show_rate.csv` | gdpr-data/ | ⚠️ PARTIAL — имена колонок подтверждены 5+ парсерами реальных выгрузок, **порядок колонок не подтверждён** |
| **TV Time** «export my data» 2026: `tvtime-series-episodes/movies/series/lists .csv` + `.json` | tvtime-export-2026-07-15/ | ✅ CONFIRMED — реальные анонимизированные фикстуры trakt-web |
| **Trakt** JSON-бэкап по эндпоинтам (`watched_*`, `history_*`, `ratings_*`, `watchlist_*`, `collection_*`) | trakt/ | ✅ CONFIRMED — схемы дословно из официального API blueprint; раскладка файлов = скрипт darekkay trakt-backup (`trakt_backup_[дата].zip`) |
| **Trakt** VIP CSV списка (`watchlist.csv`, 35 колонок) | trakt/ | ⚠️ PARTIAL — заголовок из треда TMDB (май 2025); колонки-метаданные оставлены пустыми. Состав **официального ZIP** (settings/data) публично не подтверждён — известно только «JSON в отдельных файлах»; CSV истории/оценок VIP не подтверждены и не сгенерированы |
| **Simkl** `SimklBackup.json` | simkl/ | ✅ CONFIRMED (схема = официальный API `/sync/all-items`, подтверждено blueprint'ом и конвертерами); ⚠️ имя файла — сильные вторичные источники. CSV-экспорт Simkl НЕ подтверждён и не сгенерирован; экспорта Simkl→MAL XML не существует |
| **IMDb** `ratings.csv` (14 колонок, с `Original Title`), `WATCHLIST.csv` (18 колонок) | imdb/ | ✅ CONFIRMED — по реальным экспортам 2024–2026 (формат «exports page» пост-2024) |
| **Letterboxd** полный ZIP (17 CSV: diary, ratings, reviews, watched, watchlist, profile, comments, likes/, lists/ (формат «list export v7»), deleted/, orphaned/) | letterboxd/ | ✅ CONFIRMED — по полному реальному экспорту июня 2026. Экспорт НЕ содержит IMDb/TMDb ID — матчинг только по Name+Year |
| **TMDB** `ratings.csv`, `watchlist.csv` (10 колонок, общий заголовок) | tmdb/ | ✅ CONFIRMED — форум TMDB + фикстуры парсеров (Yamtrack); имя скачиваемого файла не подтверждено |
| **MyAnimeList** `animelist_*.xml(.gz)`, `mangalist_*.xml(.gz)` | myanimelist/ | ✅ CONFIRMED — по двум настоящим официальным экспортам мая 2026 (формат «Version 1.1.0», tab-индентация, 23 тега). Манга: `manga_mangadb_id` (не `series_mangadb_id`!), booleans `YES/NO`, приоритет `Low`; аниме: booleans `1/0`, приоритет `LOW`. Включены кейсы частичной даты (`2026-00-00`) и пустой (`0000-00-00`) |
| **AniList** `elunatester.anime.al.xml` (malscraper-стиль) | anilist/ | ✅ CONFIRMED по исходникам экспортеров (malscraper/AL-Exporter/Fern). У AniList НЕТ официального XML-экспорта; это де-факто стандарт. Квирки: пустой `user_id`, `my_tags` первым тегом, подмножество тегов MAL |
| **AniList** `anilist-gdpr-export.json` | anilist/ | ⚠️ PARTIAL — структура по типам парсера anilyzer (не сверено с первичным файлом). Статусы — числа (0..5), даты `started_on/finished_on` — числовой `YYYYMMDD` |
| **Kitsu** `kitsu-elunatester-anime.xml`, `kitsu-elunatester-manga.xml` | kitsu/ | ✅ CONFIRMED по открытому исходному коду kitsu-server (генератор XML). Квирки: `myinfo` только с `user_export_type`, `On Hold` БЕЗ дефиса, `update_on_import=1`, nil-теги отсутствуют полностью, `my_read_volumes` есть даже у аниме. Реальный скачанный файл не добыт (эндпоинт за feature-флагом); GDPR JSON у Kitsu не подтверждён и не сгенерирован |

## Ключевые различия форматов (для парсера)

- **Даты**: Trakt — ISO с миллисекундами (`2026-06-01T20:41:37.000Z`); Simkl — ISO без мс (`...37Z`);
  TV Time GDPR — `YYYY-MM-DD HH:MM:SS` без зоны; TV Time export-2026 — смесь (эпизоды `YYYY-MM-DD HH:MM:SS`, фильмы/сериалы ISO `Z`, иногда с микросекундами); IMDb/Letterboxd — `YYYY-MM-DD`; TMDB — ISO `Z`; MAL — `YYYY-MM-DD` + `0000-00-00` + частичные `2026-00-00`; AniList GDPR — числовой `YYYYMMDD`.
- **ID**: Trakt ids — `tvdb`/`tmdb` числа, `imdb` строка/null; Simkl — `simkl` число, но `tmdb`/`tvdb`/`mal`/`anidb` СТРОКИ; TV Time — TVDB ID (у GDPR-фильмов ID нет вообще — только `movie_name`); Letterboxd — без внешних ID.
- **TV Time v2**: тип строки определяется префиксом `key` (`tracking-stats` / `watch-episode-*` / `rewatch-episode-*` / `user-series-*`); в реальных выгрузках дрейф колонок — читать `ep_id` с фолбэком на `episode_id`, `s_no` → `season_number`. Парсить по именам колонок, не по позициям.
- **Letterboxd lists/*.csv**: многосекционный формат (строка версии → метаданные списка → пустая строка → таблица фильмов).
- **Booleans**: TV Time GDPR v2 — `true/false`, `followed_tv_show` — `1/0`; MAL аниме — `1/0`, MAL манга — `YES/NO`.

## Волна 2: Serializd, Plex, Jellyfin, Emby, Kodi, Bangumi + generic

| Сервис | Файлы | Статус |
|---|---|---|
| **Serializd** | serializd/ | ❗ **Нативного экспорта НЕ СУЩЕСТВУЕТ** (подтверждено по продакшн-бандлу сайта — в настройках только импорт). Де-факто форматы: ✅ `serializd-export.json` + `shows.csv`/`diary.csv` (инструмент belepod/serializd-export; CSV-колонки динамические, camelCase) и ✅ `serializd_to_trakt_watched/watchlist.json` (mwsmws22/serializd_to_trakt). ID = TMDB, рейтинг int 0–10 (0 = нет), даты ISO `Z` |
| **Plex** | plex/ | ❗ Нативного экспорта истории НЕТ (кнопки нет, GDPR-формат недокументирован). Де-факто: ✅ `tautulli_history.json` — дамп API Tautulli `get_history` (все ключи по офиц. документации; эпохи Unix, `watched_status` ∈ {0, 0.25, 0.5, 0.75, 1}, legacy-GUID с IMDb/TVDB против новых `plex://` без ID) и ✅ `tautulli_to_letterboxd.csv` (`Title,Year,Rating10,tmdbID,imdbID,WatchedDate`) |
| **Jellyfin** | jellyfin/ | ✅ `PlaybackReportingBackup-*.tsv` — бэкап плагина Playback Reporting: **9 колонок, TAB, БЕЗ заголовка** (подтверждено исходниками плагина); ItemId/UserId — внутренние GUID, внешних ID нет. ✅ `jellyfin.json` — бэкап watched-статусов (jab416171/jellyfin-backup-watched) — единственный формат с IMDb/TMDB/TVDB ID |
| **Emby** | emby/ | ✅ `PlaybackReportingBackup-*.tsv` — тот же плагин (оригинал), но **12 колонок** (+PauseDuration, RemoteAddress, TranscodeReasons); количество полей в строке — дискриминатор Jellyfin(9) vs Emby(10–12). ✅ `watched-elunatester.txt` — EmbyToolbox, pipe-формат `movie\|name\|year` / `episode\|series\|year\|s\|e` |
| **Kodi** | kodi/ | ✅ `kodi_videodb_2026-07-15/videodb.xml` (single-file export) и NFO-файлы — структура подтверждена исходниками Kodi (VideoInfoTag.cpp). `<version>` = константа `1`; watched = `playcount>0`; `<lastplayed>` — ТОЛЬКО дата; `<resume>` — секунды float 6 знаков; `<dateadded>` — datetime; `<uniqueid type="imdb/tmdb/tvdb">`. ⚠️ полный реальный videodb.xml публично не найден — файл синтезирован по коду + реальным wiki-примерам NFO |
| **Bangumi** | bangumi/ | ❗ Официального экспорта НЕТ. Де-факто: ✅ `collections_api.json` — ответ официального API `/v0/users/{u}/collections` (схема подтверждена живым запросом; type 1–5 = 想看/看过/在看/搁置/抛弃, subject_type 1/2/3/4/6, rate 0–10, даты ISO **+08:00**); ✅ `takeout.json` + `takeout-*.csv` (bangumi-takeout-py; CSV — 12 китайских заголовков, **UTF-8 с BOM**, даты `YYYY-MM-DD HH:MM:SS`) |
| **Generic CSV/JSON/ZIP** | generic/ | 💡 **Предложение схемы** (это ваш собственный формат, не найденный): `eluna_import.csv` (плоский суперсет: title,year,type,ids,season/episode,status,rating,watched_at), `eluna_import.json` (вложенные эпизоды), `eluna_backup/backup.json` (полный бэкап приложения: settings + library + custom_lists) |

Невозможно/не генерировалось: нативный CSV Serializd, нативный экспорт истории Plex (и его GDPR-формат), официальные экспорты Jellyfin/Emby/Bangumi, Bangumi→MAL конвертер (не существует популярного).

## Архивы

- `dist/tvtime.zip` — внутри `gdpr-data.zip` и `tvtime-export-2026-07-15.zip` (два реальных поколения экспорта)
- `dist/trakt_backup_2026-07-15.zip` — JSON-бэкап + VIP CSV
- `dist/simkl.zip`, `dist/imdb.zip`, `dist/letterboxd-elunatester-2026-07-15-10-00-utc.zip`, `dist/tmdb.zip`, `dist/myanimelist.zip`, `dist/anilist.zip`, `dist/kitsu.zip`
- `dist/serializd.zip`, `dist/plex.zip`, `dist/jellyfin.zip`, `dist/emby.zip`, `dist/kodi.zip`, `dist/bangumi.zip`, `dist/generic.zip` (внутри также `eluna_backup.zip` — пример ZIP-бэкапа)
- `eluna_test_exports_2026-07-15.zip` — общий архив (все сервисные ZIP + этот README)
