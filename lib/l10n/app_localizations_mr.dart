// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class L10nMr extends L10n {
  L10nMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'रूपांतर';

  @override
  String get tabQueue => 'रांग';

  @override
  String get addFiles => 'फाइल्स जोडा';

  @override
  String get emptySelectionTitle => 'अजून एकही फाइल नाही';

  @override
  String get emptySelectionBody =>
      'फोटो, व्हिडिओ किंवा ऑडिओ जोडा. सर्व काही याच डिव्हाइसवर प्रोसेस होते.';

  @override
  String get sectionOutput => 'आउटपुट';

  @override
  String get sectionVideo => 'व्हिडिओ';

  @override
  String get sectionAudio => 'ऑडिओ';

  @override
  String get sectionImage => 'इमेज';

  @override
  String get sectionPrivacy => 'गोपनीयता';

  @override
  String get outputFormat => 'फॉरमॅट';

  @override
  String get videoCodec => 'व्हिडिओ कोडेक';

  @override
  String get audioCodec => 'ऑडिओ कोडेक';

  @override
  String get rateControl => 'रेट कंट्रोल';

  @override
  String get rateControlQuality => 'स्थिर गुणवत्ता (CRF)';

  @override
  String get rateControlBitrate => 'लक्ष्य बिटरेट';

  @override
  String crfLabel(int value) {
    return 'गुणवत्ता (CRF $value)';
  }

  @override
  String get crfHint => 'कमी मूल्य म्हणजे चांगली गुणवत्ता आणि मोठी फाइल.';

  @override
  String videoBitrate(int value) {
    return 'व्हिडिओ बिटरेट: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ऑडिओ बिटरेट: $value kbps';
  }

  @override
  String get encodingPreset => 'एन्कोडर प्रीसेट';

  @override
  String get encodingPresetHint =>
      'हळू प्रीसेट अधिक चांगले कॉम्प्रेस करतात, पण डिव्हाइस जास्त तापते.';

  @override
  String get presetOriginal => 'मूळ';

  @override
  String get resolution => 'रिझोल्यूशन';

  @override
  String get frameRate => 'फ्रेम रेट';

  @override
  String imageQuality(int value) {
    return 'गुणवत्ता: $value';
  }

  @override
  String get lossless => 'लॉसलेस';

  @override
  String get losslessHint => 'फाइल्स मोठ्या, पण पिक्सेल-परफेक्ट आउटपुट.';

  @override
  String get sectionEnhance => 'सुधारणा';

  @override
  String get sharpenLabel => 'शार्पनेस';

  @override
  String get sharpenHint =>
      'कडा अधिक स्पष्ट करते. अस्पष्ट किंवा फोकस चुकलेला फोटो ते वाचवू शकत नाही — तो तपशील फाइलमध्ये आहेच नाही.';

  @override
  String get sharpenStrongHint =>
      'जास्त शार्पनिंगमुळे कडांभोवती उजळ प्रभावळ दिसू शकते. आधी मध्यम वापरून पाहा.';

  @override
  String get denoiseLabel => 'नॉइज कमी करणे';

  @override
  String get denoiseHint =>
      'अंधारातील आणि रात्रीच्या फोटोंमधील ग्रेन साफ करते. जास्त झाल्यास बारीक तपशीलही पुसला जातो.';

  @override
  String get autoColorLabel => 'ऑटो रंग आणि लेव्हल';

  @override
  String get autoColorHint =>
      'कॉन्ट्रास्ट वाढवते आणि फिकट रंगांना थोडी जान देते.';

  @override
  String get upscaleLabel => '2× मोठे करा';

  @override
  String get upscaleHint =>
      'रुंदी आणि उंची दुप्पट करते. तपशील जोडत नाही — प्रिंट करताना किंवा क्रॉप करताना उपयोगी पडते.';

  @override
  String get upscaleConflictHint =>
      'मोठे करण्यासाठी रिझोल्यूशन पुन्हा मूळवर सेट करा.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'बंद';

  @override
  String get enhanceLight => 'हलके';

  @override
  String get enhanceMedium => 'मध्यम';

  @override
  String get enhanceStrong => 'जास्त';

  @override
  String get stripMetadata => 'मेटाडेटा काढा';

  @override
  String get stripMetadataHint =>
      'आउटपुटमधून EXIF, GPS आणि टाइमस्टॅम्प काढून टाकते.';

  @override
  String startConversion(int count) {
    return 'फाइल्स रूपांतरित करा ($count)';
  }

  @override
  String get batchResumed => 'अर्धवट राहिलेले रूपांतर पुन्हा सुरू केले.';

  @override
  String get converting => 'रूपांतर सुरू आहे…';

  @override
  String get cancelBatch => 'थांबवा';

  @override
  String get cancelJob => 'रद्द करा';

  @override
  String get clearFinished => 'पूर्ण झालेली काढा';

  @override
  String get removeJob => 'काढा';

  @override
  String get shareFile => 'शेअर करा';

  @override
  String get retryJob => 'पुन्हा प्रयत्न करा';

  @override
  String get queueEmptyTitle => 'रांग रिकामी आहे';

  @override
  String get queueEmptyBody => 'रूपांतर टॅबवर जोडलेल्या फाइल्स इथे दिसतील.';

  @override
  String queueActiveTab(int count) {
    return 'सुरू · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'पूर्ण · $count';
  }

  @override
  String get queueNoActiveTitle => 'सध्या काहीही सुरू नाही';

  @override
  String get queueNoActiveBody =>
      'रांगेत असलेल्या किंवा रूपांतरित होणाऱ्या फाइल्स इथे दिसतात.';

  @override
  String get queueNoFinishedTitle => 'अजून काहीही पूर्ण झालेले नाही';

  @override
  String get queueNoFinishedBody =>
      'रूपांतरित फाइल्स इथे येतात — उघडण्यासाठी, सेव्ह करण्यासाठी किंवा शेअर करण्यासाठी तयार.';

  @override
  String get statusQueued => 'रांगेत';

  @override
  String get statusRunning => 'रूपांतर सुरू';

  @override
  String get statusCompleted => 'पूर्ण';

  @override
  String get statusFailed => 'अयशस्वी';

  @override
  String get statusCancelled => 'रद्द';

  @override
  String batchSummary(int done, int total) {
    return '$total पैकी $done पूर्ण';
  }

  @override
  String batchCompleted(int done) {
    return 'रूपांतरित फाइल्स: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done रूपांतरित झाल्या, $failed अयशस्वी.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% लहान';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% मोठी';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'स्वरूप';

  @override
  String get themeSystem => 'सिस्टमप्रमाणे';

  @override
  String get language => 'भाषा';

  @override
  String get languageSystem => 'सिस्टम';

  @override
  String get privacyTitle => 'गोपनीयता';

  @override
  String get privacyBody =>
      'Eluna Media तुमच्या फाइल्स पूर्णपणे याच डिव्हाइसवर, सोबत आलेल्या FFmpeg च्या प्रतीने रूपांतरित करते. तुमच्या फाइल्स कधीही डिव्हाइसबाहेर जात नाहीत, खाते लागत नाही आणि कोणतीही टेलिमेट्री नाही. अॅपमधले काहीही नेटवर्क वापरत नाही — त्याच्याकडे इंटरनेटची परवानगीदेखील नाही.\n\nमेटाडेटा काढणे डीफॉल्टने सुरू आहे, त्यामुळे तुम्ही एक्सपोर्ट करता त्या फाइल्समधून EXIF, GPS निर्देशांक आणि टाइमस्टॅम्प वगळले जातात.';

  @override
  String get licenseTitle => 'परवाना';

  @override
  String get licenseBody =>
      'या अॅपसोबत x264, x265 आणि इतर GPL घटकांसह बांधलेले FFmpeg येते, त्यामुळे संपूर्ण अॅप्लिकेशन GNU GPL v3 अंतर्गत वितरित केले जाते.';

  @override
  String get sourceMissing => 'स्रोत फाइल आता उपलब्ध नाही.';

  @override
  String get tabSettings => 'सेटिंग्ज';

  @override
  String get introTitle => 'रचनेपासूनच खासगी';

  @override
  String get introOfflineTitle => 'याच डिव्हाइसवर रूपांतर';

  @override
  String get introOfflineBody =>
      'सर्व काम सोबत आलेली FFmpeg ची प्रत करते. तुमच्या फाइल्स फोनबाहेर जात नाहीत — रूपांतर एअरप्लेन मोडमध्येही चालते.';

  @override
  String get introTelemetryTitle => 'शून्य टेलिमेट्री';

  @override
  String get introTelemetryBody =>
      'खाते नाही, अॅनालिटिक्स नाही, क्रॅश रिपोर्ट नाही. तुम्ही कोण आहात हे अॅपला माहीतच नाही.';

  @override
  String get introMetadataTitle => 'मेटाडेटा तुमच्या नियंत्रणात';

  @override
  String get introMetadataBody =>
      'प्रत्येक आउटपुटमधून EXIF, GPS आणि टाइमस्टॅम्प डीफॉल्टने काढले जातात. हवे असल्यास हे बंद करता येते.';

  @override
  String get introFreeNote =>
      'मोफत — जाहिराती नाहीत, वर्गणी नाही. बॅच रूपांतरासह प्रत्येक सुविधा सुरुवातीपासूनच तुमची आहे; विकत घेता येते ती फक्त टिप, आणि तिने काहीही अनलॉक होत नाही.';

  @override
  String get introContinue => 'सुरू करा';

  @override
  String get modeSimple => 'साधे';

  @override
  String get modeAdvanced => 'प्रगत';

  @override
  String get modeAdvancedHint =>
      'प्रीसेट कार्डऐवजी प्रत्येक कोडेक, बिटरेट आणि ट्रान्सफॉर्म नियंत्रण दाखवा.';

  @override
  String get presetCompressVideoTitle => 'व्हिडिओ कॉम्प्रेस करा';

  @override
  String get presetCompressVideoBody => 'बराच लहान MP4, गुणवत्ता चांगली राहते';

  @override
  String get presetFitToSizeTitle => 'आकारात बसवा';

  @override
  String get presetFitToSizeBody => 'नेमक्या मर्यादेत — Discord, ईमेल, चॅट';

  @override
  String get presetCompatibleMp4Title => 'सुसंगत MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. सगळीकडे चालतो';

  @override
  String get presetExtractAudioTitle => 'ऑडिओ वेगळा काढा';

  @override
  String get presetExtractAudioBody => 'कोणत्याही व्हिडिओतून MP3';

  @override
  String get presetVideoToGifTitle => 'व्हिडिओतून GIF';

  @override
  String get presetVideoToGifBody => 'छोटी क्लिप ते अॅनिमेटेड GIF';

  @override
  String get presetMergeTitle => 'व्हिडिओ जोडा';

  @override
  String get presetMergeBody => 'क्लिप क्रमाने एका MP4 मध्ये जोडा';

  @override
  String get mergeNeedsTwo => 'जोडण्यासाठी किमान दोन व्हिडिओ निवडा.';

  @override
  String mergedVideoName(int count) {
    return 'जोडलेला व्हिडिओ ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'फोटो कॉम्प्रेस करा';

  @override
  String get presetCompressImageBody => 'लहान JPEG, फरक जेमतेम जाणवतो';

  @override
  String get presetEnhancePhotoTitle => 'फोटो सुधारा';

  @override
  String get presetEnhancePhotoBody => 'अधिक स्वच्छ, अधिक स्पष्ट, चांगले रंग';

  @override
  String get presetImageToWebpTitle => 'फोटोतून WebP';

  @override
  String get presetImageToWebpBody => 'आधुनिक फॉरमॅट, JPEG पेक्षा लहान';

  @override
  String get sizeTargetTitle => 'लक्ष्य आकार';

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
  String get sizeTargetDialogTitle => 'लक्ष्य आकार (MB मध्ये)';

  @override
  String get sizeTargetTooSmall =>
      'या कालावधीसाठी हे लक्ष्य फार लहान आहे; शक्य तितकी जवळची गुणवत्ता वापरली जाईल.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size प्रति फाइल';
  }

  @override
  String estimateTotal(String size) {
    return 'अपेक्षित आउटपुट: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'निवडलेल्या फाइल्स: $count';
  }

  @override
  String get promiseOffline => '100% ऑफलाइन रूपांतर';

  @override
  String get promiseBatchFree => 'बॅच रूपांतर मोफत';

  @override
  String get promiseNoWatermark => 'वॉटरमार्क नाही';

  @override
  String get sectionTransform => 'ट्रान्सफॉर्म';

  @override
  String get rotateLabel => 'फिरवा';

  @override
  String get flipLabel => 'आडवे मिरर';

  @override
  String get speedLabel => 'वेग';

  @override
  String get cropLabel => 'क्रॉप';

  @override
  String get cropHint =>
      'निवडलेल्या आस्पेक्ट रेशोवर मध्यभागी क्रॉप — फीडसाठी चौरस, स्टोरीजसाठी 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'आवाज: $percent%';
  }

  @override
  String get addAudioFiles => 'ऑडिओ आणि इतर फाइल्स';

  @override
  String get hwEncoderLabel => 'हार्डवेअर एन्कोडिंग';

  @override
  String get hwEncoderHint =>
      'बिटरेट आणि आकारात-बसवा मोडमध्ये डिव्हाइसची व्हिडिओ चिप वापरली जाते — बरीच वेगवान आणि कमी तापणारी. गुणवत्ता (CRF) मोड नेहमी अचूक सॉफ्टवेअर एन्कोडर वापरतो, आणि अयशस्वी झालेले हार्डवेअर काम आपोआप सॉफ्टवेअरवर पुन्हा चालवले जाते.';

  @override
  String get transformNeedsReencode =>
      'फिरवणे, मिरर आणि वेग यांसाठी पुन्हा एन्कोड करावे लागते, म्हणून स्ट्रीम कॉपीदरम्यान ते बंद असतात.';

  @override
  String get capBitrateLabel => 'फाइल कधीही मोठी करू नका';

  @override
  String get capBitrateHint =>
      'एन्कोडिंग स्रोताच्या स्वतःच्या बिटरेटपर्यंत मर्यादित ठेवते. स्थिर गुणवत्तेला स्वतःची वरची मर्यादा नसते, त्यामुळे आधीच कॉम्प्रेस केलेला व्हिडिओ अन्यथा मोठा होऊ शकतो.';

  @override
  String get keepSubtitles => 'सबटायटल ठेवा';

  @override
  String get keepSubtitlesHint =>
      'सबटायटल ट्रॅक आउटपुटमध्ये नेते. फक्त मजकूर सबटायटल.';

  @override
  String get sectionTrim => 'ट्रिम';

  @override
  String get trimEnable => 'स्रोत ट्रिम करा';

  @override
  String get trimHint =>
      'रांगेत ज्ञात कालावधीची नेमकी एकच फाइल असेल तेव्हाच उपलब्ध.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'लक्ष्य आकार';

  @override
  String get lowBatteryTitle => 'बॅटरी कमी आहे';

  @override
  String get lowBatteryBody =>
      'रूपांतरामुळे प्रोसेसरवर बराच ताण येतो. आधी चार्जर लावू शकता, किंवा तसेच पुढे चालू ठेवा.';

  @override
  String get lowBatteryContinue => 'तरीही रूपांतरित करा';

  @override
  String get commonCancel => 'रद्द करा';

  @override
  String get commonOk => 'ठीक आहे';

  @override
  String filesReceived(int count) {
    return 'मिळालेल्या फाइल्स: $count';
  }

  @override
  String get saveFile => 'सेव्ह करा';

  @override
  String get savedToGallery => 'गॅलरीत, “Eluna Media” अल्बममध्ये सेव्ह झाली.';

  @override
  String get savedToDownloads => 'डाउनलोडमध्ये सेव्ह झाली.';

  @override
  String get saveFailed => 'फाइल सेव्ह करता आली नाही.';

  @override
  String get jobRemovedUndo => 'काम काढून टाकले.';

  @override
  String get finishedClearedUndo => 'पूर्ण झालेली कामे साफ केली.';

  @override
  String get undo => 'पूर्ववत करा';

  @override
  String get errorDetailsTitle => 'त्रुटीचा तपशील';

  @override
  String get sectionConversionPrefs => 'रूपांतर';

  @override
  String get powerModeLabel => 'पॉवर मोड';

  @override
  String get powerEfficiency => 'थंड आणि वेगवान';

  @override
  String get powerBalanced => 'संतुलित';

  @override
  String get powerQuality => 'कमाल कॉम्प्रेशन';

  @override
  String get powerModeHint =>
      'व्हिडिओ एन्कोडरने किती मेहनत करावी. थंड आणि वेगवान म्हणजे फाइल्स थोड्या मोठ्या. बाकी काहीही मंद केले जात नाही — कधीही नाही.';

  @override
  String get hapticsLabel => 'व्हायब्रेशन फीडबॅक';

  @override
  String get networkPrivacyTitle => 'नेटवर्क आणि गोपनीयता';

  @override
  String get netAuditIntro =>
      'या अॅपमधल्या नेटवर्कला स्पर्श करू शकणाऱ्या प्रत्येक गोष्टीची संपूर्ण यादी.';

  @override
  String get netAuditNoneTitle => 'नेटवर्कचा वापर अजिबात नाही';

  @override
  String get netAuditNoneBody =>
      'अॅप इंटरनेटची परवानगी मागतच नाही, त्यामुळे प्रयत्न केला तरी ते नेटवर्कपर्यंत पोहोचू शकत नाही — सिस्टमच्या अॅप माहितीत तुम्ही स्वतः पाहू शकता. जाहिराती नाहीत, अॅनालिटिक्स नाही, अपडेट तपासणी नाही. “अॅपला रेटिंग द्या” हे स्टोअर अॅपकडे सोपवते; संवाद तेच अॅप करते.';

  @override
  String get netAuditConversionTitle => 'रूपांतर';

  @override
  String get netAuditConversionBody =>
      'सोबत आलेल्या FFmpeg द्वारे पूर्णपणे याच डिव्हाइसवर चालते. एअरप्लेन मोड सुरू करून रूपांतरित करून पाहा — चालते.';

  @override
  String get netAuditTelemetryTitle => 'टेलिमेट्री';

  @override
  String get netAuditTelemetryBody =>
      'ती आहेच नाही. अॅप कोणतेही अॅनालिटिक्स, क्रॅश रिपोर्ट किंवा ओळखचिन्हे गोळा करत नाही, आणि त्यात खाते प्रणालीही नाही.';

  @override
  String get netAuditTipsTitle => 'टिप';

  @override
  String get netAuditTipsBody =>
      'टिपेचा व्यवहार Play Store अॅप करते, हे अॅप नाही — त्याच्याकडे अजूनही इंटरनेटची परवानगी नाही. बिलिंगमुळे परवानग्यांच्या यादीत दोन ओळी जोडल्या जातात: “अॅपमधील खरेदी” आणि “नेटवर्क कनेक्शन पाहणे”; दुसरी फक्त कनेक्शन आहे की नाही एवढेच वाचते, ते वापरू शकत नाही. काहीही आपोआप विकत घेतले जात नाही, आणि टिपेने काहीही अनलॉक होत नाही: इथे प्रत्येक सुविधा मोफत आहे.';

  @override
  String get sectionSupport => 'पाठिंबा';

  @override
  String get rateApp => 'अॅपला रेटिंग द्या';

  @override
  String get openLicenses => 'ओपन सोर्स परवाने';

  @override
  String get presetAudioToMp3Title => 'ऑडिओ रूपांतरित करा';

  @override
  String get presetAudioToMp3Body => 'MP3 मध्ये — सगळीकडे चालतो';

  @override
  String get presetCompressAudioTitle => 'ऑडिओ कॉम्प्रेस करा';

  @override
  String get presetCompressAudioBody => 'हलका AAC — व्हॉइस नोट, पॉडकास्ट';

  @override
  String get convertTo => 'यात रूपांतरित करा';

  @override
  String get formatSectionHint =>
      'तुमच्या फाइल्स प्रत्यक्षात ज्यांत बदलू शकतात तेच फॉरमॅट इथे दिसतात.';

  @override
  String get sourceVideo => 'व्हिडिओ';

  @override
  String get sourceImage => 'फोटो';

  @override
  String get sourceAudio => 'ऑडिओ';

  @override
  String get sourceUnknown => 'फाइल';

  @override
  String get mixedSelectionTitle => 'वेगवेगळ्या प्रकारच्या फाइल्स निवडल्या';

  @override
  String get mixedSelectionBody =>
      'प्रत्येक फाइल तिच्या स्वतःच्या प्रकारासाठी सर्वोत्तम प्रीसेटने रूपांतरित होते. पूर्ण नियंत्रण हवे असल्यास एका वेळी एकाच प्रकारच्या फाइल्स जोडा.';

  @override
  String get filesTitle => 'फाइल्स';

  @override
  String get removeFile => 'काढा';

  @override
  String timeLeft(String time) {
    return '≈ $time बाकी';
  }

  @override
  String get jobSettingsTitle => 'रूपांतर सेटिंग्ज';

  @override
  String get jobDetails => 'तपशील';

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
  String get summaryEnhanced => 'सुधारित';

  @override
  String get summaryMetadataStripped => 'मेटाडेटा काढला';

  @override
  String summaryMerge(int count) {
    return 'जोडलेल्या क्लिप: $count';
  }

  @override
  String get shareApp => 'अॅप शेअर करा';

  @override
  String get shareAppText =>
      'Eluna Media — फोटो, व्हिडिओ आणि ऑडिओसाठी मोफत, पूर्णपणे ऑफलाइन कन्व्हर्टर. वर्गणी नाही, वॉटरमार्क नाही, खाते नाही.';

  @override
  String appVersionLabel(String version) {
    return 'आवृत्ती $version';
  }

  @override
  String get openFile => 'उघडा';

  @override
  String get openFolder => 'फोल्डर दाखवा';

  @override
  String get noAppToOpen =>
      'ही फाइल उघडू शकेल असे कोणतेही अॅप या डिव्हाइसवर नाही.';

  @override
  String get openFailed => 'फाइल उघडता आली नाही.';

  @override
  String get twoPassLabel => 'नेमक्या आकारासाठी टू-पास';

  @override
  String get twoPassHint =>
      'आकारात-बसवा कामे दोनदा एन्कोड होतात आणि बाइट मर्यादेत लक्षणीयरीत्या अधिक अचूक बसतात — त्यासाठी जवळपास दुप्पट वेळ आणि बॅटरी लागते.';

  @override
  String get whatsNewTitle => 'नवीन काय आहे';

  @override
  String get whatsNew1 =>
      'व्हिडिओ आता AV1 मध्येही होऊ शकतो: फाइल्स लक्षणीय लहान, थांबायची तयारी असेल तर.';

  @override
  String get whatsNew2 =>
      'चित्रांसाठी नवीन: AVIF, JPEG च्या जवळपास निम्मे, आणि GIF ऐवजी अॅनिमेटेड WebP.';

  @override
  String get whatsNew3 =>
      'M4A आता लॉसलेसही होऊ शकतो — AAC शेजारी आता ALAC आहे.';

  @override
  String get whatsNew4 =>
      'स्वरूपासाठी एकच स्क्रीन: उजळपणा, अॅक्सेंट रंग, पूर्ण काळा OLED आणि Material You.';

  @override
  String get whatsNew5 =>
      'यशांना आता पदके, तीन टॅब आणि प्रगती — जी चित्र म्हणून शेअर करता येते.';

  @override
  String get achievementsTitle => 'यशे';

  @override
  String achievementsProgress(int done, int total) {
    return '$total पैकी $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'फक्त याच डिव्हाइसवर मोजले जाते. कुठेही अपलोड होत नाही.';

  @override
  String get achFirstConversionTitle => 'पहिले पाऊल';

  @override
  String get achFirstConversionBody => 'तुमची पहिली फाइल रूपांतरित करा.';

  @override
  String get achTenConversionsTitle => 'सराव झाला';

  @override
  String get achTenConversionsBody => '10 फाइल्स रूपांतरित करा.';

  @override
  String get achFiftyConversionsTitle => 'नियमित';

  @override
  String get achFiftyConversionsBody => '50 फाइल्स रूपांतरित करा.';

  @override
  String get achTwoHundredConversionsTitle => 'कष्टाळू';

  @override
  String get achTwoHundredConversionsBody => '200 फाइल्स रूपांतरित करा.';

  @override
  String get achThousandConversionsTitle => 'कन्व्हेयर';

  @override
  String get achThousandConversionsBody => '1000 फाइल्स रूपांतरित करा.';

  @override
  String get achSaved100MbTitle => 'जागा वाचवणारे';

  @override
  String get achSaved100MbBody => 'एकूण 100 MB मोकळे करा.';

  @override
  String get achSaved1GbTitle => 'गिगाबाइट शिकारी';

  @override
  String get achSaved1GbBody => 'एकूण 1 GB मोकळे करा.';

  @override
  String get achSaved10GbTitle => 'स्टोरेज हिरो';

  @override
  String get achSaved10GbBody => 'एकूण 10 GB मोकळे करा.';

  @override
  String get achBatchOfFiveTitle => 'बॅच कामगार';

  @override
  String get achBatchOfFiveBody => '5 किंवा अधिक फाइल्सचा बॅच पूर्ण करा.';

  @override
  String get achBatchOfTwentyTitle => 'असेंब्ली लाइन';

  @override
  String get achBatchOfTwentyBody => '20 किंवा अधिक फाइल्सचा बॅच पूर्ण करा.';

  @override
  String get achSniperTitle => 'स्नायपर';

  @override
  String get achSniperBody => 'आकारात-बसवाने अगदी नेमका आकार गाठा.';

  @override
  String get achMemeSmithTitle => 'मीम कारागीर';

  @override
  String get achMemeSmithBody => 'व्हिडिओचे GIF करा.';

  @override
  String get achSoundHunterTitle => 'ध्वनी शिकारी';

  @override
  String get achSoundHunterBody => 'व्हिडिओतून ऑडिओ वेगळा काढा.';

  @override
  String get achSubtitleKeeperTitle => 'सबटायटल रक्षक';

  @override
  String get achSubtitleKeeperBody =>
      'सबटायटल कायम ठेवून व्हिडिओ रूपांतरित करा.';

  @override
  String get achDirectorTitle => 'दिग्दर्शक';

  @override
  String get achDirectorBody =>
      'एखादा ट्रान्सफॉर्म लावा — फिरवणे, क्रॉप, वेग किंवा आवाज.';

  @override
  String get achAllRounderTitle => 'ऑलराउंडर';

  @override
  String get achAllRounderBody => 'व्हिडिओ, ऑडिओ आणि इमेज रूपांतरित करा.';

  @override
  String get achNightOwlTitle => 'निशाचर';

  @override
  String get achNightOwlBody =>
      'मध्यरात्र ते पहाटे 5 दरम्यान एखादे रूपांतर पूर्ण करा.';

  @override
  String get achPlatinumTitle => 'प्लॅटिनम';

  @override
  String get achPlatinumBody => 'इतर सर्व यशे मिळवा.';

  @override
  String get storageTitle => 'स्टोरेज';

  @override
  String get storageBody =>
      'रूपांतरित फाइल्स तुम्ही त्या सेव्ह किंवा शेअर करेपर्यंत अॅपच्या आतच राहतात, जिथे कोणताही फाइल मॅनेजर पोहोचू शकत नाही.';

  @override
  String get storageEmpty => 'काहीही साठवलेले नाही';

  @override
  String storageUsage(String size) {
    return 'साठवलेले: $size';
  }

  @override
  String get storageClearTitle => 'साठवलेल्या फाइल्स काढायच्या?';

  @override
  String get storageClearBody =>
      'अॅपकडे अजून असलेले प्रत्येक पूर्ण झालेले निकाल हटवते. तुम्ही आधीच सेव्ह किंवा शेअर केलेल्या फाइल्सना धक्का लागत नाही.';

  @override
  String get storageClearAction => 'काढा';

  @override
  String storageCleared(String size) {
    return '$size मोकळे झाले';
  }

  @override
  String get autoSaveLabel => 'निकाल आपोआप सेव्ह करा';

  @override
  String get autoSaveHint =>
      'प्रत्येक तयार फाइल लगेच गॅलरीत — ऑडिओ डाउनलोडमध्ये — ठेवते.';

  @override
  String get lowSpaceTitle => 'जागा फारशी शिल्लक नाही';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'या बॅचला सुमारे $needed लागेल आणि फक्त $free मोकळे आहे. रूपांतर मध्येच थांबू शकते.';
  }

  @override
  String saveAll(int count) {
    return 'सर्व सेव्ह करा ($count)';
  }

  @override
  String savedAll(int count) {
    return 'सेव्ह झाल्या: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total पैकी $saved सेव्ह झाल्या';
  }

  @override
  String get presetFitPhotoTitle => 'फोटो आकारात बसवा';

  @override
  String get presetFitPhotoBody =>
      'चित्र नेमक्या मर्यादेखाली आणा — अपलोड फॉर्म, अर्ज.';

  @override
  String get photoFitHint =>
      'फाइल मर्यादेत बसेपर्यंत अॅप वेगवेगळ्या गुणवत्ता आजमावते. मर्यादा चित्रासाठी फारच लहान असल्यास ते फ्रेमचा आकारही कमी करते.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'लक्ष्य आकार (KB मध्ये)';

  @override
  String get compareAction => 'तुलना करा';

  @override
  String get compareBefore => 'आधी';

  @override
  String get compareAfter => 'नंतर';

  @override
  String get compareHint => 'मूळ पाहण्यासाठी दाबून धरा.';

  @override
  String get trimStart => 'सुरुवात';

  @override
  String get trimEnd => 'शेवट';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, कमाल $duration';
  }

  @override
  String get imageScaleLabel => 'स्केल';

  @override
  String get audioChannelsLabel => 'चॅनेल';

  @override
  String get audioMono => 'मोनो';

  @override
  String get audioStereo => 'स्टिरिओ';

  @override
  String get sampleRateLabel => 'सॅम्पल रेट';

  @override
  String get voiceAudioHint =>
      '22.05 kHz वर मोनो केल्याने आवाजाचे रेकॉर्डिंग ऐकू येईल असा फरक न पडता जवळपास एक-चतुर्थांश होते. संगीतासाठी दोन्ही मूळच ठेवा.';

  @override
  String get moveUp => 'वर हलवा';

  @override
  String get moveDown => 'खाली हलवा';

  @override
  String get renameOutput => 'निकालाचे नाव बदला';

  @override
  String get renameOutputHint => 'नवे नाव';

  @override
  String get renameOutputHelp =>
      'एक्स्टेंशन आउटपुट फॉरमॅटवरून ठरते. रिकामे ठेवल्यास निकालाला स्रोत फाइलचे नाव मिळते.';

  @override
  String deleteOriginalsAction(int count) {
    return 'मूळ फाइल्स हटवा ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'रूपांतरानंतर मूळ फाइल्स हटवा';

  @override
  String get deleteOriginalsHint =>
      'निकाल सेव्ह झाल्यावर स्रोत फाइल्स हटवण्यास सिस्टमला सांगते. काय हटणार आहे हे सिस्टम नेहमी दाखवते आणि तुमच्या पुष्टीची वाट पाहते.';

  @override
  String originalsDeleted(String size) {
    return 'मूळ फाइल्स हटवल्या — $size मोकळे झाले';
  }

  @override
  String get originalsNoneDeleted =>
      'काहीही हटवले गेले नाही. गॅलरीत त्यांच्या मूळ नावानेच असलेल्या फाइल्सच सापडू शकतात.';

  @override
  String reclaimedTotal(String size) {
    return 'या अॅपने मोकळे केलेले: $size';
  }

  @override
  String get deleteAllData => 'सर्व डेटा हटवा';

  @override
  String get deleteAllDataHint =>
      'अॅप या डिव्हाइसवर ठेवते ते सर्व पुसून टाकते: रांग, रूपांतरित फाइल्स, प्रीव्ह्यू, यशे आणि सेटिंग्ज. तुम्ही आधीच गॅलरीत सेव्ह केलेल्या फाइल्सना हात लावला जात नाही.';

  @override
  String get codecCopy => 'कॉपी';

  @override
  String get codecCopyRemux => 'कॉपी (रीमक्स)';

  @override
  String get codecNoVideo => 'व्हिडिओ नाही';

  @override
  String get codecNoAudio => 'ऑडिओ नाही';

  @override
  String codecLossless(String codec) {
    return '$codec (लॉसलेस)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (अॅनिमेटेड)';
  }

  @override
  String get sizeTargetEmail => 'ईमेल';

  @override
  String get trimTimeHint => 'm:ss';
}
