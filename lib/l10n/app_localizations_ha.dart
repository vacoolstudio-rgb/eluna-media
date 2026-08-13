// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class L10nHa extends L10n {
  L10nHa([String locale = 'ha']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Sauyawa';

  @override
  String get tabQueue => 'Jeri';

  @override
  String get addFiles => 'Ƙara fayiloli';

  @override
  String get emptySelectionTitle => 'Babu fayiloli tukuna';

  @override
  String get emptySelectionBody =>
      'Ƙara hotuna, bidiyo ko sauti. Ana sarrafa komai a wannan na\'urar.';

  @override
  String get sectionOutput => 'Fitarwa';

  @override
  String get sectionVideo => 'Bidiyo';

  @override
  String get sectionAudio => 'Sauti';

  @override
  String get sectionImage => 'Hoto';

  @override
  String get sectionPrivacy => 'Sirri';

  @override
  String get outputFormat => 'Tsari';

  @override
  String get videoCodec => 'Kodek na bidiyo';

  @override
  String get audioCodec => 'Kodek na sauti';

  @override
  String get rateControl => 'Sarrafa ƙima';

  @override
  String get rateControlQuality => 'Inganci mara canzawa (CRF)';

  @override
  String get rateControlBitrate => 'Bitrate da ake nema';

  @override
  String crfLabel(int value) {
    return 'Inganci (CRF $value)';
  }

  @override
  String get crfHint =>
      'Ƙarami yana nufin inganci mafi kyau da fayil mafi girma.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate na bidiyo: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate na sauti: $value kbps';
  }

  @override
  String get encodingPreset => 'Saitin encoder';

  @override
  String get encodingPresetHint =>
      'Saitunan da suka fi jinkiri suna matsawa da kyau amma suna ƙara zafin na\'urar.';

  @override
  String get presetOriginal => 'Asali';

  @override
  String get resolution => 'Girman hoto';

  @override
  String get frameRate => 'Yawan firam';

  @override
  String imageQuality(int value) {
    return 'Inganci: $value';
  }

  @override
  String get lossless => 'Ba tare da asara ba';

  @override
  String get losslessHint =>
      'Fayiloli mafi girma, sakamako daidai da asali gaba ɗaya.';

  @override
  String get sectionEnhance => 'Ingantawa';

  @override
  String get sharpenLabel => 'Kaifi';

  @override
  String get sharpenHint =>
      'Yana sa gefuna su fito sosai. Ba zai iya gyara hoton da ya rikice ko wanda bai mai da hankali ba — waɗannan bayanan ba sa cikin fayil ɗin.';

  @override
  String get sharpenStrongHint =>
      'Kaifi mai ƙarfi na iya barin haske a kewayen gefuna. Fara da matsakaici.';

  @override
  String get denoiseLabel => 'Rage hayaniya';

  @override
  String get denoiseHint =>
      'Yana tsaftace ƙura a cikin hotunan duhu da na dare. Yawaita shi yana share cikakkun bayanai.';

  @override
  String get autoColorLabel => 'Launi da matakai ta atomatik';

  @override
  String get autoColorHint =>
      'Yana ƙara bambanci kuma yana ɗaga launuka ɗan kaɗan.';

  @override
  String get upscaleLabel => 'Ƙara girma 2×';

  @override
  String get upscaleHint =>
      'Yana ninka faɗi da tsawo. Ba ya ƙara cikakkun bayanai — yana taimakawa wajen bugawa ko yankewa.';

  @override
  String get upscaleConflictHint =>
      'Mayar da Girman hoto zuwa Asali domin ƙara girma.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'A kashe';

  @override
  String get enhanceLight => 'Sauƙi';

  @override
  String get enhanceMedium => 'Matsakaici';

  @override
  String get enhanceStrong => 'Mai ƙarfi';

  @override
  String get stripMetadata => 'Cire metadata';

  @override
  String get stripMetadataHint =>
      'Yana cire EXIF, GPS da lokutan rikodi daga sakamakon.';

  @override
  String startConversion(int count) {
    return 'Sauya fayiloli ($count)';
  }

  @override
  String get batchResumed => 'An ci gaba da sauyawar da aka katse.';

  @override
  String get converting => 'Ana sauyawa…';

  @override
  String get cancelBatch => 'Tsaya';

  @override
  String get cancelJob => 'Soke';

  @override
  String get clearFinished => 'Share waɗanda suka gama';

  @override
  String get removeJob => 'Cire';

  @override
  String get shareFile => 'Raba';

  @override
  String get retryJob => 'Sake gwadawa';

  @override
  String get queueEmptyTitle => 'Jeri babu kome';

  @override
  String get queueEmptyBody =>
      'Fayilolin da ka ƙara a shafin Sauyawa suna bayyana a nan.';

  @override
  String queueActiveTab(int count) {
    return 'Ana aiki · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'An gama · $count';
  }

  @override
  String get queueNoActiveTitle => 'Babu abin da ake yi';

  @override
  String get queueNoActiveBody =>
      'Fayilolin da ke jira ko waɗanda ake sauyawa suna bayyana a nan.';

  @override
  String get queueNoFinishedTitle => 'Babu abin da aka gama tukuna';

  @override
  String get queueNoFinishedBody =>
      'Fayilolin da aka sauya suna sauka a nan, a shirye don buɗewa, ajiyewa ko rabawa.';

  @override
  String get statusQueued => 'A jeri';

  @override
  String get statusRunning => 'Ana sauyawa';

  @override
  String get statusCompleted => 'An gama';

  @override
  String get statusFailed => 'Ya kasa';

  @override
  String get statusCancelled => 'An soke';

  @override
  String batchSummary(int done, int total) {
    return '$done daga $total an gama';
  }

  @override
  String batchCompleted(int done) {
    return 'Fayilolin da aka sauya: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'An sauya $done, $failed sun kasa.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% ƙarami';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% girma';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Kamanni';

  @override
  String get themeSystem => 'Na na\'ura';

  @override
  String get language => 'Harshe';

  @override
  String get languageSystem => 'Na na\'ura';

  @override
  String get privacyTitle => 'Sirri';

  @override
  String get privacyBody =>
      'Eluna Media yana sauya fayilolinka gaba ɗaya a wannan na\'urar ta amfani da kwafin FFmpeg da ke ciki. Fayilolinka ba sa fita daga na\'urar, ba a buƙatar asusu, kuma babu telemetry. Babu wani ɓangare na aikace-aikacen da ke amfani da hanyar sadarwa ko kaɗan — ba ma da izinin intanet.\n\nCire metadata yana kunne tun asali, don haka ana cire EXIF, wurin GPS da lokutan rikodi daga fayilolin da kake fitarwa.';

  @override
  String get licenseTitle => 'Lasisi';

  @override
  String get licenseBody =>
      'Wannan aikace-aikacen ya haɗa da FFmpeg da aka gina da x264, x265 da sauran sassan GPL, don haka ana rarraba aikace-aikacen gaba ɗaya ƙarƙashin GNU GPL v3.';

  @override
  String get sourceMissing => 'Fayil ɗin asali ba ya nan kuma.';

  @override
  String get tabSettings => 'Saituna';

  @override
  String get introTitle => 'Sirri tun daga tushe';

  @override
  String get introOfflineTitle => 'Yana sauyawa a wannan na\'urar';

  @override
  String get introOfflineBody =>
      'Kwafin FFmpeg da ke ciki yana yin dukkan aikin. Fayilolinka ba sa fita daga wayar — sauyawa tana aiki har a yanayin jirgin sama.';

  @override
  String get introTelemetryTitle => 'Babu telemetry ko kaɗan';

  @override
  String get introTelemetryBody =>
      'Babu asusu, babu bincike, babu rahoton kuskure. Aikace-aikacen bai san ko wanene kai ba.';

  @override
  String get introMetadataTitle => 'Metadata a hannunka';

  @override
  String get introMetadataBody =>
      'Ana cire EXIF, GPS da lokutan rikodi daga kowane sakamako tun asali. Za ka iya kashe hakan.';

  @override
  String get introFreeNote =>
      'Kyauta, babu talla kuma babu biyan kuɗi na wata-wata. Kowane fasali, har da sauya fayiloli da yawa a lokaci ɗaya, naka ne tun daga farko — abin da za a iya saya kawai shi ne baiwa, kuma ba ta buɗe komai.';

  @override
  String get introContinue => 'Fara';

  @override
  String get modeSimple => 'Sauƙi';

  @override
  String get modeAdvanced => 'Cikakke';

  @override
  String get modeAdvancedHint =>
      'Nuna kowane kodek, bitrate da sarrafa canji maimakon katunan saiti.';

  @override
  String get presetCompressVideoTitle => 'Matsa bidiyo';

  @override
  String get presetCompressVideoBody =>
      'MP4 mafi ƙanƙanta, inganci ya kasance mai kyau';

  @override
  String get presetFitToSizeTitle => 'Daidaita da girma';

  @override
  String get presetFitToSizeBody =>
      'Kai wa madaidaicin iyaka — Discord, imel, hira';

  @override
  String get presetCompatibleMp4Title => 'MP4 mai jituwa';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Yana kunnawa ko\'ina';

  @override
  String get presetExtractAudioTitle => 'Fitar da sauti';

  @override
  String get presetExtractAudioBody => 'MP3 daga kowane bidiyo';

  @override
  String get presetVideoToGifTitle => 'Bidiyo zuwa GIF';

  @override
  String get presetVideoToGifBody => 'Gajeren bidiyo zuwa GIF mai motsi';

  @override
  String get presetMergeTitle => 'Haɗa bidiyo';

  @override
  String get presetMergeBody => 'Haɗa bidiyoyi zuwa MP4 ɗaya, bi da bi';

  @override
  String get mergeNeedsTwo => 'Zaɓi aƙalla bidiyo biyu don haɗawa.';

  @override
  String mergedVideoName(int count) {
    return 'Bidiyo da aka haɗa ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Matsa hoto';

  @override
  String get presetCompressImageBody =>
      'JPEG mafi ƙanƙanta, asarar da kusan ba a gani';

  @override
  String get presetEnhancePhotoTitle => 'Inganta hoto';

  @override
  String get presetEnhancePhotoBody => 'Mai tsafta, mai kaifi, launi mafi kyau';

  @override
  String get presetImageToWebpTitle => 'Hoto zuwa WebP';

  @override
  String get presetImageToWebpBody => 'Tsari na zamani, ƙarami fiye da JPEG';

  @override
  String get sizeTargetTitle => 'Girman da ake nema';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Naka…';

  @override
  String get sizeTargetDialogTitle => 'Girman da ake nema a MB';

  @override
  String get sizeTargetTooSmall =>
      'Iyakar ta yi ƙanƙanta ga wannan tsawon lokaci; za a yi amfani da mafi kusancin inganci da zai yiwu.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size kowane fayil';
  }

  @override
  String estimateTotal(String size) {
    return 'Kimanin sakamako: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Fayilolin da aka zaɓa: $count';
  }

  @override
  String get promiseOffline => 'Sauyawa 100% ba tare da intanet ba';

  @override
  String get promiseBatchFree => 'Sauya fayiloli da yawa kyauta ce';

  @override
  String get promiseNoWatermark => 'Babu tambarin ruwa';

  @override
  String get sectionTransform => 'Canji';

  @override
  String get rotateLabel => 'Juyawa';

  @override
  String get flipLabel => 'Juya a kwance';

  @override
  String get speedLabel => 'Gudu';

  @override
  String get cropLabel => 'Yanke';

  @override
  String get cropHint =>
      'Yanke daga tsakiya zuwa girman da aka zaɓa — murabba\'i don shafuka, 9:16 don labarai.';

  @override
  String volumeLabel(int percent) {
    return 'Ƙarfin sauti: $percent%';
  }

  @override
  String get addAudioFiles => 'Sauti da sauran fayiloli';

  @override
  String get hwEncoderLabel => 'Encoding ta hardware';

  @override
  String get hwEncoderHint =>
      'Yana amfani da guntun bidiyo na na\'urar a yanayin bitrate da na daidaita-da-girma — da sauri sosai kuma ba tare da zafi ba. Yanayin inganci (CRF) koyaushe yana amfani da encoder na software mai daidaito, kuma aikin hardware da ya kasa yana sake gwadawa a kan software ta atomatik.';

  @override
  String get transformNeedsReencode =>
      'Juyawa, juyi a kwance da gudu suna buƙatar sake encoding, don haka ba sa aiki yayin kwafin kai tsaye.';

  @override
  String get capBitrateLabel => 'Kada ka taɓa ƙara girman fayil';

  @override
  String get capBitrateHint =>
      'Yana iyakance encoding a bitrate na asalin fayil. Inganci mara canzawa ba shi da iyaka nasa, don haka bidiyon da aka riga aka matsa zai iya fita mafi girma.';

  @override
  String get keepSubtitles => 'Riƙe rubutun fassara';

  @override
  String get keepSubtitlesHint =>
      'Yana ɗauke da hanyoyin rubutun fassara zuwa sakamako. Rubutun fassara na rubutu kaɗai.';

  @override
  String get sectionTrim => 'Yanke lokaci';

  @override
  String get trimEnable => 'Yanke asalin fayil';

  @override
  String get trimHint =>
      'Yana samuwa lokacin da fayil ɗaya kaɗai mai sanannen tsawon lokaci yake a jeri.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Girman da ake nema';

  @override
  String get lowBatteryTitle => 'Baturi ya yi ƙasa';

  @override
  String get lowBatteryBody =>
      'Sauyawa tana matsa na\'urar sarrafawa sosai. Za ka iya toshe caja da farko, ko ka ci gaba haka.';

  @override
  String get lowBatteryContinue => 'Sauya duk da haka';

  @override
  String get commonCancel => 'Soke';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Fayilolin da aka karɓa: $count';
  }

  @override
  String get saveFile => 'Ajiye';

  @override
  String get savedToGallery => 'An ajiye a cikin gallery, kundi “Eluna Media”.';

  @override
  String get savedToDownloads => 'An ajiye a Downloads.';

  @override
  String get saveFailed => 'An kasa ajiye fayil ɗin.';

  @override
  String get jobRemovedUndo => 'An cire aikin.';

  @override
  String get finishedClearedUndo => 'An share ayyukan da suka gama.';

  @override
  String get undo => 'Mayar';

  @override
  String get errorDetailsTitle => 'Cikakken bayanin kuskure';

  @override
  String get sectionConversionPrefs => 'Sauyawa';

  @override
  String get powerModeLabel => 'Yanayin ƙarfi';

  @override
  String get powerEfficiency => 'Sanyi da sauri';

  @override
  String get powerBalanced => 'Daidaito';

  @override
  String get powerQuality => 'Matsawa mafi girma';

  @override
  String get powerModeHint =>
      'Yadda encoder na bidiyo yake aiki tuƙuru. Sanyi da sauri yana nufin fayiloli ɗan girma. Babu wani abin da ake takurawa — ko kaɗan.';

  @override
  String get hapticsLabel => 'Amsar girgiza';

  @override
  String get networkPrivacyTitle => 'Hanyar sadarwa da sirri';

  @override
  String get netAuditIntro =>
      'Cikakken jerin duk abin da ke cikin wannan aikace-aikacen da zai iya taɓa hanyar sadarwa.';

  @override
  String get netAuditNoneTitle => 'Babu shiga hanyar sadarwa ko kaɗan';

  @override
  String get netAuditNoneBody =>
      'Aikace-aikacen bai nemi izinin intanet ba, don haka ba zai iya kaiwa ga hanyar sadarwa ba ko da ya so — za ka iya tabbatar da hakan a bayanin aikace-aikacen na tsarin. Babu talla, babu bincike, babu duba sabuntawa. “Kimanta aikace-aikacen” yana miƙawa ga aikace-aikacen kantin, wanda shi ke yin nasa hulɗar.';

  @override
  String get netAuditConversionTitle => 'Sauyawa';

  @override
  String get netAuditConversionBody =>
      'Yana gudana gaba ɗaya a wannan na\'urar ta hanyar FFmpeg da ke ciki. Kunna yanayin jirgin sama sannan ka sauya — yana aiki.';

  @override
  String get netAuditTelemetryTitle => 'Telemetry';

  @override
  String get netAuditTelemetryBody =>
      'Babu shi. Aikace-aikacen ba ya tattara bincike, ba rahoton kuskure, ba alamun ganewa, kuma ba shi da tsarin asusu.';

  @override
  String get netAuditTipsTitle => 'Baiwa';

  @override
  String get netAuditTipsBody =>
      'Aikace-aikacen Play Store ne ke aiwatar da baiwa, ba wannan ba — wanda har yanzu ba shi da izinin intanet. Biyan kuɗi yana ƙara layi biyu a jerin izini: “sayayya a cikin aikace-aikace”, da “duba haɗin hanyar sadarwa”, wanda kawai yake karanta ko akwai haɗi kuma ba zai iya amfani da shi ba. Ba a taɓa siyan komai ta atomatik, kuma baiwa ba ta buɗe komai: kowane fasali a nan kyauta ne.';

  @override
  String get sectionSupport => 'Tallafi';

  @override
  String get rateApp => 'Kimanta aikace-aikacen';

  @override
  String get openLicenses => 'Lasisin buɗaɗɗen tushe';

  @override
  String get presetAudioToMp3Title => 'Sauya sauti';

  @override
  String get presetAudioToMp3Body => 'Zuwa MP3 — yana kunnawa a ko\'ina';

  @override
  String get presetCompressAudioTitle => 'Matsa sauti';

  @override
  String get presetCompressAudioBody => 'AAC mafi sauƙi — saƙon murya, podcast';

  @override
  String get convertTo => 'Sauya zuwa';

  @override
  String get formatSectionHint =>
      'Ana jera tsarukan da fayilolinka za su iya zama kaɗai.';

  @override
  String get sourceVideo => 'Bidiyo';

  @override
  String get sourceImage => 'Hoto';

  @override
  String get sourceAudio => 'Sauti';

  @override
  String get sourceUnknown => 'Fayil';

  @override
  String get mixedSelectionTitle => 'An zaɓi nau\'ikan fayil daban-daban';

  @override
  String get mixedSelectionBody =>
      'Ana sauya kowane fayil da saitin da ya fi dacewa da nau\'insa. Ƙara nau\'i ɗaya a lokaci guda don cikakken iko.';

  @override
  String get filesTitle => 'Fayiloli';

  @override
  String get removeFile => 'Cire';

  @override
  String timeLeft(String time) {
    return '≈ $time ya rage';
  }

  @override
  String get jobSettingsTitle => 'Saitunan sauyawa';

  @override
  String get jobDetails => 'Cikakkun bayanai';

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
  String get summaryEnhanced => 'An inganta';

  @override
  String get summaryMetadataStripped => 'An cire metadata';

  @override
  String summaryMerge(int count) {
    return 'Bidiyon da aka haɗa: $count';
  }

  @override
  String get shareApp => 'Raba aikace-aikacen';

  @override
  String get shareAppText =>
      'Eluna Media — mai sauya hoto, bidiyo da sauti kyauta, gaba ɗaya ba tare da intanet ba. Babu biyan kuɗi na wata-wata, babu tambarin ruwa, babu asusu.';

  @override
  String appVersionLabel(String version) {
    return 'Sigar $version';
  }

  @override
  String get openFile => 'Buɗe';

  @override
  String get openFolder => 'Nuna babban fayil';

  @override
  String get noAppToOpen =>
      'Babu aikace-aikacen da zai iya buɗe wannan fayil a wannan na\'urar.';

  @override
  String get openFailed => 'An kasa buɗe fayil ɗin.';

  @override
  String get twoPassLabel => 'Wucewa biyu don madaidaicin girma';

  @override
  String get twoPassHint =>
      'Ayyukan daidaita-da-girma suna encoding sau biyu kuma suna kaiwa ga girman da aka nema daidai sosai — a kusan ninki biyu na lokaci da baturi.';

  @override
  String get whatsNewTitle => 'Sabbin abubuwa';

  @override
  String get whatsNew1 =>
      'Bidiyo yana iya zama AV1 yanzu: fayiloli ƙanana sosai, idan za ka iya jira.';

  @override
  String get whatsNew2 =>
      'Sabo ga hotuna: AVIF, kusan rabin JPEG, da WebP mai motsi maimakon GIF.';

  @override
  String get whatsNew3 =>
      'M4A na iya zama ba tare da asara ba — ALAC yanzu yana zaune kusa da AAC.';

  @override
  String get whatsNew4 =>
      'Shafi ɗaya don kamanni: haske, launin girmamawa, baƙi tsantsa na OLED da Material You.';

  @override
  String get whatsNew5 =>
      'Nasarori suna da lambobin yabo, shafuka uku, da ci gaban da za ka iya rabawa a matsayin hoto.';

  @override
  String get achievementsTitle => 'Nasarori';

  @override
  String achievementsProgress(int done, int total) {
    return '$done daga $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Ana ƙidaya a wannan na\'urar kaɗai. Ba a aika komai ko\'ina.';

  @override
  String get achFirstConversionTitle => 'Matakin farko';

  @override
  String get achFirstConversionBody => 'Sauya fayil ɗinka na farko.';

  @override
  String get achTenConversionsTitle => 'An ɗumama';

  @override
  String get achTenConversionsBody => 'Sauya fayiloli 10.';

  @override
  String get achFiftyConversionsTitle => 'Na yau da kullum';

  @override
  String get achFiftyConversionsBody => 'Sauya fayiloli 50.';

  @override
  String get achTwoHundredConversionsTitle => 'Mai aiki tuƙuru';

  @override
  String get achTwoHundredConversionsBody => 'Sauya fayiloli 200.';

  @override
  String get achThousandConversionsTitle => 'Injin ɗaukar kaya';

  @override
  String get achThousandConversionsBody => 'Sauya fayiloli 1000.';

  @override
  String get achSaved100MbTitle => 'Mai tanadin sarari';

  @override
  String get achSaved100MbBody => 'Ka kwato jimlar 100 MB.';

  @override
  String get achSaved1GbTitle => 'Mafarautin gigabyte';

  @override
  String get achSaved1GbBody => 'Ka kwato jimlar 1 GB.';

  @override
  String get achSaved10GbTitle => 'Jarumin ajiya';

  @override
  String get achSaved10GbBody => 'Ka kwato jimlar 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Mai aikin rukuni';

  @override
  String get achBatchOfFiveBody => 'Gama rukunin fayiloli 5 ko fiye.';

  @override
  String get achBatchOfTwentyTitle => 'Layin haɗawa';

  @override
  String get achBatchOfTwentyBody => 'Gama rukunin fayiloli 20 ko fiye.';

  @override
  String get achSniperTitle => 'Maharbi';

  @override
  String get achSniperBody => 'Kai wa madaidaicin girma da daidaita-da-girma.';

  @override
  String get achMemeSmithTitle => 'Maƙerin meme';

  @override
  String get achMemeSmithBody => 'Mayar da bidiyo zuwa GIF.';

  @override
  String get achSoundHunterTitle => 'Mafarautin sauti';

  @override
  String get achSoundHunterBody => 'Fitar da sauti daga bidiyo.';

  @override
  String get achSubtitleKeeperTitle => 'Mai riƙe rubutun fassara';

  @override
  String get achSubtitleKeeperBody =>
      'Sauya bidiyo tare da riƙe rubutun fassararsa.';

  @override
  String get achDirectorTitle => 'Darakta';

  @override
  String get achDirectorBody =>
      'Yi amfani da canji — juyawa, yanke, gudu ko ƙarfin sauti.';

  @override
  String get achAllRounderTitle => 'Mai kowane fanni';

  @override
  String get achAllRounderBody => 'Sauya bidiyo, sauti da hoto.';

  @override
  String get achNightOwlTitle => 'Mai tashin dare';

  @override
  String get achNightOwlBody =>
      'Gama sauyawa tsakanin tsakar dare da ƙarfe 5 na safe.';

  @override
  String get achPlatinumTitle => 'Platinum';

  @override
  String get achPlatinumBody => 'Samu kowace nasara.';

  @override
  String get storageTitle => 'Ajiya';

  @override
  String get storageBody =>
      'Fayilolin da aka sauya suna zama a cikin aikace-aikacen har sai ka ajiye su ko ka raba su, inda babu manajan fayil da zai kai gare su.';

  @override
  String get storageEmpty => 'Babu abin da aka ajiye';

  @override
  String storageUsage(String size) {
    return 'An ajiye: $size';
  }

  @override
  String get storageClearTitle => 'A share fayilolin da aka ajiye?';

  @override
  String get storageClearBody =>
      'Yana share kowane sakamako da aka gama wanda aikace-aikacen ke riƙe. Fayilolin da ka riga ka ajiye ko ka raba ba za a taɓa su ba.';

  @override
  String get storageClearAction => 'Share';

  @override
  String storageCleared(String size) {
    return 'An kwato $size';
  }

  @override
  String get autoSaveLabel => 'Ajiye sakamako ta atomatik';

  @override
  String get autoSaveHint =>
      'Yana sanya kowane fayil da aka gama a cikin gallery — sauti a Downloads — da zarar ya shirya.';

  @override
  String get lowSpaceTitle => 'Sarari bai yi yawa ba';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Wannan rukunin yana buƙatar kimanin $needed kuma $free kaɗai ne suka rage. Sauyawa na iya tsayawa a tsakiya.';
  }

  @override
  String saveAll(int count) {
    return 'Ajiye duka ($count)';
  }

  @override
  String savedAll(int count) {
    return 'An ajiye: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'An ajiye $saved daga $total';
  }

  @override
  String get presetFitPhotoTitle => 'Daidaita hoto da girma';

  @override
  String get presetFitPhotoBody =>
      'Matsa hoto ƙasa da madaidaicin iyaka — fom na ɗorawa, aikace-aikace.';

  @override
  String get photoFitHint =>
      'Aikace-aikacen yana gwada matakan inganci har sai ɗaya ya dace. Idan iyakar ta yi ƙanƙanta ga hoton, yana rage girman firam ɗin ma.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Girman da ake nema a KB';

  @override
  String get compareAction => 'Kwatanta';

  @override
  String get compareBefore => 'Kafin';

  @override
  String get compareAfter => 'Bayan';

  @override
  String get compareHint => 'Danna ka riƙe don ganin asalin.';

  @override
  String get trimStart => 'Farko';

  @override
  String get trimEnd => 'Ƙarshe';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, har zuwa $duration';
  }

  @override
  String get imageScaleLabel => 'Ma\'auni';

  @override
  String get audioChannelsLabel => 'Tashoshi';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Ƙimar sampling';

  @override
  String get voiceAudioHint =>
      'Mono a 22.05 kHz yana rage rikodin murya zuwa kusan kashi ɗaya cikin huɗu ba tare da asarar da za a ji ba. Bar duka biyun a asali don kiɗa.';

  @override
  String get moveUp => 'Matsa sama';

  @override
  String get moveDown => 'Matsa ƙasa';

  @override
  String get renameOutput => 'Sake sunan sakamako';

  @override
  String get renameOutputHint => 'Sabon suna';

  @override
  String get renameOutputHelp =>
      'Kari yana fitowa daga tsarin sakamako. Bar shi babu kome don ba wa sakamakon sunan asalin fayil.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Share asalin fayiloli ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Share asalin fayiloli bayan sauyawa';

  @override
  String get deleteOriginalsHint =>
      'Yana neman tsarin ya cire asalin fayilolin da zarar an ajiye sakamakon. Tsarin koyaushe yana nuna abin da zai tafi kuma yana jiran tabbatarwarka.';

  @override
  String originalsDeleted(String size) {
    return 'An share asalin fayiloli — an kwato $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Ba a share komai ba. Fayilolin da gallery ke riƙe da sunansu na asali kaɗai ake iya samu.';

  @override
  String reclaimedTotal(String size) {
    return 'An kwato da wannan aikace-aikacen: $size';
  }

  @override
  String get deleteAllData => 'Share duk bayanai';

  @override
  String get deleteAllDataHint =>
      'Yana goge duk abin da aikace-aikacen ke ajiye a wannan na\'urar: jeri, fayilolin da aka sauya, samfuran hotuna, nasarori da saituna. Fayilolin da ka riga ka ajiye a gallery ba za a taɓa su ba.';

  @override
  String get codecCopy => 'Kwafi';

  @override
  String get codecCopyRemux => 'Kwafi (remux)';

  @override
  String get codecNoVideo => 'Babu bidiyo';

  @override
  String get codecNoAudio => 'Babu sauti';

  @override
  String codecLossless(String codec) {
    return '$codec (ba tare da asara ba)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (mai motsi)';
  }

  @override
  String get sizeTargetEmail => 'Imel';

  @override
  String get trimTimeHint => 'm:ss';
}
