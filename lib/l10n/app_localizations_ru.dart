// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Конвертация';

  @override
  String get tabQueue => 'Очередь';

  @override
  String get tabAbout => 'О программе';

  @override
  String get addFiles => 'Добавить файлы';

  @override
  String get emptySelectionTitle => 'Файлов пока нет';

  @override
  String get emptySelectionBody =>
      'Добавьте фото, видео или аудио. Всё обрабатывается на этом устройстве.';

  @override
  String get sectionOutput => 'Результат';

  @override
  String get sectionVideo => 'Видео';

  @override
  String get sectionAudio => 'Аудио';

  @override
  String get sectionImage => 'Изображение';

  @override
  String get sectionPrivacy => 'Приватность';

  @override
  String get outputFormat => 'Формат';

  @override
  String get videoCodec => 'Видеокодек';

  @override
  String get audioCodec => 'Аудиокодек';

  @override
  String get rateControl => 'Управление битрейтом';

  @override
  String get rateControlQuality => 'Постоянное качество (CRF)';

  @override
  String get rateControlBitrate => 'Целевой битрейт';

  @override
  String crfLabel(int value) {
    return 'Качество (CRF $value)';
  }

  @override
  String get crfHint => 'Меньше значение — выше качество и больше файл.';

  @override
  String videoBitrate(int value) {
    return 'Битрейт видео: $value кбит/с';
  }

  @override
  String audioBitrate(int value) {
    return 'Битрейт аудио: $value кбит/с';
  }

  @override
  String get encodingPreset => 'Пресет кодировщика';

  @override
  String get encodingPresetHint =>
      'Медленные пресеты сжимают лучше, но сильнее греют устройство.';

  @override
  String get presetOriginal => 'Исходное';

  @override
  String get resolution => 'Разрешение';

  @override
  String get frameRate => 'Частота кадров';

  @override
  String imageQuality(int value) {
    return 'Качество: $value';
  }

  @override
  String get lossless => 'Без потерь';

  @override
  String get losslessHint => 'Файлы больше, качество попиксельно точное.';

  @override
  String get sectionEnhance => 'Улучшение';

  @override
  String get sharpenLabel => 'Резкость';

  @override
  String get sharpenHint =>
      'Делает края чётче. Смазанный или расфокусированный кадр не спасёт — этих деталей в файле уже нет.';

  @override
  String get sharpenStrongHint =>
      'Сильная резкость может оставить светлые ореолы по краям. Начните со средней.';

  @override
  String get denoiseLabel => 'Шумоподавление';

  @override
  String get denoiseHint =>
      'Убирает зернистость на тёмных и ночных снимках. Слишком сильное «замыливает» мелкие детали.';

  @override
  String get autoColorLabel => 'Автоцвет и уровни';

  @override
  String get autoColorHint =>
      'Растягивает контраст и немного оживляет блёклые цвета.';

  @override
  String get upscaleLabel => 'Увеличить 2×';

  @override
  String get upscaleHint =>
      'Удваивает ширину и высоту. Деталей не добавит — пригодится для печати или кадрирования.';

  @override
  String get upscaleConflictHint =>
      'Чтобы увеличить, верните «Разрешение» в «Исходное».';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Выкл.';

  @override
  String get enhanceLight => 'Слабое';

  @override
  String get enhanceMedium => 'Среднее';

  @override
  String get enhanceStrong => 'Сильное';

  @override
  String get stripMetadata => 'Удалять метаданные';

  @override
  String get stripMetadataHint =>
      'Убирает EXIF, GPS и отметки времени из результата.';

  @override
  String startConversion(int count) {
    return 'Конвертировать: $count';
  }

  @override
  String get batchResumed => 'Прерванная конвертация возобновлена.';

  @override
  String get converting => 'Конвертация…';

  @override
  String get cancelBatch => 'Остановить';

  @override
  String get cancelJob => 'Отменить';

  @override
  String get clearFinished => 'Очистить завершённые';

  @override
  String get removeJob => 'Удалить';

  @override
  String get shareFile => 'Поделиться';

  @override
  String get retryJob => 'Повторить';

  @override
  String get queueEmptyTitle => 'Очередь пуста';

  @override
  String get queueEmptyBody =>
      'Файлы, добавленные на вкладке «Конвертация», появятся здесь.';

  @override
  String queueActiveTab(int count) {
    return 'Активные · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Завершённые · $count';
  }

  @override
  String get queueNoActiveTitle => 'Ничего не выполняется';

  @override
  String get queueNoActiveBody => 'Файлы в ожидании и в работе появятся здесь.';

  @override
  String get queueNoFinishedTitle => 'Пока ничего не завершено';

  @override
  String get queueNoFinishedBody =>
      'Готовые файлы появятся здесь — можно открыть, сохранить или поделиться.';

  @override
  String get statusQueued => 'В очереди';

  @override
  String get statusRunning => 'Конвертируется';

  @override
  String get statusCompleted => 'Готово';

  @override
  String get statusFailed => 'Ошибка';

  @override
  String get statusCancelled => 'Отменено';

  @override
  String batchSummary(int done, int total) {
    return 'Готово $done из $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Конвертировано $done файла',
      many: 'Конвертировано $done файлов',
      few: 'Конвертировано $done файла',
      one: 'Конвертирован 1 файл',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Готово: $done, ошибок: $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'на $percent% меньше';
  }

  @override
  String grewPercent(int percent) {
    return 'на $percent% больше';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Оформление';

  @override
  String get theme => 'Тема';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get language => 'Язык';

  @override
  String get languageSystem => 'Системный';

  @override
  String get privacyTitle => 'Приватность';

  @override
  String get privacyBody =>
      'Eluna Media конвертирует файлы целиком на этом устройстве с помощью встроенной сборки FFmpeg. Файлы никогда не покидают устройство, учётная запись не нужна, телеметрии нет. Сеть не используется вообще — у приложения нет даже разрешения на доступ в интернет.\n\nУдаление метаданных включено по умолчанию, поэтому EXIF, координаты GPS и отметки времени не попадают в экспортируемые файлы.';

  @override
  String get licenseTitle => 'Лицензия';

  @override
  String get licenseBody =>
      'Приложение включает сборку FFmpeg с x264, x265 и другими GPL-компонентами, поэтому распространяется целиком под GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Этот формат не поддерживает выбранный кодек.';

  @override
  String get sourceMissing => 'Исходный файл больше недоступен.';

  @override
  String get errorTitle => 'Ошибка конвертации';

  @override
  String get tabSettings => 'Настройки';

  @override
  String get introTitle => 'Приватность по умолчанию';

  @override
  String get introOfflineTitle => 'Конвертация на устройстве';

  @override
  String get introOfflineBody =>
      'Всю работу делает встроенный FFmpeg. Файлы не покидают телефон — конвертация работает даже в авиарежиме.';

  @override
  String get introTelemetryTitle => 'Ноль телеметрии';

  @override
  String get introTelemetryBody =>
      'Ни аккаунта, ни аналитики, ни отчётов о сбоях. Приложение не знает, кто вы.';

  @override
  String get introMetadataTitle => 'Метаданные под контролем';

  @override
  String get introMetadataBody =>
      'EXIF, GPS и отметки времени по умолчанию удаляются из каждого результата. Это можно отключить.';

  @override
  String get introFreeNote =>
      'Бесплатно: без рекламы, без подписок и без покупок внутри. Все функции, включая пакетную обработку, доступны сразу.';

  @override
  String get introContinue => 'Начать';

  @override
  String get modeSimple => 'Просто';

  @override
  String get modeAdvanced => 'Детально';

  @override
  String get modeAdvancedHint =>
      'Показывать все настройки кодеков, битрейта и трансформаций вместо карточек-пресетов.';

  @override
  String get presetCompressVideoTitle => 'Сжать видео';

  @override
  String get presetCompressVideoBody => 'MP4 намного меньше, качество остаётся';

  @override
  String get presetFitToSizeTitle => 'Уложиться в размер';

  @override
  String get presetFitToSizeBody => 'Точный лимит — Discord, почта, чаты';

  @override
  String get presetCompatibleMp4Title => 'Совместимый MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Играет везде';

  @override
  String get presetExtractAudioTitle => 'Извлечь звук';

  @override
  String get presetExtractAudioBody => 'MP3 из любого видео';

  @override
  String get presetVideoToGifTitle => 'Видео в GIF';

  @override
  String get presetVideoToGifBody => 'Короткий ролик в анимированный GIF';

  @override
  String get presetMergeTitle => 'Склеить видео';

  @override
  String get presetMergeBody => 'Несколько роликов в один MP4, по порядку';

  @override
  String get mergeNeedsTwo => 'Выберите минимум два видео для склейки.';

  @override
  String mergedVideoName(int count) {
    return 'Склеенное видео ($count роликов).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Сжать фото';

  @override
  String get presetCompressImageBody => 'JPEG меньше, потери почти не видны';

  @override
  String get presetEnhancePhotoTitle => 'Улучшить фото';

  @override
  String get presetEnhancePhotoBody => 'Чище, чётче, живее цвета';

  @override
  String get presetImageToWebpTitle => 'Фото в WebP';

  @override
  String get presetImageToWebpBody => 'Современный формат, меньше JPEG';

  @override
  String get sizeTargetTitle => 'Целевой размер';

  @override
  String sizeTargetMb(int mb) {
    return '$mb МБ';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb МБ';
  }

  @override
  String get sizeTargetCustom => 'Свой…';

  @override
  String get sizeTargetDialogTitle => 'Целевой размер в МБ';

  @override
  String get sizeTargetTooSmall =>
      'Цель слишком мала для такой длительности; будет использовано максимально близкое качество.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size на файл';
  }

  @override
  String estimateTotal(String size) {
    return 'Ожидаемый размер: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано $count файла',
      many: 'Выбрано $count файлов',
      few: 'Выбрано $count файла',
      one: 'Выбран 1 файл',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Очистить';

  @override
  String get presetExpectsVideo => 'Этот пресет рассчитан на видеофайлы.';

  @override
  String get presetExpectsImage => 'Этот пресет рассчитан на изображения.';

  @override
  String get promiseOffline => 'Конвертация 100% офлайн';

  @override
  String get promiseBatchFree => 'Пакетная обработка бесплатна';

  @override
  String get promiseNoWatermark => 'Без вотермарок';

  @override
  String get sectionTransform => 'Трансформация';

  @override
  String get rotateLabel => 'Поворот';

  @override
  String get flipLabel => 'Отразить по горизонтали';

  @override
  String get speedLabel => 'Скорость';

  @override
  String get cropLabel => 'Кадрирование';

  @override
  String get cropHint =>
      'Центрированная обрезка под выбранное соотношение — квадрат для ленты, 9:16 для сторис.';

  @override
  String volumeLabel(int percent) {
    return 'Громкость: $percent%';
  }

  @override
  String get addAudioFiles => 'Аудио и другие файлы';

  @override
  String get hwEncoderLabel => 'Аппаратное кодирование';

  @override
  String get hwEncoderHint =>
      'Использует видеочип устройства в режимах битрейта и целевого размера — заметно быстрее и холоднее. Режим качества (CRF) всегда использует точный программный кодировщик, а неудачная аппаратная задача автоматически повторяется программно.';

  @override
  String get transformNeedsReencode =>
      'Поворот, зеркало и скорость требуют перекодирования, поэтому при копировании потока недоступны.';

  @override
  String get capBitrateLabel => 'Никогда не увеличивать файл';

  @override
  String get capBitrateHint =>
      'Ограничивает кодирование битрейтом исходника. У постоянного качества нет верхнего предела, поэтому уже сжатое видео иначе может стать больше.';

  @override
  String get keepSubtitles => 'Сохранять субтитры';

  @override
  String get keepSubtitlesHint =>
      'Переносит дорожки субтитров в результат. Только текстовые субтитры.';

  @override
  String get sectionTrim => 'Обрезка';

  @override
  String get trimEnable => 'Обрезать по времени';

  @override
  String get trimHint =>
      'Доступно, когда в очереди ровно один файл с известной длительностью.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Целевой размер';

  @override
  String get lowBatteryTitle => 'Заряд на исходе';

  @override
  String get lowBatteryBody =>
      'Конвертация сильно нагружает процессор. Можно сначала подключить зарядку — или продолжить.';

  @override
  String get lowBatteryContinue => 'Всё равно конвертировать';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonOk => 'ОК';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Получено $count файла',
      many: 'Получено $count файлов',
      few: 'Получено $count файла',
      one: 'Получен 1 файл',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Сохранить';

  @override
  String get savedToGallery => 'Сохранено в галерею, альбом «Eluna Media».';

  @override
  String get savedToDownloads => 'Сохранено в «Загрузки».';

  @override
  String get saveFailed => 'Не удалось сохранить файл.';

  @override
  String get jobRemovedUndo => 'Задание удалено.';

  @override
  String get finishedClearedUndo => 'Завершённые задания очищены.';

  @override
  String get undo => 'Отменить';

  @override
  String get errorDetailsTitle => 'Подробности ошибки';

  @override
  String get oledDark => 'Чисто чёрная тёмная тема';

  @override
  String get oledDarkHint =>
      'Настоящий чёрный экономит энергию на OLED-экранах.';

  @override
  String get dynamicColorLabel => 'Системные цвета (Material You)';

  @override
  String get dynamicColorHint =>
      'Палитра обоев устройства там, где это поддерживается.';

  @override
  String get sectionConversionPrefs => 'Конвертация';

  @override
  String get powerModeLabel => 'Режим энергопотребления';

  @override
  String get powerEfficiency => 'Холодный и быстрый';

  @override
  String get powerBalanced => 'Сбалансированный';

  @override
  String get powerQuality => 'Максимальное сжатие';

  @override
  String get powerModeHint =>
      'Насколько усердно работает видеокодировщик. Холоднее и быстрее — файлы чуть больше. Больше ничего не замедляется — никогда.';

  @override
  String get hapticsLabel => 'Виброотклик';

  @override
  String get networkPrivacyTitle => 'Сеть и приватность';

  @override
  String get netAuditIntro =>
      'Полный список всего в этом приложении, что может обратиться к сети.';

  @override
  String get netAuditNoneTitle => 'Сеть не используется вообще';

  @override
  String get netAuditNoneBody =>
      'У приложения нет разрешения на доступ в интернет — оно не сможет выйти в сеть, даже если захочет; это видно в системных сведениях о приложении. Ни рекламы, ни аналитики, ни проверки обновлений. Кнопка «Оценить приложение» передаёт управление магазину — в сеть выходит он, а не мы.';

  @override
  String get netAuditConversionTitle => 'Конвертация';

  @override
  String get netAuditConversionBody =>
      'Выполняется целиком на устройстве через встроенный FFmpeg. Включите авиарежим и попробуйте — работает.';

  @override
  String get netAuditTelemetryTitle => 'Телеметрия';

  @override
  String get netAuditTelemetryBody =>
      'Её нет. Приложение не собирает ни аналитику, ни отчёты о сбоях, ни идентификаторы, и не имеет системы аккаунтов.';

  @override
  String get sectionSupport => 'Поддержка';

  @override
  String get rateApp => 'Оценить приложение';

  @override
  String get openLicenses => 'Лицензии открытого кода';

  @override
  String get errorFallbackTitle => 'Что-то пошло не так';

  @override
  String get errorFallbackBody =>
      'Приложение столкнулось с неожиданной ошибкой. Очередь и настройки целы — вернитесь назад и попробуйте ещё раз.';

  @override
  String get presetAudioToMp3Title => 'Конвертировать аудио';

  @override
  String get presetAudioToMp3Body => 'В MP3 — играет везде';

  @override
  String get presetCompressAudioTitle => 'Сжать аудио';

  @override
  String get presetCompressAudioBody => 'Лёгкий AAC — голосовые, подкасты';

  @override
  String get convertTo => 'Конвертировать в';

  @override
  String get formatRecommended => 'Рекомендуется';

  @override
  String get formatSectionHint =>
      'Показаны только форматы, в которые ваши файлы действительно можно превратить.';

  @override
  String get sourceVideo => 'Видео';

  @override
  String get sourceImage => 'Фото';

  @override
  String get sourceAudio => 'Аудио';

  @override
  String get sourceUnknown => 'Файл';

  @override
  String get mixedSelectionTitle => 'Выбраны файлы разных типов';

  @override
  String get mixedSelectionBody =>
      'Каждый файл будет сконвертирован лучшим пресетом для своего типа. Для полного контроля добавляйте по одному типу за раз.';

  @override
  String get filesTitle => 'Файлы';

  @override
  String get removeFile => 'Убрать';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time осталось';
  }

  @override
  String get jobSettingsTitle => 'Настройки конвертации';

  @override
  String get jobDetails => 'Подробнее';

  @override
  String summaryQuality(int value) {
    return 'CRF $value';
  }

  @override
  String summaryBitrate(int value) {
    return '$value кбит/с';
  }

  @override
  String summaryTargetSize(String size) {
    return '≤ $size';
  }

  @override
  String get summaryTwoPass => 'Два прохода';

  @override
  String get summaryEnhanced => 'Улучшено';

  @override
  String get summaryMetadataStripped => 'Метаданные удалены';

  @override
  String summaryMerge(int count) {
    return 'Склейка $count роликов';
  }

  @override
  String get rateDialogTitle => 'Нравится Eluna Media?';

  @override
  String get rateDialogBody =>
      'Нажмите на звезду. Оценка останется между вами и магазином.';

  @override
  String get rateDialogLater => 'Не сейчас';

  @override
  String get rateFeedbackTitle => 'Что улучшить?';

  @override
  String get rateFeedbackBody =>
      'Напишите, что пошло не так, — исправим. Ни аккаунта, ни трекинга: просто письмо, которое вы пишете сами.';

  @override
  String get rateSendFeedback => 'Написать отзыв';

  @override
  String get rateThanks => 'Спасибо!';

  @override
  String feedbackSubject(int stars) {
    return 'Отзыв о Eluna Media ($stars/5)';
  }

  @override
  String get noEmailApp => 'На устройстве не настроено почтовое приложение.';

  @override
  String get shareApp => 'Поделиться приложением';

  @override
  String get shareAppText =>
      'Eluna Media — бесплатный конвертер фото, видео и аудио, полностью офлайн. Без подписок, без вотермарок, без аккаунтов.';

  @override
  String appVersionLabel(String version) {
    return 'Версия $version';
  }

  @override
  String get openFile => 'Открыть';

  @override
  String get openFolder => 'Показать папку';

  @override
  String get noAppToOpen =>
      'На устройстве нет приложения, которое откроет этот файл.';

  @override
  String get openFailed => 'Не удалось открыть файл.';

  @override
  String get twoPassLabel => 'Два прохода для точного размера';

  @override
  String get twoPassHint =>
      'Задания «в размер» кодируются дважды и попадают в бюджет заметно точнее — ценой примерно двойного времени и заряда.';

  @override
  String get whatsNewTitle => 'Что нового';

  @override
  String get whatsNew1 =>
      'Готовые файлы теперь сразу попадают в галерею, а «Сохранить все» забирает всю партию разом.';

  @override
  String get whatsNew2 =>
      'Фото можно ужать до точного размера — от 100 КБ до 2 МБ или своё число.';

  @override
  String get whatsNew3 =>
      'Приложение больше не копит гигабайты: в настройках видно занятое место и есть кнопка очистки.';

  @override
  String get whatsNew4 =>
      'Конвертацию можно остановить прямо из уведомления, а о нехватке места приложение предупредит заранее.';

  @override
  String get whatsNew5 =>
      'Миниатюры, сравнение до/после, GIF → MP4, точное время обрезки — и фото теперь обрабатываются по несколько сразу.';

  @override
  String get achievementsTitle => 'Достижения';

  @override
  String achievementsProgress(int done, int total) {
    return '$done из $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Достижение открыто: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Считается только на этом устройстве. Никуда не отправляется.';

  @override
  String get achFirstConversionTitle => 'Первые шаги';

  @override
  String get achFirstConversionBody => 'Сконвертируйте первый файл.';

  @override
  String get achTenConversionsTitle => 'Разогрев';

  @override
  String get achTenConversionsBody => 'Сконвертируйте 10 файлов.';

  @override
  String get achFiftyConversionsTitle => 'Постоянный клиент';

  @override
  String get achFiftyConversionsBody => 'Сконвертируйте 50 файлов.';

  @override
  String get achTwoHundredConversionsTitle => 'Рабочая лошадка';

  @override
  String get achTwoHundredConversionsBody => 'Сконвертируйте 200 файлов.';

  @override
  String get achThousandConversionsTitle => 'Конвейер';

  @override
  String get achThousandConversionsBody => 'Сконвертируйте 1000 файлов.';

  @override
  String get achSaved100MbTitle => 'Экономия места';

  @override
  String get achSaved100MbBody => 'Освободите суммарно 100 МБ.';

  @override
  String get achSaved1GbTitle => 'Охотник за гигабайтом';

  @override
  String get achSaved1GbBody => 'Освободите суммарно 1 ГБ.';

  @override
  String get achSaved10GbTitle => 'Герой хранилища';

  @override
  String get achSaved10GbBody => 'Освободите суммарно 10 ГБ.';

  @override
  String get achBatchOfFiveTitle => 'Пакетник';

  @override
  String get achBatchOfFiveBody => 'Завершите пакет из 5 и более файлов.';

  @override
  String get achBatchOfTwentyTitle => 'Сборочная линия';

  @override
  String get achBatchOfTwentyBody => 'Завершите пакет из 20 и более файлов.';

  @override
  String get achSniperTitle => 'Снайпер';

  @override
  String get achSniperBody =>
      'Попадите в точный размер через «Уложиться в размер».';

  @override
  String get achMemeSmithTitle => 'Мемодел';

  @override
  String get achMemeSmithBody => 'Превратите видео в GIF.';

  @override
  String get achSoundHunterTitle => 'Охотник за звуком';

  @override
  String get achSoundHunterBody => 'Извлеките аудио из видео.';

  @override
  String get achSubtitleKeeperTitle => 'Хранитель субтитров';

  @override
  String get achSubtitleKeeperBody =>
      'Сконвертируйте видео с сохранением субтитров.';

  @override
  String get achDirectorTitle => 'Режиссёр';

  @override
  String get achDirectorBody =>
      'Примените трансформацию — поворот, кадрирование, скорость или громкость.';

  @override
  String get achAllRounderTitle => 'Универсал';

  @override
  String get achAllRounderBody => 'Сконвертируйте видео, аудио и изображение.';

  @override
  String get achNightOwlTitle => 'Сова';

  @override
  String get achNightOwlBody =>
      'Завершите конвертацию между полуночью и 5 утра.';

  @override
  String get achPlatinumTitle => 'Платина';

  @override
  String get achPlatinumBody => 'Откройте все остальные достижения.';

  @override
  String get storageTitle => 'Хранилище';

  @override
  String get storageBody =>
      'Конвертированные файлы остаются внутри приложения, пока вы их не сохраните или не отправите, — файловый менеджер их не видит.';

  @override
  String get storageEmpty => 'Ничего не хранится';

  @override
  String storageUsage(String size) {
    return 'Занято: $size';
  }

  @override
  String get storageClearTitle => 'Очистить хранилище?';

  @override
  String get storageClearBody =>
      'Удалит все готовые результаты, которые ещё лежат в приложении. Уже сохранённые и отправленные файлы не затрагиваются.';

  @override
  String get storageClearAction => 'Очистить';

  @override
  String storageCleared(String size) {
    return 'Освобождено $size';
  }

  @override
  String get autoSaveLabel => 'Сохранять результат автоматически';

  @override
  String get autoSaveHint =>
      'Каждый готовый файл сразу попадает в галерею, аудио — в «Загрузки».';

  @override
  String get lowSpaceTitle => 'Мало свободного места';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Этой партии нужно около $needed, а свободно только $free. Конвертация может оборваться на середине.';
  }

  @override
  String saveAll(int count) {
    return 'Сохранить все ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Сохранено: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Сохранено $saved из $total';
  }

  @override
  String get presetFitPhotoTitle => 'Фото под нужный размер';

  @override
  String get presetFitPhotoBody =>
      'Ужать снимок под точный лимит — формы загрузки, анкеты.';

  @override
  String get photoFitHint =>
      'Приложение подбирает качество, пока файл не уложится в лимит. Если лимит слишком мал для снимка, оно ещё и уменьшит кадр.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb КБ';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Целевой размер в КБ';

  @override
  String get compareAction => 'Сравнить';

  @override
  String get compareBefore => 'До';

  @override
  String get compareAfter => 'После';

  @override
  String get compareHint => 'Нажмите и удерживайте, чтобы увидеть оригинал.';

  @override
  String get trimStart => 'Начало';

  @override
  String get trimEnd => 'Конец';

  @override
  String trimTimeHelp(String duration) {
    return 'м:сс, не больше $duration';
  }

  @override
  String get imageScaleLabel => 'Масштаб';

  @override
  String get audioChannelsLabel => 'Каналы';

  @override
  String get audioMono => 'Моно';

  @override
  String get audioStereo => 'Стерео';

  @override
  String get sampleRateLabel => 'Частота дискретизации';

  @override
  String get voiceAudioHint =>
      'Моно на 22,05 кГц уменьшает голосовую запись примерно вчетверо без слышимых потерь. Для музыки оставьте оба параметра исходными.';

  @override
  String get moveUp => 'Выше';

  @override
  String get moveDown => 'Ниже';
}
