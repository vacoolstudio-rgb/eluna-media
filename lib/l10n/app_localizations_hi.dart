// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class L10nHi extends L10n {
  L10nHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'कन्वर्ट';

  @override
  String get tabQueue => 'कतार';

  @override
  String get addFiles => 'फ़ाइलें जोड़ें';

  @override
  String get emptySelectionTitle => 'अभी कोई फ़ाइल नहीं';

  @override
  String get emptySelectionBody =>
      'फ़ोटो, वीडियो या ऑडियो जोड़ें। सब कुछ इसी डिवाइस पर प्रोसेस होता है।';

  @override
  String get sectionOutput => 'आउटपुट';

  @override
  String get sectionVideo => 'वीडियो';

  @override
  String get sectionAudio => 'ऑडियो';

  @override
  String get sectionImage => 'इमेज';

  @override
  String get sectionPrivacy => 'प्राइवेसी';

  @override
  String get outputFormat => 'फ़ॉर्मैट';

  @override
  String get videoCodec => 'वीडियो कोडेक';

  @override
  String get audioCodec => 'ऑडियो कोडेक';

  @override
  String get rateControl => 'रेट कंट्रोल';

  @override
  String get rateControlQuality => 'स्थिर क्वालिटी (CRF)';

  @override
  String get rateControlBitrate => 'टारगेट बिटरेट';

  @override
  String crfLabel(int value) {
    return 'क्वालिटी (CRF $value)';
  }

  @override
  String get crfHint => 'कम वैल्यू यानी बेहतर क्वालिटी और बड़ी फ़ाइल।';

  @override
  String videoBitrate(int value) {
    return 'वीडियो बिटरेट: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ऑडियो बिटरेट: $value kbps';
  }

  @override
  String get encodingPreset => 'एन्कोडर प्रीसेट';

  @override
  String get encodingPresetHint =>
      'धीमे प्रीसेट बेहतर कंप्रेस करते हैं, पर डिवाइस ज़्यादा गर्म होता है।';

  @override
  String get presetOriginal => 'मूल';

  @override
  String get resolution => 'रिज़ॉल्यूशन';

  @override
  String get frameRate => 'फ़्रेम रेट';

  @override
  String imageQuality(int value) {
    return 'क्वालिटी: $value';
  }

  @override
  String get lossless => 'लॉसलेस';

  @override
  String get losslessHint => 'फ़ाइलें बड़ी, पर पिक्सेल-परफ़ेक्ट आउटपुट।';

  @override
  String get sectionEnhance => 'एन्हांसमेंट';

  @override
  String get sharpenLabel => 'शार्पनेस';

  @override
  String get sharpenHint =>
      'किनारों को साफ़ और तीखा बनाता है। धुँधली या आउट-ऑफ़-फ़ोकस तस्वीर नहीं बचा सकता — वह डिटेल फ़ाइल में है ही नहीं।';

  @override
  String get sharpenStrongHint =>
      'ज़्यादा शार्पनिंग से किनारों पर चमकीले हेलो बन सकते हैं। पहले मध्यम आज़माएँ।';

  @override
  String get denoiseLabel => 'नॉइज़ रिडक्शन';

  @override
  String get denoiseHint =>
      'अँधेरी और रात की तस्वीरों का ग्रेन साफ़ करता है। ज़्यादा होने पर बारीक डिटेल भी मिट जाती है।';

  @override
  String get autoColorLabel => 'ऑटो कलर और लेवल';

  @override
  String get autoColorHint =>
      'कॉन्ट्रास्ट बढ़ाता है और फीके रंगों में थोड़ी जान डालता है।';

  @override
  String get upscaleLabel => '2× बड़ा करें';

  @override
  String get upscaleHint =>
      'चौड़ाई और ऊँचाई दोगुनी कर देता है। डिटेल नहीं जोड़ता — प्रिंट या क्रॉप करते समय काम आता है।';

  @override
  String get upscaleConflictHint =>
      'बड़ा करने के लिए रिज़ॉल्यूशन को वापस मूल पर सेट करें।';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'बंद';

  @override
  String get enhanceLight => 'हल्का';

  @override
  String get enhanceMedium => 'मध्यम';

  @override
  String get enhanceStrong => 'ज़्यादा';

  @override
  String get stripMetadata => 'मेटाडेटा हटाएँ';

  @override
  String get stripMetadataHint =>
      'आउटपुट से EXIF, GPS और टाइमस्टैम्प हटा देता है।';

  @override
  String startConversion(int count) {
    return 'फ़ाइलें कन्वर्ट करें ($count)';
  }

  @override
  String get batchResumed => 'अधूरा कन्वर्ज़न फिर से शुरू किया गया।';

  @override
  String get converting => 'कन्वर्ट हो रहा है…';

  @override
  String get cancelBatch => 'रोकें';

  @override
  String get cancelJob => 'रद्द करें';

  @override
  String get clearFinished => 'पूर्ण हुए हटाएँ';

  @override
  String get removeJob => 'हटाएँ';

  @override
  String get shareFile => 'शेयर करें';

  @override
  String get retryJob => 'फिर कोशिश करें';

  @override
  String get queueEmptyTitle => 'कतार खाली है';

  @override
  String get queueEmptyBody => 'कन्वर्ट टैब पर जोड़ी गई फ़ाइलें यहाँ दिखेंगी।';

  @override
  String queueActiveTab(int count) {
    return 'सक्रिय · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'पूर्ण · $count';
  }

  @override
  String get queueNoActiveTitle => 'अभी कुछ चल नहीं रहा';

  @override
  String get queueNoActiveBody =>
      'कतार में लगी या कन्वर्ट हो रही फ़ाइलें यहाँ दिखेंगी।';

  @override
  String get queueNoFinishedTitle => 'अभी तक कुछ पूरा नहीं हुआ';

  @override
  String get queueNoFinishedBody =>
      'कन्वर्ट हुई फ़ाइलें यहाँ आती हैं — खोलने, सेव करने या शेयर करने के लिए तैयार।';

  @override
  String get statusQueued => 'कतार में';

  @override
  String get statusRunning => 'कन्वर्ट हो रहा है';

  @override
  String get statusCompleted => 'पूर्ण';

  @override
  String get statusFailed => 'विफल';

  @override
  String get statusCancelled => 'रद्द';

  @override
  String batchSummary(int done, int total) {
    return '$total में से $done पूर्ण';
  }

  @override
  String batchCompleted(int done) {
    return 'कन्वर्ट हुई फ़ाइलें: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done कन्वर्ट हुईं, $failed विफल।';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% छोटी';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% बड़ी';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'दिखावट';

  @override
  String get themeSystem => 'सिस्टम जैसा';

  @override
  String get language => 'भाषा';

  @override
  String get languageSystem => 'सिस्टम';

  @override
  String get privacyTitle => 'प्राइवेसी';

  @override
  String get privacyBody =>
      'Eluna Media आपकी फ़ाइलें पूरी तरह इसी डिवाइस पर, FFmpeg की बंडल्ड कॉपी से कन्वर्ट करता है। फ़ाइलें कभी डिवाइस से बाहर नहीं जातीं, अकाउंट की ज़रूरत नहीं और कोई टेलीमेट्री नहीं। ऐप में कुछ भी नेटवर्क इस्तेमाल नहीं करता — इसके पास इंटरनेट की अनुमति तक नहीं है।\n\nमेटाडेटा हटाना डिफ़ॉल्ट रूप से चालू है, इसलिए एक्सपोर्ट की गई फ़ाइलों से EXIF, GPS निर्देशांक और टाइमस्टैम्प हट जाते हैं।';

  @override
  String get licenseTitle => 'लाइसेंस';

  @override
  String get licenseBody =>
      'इस ऐप में x264, x265 और अन्य GPL कॉम्पोनेन्ट के साथ बनी FFmpeg बंडल है, इसलिए पूरा ऐप्लिकेशन GNU GPL v3 के तहत वितरित होता है।';

  @override
  String get sourceMissing => 'स्रोत फ़ाइल अब उपलब्ध नहीं है।';

  @override
  String get tabSettings => 'सेटिंग्स';

  @override
  String get introTitle => 'डिज़ाइन से ही प्राइवेट';

  @override
  String get introOfflineTitle => 'इसी डिवाइस पर कन्वर्ज़न';

  @override
  String get introOfflineBody =>
      'सारा काम FFmpeg की बंडल्ड कॉपी करती है। फ़ाइलें फ़ोन से बाहर नहीं जातीं — कन्वर्ज़न एयरप्लेन मोड में भी चलता है।';

  @override
  String get introTelemetryTitle => 'ज़ीरो टेलीमेट्री';

  @override
  String get introTelemetryBody =>
      'न अकाउंट, न एनालिटिक्स, न क्रैश रिपोर्ट। ऐप को पता ही नहीं कि आप कौन हैं।';

  @override
  String get introMetadataTitle => 'मेटाडेटा आपके नियंत्रण में';

  @override
  String get introMetadataBody =>
      'हर आउटपुट से EXIF, GPS और टाइमस्टैम्प डिफ़ॉल्ट रूप से हटा दिए जाते हैं। चाहें तो इसे बंद कर सकते हैं।';

  @override
  String get introFreeNote =>
      'मुफ़्त — न विज्ञापन, न सदस्यता। बैच प्रोसेसिंग समेत सभी सुविधाएँ शुरू से मौजूद हैं; खरीदी जा सकती है तो सिर्फ़ टिप, और उससे कुछ भी अनलॉक नहीं होता।';

  @override
  String get introContinue => 'शुरू करें';

  @override
  String get modeSimple => 'सरल';

  @override
  String get modeAdvanced => 'एडवांस्ड';

  @override
  String get modeAdvancedHint =>
      'प्रीसेट कार्ड की जगह कोडेक, बिटरेट और ट्रांसफ़ॉर्म के सारे कंट्रोल दिखाएँ।';

  @override
  String get presetCompressVideoTitle => 'वीडियो कंप्रेस करें';

  @override
  String get presetCompressVideoBody => 'काफ़ी छोटा MP4, क्वालिटी बरकरार';

  @override
  String get presetFitToSizeTitle => 'साइज़ में फ़िट करें';

  @override
  String get presetFitToSizeBody => 'सटीक लिमिट में — Discord, ईमेल, चैट';

  @override
  String get presetCompatibleMp4Title => 'कम्पैटिबल MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC। हर जगह चलता है';

  @override
  String get presetExtractAudioTitle => 'ऑडियो निकालें';

  @override
  String get presetExtractAudioBody => 'किसी भी वीडियो से MP3';

  @override
  String get presetVideoToGifTitle => 'वीडियो से GIF';

  @override
  String get presetVideoToGifBody => 'छोटी क्लिप से ऐनिमेटेड GIF';

  @override
  String get presetMergeTitle => 'वीडियो जोड़ें';

  @override
  String get presetMergeBody => 'क्लिप्स को क्रम से एक MP4 में जोड़ें';

  @override
  String get mergeNeedsTwo => 'जोड़ने के लिए कम से कम दो वीडियो चुनें।';

  @override
  String mergedVideoName(int count) {
    return 'जुड़ा हुआ वीडियो ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'फ़ोटो कंप्रेस करें';

  @override
  String get presetCompressImageBody => 'छोटा JPEG, फ़र्क़ मुश्किल से दिखे';

  @override
  String get presetEnhancePhotoTitle => 'फ़ोटो बेहतर बनाएँ';

  @override
  String get presetEnhancePhotoBody => 'ज़्यादा साफ़, ज़्यादा शार्प, बेहतर रंग';

  @override
  String get presetImageToWebpTitle => 'फ़ोटो से WebP';

  @override
  String get presetImageToWebpBody => 'आधुनिक फ़ॉर्मैट, JPEG से छोटा';

  @override
  String get sizeTargetTitle => 'टारगेट साइज़';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'कस्टम…';

  @override
  String get sizeTargetDialogTitle => 'टारगेट साइज़ (MB में)';

  @override
  String get sizeTargetTooSmall =>
      'इस अवधि के लिए टारगेट बहुत छोटा है; जितनी क़रीब क्वालिटी संभव होगी, उतनी इस्तेमाल होगी।';

  @override
  String estimatePerFile(String size) {
    return '≈ $size प्रति फ़ाइल';
  }

  @override
  String estimateTotal(String size) {
    return 'अनुमानित आउटपुट: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'चुनी गई फ़ाइलें: $count';
  }

  @override
  String get promiseOffline => '100% ऑफ़लाइन कन्वर्ज़न';

  @override
  String get promiseBatchFree => 'बैच कन्वर्ज़न मुफ़्त';

  @override
  String get promiseNoWatermark => 'कोई वॉटरमार्क नहीं';

  @override
  String get sectionTransform => 'ट्रांसफ़ॉर्म';

  @override
  String get rotateLabel => 'घुमाएँ';

  @override
  String get flipLabel => 'हॉरिज़ॉन्टल मिरर';

  @override
  String get speedLabel => 'स्पीड';

  @override
  String get cropLabel => 'क्रॉप';

  @override
  String get cropHint =>
      'चुने गए आस्पेक्ट रेशो पर सेंटर क्रॉप — फ़ीड के लिए स्क्वेयर, स्टोरीज़ के लिए 9:16।';

  @override
  String volumeLabel(int percent) {
    return 'वॉल्यूम: $percent%';
  }

  @override
  String get addAudioFiles => 'ऑडियो और अन्य फ़ाइलें';

  @override
  String get hwEncoderLabel => 'हार्डवेयर एन्कोडिंग';

  @override
  String get hwEncoderHint =>
      'बिटरेट और साइज़-फ़िट मोड में डिवाइस की वीडियो चिप इस्तेमाल होती है — काफ़ी तेज़ और ठंडी। क्वालिटी (CRF) मोड हमेशा सटीक सॉफ़्टवेयर एन्कोडर इस्तेमाल करता है, और विफल हार्डवेयर जॉब अपने आप सॉफ़्टवेयर पर दोबारा चलती है।';

  @override
  String get transformNeedsReencode =>
      'घुमाना, मिरर और स्पीड के लिए री-एन्कोडिंग ज़रूरी है, इसलिए स्ट्रीम कॉपी के दौरान ये बंद रहते हैं।';

  @override
  String get capBitrateLabel => 'फ़ाइल को कभी बड़ा न करें';

  @override
  String get capBitrateHint =>
      'एन्कोडिंग को सोर्स के अपने बिटरेट तक सीमित करता है। कॉन्स्टेंट क्वालिटी की अपनी कोई ऊपरी सीमा नहीं होती, इसलिए पहले से कंप्रेस्ड वीडियो वरना बड़ा हो सकता है।';

  @override
  String get keepSubtitles => 'सबटाइटल रखें';

  @override
  String get keepSubtitlesHint =>
      'सबटाइटल ट्रैक आउटपुट में ले जाता है। सिर्फ़ टेक्स्ट सबटाइटल।';

  @override
  String get sectionTrim => 'ट्रिम';

  @override
  String get trimEnable => 'स्रोत ट्रिम करें';

  @override
  String get trimHint =>
      'तभी उपलब्ध जब कतार में ज्ञात अवधि वाली ठीक एक फ़ाइल हो।';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'टारगेट साइज़';

  @override
  String get lowBatteryTitle => 'बैटरी कम है';

  @override
  String get lowBatteryBody =>
      'कन्वर्ज़न प्रोसेसर पर काफ़ी भार डालता है। पहले चार्जर लगा सकते हैं, या ऐसे ही जारी रखें।';

  @override
  String get lowBatteryContinue => 'फिर भी कन्वर्ट करें';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonOk => 'ठीक है';

  @override
  String filesReceived(int count) {
    return 'मिली फ़ाइलें: $count';
  }

  @override
  String get saveFile => 'सेव करें';

  @override
  String get savedToGallery => 'गैलरी में सेव हुई, एल्बम “Eluna Media”।';

  @override
  String get savedToDownloads => 'डाउनलोड्स में सेव हुई।';

  @override
  String get saveFailed => 'फ़ाइल सेव नहीं हो सकी।';

  @override
  String get jobRemovedUndo => 'जॉब हटाई गई।';

  @override
  String get finishedClearedUndo => 'पूर्ण हुई जॉब्स साफ़ की गईं।';

  @override
  String get undo => 'पूर्ववत करें';

  @override
  String get errorDetailsTitle => 'त्रुटि का विवरण';

  @override
  String get sectionConversionPrefs => 'कन्वर्ज़न';

  @override
  String get powerModeLabel => 'पावर मोड';

  @override
  String get powerEfficiency => 'ठंडा और तेज़';

  @override
  String get powerBalanced => 'संतुलित';

  @override
  String get powerQuality => 'अधिकतम कंप्रेशन';

  @override
  String get powerModeHint =>
      'वीडियो एन्कोडर कितनी मेहनत करे। ठंडा और तेज़ यानी फ़ाइलें थोड़ी बड़ी। बाकी कुछ भी धीमा नहीं किया जाता — कभी नहीं।';

  @override
  String get hapticsLabel => 'वाइब्रेशन फ़ीडबैक';

  @override
  String get networkPrivacyTitle => 'नेटवर्क और प्राइवेसी';

  @override
  String get netAuditIntro =>
      'इस ऐप में नेटवर्क छू सकने वाली हर चीज़ की पूरी सूची।';

  @override
  String get netAuditNoneTitle => 'नेटवर्क का कोई इस्तेमाल नहीं';

  @override
  String get netAuditNoneBody =>
      'ऐप इंटरनेट की अनुमति माँगता ही नहीं, इसलिए चाहकर भी नेटवर्क तक नहीं पहुँच सकता — सिस्टम की ऐप जानकारी में ख़ुद देख लें। न विज्ञापन, न एनालिटिक्स, न अपडेट जाँच। “ऐप को रेट करें” आपको स्टोर ऐप को सौंप देता है; कनेक्शन वही बनाता है।';

  @override
  String get netAuditConversionTitle => 'कन्वर्ज़न';

  @override
  String get netAuditConversionBody =>
      'बंडल्ड FFmpeg के ज़रिए पूरी तरह इसी डिवाइस पर चलता है। एयरप्लेन मोड चालू करके कन्वर्ट करें — काम करता है।';

  @override
  String get netAuditTelemetryTitle => 'टेलीमेट्री';

  @override
  String get netAuditTelemetryBody =>
      'है ही नहीं। ऐप न कोई एनालिटिक्स इकट्ठा करता है, न क्रैश रिपोर्ट, न कोई आइडेंटिफ़ायर, और इसमें कोई अकाउंट सिस्टम भी नहीं है।';

  @override
  String get netAuditTipsTitle => 'टिप';

  @override
  String get netAuditTipsBody =>
      'टिप का लेन-देन Play Store ऐप करता है, यह ऐप नहीं — इसके पास अब भी इंटरनेट की अनुमति नहीं है। खरीद के साथ अनुमतियों की सूची में दो पंक्तियाँ जुड़ती हैं: «ऐप में खरीदारी» और «नेटवर्क कनेक्शन देखना»; दूसरी सिर्फ़ यह पढ़ती है कि कनेक्शन है या नहीं, उसका उपयोग नहीं कर सकती। कुछ भी अपने आप नहीं खरीदा जाता, और टिप से कुछ भी अनलॉक नहीं होता: यहाँ सब कुछ मुफ़्त है।';

  @override
  String get sectionSupport => 'सहयोग';

  @override
  String get rateApp => 'ऐप को रेट करें';

  @override
  String get openLicenses => 'ओपन सोर्स लाइसेंस';

  @override
  String get presetAudioToMp3Title => 'ऑडियो कन्वर्ट करें';

  @override
  String get presetAudioToMp3Body => 'MP3 में — हर जगह चलता है';

  @override
  String get presetCompressAudioTitle => 'ऑडियो कंप्रेस करें';

  @override
  String get presetCompressAudioBody => 'हल्का AAC — वॉइस नोट, पॉडकास्ट';

  @override
  String get convertTo => 'इसमें कन्वर्ट करें';

  @override
  String get formatSectionHint =>
      'यहाँ सिर्फ़ वही फ़ॉर्मैट दिखते हैं जिनमें आपकी फ़ाइलें सचमुच बदली जा सकती हैं।';

  @override
  String get sourceVideo => 'वीडियो';

  @override
  String get sourceImage => 'फ़ोटो';

  @override
  String get sourceAudio => 'ऑडियो';

  @override
  String get sourceUnknown => 'फ़ाइल';

  @override
  String get mixedSelectionTitle => 'अलग-अलग तरह की फ़ाइलें चुनी गईं';

  @override
  String get mixedSelectionBody =>
      'हर फ़ाइल उसके अपने टाइप के सबसे अच्छे प्रीसेट से कन्वर्ट होगी। पूरा कंट्रोल चाहिए तो एक बार में एक ही तरह की फ़ाइलें जोड़ें।';

  @override
  String get filesTitle => 'फ़ाइलें';

  @override
  String get removeFile => 'हटाएँ';

  @override
  String timeLeft(String time) {
    return '≈ $time बाकी';
  }

  @override
  String get jobSettingsTitle => 'कन्वर्ज़न सेटिंग्स';

  @override
  String get jobDetails => 'विवरण';

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
  String get summaryEnhanced => 'बेहतर बनाया गया';

  @override
  String get summaryMetadataStripped => 'मेटाडेटा हटाया गया';

  @override
  String summaryMerge(int count) {
    return 'जोड़े गए क्लिप: $count';
  }

  @override
  String get shareApp => 'ऐप शेयर करें';

  @override
  String get shareAppText =>
      'Eluna Media — फ़ोटो, वीडियो और ऑडियो के लिए मुफ़्त, पूरी तरह ऑफ़लाइन कन्वर्टर। न सब्सक्रिप्शन, न वॉटरमार्क, न अकाउंट।';

  @override
  String appVersionLabel(String version) {
    return 'वर्शन $version';
  }

  @override
  String get openFile => 'खोलें';

  @override
  String get openFolder => 'फ़ोल्डर दिखाएँ';

  @override
  String get noAppToOpen =>
      'इस डिवाइस पर ऐसी कोई ऐप नहीं है जो यह फ़ाइल खोल सके।';

  @override
  String get openFailed => 'फ़ाइल नहीं खुल सकी।';

  @override
  String get twoPassLabel => 'सटीक साइज़ के लिए टू-पास';

  @override
  String get twoPassHint =>
      'साइज़-फ़िट जॉब दो बार एन्कोड होती हैं और बाइट बजट में काफ़ी ज़्यादा सटीक बैठती हैं — बदले में लगभग दोगुना समय और बैटरी।';

  @override
  String get whatsNewTitle => 'नया क्या है';

  @override
  String get whatsNew1 =>
      'वीडियो अब AV1 में भी बन सकता है: फ़ाइलें काफ़ी छोटी, अगर इंतज़ार कर सकें।';

  @override
  String get whatsNew2 =>
      'तस्वीरों के लिए नया: AVIF, JPEG से लगभग आधा, और GIF की जगह एनिमेटेड WebP।';

  @override
  String get whatsNew3 =>
      'M4A अब बिना नुक़सान के भी: AAC के साथ अब ALAC भी है।';

  @override
  String get whatsNew4 =>
      'दिखावट अब एक ही स्क्रीन पर: चमक, एक्सेंट रंग, पूरा काला OLED और Material You।';

  @override
  String get whatsNew5 =>
      'उपलब्धियों में मेडल, तीन टैब और प्रगति — जिसे तस्वीर बनाकर साझा किया जा सकता है।';

  @override
  String get achievementsTitle => 'अचीवमेंट्स';

  @override
  String achievementsProgress(int done, int total) {
    return '$total में से $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'सिर्फ़ इसी डिवाइस पर गिना जाता है। कहीं भी अपलोड नहीं होता।';

  @override
  String get achFirstConversionTitle => 'पहला कदम';

  @override
  String get achFirstConversionBody => 'अपनी पहली फ़ाइल कन्वर्ट करें।';

  @override
  String get achTenConversionsTitle => 'वार्म-अप';

  @override
  String get achTenConversionsBody => '10 फ़ाइलें कन्वर्ट करें।';

  @override
  String get achFiftyConversionsTitle => 'नियमित';

  @override
  String get achFiftyConversionsBody => '50 फ़ाइलें कन्वर्ट करें।';

  @override
  String get achTwoHundredConversionsTitle => 'मेहनती';

  @override
  String get achTwoHundredConversionsBody => '200 फ़ाइलें कन्वर्ट करें।';

  @override
  String get achThousandConversionsTitle => 'कन्वेयर';

  @override
  String get achThousandConversionsBody => '1000 फ़ाइलें कन्वर्ट करें।';

  @override
  String get achSaved100MbTitle => 'जगह बचाने वाले';

  @override
  String get achSaved100MbBody => 'कुल 100 MB खाली करें।';

  @override
  String get achSaved1GbTitle => 'गीगाबाइट शिकारी';

  @override
  String get achSaved1GbBody => 'कुल 1 GB खाली करें।';

  @override
  String get achSaved10GbTitle => 'स्टोरेज हीरो';

  @override
  String get achSaved10GbBody => 'कुल 10 GB खाली करें।';

  @override
  String get achBatchOfFiveTitle => 'बैच वर्कर';

  @override
  String get achBatchOfFiveBody => '5 या ज़्यादा फ़ाइलों का बैच पूरा करें।';

  @override
  String get achBatchOfTwentyTitle => 'असेंबली लाइन';

  @override
  String get achBatchOfTwentyBody => '20 या ज़्यादा फ़ाइलों का बैच पूरा करें।';

  @override
  String get achSniperTitle => 'स्नाइपर';

  @override
  String get achSniperBody =>
      'साइज़-फ़िट से बिल्कुल सटीक साइज़ पर निशाना लगाएँ।';

  @override
  String get achMemeSmithTitle => 'मीम कारीगर';

  @override
  String get achMemeSmithBody => 'किसी वीडियो को GIF बनाएँ।';

  @override
  String get achSoundHunterTitle => 'साउंड शिकारी';

  @override
  String get achSoundHunterBody => 'किसी वीडियो से ऑडियो निकालें।';

  @override
  String get achSubtitleKeeperTitle => 'सबटाइटल रक्षक';

  @override
  String get achSubtitleKeeperBody =>
      'सबटाइटल बरकरार रखते हुए वीडियो कन्वर्ट करें।';

  @override
  String get achDirectorTitle => 'निर्देशक';

  @override
  String get achDirectorBody =>
      'कोई ट्रांसफ़ॉर्म लगाएँ — घुमाव, क्रॉप, स्पीड या वॉल्यूम।';

  @override
  String get achAllRounderTitle => 'ऑलराउंडर';

  @override
  String get achAllRounderBody => 'वीडियो, ऑडियो और इमेज कन्वर्ट करें।';

  @override
  String get achNightOwlTitle => 'निशाचर';

  @override
  String get achNightOwlBody =>
      'आधी रात से सुबह 5 बजे के बीच कोई कन्वर्ज़न पूरा करें।';

  @override
  String get achPlatinumTitle => 'प्लैटिनम';

  @override
  String get achPlatinumBody => 'बाकी सभी अचीवमेंट अनलॉक करें।';

  @override
  String get storageTitle => 'स्टोरेज';

  @override
  String get storageBody =>
      'कन्वर्ट की गई फ़ाइलें तब तक ऐप के अंदर रहती हैं जब तक आप उन्हें सहेजते या साझा नहीं करते; कोई फ़ाइल मैनेजर उन तक नहीं पहुँच सकता।';

  @override
  String get storageEmpty => 'कुछ भी संग्रहीत नहीं';

  @override
  String storageUsage(String size) {
    return 'उपयोग: $size';
  }

  @override
  String get storageClearTitle => 'संग्रहीत फ़ाइलें हटाएँ?';

  @override
  String get storageClearBody =>
      'ऐप में अब भी रखे सभी पूर्ण परिणाम हटा देता है। पहले से सहेजी या साझा की गई फ़ाइलें अछूती रहती हैं।';

  @override
  String get storageClearAction => 'हटाएँ';

  @override
  String storageCleared(String size) {
    return '$size खाली हुआ';
  }

  @override
  String get autoSaveLabel => 'परिणाम अपने आप सहेजें';

  @override
  String get autoSaveHint =>
      'हर तैयार फ़ाइल तुरंत गैलरी में — ऑडियो डाउनलोड में — रख देता है।';

  @override
  String get lowSpaceTitle => 'जगह कम बची है';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'इस बैच को लगभग $needed चाहिए और केवल $free खाली है। कन्वर्ज़न बीच में रुक सकता है।';
  }

  @override
  String saveAll(int count) {
    return 'सभी सहेजें ($count)';
  }

  @override
  String savedAll(int count) {
    return 'सहेजे गए: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total में से $saved सहेजे गए';
  }

  @override
  String get presetFitPhotoTitle => 'फ़ोटो को आकार में लाएँ';

  @override
  String get presetFitPhotoBody =>
      'तस्वीर को सटीक सीमा के नीचे लाएँ — अपलोड फ़ॉर्म, आवेदन।';

  @override
  String get photoFitHint =>
      'ऐप तब तक गुणवत्ता आज़माता है जब तक फ़ाइल सीमा में न आ जाए। सीमा बहुत छोटी हो तो फ़्रेम का आकार भी घटा देता है।';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'लक्ष्य आकार (KB)';

  @override
  String get compareAction => 'तुलना करें';

  @override
  String get compareBefore => 'पहले';

  @override
  String get compareAfter => 'बाद में';

  @override
  String get compareHint => 'मूल देखने के लिए दबाकर रखें।';

  @override
  String get trimStart => 'प्रारंभ';

  @override
  String get trimEnd => 'समाप्ति';

  @override
  String trimTimeHelp(String duration) {
    return 'मि:से, अधिकतम $duration';
  }

  @override
  String get imageScaleLabel => 'स्केल';

  @override
  String get audioChannelsLabel => 'चैनल';

  @override
  String get audioMono => 'मोनो';

  @override
  String get audioStereo => 'स्टीरियो';

  @override
  String get sampleRateLabel => 'सैंपल रेट';

  @override
  String get voiceAudioHint =>
      '22.05 kHz मोनो आवाज़ की रिकॉर्डिंग को बिना सुनाई देने वाले नुकसान के लगभग एक-चौथाई कर देता है। संगीत के लिए दोनों मूल रहने दें।';

  @override
  String get moveUp => 'ऊपर ले जाएँ';

  @override
  String get moveDown => 'नीचे ले जाएँ';

  @override
  String get renameOutput => 'नतीजे का नाम बदलें';

  @override
  String get renameOutputHint => 'नया नाम';

  @override
  String get renameOutputHelp =>
      'एक्सटेंशन आउटपुट फ़ॉर्मैट से तय होता है। खाली छोड़ें तो नतीजे का नाम स्रोत फ़ाइल जैसा रहेगा।';

  @override
  String deleteOriginalsAction(int count) {
    return 'मूल फ़ाइलें हटाएँ ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'कन्वर्ज़न के बाद मूल फ़ाइलें हटाएँ';

  @override
  String get deleteOriginalsHint =>
      'नतीजा सेव हो जाने के बाद सिस्टम से स्रोत फ़ाइलें हटाने को कहता है। सिस्टम हमेशा दिखाता है कि क्या हटेगा और आपकी पुष्टि का इंतज़ार करता है।';

  @override
  String get mediaAccessRequired =>
      'मूल फ़ाइलें हटाने के लिए मीडिया लाइब्रेरी तक पहुँच ज़रूरी है.';

  @override
  String originalsDeleted(String size) {
    return 'मूल फ़ाइलें हटा दी गईं — $size खाली हुआ';
  }

  @override
  String get originalsNoneDeleted =>
      'कुछ नहीं हटाया गया। सिर्फ़ वही फ़ाइलें मिल पाती हैं जो गैलरी में उनके मूल नाम से मौजूद हैं।';

  @override
  String reclaimedTotal(String size) {
    return 'इस ऐप से खाली हुआ: $size';
  }

  @override
  String get deleteAllData => 'सारा डेटा हटाएँ';

  @override
  String get deleteAllDataHint =>
      'ऐप इस डिवाइस पर जो कुछ भी रखता है, वह सब मिटा देता है: कतार, बदली गई फ़ाइलें, प्रीव्यू, उपलब्धियाँ और सेटिंग्स। जो फ़ाइलें आप पहले ही गैलरी में सहेज चुके हैं, उन्हें छुआ नहीं जाता।';

  @override
  String get codecCopy => 'कॉपी करें';

  @override
  String get codecCopyRemux => 'कॉपी करें (रीमक्स)';

  @override
  String get codecNoVideo => 'वीडियो नहीं';

  @override
  String get codecNoAudio => 'ऑडियो नहीं';

  @override
  String codecLossless(String codec) {
    return '$codec (दोषरहित)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (एनिमेटेड)';
  }

  @override
  String get sizeTargetEmail => 'ईमेल';

  @override
  String get trimTimeHint => 'मि:से';
}
