// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class L10nSw extends L10n {
  L10nSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Badilisha';

  @override
  String get tabQueue => 'Foleni';

  @override
  String get addFiles => 'Ongeza faili';

  @override
  String get emptySelectionTitle => 'Bado hakuna faili';

  @override
  String get emptySelectionBody =>
      'Ongeza picha, video au sauti. Kila kitu huchakatwa kwenye kifaa hiki.';

  @override
  String get sectionOutput => 'Matokeo';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Sauti';

  @override
  String get sectionImage => 'Picha';

  @override
  String get sectionPrivacy => 'Faragha';

  @override
  String get outputFormat => 'Muundo';

  @override
  String get videoCodec => 'Kodeki ya video';

  @override
  String get audioCodec => 'Kodeki ya sauti';

  @override
  String get rateControl => 'Udhibiti wa kasi ya biti';

  @override
  String get rateControlQuality => 'Ubora thabiti (CRF)';

  @override
  String get rateControlBitrate => 'Kasi lengwa ya biti';

  @override
  String crfLabel(int value) {
    return 'Ubora (CRF $value)';
  }

  @override
  String get crfHint =>
      'Thamani ya chini ni ubora bora zaidi na faili kubwa zaidi.';

  @override
  String videoBitrate(int value) {
    return 'Kasi ya biti ya video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Kasi ya biti ya sauti: $value kbps';
  }

  @override
  String get encodingPreset => 'Mpangilio wa kisimbaji';

  @override
  String get encodingPresetHint =>
      'Mipangilio ya polepole hubana vizuri zaidi lakini hupasha kifaa joto zaidi.';

  @override
  String get presetOriginal => 'Asili';

  @override
  String get resolution => 'Azimio';

  @override
  String get frameRate => 'Kasi ya fremu';

  @override
  String imageQuality(int value) {
    return 'Ubora: $value';
  }

  @override
  String get lossless => 'Bila hasara';

  @override
  String get losslessHint =>
      'Faili kubwa zaidi, matokeo sahihi kwa kila pikseli.';

  @override
  String get sectionEnhance => 'Uboreshaji';

  @override
  String get sharpenLabel => 'Ukali';

  @override
  String get sharpenHint =>
      'Hufanya kingo ziwe kali zaidi. Haiwezi kurudisha picha yenye ukungu au isiyo katika fokasi — maelezo hayo hayamo kwenye faili.';

  @override
  String get sharpenStrongHint =>
      'Ukali mkubwa unaweza kuacha duara nyangavu kando ya kingo. Jaribu kiwango cha wastani kwanza.';

  @override
  String get denoiseLabel => 'Kupunguza kelele';

  @override
  String get denoiseHint =>
      'Husafisha chembechembe katika picha za giza na za usiku. Kupita kiasi hulainisha na kuondoa maelezo madogo.';

  @override
  String get autoColorLabel => 'Rangi na viwango otomatiki';

  @override
  String get autoColorHint =>
      'Hunyoosha utofautishaji na kuinua rangi tuli kidogo.';

  @override
  String get upscaleLabel => 'Kuza mara 2×';

  @override
  String get upscaleHint =>
      'Huongeza upana na urefu mara mbili. Haiongezi maelezo — husaidia unapochapisha au kupunguza pembeni.';

  @override
  String get upscaleConflictHint => 'Rudisha Azimio kuwa Asili ili kukuza.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Zimwa';

  @override
  String get enhanceLight => 'Kidogo';

  @override
  String get enhanceMedium => 'Wastani';

  @override
  String get enhanceStrong => 'Nguvu';

  @override
  String get stripMetadata => 'Ondoa metadata';

  @override
  String get stripMetadataHint =>
      'Huondoa EXIF, GPS na alama za wakati kwenye matokeo.';

  @override
  String startConversion(int count) {
    return 'Badilisha faili ($count)';
  }

  @override
  String get batchResumed => 'Ubadilishaji uliokatizwa umeendelezwa.';

  @override
  String get converting => 'Inabadilisha…';

  @override
  String get cancelBatch => 'Simamisha';

  @override
  String get cancelJob => 'Ghairi';

  @override
  String get clearFinished => 'Ondoa zilizokamilika';

  @override
  String get removeJob => 'Ondoa';

  @override
  String get shareFile => 'Shiriki';

  @override
  String get retryJob => 'Jaribu tena';

  @override
  String get queueEmptyTitle => 'Foleni ni tupu';

  @override
  String get queueEmptyBody =>
      'Faili unazoongeza kwenye kichupo cha Badilisha huonekana hapa.';

  @override
  String queueActiveTab(int count) {
    return 'Inaendelea · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Imekamilika · $count';
  }

  @override
  String get queueNoActiveTitle => 'Hakuna kinachoendelea';

  @override
  String get queueNoActiveBody =>
      'Faili zinazosubiri au zinazobadilishwa huonekana hapa.';

  @override
  String get queueNoFinishedTitle => 'Bado hakuna kilichokamilika';

  @override
  String get queueNoFinishedBody =>
      'Faili zilizobadilishwa hufika hapa, tayari kufunguliwa, kuhifadhiwa au kushirikiwa.';

  @override
  String get statusQueued => 'Kwenye foleni';

  @override
  String get statusRunning => 'Inabadilisha';

  @override
  String get statusCompleted => 'Imekamilika';

  @override
  String get statusFailed => 'Imeshindikana';

  @override
  String get statusCancelled => 'Imeghairiwa';

  @override
  String batchSummary(int done, int total) {
    return '$done kati ya $total zimekamilika';
  }

  @override
  String batchCompleted(int done) {
    return 'Faili zilizobadilishwa: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Zimebadilishwa $done, zimeshindikana $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'Ndogo kwa $percent%';
  }

  @override
  String grewPercent(int percent) {
    return 'Kubwa kwa $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Muonekano';

  @override
  String get themeSystem => 'Mfumo';

  @override
  String get language => 'Lugha';

  @override
  String get languageSystem => 'Mfumo';

  @override
  String get privacyTitle => 'Faragha';

  @override
  String get privacyBody =>
      'Eluna Media hubadilisha faili zako kabisa kwenye kifaa hiki kwa kutumia nakala ya FFmpeg iliyojumuishwa. Faili zako hazitoki kamwe kwenye kifaa, hakuna akaunti inayohitajika, na hakuna telemetria. Hakuna chochote katika programu kinachotumia mtandao — haina hata ruhusa ya intaneti.\n\nUondoaji wa metadata umewashwa kwa chaguomsingi, hivyo EXIF, viwianishi vya GPS na alama za wakati huondolewa kwenye faili unazohamisha.';

  @override
  String get licenseTitle => 'Leseni';

  @override
  String get licenseBody =>
      'Programu hii inajumuisha FFmpeg iliyojengwa kwa x264, x265 na vipengele vingine vya GPL, hivyo programu nzima husambazwa chini ya GNU GPL v3.';

  @override
  String get sourceMissing => 'Faili chanzo halipatikani tena.';

  @override
  String get tabSettings => 'Mipangilio';

  @override
  String get introTitle => 'Faragha tangu mwanzo';

  @override
  String get introOfflineTitle => 'Hubadilisha kwenye kifaa hiki';

  @override
  String get introOfflineBody =>
      'Nakala ya FFmpeg iliyojumuishwa hufanya kazi yote. Faili zako hazitoki kamwe kwenye simu — ubadilishaji hufanya kazi hata katika hali ya ndegeni.';

  @override
  String get introTelemetryTitle => 'Hakuna telemetria';

  @override
  String get introTelemetryBody =>
      'Hakuna akaunti, hakuna uchanganuzi, hakuna ripoti za hitilafu. Programu haijui wewe ni nani.';

  @override
  String get introMetadataTitle => 'Metadata chini ya udhibiti wako';

  @override
  String get introMetadataBody =>
      'EXIF, GPS na alama za wakati huondolewa kwenye kila tokeo kwa chaguomsingi. Unaweza kuzima hilo.';

  @override
  String get introFreeNote =>
      'Bila malipo, bila matangazo na bila usajili. Kila kipengele, ikiwa ni pamoja na ubadilishaji wa kundi, ni chako tangu mwanzo — kitu pekee kinachoweza kununuliwa ni bakshishi, nayo haifungui chochote.';

  @override
  String get introContinue => 'Anza';

  @override
  String get modeSimple => 'Rahisi';

  @override
  String get modeAdvanced => 'Ya kina';

  @override
  String get modeAdvancedHint =>
      'Onyesha kila kidhibiti cha kodeki, kasi ya biti na mabadiliko badala ya kadi za mipangilio tayari.';

  @override
  String get presetCompressVideoTitle => 'Bana video';

  @override
  String get presetCompressVideoBody => 'MP4 ndogo zaidi, ubora unabaki mzuri';

  @override
  String get presetFitToSizeTitle => 'Fikia ukubwa lengwa';

  @override
  String get presetFitToSizeBody =>
      'Fikia kikomo kamili — Discord, barua pepe, gumzo';

  @override
  String get presetCompatibleMp4Title => 'MP4 inayooana';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Hucheza kila mahali';

  @override
  String get presetExtractAudioTitle => 'Toa sauti';

  @override
  String get presetExtractAudioBody => 'MP3 kutoka video yoyote';

  @override
  String get presetVideoToGifTitle => 'Video kuwa GIF';

  @override
  String get presetVideoToGifBody => 'Klipu fupi kuwa GIF yenye mwendo';

  @override
  String get presetMergeTitle => 'Unganisha video';

  @override
  String get presetMergeBody => 'Shona klipu kuwa MP4 moja, kwa mpangilio';

  @override
  String get mergeNeedsTwo => 'Chagua angalau video mbili ili kuunganisha.';

  @override
  String mergedVideoName(int count) {
    return 'Video iliyounganishwa ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Bana picha';

  @override
  String get presetCompressImageBody =>
      'JPEG ndogo zaidi, hasara isiyoonekana kwa urahisi';

  @override
  String get presetEnhancePhotoTitle => 'Boresha picha';

  @override
  String get presetEnhancePhotoBody => 'Safi zaidi, kali zaidi, rangi bora';

  @override
  String get presetImageToWebpTitle => 'Picha kuwa WebP';

  @override
  String get presetImageToWebpBody => 'Muundo wa kisasa, mdogo kuliko JPEG';

  @override
  String get sizeTargetTitle => 'Ukubwa lengwa';

  @override
  String sizeTargetMb(int mb) {
    return 'MB $mb';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · MB $mb';
  }

  @override
  String get sizeTargetCustom => 'Maalum…';

  @override
  String get sizeTargetDialogTitle => 'Ukubwa lengwa kwa MB';

  @override
  String get sizeTargetTooSmall =>
      'Lengo ni dogo mno kwa muda huu; ubora wa karibu zaidi unaowezekana utatumika.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size kwa kila faili';
  }

  @override
  String estimateTotal(String size) {
    return 'Makadirio ya matokeo: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Faili zilizochaguliwa: $count';
  }

  @override
  String get promiseOffline => 'Ubadilishaji nje ya mtandao kwa 100%';

  @override
  String get promiseBatchFree => 'Kundi ni bure';

  @override
  String get promiseNoWatermark => 'Hakuna alama ya maji';

  @override
  String get sectionTransform => 'Mabadiliko';

  @override
  String get rotateLabel => 'Zungusha';

  @override
  String get flipLabel => 'Akisi mlalo';

  @override
  String get speedLabel => 'Kasi';

  @override
  String get cropLabel => 'Punguza pembeni';

  @override
  String get cropHint =>
      'Punguza kutoka katikati hadi uwiano uliochaguliwa — mraba kwa milisho, 9:16 kwa hadithi.';

  @override
  String volumeLabel(int percent) {
    return 'Sauti: $percent%';
  }

  @override
  String get addAudioFiles => 'Sauti na faili nyingine';

  @override
  String get hwEncoderLabel => 'Usimbaji wa maunzi';

  @override
  String get hwEncoderHint =>
      'Hutumia chipu ya video ya kifaa katika hali za kasi ya biti na kufikia ukubwa lengwa — haraka zaidi na baridi zaidi. Hali ya ubora (CRF) hutumia daima kisimbaji sahihi cha programu, na kazi ya maunzi ikishindikana hujaribiwa tena kwa programu kiotomatiki.';

  @override
  String get transformNeedsReencode =>
      'Kuzungusha, kuakisi na kasi vinahitaji usimbaji upya, hivyo vimezimwa wakati wa kunakili mtiririko.';

  @override
  String get capBitrateLabel => 'Usiifanye faili kuwa kubwa zaidi';

  @override
  String get capBitrateHint =>
      'Huweka kikomo cha usimbaji katika kasi ya biti ya chanzo chenyewe. Ubora thabiti hauna kikomo chake, hivyo video iliyokwisha kubanwa inaweza vinginevyo kutoka ikiwa kubwa zaidi.';

  @override
  String get keepSubtitles => 'Hifadhi manukuu';

  @override
  String get keepSubtitlesHint =>
      'Huhamisha nyimbo za manukuu kwenye matokeo. Manukuu ya maandishi pekee.';

  @override
  String get sectionTrim => 'Kata';

  @override
  String get trimEnable => 'Kata chanzo';

  @override
  String get trimHint =>
      'Hupatikana wakati faili moja tu yenye muda unaojulikana iko kwenye foleni.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Ukubwa lengwa';

  @override
  String get lowBatteryTitle => 'Betri iko chini';

  @override
  String get lowBatteryBody =>
      'Ubadilishaji hufanya kichakataji kufanya kazi kwa bidii. Unaweza kuchomeka chaji kwanza, au kuendelea hata hivyo.';

  @override
  String get lowBatteryContinue => 'Badilisha hata hivyo';

  @override
  String get commonCancel => 'Ghairi';

  @override
  String get commonOk => 'Sawa';

  @override
  String filesReceived(int count) {
    return 'Faili zilizopokelewa: $count';
  }

  @override
  String get saveFile => 'Hifadhi';

  @override
  String get savedToGallery =>
      'Imehifadhiwa kwenye matunzio, albamu “Eluna Media”.';

  @override
  String get savedToDownloads => 'Imehifadhiwa kwenye Vipakuliwa.';

  @override
  String get saveFailed => 'Haikuweza kuhifadhi faili.';

  @override
  String get jobRemovedUndo => 'Kazi imeondolewa.';

  @override
  String get finishedClearedUndo => 'Kazi zilizokamilika zimeondolewa.';

  @override
  String get undo => 'Tendua';

  @override
  String get errorDetailsTitle => 'Maelezo ya hitilafu';

  @override
  String get sectionConversionPrefs => 'Ubadilishaji';

  @override
  String get powerModeLabel => 'Hali ya nishati';

  @override
  String get powerEfficiency => 'Baridi na haraka';

  @override
  String get powerBalanced => 'Uwiano';

  @override
  String get powerQuality => 'Ubanaji wa juu zaidi';

  @override
  String get powerModeHint =>
      'Kiasi cha bidii ambacho kisimbaji cha video hufanya kazi. Baridi na haraka zaidi kunamaanisha faili kubwa kidogo. Hakuna kingine kinachopunguzwa kasi — kamwe.';

  @override
  String get hapticsLabel => 'Mrejesho wa mtetemo';

  @override
  String get networkPrivacyTitle => 'Mtandao na faragha';

  @override
  String get netAuditIntro =>
      'Orodha kamili ya kila kitu katika programu hii kinachoweza kugusa mtandao.';

  @override
  String get netAuditNoneTitle => 'Hakuna ufikiaji wa mtandao kabisa';

  @override
  String get netAuditNoneBody =>
      'Programu haiombi ruhusa ya intaneti, hivyo haiwezi kufikia mtandao hata ingejaribu — unaweza kuthibitisha hilo katika taarifa za programu za mfumo. Hakuna matangazo, hakuna uchanganuzi, hakuna ukaguzi wa masasisho. “Kadiria programu” hukabidhi kazi kwa programu ya duka, ambayo huzungumza yenyewe.';

  @override
  String get netAuditConversionTitle => 'Ubadilishaji';

  @override
  String get netAuditConversionBody =>
      'Hufanyika kabisa kwenye kifaa hiki kupitia FFmpeg iliyojumuishwa. Washa hali ya ndegeni na ubadilishe — hufanya kazi.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Haipo. Programu haikusanyi uchanganuzi, ripoti za hitilafu, wala vitambulisho, na haina mfumo wa akaunti.';

  @override
  String get netAuditTipsTitle => 'Bakshishi';

  @override
  String get netAuditTipsBody =>
      'Bakshishi hutekelezwa na programu ya Play Store, si na hii — ambayo bado haina ruhusa ya intaneti. Malipo huongeza mistari miwili kwenye orodha ya ruhusa: “manunuzi ndani ya programu”, na “kuona miunganisho ya mtandao”, ambayo husoma tu kama muunganisho upo na haiwezi kuutumia. Hakuna kinachonunuliwa kiotomatiki, na bakshishi haifungui chochote: kila kipengele hapa ni bure.';

  @override
  String get sectionSupport => 'Msaada';

  @override
  String get rateApp => 'Kadiria programu';

  @override
  String get openLicenses => 'Leseni za programu huria';

  @override
  String get presetAudioToMp3Title => 'Badilisha sauti';

  @override
  String get presetAudioToMp3Body => 'Kuwa MP3 — hucheza kwenye chochote';

  @override
  String get presetCompressAudioTitle => 'Bana sauti';

  @override
  String get presetCompressAudioBody =>
      'AAC nyepesi — noti za sauti, podikasti';

  @override
  String get convertTo => 'Badilisha kuwa';

  @override
  String get formatSectionHint =>
      'Miundo inayoorodheshwa ni ile tu ambayo faili zako zinaweza kuwa.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Picha';

  @override
  String get sourceAudio => 'Sauti';

  @override
  String get sourceUnknown => 'Faili';

  @override
  String get mixedSelectionTitle => 'Aina tofauti za faili zimechaguliwa';

  @override
  String get mixedSelectionBody =>
      'Kila faili hubadilishwa kwa mpangilio bora kwa aina yake. Ongeza aina moja kwa wakati ili kudhibiti kikamilifu.';

  @override
  String get filesTitle => 'Faili';

  @override
  String get removeFile => 'Ondoa';

  @override
  String timeLeft(String time) {
    return '≈ $time zimebaki';
  }

  @override
  String get jobSettingsTitle => 'Mipangilio ya ubadilishaji';

  @override
  String get jobDetails => 'Maelezo';

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
  String get summaryEnhanced => 'Imeboreshwa';

  @override
  String get summaryMetadataStripped => 'Metadata imeondolewa';

  @override
  String summaryMerge(int count) {
    return 'Klipu zilizounganishwa: $count';
  }

  @override
  String get shareApp => 'Shiriki programu';

  @override
  String get shareAppText =>
      'Eluna Media — kibadilishaji cha picha, video na sauti kisicholipishwa, kinachofanya kazi nje ya mtandao kabisa. Hakuna usajili, hakuna alama za maji, hakuna akaunti.';

  @override
  String appVersionLabel(String version) {
    return 'Toleo $version';
  }

  @override
  String get openFile => 'Fungua';

  @override
  String get openFolder => 'Onyesha folda';

  @override
  String get noAppToOpen =>
      'Hakuna programu kwenye kifaa hiki inayoweza kufungua faili hiyo.';

  @override
  String get openFailed => 'Haikuweza kufungua faili.';

  @override
  String get twoPassLabel => 'Mizunguko miwili kwa ukubwa kamili';

  @override
  String get twoPassHint =>
      'Kazi za kufikia ukubwa lengwa husimba mara mbili na kufikia bajeti ya baiti kwa usahihi zaidi — kwa takribani muda na betri mara mbili.';

  @override
  String get whatsNewTitle => 'Yaliyo mapya';

  @override
  String get whatsNew1 =>
      'Video sasa inaweza kuwa AV1: faili ndogo kwa kiasi kikubwa, kama unaweza kuzisubiri.';

  @override
  String get whatsNew2 =>
      'Mpya kwa picha: AVIF, takribani nusu ya JPEG, na WebP yenye mwendo badala ya GIF.';

  @override
  String get whatsNew3 =>
      'M4A inaweza kuwa bila hasara — ALAC sasa iko kando ya AAC.';

  @override
  String get whatsNew4 =>
      'Skrini moja kwa muonekano: mwangaza, rangi ya lafudhi, OLED nyeusi kabisa na Material You.';

  @override
  String get whatsNew5 =>
      'Mafanikio yana medali, vichupo vitatu, na maendeleo unayoweza kushiriki kama picha.';

  @override
  String get achievementsTitle => 'Mafanikio';

  @override
  String achievementsProgress(int done, int total) {
    return '$done kati ya $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Huhesabiwa kwenye kifaa hiki pekee. Hakuna kinachopakiwa popote.';

  @override
  String get achFirstConversionTitle => 'Hatua za kwanza';

  @override
  String get achFirstConversionBody => 'Badilisha faili lako la kwanza.';

  @override
  String get achTenConversionsTitle => 'Umepata joto';

  @override
  String get achTenConversionsBody => 'Badilisha faili 10.';

  @override
  String get achFiftyConversionsTitle => 'Wa kawaida';

  @override
  String get achFiftyConversionsBody => 'Badilisha faili 50.';

  @override
  String get achTwoHundredConversionsTitle => 'Farasi wa kazi';

  @override
  String get achTwoHundredConversionsBody => 'Badilisha faili 200.';

  @override
  String get achThousandConversionsTitle => 'Ukanda wa kusafirisha';

  @override
  String get achThousandConversionsBody => 'Badilisha faili 1000.';

  @override
  String get achSaved100MbTitle => 'Mwokoa nafasi';

  @override
  String get achSaved100MbBody => 'Achilia jumla ya MB 100.';

  @override
  String get achSaved1GbTitle => 'Mwindaji wa gigabaiti';

  @override
  String get achSaved1GbBody => 'Achilia jumla ya GB 1.';

  @override
  String get achSaved10GbTitle => 'Shujaa wa hifadhi';

  @override
  String get achSaved10GbBody => 'Achilia jumla ya GB 10.';

  @override
  String get achBatchOfFiveTitle => 'Mfanyakazi wa makundi';

  @override
  String get achBatchOfFiveBody => 'Kamilisha kundi la faili 5 au zaidi.';

  @override
  String get achBatchOfTwentyTitle => 'Mstari wa kuunganisha';

  @override
  String get achBatchOfTwentyBody => 'Kamilisha kundi la faili 20 au zaidi.';

  @override
  String get achSniperTitle => 'Mpiga shabaha';

  @override
  String get achSniperBody =>
      'Fikia ukubwa kamili kwa kutumia kufikia ukubwa lengwa.';

  @override
  String get achMemeSmithTitle => 'Fundi wa memu';

  @override
  String get achMemeSmithBody => 'Geuza video kuwa GIF.';

  @override
  String get achSoundHunterTitle => 'Mwindaji wa sauti';

  @override
  String get achSoundHunterBody => 'Toa sauti kutoka kwenye video.';

  @override
  String get achSubtitleKeeperTitle => 'Mtunza manukuu';

  @override
  String get achSubtitleKeeperBody =>
      'Badilisha video huku manukuu yake yakihifadhiwa.';

  @override
  String get achDirectorTitle => 'Mkurugenzi';

  @override
  String get achDirectorBody =>
      'Tumia mabadiliko — kuzungusha, kupunguza pembeni, kasi au sauti.';

  @override
  String get achAllRounderTitle => 'Mahiri wa yote';

  @override
  String get achAllRounderBody => 'Badilisha video, sauti na picha.';

  @override
  String get achNightOwlTitle => 'Bundi wa usiku';

  @override
  String get achNightOwlBody =>
      'Kamilisha ubadilishaji kati ya usiku wa manane na saa 11 alfajiri.';

  @override
  String get achPlatinumTitle => 'Platinamu';

  @override
  String get achPlatinumBody => 'Pata kila mafanikio mengine.';

  @override
  String get storageTitle => 'Hifadhi';

  @override
  String get storageBody =>
      'Faili zilizobadilishwa hubaki ndani ya programu hadi uzihifadhi au uzishiriki, mahali ambapo hakuna kidhibiti faili kinachoweza kuzifikia.';

  @override
  String get storageEmpty => 'Hakuna kilichohifadhiwa';

  @override
  String storageUsage(String size) {
    return 'Imehifadhiwa: $size';
  }

  @override
  String get storageClearTitle => 'Ufute faili zilizohifadhiwa?';

  @override
  String get storageClearBody =>
      'Hufuta kila tokeo lililokamilika ambalo programu bado inashikilia. Faili ulizokwisha kuhifadhi au kushiriki hazitaguswa.';

  @override
  String get storageClearAction => 'Futa';

  @override
  String storageCleared(String size) {
    return 'Imeachiliwa $size';
  }

  @override
  String get autoSaveLabel => 'Hifadhi matokeo kiotomatiki';

  @override
  String get autoSaveHint =>
      'Huweka kila faili iliyokamilika kwenye matunzio — sauti kwenye Vipakuliwa — mara tu inapokuwa tayari.';

  @override
  String get lowSpaceTitle => 'Nafasi iliyobaki ni ndogo';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Kundi hili linahitaji takribani $needed na ni $free tu iliyo huru. Ubadilishaji unaweza kusimama katikati.';
  }

  @override
  String saveAll(int count) {
    return 'Hifadhi zote ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Zimehifadhiwa: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Zimehifadhiwa $saved kati ya $total';
  }

  @override
  String get presetFitPhotoTitle => 'Fikisha picha ukubwa lengwa';

  @override
  String get presetFitPhotoBody =>
      'Bana picha ili iwe chini ya kikomo kamili — fomu za kupakia, maombi.';

  @override
  String get photoFitHint =>
      'Programu hujaribu viwango vya ubora hadi kimoja kitoshe. Kama bajeti ni ndogo mno kwa picha, hupunguza pia ukubwa wa fremu.';

  @override
  String sizeTargetKb(int kb) {
    return 'KB $kb';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Ukubwa lengwa kwa KB';

  @override
  String get compareAction => 'Linganisha';

  @override
  String get compareBefore => 'Kabla';

  @override
  String get compareAfter => 'Baada';

  @override
  String get compareHint => 'Bonyeza na ushikilie ili kuona ya awali.';

  @override
  String get trimStart => 'Mwanzo';

  @override
  String get trimEnd => 'Mwisho';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, hadi $duration';
  }

  @override
  String get imageScaleLabel => 'Kipimo';

  @override
  String get audioChannelsLabel => 'Chaneli';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Kasi ya sampuli';

  @override
  String get voiceAudioHint =>
      'Mono kwa 22.05 kHz hupunguza rekodi ya sauti hadi takribani robo bila hasara inayosikika. Acha vyote viwili katika hali ya asili kwa muziki.';

  @override
  String get moveUp => 'Sogeza juu';

  @override
  String get moveDown => 'Sogeza chini';

  @override
  String get renameOutput => 'Badilisha jina la tokeo';

  @override
  String get renameOutputHint => 'Jina jipya';

  @override
  String get renameOutputHelp =>
      'Kiendelezi hutokana na muundo wa matokeo. Liache tupu ili tokeo lipewe jina la chanzo.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Futa asili ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Futa asili baada ya kubadilisha';

  @override
  String get deleteOriginalsHint =>
      'Huuomba mfumo kuondoa faili chanzo mara tokeo linapohifadhiwa. Mfumo huonyesha daima kitakachoondoka na husubiri uthibitisho wako.';

  @override
  String get mediaAccessRequired =>
      'Ufikiaji wa maktaba ya midia unahitajika ili kufuta faili asili.';

  @override
  String originalsDeleted(String size) {
    return 'Asili zimefutwa — $size zimeachiliwa';
  }

  @override
  String get originalsNoneDeleted =>
      'Hakuna kilichofutwa. Ni faili tu ambazo matunzio bado yanazishikilia kwa jina lake la awali zinazoweza kupatikana.';

  @override
  String reclaimedTotal(String size) {
    return 'Zilizoachiliwa kwa programu hii: $size';
  }

  @override
  String get deleteAllData => 'Futa data yote';

  @override
  String get deleteAllDataHint =>
      'Hufuta kila kitu ambacho programu huhifadhi kwenye kifaa hiki: foleni, faili zilizobadilishwa, hakikisho, mafanikio na mipangilio. Faili ulizokwisha kuhifadhi kwenye matunzio yako hazitaguswa.';

  @override
  String get codecCopy => 'Nakili';

  @override
  String get codecCopyRemux => 'Nakili (remux)';

  @override
  String get codecNoVideo => 'Bila video';

  @override
  String get codecNoAudio => 'Bila sauti';

  @override
  String codecLossless(String codec) {
    return '$codec (bila hasara)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (yenye mwendo)';
  }

  @override
  String get sizeTargetEmail => 'Barua pepe';

  @override
  String get trimTimeHint => 'm:ss';
}
