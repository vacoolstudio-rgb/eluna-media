// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class L10nTa extends L10n {
  L10nTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'மாற்று';

  @override
  String get tabQueue => 'வரிசை';

  @override
  String get addFiles => 'கோப்புகளைச் சேர்';

  @override
  String get emptySelectionTitle => 'இன்னும் கோப்புகள் இல்லை';

  @override
  String get emptySelectionBody =>
      'புகைப்படங்கள், வீடியோக்கள் அல்லது ஒலிக் கோப்புகளைச் சேர்க்கவும். எல்லாம் இந்தச் சாதனத்திலேயே செயலாக்கப்படுகிறது.';

  @override
  String get sectionOutput => 'வெளியீடு';

  @override
  String get sectionVideo => 'வீடியோ';

  @override
  String get sectionAudio => 'ஒலி';

  @override
  String get sectionImage => 'படம்';

  @override
  String get sectionPrivacy => 'தனியுரிமை';

  @override
  String get outputFormat => 'வடிவம்';

  @override
  String get videoCodec => 'வீடியோ கோடெக்';

  @override
  String get audioCodec => 'ஒலி கோடெக்';

  @override
  String get rateControl => 'வீதக் கட்டுப்பாடு';

  @override
  String get rateControlQuality => 'நிலையான தரம் (CRF)';

  @override
  String get rateControlBitrate => 'இலக்கு பிட்வீதம்';

  @override
  String crfLabel(int value) {
    return 'தரம் (CRF $value)';
  }

  @override
  String get crfHint => 'குறைந்த மதிப்பு என்றால் சிறந்த தரமும் பெரிய கோப்பும்.';

  @override
  String videoBitrate(int value) {
    return 'வீடியோ பிட்வீதம்: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ஒலி பிட்வீதம்: $value kbps';
  }

  @override
  String get encodingPreset => 'குறியாக்கி முன்னமைவு';

  @override
  String get encodingPresetHint =>
      'மெதுவான முன்னமைவுகள் சிறப்பாகச் சுருக்கும், ஆனால் சாதனத்தை அதிகம் சூடாக்கும்.';

  @override
  String get presetOriginal => 'அசல்';

  @override
  String get resolution => 'தெளிவுத்திறன்';

  @override
  String get frameRate => 'சட்டக வீதம்';

  @override
  String imageQuality(int value) {
    return 'தரம்: $value';
  }

  @override
  String get lossless => 'இழப்பற்றது';

  @override
  String get losslessHint =>
      'பெரிய கோப்புகள், பிக்சல் அளவில் துல்லியமான வெளியீடு.';

  @override
  String get sectionEnhance => 'மேம்பாடு';

  @override
  String get sharpenLabel => 'கூர்மை';

  @override
  String get sharpenHint =>
      'விளிம்புகளைக் கூர்மையாக்கும். மங்கலான அல்லது கவனம் தவறிய படத்தை மீட்க முடியாது — அந்த விவரம் கோப்பில் இல்லை.';

  @override
  String get sharpenStrongHint =>
      'அதிகக் கூர்மைப்படுத்தல் விளிம்புகளில் பிரகாசமான ஒளிவட்டங்களை விட்டுச் செல்லலாம். முதலில் நடுத்தரத்தை முயற்சிக்கவும்.';

  @override
  String get denoiseLabel => 'இரைச்சல் குறைப்பு';

  @override
  String get denoiseHint =>
      'இருண்ட மற்றும் இரவுப் புகைப்படங்களில் உள்ள சரசரப்பைச் சுத்தம் செய்யும். அளவுக்கு அதிகமானால் நுண்ணிய விவரங்களும் மறைந்துவிடும்.';

  @override
  String get autoColorLabel => 'தானியங்கு நிறமும் நிலைகளும்';

  @override
  String get autoColorHint =>
      'வேறுபாட்டை விரிவாக்கி, மங்கிய நிறங்களைச் சற்று உயர்த்தும்.';

  @override
  String get upscaleLabel => '2× பெரிதாக்கு';

  @override
  String get upscaleHint =>
      'அகலத்தையும் உயரத்தையும் இரட்டிப்பாக்கும். இது புதிய விவரங்களைச் சேர்ப்பதில்லை — அச்சிடும்போதோ வெட்டும்போதோ உதவும்.';

  @override
  String get upscaleConflictHint =>
      'பெரிதாக்க, தெளிவுத்திறனை மீண்டும் அசலுக்கு அமைக்கவும்.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'இல்லை';

  @override
  String get enhanceLight => 'இலேசானது';

  @override
  String get enhanceMedium => 'நடுத்தரம்';

  @override
  String get enhanceStrong => 'வலிமையானது';

  @override
  String get stripMetadata => 'மேனிலைத் தரவை நீக்கு';

  @override
  String get stripMetadataHint =>
      'வெளியீட்டிலிருந்து EXIF, GPS மற்றும் நேரமுத்திரைகளை நீக்கும்.';

  @override
  String startConversion(int count) {
    return '$count கோப்புகளை மாற்று';
  }

  @override
  String get batchResumed => 'தடைபட்ட மாற்றம் மீண்டும் தொடர்ந்தது.';

  @override
  String get converting => 'மாற்றுகிறது…';

  @override
  String get cancelBatch => 'நிறுத்து';

  @override
  String get cancelJob => 'ரத்து செய்';

  @override
  String get clearFinished => 'முடிந்தவற்றை அழி';

  @override
  String get removeJob => 'அகற்று';

  @override
  String get shareFile => 'பகிர்';

  @override
  String get retryJob => 'மீண்டும் முயற்சி';

  @override
  String get queueEmptyTitle => 'வரிசை காலியாக உள்ளது';

  @override
  String get queueEmptyBody =>
      'மாற்று தாவலில் நீங்கள் சேர்க்கும் கோப்புகள் இங்கே தோன்றும்.';

  @override
  String queueActiveTab(int count) {
    return 'செயலில் · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'முடிந்தவை · $count';
  }

  @override
  String get queueNoActiveTitle => 'எதுவும் நடைபெறவில்லை';

  @override
  String get queueNoActiveBody =>
      'காத்திருக்கும் அல்லது மாற்றப்படும் கோப்புகள் இங்கே தெரியும்.';

  @override
  String get queueNoFinishedTitle => 'இன்னும் எதுவும் முடியவில்லை';

  @override
  String get queueNoFinishedBody =>
      'மாற்றப்பட்ட கோப்புகள் இங்கே வந்து சேரும் — திறக்கவும், சேமிக்கவும், பகிரவும் தயாராக.';

  @override
  String get statusQueued => 'வரிசையில்';

  @override
  String get statusRunning => 'மாற்றுகிறது';

  @override
  String get statusCompleted => 'முடிந்தது';

  @override
  String get statusFailed => 'தோல்வி';

  @override
  String get statusCancelled => 'ரத்து செய்யப்பட்டது';

  @override
  String batchSummary(int done, int total) {
    return '$total இல் $done முடிந்தது';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done கோப்புகள் மாற்றப்பட்டன',
      one: '1 கோப்பு மாற்றப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done மாற்றப்பட்டது, $failed தோல்வியடைந்தது.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% சிறியது';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% பெரியது';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get themeSystem => 'சாதன இயல்பு';

  @override
  String get language => 'மொழி';

  @override
  String get languageSystem => 'சாதன மொழி';

  @override
  String get privacyTitle => 'தனியுரிமை';

  @override
  String get privacyBody =>
      'Eluna Media உங்கள் கோப்புகளை, உள்ளடங்கிய FFmpeg நகலைப் பயன்படுத்தி, முழுவதும் இந்தச் சாதனத்திலேயே மாற்றுகிறது. உங்கள் கோப்புகள் சாதனத்தை விட்டு வெளியேறுவதில்லை, கணக்கு எதுவும் தேவையில்லை, தொலைஅளவீடும் இல்லை. செயலியில் எதுவுமே நெட்வொர்க்கைப் பயன்படுத்துவதில்லை — இணைய அனுமதியைக்கூட அது வைத்திருக்கவில்லை.\n\nமேனிலைத் தரவு நீக்கம் இயல்பாகவே இயக்கத்தில் உள்ளது; எனவே நீங்கள் ஏற்றுமதி செய்யும் கோப்புகளிலிருந்து EXIF, GPS ஆயத்தொலைவுகள் மற்றும் நேரமுத்திரைகள் நீக்கப்படுகின்றன.';

  @override
  String get licenseTitle => 'உரிமம்';

  @override
  String get licenseBody =>
      'இந்தச் செயலி x264, x265 மற்றும் பிற GPL கூறுகளுடன் கட்டப்பட்ட FFmpeg ஐ உள்ளடக்கியுள்ளது; எனவே செயலி முழுவதுமாக GNU GPL v3 இன் கீழ் விநியோகிக்கப்படுகிறது.';

  @override
  String get sourceMissing => 'மூலக் கோப்பு இனி கிடைக்கவில்லை.';

  @override
  String get tabSettings => 'அமைப்புகள்';

  @override
  String get introTitle => 'வடிவமைப்பிலேயே தனிப்பட்டது';

  @override
  String get introOfflineTitle => 'இந்தச் சாதனத்திலேயே மாற்றுகிறது';

  @override
  String get introOfflineBody =>
      'உள்ளடங்கிய FFmpeg நகலே எல்லா வேலையையும் செய்கிறது. உங்கள் கோப்புகள் தொலைபேசியை விட்டு வெளியேறுவதில்லை — விமானப் பயன்முறையிலும் மாற்றம் வேலை செய்யும்.';

  @override
  String get introTelemetryTitle => 'தொலைஅளவீடு எதுவும் இல்லை';

  @override
  String get introTelemetryBody =>
      'கணக்கு இல்லை, பகுப்பாய்வு இல்லை, செயலிழப்பு அறிக்கை இல்லை. நீங்கள் யார் என்பது செயலிக்குத் தெரியாது.';

  @override
  String get introMetadataTitle => 'மேனிலைத் தரவு உங்கள் கட்டுப்பாட்டில்';

  @override
  String get introMetadataBody =>
      'ஒவ்வொரு வெளியீட்டிலிருந்தும் EXIF, GPS மற்றும் நேரமுத்திரைகள் இயல்பாகவே நீக்கப்படுகின்றன. அதை நீங்கள் அணைத்துக்கொள்ளலாம்.';

  @override
  String get introFreeNote =>
      'இலவசம் — விளம்பரங்கள் இல்லை, சந்தாக்கள் இல்லை. தொகுதி மாற்றம் உட்பட ஒவ்வொரு வசதியும் தொடக்கத்திலிருந்தே உங்களுடையது — வாங்கக்கூடிய ஒரே விஷயம் ஒரு நன்கொடை மட்டுமே, அது எதையும் திறப்பதில்லை.';

  @override
  String get introContinue => 'தொடங்கு';

  @override
  String get modeSimple => 'எளிமை';

  @override
  String get modeAdvanced => 'மேம்பட்டது';

  @override
  String get modeAdvancedHint =>
      'முன்னமைவு அட்டைகளுக்குப் பதிலாக ஒவ்வொரு கோடெக், பிட்வீதம் மற்றும் உருமாற்றக் கட்டுப்பாட்டையும் காட்டும்.';

  @override
  String get presetCompressVideoTitle => 'வீடியோவைச் சுருக்கு';

  @override
  String get presetCompressVideoBody =>
      'மிகச் சிறிய MP4, தரம் நன்றாகவே இருக்கும்';

  @override
  String get presetFitToSizeTitle => 'அளவுக்கு ஏற்ப';

  @override
  String get presetFitToSizeBody =>
      'சரியான வரம்பை எட்டு — Discord, மின்னஞ்சல், அரட்டைகள்';

  @override
  String get presetCompatibleMp4Title => 'இணக்கமான MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. எங்கும் இயங்கும்';

  @override
  String get presetExtractAudioTitle => 'ஒலியைப் பிரித்தெடு';

  @override
  String get presetExtractAudioBody => 'எந்த வீடியோவிலிருந்தும் MP3';

  @override
  String get presetVideoToGifTitle => 'வீடியோவிலிருந்து GIF';

  @override
  String get presetVideoToGifBody => 'குறுங்காட்சியை அசையும் GIF ஆக';

  @override
  String get presetMergeTitle => 'வீடியோக்களை இணை';

  @override
  String get presetMergeBody => 'காட்சிகளை வரிசைப்படி ஒரே MP4 ஆக இணைக்கும்';

  @override
  String get mergeNeedsTwo =>
      'இணைக்க, குறைந்தது இரண்டு வீடியோக்களைத் தேர்ந்தெடுக்கவும்.';

  @override
  String mergedVideoName(int count) {
    return 'இணைக்கப்பட்ட வீடியோ ($count காட்சிகள்).mp4';
  }

  @override
  String get presetCompressImageTitle => 'புகைப்படத்தைச் சுருக்கு';

  @override
  String get presetCompressImageBody =>
      'சிறிய JPEG, கண்ணுக்குத் தெரியாத இழப்பு';

  @override
  String get presetEnhancePhotoTitle => 'புகைப்படத்தை மேம்படுத்து';

  @override
  String get presetEnhancePhotoBody =>
      'தூய்மையாக, கூர்மையாக, சிறந்த நிறத்துடன்';

  @override
  String get presetImageToWebpTitle => 'புகைப்படத்திலிருந்து WebP';

  @override
  String get presetImageToWebpBody => 'நவீன வடிவம், JPEG ஐ விடச் சிறியது';

  @override
  String get sizeTargetTitle => 'இலக்கு அளவு';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'தனிப்பயன்…';

  @override
  String get sizeTargetDialogTitle => 'இலக்கு அளவு MB இல்';

  @override
  String get sizeTargetTooSmall =>
      'இந்தக் கால அளவுக்கு இலக்கு மிகச் சிறியது; சாத்தியமான மிக நெருக்கமான தரம் பயன்படுத்தப்படும்.';

  @override
  String estimatePerFile(String size) {
    return 'ஒரு கோப்புக்கு ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'மதிப்பிடப்பட்ட வெளியீடு: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கோப்புகள் தேர்ந்தெடுக்கப்பட்டன',
      one: '1 கோப்பு தேர்ந்தெடுக்கப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% ஆஃப்லைன் மாற்றம்';

  @override
  String get promiseBatchFree => 'தொகுதி மாற்றம் இலவசம்';

  @override
  String get promiseNoWatermark => 'நீர்க்குறி இல்லை';

  @override
  String get sectionTransform => 'உருமாற்றம்';

  @override
  String get rotateLabel => 'சுழற்று';

  @override
  String get flipLabel => 'கிடைமட்டமாகப் பிரதிபலி';

  @override
  String get speedLabel => 'வேகம்';

  @override
  String get cropLabel => 'வெட்டு';

  @override
  String get cropHint =>
      'தேர்ந்தெடுத்த விகிதத்துக்கு மையத்திலிருந்து வெட்டும் — ஊட்டங்களுக்குச் சதுரம், கதைகளுக்கு 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'ஒலியளவு: $percent%';
  }

  @override
  String get addAudioFiles => 'ஒலி மற்றும் பிற கோப்புகள்';

  @override
  String get hwEncoderLabel => 'வன்பொருள் குறியாக்கம்';

  @override
  String get hwEncoderHint =>
      'பிட்வீதம் மற்றும் அளவுக்கு-ஏற்ப முறைகளில் சாதனத்தின் வீடியோ சிப்பைப் பயன்படுத்தும் — மிக வேகமாகவும் குறைந்த சூட்டுடனும். தரம் (CRF) முறை எப்போதும் துல்லியமான மென்பொருள் குறியாக்கியையே பயன்படுத்துகிறது; வன்பொருள் பணி தோல்வியடைந்தால் தானாகவே மென்பொருளில் மீண்டும் முயற்சிக்கும்.';

  @override
  String get transformNeedsReencode =>
      'சுழற்சி, பிரதிபலிப்பு மற்றும் வேகம் ஆகியவற்றுக்கு மறுகுறியாக்கம் தேவை; எனவே ஸ்ட்ரீம் நகல் முறையின்போது அவை முடக்கப்படுகின்றன.';

  @override
  String get capBitrateLabel => 'கோப்பை ஒருபோதும் பெரிதாக்காதே';

  @override
  String get capBitrateHint =>
      'மூலக் கோப்பின் சொந்தப் பிட்வீதத்திலேயே குறியாக்கத்தை வரம்பிடும். நிலையான தரத்துக்குச் சொந்தமாக உச்சவரம்பு இல்லாததால், ஏற்கெனவே சுருக்கப்பட்ட வீடியோ இல்லையெனில் பெரிதாக வெளிவரக்கூடும்.';

  @override
  String get keepSubtitles => 'வசன வரிகளை வைத்திரு';

  @override
  String get keepSubtitlesHint =>
      'வசன வரித் தடங்களை வெளியீட்டுக்குக் கொண்டு செல்லும். உரை வசனங்கள் மட்டும்.';

  @override
  String get sectionTrim => 'நறுக்கல்';

  @override
  String get trimEnable => 'மூலத்தை நறுக்கு';

  @override
  String get trimHint =>
      'அறியப்பட்ட கால அளவுள்ள ஒரே ஒரு கோப்பு வரிசையில் இருக்கும்போது கிடைக்கும்.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'இலக்கு அளவு';

  @override
  String get lowBatteryTitle => 'மின்கலம் குறைவாக உள்ளது';

  @override
  String get lowBatteryBody =>
      'மாற்றுவது செயலியைக் கடுமையாக உழைக்க வைக்கும். முதலில் மின்னிணைப்பு கொடுக்கலாம், அல்லது இப்படியே தொடரலாம்.';

  @override
  String get lowBatteryContinue => 'இருப்பினும் மாற்று';

  @override
  String get commonCancel => 'ரத்து செய்';

  @override
  String get commonOk => 'சரி';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கோப்புகள் பெறப்பட்டன',
      one: '1 கோப்பு பெறப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'சேமி';

  @override
  String get savedToGallery =>
      'கேலரியில், “Eluna Media” ஆல்பத்தில் சேமிக்கப்பட்டது.';

  @override
  String get savedToDownloads => 'பதிவிறக்கங்கள் கோப்புறையில் சேமிக்கப்பட்டது.';

  @override
  String get saveFailed => 'கோப்பைச் சேமிக்க முடியவில்லை.';

  @override
  String get jobRemovedUndo => 'பணி அகற்றப்பட்டது.';

  @override
  String get finishedClearedUndo => 'முடிந்த பணிகள் அழிக்கப்பட்டன.';

  @override
  String get undo => 'செயல்தவிர்';

  @override
  String get errorDetailsTitle => 'பிழை விவரங்கள்';

  @override
  String get sectionConversionPrefs => 'மாற்றம்';

  @override
  String get powerModeLabel => 'ஆற்றல் முறை';

  @override
  String get powerEfficiency => 'குளிர்ச்சியும் வேகமும்';

  @override
  String get powerBalanced => 'சமநிலை';

  @override
  String get powerQuality => 'அதிகபட்சச் சுருக்கம்';

  @override
  String get powerModeHint =>
      'வீடியோ குறியாக்கி எவ்வளவு கடுமையாக உழைக்கிறது என்பதைத் தீர்மானிக்கும். குளிர்ச்சியும் வேகமும் என்றால் கோப்புகள் சற்றுப் பெரிதாக இருக்கும். வேறு எதுவும் — எப்போதும் — கட்டுப்படுத்தப்படுவதில்லை.';

  @override
  String get hapticsLabel => 'அதிர்வுப் பின்னூட்டம்';

  @override
  String get networkPrivacyTitle => 'நெட்வொர்க் மற்றும் தனியுரிமை';

  @override
  String get netAuditIntro =>
      'இந்தச் செயலியில் நெட்வொர்க்கைத் தொடக்கூடிய அனைத்தின் முழுமையான பட்டியல்.';

  @override
  String get netAuditNoneTitle => 'நெட்வொர்க் அணுகல் எதுவும் இல்லை';

  @override
  String get netAuditNoneBody =>
      'செயலி இணைய அனுமதியைக் கோருவதில்லை; எனவே முயன்றாலும் அதனால் நெட்வொர்க்கை அடைய முடியாது — அதைக் கணினியின் செயலித் தகவலில் நீங்களே சரிபார்க்கலாம். விளம்பரங்கள் இல்லை, பகுப்பாய்வு இல்லை, புதுப்பிப்புச் சோதனைகள் இல்லை. “செயலியை மதிப்பிடு” என்பது ஸ்டோர் செயலியிடம் ஒப்படைக்கிறது; அது தன் பேச்சைத் தானே பேசிக்கொள்ளும்.';

  @override
  String get netAuditConversionTitle => 'மாற்றம்';

  @override
  String get netAuditConversionBody =>
      'உள்ளடங்கிய FFmpeg மூலம் முழுவதும் இந்தச் சாதனத்திலேயே இயங்குகிறது. விமானப் பயன்முறையை இயக்கி மாற்றிப் பாருங்கள் — வேலை செய்யும்.';

  @override
  String get netAuditTelemetryTitle => 'தொலைஅளவீடு';

  @override
  String get netAuditTelemetryBody =>
      'அப்படி எதுவும் இல்லை. செயலி பகுப்பாய்வுத் தரவு, செயலிழப்பு அறிக்கைகள், அடையாளங்காட்டிகள் எதையும் சேகரிப்பதில்லை; கணக்கு அமைப்பே இதில் இல்லை.';

  @override
  String get netAuditTipsTitle => 'நன்கொடைகள்';

  @override
  String get netAuditTipsBody =>
      'நன்கொடையை Play Store செயலி நிறைவேற்றுகிறது, இந்தச் செயலி அல்ல — இதற்கு இப்போதும் இணைய அனுமதி இல்லை. பில்லிங் மட்டும் அனுமதிப் பட்டியலில் இரண்டு வரிகளைச் சேர்க்கிறது: “செயலிக்குள் வாங்குதல்கள்” மற்றும் “நெட்வொர்க் இணைப்புகளைப் பார்த்தல்” — இது இணைப்பு உள்ளதா என்பதை மட்டுமே படிக்கும், அதைப் பயன்படுத்த முடியாது. எதுவும் தானாக வாங்கப்படுவதில்லை; நன்கொடை எதையும் திறப்பதில்லை: இங்குள்ள ஒவ்வொரு வசதியும் இலவசம்.';

  @override
  String get sectionSupport => 'ஆதரவு';

  @override
  String get rateApp => 'செயலியை மதிப்பிடு';

  @override
  String get openLicenses => 'திறந்த மூல உரிமங்கள்';

  @override
  String get presetAudioToMp3Title => 'ஒலியை மாற்று';

  @override
  String get presetAudioToMp3Body => 'MP3 ஆக — எதிலும் இயங்கும்';

  @override
  String get presetCompressAudioTitle => 'ஒலியைச் சுருக்கு';

  @override
  String get presetCompressAudioBody =>
      'இலகுவான AAC — குரல் குறிப்புகள், பாட்காஸ்ட்கள்';

  @override
  String get convertTo => 'இதற்கு மாற்று';

  @override
  String get formatSectionHint =>
      'உங்கள் கோப்புகள் உண்மையில் மாறக்கூடிய வடிவங்கள் மட்டுமே பட்டியலிடப்பட்டுள்ளன.';

  @override
  String get sourceVideo => 'வீடியோ';

  @override
  String get sourceImage => 'புகைப்படம்';

  @override
  String get sourceAudio => 'ஒலி';

  @override
  String get sourceUnknown => 'கோப்பு';

  @override
  String get mixedSelectionTitle =>
      'வெவ்வேறு வகைக் கோப்புகள் தேர்ந்தெடுக்கப்பட்டுள்ளன';

  @override
  String get mixedSelectionBody =>
      'ஒவ்வொரு கோப்பும் அதன் சொந்த வகைக்கு ஏற்ற சிறந்த முன்னமைவுடன் மாற்றப்படும். முழுக் கட்டுப்பாட்டுக்கு ஒரு நேரத்தில் ஒரு வகையை மட்டும் சேர்க்கவும்.';

  @override
  String get filesTitle => 'கோப்புகள்';

  @override
  String get removeFile => 'அகற்று';

  @override
  String timeLeft(String time) {
    return '≈ $time மீதம்';
  }

  @override
  String get jobSettingsTitle => 'மாற்ற அமைப்புகள்';

  @override
  String get jobDetails => 'விவரங்கள்';

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
  String get summaryEnhanced => 'மேம்படுத்தப்பட்டது';

  @override
  String get summaryMetadataStripped => 'மேனிலைத் தரவு நீக்கப்பட்டது';

  @override
  String summaryMerge(int count) {
    return '$count காட்சிகள் இணைக்கப்பட்டன';
  }

  @override
  String get shareApp => 'செயலியைப் பகிர்';

  @override
  String get shareAppText =>
      'Eluna Media — இலவச, முழுக்க ஆஃப்லைன் புகைப்பட, வீடியோ மற்றும் ஒலி மாற்றி. சந்தாக்கள் இல்லை, நீர்க்குறிகள் இல்லை, கணக்குகள் இல்லை.';

  @override
  String appVersionLabel(String version) {
    return 'பதிப்பு $version';
  }

  @override
  String get openFile => 'திற';

  @override
  String get openFolder => 'கோப்புறையைக் காட்டு';

  @override
  String get noAppToOpen =>
      'அந்தக் கோப்பை இந்தச் சாதனத்தில் எந்தச் செயலியாலும் திறக்க முடியாது.';

  @override
  String get openFailed => 'கோப்பைத் திறக்க முடியவில்லை.';

  @override
  String get twoPassLabel => 'சரியான அளவுக்கு இரு-கட்டக் குறியாக்கம்';

  @override
  String get twoPassHint =>
      'அளவுக்கு-ஏற்ப பணிகள் இரண்டு முறை குறியாக்கம் செய்து, பைட் வரம்பைக் கணிசமாகத் துல்லியமாக எட்டும் — ஏறத்தாழ இரு மடங்கு நேரமும் மின்கலமும் செலவாகும்.';

  @override
  String get whatsNewTitle => 'புதியவை';

  @override
  String get whatsNew1 =>
      'இப்போது வீடியோ AV1 ஆக இருக்கலாம்: கணிசமாகச் சிறிய கோப்புகள் — காத்திருக்கத் தயாராக இருந்தால்.';

  @override
  String get whatsNew2 =>
      'படங்களுக்குப் புதியவை: AVIF — ஏறத்தாழ JPEG இல் பாதி — மற்றும் GIF க்குப் பதிலாக அசையும் WebP.';

  @override
  String get whatsNew3 =>
      'M4A இழப்பற்றதாக இருக்கலாம் — AAC அருகே இப்போது ALAC உம் உள்ளது.';

  @override
  String get whatsNew4 =>
      'தோற்றத்துக்கு ஒரே திரை: பிரகாசம், முன்னிலை நிறம், தூய கருப்பு OLED மற்றும் Material You.';

  @override
  String get whatsNew5 =>
      'சாதனைகளுக்குப் பதக்கங்கள், மூன்று தாவல்கள், படமாகப் பகிரக்கூடிய முன்னேற்றம்.';

  @override
  String get achievementsTitle => 'சாதனைகள்';

  @override
  String achievementsProgress(int done, int total) {
    return '$total இல் $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'இந்தச் சாதனத்தில் மட்டுமே கணக்கிடப்படுகிறது. எதுவும் எங்கும் பதிவேற்றப்படுவதில்லை.';

  @override
  String get achFirstConversionTitle => 'முதல் அடிகள்';

  @override
  String get achFirstConversionBody => 'உங்கள் முதல் கோப்பை மாற்றுங்கள்.';

  @override
  String get achTenConversionsTitle => 'சூடு பிடித்தாகிவிட்டது';

  @override
  String get achTenConversionsBody => '10 கோப்புகளை மாற்றுங்கள்.';

  @override
  String get achFiftyConversionsTitle => 'வழக்கமானவர்';

  @override
  String get achFiftyConversionsBody => '50 கோப்புகளை மாற்றுங்கள்.';

  @override
  String get achTwoHundredConversionsTitle => 'உழைப்பாளி';

  @override
  String get achTwoHundredConversionsBody => '200 கோப்புகளை மாற்றுங்கள்.';

  @override
  String get achThousandConversionsTitle => 'தொடர் இயந்திரம்';

  @override
  String get achThousandConversionsBody => '1000 கோப்புகளை மாற்றுங்கள்.';

  @override
  String get achSaved100MbTitle => 'இட மிச்சம்';

  @override
  String get achSaved100MbBody => 'மொத்தம் 100 MB ஐ விடுவியுங்கள்.';

  @override
  String get achSaved1GbTitle => 'ஜிகாபைட் வேட்டைக்காரர்';

  @override
  String get achSaved1GbBody => 'மொத்தம் 1 GB ஐ விடுவியுங்கள்.';

  @override
  String get achSaved10GbTitle => 'சேமிப்பக நாயகர்';

  @override
  String get achSaved10GbBody => 'மொத்தம் 10 GB ஐ விடுவியுங்கள்.';

  @override
  String get achBatchOfFiveTitle => 'தொகுதி வேலையாள்';

  @override
  String get achBatchOfFiveBody =>
      '5 அல்லது அதற்கு மேற்பட்ட கோப்புகளின் தொகுதியை முடியுங்கள்.';

  @override
  String get achBatchOfTwentyTitle => 'உற்பத்தி வரிசை';

  @override
  String get achBatchOfTwentyBody =>
      '20 அல்லது அதற்கு மேற்பட்ட கோப்புகளின் தொகுதியை முடியுங்கள்.';

  @override
  String get achSniperTitle => 'குறி தவறாதவர்';

  @override
  String get achSniperBody => 'அளவுக்கு-ஏற்ப முறையில் சரியான அளவை எட்டுங்கள்.';

  @override
  String get achMemeSmithTitle => 'மீம் கொல்லர்';

  @override
  String get achMemeSmithBody => 'ஒரு வீடியோவை GIF ஆக மாற்றுங்கள்.';

  @override
  String get achSoundHunterTitle => 'ஒலி வேட்டைக்காரர்';

  @override
  String get achSoundHunterBody =>
      'ஒரு வீடியோவிலிருந்து ஒலியைப் பிரித்தெடுங்கள்.';

  @override
  String get achSubtitleKeeperTitle => 'வசன வரிக் காப்பாளர்';

  @override
  String get achSubtitleKeeperBody => 'வசன வரிகளுடன் ஒரு வீடியோவை மாற்றுங்கள்.';

  @override
  String get achDirectorTitle => 'இயக்குநர்';

  @override
  String get achDirectorBody =>
      'ஒரு உருமாற்றத்தைப் பயன்படுத்துங்கள் — சுழற்சி, வெட்டு, வேகம் அல்லது ஒலியளவு.';

  @override
  String get achAllRounderTitle => 'அனைத்திலும் வல்லவர்';

  @override
  String get achAllRounderBody => 'வீடியோ, ஒலி மற்றும் ஒரு படத்தை மாற்றுங்கள்.';

  @override
  String get achNightOwlTitle => 'இரவு ஆந்தை';

  @override
  String get achNightOwlBody =>
      'நள்ளிரவுக்கும் அதிகாலை 5 மணிக்கும் இடையில் ஒரு மாற்றத்தை முடியுங்கள்.';

  @override
  String get achPlatinumTitle => 'பிளாட்டினம்';

  @override
  String get achPlatinumBody => 'மற்ற எல்லாச் சாதனைகளையும் பெறுங்கள்.';

  @override
  String get storageTitle => 'சேமிப்பகம்';

  @override
  String get storageBody =>
      'மாற்றப்பட்ட கோப்புகள் நீங்கள் சேமிக்கும் அல்லது பகிரும் வரை செயலிக்குள்ளேயே இருக்கும் — அங்கு எந்தக் கோப்பு மேலாளராலும் அவற்றை அடைய முடியாது.';

  @override
  String get storageEmpty => 'எதுவும் சேமிக்கப்படவில்லை';

  @override
  String storageUsage(String size) {
    return 'சேமிக்கப்பட்டது: $size';
  }

  @override
  String get storageClearTitle => 'சேமித்த கோப்புகளை அழிக்கவா?';

  @override
  String get storageClearBody =>
      'செயலி இன்னும் வைத்திருக்கும் ஒவ்வொரு முடிந்த முடிவையும் நீக்கும். நீங்கள் ஏற்கெனவே சேமித்த அல்லது பகிர்ந்த கோப்புகள் அப்படியே இருக்கும்.';

  @override
  String get storageClearAction => 'அழி';

  @override
  String storageCleared(String size) {
    return '$size விடுவிக்கப்பட்டது';
  }

  @override
  String get autoSaveLabel => 'முடிவுகளைத் தானாகச் சேமி';

  @override
  String get autoSaveHint =>
      'முடிந்த ஒவ்வொரு கோப்பையும் தயாரானதுமே கேலரியில் — ஒலியைப் பதிவிறக்கங்களில் — வைக்கும்.';

  @override
  String get lowSpaceTitle => 'இடம் அதிகம் மீதமில்லை';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'இந்தத் தொகுதிக்கு ஏறத்தாழ $needed தேவை, ஆனால் $free மட்டுமே காலியாக உள்ளது. மாற்றம் இடையிலேயே நின்றுவிடக்கூடும்.';
  }

  @override
  String saveAll(int count) {
    return 'அனைத்தையும் சேமி ($count)';
  }

  @override
  String savedAll(int count) {
    return 'சேமிக்கப்பட்டது: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total இல் $saved சேமிக்கப்பட்டது';
  }

  @override
  String get presetFitPhotoTitle => 'புகைப்படத்தை அளவுக்கு ஏற்ப';

  @override
  String get presetFitPhotoBody =>
      'படத்தைச் சரியான வரம்புக்குள் அடக்கு — பதிவேற்றப் படிவங்கள், விண்ணப்பங்கள்.';

  @override
  String get photoFitHint =>
      'பொருந்தும் வரை செயலி பல தரங்களை முயற்சிக்கும். படத்துக்கு வரம்பு மிகச் சிறியதாக இருந்தால், சட்ட அளவையும் குறைக்கும்.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'இலக்கு அளவு KB இல்';

  @override
  String get compareAction => 'ஒப்பிடு';

  @override
  String get compareBefore => 'முன்';

  @override
  String get compareAfter => 'பின்';

  @override
  String get compareHint => 'அசலைப் பார்க்க அழுத்திப் பிடிக்கவும்.';

  @override
  String get trimStart => 'தொடக்கம்';

  @override
  String get trimEnd => 'முடிவு';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration வரை';
  }

  @override
  String get imageScaleLabel => 'அளவீடு';

  @override
  String get audioChannelsLabel => 'சேனல்கள்';

  @override
  String get audioMono => 'மோனோ';

  @override
  String get audioStereo => 'ஸ்டீரியோ';

  @override
  String get sampleRateLabel => 'மாதிரி வீதம்';

  @override
  String get voiceAudioHint =>
      '22.05 kHz இல் மோனோ ஒரு குரல் பதிவை, கேட்கும்படியான இழப்பின்றி, ஏறத்தாழ கால் பங்காகச் சுருக்கும். இசைக்கு இரண்டையும் அசலாகவே விடுங்கள்.';

  @override
  String get moveUp => 'மேலே நகர்த்து';

  @override
  String get moveDown => 'கீழே நகர்த்து';

  @override
  String get renameOutput => 'முடிவுக்குப் பெயர் மாற்று';

  @override
  String get renameOutputHint => 'புதிய பெயர்';

  @override
  String get renameOutputHelp =>
      'நீட்சி வெளியீட்டு வடிவத்திலிருந்து வரும். முடிவுக்கு மூலக் கோப்பின் பெயரையே வைக்க, இதைக் காலியாக விடுங்கள்.';

  @override
  String deleteOriginalsAction(int count) {
    return 'அசல்களை நீக்கு ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'மாற்றியபின் அசல்களை நீக்கு';

  @override
  String get deleteOriginalsHint =>
      'முடிவு சேமிக்கப்பட்டதும் மூலக் கோப்புகளை அகற்றும்படி கணினியிடம் கேட்கும். எவை நீக்கப்படும் என்பதைக் கணினி எப்போதும் காட்டி, உங்கள் உறுதிப்படுத்தலுக்குக் காத்திருக்கும்.';

  @override
  String originalsDeleted(String size) {
    return 'அசல்கள் நீக்கப்பட்டன — $size விடுவிக்கப்பட்டது';
  }

  @override
  String get originalsNoneDeleted =>
      'எதுவும் நீக்கப்படவில்லை. கேலரி இன்னும் அசல் பெயரில் வைத்திருக்கும் கோப்புகளை மட்டுமே கண்டுபிடிக்க முடியும்.';

  @override
  String reclaimedTotal(String size) {
    return 'இந்தச் செயலியால் விடுவிக்கப்பட்டது: $size';
  }

  @override
  String get deleteAllData => 'எல்லாத் தரவையும் நீக்கு';

  @override
  String get deleteAllDataHint =>
      'இந்தச் சாதனத்தில் செயலி வைத்திருக்கும் அனைத்தையும் அழிக்கும்: வரிசை, மாற்றப்பட்ட கோப்புகள், முன்னோட்டங்கள், சாதனைகள் மற்றும் அமைப்புகள். நீங்கள் ஏற்கெனவே கேலரியில் சேமித்த கோப்புகள் தொடப்படாது.';

  @override
  String get codecCopy => 'நகல்';

  @override
  String get codecCopyRemux => 'நகல் (remux)';

  @override
  String get codecNoVideo => 'வீடியோ இல்லை';

  @override
  String get codecNoAudio => 'ஒலி இல்லை';

  @override
  String codecLossless(String codec) {
    return '$codec (இழப்பற்றது)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (அசையும்)';
  }

  @override
  String get sizeTargetEmail => 'மின்னஞ்சல்';

  @override
  String get trimTimeHint => 'm:ss';
}
