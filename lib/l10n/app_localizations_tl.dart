// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tagalog (`tl`).
class L10nTl extends L10n {
  L10nTl([String locale = 'tl']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'I-convert';

  @override
  String get tabQueue => 'Pila';

  @override
  String get addFiles => 'Magdagdag ng file';

  @override
  String get emptySelectionTitle => 'Wala pang file';

  @override
  String get emptySelectionBody =>
      'Magdagdag ng litrato, video o audio. Lahat ay pinoproseso sa device na ito.';

  @override
  String get sectionOutput => 'Output';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Larawan';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Video codec';

  @override
  String get audioCodec => 'Audio codec';

  @override
  String get rateControl => 'Rate control';

  @override
  String get rateControlQuality => 'Palagiang kalidad (CRF)';

  @override
  String get rateControlBitrate => 'Target na bitrate';

  @override
  String crfLabel(int value) {
    return 'Kalidad (CRF $value)';
  }

  @override
  String get crfHint =>
      'Mas mababa ang bilang, mas maganda ang kalidad at mas malaki ang file.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate ng video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate ng audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Preset ng encoder';

  @override
  String get encodingPresetHint =>
      'Mas mabagal na preset, mas maganda ang compression pero mas umiinit ang device.';

  @override
  String get presetOriginal => 'Orihinal';

  @override
  String get resolution => 'Resolusyon';

  @override
  String get frameRate => 'Frame rate';

  @override
  String imageQuality(int value) {
    return 'Kalidad: $value';
  }

  @override
  String get lossless => 'Lossless';

  @override
  String get losslessHint =>
      'Mas malalaking file, tumpak sa bawat pixel ang output.';

  @override
  String get sectionEnhance => 'Pagpapaganda';

  @override
  String get sharpenLabel => 'Talas';

  @override
  String get sharpenHint =>
      'Ginagawang mas malinaw ang mga gilid. Hindi nito maibabalik ang malabo o wala sa focus na kuha — wala talaga ang detalyeng iyon sa file.';

  @override
  String get sharpenStrongHint =>
      'Ang malakas na pagpapatalas ay maaaring mag-iwan ng maliliwanag na halo sa mga gilid. Subukan muna ang katamtaman.';

  @override
  String get denoiseLabel => 'Pagbawas ng ingay';

  @override
  String get denoiseHint =>
      'Nililinis ang grain sa madilim at gabing mga litrato. Kapag sobra, naaalis din nito ang pinong detalye.';

  @override
  String get autoColorLabel => 'Awtomatikong kulay at antas';

  @override
  String get autoColorHint =>
      'Hinahatak ang contrast at bahagyang binubuhay ang mga kupas na kulay.';

  @override
  String get upscaleLabel => 'Palakihin nang 2×';

  @override
  String get upscaleHint =>
      'Dinodoble ang lapad at taas. Hindi ito nagdaragdag ng detalye — nakakatulong ito kapag nagpi-print o nagki-crop.';

  @override
  String get upscaleConflictHint =>
      'Ibalik ang Resolusyon sa Orihinal para makapagpalaki.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Naka-off';

  @override
  String get enhanceLight => 'Magaan';

  @override
  String get enhanceMedium => 'Katamtaman';

  @override
  String get enhanceStrong => 'Malakas';

  @override
  String get stripMetadata => 'Alisin ang metadata';

  @override
  String get stripMetadataHint =>
      'Inaalis ang EXIF, GPS at mga timestamp sa output.';

  @override
  String startConversion(int count) {
    return 'I-convert ang $count file';
  }

  @override
  String get batchResumed => 'Ipinagpatuloy ang naantalang conversion.';

  @override
  String get converting => 'Kino-convert…';

  @override
  String get cancelBatch => 'Itigil';

  @override
  String get cancelJob => 'Kanselahin';

  @override
  String get clearFinished => 'I-clear ang tapos na';

  @override
  String get removeJob => 'Alisin';

  @override
  String get shareFile => 'I-share';

  @override
  String get retryJob => 'Ulitin';

  @override
  String get queueEmptyTitle => 'Walang laman ang pila';

  @override
  String get queueEmptyBody =>
      'Lumalabas dito ang mga file na idinaragdag mo sa tab na I-convert.';

  @override
  String queueActiveTab(int count) {
    return 'Aktibo · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Tapos na · $count';
  }

  @override
  String get queueNoActiveTitle => 'Walang kasalukuyang ginagawa';

  @override
  String get queueNoActiveBody =>
      'Lumalabas dito ang mga file na naghihintay o kino-convert.';

  @override
  String get queueNoFinishedTitle => 'Wala pang natatapos';

  @override
  String get queueNoFinishedBody =>
      'Dito napupunta ang mga na-convert na file, handang buksan, i-save o i-share.';

  @override
  String get statusQueued => 'Nasa pila';

  @override
  String get statusRunning => 'Kino-convert';

  @override
  String get statusCompleted => 'Tapos na';

  @override
  String get statusFailed => 'Nabigo';

  @override
  String get statusCancelled => 'Kinansela';

  @override
  String batchSummary(int done, int total) {
    return '$done sa $total ang tapos';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Na-convert ang $done file',
      one: 'Na-convert ang 1 file',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Na-convert ang $done, nabigo ang $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% na mas maliit';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% na mas malaki';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Hitsura';

  @override
  String get themeSystem => 'System';

  @override
  String get language => 'Wika';

  @override
  String get languageSystem => 'System';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyBody =>
      'Kino-convert ng Eluna Media ang mga file mo nang buo sa device na ito gamit ang kasamang kopya ng FFmpeg. Hindi kailanman umaalis sa device ang mga file mo, walang kailangang account, at walang telemetry. Walang anuman sa app ang gumagamit ng network — wala nga itong permission sa internet.\n\nNaka-on bilang default ang pag-aalis ng metadata, kaya inaalis ang EXIF, mga koordinada ng GPS at mga timestamp sa mga file na ini-export mo.';

  @override
  String get licenseTitle => 'Paglilisensya';

  @override
  String get licenseBody =>
      'Kasama sa app na ito ang FFmpeg na binuo gamit ang x264, x265 at iba pang bahaging GPL, kaya ang buong application ay ipinamamahagi sa ilalim ng GNU GPL v3.';

  @override
  String get sourceMissing => 'Hindi na available ang pinagmulang file.';

  @override
  String get tabSettings => 'Mga setting';

  @override
  String get introTitle => 'Pribado sa disenyo';

  @override
  String get introOfflineTitle => 'Nagko-convert sa device na ito';

  @override
  String get introOfflineBody =>
      'Ang kasamang kopya ng FFmpeg ang gumagawa ng lahat. Hindi umaalis sa telepono ang mga file mo — gumagana ang conversion kahit naka-airplane mode.';

  @override
  String get introTelemetryTitle => 'Walang telemetry';

  @override
  String get introTelemetryBody =>
      'Walang account, walang analytics, walang crash reporting. Hindi alam ng app kung sino ka.';

  @override
  String get introMetadataTitle => 'Kontrolado ang metadata';

  @override
  String get introMetadataBody =>
      'Bilang default, inaalis ang EXIF, GPS at mga timestamp sa bawat output. Puwede mo itong i-off.';

  @override
  String get introFreeNote =>
      'Libre, walang ad at walang subscription. Sa iyo na mula sa simula ang bawat feature, kasama ang batch conversion — ang tanging mabibili ay tip, at wala itong binubuksan.';

  @override
  String get introContinue => 'Magsimula';

  @override
  String get modeSimple => 'Simple';

  @override
  String get modeAdvanced => 'Advanced';

  @override
  String get modeAdvancedHint =>
      'Ipakita ang bawat kontrol sa codec, bitrate at transform sa halip na ang mga preset card.';

  @override
  String get presetCompressVideoTitle => 'I-compress ang video';

  @override
  String get presetCompressVideoBody =>
      'Mas maliit na MP4, maganda pa rin ang kalidad';

  @override
  String get presetFitToSizeTitle => 'Iakma sa laki';

  @override
  String get presetFitToSizeBody =>
      'Tugma sa eksaktong limitasyon — Discord, email, chat';

  @override
  String get presetCompatibleMp4Title => 'Compatible na MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Napa-play kahit saan';

  @override
  String get presetExtractAudioTitle => 'Kunin ang audio';

  @override
  String get presetExtractAudioBody => 'MP3 mula sa kahit anong video';

  @override
  String get presetVideoToGifTitle => 'Video sa GIF';

  @override
  String get presetVideoToGifBody => 'Maikling clip tungong animated na GIF';

  @override
  String get presetMergeTitle => 'Pagsamahin ang mga video';

  @override
  String get presetMergeBody =>
      'Idugtong ang mga clip sa iisang MP4, sunod-sunod';

  @override
  String get mergeNeedsTwo =>
      'Pumili ng hindi bababa sa dalawang video para pagsamahin.';

  @override
  String mergedVideoName(int count) {
    return 'Pinagsamang video ($count clip).mp4';
  }

  @override
  String get presetCompressImageTitle => 'I-compress ang litrato';

  @override
  String get presetCompressImageBody =>
      'Mas maliit na JPEG, halos hindi mahalata ang pagkawala';

  @override
  String get presetEnhancePhotoTitle => 'Pagandahin ang litrato';

  @override
  String get presetEnhancePhotoBody =>
      'Mas malinis, mas matalas, mas maganda ang kulay';

  @override
  String get presetImageToWebpTitle => 'Litrato sa WebP';

  @override
  String get presetImageToWebpBody => 'Modernong format, mas maliit kaysa JPEG';

  @override
  String get sizeTargetTitle => 'Target na laki';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Custom…';

  @override
  String get sizeTargetDialogTitle => 'Target na laki sa MB';

  @override
  String get sizeTargetTooSmall =>
      'Masyadong maliit ang target para sa habang ito; gagamitin ang pinakamalapit na posibleng kalidad.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size bawat file';
  }

  @override
  String estimateTotal(String size) {
    return 'Tinatayang output: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file ang napili',
      one: '1 file ang napili',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% offline na conversion';

  @override
  String get promiseBatchFree => 'Libre ang batch';

  @override
  String get promiseNoWatermark => 'Walang watermark';

  @override
  String get sectionTransform => 'Transform';

  @override
  String get rotateLabel => 'Iikot';

  @override
  String get flipLabel => 'Salaminin nang pahalang';

  @override
  String get speedLabel => 'Bilis';

  @override
  String get cropLabel => 'I-crop';

  @override
  String get cropHint =>
      'Nakasentrong crop sa piniling aspect ratio — parisukat para sa feed, 9:16 para sa story.';

  @override
  String volumeLabel(int percent) {
    return 'Lakas ng tunog: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio at iba pang file';

  @override
  String get hwEncoderLabel => 'Hardware encoding';

  @override
  String get hwEncoderHint =>
      'Ginagamit ang video chip ng device sa bitrate at iakma-sa-laki na mode — mas mabilis at mas malamig. Ang quality (CRF) mode ay laging gumagamit ng tumpak na software encoder, at ang nabigong hardware job ay awtomatikong inuulit sa software.';

  @override
  String get transformNeedsReencode =>
      'Kailangan ng muling pag-encode ng pag-ikot, pagsasalamin at bilis, kaya naka-off ang mga ito habang stream copy.';

  @override
  String get capBitrateLabel => 'Huwag kailanman palakihin ang file';

  @override
  String get capBitrateHint =>
      'Nililimitahan ang encode sa sariling bitrate ng pinagmulan. Walang sariling hangganan ang palagiang kalidad, kaya maaaring lumabas na mas malaki ang video na na-compress na noon pa.';

  @override
  String get keepSubtitles => 'Panatilihin ang subtitle';

  @override
  String get keepSubtitlesHint =>
      'Isinasama ang mga subtitle track sa output. Tekstong subtitle lamang.';

  @override
  String get sectionTrim => 'Pagputol';

  @override
  String get trimEnable => 'Putulin ang pinagmulan';

  @override
  String get trimHint =>
      'Available kapag iisang file lang na alam ang haba ang nasa pila.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Target na laki';

  @override
  String get lowBatteryTitle => 'Mahina na ang baterya';

  @override
  String get lowBatteryBody =>
      'Pinapagod ng conversion ang processor. Puwede kang magsaksak muna, o magpatuloy na lang.';

  @override
  String get lowBatteryContinue => 'Mag-convert pa rin';

  @override
  String get commonCancel => 'Kanselahin';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nakatanggap ng $count file',
      one: 'Nakatanggap ng 1 file',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'I-save';

  @override
  String get savedToGallery => 'Na-save sa gallery, sa album na “Eluna Media”.';

  @override
  String get savedToDownloads => 'Na-save sa Downloads.';

  @override
  String get saveFailed => 'Hindi na-save ang file.';

  @override
  String get jobRemovedUndo => 'Inalis ang job.';

  @override
  String get finishedClearedUndo => 'Na-clear ang mga tapos nang job.';

  @override
  String get undo => 'I-undo';

  @override
  String get errorDetailsTitle => 'Detalye ng error';

  @override
  String get sectionConversionPrefs => 'Conversion';

  @override
  String get powerModeLabel => 'Power mode';

  @override
  String get powerEfficiency => 'Malamig at mabilis';

  @override
  String get powerBalanced => 'Balanse';

  @override
  String get powerQuality => 'Pinakamataas na compression';

  @override
  String get powerModeHint =>
      'Kung gaano kabigat magtrabaho ang video encoder. Mas malamig at mas mabilis ay nangangahulugang medyo mas malalaking file. Walang ibang bahagi ang hinihinaan — kailanman.';

  @override
  String get hapticsLabel => 'Panginginig bilang tugon';

  @override
  String get networkPrivacyTitle => 'Network at privacy';

  @override
  String get netAuditIntro =>
      'Kumpletong listahan ng lahat ng bagay sa app na ito na maaaring dumampi sa network.';

  @override
  String get netAuditNoneTitle => 'Walang anumang access sa network';

  @override
  String get netAuditNoneBody =>
      'Hindi humihingi ang app ng permission sa internet, kaya hindi nito maaabot ang network kahit subukan pa nito — mave-verify mo iyon sa app info ng system. Walang ad, walang analytics, walang pagsusuri ng update. Ang “I-rate ang app” ay ipinapasa sa app ng store, at ito ang nakikipag-ugnayan.';

  @override
  String get netAuditConversionTitle => 'Conversion';

  @override
  String get netAuditConversionBody =>
      'Buong-buong tumatakbo sa device na ito sa pamamagitan ng kasamang FFmpeg. I-on ang airplane mode at mag-convert — gumagana ito.';

  @override
  String get netAuditTelemetryTitle => 'Telemetry';

  @override
  String get netAuditTelemetryBody =>
      'Wala nito. Walang kinokolektang analytics, crash report o identifier ang app, at wala itong sistema ng account.';

  @override
  String get netAuditTipsTitle => 'Mga tip';

  @override
  String get netAuditTipsBody =>
      'Ang tip ay isinasagawa ng app ng Play Store, hindi ng app na ito — na wala pa ring permission sa internet. May idinaragdag ngang dalawang linya ang billing sa listahan ng permission: “in-app purchases”, at “view network connections”, na nagbabasa lamang kung may koneksyon at hindi ito magagamit. Walang binibili nang awtomatiko, at walang binubuksan ang tip: libre ang bawat feature dito.';

  @override
  String get sectionSupport => 'Suporta';

  @override
  String get rateApp => 'I-rate ang app';

  @override
  String get openLicenses => 'Mga lisensya ng open source';

  @override
  String get presetAudioToMp3Title => 'I-convert ang audio';

  @override
  String get presetAudioToMp3Body => 'Tungong MP3 — napa-play sa kahit ano';

  @override
  String get presetCompressAudioTitle => 'I-compress ang audio';

  @override
  String get presetCompressAudioBody =>
      'Mas magaan na AAC — voice note, podcast';

  @override
  String get convertTo => 'I-convert sa';

  @override
  String get formatSectionHint =>
      'Ang nakalista lang ay ang mga format na talagang kaya ng mga file mo.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Litrato';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'File';

  @override
  String get mixedSelectionTitle => 'Magkakaibang uri ng file ang napili';

  @override
  String get mixedSelectionBody =>
      'Ang bawat file ay kino-convert gamit ang pinakamainam na preset para sa sariling uri nito. Magdagdag ng isang uri sa bawat pagkakataon para sa buong kontrol.';

  @override
  String get filesTitle => 'Mga file';

  @override
  String get removeFile => 'Alisin';

  @override
  String timeLeft(String time) {
    return '≈ $time na lang';
  }

  @override
  String get jobSettingsTitle => 'Mga setting ng conversion';

  @override
  String get jobDetails => 'Mga detalye';

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
  String get summaryEnhanced => 'Pinaganda';

  @override
  String get summaryMetadataStripped => 'Inalis ang metadata';

  @override
  String summaryMerge(int count) {
    return '$count clip ang pinagsama';
  }

  @override
  String get shareApp => 'I-share ang app';

  @override
  String get shareAppText =>
      'Eluna Media — libre at ganap na offline na converter ng litrato, video at audio. Walang subscription, walang watermark, walang account.';

  @override
  String appVersionLabel(String version) {
    return 'Bersyon $version';
  }

  @override
  String get openFile => 'Buksan';

  @override
  String get openFolder => 'Ipakita ang folder';

  @override
  String get noAppToOpen =>
      'Walang app sa device na ito ang makakabukas ng file na iyon.';

  @override
  String get openFailed => 'Hindi nabuksan ang file.';

  @override
  String get twoPassLabel => 'Two-pass para sa eksaktong laki';

  @override
  String get twoPassHint =>
      'Ang mga iakma-sa-laki na job ay ini-encode nang dalawang beses at kapansin-pansing mas tumpak na tinatamaan ang budget na byte — sa halos doble ang oras at baterya.';

  @override
  String get whatsNewTitle => 'Ano ang bago';

  @override
  String get whatsNew1 =>
      'Puwede nang AV1 ang video: kapansin-pansing mas maliliit na file, kung kaya mong maghintay.';

  @override
  String get whatsNew2 =>
      'Bago para sa mga larawan: AVIF, humigit-kumulang kalahati ng JPEG, at animated na WebP sa halip na GIF.';

  @override
  String get whatsNew3 =>
      'Puwedeng lossless ang M4A — katabi na ngayon ng AAC ang ALAC.';

  @override
  String get whatsNew4 =>
      'Isang screen para sa hitsura: liwanag, accent na kulay, purong itim na OLED at Material You.';

  @override
  String get whatsNew5 =>
      'May medalya, tatlong tab, at progresong maibabahagi bilang larawan ang Mga Nagawa.';

  @override
  String get achievementsTitle => 'Mga Nagawa';

  @override
  String achievementsProgress(int done, int total) {
    return '$done sa $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Binibilang sa device na ito lamang. Walang ina-upload kahit saan.';

  @override
  String get achFirstConversionTitle => 'Unang hakbang';

  @override
  String get achFirstConversionBody => 'I-convert ang unang file mo.';

  @override
  String get achTenConversionsTitle => 'Nakapag-init';

  @override
  String get achTenConversionsBody => 'Mag-convert ng 10 file.';

  @override
  String get achFiftyConversionsTitle => 'Suki';

  @override
  String get achFiftyConversionsBody => 'Mag-convert ng 50 file.';

  @override
  String get achTwoHundredConversionsTitle => 'Masipag';

  @override
  String get achTwoHundredConversionsBody => 'Mag-convert ng 200 file.';

  @override
  String get achThousandConversionsTitle => 'Conveyor';

  @override
  String get achThousandConversionsBody => 'Mag-convert ng 1000 file.';

  @override
  String get achSaved100MbTitle => 'Tagatipid ng espasyo';

  @override
  String get achSaved100MbBody => 'Magbakante ng 100 MB sa kabuuan.';

  @override
  String get achSaved1GbTitle => 'Mangangaso ng gigabyte';

  @override
  String get achSaved1GbBody => 'Magbakante ng 1 GB sa kabuuan.';

  @override
  String get achSaved10GbTitle => 'Bayani ng storage';

  @override
  String get achSaved10GbBody => 'Magbakante ng 10 GB sa kabuuan.';

  @override
  String get achBatchOfFiveTitle => 'Manggagawa ng batch';

  @override
  String get achBatchOfFiveBody => 'Tapusin ang batch na 5 file o higit pa.';

  @override
  String get achBatchOfTwentyTitle => 'Linya ng produksyon';

  @override
  String get achBatchOfTwentyBody => 'Tapusin ang batch na 20 file o higit pa.';

  @override
  String get achSniperTitle => 'Sniper';

  @override
  String get achSniperBody =>
      'Tamaan ang eksaktong laki gamit ang iakma-sa-laki.';

  @override
  String get achMemeSmithTitle => 'Panday ng meme';

  @override
  String get achMemeSmithBody => 'Gawing GIF ang isang video.';

  @override
  String get achSoundHunterTitle => 'Mangangaso ng tunog';

  @override
  String get achSoundHunterBody => 'Kunin ang audio mula sa isang video.';

  @override
  String get achSubtitleKeeperTitle => 'Tagapag-ingat ng subtitle';

  @override
  String get achSubtitleKeeperBody =>
      'Mag-convert ng video nang napapanatili ang subtitle nito.';

  @override
  String get achDirectorTitle => 'Direktor';

  @override
  String get achDirectorBody =>
      'Maglapat ng transform — iikot, i-crop, bilis o lakas ng tunog.';

  @override
  String get achAllRounderTitle => 'Sanay sa lahat';

  @override
  String get achAllRounderBody => 'Mag-convert ng video, audio at larawan.';

  @override
  String get achNightOwlTitle => 'Kuwago';

  @override
  String get achNightOwlBody =>
      'Tapusin ang isang conversion sa pagitan ng hatinggabi at alas-singko ng umaga.';

  @override
  String get achPlatinumTitle => 'Platinum';

  @override
  String get achPlatinumBody => 'Kamtin ang lahat ng iba pang nagawa.';

  @override
  String get storageTitle => 'Storage';

  @override
  String get storageBody =>
      'Nananatili sa loob ng app ang mga na-convert na file hanggang i-save o i-share mo ang mga ito, kung saan hindi ito maaabot ng anumang file manager.';

  @override
  String get storageEmpty => 'Walang nakaimbak';

  @override
  String storageUsage(String size) {
    return 'Nakaimbak: $size';
  }

  @override
  String get storageClearTitle => 'I-clear ang mga nakaimbak na file?';

  @override
  String get storageClearBody =>
      'Buburahin ang bawat tapos nang resulta na hawak pa ng app. Hindi gagalawin ang mga file na na-save o na-share mo na.';

  @override
  String get storageClearAction => 'I-clear';

  @override
  String storageCleared(String size) {
    return 'Nabakante ang $size';
  }

  @override
  String get autoSaveLabel => 'Awtomatikong i-save ang mga resulta';

  @override
  String get autoSaveHint =>
      'Inilalagay sa gallery ang bawat natapos na file — ang audio sa Downloads — sa oras na handa na ito.';

  @override
  String get lowSpaceTitle => 'Kaunti na lang ang puwang';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Kailangan ng batch na ito ng humigit-kumulang $needed at $free na lang ang bakante. Baka huminto sa kalagitnaan ang conversion.';
  }

  @override
  String saveAll(int count) {
    return 'I-save lahat ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Na-save: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Na-save ang $saved sa $total';
  }

  @override
  String get presetFitPhotoTitle => 'Iakma ang litrato sa laki';

  @override
  String get presetFitPhotoBody =>
      'Ipiga ang larawan pababa sa eksaktong limitasyon — mga upload form, aplikasyon.';

  @override
  String get photoFitHint =>
      'Sumusubok ang app ng iba\'t ibang kalidad hanggang may kasya. Kung masyadong maliit ang budget para sa larawan, binabawasan din nito ang sukat ng frame.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Target na laki sa KB';

  @override
  String get compareAction => 'Ihambing';

  @override
  String get compareBefore => 'Bago';

  @override
  String get compareAfter => 'Pagkatapos';

  @override
  String get compareHint => 'Pindutin nang matagal para makita ang orihinal.';

  @override
  String get trimStart => 'Simula';

  @override
  String get trimEnd => 'Katapusan';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, hanggang $duration';
  }

  @override
  String get imageScaleLabel => 'Sukat';

  @override
  String get audioChannelsLabel => 'Mga channel';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Sample rate';

  @override
  String get voiceAudioHint =>
      'Ang mono sa 22.05 kHz ay nagpapaliit ng recording ng boses sa halos ikaapat na bahagi nang walang naririnig na pagkawala. Para sa musika, iwang orihinal ang dalawa.';

  @override
  String get moveUp => 'Iakyat';

  @override
  String get moveDown => 'Ibaba';

  @override
  String get renameOutput => 'Palitan ang pangalan ng resulta';

  @override
  String get renameOutputHint => 'Bagong pangalan';

  @override
  String get renameOutputHelp =>
      'Nagmumula sa output format ang extension. Iwang blangko para ipangalan ang resulta sa pinagmulan.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Burahin ang mga orihinal ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'Burahin ang mga orihinal pagkatapos mag-convert';

  @override
  String get deleteOriginalsHint =>
      'Hinihiling sa system na alisin ang mga pinagmulang file kapag na-save na ang resulta. Palaging ipinapakita ng system kung ano ang mawawala at hinihintay ang kumpirmasyon mo.';

  @override
  String originalsDeleted(String size) {
    return 'Binura ang mga orihinal — nabakante ang $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Walang nabura. Ang mahahanap lang ay ang mga file na hawak pa ng gallery sa ilalim ng orihinal nilang pangalan.';

  @override
  String reclaimedTotal(String size) {
    return 'Nabakante gamit ang app na ito: $size';
  }

  @override
  String get deleteAllData => 'Burahin ang lahat ng data';

  @override
  String get deleteAllDataHint =>
      'Binubura ang lahat ng itinatago ng app sa device na ito: ang pila, mga na-convert na file, mga preview, mga nagawa at mga setting. Hindi gagalawin ang mga file na na-save mo na sa gallery.';

  @override
  String get codecCopy => 'Kopyahin';

  @override
  String get codecCopyRemux => 'Kopyahin (remux)';

  @override
  String get codecNoVideo => 'Walang video';

  @override
  String get codecNoAudio => 'Walang audio';

  @override
  String codecLossless(String codec) {
    return '$codec (lossless)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animated)';
  }

  @override
  String get sizeTargetEmail => 'Email';

  @override
  String get trimTimeHint => 'm:ss';
}
