// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class L10nBg extends L10n {
  L10nBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Конвертиране';

  @override
  String get tabQueue => 'Опашка';

  @override
  String get addFiles => 'Добавяне на файлове';

  @override
  String get emptySelectionTitle => 'Още няма файлове';

  @override
  String get emptySelectionBody =>
      'Добавете снимки, видео или аудио. Всичко се обработва на това устройство.';

  @override
  String get sectionOutput => 'Изход';

  @override
  String get sectionVideo => 'Видео';

  @override
  String get sectionAudio => 'Аудио';

  @override
  String get sectionImage => 'Изображение';

  @override
  String get sectionPrivacy => 'Поверителност';

  @override
  String get outputFormat => 'Формат';

  @override
  String get videoCodec => 'Видеокодек';

  @override
  String get audioCodec => 'Аудиокодек';

  @override
  String get rateControl => 'Контрол на потока';

  @override
  String get rateControlQuality => 'Постоянно качество (CRF)';

  @override
  String get rateControlBitrate => 'Целеви битрейт';

  @override
  String crfLabel(int value) {
    return 'Качество (CRF $value)';
  }

  @override
  String get crfHint =>
      'По-ниската стойност означава по-добро качество и по-голям файл.';

  @override
  String videoBitrate(int value) {
    return 'Битрейт на видеото: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Битрейт на звука: $value kbps';
  }

  @override
  String get encodingPreset => 'Профил на кодера';

  @override
  String get encodingPresetHint =>
      'По-бавните профили компресират по-добре, но нагряват устройството повече.';

  @override
  String get presetOriginal => 'Оригинален';

  @override
  String get resolution => 'Резолюция';

  @override
  String get frameRate => 'Кадрова честота';

  @override
  String imageQuality(int value) {
    return 'Качество: $value';
  }

  @override
  String get lossless => 'Без загуби';

  @override
  String get losslessHint => 'По-големи файлове, резултат точен до пиксела.';

  @override
  String get sectionEnhance => 'Подобряване';

  @override
  String get sharpenLabel => 'Острота';

  @override
  String get sharpenHint =>
      'Прави контурите по-ясни. Не може да възстанови размазан или неизострен кадър — тази детайлност я няма във файла.';

  @override
  String get sharpenStrongHint =>
      'Силното изостряне може да остави светли ореоли по контурите. Опитайте първо със средно.';

  @override
  String get denoiseLabel => 'Намаляване на шума';

  @override
  String get denoiseHint =>
      'Изчиства зърното в тъмни и нощни снимки. Прекаленото заглажда фините детайли.';

  @override
  String get autoColorLabel => 'Автоматичен цвят и нива';

  @override
  String get autoColorHint =>
      'Разтяга контраста и оживява малко плоските цветове.';

  @override
  String get upscaleLabel => 'Увеличаване 2×';

  @override
  String get upscaleHint =>
      'Удвоява ширината и височината. Не добавя детайл — помага при печат или изрязване.';

  @override
  String get upscaleConflictHint =>
      'Върнете Резолюция на Оригинален, за да увеличите.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Изключено';

  @override
  String get enhanceLight => 'Леко';

  @override
  String get enhanceMedium => 'Средно';

  @override
  String get enhanceStrong => 'Силно';

  @override
  String get stripMetadata => 'Премахване на метаданните';

  @override
  String get stripMetadataHint =>
      'Премахва EXIF, GPS и времевите маркери от резултата.';

  @override
  String startConversion(int count) {
    return 'Конвертиране на файлове ($count)';
  }

  @override
  String get batchResumed => 'Прекъснатото конвертиране беше възобновено.';

  @override
  String get converting => 'Конвертиране…';

  @override
  String get cancelBatch => 'Спиране';

  @override
  String get cancelJob => 'Отказ';

  @override
  String get clearFinished => 'Изчистване на завършените';

  @override
  String get removeJob => 'Премахване';

  @override
  String get shareFile => 'Споделяне';

  @override
  String get retryJob => 'Нов опит';

  @override
  String get queueEmptyTitle => 'Опашката е празна';

  @override
  String get queueEmptyBody =>
      'Файловете, които добавяте в раздела Конвертиране, се появяват тук.';

  @override
  String queueActiveTab(int count) {
    return 'Активни · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Завършени · $count';
  }

  @override
  String get queueNoActiveTitle => 'Нищо в ход';

  @override
  String get queueNoActiveBody =>
      'Тук се показват файловете, които чакат или се конвертират.';

  @override
  String get queueNoFinishedTitle => 'Още нищо не е завършено';

  @override
  String get queueNoFinishedBody =>
      'Конвертираните файлове идват тук, готови за отваряне, запазване или споделяне.';

  @override
  String get statusQueued => 'В опашка';

  @override
  String get statusRunning => 'Конвертира се';

  @override
  String get statusCompleted => 'Готово';

  @override
  String get statusFailed => 'Неуспешно';

  @override
  String get statusCancelled => 'Отказано';

  @override
  String batchSummary(int done, int total) {
    return '$done от $total готови';
  }

  @override
  String batchCompleted(int done) {
    return 'Конвертирани файлове: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Конвертирани: $done, неуспешни: $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% по-малко';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% повече';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Външен вид';

  @override
  String get themeSystem => 'Системна';

  @override
  String get language => 'Език';

  @override
  String get languageSystem => 'Системен';

  @override
  String get privacyTitle => 'Поверителност';

  @override
  String get privacyBody =>
      'Eluna Media конвертира файловете ви изцяло на това устройство с вградено копие на FFmpeg. Файловете ви никога не напускат устройството, не е нужен акаунт и няма телеметрия. Нищо в приложението не използва мрежата — то дори няма разрешение за достъп до интернет.\n\nПремахването на метаданните е включено по подразбиране, така че EXIF, координатите от GPS и времевите маркери отпадат от файловете, които изнасяте.';

  @override
  String get licenseTitle => 'Лицензиране';

  @override
  String get licenseBody =>
      'Приложението включва FFmpeg, компилиран с x264, x265 и други компоненти под GPL, затова като цяло се разпространява под GNU GPL v3.';

  @override
  String get sourceMissing => 'Изходният файл вече не е достъпен.';

  @override
  String get tabSettings => 'Настройки';

  @override
  String get introTitle => 'Поверително по замисъл';

  @override
  String get introOfflineTitle => 'Конвертира на това устройство';

  @override
  String get introOfflineBody =>
      'Цялата работа върши вградено копие на FFmpeg. Файловете ви никога не напускат телефона — конвертирането работи и в самолетен режим.';

  @override
  String get introTelemetryTitle => 'Нулева телеметрия';

  @override
  String get introTelemetryBody =>
      'Без акаунт, без анализи, без доклади за сривове. Приложението не знае кой сте.';

  @override
  String get introMetadataTitle => 'Метаданните под контрол';

  @override
  String get introMetadataBody =>
      'EXIF, GPS и времевите маркери се премахват от всеки резултат по подразбиране. Можете да го изключите.';

  @override
  String get introFreeNote =>
      'Безплатно, без реклами и без абонаменти. Всяка функция, включително груповото конвертиране, е ваша от самото начало — единственото, което може да се купи, е бакшиш, и той не отключва нищо.';

  @override
  String get introContinue => 'Да започваме';

  @override
  String get modeSimple => 'Опростен';

  @override
  String get modeAdvanced => 'Разширен';

  @override
  String get modeAdvancedHint =>
      'Показва всички настройки за кодек, битрейт и трансформация вместо картите с профили.';

  @override
  String get presetCompressVideoTitle => 'Компресиране на видео';

  @override
  String get presetCompressVideoBody =>
      'Значително по-малък MP4, качеството остава добро';

  @override
  String get presetFitToSizeTitle => 'Побиране в размер';

  @override
  String get presetFitToSizeBody =>
      'Точно определен лимит — Discord, имейл, чатове';

  @override
  String get presetCompatibleMp4Title => 'Съвместим MP4';

  @override
  String get presetCompatibleMp4Body =>
      'H.264 + AAC. Възпроизвежда се навсякъде';

  @override
  String get presetExtractAudioTitle => 'Извличане на звука';

  @override
  String get presetExtractAudioBody => 'MP3 от всяко видео';

  @override
  String get presetVideoToGifTitle => 'Видео в GIF';

  @override
  String get presetVideoToGifBody => 'Кратък клип в анимиран GIF';

  @override
  String get presetMergeTitle => 'Сливане на видеа';

  @override
  String get presetMergeBody => 'Съединява клипове в един MP4, по ред';

  @override
  String get mergeNeedsTwo => 'Изберете поне две видеа за сливане.';

  @override
  String mergedVideoName(int count) {
    return 'Слято видео ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Компресиране на снимка';

  @override
  String get presetCompressImageBody =>
      'По-малък JPEG, почти незабележима загуба';

  @override
  String get presetEnhancePhotoTitle => 'Подобряване на снимка';

  @override
  String get presetEnhancePhotoBody => 'По-чиста, по-ясна, с по-добър цвят';

  @override
  String get presetImageToWebpTitle => 'Снимка в WebP';

  @override
  String get presetImageToWebpBody => 'Модерен формат, по-малък от JPEG';

  @override
  String get sizeTargetTitle => 'Целеви размер';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'По избор…';

  @override
  String get sizeTargetDialogTitle => 'Целеви размер в MB';

  @override
  String get sizeTargetTooSmall =>
      'Целта е твърде малка за тази продължителност; ще бъде използвано най-близкото възможно качество.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size на файл';
  }

  @override
  String estimateTotal(String size) {
    return 'Очакван резултат: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Избрани файлове: $count';
  }

  @override
  String get promiseOffline => '100% конвертиране офлайн';

  @override
  String get promiseBatchFree => 'Груповото конвертиране е безплатно';

  @override
  String get promiseNoWatermark => 'Без воден знак';

  @override
  String get sectionTransform => 'Трансформация';

  @override
  String get rotateLabel => 'Завъртане';

  @override
  String get flipLabel => 'Хоризонтално огледало';

  @override
  String get speedLabel => 'Скорост';

  @override
  String get cropLabel => 'Изрязване';

  @override
  String get cropHint =>
      'Изрязване от центъра до избраното съотношение — квадрат за емисиите, 9:16 за историите.';

  @override
  String volumeLabel(int percent) {
    return 'Сила на звука: $percent%';
  }

  @override
  String get addAudioFiles => 'Аудио и други файлове';

  @override
  String get hwEncoderLabel => 'Хардуерно кодиране';

  @override
  String get hwEncoderHint =>
      'Използва видеочипа на устройството в режимите с битрейт и с побиране в размер — много по-бързо и с по-малко нагряване. Режимът с постоянно качество (CRF) винаги ползва точния софтуерен кодер, а неуспешна хардуерна задача автоматично се повтаря софтуерно.';

  @override
  String get transformNeedsReencode =>
      'Завъртането, огледалото и скоростта изискват прекодиране, затова са изключени при копиране на потока.';

  @override
  String get capBitrateLabel => 'Файлът никога да не става по-голям';

  @override
  String get capBitrateHint =>
      'Ограничава кодирането до битрейта на самия източник. Постоянното качество няма собствен таван, така че вече компресирано видео иначе може да излезе по-голямо.';

  @override
  String get keepSubtitles => 'Запазване на субтитрите';

  @override
  String get keepSubtitlesHint =>
      'Пренася пътечките със субтитри в резултата. Само текстови субтитри.';

  @override
  String get sectionTrim => 'Изрязване по време';

  @override
  String get trimEnable => 'Изрязване на източника';

  @override
  String get trimHint =>
      'Достъпно, когато в опашката има точно един файл с известна продължителност.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Целеви размер';

  @override
  String get lowBatteryTitle => 'Батерията е изтощена';

  @override
  String get lowBatteryBody =>
      'Конвертирането натоварва процесора силно. Може първо да включите зарядното или да продължите така.';

  @override
  String get lowBatteryContinue => 'Конвертиране въпреки това';

  @override
  String get commonCancel => 'Отказ';

  @override
  String get commonOk => 'ОК';

  @override
  String filesReceived(int count) {
    return 'Получени файлове: $count';
  }

  @override
  String get saveFile => 'Запазване';

  @override
  String get savedToGallery => 'Запазено в галерията, албум „Eluna Media“.';

  @override
  String get savedToDownloads => 'Запазено в Изтегляния.';

  @override
  String get saveFailed => 'Файлът не можа да бъде запазен.';

  @override
  String get jobRemovedUndo => 'Задачата е премахната.';

  @override
  String get finishedClearedUndo => 'Завършените задачи са изчистени.';

  @override
  String get undo => 'Отмяна';

  @override
  String get errorDetailsTitle => 'Подробности за грешката';

  @override
  String get sectionConversionPrefs => 'Конвертиране';

  @override
  String get powerModeLabel => 'Режим на мощност';

  @override
  String get powerEfficiency => 'Хладно и бързо';

  @override
  String get powerBalanced => 'Балансирано';

  @override
  String get powerQuality => 'Максимална компресия';

  @override
  String get powerModeHint =>
      'Колко усилено работи видеокодерът. По-хладно и по-бързо означава малко по-големи файлове. Нищо друго не се ограничава — никога.';

  @override
  String get hapticsLabel => 'Вибрация при действие';

  @override
  String get networkPrivacyTitle => 'Мрежа и поверителност';

  @override
  String get netAuditIntro =>
      'Пълен списък на всичко в това приложение, което би могло да докосне мрежата.';

  @override
  String get netAuditNoneTitle => 'Никакъв достъп до мрежата';

  @override
  String get netAuditNoneBody =>
      'Приложението не иска разрешение за достъп до интернет, така че не може да стигне до мрежата дори да опита — можете да го проверите в системната информация за приложението. Без реклами, без анализи, без проверки за обновления. „Оценете приложението“ предава нататък на приложението на магазина, което води собствения си разговор.';

  @override
  String get netAuditConversionTitle => 'Конвертиране';

  @override
  String get netAuditConversionBody =>
      'Изпълнява се изцяло на това устройство чрез вграден FFmpeg. Включете самолетен режим и конвертирайте — работи.';

  @override
  String get netAuditTelemetryTitle => 'Телеметрия';

  @override
  String get netAuditTelemetryBody =>
      'Няма никаква. Приложението не събира анализи, доклади за сривове или идентификатори и няма система с акаунти.';

  @override
  String get netAuditTipsTitle => 'Бакшиши';

  @override
  String get netAuditTipsBody =>
      'Бакшишът се извършва от приложението Play Store, а не от това — което все така няма разрешение за достъп до интернет. Плащанията добавят два реда в списъка с разрешения: „покупки в приложението“ и „преглед на мрежовите връзки“, което само отчита дали има връзка и не може да я използва. Нищо не се купува автоматично, а бакшишът не отключва нищо: всяка функция тук е безплатна.';

  @override
  String get sectionSupport => 'Подкрепа';

  @override
  String get rateApp => 'Оценете приложението';

  @override
  String get openLicenses => 'Лицензи с отворен код';

  @override
  String get presetAudioToMp3Title => 'Конвертиране на аудио';

  @override
  String get presetAudioToMp3Body => 'В MP3 — свири навсякъде';

  @override
  String get presetCompressAudioTitle => 'Компресиране на аудио';

  @override
  String get presetCompressAudioBody =>
      'По-лек AAC — гласови бележки, подкасти';

  @override
  String get convertTo => 'Конвертиране в';

  @override
  String get formatSectionHint =>
      'Показани са само форматите, в които файловете ви наистина могат да се превърнат.';

  @override
  String get sourceVideo => 'Видео';

  @override
  String get sourceImage => 'Снимка';

  @override
  String get sourceAudio => 'Аудио';

  @override
  String get sourceUnknown => 'Файл';

  @override
  String get mixedSelectionTitle => 'Избрани са различни типове файлове';

  @override
  String get mixedSelectionBody =>
      'Всеки файл се конвертира с най-подходящия профил за своя тип. Добавяйте по един вид наведнъж за пълен контрол.';

  @override
  String get filesTitle => 'Файлове';

  @override
  String get removeFile => 'Премахване';

  @override
  String timeLeft(String time) {
    return 'остават ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Настройки на конвертирането';

  @override
  String get jobDetails => 'Подробности';

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
  String get summaryEnhanced => 'Подобрено';

  @override
  String get summaryMetadataStripped => 'Метаданните са премахнати';

  @override
  String summaryMerge(int count) {
    return 'Слети клипове: $count';
  }

  @override
  String get shareApp => 'Споделяне на приложението';

  @override
  String get shareAppText =>
      'Eluna Media — безплатен, напълно офлайн конвертор за снимки, видео и аудио. Без абонаменти, без водни знаци, без акаунти.';

  @override
  String appVersionLabel(String version) {
    return 'Версия $version';
  }

  @override
  String get openFile => 'Отваряне';

  @override
  String get openFolder => 'Показване на папката';

  @override
  String get noAppToOpen =>
      'Никое приложение на това устройство не може да отвори този файл.';

  @override
  String get openFailed => 'Файлът не можа да бъде отворен.';

  @override
  String get twoPassLabel => 'Две минавания за точен размер';

  @override
  String get twoPassHint =>
      'Задачите с побиране в размер се кодират два пъти и уцелват бюджета в байтове забележимо по-точно — срещу приблизително двойно повече време и заряд.';

  @override
  String get whatsNewTitle => 'Какво е новото';

  @override
  String get whatsNew1 =>
      'Видеото вече може да е AV1: осезаемо по-малки файлове, ако имате търпение да ги изчакате.';

  @override
  String get whatsNew2 =>
      'Ново за снимките: AVIF, около половин JPEG, и анимиран WebP вместо GIF.';

  @override
  String get whatsNew3 => 'M4A може да е без загуби — ALAC вече стои до AAC.';

  @override
  String get whatsNew4 =>
      'Един екран за външния вид: яркост, акцентен цвят, чисто черно за OLED и Material You.';

  @override
  String get whatsNew5 =>
      'Постиженията имат медали, три раздела и напредък, който можете да споделите като картинка.';

  @override
  String get achievementsTitle => 'Постижения';

  @override
  String achievementsProgress(int done, int total) {
    return '$done от $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Броят се само на това устройство. Нищо не се качва никъде.';

  @override
  String get achFirstConversionTitle => 'Първи стъпки';

  @override
  String get achFirstConversionBody => 'Конвертирайте първия си файл.';

  @override
  String get achTenConversionsTitle => 'Загрявка';

  @override
  String get achTenConversionsBody => 'Конвертирайте 10 файла.';

  @override
  String get achFiftyConversionsTitle => 'Редовен';

  @override
  String get achFiftyConversionsBody => 'Конвертирайте 50 файла.';

  @override
  String get achTwoHundredConversionsTitle => 'Работно конче';

  @override
  String get achTwoHundredConversionsBody => 'Конвертирайте 200 файла.';

  @override
  String get achThousandConversionsTitle => 'Конвейер';

  @override
  String get achThousandConversionsBody => 'Конвертирайте 1000 файла.';

  @override
  String get achSaved100MbTitle => 'Пестелив на място';

  @override
  String get achSaved100MbBody => 'Освободете общо 100 MB.';

  @override
  String get achSaved1GbTitle => 'Ловец на гигабайти';

  @override
  String get achSaved1GbBody => 'Освободете общо 1 GB.';

  @override
  String get achSaved10GbTitle => 'Герой на паметта';

  @override
  String get achSaved10GbBody => 'Освободете общо 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Групов работник';

  @override
  String get achBatchOfFiveBody => 'Завършете група от 5 или повече файла.';

  @override
  String get achBatchOfTwentyTitle => 'Поточна линия';

  @override
  String get achBatchOfTwentyBody => 'Завършете група от 20 или повече файла.';

  @override
  String get achSniperTitle => 'Снайперист';

  @override
  String get achSniperBody => 'Уцелете точен размер с побиране в размер.';

  @override
  String get achMemeSmithTitle => 'Ковач на мемета';

  @override
  String get achMemeSmithBody => 'Превърнете видео в GIF.';

  @override
  String get achSoundHunterTitle => 'Ловец на звук';

  @override
  String get achSoundHunterBody => 'Извлечете звука от видео.';

  @override
  String get achSubtitleKeeperTitle => 'Пазител на субтитри';

  @override
  String get achSubtitleKeeperBody =>
      'Конвертирайте видео със запазени субтитри.';

  @override
  String get achDirectorTitle => 'Режисьор';

  @override
  String get achDirectorBody =>
      'Приложете трансформация — завъртане, изрязване, скорост или сила на звука.';

  @override
  String get achAllRounderTitle => 'Универсал';

  @override
  String get achAllRounderBody => 'Конвертирайте видео, аудио и изображение.';

  @override
  String get achNightOwlTitle => 'Нощна птица';

  @override
  String get achNightOwlBody =>
      'Завършете конвертиране между полунощ и 5 сутринта.';

  @override
  String get achPlatinumTitle => 'Платина';

  @override
  String get achPlatinumBody => 'Спечелете всички останали постижения.';

  @override
  String get storageTitle => 'Хранилище';

  @override
  String get storageBody =>
      'Конвертираните файлове остават вътре в приложението, докато не ги запазите или споделите, там, където никой файлов мениджър не може да ги достигне.';

  @override
  String get storageEmpty => 'Няма нищо съхранено';

  @override
  String storageUsage(String size) {
    return 'Съхранени: $size';
  }

  @override
  String get storageClearTitle => 'Да се изчистят ли съхранените файлове?';

  @override
  String get storageClearBody =>
      'Изтрива всеки завършен резултат, който приложението още пази. Файловете, които вече сте запазили или споделили, остават непокътнати.';

  @override
  String get storageClearAction => 'Изчистване';

  @override
  String storageCleared(String size) {
    return 'Освободени са $size';
  }

  @override
  String get autoSaveLabel => 'Автоматично запазване на резултатите';

  @override
  String get autoSaveHint =>
      'Слага всеки завършен файл в галерията — аудиото в Изтегляния — веднага щом е готов.';

  @override
  String get lowSpaceTitle => 'Остава малко място';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Тази група изисква около $needed, а свободни са само $free. Конвертирането може да спре по средата.';
  }

  @override
  String saveAll(int count) {
    return 'Запазване на всички ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Запазени: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Запазени са $saved от $total';
  }

  @override
  String get presetFitPhotoTitle => 'Снимка в размер';

  @override
  String get presetFitPhotoBody =>
      'Свийте изображение под точен лимит — формуляри за качване, заявления.';

  @override
  String get photoFitHint =>
      'Приложението пробва качества, докато едно се побере. Ако бюджетът е твърде малък за снимката, намалява и размера на кадъра.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Целеви размер в KB';

  @override
  String get compareAction => 'Сравнение';

  @override
  String get compareBefore => 'Преди';

  @override
  String get compareAfter => 'След';

  @override
  String get compareHint => 'Натиснете и задръжте, за да видите оригинала.';

  @override
  String get trimStart => 'Начало';

  @override
  String get trimEnd => 'Край';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, до $duration';
  }

  @override
  String get imageScaleLabel => 'Мащаб';

  @override
  String get audioChannelsLabel => 'Канали';

  @override
  String get audioMono => 'Моно';

  @override
  String get audioStereo => 'Стерео';

  @override
  String get sampleRateLabel => 'Честота на дискретизация';

  @override
  String get voiceAudioHint =>
      'Моно при 22,05 kHz свива гласов запис приблизително четири пъти без доловима загуба. За музика оставете и двете на оригинални.';

  @override
  String get moveUp => 'Преместване нагоре';

  @override
  String get moveDown => 'Преместване надолу';

  @override
  String get renameOutput => 'Преименуване на резултата';

  @override
  String get renameOutputHint => 'Ново име';

  @override
  String get renameOutputHelp =>
      'Разширението идва от изходния формат. Оставете полето празно, за да носи резултатът името на източника.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Изтриване на оригиналите ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'Изтриване на оригиналите след конвертиране';

  @override
  String get deleteOriginalsHint =>
      'Моли системата да премахне изходните файлове, след като резултатът е запазен. Системата винаги показва какво ще си отиде и изчаква вашето потвърждение.';

  @override
  String get mediaAccessRequired =>
      'За изтриване на оригиналите е нужен достъп до медийната библиотека.';

  @override
  String originalsDeleted(String size) {
    return 'Оригиналите са изтрити — освободени са $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Нищо не беше изтрито. Намират се само файловете, които галерията още пази под оригиналното им име.';

  @override
  String reclaimedTotal(String size) {
    return 'Освободено с това приложение: $size';
  }

  @override
  String get deleteAllData => 'Изтриване на всички данни';

  @override
  String get deleteAllDataHint =>
      'Изтрива всичко, което приложението пази на това устройство: опашката, конвертираните файлове, прегледите, постиженията и настройките. Файловете, които вече сте запазили в галерията си, остават непокътнати.';

  @override
  String get codecCopy => 'Копиране';

  @override
  String get codecCopyRemux => 'Копиране (remux)';

  @override
  String get codecNoVideo => 'Без видео';

  @override
  String get codecNoAudio => 'Без звук';

  @override
  String codecLossless(String codec) {
    return '$codec (без загуби)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (анимиран)';
  }

  @override
  String get sizeTargetEmail => 'Имейл';

  @override
  String get trimTimeHint => 'm:ss';
}
