// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class L10nZu extends L10n {
  L10nZu([String locale = 'zu']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Guqula';

  @override
  String get tabQueue => 'Ulayini';

  @override
  String get addFiles => 'Engeza amafayela';

  @override
  String get emptySelectionTitle => 'Awekho amafayela okwamanje';

  @override
  String get emptySelectionBody =>
      'Engeza izithombe, amavidiyo noma umsindo. Konke kucutshungulwa kule divayisi.';

  @override
  String get sectionOutput => 'Okukhiphayo';

  @override
  String get sectionVideo => 'Ividiyo';

  @override
  String get sectionAudio => 'Umsindo';

  @override
  String get sectionImage => 'Isithombe';

  @override
  String get sectionPrivacy => 'Ubumfihlo';

  @override
  String get outputFormat => 'Ifomethi';

  @override
  String get videoCodec => 'I-codec yevidiyo';

  @override
  String get audioCodec => 'I-codec yomsindo';

  @override
  String get rateControl => 'Ukulawula izinga';

  @override
  String get rateControlQuality => 'Ikhwalithi engaguquki (CRF)';

  @override
  String get rateControlBitrate => 'I-bitrate ehlosiwe';

  @override
  String crfLabel(int value) {
    return 'Ikhwalithi (CRF $value)';
  }

  @override
  String get crfHint =>
      'Okuncane kunikeza ikhwalithi engcono nefayela elikhulu.';

  @override
  String videoBitrate(int value) {
    return 'I-bitrate yevidiyo: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'I-bitrate yomsindo: $value kbps';
  }

  @override
  String get encodingPreset => 'Isethingi se-encoder';

  @override
  String get encodingPresetHint =>
      'Amasethingi ahamba kancane acindezela kangcono kodwa ashisisa idivayisi kakhulu.';

  @override
  String get presetOriginal => 'Okwasekuqaleni';

  @override
  String get resolution => 'Ubukhulu besithombe';

  @override
  String get frameRate => 'Ijubane lamafreyimu';

  @override
  String imageQuality(int value) {
    return 'Ikhwalithi: $value';
  }

  @override
  String get lossless => 'Ngaphandle kokulahleka';

  @override
  String get losslessHint =>
      'Amafayela amakhulu, umphumela ofana ncamashi nowasekuqaleni.';

  @override
  String get sectionEnhance => 'Ukuthuthukisa';

  @override
  String get sharpenLabel => 'Ubukhali';

  @override
  String get sharpenHint =>
      'Kwenza imiphetho icace kakhudlwana. Akukwazi ukubuyisa isithombe esifiphele noma esingagxilile — leyo mininingwane ayikho efayeleni.';

  @override
  String get sharpenStrongHint =>
      'Ubukhali obukhulu bungashiya imisebe ekhanyayo eduze kwemiphetho. Qala ngokumaphakathi.';

  @override
  String get denoiseLabel => 'Ukunciphisa umsindo ongafuneki';

  @override
  String get denoiseHint =>
      'Ihlanza ukugcwala kwezithombe ezimnyama nezasebusuku. Ukweqisa kususa imininingwane emincane.';

  @override
  String get autoColorLabel => 'Umbala namazinga azenzakalelayo';

  @override
  String get autoColorHint =>
      'Yandisa umehluko futhi iphakamise kancane imibala eyisicaba.';

  @override
  String get upscaleLabel => 'Khulisa ka-2×';

  @override
  String get upscaleHint =>
      'Iphinda kabili ububanzi nobude. Ayengezi mininingwane — isiza uma uphrinta noma unquma.';

  @override
  String get upscaleConflictHint =>
      'Buyisela Ubukhulu besithombe kokwasekuqaleni ukuze ukhulise.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Kuvaliwe';

  @override
  String get enhanceLight => 'Okulula';

  @override
  String get enhanceMedium => 'Okumaphakathi';

  @override
  String get enhanceStrong => 'Okuqinile';

  @override
  String get stripMetadata => 'Susa i-metadata';

  @override
  String get stripMetadataHint =>
      'Isusa i-EXIF, i-GPS nezikhathi kokukhiphayo.';

  @override
  String startConversion(int count) {
    return 'Guqula amafayela ($count)';
  }

  @override
  String get batchResumed => 'Kuqhutshekiwe ngokuguqula okuphazamisekile.';

  @override
  String get converting => 'Iyaguqula…';

  @override
  String get cancelBatch => 'Misa';

  @override
  String get cancelJob => 'Khansela';

  @override
  String get clearFinished => 'Susa okuqediwe';

  @override
  String get removeJob => 'Susa';

  @override
  String get shareFile => 'Yabelana';

  @override
  String get retryJob => 'Zama futhi';

  @override
  String get queueEmptyTitle => 'Ulayini awunalutho';

  @override
  String get queueEmptyBody =>
      'Amafayela owengeza kuthebhu ethi Guqula avela lapha.';

  @override
  String queueActiveTab(int count) {
    return 'Kuyasebenza · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Kuqediwe · $count';
  }

  @override
  String get queueNoActiveTitle => 'Akukho okuqhubekayo';

  @override
  String get queueNoActiveBody =>
      'Amafayela alindile noma aguqulwayo avela lapha.';

  @override
  String get queueNoFinishedTitle => 'Akukho okuqediwe okwamanje';

  @override
  String get queueNoFinishedBody =>
      'Amafayela aguqulwe afika lapha, esemi ngomumo ukuvulwa, ukugcinwa noma ukwabelwana ngawo.';

  @override
  String get statusQueued => 'Kusalindiwe';

  @override
  String get statusRunning => 'Iyaguqula';

  @override
  String get statusCompleted => 'Kuqediwe';

  @override
  String get statusFailed => 'Kwehlulekile';

  @override
  String get statusCancelled => 'Kukhanseliwe';

  @override
  String batchSummary(int done, int total) {
    return '$done kwangu-$total kuqediwe';
  }

  @override
  String batchCompleted(int done) {
    return 'Amafayela aguquliwe: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Kuguqulwe $done, kwehluleke $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% kuncane';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% kukhulu';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Ukubukeka';

  @override
  String get themeSystem => 'Isistimu';

  @override
  String get language => 'Ulimi';

  @override
  String get languageSystem => 'Isistimu';

  @override
  String get privacyTitle => 'Ubumfihlo';

  @override
  String get privacyBody =>
      'I-Eluna Media iguqula amafayela akho ngokuphelele kule divayisi isebenzisa ikhophi ye-FFmpeg efakiwe. Amafayela akho awaphumi edivayisini, akudingeki akhawunti, futhi ayikho i-telemetry. Alukho uhlangothi lohlelo olusebenzisa inethiwekhi nhlobo — alunayo ngisho nemvume ye-inthanethi.\n\nUkususwa kwe-metadata kuvuliwe ngokuzenzakalelayo, ngakho i-EXIF, izixhumanisi ze-GPS nezikhathi kususwa emafayeleni owakhiphayo.';

  @override
  String get licenseTitle => 'Ilayisensi';

  @override
  String get licenseBody =>
      'Lolu hlelo luhambisana ne-FFmpeg eyakhiwe nge-x264, i-x265 nezinye izingxenye ze-GPL, ngakho uhlelo lonke lusatshalaliswa ngaphansi kwe-GNU GPL v3.';

  @override
  String get sourceMissing => 'Ifayela lomthombo alisatholakali.';

  @override
  String get tabSettings => 'Izilungiselelo';

  @override
  String get introTitle => 'Ubumfihlo kusukela ekuklanyweni';

  @override
  String get introOfflineTitle => 'Iguqula kule divayisi';

  @override
  String get introOfflineBody =>
      'Ikhophi ye-FFmpeg efakiwe yenza wonke umsebenzi. Amafayela akho awaphumi efonini — ukuguqula kusebenza nasesimweni sendiza.';

  @override
  String get introTelemetryTitle => 'Ayikho nhlobo i-telemetry';

  @override
  String get introTelemetryBody =>
      'Ayikho i-akhawunti, awukho umhlaziyo, akukho ukubika kokuphahlazeka. Uhlelo alwazi ukuthi ungubani.';

  @override
  String get introMetadataTitle => 'I-metadata isezandleni zakho';

  @override
  String get introMetadataBody =>
      'I-EXIF, i-GPS nezikhathi kususwa kuwo wonke umphumela ngokuzenzakalelayo. Ungakuvala lokho.';

  @override
  String get introFreeNote =>
      'Kumahhala, akukho zikhangiso futhi akukho ukubhalisa. Zonke izici, kufaka phakathi ukuguqula amafayela amaningi ngesikhathi esisodwa, zingezakho kusukela ekuqaleni — okuwukuphela kwento engathengwa yithiphu, futhi ayivuli lutho.';

  @override
  String get introContinue => 'Qalisa';

  @override
  String get modeSimple => 'Okulula';

  @override
  String get modeAdvanced => 'Okuthuthukisiwe';

  @override
  String get modeAdvancedHint =>
      'Bonisa wonke ama-codec, ama-bitrate nezilawuli zoshintsho esikhundleni samakhadi asethiwe.';

  @override
  String get presetCompressVideoTitle => 'Cindezela ividiyo';

  @override
  String get presetCompressVideoBody =>
      'I-MP4 encane kakhulu, ikhwalithi ihlala inhle';

  @override
  String get presetFitToSizeTitle => 'Linganisa ngobukhulu';

  @override
  String get presetFitToSizeBody =>
      'Finyelela umkhawulo oqondile — i-Discord, i-imeyili, izingxoxo';

  @override
  String get presetCompatibleMp4Title => 'I-MP4 esebenzisana nakho konke';

  @override
  String get presetCompatibleMp4Body => 'I-H.264 ne-AAC. Idlala yonke indawo';

  @override
  String get presetExtractAudioTitle => 'Khipha umsindo';

  @override
  String get presetExtractAudioBody => 'I-MP3 kunoma iyiphi ividiyo';

  @override
  String get presetVideoToGifTitle => 'Ividiyo ibe yi-GIF';

  @override
  String get presetVideoToGifBody => 'Ividiyo emfushane ibe yi-GIF enyakazayo';

  @override
  String get presetMergeTitle => 'Hlanganisa amavidiyo';

  @override
  String get presetMergeBody =>
      'Hlanganisa amavidiyo abe yi-MP4 eyodwa, ngokulandelana';

  @override
  String get mergeNeedsTwo =>
      'Khetha okungenani amavidiyo amabili ukuze uwahlanganise.';

  @override
  String mergedVideoName(int count) {
    return 'Ividiyo ehlanganisiwe ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Cindezela isithombe';

  @override
  String get presetCompressImageBody =>
      'I-JPEG encane, ukulahleka okucishe kungabonakali';

  @override
  String get presetEnhancePhotoTitle => 'Thuthukisa isithombe';

  @override
  String get presetEnhancePhotoBody => 'Kucacile, kubukhali, umbala ungcono';

  @override
  String get presetImageToWebpTitle => 'Isithombe sibe yi-WebP';

  @override
  String get presetImageToWebpBody => 'Ifomethi yesimanje, encane kune-JPEG';

  @override
  String get sizeTargetTitle => 'Ubukhulu obuhlosiwe';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Okuzenzele…';

  @override
  String get sizeTargetDialogTitle => 'Ubukhulu obuhlosiwe nge-MB';

  @override
  String get sizeTargetTooSmall =>
      'Umkhawulo mncane kakhulu kulobu bude besikhathi; kuzosetshenziswa ikhwalithi eseduze kakhulu enokwenzeka.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size ngefayela ngalinye';
  }

  @override
  String estimateTotal(String size) {
    return 'Umphumela olindelekile: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Amafayela akhethiwe: $count';
  }

  @override
  String get promiseOffline =>
      'Ukuguqula okungu-100% ngaphandle kwe-inthanethi';

  @override
  String get promiseBatchFree => 'Ukuguqula ngobuningi kumahhala';

  @override
  String get promiseNoWatermark => 'Alukho uphawu lwamanzi';

  @override
  String get sectionTransform => 'Ushintsho';

  @override
  String get rotateLabel => 'Phendula';

  @override
  String get flipLabel => 'Phendula ngokuvundlile';

  @override
  String get speedLabel => 'Ijubane';

  @override
  String get cropLabel => 'Nquma';

  @override
  String get cropHint =>
      'Nquma usuka maphakathi ngesilinganiso osikhethile — isikwele sezingosi, u-9:16 wezindaba.';

  @override
  String volumeLabel(int percent) {
    return 'Ivolumu: $percent%';
  }

  @override
  String get addAudioFiles => 'Umsindo namanye amafayela';

  @override
  String get hwEncoderLabel => 'Ukubhala nge-hardware';

  @override
  String get hwEncoderHint =>
      'Kusebenzisa i-chip yevidiyo yedivayisi kumamodi e-bitrate nawokulinganisa ngobukhulu — kusheshe kakhulu futhi akushisi. Imodi yekhwalithi (CRF) ihlala isebenzisa i-encoder yesofthiwe enembayo, futhi umsebenzi we-hardware owehlulekile uphinda uzame ngesofthiwe ngokuzenzakalelayo.';

  @override
  String get transformNeedsReencode =>
      'Ukuphendula, ukuphendula ngokuvundlile nejubane kudinga ukubhalwa kabusha, ngakho akusebenzi ngesikhathi sokukopisha okuqondile.';

  @override
  String get capBitrateLabel => 'Ungalokothi wenze ifayela likhule';

  @override
  String get capBitrateHint =>
      'Ikhawula ukubhala ku-bitrate yomthombo uqobo. Ikhwalithi engaguquki ayinawo umkhawulo wayo, ngakho ividiyo esivele icindezelwe ingaphuma inkulu.';

  @override
  String get keepSubtitles => 'Gcina imibhalo engezansi';

  @override
  String get keepSubtitlesHint =>
      'Ithatha imizila yemibhalo engezansi iyibeke kokukhiphayo. Imibhalo engezansi yombhalo kuphela.';

  @override
  String get sectionTrim => 'Ukunquma';

  @override
  String get trimEnable => 'Nquma umthombo';

  @override
  String get trimHint =>
      'Kuyatholakala uma kunefayela elilodwa kuphela elinobude obaziwayo kulayini.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Ubukhulu obuhlosiwe';

  @override
  String get lowBatteryTitle => 'Ibhethri liphansi';

  @override
  String get lowBatteryBody =>
      'Ukuguqula kusebenzisa isiqondisi kanzima. Ungaqala uxhume ushaja, noma uqhubeke noma kunjalo.';

  @override
  String get lowBatteryContinue => 'Guqula noma kunjalo';

  @override
  String get commonCancel => 'Khansela';

  @override
  String get commonOk => 'Kulungile';

  @override
  String filesReceived(int count) {
    return 'Amafayela atholiwe: $count';
  }

  @override
  String get saveFile => 'Gcina';

  @override
  String get savedToGallery =>
      'Kugcinwe kugalari, i-albhamu ethi “Eluna Media”.';

  @override
  String get savedToDownloads => 'Kugcinwe ku-Downloads.';

  @override
  String get saveFailed => 'Ayikwazanga ukugcina ifayela.';

  @override
  String get jobRemovedUndo => 'Umsebenzi ususiwe.';

  @override
  String get finishedClearedUndo => 'Imisebenzi eqediwe isusiwe.';

  @override
  String get undo => 'Hlehlisa';

  @override
  String get errorDetailsTitle => 'Imininingwane yephutha';

  @override
  String get sectionConversionPrefs => 'Ukuguqula';

  @override
  String get powerModeLabel => 'Imodi yamandla';

  @override
  String get powerEfficiency => 'Kupholile futhi kuyashesha';

  @override
  String get powerBalanced => 'Kulinganiselwe';

  @override
  String get powerQuality => 'Ukucindezela okukhulu';

  @override
  String get powerModeHint =>
      'Ukuthi i-encoder yevidiyo isebenza kanzima kangakanani. Okupholile nokusheshayo kusho amafayela amakhudlwana. Akukho okunye okuncishiswayo — nakanye.';

  @override
  String get hapticsLabel => 'Impendulo yokudlidliza';

  @override
  String get networkPrivacyTitle => 'Inethiwekhi nobumfihlo';

  @override
  String get netAuditIntro =>
      'Uhlu oluphelele lwakho konke kulolu hlelo okungathinta inethiwekhi.';

  @override
  String get netAuditNoneTitle => 'Akukho ukufinyelela inethiwekhi nhlobo';

  @override
  String get netAuditNoneBody =>
      'Uhlelo alucelanga imvume ye-inthanethi, ngakho alukwazi ukufinyelela inethiwekhi noma lungazama — ungakuqinisekisa lokho kulwazi lohlelo lwesistimu. Azikho izikhangiso, awukho umhlaziyo, akukho ukubheka izibuyekezo. Okuthi “Nikeza uhlelo isilinganiso” kudlulisela kuhlelo lwesitolo, olukhuluma lona ngokwalo.';

  @override
  String get netAuditConversionTitle => 'Ukuguqula';

  @override
  String get netAuditConversionBody =>
      'Kwenzeka ngokuphelele kule divayisi ngokusebenzisa i-FFmpeg efakiwe. Vula isimo sendiza bese uguqula — kuyasebenza.';

  @override
  String get netAuditTelemetryTitle => 'I-telemetry';

  @override
  String get netAuditTelemetryBody =>
      'Ayikho. Uhlelo aluqoqi mhlaziyo, alubiki ukuphahlazeka, aluqoqi zikhombisi, futhi alunayo indlela yama-akhawunti.';

  @override
  String get netAuditTipsTitle => 'Amathiphu';

  @override
  String get netAuditTipsBody =>
      'Ithiphu yenziwa uhlelo lwe-Play Store, hhayi lolu — olusengenayo imvume ye-inthanethi. Ukukhokha kwengeza imigqa emibili ohlwini lwezimvume: “ukuthenga ngaphakathi kohlelo”, kanye “nokubona ukuxhumana kwenethiwekhi”, okufunda kuphela ukuthi ukhona yini umxhumanisi futhi okungakwazi ukuwusebenzisa. Akukho okuthengwa ngokuzenzakalelayo, futhi ithiphu ayivuli lutho: zonke izici lapha zimahhala.';

  @override
  String get sectionSupport => 'Ukusekela';

  @override
  String get rateApp => 'Nikeza uhlelo isilinganiso';

  @override
  String get openLicenses => 'Amalayisensi omthombo ovulekile';

  @override
  String get presetAudioToMp3Title => 'Guqula umsindo';

  @override
  String get presetAudioToMp3Body => 'Ube yi-MP3 — udlala kunoma yini';

  @override
  String get presetCompressAudioTitle => 'Cindezela umsindo';

  @override
  String get presetCompressAudioBody =>
      'I-AAC encane — amanothi ezwi, ama-podcast';

  @override
  String get convertTo => 'Guqulela ku-';

  @override
  String get formatSectionHint =>
      'Kubalwe amafomethi amafayela akho angaba yiwo ngempela kuphela.';

  @override
  String get sourceVideo => 'Ividiyo';

  @override
  String get sourceImage => 'Isithombe';

  @override
  String get sourceAudio => 'Umsindo';

  @override
  String get sourceUnknown => 'Ifayela';

  @override
  String get mixedSelectionTitle => 'Kukhethwe izinhlobo ezehlukene zamafayela';

  @override
  String get mixedSelectionBody =>
      'Ifayela ngalinye liguqulwa ngesethingi elifanele uhlobo lwalo. Engeza uhlobo olulodwa ngesikhathi ukuze ulawule ngokugcwele.';

  @override
  String get filesTitle => 'Amafayela';

  @override
  String get removeFile => 'Susa';

  @override
  String timeLeft(String time) {
    return '≈ $time okusele';
  }

  @override
  String get jobSettingsTitle => 'Izilungiselelo zokuguqula';

  @override
  String get jobDetails => 'Imininingwane';

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
  String get summaryEnhanced => 'Kuthuthukisiwe';

  @override
  String get summaryMetadataStripped => 'I-metadata isusiwe';

  @override
  String summaryMerge(int count) {
    return 'Amavidiyo ahlanganisiwe: $count';
  }

  @override
  String get shareApp => 'Yabelana ngohlelo';

  @override
  String get shareAppText =>
      'I-Eluna Media — isiguquli sezithombe, samavidiyo nomsindo esimahhala, esisebenza ngokuphelele ngaphandle kwe-inthanethi. Akukho ukubhalisa, alukho uphawu lwamanzi, awekho ama-akhawunti.';

  @override
  String appVersionLabel(String version) {
    return 'Inguqulo $version';
  }

  @override
  String get openFile => 'Vula';

  @override
  String get openFolder => 'Bonisa ifolda';

  @override
  String get noAppToOpen =>
      'Alukho uhlelo kule divayisi olungavula lelo fayela.';

  @override
  String get openFailed => 'Ayikwazanga ukuvula ifayela.';

  @override
  String get twoPassLabel => 'Ukudlula kabili ukuze ubukhulu bube ngqo';

  @override
  String get twoPassHint =>
      'Imisebenzi yokulinganisa ngobukhulu ibhala kabili futhi ifinyelela isabelo samabhayithi ngokunemba okukhulu — ngesikhathi nangebhethri okuphindwe cishe kabili.';

  @override
  String get whatsNewTitle => 'Okusha';

  @override
  String get whatsNew1 =>
      'Ividiyo ingaba yi-AV1 manje: amafayela amancane kakhulu, uma ukwazi ukuwalinda.';

  @override
  String get whatsNew2 =>
      'Okusha ezithombeni: i-AVIF, ecishe ibe yingxenye ye-JPEG, ne-WebP enyakazayo esikhundleni se-GIF.';

  @override
  String get whatsNew3 =>
      'I-M4A ingaba ngaphandle kokulahleka — i-ALAC manje ihlala eduze kwe-AAC.';

  @override
  String get whatsNew4 =>
      'Isikrini esisodwa sokubukeka: ukukhanya, umbala ogqamile, okumnyama ncimishi kwe-OLED ne-Material You.';

  @override
  String get whatsNew5 =>
      'Impumelelo inezindondo, amathebhu amathathu, nenqubekela phambili ongabelana ngayo njengesithombe.';

  @override
  String get achievementsTitle => 'Impumelelo';

  @override
  String achievementsProgress(int done, int total) {
    return '$done kwangu-$total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Kubalwa kule divayisi kuphela. Alukho olulayishelwa ndawo.';

  @override
  String get achFirstConversionTitle => 'Izinyathelo zokuqala';

  @override
  String get achFirstConversionBody => 'Guqula ifayela lakho lokuqala.';

  @override
  String get achTenConversionsTitle => 'Usufudumele';

  @override
  String get achTenConversionsBody => 'Guqula amafayela angu-10.';

  @override
  String get achFiftyConversionsTitle => 'Ojwayelekile';

  @override
  String get achFiftyConversionsBody => 'Guqula amafayela angu-50.';

  @override
  String get achTwoHundredConversionsTitle => 'Isisebenzi esikhulu';

  @override
  String get achTwoHundredConversionsBody => 'Guqula amafayela angu-200.';

  @override
  String get achThousandConversionsTitle => 'Ibhande lokuthutha';

  @override
  String get achThousandConversionsBody => 'Guqula amafayela angu-1000.';

  @override
  String get achSaved100MbTitle => 'Umonga wesikhala';

  @override
  String get achSaved100MbBody => 'Khulula i-100 MB sekukonke.';

  @override
  String get achSaved1GbTitle => 'Umzingeli wamagigabhayithi';

  @override
  String get achSaved1GbBody => 'Khulula i-1 GB sekukonke.';

  @override
  String get achSaved10GbTitle => 'Iqhawe lesitoreji';

  @override
  String get achSaved10GbBody => 'Khulula i-10 GB sekukonke.';

  @override
  String get achBatchOfFiveTitle => 'Isisebenzi sobuningi';

  @override
  String get achBatchOfFiveBody =>
      'Qeda iqoqo lamafayela angu-5 noma ngaphezulu.';

  @override
  String get achBatchOfTwentyTitle => 'Umugqa wokuhlanganisa';

  @override
  String get achBatchOfTwentyBody =>
      'Qeda iqoqo lamafayela angu-20 noma ngaphezulu.';

  @override
  String get achSniperTitle => 'Umcibisheli';

  @override
  String get achSniperBody =>
      'Finyelela ubukhulu obuqondile ngokulinganisa ngobukhulu.';

  @override
  String get achMemeSmithTitle => 'Umkhandi wama-meme';

  @override
  String get achMemeSmithBody => 'Guqula ividiyo ibe yi-GIF.';

  @override
  String get achSoundHunterTitle => 'Umzingeli womsindo';

  @override
  String get achSoundHunterBody => 'Khipha umsindo evidiyweni.';

  @override
  String get achSubtitleKeeperTitle => 'Umgcini wemibhalo engezansi';

  @override
  String get achSubtitleKeeperBody =>
      'Guqula ividiyo ugcine imibhalo yayo engezansi.';

  @override
  String get achDirectorTitle => 'Umqondisi';

  @override
  String get achDirectorBody =>
      'Sebenzisa ushintsho — ukuphendula, ukunquma, ijubane noma ivolumu.';

  @override
  String get achAllRounderTitle => 'Owenza konke';

  @override
  String get achAllRounderBody => 'Guqula ividiyo, umsindo nesithombe.';

  @override
  String get achNightOwlTitle => 'Isikhova sasebusuku';

  @override
  String get achNightOwlBody =>
      'Qeda ukuguqula phakathi kwamabili nehora lesihlanu ekuseni.';

  @override
  String get achPlatinumTitle => 'I-Platinum';

  @override
  String get achPlatinumBody => 'Zuza yonke enye impumelelo.';

  @override
  String get storageTitle => 'Isitoreji';

  @override
  String get storageBody =>
      'Amafayela aguqulwe ahlala ngaphakathi kohlelo uze uwagcine noma wabelane ngawo, lapho engekho umphathi wamafayela ongafinyelela kuwo.';

  @override
  String get storageEmpty => 'Akukho okugciniwe';

  @override
  String storageUsage(String size) {
    return 'Kugciniwe: $size';
  }

  @override
  String get storageClearTitle => 'Susa amafayela agciniwe?';

  @override
  String get storageClearBody =>
      'Kususa yonke imiphumela eqediwe uhlelo olusayibambile. Amafayela osuwagcinile noma owabelene ngawo awathintwa.';

  @override
  String get storageClearAction => 'Susa';

  @override
  String storageCleared(String size) {
    return 'Kukhululwe $size';
  }

  @override
  String get autoSaveLabel => 'Gcina imiphumela ngokuzenzakalelayo';

  @override
  String get autoSaveHint =>
      'Ifaka ifayela ngalinye eliqediwe kugalari — umsindo ku-Downloads — ngokushesha nje uma selilungile.';

  @override
  String get lowSpaceTitle => 'Asisekho isikhala esiningi';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Leli qoqo lidinga cishe u-$needed kanti u-$free kuphela okukhululekile. Ukuguqula kungase kume phakathi.';
  }

  @override
  String saveAll(int count) {
    return 'Gcina konke ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Kugciniwe: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Kugcinwe $saved kwangu-$total';
  }

  @override
  String get presetFitPhotoTitle => 'Linganisa isithombe ngobukhulu';

  @override
  String get presetFitPhotoBody =>
      'Cindezela isithombe singaphansi komkhawulo oqondile — amafomu okulayisha, izicelo.';

  @override
  String get photoFitHint =>
      'Uhlelo luzama amazinga ekhwalithi luze luthole elifanayo. Uma isabelo sincane kakhulu esithombeni, lunciphisa nobukhulu befreyimu.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Ubukhulu obuhlosiwe nge-KB';

  @override
  String get compareAction => 'Qhathanisa';

  @override
  String get compareBefore => 'Ngaphambili';

  @override
  String get compareAfter => 'Ngemuva';

  @override
  String get compareHint => 'Cindezela ubambe ukuze ubone okwasekuqaleni.';

  @override
  String get trimStart => 'Ukuqala';

  @override
  String get trimEnd => 'Ukuphela';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, kufika ku-$duration';
  }

  @override
  String get imageScaleLabel => 'Isilinganiso';

  @override
  String get audioChannelsLabel => 'Iziteshi';

  @override
  String get audioMono => 'I-mono';

  @override
  String get audioStereo => 'I-stereo';

  @override
  String get sampleRateLabel => 'Izinga lesampula';

  @override
  String get voiceAudioHint =>
      'I-mono ku-22.05 kHz inciphisa ukuqoshwa kwezwi cishe kube ingxenye eyodwa kwezine ngaphandle kokulahleka okuzwakalayo. Shiya kokubili kokwasekuqaleni uma kungumculo.';

  @override
  String get moveUp => 'Yisa phezulu';

  @override
  String get moveDown => 'Yisa phansi';

  @override
  String get renameOutput => 'Shintsha igama lomphumela';

  @override
  String get renameOutputHint => 'Igama elisha';

  @override
  String get renameOutputHelp =>
      'Isandiso sivela kufomethi yokukhiphayo. Lishiye lingenalutho ukuze umphumela ubizwe ngegama lomthombo.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Susa amafayela asekuqaleni ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'Susa amafayela asekuqaleni ngemva kokuguqula';

  @override
  String get deleteOriginalsHint =>
      'Icela isistimu ukuthi isuse amafayela omthombo lapho umphumela usugciniwe. Isistimu ihlala ibonisa okuzohamba futhi ilinde ukuqinisekisa kwakho.';

  @override
  String originalsDeleted(String size) {
    return 'Amafayela asekuqaleni asusiwe — kukhululwe $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Akukho okususiwe. Kutholakala kuphela amafayela igalari esawagcinile ngegama lawo lasekuqaleni.';

  @override
  String reclaimedTotal(String size) {
    return 'Kukhululwe ngalolu hlelo: $size';
  }

  @override
  String get deleteAllData => 'Susa yonke idatha';

  @override
  String get deleteAllDataHint =>
      'Isula konke uhlelo olukugcina kule divayisi: ulayini, amafayela aguqulwe, ukubuka kuqala, impumelelo nezilungiselelo. Amafayela osuwagcinile kugalari yakho awathintwa.';

  @override
  String get codecCopy => 'Kopisha';

  @override
  String get codecCopyRemux => 'Kopisha (remux)';

  @override
  String get codecNoVideo => 'Ayikho ividiyo';

  @override
  String get codecNoAudio => 'Awukho umsindo';

  @override
  String codecLossless(String codec) {
    return '$codec (ngaphandle kokulahleka)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (enyakazayo)';
  }

  @override
  String get sizeTargetEmail => 'I-imeyili';

  @override
  String get trimTimeHint => 'm:ss';
}
