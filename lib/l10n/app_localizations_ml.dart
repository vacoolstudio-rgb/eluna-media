// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class L10nMl extends L10n {
  L10nMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'പരിവർത്തനം';

  @override
  String get tabQueue => 'ക്യൂ';

  @override
  String get addFiles => 'ഫയലുകൾ ചേർക്കുക';

  @override
  String get emptySelectionTitle => 'ഇതുവരെ ഫയലുകളൊന്നുമില്ല';

  @override
  String get emptySelectionBody =>
      'ഫോട്ടോകൾ, വീഡിയോകൾ അല്ലെങ്കിൽ ഓഡിയോ ചേർക്കുക. എല്ലാം ഈ ഉപകരണത്തിൽ തന്നെ പ്രോസസ്സ് ചെയ്യുന്നു.';

  @override
  String get sectionOutput => 'ഔട്ട്‌പുട്ട്';

  @override
  String get sectionVideo => 'വീഡിയോ';

  @override
  String get sectionAudio => 'ഓഡിയോ';

  @override
  String get sectionImage => 'ചിത്രം';

  @override
  String get sectionPrivacy => 'സ്വകാര്യത';

  @override
  String get outputFormat => 'ഫോർമാറ്റ്';

  @override
  String get videoCodec => 'വീഡിയോ കോഡെക്';

  @override
  String get audioCodec => 'ഓഡിയോ കോഡെക്';

  @override
  String get rateControl => 'റേറ്റ് നിയന്ത്രണം';

  @override
  String get rateControlQuality => 'സ്ഥിരമായ ഗുണനിലവാരം (CRF)';

  @override
  String get rateControlBitrate => 'ലക്ഷ്യ ബിറ്റ്‌റേറ്റ്';

  @override
  String crfLabel(int value) {
    return 'ഗുണനിലവാരം (CRF $value)';
  }

  @override
  String get crfHint =>
      'കുറഞ്ഞ മൂല്യം മെച്ചപ്പെട്ട ഗുണനിലവാരവും വലിയ ഫയലും നൽകുന്നു.';

  @override
  String videoBitrate(int value) {
    return 'വീഡിയോ ബിറ്റ്‌റേറ്റ്: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ഓഡിയോ ബിറ്റ്‌റേറ്റ്: $value kbps';
  }

  @override
  String get encodingPreset => 'എൻകോഡർ പ്രീസെറ്റ്';

  @override
  String get encodingPresetHint =>
      'വേഗം കുറഞ്ഞ പ്രീസെറ്റുകൾ മെച്ചപ്പെട്ട കംപ്രഷൻ നൽകുന്നു, പക്ഷേ ഉപകരണം കൂടുതൽ ചൂടാകും.';

  @override
  String get presetOriginal => 'ഒറിജിനൽ';

  @override
  String get resolution => 'റെസല്യൂഷൻ';

  @override
  String get frameRate => 'ഫ്രെയിം റേറ്റ്';

  @override
  String imageQuality(int value) {
    return 'ഗുണനിലവാരം: $value';
  }

  @override
  String get lossless => 'നഷ്ടരഹിതം';

  @override
  String get losslessHint =>
      'വലിയ ഫയലുകൾ, പിക്സൽ തലത്തിൽ കൃത്യമായ ഔട്ട്‌പുട്ട്.';

  @override
  String get sectionEnhance => 'മെച്ചപ്പെടുത്തൽ';

  @override
  String get sharpenLabel => 'മൂർച്ച';

  @override
  String get sharpenHint =>
      'അരികുകൾ കൂടുതൽ വ്യക്തമാക്കുന്നു. മങ്ങിയതോ ഫോക്കസ് തെറ്റിയതോ ആയ ചിത്രം വീണ്ടെടുക്കാൻ ഇതിന് കഴിയില്ല — ആ വിശദാംശം ഫയലിൽ ഇല്ല.';

  @override
  String get sharpenStrongHint =>
      'ശക്തമായ മൂർച്ച കൂട്ടൽ അരികുകളിൽ തിളങ്ങുന്ന വലയങ്ങൾ ഉണ്ടാക്കാം. ആദ്യം ഇടത്തരം പരീക്ഷിക്കുക.';

  @override
  String get denoiseLabel => 'നോയിസ് കുറയ്ക്കൽ';

  @override
  String get denoiseHint =>
      'ഇരുണ്ടതും രാത്രിയിലെടുത്തതുമായ ഫോട്ടോകളിലെ പരുപരുപ്പ് വൃത്തിയാക്കുന്നു. അധികമായാൽ സൂക്ഷ്മമായ വിശദാംശങ്ങൾ മാഞ്ഞുപോകും.';

  @override
  String get autoColorLabel => 'സ്വയമേവ നിറവും ലെവലുകളും';

  @override
  String get autoColorHint =>
      'കോൺട്രാസ്റ്റ് വികസിപ്പിക്കുകയും മങ്ങിയ നിറങ്ങൾ അല്പം ഉയർത്തുകയും ചെയ്യുന്നു.';

  @override
  String get upscaleLabel => '2× വലുതാക്കുക';

  @override
  String get upscaleHint =>
      'വീതിയും ഉയരവും ഇരട്ടിയാക്കുന്നു. ഇത് വിശദാംശം ചേർക്കുന്നില്ല — പ്രിന്റ് ചെയ്യുമ്പോഴോ ക്രോപ്പ് ചെയ്യുമ്പോഴോ സഹായകമാണ്.';

  @override
  String get upscaleConflictHint =>
      'വലുതാക്കാൻ റെസല്യൂഷൻ ഒറിജിനലിലേക്ക് തിരികെ വയ്ക്കുക.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ഓഫ്';

  @override
  String get enhanceLight => 'നേരിയത്';

  @override
  String get enhanceMedium => 'ഇടത്തരം';

  @override
  String get enhanceStrong => 'ശക്തം';

  @override
  String get stripMetadata => 'മെറ്റാഡാറ്റ നീക്കുക';

  @override
  String get stripMetadataHint =>
      'ഔട്ട്‌പുട്ടിൽ നിന്ന് EXIF, GPS, സമയമുദ്രകൾ എന്നിവ നീക്കം ചെയ്യുന്നു.';

  @override
  String startConversion(int count) {
    return 'ഫയലുകൾ പരിവർത്തനം ചെയ്യുക ($count)';
  }

  @override
  String get batchResumed => 'മുടങ്ങിയ പരിവർത്തനം പുനരാരംഭിച്ചു.';

  @override
  String get converting => 'പരിവർത്തനം ചെയ്യുന്നു…';

  @override
  String get cancelBatch => 'നിർത്തുക';

  @override
  String get cancelJob => 'റദ്ദാക്കുക';

  @override
  String get clearFinished => 'പൂർത്തിയായവ മായ്ക്കുക';

  @override
  String get removeJob => 'നീക്കുക';

  @override
  String get shareFile => 'പങ്കിടുക';

  @override
  String get retryJob => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get queueEmptyTitle => 'ക്യൂ ശൂന്യമാണ്';

  @override
  String get queueEmptyBody =>
      'പരിവർത്തനം ടാബിൽ ചേർക്കുന്ന ഫയലുകൾ ഇവിടെ കാണാം.';

  @override
  String queueActiveTab(int count) {
    return 'സജീവം · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'പൂർത്തിയായി · $count';
  }

  @override
  String get queueNoActiveTitle => 'ഒന്നും നടക്കുന്നില്ല';

  @override
  String get queueNoActiveBody =>
      'കാത്തിരിക്കുന്നതോ പരിവർത്തനം ചെയ്യുന്നതോ ആയ ഫയലുകൾ ഇവിടെ കാണാം.';

  @override
  String get queueNoFinishedTitle => 'ഇതുവരെ ഒന്നും പൂർത്തിയായിട്ടില്ല';

  @override
  String get queueNoFinishedBody =>
      'പരിവർത്തനം ചെയ്ത ഫയലുകൾ ഇവിടെ എത്തും — തുറക്കാനും സംരക്ഷിക്കാനും പങ്കിടാനും തയ്യാർ.';

  @override
  String get statusQueued => 'ക്യൂവിൽ';

  @override
  String get statusRunning => 'പരിവർത്തനം ചെയ്യുന്നു';

  @override
  String get statusCompleted => 'പൂർത്തിയായി';

  @override
  String get statusFailed => 'പരാജയപ്പെട്ടു';

  @override
  String get statusCancelled => 'റദ്ദാക്കി';

  @override
  String batchSummary(int done, int total) {
    return '$total-ൽ $done പൂർത്തിയായി';
  }

  @override
  String batchCompleted(int done) {
    return 'പരിവർത്തനം ചെയ്ത ഫയലുകൾ: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done പരിവർത്തനം ചെയ്തു, $failed പരാജയപ്പെട്ടു.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% ചെറുതായി';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% വലുതായി';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'രൂപഭാവം';

  @override
  String get themeSystem => 'സിസ്റ്റം';

  @override
  String get language => 'ഭാഷ';

  @override
  String get languageSystem => 'സിസ്റ്റം';

  @override
  String get privacyTitle => 'സ്വകാര്യത';

  @override
  String get privacyBody =>
      'Eluna Media നിങ്ങളുടെ ഫയലുകൾ പൂർണ്ണമായും ഈ ഉപകരണത്തിൽ തന്നെ, കൂടെ ചേർത്തിരിക്കുന്ന FFmpeg ഉപയോഗിച്ച് പരിവർത്തനം ചെയ്യുന്നു. നിങ്ങളുടെ ഫയലുകൾ ഒരിക്കലും ഉപകരണം വിട്ടുപോകുന്നില്ല, അക്കൗണ്ട് ആവശ്യമില്ല, ടെലിമെട്രിയുമില്ല. ആപ്പിലെ ഒന്നും നെറ്റ്‌വർക്ക് ഉപയോഗിക്കുന്നില്ല — ഇന്റർനെറ്റ് അനുമതി പോലും ഇതിനില്ല.\n\nമെറ്റാഡാറ്റ നീക്കം ചെയ്യൽ സ്ഥിരസ്ഥിതിയായി ഓണാണ്, അതിനാൽ നിങ്ങൾ എക്സ്പോർട്ട് ചെയ്യുന്ന ഫയലുകളിൽ നിന്ന് EXIF, GPS സ്ഥാനവിവരങ്ങൾ, സമയമുദ്രകൾ എന്നിവ ഒഴിവാക്കപ്പെടുന്നു.';

  @override
  String get licenseTitle => 'ലൈസൻസിംഗ്';

  @override
  String get licenseBody =>
      'ഈ ആപ്പിൽ x264, x265 എന്നിവയും മറ്റ് GPL ഘടകങ്ങളും ചേർത്ത് നിർമ്മിച്ച FFmpeg ഉൾപ്പെടുന്നു, അതിനാൽ ആപ്ലിക്കേഷൻ മൊത്തത്തിൽ GNU GPL v3 പ്രകാരമാണ് വിതരണം ചെയ്യുന്നത്.';

  @override
  String get sourceMissing => 'സ്രോതസ്സ് ഫയൽ ഇനി ലഭ്യമല്ല.';

  @override
  String get tabSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get introTitle => 'രൂപകൽപ്പനയിൽ തന്നെ സ്വകാര്യം';

  @override
  String get introOfflineTitle => 'ഈ ഉപകരണത്തിൽ പരിവർത്തനം';

  @override
  String get introOfflineBody =>
      'കൂടെ ചേർത്തിരിക്കുന്ന FFmpeg ആണ് എല്ലാ ജോലിയും ചെയ്യുന്നത്. നിങ്ങളുടെ ഫയലുകൾ ഒരിക്കലും ഫോൺ വിട്ടുപോകുന്നില്ല — എയർപ്ലെയിൻ മോഡിലും പരിവർത്തനം നടക്കും.';

  @override
  String get introTelemetryTitle => 'ടെലിമെട്രി പൂജ്യം';

  @override
  String get introTelemetryBody =>
      'അക്കൗണ്ടില്ല, അനലിറ്റിക്‌സില്ല, ക്രാഷ് റിപ്പോർട്ടിംഗില്ല. നിങ്ങൾ ആരാണെന്ന് ആപ്പിന് അറിയില്ല.';

  @override
  String get introMetadataTitle => 'മെറ്റാഡാറ്റ നിയന്ത്രണത്തിൽ';

  @override
  String get introMetadataBody =>
      'എല്ലാ ഔട്ട്‌പുട്ടിൽ നിന്നും EXIF, GPS, സമയമുദ്രകൾ എന്നിവ സ്ഥിരസ്ഥിതിയായി നീക്കം ചെയ്യുന്നു. അത് നിങ്ങൾക്ക് ഓഫാക്കാം.';

  @override
  String get introFreeNote =>
      'സൗജന്യം, പരസ്യങ്ങളില്ല, സബ്‌സ്‌ക്രിപ്ഷനുകളില്ല. ബാച്ച് പരിവർത്തനം ഉൾപ്പെടെ എല്ലാ സവിശേഷതകളും തുടക്കം മുതൽ നിങ്ങളുടേതാണ് — വാങ്ങാൻ കഴിയുന്ന ഒരേയൊരു കാര്യം ഒരു ടിപ്പ് മാത്രമാണ്, അത് ഒന്നും അൺലോക്ക് ചെയ്യുന്നില്ല.';

  @override
  String get introContinue => 'തുടങ്ങാം';

  @override
  String get modeSimple => 'ലളിതം';

  @override
  String get modeAdvanced => 'വിപുലം';

  @override
  String get modeAdvancedHint =>
      'പ്രീസെറ്റ് കാർഡുകൾക്ക് പകരം എല്ലാ കോഡെക്, ബിറ്റ്‌റേറ്റ്, ട്രാൻസ്‌ഫോം നിയന്ത്രണങ്ങളും കാണിക്കുന്നു.';

  @override
  String get presetCompressVideoTitle => 'വീഡിയോ കംപ്രസ് ചെയ്യുക';

  @override
  String get presetCompressVideoBody =>
      'വളരെ ചെറിയ MP4, ഗുണനിലവാരം നല്ലതായി തുടരും';

  @override
  String get presetFitToSizeTitle => 'വലുപ്പത്തിനൊപ്പിക്കുക';

  @override
  String get presetFitToSizeBody =>
      'കൃത്യമായ പരിധിയിൽ എത്തുക — Discord, ഇമെയിൽ, ചാറ്റുകൾ';

  @override
  String get presetCompatibleMp4Title => 'അനുയോജ്യമായ MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. എവിടെയും പ്ലേ ചെയ്യും';

  @override
  String get presetExtractAudioTitle => 'ഓഡിയോ വേർതിരിക്കുക';

  @override
  String get presetExtractAudioBody => 'ഏത് വീഡിയോയിൽ നിന്നും MP3';

  @override
  String get presetVideoToGifTitle => 'വീഡിയോ GIF ആക്കുക';

  @override
  String get presetVideoToGifBody => 'ചെറിയ ക്ലിപ്പ് ആനിമേറ്റഡ് GIF ആക്കി';

  @override
  String get presetMergeTitle => 'വീഡിയോകൾ ലയിപ്പിക്കുക';

  @override
  String get presetMergeBody => 'ക്ലിപ്പുകൾ ക്രമത്തിൽ ഒരൊറ്റ MP4 ആക്കുക';

  @override
  String get mergeNeedsTwo =>
      'ലയിപ്പിക്കാൻ കുറഞ്ഞത് രണ്ട് വീഡിയോകൾ തിരഞ്ഞെടുക്കുക.';

  @override
  String mergedVideoName(int count) {
    return 'ലയിപ്പിച്ച വീഡിയോ ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ഫോട്ടോ കംപ്രസ് ചെയ്യുക';

  @override
  String get presetCompressImageBody => 'ചെറിയ JPEG, നഷ്ടം കാഴ്ചയിൽ അറിയില്ല';

  @override
  String get presetEnhancePhotoTitle => 'ഫോട്ടോ മെച്ചപ്പെടുത്തുക';

  @override
  String get presetEnhancePhotoBody =>
      'കൂടുതൽ വൃത്തി, മൂർച്ച, മെച്ചപ്പെട്ട നിറം';

  @override
  String get presetImageToWebpTitle => 'ഫോട്ടോ WebP ആക്കുക';

  @override
  String get presetImageToWebpBody => 'ആധുനിക ഫോർമാറ്റ്, JPEG-യെക്കാൾ ചെറുത്';

  @override
  String get sizeTargetTitle => 'ലക്ഷ്യ വലുപ്പം';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'ഇഷ്ടാനുസൃതം…';

  @override
  String get sizeTargetDialogTitle => 'MB-യിൽ ലക്ഷ്യ വലുപ്പം';

  @override
  String get sizeTargetTooSmall =>
      'ഈ ദൈർഘ്യത്തിന് ലക്ഷ്യം വളരെ ചെറുതാണ്; സാധ്യമായ ഏറ്റവും അടുത്ത ഗുണനിലവാരം ഉപയോഗിക്കും.';

  @override
  String estimatePerFile(String size) {
    return 'ഓരോ ഫയലിനും ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'കണക്കാക്കിയ ഔട്ട്‌പുട്ട്: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'തിരഞ്ഞെടുത്ത ഫയലുകൾ: $count';
  }

  @override
  String get promiseOffline => '100% ഓഫ്‌ലൈൻ പരിവർത്തനം';

  @override
  String get promiseBatchFree => 'ബാച്ച് സൗജന്യം';

  @override
  String get promiseNoWatermark => 'വാട്ടർമാർക്കില്ല';

  @override
  String get sectionTransform => 'ട്രാൻസ്‌ഫോം';

  @override
  String get rotateLabel => 'തിരിക്കുക';

  @override
  String get flipLabel => 'തിരശ്ചീനമായി മിറർ ചെയ്യുക';

  @override
  String get speedLabel => 'വേഗത';

  @override
  String get cropLabel => 'ക്രോപ്പ്';

  @override
  String get cropHint =>
      'തിരഞ്ഞെടുത്ത അനുപാതത്തിലേക്ക് മധ്യഭാഗം ക്രോപ്പ് ചെയ്യുന്നു — ഫീഡുകൾക്ക് ചതുരം, സ്റ്റോറികൾക്ക് 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'ശബ്ദം: $percent%';
  }

  @override
  String get addAudioFiles => 'ഓഡിയോയും മറ്റ് ഫയലുകളും';

  @override
  String get hwEncoderLabel => 'ഹാർഡ്‌വെയർ എൻകോഡിംഗ്';

  @override
  String get hwEncoderHint =>
      'ബിറ്റ്‌റേറ്റ്, വലുപ്പത്തിനൊപ്പിക്കൽ മോഡുകളിൽ ഉപകരണത്തിന്റെ വീഡിയോ ചിപ്പ് ഉപയോഗിക്കുന്നു — വളരെ വേഗവും ചൂട് കുറവും. ഗുണനിലവാര (CRF) മോഡ് എപ്പോഴും കൃത്യതയുള്ള സോഫ്റ്റ്‌വെയർ എൻകോഡർ ഉപയോഗിക്കുന്നു, ഹാർഡ്‌വെയർ ജോലി പരാജയപ്പെട്ടാൽ അത് സ്വയമേവ സോഫ്റ്റ്‌വെയറിൽ വീണ്ടും ശ്രമിക്കും.';

  @override
  String get transformNeedsReencode =>
      'തിരിക്കൽ, മിറർ, വേഗത എന്നിവയ്ക്ക് വീണ്ടും എൻകോഡ് ചെയ്യേണ്ടതുണ്ട്, അതിനാൽ സ്ട്രീം കോപ്പി സമയത്ത് അവ ഓഫാണ്.';

  @override
  String get capBitrateLabel => 'ഫയൽ ഒരിക്കലും വലുതാക്കരുത്';

  @override
  String get capBitrateHint =>
      'സ്രോതസ്സിന്റെ സ്വന്തം ബിറ്റ്‌റേറ്റിൽ എൻകോഡിന് പരിധി വയ്ക്കുന്നു. സ്ഥിരമായ ഗുണനിലവാരത്തിന് സ്വന്തമായി ഒരു പരിധിയില്ല, അതിനാൽ നേരത്തെ കംപ്രസ് ചെയ്ത വീഡിയോ അല്ലാത്തപക്ഷം വലുതായി വരാം.';

  @override
  String get keepSubtitles => 'സബ്‌ടൈറ്റിലുകൾ നിലനിർത്തുക';

  @override
  String get keepSubtitlesHint =>
      'സബ്‌ടൈറ്റിൽ ട്രാക്കുകൾ ഔട്ട്‌പുട്ടിലേക്ക് കൊണ്ടുപോകുന്നു. ടെക്സ്റ്റ് സബ്‌ടൈറ്റിലുകൾ മാത്രം.';

  @override
  String get sectionTrim => 'ട്രിം';

  @override
  String get trimEnable => 'സ്രോതസ്സ് ട്രിം ചെയ്യുക';

  @override
  String get trimHint =>
      'ദൈർഘ്യം അറിയാവുന്ന ഒരൊറ്റ ഫയൽ മാത്രം ക്യൂവിലുള്ളപ്പോൾ ലഭ്യമാണ്.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ലക്ഷ്യ വലുപ്പം';

  @override
  String get lowBatteryTitle => 'ബാറ്ററി കുറവാണ്';

  @override
  String get lowBatteryBody =>
      'പരിവർത്തനം പ്രോസസ്സറിനെ കാര്യമായി അധ്വാനിപ്പിക്കുന്നു. ആദ്യം ചാർജിൽ കുത്താം, അല്ലെങ്കിൽ ഇപ്പോൾ തന്നെ തുടരാം.';

  @override
  String get lowBatteryContinue => 'എന്നാലും പരിവർത്തനം ചെയ്യുക';

  @override
  String get commonCancel => 'റദ്ദാക്കുക';

  @override
  String get commonOk => 'ശരി';

  @override
  String filesReceived(int count) {
    return 'ലഭിച്ച ഫയലുകൾ: $count';
  }

  @override
  String get saveFile => 'സംരക്ഷിക്കുക';

  @override
  String get savedToGallery => 'ഗാലറിയിൽ “Eluna Media” ആൽബത്തിൽ സംരക്ഷിച്ചു.';

  @override
  String get savedToDownloads => 'ഡൗൺലോഡുകളിൽ സംരക്ഷിച്ചു.';

  @override
  String get saveFailed => 'ഫയൽ സംരക്ഷിക്കാൻ കഴിഞ്ഞില്ല.';

  @override
  String get jobRemovedUndo => 'ജോലി നീക്കി.';

  @override
  String get finishedClearedUndo => 'പൂർത്തിയായ ജോലികൾ മായ്ച്ചു.';

  @override
  String get undo => 'പഴയപടിയാക്കുക';

  @override
  String get errorDetailsTitle => 'പിശകിന്റെ വിശദാംശങ്ങൾ';

  @override
  String get sectionConversionPrefs => 'പരിവർത്തനം';

  @override
  String get powerModeLabel => 'പവർ മോഡ്';

  @override
  String get powerEfficiency => 'തണുപ്പും വേഗവും';

  @override
  String get powerBalanced => 'സന്തുലിതം';

  @override
  String get powerQuality => 'പരമാവധി കംപ്രഷൻ';

  @override
  String get powerModeHint =>
      'വീഡിയോ എൻകോഡർ എത്ര കഠിനമായി പ്രവർത്തിക്കുന്നു എന്നത്. തണുപ്പും വേഗവും എന്നാൽ ഫയലുകൾ അല്പം വലുതാകും. മറ്റൊന്നും ഒരിക്കലും പരിമിതപ്പെടുത്തുന്നില്ല.';

  @override
  String get hapticsLabel => 'വൈബ്രേഷൻ പ്രതികരണം';

  @override
  String get networkPrivacyTitle => 'നെറ്റ്‌വർക്കും സ്വകാര്യതയും';

  @override
  String get netAuditIntro =>
      'ഈ ആപ്പിൽ നെറ്റ്‌വർക്കുമായി ബന്ധപ്പെടാൻ കഴിയുന്ന എല്ലാത്തിന്റെയും പൂർണ്ണ പട്ടിക.';

  @override
  String get netAuditNoneTitle => 'നെറ്റ്‌വർക്ക് ആക്‌സസ് ഒട്ടുമില്ല';

  @override
  String get netAuditNoneBody =>
      'ആപ്പ് ഇന്റർനെറ്റ് അനുമതി ചോദിക്കുന്നില്ല, അതിനാൽ ശ്രമിച്ചാൽ പോലും അതിന് നെറ്റ്‌വർക്കിൽ എത്താൻ കഴിയില്ല — സിസ്റ്റത്തിലെ ആപ്പ് വിവരങ്ങളിൽ നിങ്ങൾക്കത് പരിശോധിക്കാം. പരസ്യങ്ങളില്ല, അനലിറ്റിക്‌സില്ല, അപ്‌ഡേറ്റ് പരിശോധനകളില്ല. “ആപ്പ് റേറ്റ് ചെയ്യുക” സ്റ്റോർ ആപ്പിന് കൈമാറുന്നു, അത് സ്വന്തം നിലയിൽ ആശയവിനിമയം നടത്തുന്നു.';

  @override
  String get netAuditConversionTitle => 'പരിവർത്തനം';

  @override
  String get netAuditConversionBody =>
      'കൂടെ ചേർത്ത FFmpeg വഴി പൂർണ്ണമായും ഈ ഉപകരണത്തിൽ നടക്കുന്നു. എയർപ്ലെയിൻ മോഡ് ഓണാക്കി പരിവർത്തനം ചെയ്തുനോക്കൂ — അത് പ്രവർത്തിക്കും.';

  @override
  String get netAuditTelemetryTitle => 'ടെലിമെട്രി';

  @override
  String get netAuditTelemetryBody =>
      'അതില്ല. ആപ്പ് അനലിറ്റിക്‌സോ ക്രാഷ് റിപ്പോർട്ടുകളോ തിരിച്ചറിയൽ വിവരങ്ങളോ ശേഖരിക്കുന്നില്ല, അക്കൗണ്ട് സംവിധാനവുമില്ല.';

  @override
  String get netAuditTipsTitle => 'ടിപ്പുകൾ';

  @override
  String get netAuditTipsBody =>
      'ടിപ്പ് നടത്തുന്നത് Play Store ആപ്പാണ്, ഈ ആപ്പല്ല — ഇതിന് ഇപ്പോഴും ഇന്റർനെറ്റ് അനുമതിയില്ല. ബില്ലിംഗ് അനുമതി പട്ടികയിൽ രണ്ട് വരികൾ കൂട്ടിച്ചേർക്കുന്നു: “ഇൻ-ആപ്പ് പർച്ചേസുകൾ”, “നെറ്റ്‌വർക്ക് കണക്ഷനുകൾ കാണുക” — രണ്ടാമത്തേത് കണക്ഷൻ ഉണ്ടോ എന്ന് മാത്രം വായിക്കുന്നു, അത് ഉപയോഗിക്കാൻ കഴിയില്ല. ഒന്നും സ്വയമേവ വാങ്ങപ്പെടുന്നില്ല, ടിപ്പ് ഒന്നും അൺലോക്ക് ചെയ്യുന്നുമില്ല: ഇവിടെ എല്ലാ സവിശേഷതകളും സൗജന്യമാണ്.';

  @override
  String get sectionSupport => 'പിന്തുണ';

  @override
  String get rateApp => 'ആപ്പ് റേറ്റ് ചെയ്യുക';

  @override
  String get openLicenses => 'ഓപ്പൺ സോഴ്‌സ് ലൈസൻസുകൾ';

  @override
  String get presetAudioToMp3Title => 'ഓഡിയോ പരിവർത്തനം ചെയ്യുക';

  @override
  String get presetAudioToMp3Body => 'MP3-ലേക്ക് — എവിടെയും പ്ലേ ചെയ്യും';

  @override
  String get presetCompressAudioTitle => 'ഓഡിയോ കംപ്രസ് ചെയ്യുക';

  @override
  String get presetCompressAudioBody =>
      'ഭാരം കുറഞ്ഞ AAC — വോയ്‌സ് നോട്ടുകൾ, പോഡ്‌കാസ്റ്റുകൾ';

  @override
  String get convertTo => 'ഇതിലേക്ക് പരിവർത്തനം ചെയ്യുക';

  @override
  String get formatSectionHint =>
      'നിങ്ങളുടെ ഫയലുകൾക്ക് യഥാർത്ഥത്തിൽ ആകാൻ കഴിയുന്ന ഫോർമാറ്റുകൾ മാത്രമേ പട്ടികയിലുള്ളൂ.';

  @override
  String get sourceVideo => 'വീഡിയോ';

  @override
  String get sourceImage => 'ഫോട്ടോ';

  @override
  String get sourceAudio => 'ഓഡിയോ';

  @override
  String get sourceUnknown => 'ഫയൽ';

  @override
  String get mixedSelectionTitle => 'വ്യത്യസ്ത തരം ഫയലുകൾ തിരഞ്ഞെടുത്തു';

  @override
  String get mixedSelectionBody =>
      'ഓരോ ഫയലും അതിന്റെ സ്വന്തം തരത്തിന് ഏറ്റവും ചേരുന്ന പ്രീസെറ്റ് ഉപയോഗിച്ച് പരിവർത്തനം ചെയ്യുന്നു. പൂർണ്ണ നിയന്ത്രണത്തിന് ഒരു സമയത്ത് ഒരു തരം മാത്രം ചേർക്കുക.';

  @override
  String get filesTitle => 'ഫയലുകൾ';

  @override
  String get removeFile => 'നീക്കുക';

  @override
  String timeLeft(String time) {
    return '≈ $time ബാക്കി';
  }

  @override
  String get jobSettingsTitle => 'പരിവർത്തന ക്രമീകരണങ്ങൾ';

  @override
  String get jobDetails => 'വിശദാംശങ്ങൾ';

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
  String get summaryEnhanced => 'മെച്ചപ്പെടുത്തി';

  @override
  String get summaryMetadataStripped => 'മെറ്റാഡാറ്റ നീക്കി';

  @override
  String summaryMerge(int count) {
    return 'ലയിപ്പിച്ച ക്ലിപ്പുകൾ: $count';
  }

  @override
  String get shareApp => 'ആപ്പ് പങ്കിടുക';

  @override
  String get shareAppText =>
      'Eluna Media — സൗജന്യവും പൂർണ്ണമായും ഓഫ്‌ലൈനുമായ ഫോട്ടോ, വീഡിയോ, ഓഡിയോ കൺവെർട്ടർ. സബ്‌സ്‌ക്രിപ്ഷനുകളില്ല, വാട്ടർമാർക്കുകളില്ല, അക്കൗണ്ടുകളില്ല.';

  @override
  String appVersionLabel(String version) {
    return 'പതിപ്പ് $version';
  }

  @override
  String get openFile => 'തുറക്കുക';

  @override
  String get openFolder => 'ഫോൾഡർ കാണിക്കുക';

  @override
  String get noAppToOpen => 'ആ ഫയൽ തുറക്കാൻ കഴിയുന്ന ആപ്പ് ഈ ഉപകരണത്തിലില്ല.';

  @override
  String get openFailed => 'ഫയൽ തുറക്കാൻ കഴിഞ്ഞില്ല.';

  @override
  String get twoPassLabel => 'കൃത്യമായ വലുപ്പത്തിന് ടു-പാസ്';

  @override
  String get twoPassHint =>
      'വലുപ്പത്തിനൊപ്പിക്കൽ ജോലികൾ രണ്ടുതവണ എൻകോഡ് ചെയ്യുകയും ബൈറ്റ് പരിധിയിൽ ശ്രദ്ധേയമായി കൂടുതൽ കൃത്യമായി എത്തുകയും ചെയ്യുന്നു — ഏകദേശം ഇരട്ടി സമയവും ബാറ്ററിയും ചെലവാക്കി.';

  @override
  String get whatsNewTitle => 'പുതിയത്';

  @override
  String get whatsNew1 =>
      'വീഡിയോ ഇനി AV1 ആകാം: കാര്യമായി ചെറിയ ഫയലുകൾ, കാത്തിരിക്കാൻ തയ്യാറാണെങ്കിൽ.';

  @override
  String get whatsNew2 =>
      'ചിത്രങ്ങൾക്ക് പുതിയത്: AVIF — ഏകദേശം ഒരു JPEG-യുടെ പകുതി — ഒപ്പം GIF-നു പകരം ആനിമേറ്റഡ് WebP.';

  @override
  String get whatsNew3 =>
      'M4A നഷ്ടരഹിതമാകാം — ALAC ഇപ്പോൾ AAC-യുടെ അരികിലുണ്ട്.';

  @override
  String get whatsNew4 =>
      'രൂപഭാവത്തിന് ഒരൊറ്റ സ്ക്രീൻ: തെളിച്ചം, ആക്‌സന്റ് നിറം, പൂർണ്ണ കറുപ്പ് OLED, Material You.';

  @override
  String get whatsNew5 =>
      'നേട്ടങ്ങൾക്ക് മെഡലുകൾ, മൂന്ന് ടാബുകൾ, ചിത്രമായി പങ്കിടാവുന്ന പുരോഗതി.';

  @override
  String get achievementsTitle => 'നേട്ടങ്ങൾ';

  @override
  String achievementsProgress(int done, int total) {
    return '$total-ൽ $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'ഈ ഉപകരണത്തിൽ മാത്രം കണക്കാക്കുന്നു. ഒന്നും എവിടേക്കും അപ്‌ലോഡ് ചെയ്യുന്നില്ല.';

  @override
  String get achFirstConversionTitle => 'ആദ്യ ചുവടുകൾ';

  @override
  String get achFirstConversionBody => 'ആദ്യ ഫയൽ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achTenConversionsTitle => 'ചൂടുപിടിച്ചു';

  @override
  String get achTenConversionsBody => '10 ഫയലുകൾ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achFiftyConversionsTitle => 'സ്ഥിരക്കാരൻ';

  @override
  String get achFiftyConversionsBody => '50 ഫയലുകൾ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achTwoHundredConversionsTitle => 'അധ്വാനി';

  @override
  String get achTwoHundredConversionsBody => '200 ഫയലുകൾ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achThousandConversionsTitle => 'കൺവെയർ';

  @override
  String get achThousandConversionsBody => '1000 ഫയലുകൾ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achSaved100MbTitle => 'ഇടം ലാഭിക്കുന്നയാൾ';

  @override
  String get achSaved100MbBody => 'ആകെ 100 MB ഒഴിവാക്കുക.';

  @override
  String get achSaved1GbTitle => 'ഗിഗാബൈറ്റ് വേട്ടക്കാരൻ';

  @override
  String get achSaved1GbBody => 'ആകെ 1 GB ഒഴിവാക്കുക.';

  @override
  String get achSaved10GbTitle => 'സംഭരണ നായകൻ';

  @override
  String get achSaved10GbBody => 'ആകെ 10 GB ഒഴിവാക്കുക.';

  @override
  String get achBatchOfFiveTitle => 'ബാച്ച് തൊഴിലാളി';

  @override
  String get achBatchOfFiveBody =>
      '5 അല്ലെങ്കിൽ അതിലധികം ഫയലുകളുള്ള ഒരു ബാച്ച് പൂർത്തിയാക്കുക.';

  @override
  String get achBatchOfTwentyTitle => 'അസംബ്ലി ലൈൻ';

  @override
  String get achBatchOfTwentyBody =>
      '20 അല്ലെങ്കിൽ അതിലധികം ഫയലുകളുള്ള ഒരു ബാച്ച് പൂർത്തിയാക്കുക.';

  @override
  String get achSniperTitle => 'സ്‌നൈപ്പർ';

  @override
  String get achSniperBody =>
      'വലുപ്പത്തിനൊപ്പിക്കൽ ഉപയോഗിച്ച് കൃത്യമായ വലുപ്പത്തിൽ എത്തുക.';

  @override
  String get achMemeSmithTitle => 'മീം ശില്പി';

  @override
  String get achMemeSmithBody => 'ഒരു വീഡിയോ GIF ആക്കുക.';

  @override
  String get achSoundHunterTitle => 'ശബ്ദ വേട്ടക്കാരൻ';

  @override
  String get achSoundHunterBody => 'ഒരു വീഡിയോയിൽ നിന്ന് ഓഡിയോ വേർതിരിക്കുക.';

  @override
  String get achSubtitleKeeperTitle => 'സബ്‌ടൈറ്റിൽ സൂക്ഷിപ്പുകാരൻ';

  @override
  String get achSubtitleKeeperBody =>
      'സബ്‌ടൈറ്റിലുകൾ നിലനിർത്തി ഒരു വീഡിയോ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achDirectorTitle => 'സംവിധായകൻ';

  @override
  String get achDirectorBody =>
      'ഒരു ട്രാൻസ്‌ഫോം പ്രയോഗിക്കുക — തിരിക്കൽ, ക്രോപ്പ്, വേഗത അല്ലെങ്കിൽ ശബ്ദം.';

  @override
  String get achAllRounderTitle => 'എല്ലാത്തിലും മിടുക്കൻ';

  @override
  String get achAllRounderBody =>
      'വീഡിയോ, ഓഡിയോ, ഒരു ചിത്രം എന്നിവ പരിവർത്തനം ചെയ്യുക.';

  @override
  String get achNightOwlTitle => 'രാക്കിളി';

  @override
  String get achNightOwlBody =>
      'അർദ്ധരാത്രിക്കും പുലർച്ചെ 5 മണിക്കും ഇടയിൽ ഒരു പരിവർത്തനം പൂർത്തിയാക്കുക.';

  @override
  String get achPlatinumTitle => 'പ്ലാറ്റിനം';

  @override
  String get achPlatinumBody => 'മറ്റെല്ലാ നേട്ടങ്ങളും നേടുക.';

  @override
  String get storageTitle => 'സംഭരണം';

  @override
  String get storageBody =>
      'പരിവർത്തനം ചെയ്ത ഫയലുകൾ നിങ്ങൾ അവ സംരക്ഷിക്കുകയോ പങ്കിടുകയോ ചെയ്യുന്നതുവരെ ആപ്പിനുള്ളിൽ തന്നെ തുടരും — അവിടെ ഒരു ഫയൽ മാനേജർക്കും എത്താനാവില്ല.';

  @override
  String get storageEmpty => 'ഒന്നും സംഭരിച്ചിട്ടില്ല';

  @override
  String storageUsage(String size) {
    return 'സംഭരിച്ചത്: $size';
  }

  @override
  String get storageClearTitle => 'സംഭരിച്ച ഫയലുകൾ മായ്ക്കണോ?';

  @override
  String get storageClearBody =>
      'ആപ്പ് ഇപ്പോഴും സൂക്ഷിക്കുന്ന എല്ലാ പൂർത്തിയായ ഫലങ്ങളും ഇല്ലാതാക്കുന്നു. നിങ്ങൾ ഇതിനകം സംരക്ഷിച്ചതോ പങ്കിട്ടതോ ആയ ഫയലുകളെ ഇത് ബാധിക്കില്ല.';

  @override
  String get storageClearAction => 'മായ്ക്കുക';

  @override
  String storageCleared(String size) {
    return '$size ഒഴിവാക്കി';
  }

  @override
  String get autoSaveLabel => 'ഫലങ്ങൾ സ്വയമേവ സംരക്ഷിക്കുക';

  @override
  String get autoSaveHint =>
      'പൂർത്തിയാകുന്ന ഓരോ ഫയലും തയ്യാറാകുമ്പോൾ തന്നെ ഗാലറിയിൽ — ഓഡിയോ ഡൗൺലോഡുകളിൽ — ഇടുന്നു.';

  @override
  String get lowSpaceTitle => 'ഇടം അധികമില്ല';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ഈ ബാച്ചിന് ഏകദേശം $needed വേണം, $free മാത്രമേ ഒഴിവുള്ളൂ. പരിവർത്തനം പാതിവഴിയിൽ നിന്നുപോയേക്കാം.';
  }

  @override
  String saveAll(int count) {
    return 'എല്ലാം സംരക്ഷിക്കുക ($count)';
  }

  @override
  String savedAll(int count) {
    return 'സംരക്ഷിച്ചു: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total-ൽ $saved സംരക്ഷിച്ചു';
  }

  @override
  String get presetFitPhotoTitle => 'ഫോട്ടോ വലുപ്പത്തിനൊപ്പിക്കുക';

  @override
  String get presetFitPhotoBody =>
      'ഒരു ചിത്രം കൃത്യമായ പരിധിക്കുള്ളിൽ ഒതുക്കുക — അപ്‌ലോഡ് ഫോമുകൾ, അപേക്ഷകൾ.';

  @override
  String get photoFitHint =>
      'ഒന്ന് ഒതുങ്ങുന്നതുവരെ ആപ്പ് വിവിധ ഗുണനിലവാരങ്ങൾ പരീക്ഷിക്കുന്നു. ചിത്രത്തിന് പരിധി വളരെ ചെറുതാണെങ്കിൽ ഫ്രെയിമിന്റെ വലുപ്പവും കുറയ്ക്കും.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'KB-യിൽ ലക്ഷ്യ വലുപ്പം';

  @override
  String get compareAction => 'താരതമ്യം';

  @override
  String get compareBefore => 'മുമ്പ്';

  @override
  String get compareAfter => 'ശേഷം';

  @override
  String get compareHint => 'ഒറിജിനൽ കാണാൻ അമർത്തിപ്പിടിക്കുക.';

  @override
  String get trimStart => 'ആരംഭം';

  @override
  String get trimEnd => 'അവസാനം';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration വരെ';
  }

  @override
  String get imageScaleLabel => 'സ്കെയിൽ';

  @override
  String get audioChannelsLabel => 'ചാനലുകൾ';

  @override
  String get audioMono => 'മോണോ';

  @override
  String get audioStereo => 'സ്റ്റീരിയോ';

  @override
  String get sampleRateLabel => 'സാമ്പിൾ റേറ്റ്';

  @override
  String get voiceAudioHint =>
      '22.05 kHz-ൽ മോണോ ഒരു ശബ്ദ റെക്കോർഡിംഗിനെ കേൾക്കാവുന്ന നഷ്ടമില്ലാതെ ഏകദേശം നാലിലൊന്നാക്കുന്നു. സംഗീതത്തിന് രണ്ടും ഒറിജിനലായി വിടുക.';

  @override
  String get moveUp => 'മുകളിലേക്ക് നീക്കുക';

  @override
  String get moveDown => 'താഴേക്ക് നീക്കുക';

  @override
  String get renameOutput => 'ഫലത്തിന്റെ പേര് മാറ്റുക';

  @override
  String get renameOutputHint => 'പുതിയ പേര്';

  @override
  String get renameOutputHelp =>
      'എക്സ്റ്റൻഷൻ ഔട്ട്‌പുട്ട് ഫോർമാറ്റിൽ നിന്ന് വരുന്നു. സ്രോതസ്സിന്റെ പേര് ഫലത്തിന് നൽകാൻ ഇത് ശൂന്യമായി വിടുക.';

  @override
  String deleteOriginalsAction(int count) {
    return 'ഒറിജിനലുകൾ ഇല്ലാതാക്കുക ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'പരിവർത്തനത്തിന് ശേഷം ഒറിജിനലുകൾ ഇല്ലാതാക്കുക';

  @override
  String get deleteOriginalsHint =>
      'ഫലം സംരക്ഷിച്ചുകഴിഞ്ഞാൽ സ്രോതസ്സ് ഫയലുകൾ നീക്കാൻ സിസ്റ്റത്തോട് ആവശ്യപ്പെടുന്നു. എന്തൊക്കെ പോകുമെന്ന് സിസ്റ്റം എപ്പോഴും കാണിക്കുകയും നിങ്ങളുടെ സ്ഥിരീകരണത്തിനായി കാത്തിരിക്കുകയും ചെയ്യും.';

  @override
  String originalsDeleted(String size) {
    return 'ഒറിജിനലുകൾ ഇല്ലാതാക്കി — $size ഒഴിവായി';
  }

  @override
  String get originalsNoneDeleted =>
      'ഒന്നും ഇല്ലാതാക്കിയില്ല. ഗാലറി ഇപ്പോഴും അവയുടെ യഥാർത്ഥ പേരിൽ സൂക്ഷിക്കുന്ന ഫയലുകൾ മാത്രമേ കണ്ടെത്താനാകൂ.';

  @override
  String reclaimedTotal(String size) {
    return 'ഈ ആപ്പ് ഉപയോഗിച്ച് ഒഴിവാക്കിയത്: $size';
  }

  @override
  String get deleteAllData => 'എല്ലാ ഡാറ്റയും ഇല്ലാതാക്കുക';

  @override
  String get deleteAllDataHint =>
      'ആപ്പ് ഈ ഉപകരണത്തിൽ സൂക്ഷിക്കുന്ന എല്ലാം മായ്ക്കുന്നു: ക്യൂ, പരിവർത്തനം ചെയ്ത ഫയലുകൾ, പ്രിവ്യൂകൾ, നേട്ടങ്ങൾ, ക്രമീകരണങ്ങൾ. നിങ്ങൾ ഇതിനകം ഗാലറിയിൽ സംരക്ഷിച്ച ഫയലുകളെ ഇത് തൊടുന്നില്ല.';

  @override
  String get codecCopy => 'പകർത്തുക';

  @override
  String get codecCopyRemux => 'പകർത്തുക (റീമക്സ്)';

  @override
  String get codecNoVideo => 'വീഡിയോ ഇല്ല';

  @override
  String get codecNoAudio => 'ഓഡിയോ ഇല്ല';

  @override
  String codecLossless(String codec) {
    return '$codec (നഷ്ടരഹിതം)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (ആനിമേറ്റഡ്)';
  }

  @override
  String get sizeTargetEmail => 'ഇമെയിൽ';

  @override
  String get trimTimeHint => 'm:ss';
}
