// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class L10nKk extends L10n {
  L10nKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Түрлендіру';

  @override
  String get tabQueue => 'Кезек';

  @override
  String get addFiles => 'Файл қосу';

  @override
  String get emptySelectionTitle => 'Әзірге файл жоқ';

  @override
  String get emptySelectionBody =>
      'Фото, бейне немесе аудио қосыңыз. Барлығы осы құрылғыда өңделеді.';

  @override
  String get sectionOutput => 'Шығыс';

  @override
  String get sectionVideo => 'Бейне';

  @override
  String get sectionAudio => 'Аудио';

  @override
  String get sectionImage => 'Сурет';

  @override
  String get sectionPrivacy => 'Құпиялылық';

  @override
  String get outputFormat => 'Пішім';

  @override
  String get videoCodec => 'Бейне кодегі';

  @override
  String get audioCodec => 'Аудио кодегі';

  @override
  String get rateControl => 'Битрейтті басқару';

  @override
  String get rateControlQuality => 'Тұрақты сапа (CRF)';

  @override
  String get rateControlBitrate => 'Мақсатты битрейт';

  @override
  String crfLabel(int value) {
    return 'Сапа (CRF $value)';
  }

  @override
  String get crfHint =>
      'Мән неғұрлым төмен болса, сапа жоғары әрі файл үлкенірек болады.';

  @override
  String videoBitrate(int value) {
    return 'Бейне битрейті: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Аудио битрейті: $value kbps';
  }

  @override
  String get encodingPreset => 'Кодтаушының алдын ала параметрі';

  @override
  String get encodingPresetHint =>
      'Баяу параметрлер жақсырақ сығады, бірақ құрылғыны көбірек қыздырады.';

  @override
  String get presetOriginal => 'Бастапқы';

  @override
  String get resolution => 'Ажыратымдылық';

  @override
  String get frameRate => 'Кадр жиілігі';

  @override
  String imageQuality(int value) {
    return 'Сапа: $value';
  }

  @override
  String get lossless => 'Шығынсыз';

  @override
  String get losslessHint => 'Файлдар үлкенірек, нәтиже пиксельге дейін дәл.';

  @override
  String get sectionEnhance => 'Жақсарту';

  @override
  String get sharpenLabel => 'Айқындық';

  @override
  String get sharpenHint =>
      'Шеттерді анығырақ етеді. Бұлыңғыр немесе фокустан шыққан кадрды қалпына келтіре алмайды — ол бөлшектер файлда жоқ.';

  @override
  String get sharpenStrongHint =>
      'Күшті айқындау шеттерде ашық ореол қалдыруы мүмкін. Алдымен орташасын байқап көріңіз.';

  @override
  String get denoiseLabel => 'Шуды азайту';

  @override
  String get denoiseHint =>
      'Қараңғы және түнгі суреттердегі дәнділікті тазартады. Артық мөлшері ұсақ бөлшектерді де тегістеп жібереді.';

  @override
  String get autoColorLabel => 'Автоматты түс пен деңгейлер';

  @override
  String get autoColorHint =>
      'Контрастты кеңейтіп, сұрғылт түстерді сәл жандандырады.';

  @override
  String get upscaleLabel => '2× үлкейту';

  @override
  String get upscaleHint =>
      'Ені мен биіктігін екі есе арттырады. Бөлшек қоспайды — басып шығарғанда немесе қиғанда көмектеседі.';

  @override
  String get upscaleConflictHint =>
      'Үлкейту үшін Ажыратымдылықты қайтадан Бастапқы етіп қойыңыз.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Өшірулі';

  @override
  String get enhanceLight => 'Әлсіз';

  @override
  String get enhanceMedium => 'Орташа';

  @override
  String get enhanceStrong => 'Күшті';

  @override
  String get stripMetadata => 'Метадеректерді жою';

  @override
  String get stripMetadataHint =>
      'Нәтижеден EXIF, GPS және уақыт белгілерін өшіреді.';

  @override
  String startConversion(int count) {
    return 'Файлдарды түрлендіру ($count)';
  }

  @override
  String get batchResumed => 'Үзіліп қалған түрлендіру жалғастырылды.';

  @override
  String get converting => 'Түрлендірілуде…';

  @override
  String get cancelBatch => 'Тоқтату';

  @override
  String get cancelJob => 'Бас тарту';

  @override
  String get clearFinished => 'Аяқталғандарды тазалау';

  @override
  String get removeJob => 'Жою';

  @override
  String get shareFile => 'Бөлісу';

  @override
  String get retryJob => 'Қайталау';

  @override
  String get queueEmptyTitle => 'Кезек бос';

  @override
  String get queueEmptyBody =>
      'Түрлендіру қойындысында қосқан файлдарыңыз осында шығады.';

  @override
  String queueActiveTab(int count) {
    return 'Белсенді · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Аяқталды · $count';
  }

  @override
  String get queueNoActiveTitle => 'Орындалып жатқан ештеңе жоқ';

  @override
  String get queueNoActiveBody =>
      'Кезекте тұрған немесе түрлендірілуде жатқан файлдар осында көрінеді.';

  @override
  String get queueNoFinishedTitle => 'Әзірге аяқталған ештеңе жоқ';

  @override
  String get queueNoFinishedBody =>
      'Түрлендірілген файлдар осында жиналады — ашуға, сақтауға немесе бөлісуге дайын.';

  @override
  String get statusQueued => 'Кезекте';

  @override
  String get statusRunning => 'Түрлендірілуде';

  @override
  String get statusCompleted => 'Дайын';

  @override
  String get statusFailed => 'Сәтсіз';

  @override
  String get statusCancelled => 'Тоқтатылды';

  @override
  String batchSummary(int done, int total) {
    return '$total ішінен $done дайын';
  }

  @override
  String batchCompleted(int done) {
    return 'Түрлендірілген файлдар: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done түрлендірілді, $failed сәтсіз аяқталды.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% кішірек';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% үлкенірек';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Сыртқы түрі';

  @override
  String get themeSystem => 'Жүйелік';

  @override
  String get language => 'Тіл';

  @override
  String get languageSystem => 'Жүйелік';

  @override
  String get privacyTitle => 'Құпиялылық';

  @override
  String get privacyBody =>
      'Eluna Media файлдарыңызды құрамындағы FFmpeg көшірмесінің көмегімен толығымен осы құрылғыда түрлендіреді. Файлдарыңыз құрылғыдан ешқашан шықпайды, есептік жазба қажет емес, телеметрия жоқ. Қолданбада желіні пайдаланатын ештеңе жоқ — ол тіпті интернет рұқсатын да сұрамайды.\n\nМетадеректерді жою әдепкі бойынша қосулы, сондықтан экспорттайтын файлдарыңыздан EXIF, GPS координаттары және уақыт белгілері алынып тасталады.';

  @override
  String get licenseTitle => 'Лицензиялау';

  @override
  String get licenseBody =>
      'Бұл қолданбаның құрамында x264, x265 және басқа GPL құрамдастарымен жиналған FFmpeg бар, сондықтан қолданба тұтастай GNU GPL v3 бойынша таратылады.';

  @override
  String get sourceMissing => 'Бастапқы файл енді қолжетімді емес.';

  @override
  String get tabSettings => 'Параметрлер';

  @override
  String get introTitle => 'Бастапқыдан құпия';

  @override
  String get introOfflineTitle => 'Осы құрылғыда түрлендіреді';

  @override
  String get introOfflineBody =>
      'Барлық жұмысты құрамындағы FFmpeg көшірмесі атқарады. Файлдарыңыз телефоннан шықпайды — түрлендіру ұшақ режимінде де жұмыс істейді.';

  @override
  String get introTelemetryTitle => 'Телеметрия мүлдем жоқ';

  @override
  String get introTelemetryBody =>
      'Есептік жазба жоқ, аналитика жоқ, ақау есептері жоқ. Қолданба сіздің кім екеніңізді білмейді.';

  @override
  String get introMetadataTitle => 'Метадеректер бақылауда';

  @override
  String get introMetadataBody =>
      'EXIF, GPS және уақыт белгілері әдепкі бойынша әрбір нәтижеден өшіріледі. Мұны өшіріп қоюға болады.';

  @override
  String get introFreeNote =>
      'Тегін, жарнамасыз және жазылымсыз. Топтап түрлендіруді қоса алғанда, барлық мүмкіндік бірден сіздікі — сатып алуға болатын жалғыз нәрсе бұл ризашылық төлемі, ал ол ештеңені ашпайды.';

  @override
  String get introContinue => 'Бастау';

  @override
  String get modeSimple => 'Қарапайым';

  @override
  String get modeAdvanced => 'Кеңейтілген';

  @override
  String get modeAdvancedHint =>
      'Дайын үлгі карталарының орнына барлық кодек, битрейт және түрлендіру баптауларын көрсетеді.';

  @override
  String get presetCompressVideoTitle => 'Бейнені сығу';

  @override
  String get presetCompressVideoBody =>
      'Әлдеқайда кіші MP4, сапасы жақсы қалады';

  @override
  String get presetFitToSizeTitle => 'Өлшемге сыйдыру';

  @override
  String get presetFitToSizeBody =>
      'Дәл шекке жету — Discord, эл. пошта, чаттар';

  @override
  String get presetCompatibleMp4Title => 'Үйлесімді MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Барлық жерде ойнайды';

  @override
  String get presetExtractAudioTitle => 'Аудионы бөліп алу';

  @override
  String get presetExtractAudioBody => 'Кез келген бейнеден MP3';

  @override
  String get presetVideoToGifTitle => 'Бейнеден GIF';

  @override
  String get presetVideoToGifBody => 'Қысқа үзіндіден анимациялық GIF';

  @override
  String get presetMergeTitle => 'Бейнелерді біріктіру';

  @override
  String get presetMergeBody => 'Үзінділерді ретімен бір MP4-ке жинау';

  @override
  String get mergeNeedsTwo => 'Біріктіру үшін кемінде екі бейне таңдаңыз.';

  @override
  String mergedVideoName(int count) {
    return 'Біріктірілген бейне ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Фотоны сығу';

  @override
  String get presetCompressImageBody => 'Кішірек JPEG, шығыны әрең байқалады';

  @override
  String get presetEnhancePhotoTitle => 'Фотоны жақсарту';

  @override
  String get presetEnhancePhotoBody => 'Тазарақ, айқынырақ, түсі жақсырақ';

  @override
  String get presetImageToWebpTitle => 'Фотодан WebP';

  @override
  String get presetImageToWebpBody => 'Заманауи пішім, JPEG-тен кішірек';

  @override
  String get sizeTargetTitle => 'Мақсатты өлшем';

  @override
  String sizeTargetMb(int mb) {
    return '$mb МБ';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb МБ';
  }

  @override
  String get sizeTargetCustom => 'Өзгеше…';

  @override
  String get sizeTargetDialogTitle => 'Мақсатты өлшем, МБ';

  @override
  String get sizeTargetTooSmall =>
      'Мақсат бұл ұзақтық үшін тым кіші; мүмкін болатын ең жақын сапа қолданылады.';

  @override
  String estimatePerFile(String size) {
    return 'әр файлға ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'Болжамды нәтиже: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Таңдалған файлдар: $count';
  }

  @override
  String get promiseOffline => '100% желісіз түрлендіру';

  @override
  String get promiseBatchFree => 'Топтап өңдеу тегін';

  @override
  String get promiseNoWatermark => 'Су таңбасы жоқ';

  @override
  String get sectionTransform => 'Түрлендірулер';

  @override
  String get rotateLabel => 'Бұру';

  @override
  String get flipLabel => 'Көлденең айналдыру';

  @override
  String get speedLabel => 'Жылдамдық';

  @override
  String get cropLabel => 'Кадрлау';

  @override
  String get cropHint =>
      'Таңдалған қатынас бойынша ортасынан қияды — таспа үшін шаршы, сторис үшін 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'Дыбыс деңгейі: $percent%';
  }

  @override
  String get addAudioFiles => 'Аудио және басқа файлдар';

  @override
  String get hwEncoderLabel => 'Аппараттық кодтау';

  @override
  String get hwEncoderHint =>
      'Битрейт және өлшемге сыйдыру режимдерінде құрылғының бейне чипін пайдаланады — әлдеқайда жылдам әрі салқын. Сапа (CRF) режимі әрқашан дәл бағдарламалық кодтаушыны қолданады, ал сәтсіз аяқталған аппараттық тапсырма автоматты түрде бағдарламалық жолмен қайталанады.';

  @override
  String get transformNeedsReencode =>
      'Бұру, айналдыру және жылдамдық қайта кодтауды талап етеді, сондықтан ағынды көшіру кезінде олар өшірулі.';

  @override
  String get capBitrateLabel => 'Файл ешқашан үлкеймесін';

  @override
  String get capBitrateHint =>
      'Кодтауды бастапқы файлдың өз битрейтімен шектейді. Тұрақты сапаның өз шегі жоқ, сондықтан бұрын сығылған бейне әйтпесе үлкенірек болып шығуы мүмкін.';

  @override
  String get keepSubtitles => 'Субтитрлерді сақтау';

  @override
  String get keepSubtitlesHint =>
      'Субтитр жолдарын нәтижеге көшіреді. Тек мәтіндік субтитрлер.';

  @override
  String get sectionTrim => 'Қысқарту';

  @override
  String get trimEnable => 'Бастапқы файлды қысқарту';

  @override
  String get trimHint =>
      'Кезекте ұзақтығы белгілі дәл бір файл болғанда қолжетімді.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Мақсатты өлшем';

  @override
  String get lowBatteryTitle => 'Батарея заряды аз';

  @override
  String get lowBatteryBody =>
      'Түрлендіру процессорға қатты жүктеме түсіреді. Алдымен қуаттауға қосуыңызға немесе бәрібір жалғастыруыңызға болады.';

  @override
  String get lowBatteryContinue => 'Бәрібір түрлендіру';

  @override
  String get commonCancel => 'Бас тарту';

  @override
  String get commonOk => 'Жарайды';

  @override
  String filesReceived(int count) {
    return 'Алынған файлдар: $count';
  }

  @override
  String get saveFile => 'Сақтау';

  @override
  String get savedToGallery => 'Галереяға, «Eluna Media» альбомына сақталды.';

  @override
  String get savedToDownloads => 'Жүктеулер қалтасына сақталды.';

  @override
  String get saveFailed => 'Файлды сақтау мүмкін болмады.';

  @override
  String get jobRemovedUndo => 'Тапсырма жойылды.';

  @override
  String get finishedClearedUndo => 'Аяқталған тапсырмалар тазаланды.';

  @override
  String get undo => 'Қайтару';

  @override
  String get errorDetailsTitle => 'Қате туралы мәлімет';

  @override
  String get sectionConversionPrefs => 'Түрлендіру';

  @override
  String get powerModeLabel => 'Қуат режимі';

  @override
  String get powerEfficiency => 'Салқын әрі жылдам';

  @override
  String get powerBalanced => 'Теңгерімді';

  @override
  String get powerQuality => 'Барынша сығу';

  @override
  String get powerModeHint =>
      'Бейне кодтаушының қаншалықты күш салатыны. Салқынырақ әрі жылдамырақ дегені файлдардың сәл үлкенірек болуы. Басқа ештеңе шектелмейді — ешқашан.';

  @override
  String get hapticsLabel => 'Дірілмен кері байланыс';

  @override
  String get networkPrivacyTitle => 'Желі және құпиялылық';

  @override
  String get netAuditIntro =>
      'Бұл қолданбада желіге тиісуі мүмкін нәрселердің толық тізімі.';

  @override
  String get netAuditNoneTitle => 'Желіге қатынау мүлдем жоқ';

  @override
  String get netAuditNoneBody =>
      'Қолданба интернет рұқсатын сұрамайды, сондықтан қаласа да желіге шыға алмайды — мұны жүйедегі қолданба туралы мәліметтен тексере аласыз. Жарнама жоқ, аналитика жоқ, жаңарту тексерулері жоқ. «Қолданбаны бағалау» дүкен қолданбасына жібереді, ал ол желімен өзі сөйлеседі.';

  @override
  String get netAuditConversionTitle => 'Түрлендіру';

  @override
  String get netAuditConversionBody =>
      'Құрамындағы FFmpeg арқылы толығымен осы құрылғыда орындалады. Ұшақ режимін қосып, түрлендіріп көріңіз — жұмыс істейді.';

  @override
  String get netAuditTelemetryTitle => 'Телеметрия';

  @override
  String get netAuditTelemetryBody =>
      'Ол жоқ. Қолданба аналитиканы да, ақау есептерін де, идентификаторларды да жинамайды және есептік жазба жүйесі жоқ.';

  @override
  String get netAuditTipsTitle => 'Ризашылық';

  @override
  String get netAuditTipsBody =>
      'Ризашылық төлемін осы қолданба емес, Play Store қолданбасы орындайды — ал бұл қолданбада интернет рұқсаты бұрынғыдай жоқ. Төлемдер рұқсаттар тізіміне екі жол қосады: «қолданба ішіндегі сатып алулар» және «желі қосылымдарын көру»; соңғысы қосылымның бар-жоғын ғана оқиды, оны пайдалана алмайды. Ештеңе өздігінен сатып алынбайды, ал ризашылық ештеңені ашпайды: мұндағының бәрі тегін.';

  @override
  String get sectionSupport => 'Қолдау';

  @override
  String get rateApp => 'Қолданбаны бағалау';

  @override
  String get openLicenses => 'Ашық бастапқы код лицензиялары';

  @override
  String get presetAudioToMp3Title => 'Аудионы түрлендіру';

  @override
  String get presetAudioToMp3Body => 'MP3-ке — бәрінде ойнайды';

  @override
  String get presetCompressAudioTitle => 'Аудионы сығу';

  @override
  String get presetCompressAudioBody =>
      'Жеңілірек AAC — дауыстық жазбалар, подкасттар';

  @override
  String get convertTo => 'Мынаған түрлендіру';

  @override
  String get formatSectionHint =>
      'Тек файлдарыңыз шынымен айнала алатын пішімдер көрсетілген.';

  @override
  String get sourceVideo => 'Бейне';

  @override
  String get sourceImage => 'Фото';

  @override
  String get sourceAudio => 'Аудио';

  @override
  String get sourceUnknown => 'Файл';

  @override
  String get mixedSelectionTitle => 'Әртүрлі файл түрлері таңдалды';

  @override
  String get mixedSelectionBody =>
      'Әр файл өз түріне ең қолайлы дайын үлгімен түрлендіріледі. Толық бақылау үшін бір түрді бөлек қосыңыз.';

  @override
  String get filesTitle => 'Файлдар';

  @override
  String get removeFile => 'Жою';

  @override
  String timeLeft(String time) {
    return '≈ $time қалды';
  }

  @override
  String get jobSettingsTitle => 'Түрлендіру параметрлері';

  @override
  String get jobDetails => 'Мәліметтер';

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
  String get summaryEnhanced => 'Жақсартылған';

  @override
  String get summaryMetadataStripped => 'Метадеректер жойылды';

  @override
  String summaryMerge(int count) {
    return 'Біріктірілген үзінділер: $count';
  }

  @override
  String get shareApp => 'Қолданбамен бөлісу';

  @override
  String get shareAppText =>
      'Eluna Media — тегін, толығымен желісіз жұмыс істейтін фото, бейне және аудио түрлендіргіш. Жазылымсыз, су таңбасыз, есептік жазбасыз.';

  @override
  String appVersionLabel(String version) {
    return 'Нұсқа $version';
  }

  @override
  String get openFile => 'Ашу';

  @override
  String get openFolder => 'Қалтаны көрсету';

  @override
  String get noAppToOpen => 'Бұл құрылғыда ол файлды аша алатын қолданба жоқ.';

  @override
  String get openFailed => 'Файлды ашу мүмкін болмады.';

  @override
  String get twoPassLabel => 'Дәл өлшем үшін екі өтпелі кодтау';

  @override
  String get twoPassHint =>
      'Өлшемге сыйдыру тапсырмалары екі рет кодталады және байт шегіне айтарлықтай дәлірек түседі — уақыт пен батареяның шамамен екі есе шығыны есебінен.';

  @override
  String get whatsNewTitle => 'Не жаңалық';

  @override
  String get whatsNew1 =>
      'Бейнені енді AV1 етіп кодтауға болады: күте алсаңыз, файлдар айтарлықтай кішірек шығады.';

  @override
  String get whatsNew2 =>
      'Суреттерге жаңалық: JPEG-тің шамамен жартысындай AVIF және GIF орнына анимациялық WebP.';

  @override
  String get whatsNew3 => 'M4A шығынсыз бола алады — AAC қасына ALAC қосылды.';

  @override
  String get whatsNew4 =>
      'Сыртқы түрі бір экранда: жарықтық, екпін түсі, таза қара OLED және Material You.';

  @override
  String get whatsNew5 =>
      'Жетістіктерде медальдар, үш қойынды және сурет ретінде бөлісуге болатын прогресс бар.';

  @override
  String get achievementsTitle => 'Жетістіктер';

  @override
  String achievementsProgress(int done, int total) {
    return '$total ішінен $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'Тек осы құрылғыда есептеледі. Ешқайда жіберілмейді.';

  @override
  String get achFirstConversionTitle => 'Алғашқы қадам';

  @override
  String get achFirstConversionBody => 'Алғашқы файлыңызды түрлендіріңіз.';

  @override
  String get achTenConversionsTitle => 'Қарқын алды';

  @override
  String get achTenConversionsBody => '10 файл түрлендіріңіз.';

  @override
  String get achFiftyConversionsTitle => 'Тұрақты қолданушы';

  @override
  String get achFiftyConversionsBody => '50 файл түрлендіріңіз.';

  @override
  String get achTwoHundredConversionsTitle => 'Еңбекқор';

  @override
  String get achTwoHundredConversionsBody => '200 файл түрлендіріңіз.';

  @override
  String get achThousandConversionsTitle => 'Конвейер';

  @override
  String get achThousandConversionsBody => '1000 файл түрлендіріңіз.';

  @override
  String get achSaved100MbTitle => 'Орын үнемдеуші';

  @override
  String get achSaved100MbBody => 'Жалпы 100 МБ орын босатыңыз.';

  @override
  String get achSaved1GbTitle => 'Гигабайт аңшысы';

  @override
  String get achSaved1GbBody => 'Жалпы 1 ГБ орын босатыңыз.';

  @override
  String get achSaved10GbTitle => 'Жад қаһарманы';

  @override
  String get achSaved10GbBody => 'Жалпы 10 ГБ орын босатыңыз.';

  @override
  String get achBatchOfFiveTitle => 'Топпен жұмыс';

  @override
  String get achBatchOfFiveBody =>
      '5 немесе одан көп файлдан тұратын топты аяқтаңыз.';

  @override
  String get achBatchOfTwentyTitle => 'Құрастыру желісі';

  @override
  String get achBatchOfTwentyBody =>
      '20 немесе одан көп файлдан тұратын топты аяқтаңыз.';

  @override
  String get achSniperTitle => 'Мерген';

  @override
  String get achSniperBody => 'Өлшемге сыйдыру арқылы дәл өлшемге түсіңіз.';

  @override
  String get achMemeSmithTitle => 'Мем шебері';

  @override
  String get achMemeSmithBody => 'Бейнені GIF-ке айналдырыңыз.';

  @override
  String get achSoundHunterTitle => 'Дыбыс аңшысы';

  @override
  String get achSoundHunterBody => 'Бейнеден аудионы бөліп алыңыз.';

  @override
  String get achSubtitleKeeperTitle => 'Субтитр сақшысы';

  @override
  String get achSubtitleKeeperBody =>
      'Бейнені субтитрлерін сақтай отырып түрлендіріңіз.';

  @override
  String get achDirectorTitle => 'Режиссёр';

  @override
  String get achDirectorBody =>
      'Түрлендіруді қолданыңыз — бұру, кадрлау, жылдамдық немесе дыбыс деңгейі.';

  @override
  String get achAllRounderTitle => 'Әмбебап';

  @override
  String get achAllRounderBody => 'Бейне, аудио және сурет түрлендіріңіз.';

  @override
  String get achNightOwlTitle => 'Түн құсы';

  @override
  String get achNightOwlBody =>
      'Түн ортасы мен таңғы 5-тің арасында түрлендіруді аяқтаңыз.';

  @override
  String get achPlatinumTitle => 'Платина';

  @override
  String get achPlatinumBody => 'Қалған барлық жетістікті алыңыз.';

  @override
  String get storageTitle => 'Жад';

  @override
  String get storageBody =>
      'Түрлендірілген файлдар сіз оларды сақтағанша немесе бөліскенше қолданба ішінде қалады, оларға ешбір файл менеджері жете алмайды.';

  @override
  String get storageEmpty => 'Сақталған ештеңе жоқ';

  @override
  String storageUsage(String size) {
    return 'Сақталған: $size';
  }

  @override
  String get storageClearTitle => 'Сақталған файлдар өшірілсін бе?';

  @override
  String get storageClearBody =>
      'Қолданба әлі ұстап тұрған барлық аяқталған нәтижені жояды. Бұрын сақтаған немесе бөліскен файлдарыңызға тиіспейді.';

  @override
  String get storageClearAction => 'Тазалау';

  @override
  String storageCleared(String size) {
    return '$size босатылды';
  }

  @override
  String get autoSaveLabel => 'Нәтижелерді автоматты сақтау';

  @override
  String get autoSaveHint =>
      'Аяқталған әр файлды дайын болған бойда галереяға, ал аудионы Жүктеулер қалтасына салады.';

  @override
  String get lowSpaceTitle => 'Бос орын аз қалды';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Бұл топқа шамамен $needed керек, ал бос орын небәрі $free. Түрлендіру жартылай тоқтап қалуы мүмкін.';
  }

  @override
  String saveAll(int count) {
    return 'Барлығын сақтау ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Сақталды: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total ішінен $saved сақталды';
  }

  @override
  String get presetFitPhotoTitle => 'Фотоны өлшемге сыйдыру';

  @override
  String get presetFitPhotoBody =>
      'Суретті дәл шектен төмен сығу — жүктеу формалары, өтінімдер.';

  @override
  String get photoFitHint =>
      'Қолданба сыятын сапа табылғанша бірнеше мәнді байқап көреді. Шек сурет үшін тым кіші болса, кадр өлшемін де кішірейтеді.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb КБ';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Мақсатты өлшем, КБ';

  @override
  String get compareAction => 'Салыстыру';

  @override
  String get compareBefore => 'Дейін';

  @override
  String get compareAfter => 'Кейін';

  @override
  String get compareHint => 'Түпнұсқаны көру үшін басып тұрыңыз.';

  @override
  String get trimStart => 'Басы';

  @override
  String get trimEnd => 'Соңы';

  @override
  String trimTimeHelp(String duration) {
    return 'м:сс, $duration дейін';
  }

  @override
  String get imageScaleLabel => 'Масштаб';

  @override
  String get audioChannelsLabel => 'Арналар';

  @override
  String get audioMono => 'Моно';

  @override
  String get audioStereo => 'Стерео';

  @override
  String get sampleRateLabel => 'Дискреттеу жиілігі';

  @override
  String get voiceAudioHint =>
      '22,05 кГц моно дауыс жазбасын құлаққа білінбейтін шығынмен шамамен төрт есе кішірейтеді. Музыка үшін екеуін де бастапқы күйінде қалдырыңыз.';

  @override
  String get moveUp => 'Жоғары жылжыту';

  @override
  String get moveDown => 'Төмен жылжыту';

  @override
  String get renameOutput => 'Нәтиженің атын өзгерту';

  @override
  String get renameOutputHint => 'Жаңа атау';

  @override
  String get renameOutputHelp =>
      'Кеңейтім шығыс пішімінен алынады. Нәтиже бастапқы файлдың атауын алуы үшін бос қалдырыңыз.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Түпнұсқаларды жою ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Түрлендіргеннен кейін түпнұсқаларды жою';

  @override
  String get deleteOriginalsHint =>
      'Нәтиже сақталған соң бастапқы файлдарды өшіруді жүйеден сұрайды. Жүйе әрқашан не жойылатынын көрсетіп, растауыңызды күтеді.';

  @override
  String get mediaAccessRequired =>
      'Түпнұсқаларды жою үшін медиатекаға рұқсат қажет.';

  @override
  String originalsDeleted(String size) {
    return 'Түпнұсқалар жойылды — $size босады';
  }

  @override
  String get originalsNoneDeleted =>
      'Ештеңе жойылған жоқ. Тек галерея бастапқы атауымен әлі сақтап тұрған файлдарды табуға болады.';

  @override
  String reclaimedTotal(String size) {
    return 'Осы қолданбамен босатылғаны: $size';
  }

  @override
  String get deleteAllData => 'Барлық деректі жою';

  @override
  String get deleteAllDataHint =>
      'Қолданба осы құрылғыда сақтайтын барлық нәрсені өшіреді: кезекті, түрлендірілген файлдарды, алдын ала қарауларды, жетістіктерді және параметрлерді. Галереяға бұрын сақтаған файлдарыңызға тиіспейді.';

  @override
  String get codecCopy => 'Көшіру';

  @override
  String get codecCopyRemux => 'Көшіру (remux)';

  @override
  String get codecNoVideo => 'Бейнесіз';

  @override
  String get codecNoAudio => 'Дыбыссыз';

  @override
  String codecLossless(String codec) {
    return '$codec (шығынсыз)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (анимациялық)';
  }

  @override
  String get sizeTargetEmail => 'Эл. пошта';

  @override
  String get trimTimeHint => 'м:сс';
}
