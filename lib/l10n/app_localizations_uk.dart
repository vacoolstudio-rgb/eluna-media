// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class L10nUk extends L10n {
  L10nUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Конвертація';

  @override
  String get tabQueue => 'Черга';

  @override
  String get tabAbout => 'Про застосунок';

  @override
  String get addFiles => 'Додати файли';

  @override
  String get emptySelectionTitle => 'Файлів поки немає';

  @override
  String get emptySelectionBody =>
      'Додайте фото, відео чи аудіо. Усе обробляється на цьому пристрої.';

  @override
  String get sectionOutput => 'Результат';

  @override
  String get sectionVideo => 'Відео';

  @override
  String get sectionAudio => 'Аудіо';

  @override
  String get sectionImage => 'Зображення';

  @override
  String get sectionPrivacy => 'Приватність';

  @override
  String get outputFormat => 'Формат';

  @override
  String get videoCodec => 'Відеокодек';

  @override
  String get audioCodec => 'Аудіокодек';

  @override
  String get rateControl => 'Керування бітрейтом';

  @override
  String get rateControlQuality => 'Стала якість (CRF)';

  @override
  String get rateControlBitrate => 'Цільовий бітрейт';

  @override
  String crfLabel(int value) {
    return 'Якість (CRF $value)';
  }

  @override
  String get crfHint => 'Менше значення — краща якість і більший файл.';

  @override
  String videoBitrate(int value) {
    return 'Бітрейт відео: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Бітрейт аудіо: $value kbps';
  }

  @override
  String get encodingPreset => 'Пресет кодувальника';

  @override
  String get encodingPresetHint =>
      'Повільніші пресети стискають краще, але сильніше гріють пристрій.';

  @override
  String get presetOriginal => 'Оригінал';

  @override
  String get resolution => 'Роздільна здатність';

  @override
  String get frameRate => 'Частота кадрів';

  @override
  String imageQuality(int value) {
    return 'Якість: $value';
  }

  @override
  String get lossless => 'Без втрат';

  @override
  String get losslessHint => 'Файли більші, результат точний до пікселя.';

  @override
  String get sectionEnhance => 'Покращення';

  @override
  String get sharpenLabel => 'Різкість';

  @override
  String get sharpenHint =>
      'Робить краї чіткішими. Змазаний або розфокусований кадр не врятує — цих деталей у файлі вже немає.';

  @override
  String get sharpenStrongHint =>
      'Сильне підвищення різкості може лишити світлі ореоли по краях. Спершу спробуйте середній рівень.';

  @override
  String get denoiseLabel => 'Зменшення шуму';

  @override
  String get denoiseHint =>
      'Прибирає зернистість на темних і нічних знімках. Надто сильне «замилює» дрібні деталі.';

  @override
  String get autoColorLabel => 'Автоколір і рівні';

  @override
  String get autoColorHint =>
      'Розтягує контраст і трохи оживляє бляклі кольори.';

  @override
  String get upscaleLabel => 'Збільшити 2×';

  @override
  String get upscaleHint =>
      'Подвоює ширину та висоту. Деталей не додасть — знадобиться для друку чи кадрування.';

  @override
  String get upscaleConflictHint =>
      'Щоб збільшити, поверніть «Роздільна здатність» на «Оригінал».';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Вимк.';

  @override
  String get enhanceLight => 'Слабке';

  @override
  String get enhanceMedium => 'Середнє';

  @override
  String get enhanceStrong => 'Сильне';

  @override
  String get stripMetadata => 'Видаляти метадані';

  @override
  String get stripMetadataHint =>
      'Прибирає EXIF, GPS і часові мітки з результату.';

  @override
  String startConversion(int count) {
    return 'Конвертувати: $count';
  }

  @override
  String get batchResumed => 'Перервану конвертацію відновлено.';

  @override
  String get converting => 'Конвертація…';

  @override
  String get cancelBatch => 'Зупинити';

  @override
  String get cancelJob => 'Скасувати';

  @override
  String get clearFinished => 'Очистити завершені';

  @override
  String get removeJob => 'Видалити';

  @override
  String get shareFile => 'Поділитися';

  @override
  String get retryJob => 'Повторити';

  @override
  String get queueEmptyTitle => 'Черга порожня';

  @override
  String get queueEmptyBody =>
      'Файли, додані на вкладці «Конвертація», з\'являться тут.';

  @override
  String queueActiveTab(int count) {
    return 'Активні · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Завершені · $count';
  }

  @override
  String get queueNoActiveTitle => 'Нічого не виконується';

  @override
  String get queueNoActiveBody =>
      'Файли в очікуванні та в роботі з\'являться тут.';

  @override
  String get queueNoFinishedTitle => 'Поки нічого не завершено';

  @override
  String get queueNoFinishedBody =>
      'Готові файли з\'являться тут — їх можна відкрити, зберегти або надіслати.';

  @override
  String get statusQueued => 'У черзі';

  @override
  String get statusRunning => 'Конвертується';

  @override
  String get statusCompleted => 'Готово';

  @override
  String get statusFailed => 'Помилка';

  @override
  String get statusCancelled => 'Скасовано';

  @override
  String batchSummary(int done, int total) {
    return 'Готово $done з $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Конвертовано $done файлу',
      many: 'Конвертовано $done файлів',
      few: 'Конвертовано $done файли',
      one: 'Конвертовано 1 файл',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Готово: $done, помилок: $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'на $percent% менше';
  }

  @override
  String grewPercent(int percent) {
    return 'на $percent% більше';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Оформлення';

  @override
  String get theme => 'Тема';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get language => 'Мова';

  @override
  String get languageSystem => 'Системна';

  @override
  String get privacyTitle => 'Приватність';

  @override
  String get privacyBody =>
      'Eluna Media конвертує файли повністю на цьому пристрої за допомогою вбудованої збірки FFmpeg. Файли ніколи не залишають пристрій, обліковий запис не потрібен, телеметрії немає. Мережа не використовується взагалі — застосунок не має навіть дозволу на доступ до інтернету.\n\nВидалення метаданих увімкнено за замовчуванням, тому EXIF, координати GPS і часові мітки не потрапляють до експортованих файлів.';

  @override
  String get licenseTitle => 'Ліцензія';

  @override
  String get licenseBody =>
      'Застосунок містить збірку FFmpeg із x264, x265 та іншими GPL-компонентами, тому повністю розповсюджується за ліцензією GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Цей формат не підтримує вибраний кодек.';

  @override
  String get sourceMissing => 'Вихідний файл більше недоступний.';

  @override
  String get errorTitle => 'Помилка конвертації';

  @override
  String get tabSettings => 'Налаштування';

  @override
  String get introTitle => 'Приватність за замовчуванням';

  @override
  String get introOfflineTitle => 'Конвертація на пристрої';

  @override
  String get introOfflineBody =>
      'Усю роботу виконує вбудований FFmpeg. Файли не залишають телефон — конвертація працює навіть у режимі польоту.';

  @override
  String get introTelemetryTitle => 'Нуль телеметрії';

  @override
  String get introTelemetryBody =>
      'Ні облікового запису, ні аналітики, ні звітів про збої. Застосунок не знає, хто ви.';

  @override
  String get introMetadataTitle => 'Метадані під контролем';

  @override
  String get introMetadataBody =>
      'EXIF, GPS і часові мітки за замовчуванням видаляються з кожного результату. Це можна вимкнути.';

  @override
  String get introFreeNote =>
      'Безкоштовно: без реклами, без підписок і без покупок у застосунку. Усі функції, зокрема пакетна обробка, доступні одразу.';

  @override
  String get introContinue => 'Почати';

  @override
  String get modeSimple => 'Просто';

  @override
  String get modeAdvanced => 'Детально';

  @override
  String get modeAdvancedHint =>
      'Показувати всі налаштування кодеків, бітрейта і трансформацій замість карток-пресетів.';

  @override
  String get presetCompressVideoTitle => 'Стиснути відео';

  @override
  String get presetCompressVideoBody =>
      'MP4 набагато менший, якість зберігається';

  @override
  String get presetFitToSizeTitle => 'Вкластися в розмір';

  @override
  String get presetFitToSizeBody => 'Точний ліміт — Discord, пошта, чати';

  @override
  String get presetCompatibleMp4Title => 'Сумісний MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Грає всюди';

  @override
  String get presetExtractAudioTitle => 'Витягти звук';

  @override
  String get presetExtractAudioBody => 'MP3 з будь-якого відео';

  @override
  String get presetVideoToGifTitle => 'Відео в GIF';

  @override
  String get presetVideoToGifBody => 'Короткий ролик в анімований GIF';

  @override
  String get presetMergeTitle => 'Склеїти відео';

  @override
  String get presetMergeBody => 'Кілька роликів в один MP4, по порядку';

  @override
  String get mergeNeedsTwo => 'Виберіть щонайменше два відео для склеювання.';

  @override
  String mergedVideoName(int count) {
    return 'Склеєне відео ($count роликів).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Стиснути фото';

  @override
  String get presetCompressImageBody => 'JPEG менший, втрати майже непомітні';

  @override
  String get presetEnhancePhotoTitle => 'Покращити фото';

  @override
  String get presetEnhancePhotoBody => 'Чистіше, чіткіше, живіші кольори';

  @override
  String get presetImageToWebpTitle => 'Фото у WebP';

  @override
  String get presetImageToWebpBody => 'Сучасний формат, менший за JPEG';

  @override
  String get sizeTargetTitle => 'Цільовий розмір';

  @override
  String sizeTargetMb(int mb) {
    return '$mb МБ';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb МБ';
  }

  @override
  String get sizeTargetCustom => 'Свій…';

  @override
  String get sizeTargetDialogTitle => 'Цільовий розмір у МБ';

  @override
  String get sizeTargetTooSmall =>
      'Ціль замала для такої тривалості; буде використано максимально близьку якість.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size на файл';
  }

  @override
  String estimateTotal(String size) {
    return 'Очікуваний розмір: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вибрано $count файлу',
      many: 'Вибрано $count файлів',
      few: 'Вибрано $count файли',
      one: 'Вибрано 1 файл',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Очистити';

  @override
  String get presetExpectsVideo => 'Цей пресет розрахований на відеофайли.';

  @override
  String get presetExpectsImage => 'Цей пресет розрахований на зображення.';

  @override
  String get promiseOffline => 'Конвертація 100% офлайн';

  @override
  String get promiseBatchFree => 'Пакетна обробка безкоштовна';

  @override
  String get promiseNoWatermark => 'Без водяних знаків';

  @override
  String get sectionTransform => 'Трансформація';

  @override
  String get rotateLabel => 'Поворот';

  @override
  String get flipLabel => 'Віддзеркалити по горизонталі';

  @override
  String get speedLabel => 'Швидкість';

  @override
  String get cropLabel => 'Кадрування';

  @override
  String get cropHint =>
      'Обрізання по центру під вибране співвідношення — квадрат для стрічки, 9:16 для сторіз.';

  @override
  String volumeLabel(int percent) {
    return 'Гучність: $percent%';
  }

  @override
  String get addAudioFiles => 'Аудіо та інші файли';

  @override
  String get hwEncoderLabel => 'Апаратне кодування';

  @override
  String get hwEncoderHint =>
      'Використовує відеочип пристрою в режимах бітрейту та цільового розміру — помітно швидше й холодніше. Режим якості (CRF) завжди використовує точний програмний кодувальник, а невдале апаратне завдання автоматично повторюється програмно.';

  @override
  String get transformNeedsReencode =>
      'Поворот, дзеркало та швидкість потребують перекодування, тому під час копіювання потоку недоступні.';

  @override
  String get capBitrateLabel => 'Ніколи не збільшувати файл';

  @override
  String get capBitrateHint =>
      'Обмежує кодування бітрейтом оригіналу. У постійної якості немає власної верхньої межі, тому вже стиснене відео інакше може стати більшим.';

  @override
  String get keepSubtitles => 'Зберігати субтитри';

  @override
  String get keepSubtitlesHint =>
      'Переносить доріжки субтитрів у результат. Лише текстові субтитри.';

  @override
  String get sectionTrim => 'Обрізання';

  @override
  String get trimEnable => 'Обрізати за часом';

  @override
  String get trimHint =>
      'Доступно, коли в черзі рівно один файл із відомою тривалістю.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Цільовий розмір';

  @override
  String get lowBatteryTitle => 'Заряд закінчується';

  @override
  String get lowBatteryBody =>
      'Конвертація сильно навантажує процесор. Можна спочатку підключити зарядку — або продовжити.';

  @override
  String get lowBatteryContinue => 'Все одно конвертувати';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Отримано $count файлу',
      many: 'Отримано $count файлів',
      few: 'Отримано $count файли',
      one: 'Отримано 1 файл',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Зберегти';

  @override
  String get savedToGallery => 'Збережено в галерею, альбом «Eluna Media».';

  @override
  String get savedToDownloads => 'Збережено в «Завантаження».';

  @override
  String get saveFailed => 'Не вдалося зберегти файл.';

  @override
  String get jobRemovedUndo => 'Завдання видалено.';

  @override
  String get finishedClearedUndo => 'Завершені завдання очищено.';

  @override
  String get undo => 'Повернути';

  @override
  String get errorDetailsTitle => 'Деталі помилки';

  @override
  String get oledDark => 'Суцільно чорна темна тема';

  @override
  String get oledDarkHint =>
      'Справжній чорний заощаджує енергію на OLED-екранах.';

  @override
  String get dynamicColorLabel => 'Системні кольори (Material You)';

  @override
  String get dynamicColorHint =>
      'Палітра шпалер пристрою там, де це підтримується.';

  @override
  String get sectionConversionPrefs => 'Конвертація';

  @override
  String get powerModeLabel => 'Режим живлення';

  @override
  String get powerEfficiency => 'Холодний і швидкий';

  @override
  String get powerBalanced => 'Збалансований';

  @override
  String get powerQuality => 'Максимальне стиснення';

  @override
  String get powerModeHint =>
      'Наскільки старанно працює відеокодувальник. Холодніше і швидше — файли трохи більші. Більше ніщо не сповільнюється — ніколи.';

  @override
  String get hapticsLabel => 'Вібровідгук';

  @override
  String get networkPrivacyTitle => 'Мережа і приватність';

  @override
  String get netAuditIntro =>
      'Повний список усього в цьому застосунку, що може звертатися до мережі.';

  @override
  String get netAuditNoneTitle => 'Мережа не використовується взагалі';

  @override
  String get netAuditNoneBody =>
      'Застосунок не запитує дозволу на доступ до інтернету, тож не вийде в мережу, навіть якби захотів, — це видно в системних відомостях про застосунок. Ні реклами, ні аналітики, ні перевірки оновлень. Кнопка «Оцінити застосунок» передає керування магазину — у мережу виходить він.';

  @override
  String get netAuditConversionTitle => 'Конвертація';

  @override
  String get netAuditConversionBody =>
      'Виконується повністю на пристрої через вбудований FFmpeg. Увімкніть режим польоту і спробуйте — працює.';

  @override
  String get netAuditTelemetryTitle => 'Телеметрія';

  @override
  String get netAuditTelemetryBody =>
      'Її немає. Застосунок не збирає ні аналітики, ні звітів про збої, ні ідентифікаторів, і не має системи облікових записів.';

  @override
  String get sectionSupport => 'Підтримка';

  @override
  String get rateApp => 'Оцінити застосунок';

  @override
  String get openLicenses => 'Ліцензії відкритого коду';

  @override
  String get errorFallbackTitle => 'Щось пішло не так';

  @override
  String get errorFallbackBody =>
      'Застосунок зіткнувся з неочікуваною помилкою. Черга і налаштування цілі — поверніться назад і спробуйте ще раз.';

  @override
  String get presetAudioToMp3Title => 'Конвертувати аудіо';

  @override
  String get presetAudioToMp3Body => 'У MP3 — звучить будь-де';

  @override
  String get presetCompressAudioTitle => 'Стиснути аудіо';

  @override
  String get presetCompressAudioBody => 'Легший AAC — голосові, подкасти';

  @override
  String get convertTo => 'Конвертувати у';

  @override
  String get formatRecommended => 'Рекомендовано';

  @override
  String get formatSectionHint =>
      'Показано лише формати, на які ваші файли справді можна перетворити.';

  @override
  String get sourceVideo => 'Відео';

  @override
  String get sourceImage => 'Фото';

  @override
  String get sourceAudio => 'Аудіо';

  @override
  String get sourceUnknown => 'Файл';

  @override
  String get mixedSelectionTitle => 'Вибрано різні типи файлів';

  @override
  String get mixedSelectionBody =>
      'Кожен файл конвертується з найкращим пресетом для свого типу. Додавайте по одному типу за раз, щоб мати повний контроль.';

  @override
  String get filesTitle => 'Файли';

  @override
  String get removeFile => 'Прибрати';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time лишилося';
  }

  @override
  String get jobSettingsTitle => 'Налаштування конвертації';

  @override
  String get jobDetails => 'Деталі';

  @override
  String summaryQuality(int value) {
    return 'CRF $value';
  }

  @override
  String summaryBitrate(int value) {
    return '$value kbps';
  }

  @override
  String summaryTargetSize(String size) {
    return '≤ $size';
  }

  @override
  String get summaryTwoPass => 'Два проходи';

  @override
  String get summaryEnhanced => 'Покращено';

  @override
  String get summaryMetadataStripped => 'Метадані видалено';

  @override
  String summaryMerge(int count) {
    return 'Склеєно $count роликів';
  }

  @override
  String get rateDialogTitle => 'Подобається Eluna Media?';

  @override
  String get rateDialogBody =>
      'Торкніться зірки. Оцінка залишиться між вами і магазином.';

  @override
  String get rateDialogLater => 'Не зараз';

  @override
  String get rateFeedbackTitle => 'Що покращити?';

  @override
  String get rateFeedbackBody =>
      'Напишіть, що пішло не так, — виправимо. Ні облікового запису, ні трекінгу: просто лист, який ви пишете самі.';

  @override
  String get rateSendFeedback => 'Написати відгук';

  @override
  String get rateThanks => 'Дякуємо!';

  @override
  String feedbackSubject(int stars) {
    return 'Відгук про Eluna Media ($stars/5)';
  }

  @override
  String get noEmailApp => 'На пристрої не налаштовано поштовий застосунок.';

  @override
  String get shareApp => 'Поділитися застосунком';

  @override
  String get shareAppText =>
      'Eluna Media — безкоштовний конвертер фото, відео та аудіо, повністю офлайн. Без підписок, без водяних знаків, без облікових записів.';

  @override
  String appVersionLabel(String version) {
    return 'Версія $version';
  }

  @override
  String get openFile => 'Відкрити';

  @override
  String get openFolder => 'Показати теку';

  @override
  String get noAppToOpen =>
      'На цьому пристрої немає застосунку, який відкриє цей файл.';

  @override
  String get openFailed => 'Не вдалося відкрити файл.';

  @override
  String get twoPassLabel => 'Два проходи для точного розміру';

  @override
  String get twoPassHint =>
      'Завдання «в розмір» кодуються двічі і влучають у бюджет помітно точніше — ціною приблизно подвійного часу та заряду.';

  @override
  String get whatsNewTitle => 'Що нового';

  @override
  String get whatsNew1 =>
      'Готові файли тепер одразу потрапляють до галереї, а «Зберегти все» забирає всю партію разом.';

  @override
  String get whatsNew2 =>
      'Фото можна стиснути до точного розміру — від 100 КБ до 2 МБ або власне число.';

  @override
  String get whatsNew3 =>
      'Застосунок більше не накопичує гігабайти: у налаштуваннях видно зайняте місце і є кнопка очищення.';

  @override
  String get whatsNew4 =>
      'Конвертацію можна зупинити просто з сповіщення, а про брак місця застосунок попередить заздалегідь.';

  @override
  String get whatsNew5 =>
      'Мініатюри, порівняння до/після, GIF → MP4, точний час обрізки — і фото тепер обробляються по кілька одночасно.';

  @override
  String get achievementsTitle => 'Досягнення';

  @override
  String achievementsProgress(int done, int total) {
    return '$done з $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Відкрито досягнення: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Рахується лише на цьому пристрої. Нікуди не надсилається.';

  @override
  String get achFirstConversionTitle => 'Перші кроки';

  @override
  String get achFirstConversionBody => 'Сконвертуйте перший файл.';

  @override
  String get achTenConversionsTitle => 'Розігрів';

  @override
  String get achTenConversionsBody => 'Сконвертуйте 10 файлів.';

  @override
  String get achFiftyConversionsTitle => 'Постійний клієнт';

  @override
  String get achFiftyConversionsBody => 'Сконвертуйте 50 файлів.';

  @override
  String get achTwoHundredConversionsTitle => 'Робоча конячка';

  @override
  String get achTwoHundredConversionsBody => 'Сконвертуйте 200 файлів.';

  @override
  String get achThousandConversionsTitle => 'Конвеєр';

  @override
  String get achThousandConversionsBody => 'Сконвертуйте 1000 файлів.';

  @override
  String get achSaved100MbTitle => 'Економія місця';

  @override
  String get achSaved100MbBody => 'Звільніть сумарно 100 МБ.';

  @override
  String get achSaved1GbTitle => 'Мисливець за гігабайтом';

  @override
  String get achSaved1GbBody => 'Звільніть сумарно 1 ГБ.';

  @override
  String get achSaved10GbTitle => 'Герой сховища';

  @override
  String get achSaved10GbBody => 'Звільніть сумарно 10 ГБ.';

  @override
  String get achBatchOfFiveTitle => 'Пакетник';

  @override
  String get achBatchOfFiveBody => 'Завершіть пакет із 5 і більше файлів.';

  @override
  String get achBatchOfTwentyTitle => 'Складальна лінія';

  @override
  String get achBatchOfTwentyBody => 'Завершіть пакет із 20 і більше файлів.';

  @override
  String get achSniperTitle => 'Снайпер';

  @override
  String get achSniperBody =>
      'Влучіть у точний розмір через «Вкластися в розмір».';

  @override
  String get achMemeSmithTitle => 'Мемороб';

  @override
  String get achMemeSmithBody => 'Перетворіть відео на GIF.';

  @override
  String get achSoundHunterTitle => 'Мисливець за звуком';

  @override
  String get achSoundHunterBody => 'Витягніть аудіо з відео.';

  @override
  String get achSubtitleKeeperTitle => 'Хранитель субтитрів';

  @override
  String get achSubtitleKeeperBody =>
      'Сконвертуйте відео зі збереженими субтитрами.';

  @override
  String get achDirectorTitle => 'Режисер';

  @override
  String get achDirectorBody =>
      'Застосуйте трансформацію — поворот, кадрування, швидкість або гучність.';

  @override
  String get achAllRounderTitle => 'Універсал';

  @override
  String get achAllRounderBody => 'Сконвертуйте відео, аудіо та зображення.';

  @override
  String get achNightOwlTitle => 'Сова';

  @override
  String get achNightOwlBody => 'Завершіть конвертацію між північчю і 5 ранку.';

  @override
  String get achPlatinumTitle => 'Платина';

  @override
  String get achPlatinumBody => 'Відкрийте всі інші досягнення.';

  @override
  String get storageTitle => 'Сховище';

  @override
  String get storageBody =>
      'Конвертовані файли залишаються всередині застосунку, доки ви їх не збережете чи не надішлете, — файловий менеджер їх не бачить.';

  @override
  String get storageEmpty => 'Нічого не зберігається';

  @override
  String storageUsage(String size) {
    return 'Зайнято: $size';
  }

  @override
  String get storageClearTitle => 'Очистити сховище?';

  @override
  String get storageClearBody =>
      'Видалить усі готові результати, які ще зберігає застосунок. Уже збережені та надіслані файли не зачіпаються.';

  @override
  String get storageClearAction => 'Очистити';

  @override
  String storageCleared(String size) {
    return 'Звільнено $size';
  }

  @override
  String get autoSaveLabel => 'Зберігати результат автоматично';

  @override
  String get autoSaveHint =>
      'Кожен готовий файл одразу потрапляє до галереї, аудіо — до «Завантажень».';

  @override
  String get lowSpaceTitle => 'Мало вільного місця';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Цій партії потрібно близько $needed, а вільно лише $free. Конвертація може обірватися на середині.';
  }

  @override
  String saveAll(int count) {
    return 'Зберегти все ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Збережено: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Збережено $saved з $total';
  }

  @override
  String get presetFitPhotoTitle => 'Фото під потрібний розмір';

  @override
  String get presetFitPhotoBody =>
      'Стиснути знімок під точний ліміт — форми завантаження, анкети.';

  @override
  String get photoFitHint =>
      'Застосунок добирає якість, доки файл не вкладеться в ліміт. Якщо ліміт замалий, він ще й зменшить кадр.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb КБ';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Цільовий розмір у КБ';

  @override
  String get compareAction => 'Порівняти';

  @override
  String get compareBefore => 'До';

  @override
  String get compareAfter => 'Після';

  @override
  String get compareHint => 'Натисніть і утримуйте, щоб побачити оригінал.';

  @override
  String get trimStart => 'Початок';

  @override
  String get trimEnd => 'Кінець';

  @override
  String trimTimeHelp(String duration) {
    return 'хв:сс, не більше $duration';
  }

  @override
  String get imageScaleLabel => 'Масштаб';

  @override
  String get audioChannelsLabel => 'Канали';

  @override
  String get audioMono => 'Моно';

  @override
  String get audioStereo => 'Стерео';

  @override
  String get sampleRateLabel => 'Частота дискретизації';

  @override
  String get voiceAudioHint =>
      'Моно на 22,05 кГц зменшує голосовий запис приблизно вчетверо без чутних втрат. Для музики залиште обидва параметри вихідними.';

  @override
  String get moveUp => 'Вище';

  @override
  String get moveDown => 'Нижче';
}
