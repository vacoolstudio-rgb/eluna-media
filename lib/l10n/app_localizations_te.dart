// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class L10nTe extends L10n {
  L10nTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'మార్చు';

  @override
  String get tabQueue => 'క్యూ';

  @override
  String get addFiles => 'ఫైళ్లను జోడించు';

  @override
  String get emptySelectionTitle => 'ఇంకా ఫైళ్లు లేవు';

  @override
  String get emptySelectionBody =>
      'ఫోటోలు, వీడియోలు లేదా ఆడియోను జోడించండి. అంతా ఈ పరికరంలోనే ప్రాసెస్ అవుతుంది.';

  @override
  String get sectionOutput => 'అవుట్‌పుట్';

  @override
  String get sectionVideo => 'వీడియో';

  @override
  String get sectionAudio => 'ఆడియో';

  @override
  String get sectionImage => 'చిత్రం';

  @override
  String get sectionPrivacy => 'గోప్యత';

  @override
  String get outputFormat => 'ఫార్మాట్';

  @override
  String get videoCodec => 'వీడియో కోడెక్';

  @override
  String get audioCodec => 'ఆడియో కోడెక్';

  @override
  String get rateControl => 'రేటు నియంత్రణ';

  @override
  String get rateControlQuality => 'స్థిర నాణ్యత (CRF)';

  @override
  String get rateControlBitrate => 'లక్ష్య బిట్‌రేటు';

  @override
  String crfLabel(int value) {
    return 'నాణ్యత (CRF $value)';
  }

  @override
  String get crfHint => 'తక్కువ విలువ అంటే మెరుగైన నాణ్యత, పెద్ద ఫైల్.';

  @override
  String videoBitrate(int value) {
    return 'వీడియో బిట్‌రేటు: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ఆడియో బిట్‌రేటు: $value kbps';
  }

  @override
  String get encodingPreset => 'ఎన్‌కోడర్ ప్రీసెట్';

  @override
  String get encodingPresetHint =>
      'నెమ్మదైన ప్రీసెట్‌లు బాగా కుదిస్తాయి, కానీ పరికరాన్ని ఎక్కువగా వేడి చేస్తాయి.';

  @override
  String get presetOriginal => 'అసలైనది';

  @override
  String get resolution => 'రిజల్యూషన్';

  @override
  String get frameRate => 'ఫ్రేమ్ రేటు';

  @override
  String imageQuality(int value) {
    return 'నాణ్యత: $value';
  }

  @override
  String get lossless => 'నష్టరహితం';

  @override
  String get losslessHint =>
      'పెద్ద ఫైళ్లు, పిక్సెల్ స్థాయిలో ఖచ్చితమైన అవుట్‌పుట్.';

  @override
  String get sectionEnhance => 'మెరుగుదల';

  @override
  String get sharpenLabel => 'పదును';

  @override
  String get sharpenHint =>
      'అంచులను స్పష్టంగా చేస్తుంది. మసకబారిన లేదా ఫోకస్ తప్పిన ఫోటోను తిరిగి తేలేదు — ఆ వివరం ఫైల్‌లోనే లేదు.';

  @override
  String get sharpenStrongHint =>
      'ఎక్కువ పదును అంచుల వెంట ప్రకాశవంతమైన వలయాలను మిగల్చవచ్చు. ముందుగా మధ్యస్థాన్ని ప్రయత్నించండి.';

  @override
  String get denoiseLabel => 'శబ్దం తగ్గింపు';

  @override
  String get denoiseHint =>
      'చీకటి, రాత్రి ఫోటోల్లోని గరుకుదనాన్ని శుభ్రం చేస్తుంది. మోతాదు మించితే సూక్ష్మ వివరాలు కూడా చెరిగిపోతాయి.';

  @override
  String get autoColorLabel => 'ఆటో రంగు, స్థాయిలు';

  @override
  String get autoColorHint =>
      'కాంట్రాస్ట్‌ను విస్తరించి, వెలిసిన రంగులను కొంచెం పైకి తెస్తుంది.';

  @override
  String get upscaleLabel => '2× పెంచు';

  @override
  String get upscaleHint =>
      'వెడల్పు, ఎత్తులను రెట్టింపు చేస్తుంది. ఇది కొత్త వివరాలను జోడించదు — ప్రింట్ చేసేటప్పుడు లేదా క్రాప్ చేసేటప్పుడు ఉపయోగపడుతుంది.';

  @override
  String get upscaleConflictHint =>
      'పెంచాలంటే రిజల్యూషన్‌ను తిరిగి అసలైనదానికి మార్చండి.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'వద్దు';

  @override
  String get enhanceLight => 'తేలికపాటి';

  @override
  String get enhanceMedium => 'మధ్యస్థం';

  @override
  String get enhanceStrong => 'బలమైనది';

  @override
  String get stripMetadata => 'మెటాడేటాను తొలగించు';

  @override
  String get stripMetadataHint =>
      'అవుట్‌పుట్ నుండి EXIF, GPS, టైమ్‌స్టాంప్‌లను తీసివేస్తుంది.';

  @override
  String startConversion(int count) {
    return 'ఫైళ్లను మార్చు ($count)';
  }

  @override
  String get batchResumed => 'ఆగిపోయిన మార్పిడి తిరిగి కొనసాగింది.';

  @override
  String get converting => 'మారుస్తోంది…';

  @override
  String get cancelBatch => 'ఆపు';

  @override
  String get cancelJob => 'రద్దు చేయి';

  @override
  String get clearFinished => 'పూర్తయినవి తీసివేయి';

  @override
  String get removeJob => 'తీసివేయి';

  @override
  String get shareFile => 'షేర్ చేయి';

  @override
  String get retryJob => 'మళ్లీ ప్రయత్నించు';

  @override
  String get queueEmptyTitle => 'క్యూ ఖాళీగా ఉంది';

  @override
  String get queueEmptyBody =>
      'మార్చు ట్యాబ్‌లో మీరు జోడించిన ఫైళ్లు ఇక్కడ కనిపిస్తాయి.';

  @override
  String queueActiveTab(int count) {
    return 'సక్రియం · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'పూర్తయినవి · $count';
  }

  @override
  String get queueNoActiveTitle => 'ఏదీ జరగడం లేదు';

  @override
  String get queueNoActiveBody =>
      'వేచి ఉన్న లేదా మారుతున్న ఫైళ్లు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get queueNoFinishedTitle => 'ఇంకా ఏదీ పూర్తి కాలేదు';

  @override
  String get queueNoFinishedBody =>
      'మార్చిన ఫైళ్లు ఇక్కడ చేరతాయి — తెరవడానికి, సేవ్ చేయడానికి, షేర్ చేయడానికి సిద్ధంగా.';

  @override
  String get statusQueued => 'క్యూలో';

  @override
  String get statusRunning => 'మారుస్తోంది';

  @override
  String get statusCompleted => 'పూర్తయింది';

  @override
  String get statusFailed => 'విఫలమైంది';

  @override
  String get statusCancelled => 'రద్దయింది';

  @override
  String batchSummary(int done, int total) {
    return '$totalలో $done పూర్తయ్యాయి';
  }

  @override
  String batchCompleted(int done) {
    return 'మార్చిన ఫైళ్లు: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done మార్చబడ్డాయి, $failed విఫలమయ్యాయి.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% చిన్నది';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% పెద్దది';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'రూపం';

  @override
  String get themeSystem => 'సిస్టమ్';

  @override
  String get language => 'భాష';

  @override
  String get languageSystem => 'సిస్టమ్';

  @override
  String get privacyTitle => 'గోప్యత';

  @override
  String get privacyBody =>
      'Eluna Media మీ ఫైళ్లను, తనలోనే ఉన్న FFmpeg కాపీతో, పూర్తిగా ఈ పరికరంలోనే మారుస్తుంది. మీ ఫైళ్లు పరికరాన్ని విడిచి వెళ్లవు, ఖాతా అవసరం లేదు, టెలిమెట్రీ లేదు. యాప్‌లో ఏదీ నెట్‌వర్క్‌ను అసలు ఉపయోగించదు — దానికి ఇంటర్నెట్ అనుమతి కూడా లేదు.\n\nమెటాడేటా తొలగింపు డిఫాల్ట్‌గా ఆన్‌లో ఉంటుంది, కాబట్టి మీరు ఎగుమతి చేసే ఫైళ్ల నుండి EXIF, GPS కోఆర్డినేట్‌లు, టైమ్‌స్టాంప్‌లు తీసివేయబడతాయి.';

  @override
  String get licenseTitle => 'లైసెన్సింగ్';

  @override
  String get licenseBody =>
      'ఈ యాప్ x264, x265 తదితర GPL భాగాలతో నిర్మించిన FFmpegను కలిగి ఉంది, కాబట్టి యాప్ మొత్తం GNU GPL v3 కింద పంపిణీ చేయబడుతుంది.';

  @override
  String get sourceMissing => 'మూల ఫైల్ ఇప్పుడు అందుబాటులో లేదు.';

  @override
  String get tabSettings => 'సెట్టింగ్‌లు';

  @override
  String get introTitle => 'రూపకల్పనలోనే గోప్యత';

  @override
  String get introOfflineTitle => 'ఈ పరికరంలోనే మారుస్తుంది';

  @override
  String get introOfflineBody =>
      'లోపలే ఉన్న FFmpeg కాపీ మొత్తం పని చేస్తుంది. మీ ఫైళ్లు ఫోన్‌ను విడిచి వెళ్లవు — ఎయిర్‌ప్లేన్ మోడ్‌లోనూ మార్పిడి పనిచేస్తుంది.';

  @override
  String get introTelemetryTitle => 'టెలిమెట్రీ శూన్యం';

  @override
  String get introTelemetryBody =>
      'ఖాతా లేదు, అనలిటిక్స్ లేవు, క్రాష్ రిపోర్టింగ్ లేదు. మీరు ఎవరో యాప్‌కు తెలియదు.';

  @override
  String get introMetadataTitle => 'మెటాడేటా మీ అదుపులో';

  @override
  String get introMetadataBody =>
      'ప్రతి అవుట్‌పుట్ నుండి EXIF, GPS, టైమ్‌స్టాంప్‌లు డిఫాల్ట్‌గా తీసివేయబడతాయి. కావాలంటే దీన్ని ఆఫ్ చేయవచ్చు.';

  @override
  String get introFreeNote =>
      'ఉచితం — ప్రకటనలు లేవు, సబ్‌స్క్రిప్షన్‌లు లేవు. బ్యాచ్ మార్పిడితో సహా ప్రతి ఫీచర్ మొదటి నుంచీ మీదే — కొనగలిగేది ఒక్క టిప్ మాత్రమే, అది దేన్నీ అన్‌లాక్ చేయదు.';

  @override
  String get introContinue => 'ప్రారంభించు';

  @override
  String get modeSimple => 'సాధారణం';

  @override
  String get modeAdvanced => 'అధునాతనం';

  @override
  String get modeAdvancedHint =>
      'ప్రీసెట్ కార్డుల బదులు ప్రతి కోడెక్, బిట్‌రేటు, రూపమార్పు నియంత్రణను చూపుతుంది.';

  @override
  String get presetCompressVideoTitle => 'వీడియోను కుదించు';

  @override
  String get presetCompressVideoBody => 'చాలా చిన్న MP4, నాణ్యత బాగానే ఉంటుంది';

  @override
  String get presetFitToSizeTitle => 'పరిమాణానికి సరిపెట్టు';

  @override
  String get presetFitToSizeBody =>
      'ఖచ్చితమైన పరిమితిని చేరుకో — Discord, ఇమెయిల్, చాట్‌లు';

  @override
  String get presetCompatibleMp4Title => 'అనుకూల MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. ఎక్కడైనా ప్లే అవుతుంది';

  @override
  String get presetExtractAudioTitle => 'ఆడియోను వేరు చేయి';

  @override
  String get presetExtractAudioBody => 'ఏ వీడియో నుంచైనా MP3';

  @override
  String get presetVideoToGifTitle => 'వీడియో నుంచి GIF';

  @override
  String get presetVideoToGifBody => 'చిన్న క్లిప్‌ను యానిమేటెడ్ GIFగా';

  @override
  String get presetMergeTitle => 'వీడియోలను కలుపు';

  @override
  String get presetMergeBody => 'క్లిప్‌లను వరుసగా ఒకే MP4గా కలుపుతుంది';

  @override
  String get mergeNeedsTwo => 'కలపడానికి కనీసం రెండు వీడియోలను ఎంచుకోండి.';

  @override
  String mergedVideoName(int count) {
    return 'కలిపిన వీడియో ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ఫోటోను కుదించు';

  @override
  String get presetCompressImageBody => 'చిన్న JPEG, కంటికి కనిపించని నష్టం';

  @override
  String get presetEnhancePhotoTitle => 'ఫోటోను మెరుగుపరచు';

  @override
  String get presetEnhancePhotoBody => 'శుభ్రంగా, స్పష్టంగా, మెరుగైన రంగుతో';

  @override
  String get presetImageToWebpTitle => 'ఫోటో నుంచి WebP';

  @override
  String get presetImageToWebpBody => 'ఆధునిక ఫార్మాట్, JPEG కంటే చిన్నది';

  @override
  String get sizeTargetTitle => 'లక్ష్య పరిమాణం';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'అనుకూలం…';

  @override
  String get sizeTargetDialogTitle => 'లక్ష్య పరిమాణం MBలో';

  @override
  String get sizeTargetTooSmall =>
      'ఈ నిడివికి లక్ష్యం చాలా చిన్నది; సాధ్యమైనంత దగ్గరి నాణ్యత ఉపయోగించబడుతుంది.';

  @override
  String estimatePerFile(String size) {
    return 'ఒక్కో ఫైల్‌కు ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'అంచనా అవుట్‌పుట్: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'ఎంచుకున్న ఫైళ్లు: $count';
  }

  @override
  String get promiseOffline => '100% ఆఫ్‌లైన్ మార్పిడి';

  @override
  String get promiseBatchFree => 'బ్యాచ్ మార్పిడి ఉచితం';

  @override
  String get promiseNoWatermark => 'వాటర్‌మార్క్ లేదు';

  @override
  String get sectionTransform => 'రూపమార్పు';

  @override
  String get rotateLabel => 'తిప్పు';

  @override
  String get flipLabel => 'అడ్డంగా అద్దం చేయి';

  @override
  String get speedLabel => 'వేగం';

  @override
  String get cropLabel => 'క్రాప్';

  @override
  String get cropHint =>
      'ఎంచుకున్న నిష్పత్తికి మధ్య నుంచి క్రాప్ చేస్తుంది — ఫీడ్‌లకు చతురస్రం, స్టోరీలకు 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'వాల్యూమ్: $percent%';
  }

  @override
  String get addAudioFiles => 'ఆడియో, ఇతర ఫైళ్లు';

  @override
  String get hwEncoderLabel => 'హార్డ్‌వేర్ ఎన్‌కోడింగ్';

  @override
  String get hwEncoderHint =>
      'బిట్‌రేటు, పరిమాణానికి-సరిపెట్టు మోడ్‌లలో పరికరంలోని వీడియో చిప్‌ను వాడుతుంది — చాలా వేగంగా, తక్కువ వేడితో. నాణ్యత (CRF) మోడ్ ఎప్పుడూ కచ్చితమైన సాఫ్ట్‌వేర్ ఎన్‌కోడర్‌నే వాడుతుంది, హార్డ్‌వేర్ పని విఫలమైతే సాఫ్ట్‌వేర్‌పై దానంతట అదే మళ్లీ ప్రయత్నిస్తుంది.';

  @override
  String get transformNeedsReencode =>
      'తిప్పడం, అద్దం, వేగం — వీటికి తిరిగి ఎన్‌కోడ్ చేయడం అవసరం, కాబట్టి స్ట్రీమ్ కాపీ సమయంలో అవి ఆఫ్‌లో ఉంటాయి.';

  @override
  String get capBitrateLabel => 'ఫైల్‌ను ఎప్పుడూ పెద్దది చేయవద్దు';

  @override
  String get capBitrateHint =>
      'మూల ఫైల్ సొంత బిట్‌రేటు వద్దే ఎన్‌కోడ్‌ను పరిమితం చేస్తుంది. స్థిర నాణ్యతకు సొంతంగా గరిష్ఠ పరిమితి లేదు, కాబట్టి ఇప్పటికే కుదించిన వీడియో లేకపోతే పెద్దదిగా బయటికి రావచ్చు.';

  @override
  String get keepSubtitles => 'ఉపశీర్షికలను ఉంచు';

  @override
  String get keepSubtitlesHint =>
      'ఉపశీర్షిక ట్రాక్‌లను అవుట్‌పుట్‌లోకి తీసుకెళ్తుంది. టెక్స్ట్ ఉపశీర్షికలు మాత్రమే.';

  @override
  String get sectionTrim => 'కత్తిరింపు';

  @override
  String get trimEnable => 'మూలాన్ని కత్తిరించు';

  @override
  String get trimHint =>
      'నిడివి తెలిసిన ఒకే ఒక ఫైల్ క్యూలో ఉన్నప్పుడు అందుబాటులో ఉంటుంది.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'లక్ష్య పరిమాణం';

  @override
  String get lowBatteryTitle => 'బ్యాటరీ తక్కువగా ఉంది';

  @override
  String get lowBatteryBody =>
      'మార్పిడి ప్రాసెసర్‌ను గట్టిగా పనిచేయిస్తుంది. ముందుగా ఛార్జర్ పెట్టుకోవచ్చు, లేదా ఇలాగే కొనసాగించవచ్చు.';

  @override
  String get lowBatteryContinue => 'అయినా మార్చు';

  @override
  String get commonCancel => 'రద్దు చేయి';

  @override
  String get commonOk => 'సరే';

  @override
  String filesReceived(int count) {
    return 'అందిన ఫైళ్లు: $count';
  }

  @override
  String get saveFile => 'సేవ్ చేయి';

  @override
  String get savedToGallery =>
      'గ్యాలరీలో, “Eluna Media” ఆల్బమ్‌లో సేవ్ అయింది.';

  @override
  String get savedToDownloads => 'డౌన్‌లోడ్‌లలో సేవ్ అయింది.';

  @override
  String get saveFailed => 'ఫైల్‌ను సేవ్ చేయలేకపోయాం.';

  @override
  String get jobRemovedUndo => 'పని తీసివేయబడింది.';

  @override
  String get finishedClearedUndo => 'పూర్తయిన పనులు తీసివేయబడ్డాయి.';

  @override
  String get undo => 'వెనక్కి';

  @override
  String get errorDetailsTitle => 'లోపం వివరాలు';

  @override
  String get sectionConversionPrefs => 'మార్పిడి';

  @override
  String get powerModeLabel => 'పవర్ మోడ్';

  @override
  String get powerEfficiency => 'చల్లగా, వేగంగా';

  @override
  String get powerBalanced => 'సమతుల్యం';

  @override
  String get powerQuality => 'గరిష్ఠ కుదింపు';

  @override
  String get powerModeHint =>
      'వీడియో ఎన్‌కోడర్ ఎంత గట్టిగా పనిచేస్తుందో నిర్ణయిస్తుంది. చల్లగా, వేగంగా అంటే ఫైళ్లు కొంచెం పెద్దవిగా ఉంటాయి. మిగతా దేనినీ — ఎప్పుడూ — కుదించడం లేదు.';

  @override
  String get hapticsLabel => 'వైబ్రేషన్ ఫీడ్‌బ్యాక్';

  @override
  String get networkPrivacyTitle => 'నెట్‌వర్క్, గోప్యత';

  @override
  String get netAuditIntro =>
      'ఈ యాప్‌లో నెట్‌వర్క్‌ను తాకగలిగే ప్రతిదాని పూర్తి జాబితా.';

  @override
  String get netAuditNoneTitle => 'నెట్‌వర్క్ యాక్సెస్ అసలే లేదు';

  @override
  String get netAuditNoneBody =>
      'యాప్ ఇంటర్నెట్ అనుమతిని అడగదు, కాబట్టి ప్రయత్నించినా నెట్‌వర్క్‌ను చేరుకోలేదు — దీన్ని సిస్టమ్ యాప్ సమాచారంలో మీరే నిర్ధారించుకోవచ్చు. ప్రకటనలు లేవు, అనలిటిక్స్ లేవు, అప్‌డేట్ తనిఖీలు లేవు. “యాప్‌ను రేట్ చేయి” అనేది స్టోర్ యాప్‌కు అప్పగిస్తుంది, అది తన మాట తానే మాట్లాడుకుంటుంది.';

  @override
  String get netAuditConversionTitle => 'మార్పిడి';

  @override
  String get netAuditConversionBody =>
      'లోపలే ఉన్న FFmpeg ద్వారా పూర్తిగా ఈ పరికరంలోనే జరుగుతుంది. ఎయిర్‌ప్లేన్ మోడ్ ఆన్ చేసి మార్చి చూడండి — పనిచేస్తుంది.';

  @override
  String get netAuditTelemetryTitle => 'టెలిమెట్రీ';

  @override
  String get netAuditTelemetryBody =>
      'అలాంటిది ఏదీ లేదు. యాప్ అనలిటిక్స్, క్రాష్ రిపోర్టులు, గుర్తింపు సంకేతాలు ఏవీ సేకరించదు; ఖాతా వ్యవస్థే లేదు.';

  @override
  String get netAuditTipsTitle => 'టిప్‌లు';

  @override
  String get netAuditTipsBody =>
      'టిప్‌ను Play Store యాప్ నిర్వహిస్తుంది, ఈ యాప్ కాదు — దీనికి ఇప్పటికీ ఇంటర్నెట్ అనుమతి లేదు. బిల్లింగ్ మాత్రం అనుమతుల జాబితాకు రెండు పంక్తులు కలుపుతుంది: “యాప్‌లో కొనుగోళ్లు”, మరియు “నెట్‌వర్క్ కనెక్షన్‌లను చూడటం” — ఇది కనెక్షన్ ఉందా లేదా అన్నది మాత్రమే చదువుతుంది, దాన్ని వాడలేదు. ఏదీ దానంతట అదే కొనుగోలు కాదు, టిప్ దేన్నీ అన్‌లాక్ చేయదు: ఇక్కడి ప్రతి ఫీచర్ ఉచితం.';

  @override
  String get sectionSupport => 'మద్దతు';

  @override
  String get rateApp => 'యాప్‌ను రేట్ చేయి';

  @override
  String get openLicenses => 'ఓపెన్ సోర్స్ లైసెన్సులు';

  @override
  String get presetAudioToMp3Title => 'ఆడియోను మార్చు';

  @override
  String get presetAudioToMp3Body => 'MP3గా — దేనిలోనైనా ప్లే అవుతుంది';

  @override
  String get presetCompressAudioTitle => 'ఆడియోను కుదించు';

  @override
  String get presetCompressAudioBody =>
      'తేలికైన AAC — వాయిస్ నోట్‌లు, పాడ్‌కాస్ట్‌లు';

  @override
  String get convertTo => 'దీనిగా మార్చు';

  @override
  String get formatSectionHint =>
      'మీ ఫైళ్లు నిజంగా మారగలిగే ఫార్మాట్‌లు మాత్రమే ఇక్కడ ఇవ్వబడ్డాయి.';

  @override
  String get sourceVideo => 'వీడియో';

  @override
  String get sourceImage => 'ఫోటో';

  @override
  String get sourceAudio => 'ఆడియో';

  @override
  String get sourceUnknown => 'ఫైల్';

  @override
  String get mixedSelectionTitle => 'వేర్వేరు రకాల ఫైళ్లు ఎంపికయ్యాయి';

  @override
  String get mixedSelectionBody =>
      'ప్రతి ఫైల్ దాని సొంత రకానికి సరిపోయే ఉత్తమ ప్రీసెట్‌తో మారుతుంది. పూర్తి నియంత్రణ కోసం ఒకసారి ఒక్కో రకాన్నే జోడించండి.';

  @override
  String get filesTitle => 'ఫైళ్లు';

  @override
  String get removeFile => 'తీసివేయి';

  @override
  String timeLeft(String time) {
    return '≈ $time మిగిలింది';
  }

  @override
  String get jobSettingsTitle => 'మార్పిడి సెట్టింగ్‌లు';

  @override
  String get jobDetails => 'వివరాలు';

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
  String get summaryEnhanced => 'మెరుగుపరచబడింది';

  @override
  String get summaryMetadataStripped => 'మెటాడేటా తొలగించబడింది';

  @override
  String summaryMerge(int count) {
    return 'కలిపిన క్లిప్‌లు: $count';
  }

  @override
  String get shareApp => 'యాప్‌ను షేర్ చేయి';

  @override
  String get shareAppText =>
      'Eluna Media — ఉచిత, పూర్తిగా ఆఫ్‌లైన్ ఫోటో, వీడియో, ఆడియో కన్వర్టర్. సబ్‌స్క్రిప్షన్‌లు లేవు, వాటర్‌మార్క్‌లు లేవు, ఖాతాలు లేవు.';

  @override
  String appVersionLabel(String version) {
    return 'వెర్షన్ $version';
  }

  @override
  String get openFile => 'తెరువు';

  @override
  String get openFolder => 'ఫోల్డర్ చూపు';

  @override
  String get noAppToOpen => 'ఆ ఫైల్‌ను తెరవగల యాప్ ఈ పరికరంలో లేదు.';

  @override
  String get openFailed => 'ఫైల్‌ను తెరవలేకపోయాం.';

  @override
  String get twoPassLabel => 'ఖచ్చితమైన పరిమాణానికి రెండు-పాస్';

  @override
  String get twoPassHint =>
      'పరిమాణానికి-సరిపెట్టు పనులు రెండుసార్లు ఎన్‌కోడ్ చేసి, బైట్ బడ్జెట్‌ను గణనీయంగా మరింత కచ్చితంగా చేరుకుంటాయి — దాదాపు రెట్టింపు సమయం, బ్యాటరీ ఖర్చుతో.';

  @override
  String get whatsNewTitle => 'కొత్తవి ఏమిటి';

  @override
  String get whatsNew1 =>
      'ఇప్పుడు వీడియో AV1 కావచ్చు: గణనీయంగా చిన్న ఫైళ్లు — వేచి ఉండగలిగితే.';

  @override
  String get whatsNew2 =>
      'చిత్రాలకు కొత్తవి: AVIF — దాదాపు JPEGలో సగం — మరియు GIF బదులు యానిమేటెడ్ WebP.';

  @override
  String get whatsNew3 =>
      'M4A నష్టరహితం కావచ్చు — AAC పక్కనే ఇప్పుడు ALAC కూడా ఉంది.';

  @override
  String get whatsNew4 =>
      'రూపం కోసం ఒకే స్క్రీన్: వెలుగు, యాక్సెంట్ రంగు, స్వచ్ఛమైన నలుపు OLED, Material You.';

  @override
  String get whatsNew5 =>
      'సాధనలకు పతకాలు, మూడు ట్యాబ్‌లు, చిత్రంగా షేర్ చేయగల పురోగతి.';

  @override
  String get achievementsTitle => 'సాధనలు';

  @override
  String achievementsProgress(int done, int total) {
    return '$totalలో $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'ఈ పరికరంలో మాత్రమే లెక్కించబడతాయి. ఏదీ ఎక్కడికీ అప్‌లోడ్ కాదు.';

  @override
  String get achFirstConversionTitle => 'మొదటి అడుగులు';

  @override
  String get achFirstConversionBody => 'మీ మొదటి ఫైల్‌ను మార్చండి.';

  @override
  String get achTenConversionsTitle => 'వేడెక్కారు';

  @override
  String get achTenConversionsBody => '10 ఫైళ్లను మార్చండి.';

  @override
  String get achFiftyConversionsTitle => 'నిత్య వినియోగదారు';

  @override
  String get achFiftyConversionsBody => '50 ఫైళ్లను మార్చండి.';

  @override
  String get achTwoHundredConversionsTitle => 'శ్రమజీవి';

  @override
  String get achTwoHundredConversionsBody => '200 ఫైళ్లను మార్చండి.';

  @override
  String get achThousandConversionsTitle => 'కన్వేయర్';

  @override
  String get achThousandConversionsBody => '1000 ఫైళ్లను మార్చండి.';

  @override
  String get achSaved100MbTitle => 'స్థలం ఆదా';

  @override
  String get achSaved100MbBody => 'మొత్తం 100 MB ఖాళీ చేయండి.';

  @override
  String get achSaved1GbTitle => 'గిగాబైట్ వేటగాడు';

  @override
  String get achSaved1GbBody => 'మొత్తం 1 GB ఖాళీ చేయండి.';

  @override
  String get achSaved10GbTitle => 'స్టోరేజ్ హీరో';

  @override
  String get achSaved10GbBody => 'మొత్తం 10 GB ఖాళీ చేయండి.';

  @override
  String get achBatchOfFiveTitle => 'బ్యాచ్ కార్మికుడు';

  @override
  String get achBatchOfFiveBody =>
      '5 లేదా అంతకంటే ఎక్కువ ఫైళ్ల బ్యాచ్‌ను పూర్తి చేయండి.';

  @override
  String get achBatchOfTwentyTitle => 'అసెంబ్లీ లైన్';

  @override
  String get achBatchOfTwentyBody =>
      '20 లేదా అంతకంటే ఎక్కువ ఫైళ్ల బ్యాచ్‌ను పూర్తి చేయండి.';

  @override
  String get achSniperTitle => 'స్నైపర్';

  @override
  String get achSniperBody =>
      'పరిమాణానికి-సరిపెట్టుతో ఖచ్చితమైన పరిమాణాన్ని చేరుకోండి.';

  @override
  String get achMemeSmithTitle => 'మీమ్ కమ్మరి';

  @override
  String get achMemeSmithBody => 'ఒక వీడియోను GIFగా మార్చండి.';

  @override
  String get achSoundHunterTitle => 'శబ్ద వేటగాడు';

  @override
  String get achSoundHunterBody => 'ఒక వీడియో నుంచి ఆడియోను వేరు చేయండి.';

  @override
  String get achSubtitleKeeperTitle => 'ఉపశీర్షికల కాపరి';

  @override
  String get achSubtitleKeeperBody => 'ఉపశీర్షికలను ఉంచి ఒక వీడియోను మార్చండి.';

  @override
  String get achDirectorTitle => 'దర్శకుడు';

  @override
  String get achDirectorBody =>
      'ఒక రూపమార్పును వాడండి — తిప్పడం, క్రాప్, వేగం లేదా వాల్యూమ్.';

  @override
  String get achAllRounderTitle => 'ఆల్‌రౌండర్';

  @override
  String get achAllRounderBody => 'వీడియో, ఆడియో, ఒక చిత్రాన్ని మార్చండి.';

  @override
  String get achNightOwlTitle => 'రాత్రి గుడ్లగూబ';

  @override
  String get achNightOwlBody =>
      'అర్ధరాత్రి నుంచి తెల్లవారుజామున 5 గంటల మధ్య ఒక మార్పిడిని పూర్తి చేయండి.';

  @override
  String get achPlatinumTitle => 'ప్లాటినం';

  @override
  String get achPlatinumBody => 'మిగతా అన్ని సాధనలను సాధించండి.';

  @override
  String get storageTitle => 'నిల్వ';

  @override
  String get storageBody =>
      'మార్చిన ఫైళ్లు మీరు సేవ్ చేసే లేదా షేర్ చేసే వరకు యాప్ లోపలే ఉంటాయి — అక్కడ వాటిని ఏ ఫైల్ మేనేజర్ చేరుకోలేదు.';

  @override
  String get storageEmpty => 'ఏదీ నిల్వ లేదు';

  @override
  String storageUsage(String size) {
    return 'నిల్వ ఉంది: $size';
  }

  @override
  String get storageClearTitle => 'నిల్వ ఉన్న ఫైళ్లను తొలగించాలా?';

  @override
  String get storageClearBody =>
      'యాప్ ఇంకా ఉంచుకున్న ప్రతి పూర్తయిన ఫలితాన్ని తొలగిస్తుంది. మీరు ఇప్పటికే సేవ్ చేసిన లేదా షేర్ చేసిన ఫైళ్లకు ఏమీ కాదు.';

  @override
  String get storageClearAction => 'తొలగించు';

  @override
  String storageCleared(String size) {
    return '$size ఖాళీ అయింది';
  }

  @override
  String get autoSaveLabel => 'ఫలితాలను ఆటోమేటిక్‌గా సేవ్ చేయి';

  @override
  String get autoSaveHint =>
      'పూర్తయిన ప్రతి ఫైల్‌ను సిద్ధమైన వెంటనే గ్యాలరీలో — ఆడియోను డౌన్‌లోడ్‌లలో — ఉంచుతుంది.';

  @override
  String get lowSpaceTitle => 'స్థలం ఎక్కువ మిగల్లేదు';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ఈ బ్యాచ్‌కు సుమారు $needed కావాలి, కానీ $free మాత్రమే ఖాళీగా ఉంది. మార్పిడి మధ్యలోనే ఆగిపోవచ్చు.';
  }

  @override
  String saveAll(int count) {
    return 'అన్నీ సేవ్ చేయి ($count)';
  }

  @override
  String savedAll(int count) {
    return 'సేవ్ అయ్యాయి: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$totalలో $saved సేవ్ అయ్యాయి';
  }

  @override
  String get presetFitPhotoTitle => 'ఫోటోను పరిమాణానికి సరిపెట్టు';

  @override
  String get presetFitPhotoBody =>
      'చిత్రాన్ని ఖచ్చితమైన పరిమితి లోపలికి కుదించు — అప్‌లోడ్ ఫారాలు, దరఖాస్తులు.';

  @override
  String get photoFitHint =>
      'సరిపోయే వరకు యాప్ వేర్వేరు నాణ్యతలను ప్రయత్నిస్తుంది. చిత్రానికి బడ్జెట్ చాలా చిన్నదైతే, ఫ్రేమ్ పరిమాణాన్ని కూడా తగ్గిస్తుంది.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'లక్ష్య పరిమాణం KBలో';

  @override
  String get compareAction => 'పోల్చు';

  @override
  String get compareBefore => 'ముందు';

  @override
  String get compareAfter => 'తర్వాత';

  @override
  String get compareHint => 'అసలైనదాన్ని చూడటానికి నొక్కి పట్టుకోండి.';

  @override
  String get trimStart => 'ప్రారంభం';

  @override
  String get trimEnd => 'ముగింపు';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration వరకు';
  }

  @override
  String get imageScaleLabel => 'స్కేల్';

  @override
  String get audioChannelsLabel => 'ఛానెల్‌లు';

  @override
  String get audioMono => 'మోనో';

  @override
  String get audioStereo => 'స్టీరియో';

  @override
  String get sampleRateLabel => 'శాంపిల్ రేటు';

  @override
  String get voiceAudioHint =>
      '22.05 kHz వద్ద మోనో ఒక వాయిస్ రికార్డింగ్‌ను, వినిపించే నష్టం లేకుండా, దాదాపు నాలుగో వంతుకు కుదిస్తుంది. సంగీతానికి రెండింటినీ అసలైనవిగానే ఉంచండి.';

  @override
  String get moveUp => 'పైకి జరుపు';

  @override
  String get moveDown => 'కిందికి జరుపు';

  @override
  String get renameOutput => 'ఫలితం పేరు మార్చు';

  @override
  String get renameOutputHint => 'కొత్త పేరు';

  @override
  String get renameOutputHelp =>
      'పొడిగింపు అవుట్‌పుట్ ఫార్మాట్ నుంచి వస్తుంది. ఫలితానికి మూల ఫైల్ పేరే ఉంచాలంటే దీన్ని ఖాళీగా వదిలేయండి.';

  @override
  String deleteOriginalsAction(int count) {
    return 'అసలైనవి తొలగించు ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'మార్చిన తర్వాత అసలైనవి తొలగించు';

  @override
  String get deleteOriginalsHint =>
      'ఫలితం సేవ్ అయ్యాక మూల ఫైళ్లను తీసివేయమని సిస్టమ్‌ను అడుగుతుంది. ఏవి పోతాయో సిస్టమ్ ఎప్పుడూ చూపి, మీ నిర్ధారణ కోసం వేచి ఉంటుంది.';

  @override
  String get mediaAccessRequired =>
      'అసలు ఫైళ్లను తొలగించడానికి మీడియా లైబ్రరీకి యాక్సెస్ అవసరం.';

  @override
  String originalsDeleted(String size) {
    return 'అసలైనవి తొలగించబడ్డాయి — $size ఖాళీ అయింది';
  }

  @override
  String get originalsNoneDeleted =>
      'ఏదీ తొలగించలేదు. గ్యాలరీ ఇంకా అసలు పేరుతోనే ఉంచుకున్న ఫైళ్లను మాత్రమే కనుగొనగలం.';

  @override
  String reclaimedTotal(String size) {
    return 'ఈ యాప్‌తో ఖాళీ చేసినది: $size';
  }

  @override
  String get deleteAllData => 'మొత్తం డేటాను తొలగించు';

  @override
  String get deleteAllDataHint =>
      'ఈ పరికరంలో యాప్ ఉంచుకున్న అంతటినీ తుడిచివేస్తుంది: క్యూ, మార్చిన ఫైళ్లు, ప్రివ్యూలు, సాధనలు, సెట్టింగ్‌లు. మీరు ఇప్పటికే గ్యాలరీకి సేవ్ చేసిన ఫైళ్లను తాకదు.';

  @override
  String get codecCopy => 'కాపీ';

  @override
  String get codecCopyRemux => 'కాపీ (remux)';

  @override
  String get codecNoVideo => 'వీడియో లేదు';

  @override
  String get codecNoAudio => 'ఆడియో లేదు';

  @override
  String codecLossless(String codec) {
    return '$codec (నష్టరహితం)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (యానిమేటెడ్)';
  }

  @override
  String get sizeTargetEmail => 'ఇమెయిల్';

  @override
  String get trimTimeHint => 'm:ss';
}
