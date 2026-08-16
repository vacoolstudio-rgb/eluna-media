// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class L10nSr extends L10n {
  L10nSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Претвори';

  @override
  String get tabQueue => 'Ред';

  @override
  String get addFiles => 'Додај датотеке';

  @override
  String get emptySelectionTitle => 'Још нема датотека';

  @override
  String get emptySelectionBody =>
      'Додајте фотографије, видео или аудио записе. Све се обрађује на овом уређају.';

  @override
  String get sectionOutput => 'Излаз';

  @override
  String get sectionVideo => 'Видео';

  @override
  String get sectionAudio => 'Аудио';

  @override
  String get sectionImage => 'Слика';

  @override
  String get sectionPrivacy => 'Приватност';

  @override
  String get outputFormat => 'Формат';

  @override
  String get videoCodec => 'Видео кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get rateControl => 'Контрола протока';

  @override
  String get rateControlQuality => 'Константан квалитет (CRF)';

  @override
  String get rateControlBitrate => 'Циљни битски проток';

  @override
  String crfLabel(int value) {
    return 'Квалитет (CRF $value)';
  }

  @override
  String get crfHint => 'Нижа вредност значи бољи квалитет и већу датотеку.';

  @override
  String videoBitrate(int value) {
    return 'Битски проток видеа: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Битски проток звука: $value kbps';
  }

  @override
  String get encodingPreset => 'Подешавање кодера';

  @override
  String get encodingPresetHint =>
      'Спорија подешавања боље сажимају, али више греју уређај.';

  @override
  String get presetOriginal => 'Оригинално';

  @override
  String get resolution => 'Резолуција';

  @override
  String get frameRate => 'Број кадрова';

  @override
  String imageQuality(int value) {
    return 'Квалитет: $value';
  }

  @override
  String get lossless => 'Без губитака';

  @override
  String get losslessHint => 'Веће датотеке, излаз веран сваком пикселу.';

  @override
  String get sectionEnhance => 'Побољшање';

  @override
  String get sharpenLabel => 'Оштрина';

  @override
  String get sharpenHint =>
      'Чини ивице израженијим. Не може да спасе мутан или нефокусиран снимак — тог детаља нема у датотеци.';

  @override
  String get sharpenStrongHint =>
      'Јако изоштравање може да остави светле ореоле дуж ивица. Прво пробајте средњи ниво.';

  @override
  String get denoiseLabel => 'Смањење шума';

  @override
  String get denoiseHint =>
      'Чисти зрнастост на тамним и ноћним фотографијама. Превише заглађује ситне детаље.';

  @override
  String get autoColorLabel => 'Аутоматска боја и нивои';

  @override
  String get autoColorHint => 'Развлачи контраст и мало подиже равне боје.';

  @override
  String get upscaleLabel => 'Увећање 2×';

  @override
  String get upscaleHint =>
      'Удвостручује ширину и висину. Не додаје детаље — помаже при штампи или исецању.';

  @override
  String get upscaleConflictHint =>
      'Вратите Резолуцију на Оригинално да бисте увећали слику.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Искључено';

  @override
  String get enhanceLight => 'Благо';

  @override
  String get enhanceMedium => 'Средње';

  @override
  String get enhanceStrong => 'Јако';

  @override
  String get stripMetadata => 'Уклони метаподатке';

  @override
  String get stripMetadataHint =>
      'Уклања EXIF, GPS и временске ознаке из излазне датотеке.';

  @override
  String startConversion(int count) {
    return 'Претвори датотеке ($count)';
  }

  @override
  String get batchResumed => 'Настављено је прекинуто претварање.';

  @override
  String get converting => 'Претварање…';

  @override
  String get cancelBatch => 'Заустави';

  @override
  String get cancelJob => 'Откажи';

  @override
  String get clearFinished => 'Обриши завршено';

  @override
  String get removeJob => 'Уклони';

  @override
  String get shareFile => 'Подели';

  @override
  String get retryJob => 'Покушај поново';

  @override
  String get queueEmptyTitle => 'Ред је празан';

  @override
  String get queueEmptyBody =>
      'Датотеке које додате на картици Претвори појављују се овде.';

  @override
  String queueActiveTab(int count) {
    return 'Активно · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Завршено · $count';
  }

  @override
  String get queueNoActiveTitle => 'Ништа није у току';

  @override
  String get queueNoActiveBody =>
      'Овде се приказују датотеке које чекају или се претварају.';

  @override
  String get queueNoFinishedTitle => 'Још ништа није завршено';

  @override
  String get queueNoFinishedBody =>
      'Претворене датотеке стижу овде, спремне за отварање, чување или дељење.';

  @override
  String get statusQueued => 'У реду';

  @override
  String get statusRunning => 'Претварање';

  @override
  String get statusCompleted => 'Готово';

  @override
  String get statusFailed => 'Неуспело';

  @override
  String get statusCancelled => 'Отказано';

  @override
  String batchSummary(int done, int total) {
    return '$done од $total готово';
  }

  @override
  String batchCompleted(int done) {
    return 'Претворене датотеке: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Претворено $done, неуспело $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% мање';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% више';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Изглед';

  @override
  String get themeSystem => 'Систем';

  @override
  String get language => 'Језик';

  @override
  String get languageSystem => 'Систем';

  @override
  String get privacyTitle => 'Приватност';

  @override
  String get privacyBody =>
      'Eluna Media претвара ваше датотеке у потпуности на овом уређају помоћу уграђене копије FFmpeg-а. Ваше датотеке никада не напуштају уређај, налог није потребан и нема телеметрије. Ништа у апликацији уопште не користи мрежу — она нема чак ни дозволу за приступ интернету.\n\nУклањање метаподатака укључено је подразумевано, па се EXIF, GPS координате и временске ознаке изостављају из датотека које извезете.';

  @override
  String get licenseTitle => 'Лиценцирање';

  @override
  String get licenseBody =>
      'Ова апликација садржи FFmpeg изграђен са x264, x265 и другим GPL компонентама, па се апликација у целини дистрибуира под лиценцом GNU GPL v3.';

  @override
  String get sourceMissing => 'Изворна датотека више није доступна.';

  @override
  String get tabSettings => 'Подешавања';

  @override
  String get introTitle => 'Приватно по замисли';

  @override
  String get introOfflineTitle => 'Претвара на овом уређају';

  @override
  String get introOfflineBody =>
      'Сав посао обавља уграђена копија FFmpeg-а. Ваше датотеке никада не напуштају телефон — претварање ради и у авионском режиму.';

  @override
  String get introTelemetryTitle => 'Нула телеметрије';

  @override
  String get introTelemetryBody =>
      'Без налога, без аналитике, без извештаја о падовима. Апликација не зна ко сте.';

  @override
  String get introMetadataTitle => 'Метаподаци под контролом';

  @override
  String get introMetadataBody =>
      'EXIF, GPS и временске ознаке подразумевано се уклањају из сваке излазне датотеке. То можете да искључите.';

  @override
  String get introFreeNote =>
      'Бесплатно, без реклама и без претплата. Свака могућност, укључујући групно претварање, ваша је од почетка — једино што може да се купи јесте напојница, а она не откључава ништа.';

  @override
  String get introContinue => 'Започните';

  @override
  String get modeSimple => 'Једноставно';

  @override
  String get modeAdvanced => 'Напредно';

  @override
  String get modeAdvancedHint =>
      'Приказује сваки кодек, битски проток и контролу трансформације уместо картица са подешавањима.';

  @override
  String get presetCompressVideoTitle => 'Сажми видео';

  @override
  String get presetCompressVideoBody =>
      'Знатно мањи MP4, квалитет остаје добар';

  @override
  String get presetFitToSizeTitle => 'Уклопи у величину';

  @override
  String get presetFitToSizeBody =>
      'Погодите тачно ограничење — Discord, е-пошта, ћаскање';

  @override
  String get presetCompatibleMp4Title => 'Компатибилан MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Ради свуда';

  @override
  String get presetExtractAudioTitle => 'Издвој звук';

  @override
  String get presetExtractAudioBody => 'MP3 из било ког видеа';

  @override
  String get presetVideoToGifTitle => 'Видео у GIF';

  @override
  String get presetVideoToGifBody => 'Кратак снимак у анимирани GIF';

  @override
  String get presetMergeTitle => 'Споји видео записе';

  @override
  String get presetMergeBody => 'Спаја снимке у један MP4, редом';

  @override
  String get mergeNeedsTwo => 'За спајање изаберите најмање два видео записа.';

  @override
  String mergedVideoName(int count) {
    return 'Спојени видео ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Сажми фотографију';

  @override
  String get presetCompressImageBody => 'Мањи JPEG, губитак је једва видљив';

  @override
  String get presetEnhancePhotoTitle => 'Побољшај фотографију';

  @override
  String get presetEnhancePhotoBody => 'Чистије, оштрије, боља боја';

  @override
  String get presetImageToWebpTitle => 'Фотографија у WebP';

  @override
  String get presetImageToWebpBody => 'Модеран формат, мањи од JPEG-а';

  @override
  String get sizeTargetTitle => 'Циљна величина';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Прилагођено…';

  @override
  String get sizeTargetDialogTitle => 'Циљна величина у MB';

  @override
  String get sizeTargetTooSmall =>
      'Циљ је премали за ово трајање; биће употребљен најближи могући квалитет.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size по датотеци';
  }

  @override
  String estimateTotal(String size) {
    return 'Процењени излаз: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Изабране датотеке: $count';
  }

  @override
  String get promiseOffline => '100% претварање без мреже';

  @override
  String get promiseBatchFree => 'Групно претварање је бесплатно';

  @override
  String get promiseNoWatermark => 'Без водених жигова';

  @override
  String get sectionTransform => 'Трансформација';

  @override
  String get rotateLabel => 'Ротирај';

  @override
  String get flipLabel => 'Пресликај водоравно';

  @override
  String get speedLabel => 'Брзина';

  @override
  String get cropLabel => 'Исеци';

  @override
  String get cropHint =>
      'Централно исецање на изабрани однос страница — квадрат за фидове, 9:16 за приче.';

  @override
  String volumeLabel(int percent) {
    return 'Јачина звука: $percent%';
  }

  @override
  String get addAudioFiles => 'Аудио и остале датотеке';

  @override
  String get hwEncoderLabel => 'Хардверско кодирање';

  @override
  String get hwEncoderHint =>
      'Користи видео чип уређаја у режимима битског протока и уклапања у величину — много брже и хладније. Режим константног квалитета (CRF) увек користи прецизан програмски кодер, а неуспео хардверски задатак аутоматски се понавља програмски.';

  @override
  String get transformNeedsReencode =>
      'Ротација, пресликавање и брзина захтевају поновно кодирање, па су искључени током директног копирања тока.';

  @override
  String get capBitrateLabel => 'Никада не увећавај датотеку';

  @override
  String get capBitrateHint =>
      'Ограничава кодирање на битски проток самог извора. Константан квалитет нема сопствену горњу границу, па већ сажет видео иначе може да испадне већи.';

  @override
  String get keepSubtitles => 'Задржи титлове';

  @override
  String get keepSubtitlesHint =>
      'Преноси записе са титловима у излазну датотеку. Само текстуални титлови.';

  @override
  String get sectionTrim => 'Скраћивање';

  @override
  String get trimEnable => 'Скрати извор';

  @override
  String get trimHint =>
      'Доступно када је у реду тачно једна датотека познатог трајања.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Циљна величина';

  @override
  String get lowBatteryTitle => 'Батерија је слаба';

  @override
  String get lowBatteryBody =>
      'Претварање јако оптерећује процесор. Можете прво да прикључите пуњач или ипак да наставите.';

  @override
  String get lowBatteryContinue => 'Ипак претвори';

  @override
  String get commonCancel => 'Откажи';

  @override
  String get commonOk => 'У реду';

  @override
  String filesReceived(int count) {
    return 'Примљене датотеке: $count';
  }

  @override
  String get saveFile => 'Сачувај';

  @override
  String get savedToGallery => 'Сачувано у галерију, албум „Eluna Media”.';

  @override
  String get savedToDownloads => 'Сачувано у Преузимања.';

  @override
  String get saveFailed => 'Датотеку није било могуће сачувати.';

  @override
  String get jobRemovedUndo => 'Задатак је уклоњен.';

  @override
  String get finishedClearedUndo => 'Завршени задаци су обрисани.';

  @override
  String get undo => 'Опозови';

  @override
  String get errorDetailsTitle => 'Детаљи о грешци';

  @override
  String get sectionConversionPrefs => 'Претварање';

  @override
  String get powerModeLabel => 'Режим рада';

  @override
  String get powerEfficiency => 'Хладно и брзо';

  @override
  String get powerBalanced => 'Уравнотежено';

  @override
  String get powerQuality => 'Највеће сажимање';

  @override
  String get powerModeHint =>
      'Колико снажно ради видео кодер. Хладније и брже значи нешто веће датотеке. Ништа друго се не успорава — никада.';

  @override
  String get hapticsLabel => 'Вибрациона повратна информација';

  @override
  String get networkPrivacyTitle => 'Мрежа и приватност';

  @override
  String get netAuditIntro =>
      'Потпун списак свега у овој апликацији што може да додирне мрежу.';

  @override
  String get netAuditNoneTitle => 'Никаквог приступа мрежи';

  @override
  String get netAuditNoneBody =>
      'Апликација не тражи дозволу за интернет, па не може да допре до мреже ни када би покушала — то можете да проверите у системским подацима о апликацији. Без реклама, без аналитике, без провера ажурирања. „Оцените апликацију” предаје посао апликацији продавнице, која сама обавља сву комуникацију.';

  @override
  String get netAuditConversionTitle => 'Претварање';

  @override
  String get netAuditConversionBody =>
      'Одвија се у потпуности на овом уређају кроз уграђени FFmpeg. Укључите авионски режим и претворите — ради.';

  @override
  String get netAuditTelemetryTitle => 'Телеметрија';

  @override
  String get netAuditTelemetryBody =>
      'Нема је. Апликација не прикупља аналитику, извештаје о падовима ни идентификаторе и нема систем налога.';

  @override
  String get netAuditTipsTitle => 'Напојнице';

  @override
  String get netAuditTipsBody =>
      'Напојницу спроводи апликација Play Store, а не ова — која и даље нема дозволу за интернет. Наплата ипак додаје два реда на списак дозвола: „куповина унутар апликације” и „преглед мрежних веза”, која само очитава да ли веза постоји и не може да је користи. Ништа се никада не купује аутоматски, а напојница не откључава ништа: свака је могућност овде бесплатна.';

  @override
  String get sectionSupport => 'Подршка';

  @override
  String get rateApp => 'Оцените апликацију';

  @override
  String get openLicenses => 'Лиценце отвореног кода';

  @override
  String get presetAudioToMp3Title => 'Претвори звук';

  @override
  String get presetAudioToMp3Body => 'У MP3 — свира на свему';

  @override
  String get presetCompressAudioTitle => 'Сажми звук';

  @override
  String get presetCompressAudioBody => 'Лакши AAC — гласовне поруке, подкасти';

  @override
  String get convertTo => 'Претвори у';

  @override
  String get formatSectionHint =>
      'Наведени су само формати у које ваше датотеке заиста могу да пређу.';

  @override
  String get sourceVideo => 'Видео';

  @override
  String get sourceImage => 'Фотографија';

  @override
  String get sourceAudio => 'Аудио';

  @override
  String get sourceUnknown => 'Датотека';

  @override
  String get mixedSelectionTitle => 'Изабране су различите врсте датотека';

  @override
  String get mixedSelectionBody =>
      'Свака датотека се претвара подешавањем које најбоље одговара њеној врсти. Додајте једну врсту одједном за потпуну контролу.';

  @override
  String get filesTitle => 'Датотеке';

  @override
  String get removeFile => 'Уклони';

  @override
  String timeLeft(String time) {
    return 'још ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Подешавања претварања';

  @override
  String get jobDetails => 'Детаљи';

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
  String get summaryEnhanced => 'Побољшано';

  @override
  String get summaryMetadataStripped => 'Метаподаци уклоњени';

  @override
  String summaryMerge(int count) {
    return 'Спојени снимци: $count';
  }

  @override
  String get shareApp => 'Поделите апликацију';

  @override
  String get shareAppText =>
      'Eluna Media — бесплатан претварач фотографија, видеа и звука који ради потпуно без мреже. Без претплата, без водених жигова, без налога.';

  @override
  String appVersionLabel(String version) {
    return 'Верзија $version';
  }

  @override
  String get openFile => 'Отвори';

  @override
  String get openFolder => 'Прикажи фасциклу';

  @override
  String get noAppToOpen =>
      'Ниједна апликација на овом уређају не може да отвори ту датотеку.';

  @override
  String get openFailed => 'Датотеку није било могуће отворити.';

  @override
  String get twoPassLabel => 'Два пролаза за тачну величину';

  @override
  String get twoPassHint =>
      'Задаци уклапања у величину кодирају се двапут и осетно прецизније погађају задати број бајтова — уз отприлике двоструко више времена и батерије.';

  @override
  String get whatsNewTitle => 'Новости';

  @override
  String get whatsNew1 =>
      'Видео сада може бити AV1: осетно мање датотеке, ако можете да их сачекате.';

  @override
  String get whatsNew2 =>
      'Ново за слике: AVIF, отприлике упола мањи од JPEG-а, и анимирани WebP уместо GIF-а.';

  @override
  String get whatsNew3 =>
      'M4A може бити без губитака — ALAC сада стоји уз AAC.';

  @override
  String get whatsNew4 =>
      'Један екран за изглед: осветљеност, боја нагласка, чисто црна за OLED и Material You.';

  @override
  String get whatsNew5 =>
      'Достигнућа имају медаље, три картице и напредак који можете да поделите као слику.';

  @override
  String get achievementsTitle => 'Достигнућа';

  @override
  String achievementsProgress(int done, int total) {
    return '$done од $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Броји се само на овом уређају. Ништа се нигде не шаље.';

  @override
  String get achFirstConversionTitle => 'Први кораци';

  @override
  String get achFirstConversionBody => 'Претворите своју прву датотеку.';

  @override
  String get achTenConversionsTitle => 'Загрејано';

  @override
  String get achTenConversionsBody => 'Претворите 10 датотека.';

  @override
  String get achFiftyConversionsTitle => 'Стални корисник';

  @override
  String get achFiftyConversionsBody => 'Претворите 50 датотека.';

  @override
  String get achTwoHundredConversionsTitle => 'Радни коњ';

  @override
  String get achTwoHundredConversionsBody => 'Претворите 200 датотека.';

  @override
  String get achThousandConversionsTitle => 'Покретна трака';

  @override
  String get achThousandConversionsBody => 'Претворите 1000 датотека.';

  @override
  String get achSaved100MbTitle => 'Чувар простора';

  @override
  String get achSaved100MbBody => 'Ослободите укупно 100 MB.';

  @override
  String get achSaved1GbTitle => 'Ловац на гигабајте';

  @override
  String get achSaved1GbBody => 'Ослободите укупно 1 GB.';

  @override
  String get achSaved10GbTitle => 'Јунак складишта';

  @override
  String get achSaved10GbBody => 'Ослободите укупно 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Групни радник';

  @override
  String get achBatchOfFiveBody => 'Завршите групу од 5 или више датотека.';

  @override
  String get achBatchOfTwentyTitle => 'Производна линија';

  @override
  String get achBatchOfTwentyBody => 'Завршите групу од 20 или више датотека.';

  @override
  String get achSniperTitle => 'Снајпериста';

  @override
  String get achSniperBody => 'Погодите тачну величину уклапањем у величину.';

  @override
  String get achMemeSmithTitle => 'Ковач мимова';

  @override
  String get achMemeSmithBody => 'Претворите видео у GIF.';

  @override
  String get achSoundHunterTitle => 'Ловац на звук';

  @override
  String get achSoundHunterBody => 'Издвојте звук из видеа.';

  @override
  String get achSubtitleKeeperTitle => 'Чувар титлова';

  @override
  String get achSubtitleKeeperBody => 'Претворите видео уз задржане титлове.';

  @override
  String get achDirectorTitle => 'Редитељ';

  @override
  String get achDirectorBody =>
      'Примените трансформацију — ротацију, исецање, брзину или јачину звука.';

  @override
  String get achAllRounderTitle => 'Свестран';

  @override
  String get achAllRounderBody => 'Претворите видео, звук и слику.';

  @override
  String get achNightOwlTitle => 'Ноћна птица';

  @override
  String get achNightOwlBody => 'Завршите претварање између поноћи и 5 ујутро.';

  @override
  String get achPlatinumTitle => 'Платина';

  @override
  String get achPlatinumBody => 'Освојите сва остала достигнућа.';

  @override
  String get storageTitle => 'Складиште';

  @override
  String get storageBody =>
      'Претворене датотеке остају унутар апликације док их не сачувате или поделите, тамо где им ниједан менаџер датотека не може прићи.';

  @override
  String get storageEmpty => 'Ништа није ускладиштено';

  @override
  String storageUsage(String size) {
    return 'Ускладиштено: $size';
  }

  @override
  String get storageClearTitle => 'Обрисати ускладиштене датотеке?';

  @override
  String get storageClearBody =>
      'Брише сваки завршени резултат који апликација још држи. Датотеке које сте већ сачували или поделили остају нетакнуте.';

  @override
  String get storageClearAction => 'Обриши';

  @override
  String storageCleared(String size) {
    return 'Ослобођено $size';
  }

  @override
  String get autoSaveLabel => 'Аутоматски чувај резултате';

  @override
  String get autoSaveHint =>
      'Ставља сваку завршену датотеку у галерију — звук у Преузимања — чим буде спремна.';

  @override
  String get lowSpaceTitle => 'Није остало много места';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Овој групи треба око $needed, а слободно је само $free. Претварање се може зауставити на пола.';
  }

  @override
  String saveAll(int count) {
    return 'Сачувај све ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Сачувано: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Сачувано $saved од $total';
  }

  @override
  String get presetFitPhotoTitle => 'Уклопи фотографију у величину';

  @override
  String get presetFitPhotoBody =>
      'Стисните слику испод тачног ограничења — обрасци за отпремање, пријаве.';

  @override
  String get photoFitHint =>
      'Апликација пробава квалитете док један не стане. Ако је буџет премали за слику, смањује и величину кадра.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Циљна величина у KB';

  @override
  String get compareAction => 'Упореди';

  @override
  String get compareBefore => 'Пре';

  @override
  String get compareAfter => 'После';

  @override
  String get compareHint => 'Притисните и држите да видите оригинал.';

  @override
  String get trimStart => 'Почетак';

  @override
  String get trimEnd => 'Крај';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, до $duration';
  }

  @override
  String get imageScaleLabel => 'Размера';

  @override
  String get audioChannelsLabel => 'Канали';

  @override
  String get audioMono => 'Моно';

  @override
  String get audioStereo => 'Стерео';

  @override
  String get sampleRateLabel => 'Фреквенција узорковања';

  @override
  String get voiceAudioHint =>
      'Моно на 22,05 kHz отприлике четвороструко смањује гласовни снимак без чујног губитка. За музику оставите обоје оригинално.';

  @override
  String get moveUp => 'Помери горе';

  @override
  String get moveDown => 'Помери доле';

  @override
  String get renameOutput => 'Преименуј резултат';

  @override
  String get renameOutputHint => 'Нови назив';

  @override
  String get renameOutputHelp =>
      'Наставак долази из излазног формата. Оставите празно да резултат добије назив по извору.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Обриши оригинале ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Обриши оригинале након претварања';

  @override
  String get deleteOriginalsHint =>
      'Тражи од система да уклони изворне датотеке након што се резултат сачува. Систем увек приказује шта ће нестати и чека вашу потврду.';

  @override
  String get mediaAccessRequired =>
      'За брисање оригинала потребан је приступ медијској библиотеци.';

  @override
  String originalsDeleted(String size) {
    return 'Оригинали обрисани — ослобођено $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Ништа није обрисано. Могу се пронаћи само датотеке које галерија још држи под њиховим изворним називом.';

  @override
  String reclaimedTotal(String size) {
    return 'Ослобођено овом апликацијом: $size';
  }

  @override
  String get deleteAllData => 'Обриши све податке';

  @override
  String get deleteAllDataHint =>
      'Брише све што апликација чува на овом уређају: ред, претворене датотеке, прегледе, достигнућа и подешавања. Датотеке које сте већ сачували у галерију остају нетакнуте.';

  @override
  String get codecCopy => 'Копирај';

  @override
  String get codecCopyRemux => 'Копирај (remux)';

  @override
  String get codecNoVideo => 'Без видеа';

  @override
  String get codecNoAudio => 'Без звука';

  @override
  String codecLossless(String codec) {
    return '$codec (без губитака)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (анимирано)';
  }

  @override
  String get sizeTargetEmail => 'Е-пошта';

  @override
  String get trimTimeHint => 'm:ss';
}
