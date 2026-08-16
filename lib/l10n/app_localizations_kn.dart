// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class L10nKn extends L10n {
  L10nKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'ಪರಿವರ್ತನೆ';

  @override
  String get tabQueue => 'ಸರತಿ';

  @override
  String get addFiles => 'ಫೈಲ್‌ಗಳನ್ನು ಸೇರಿಸಿ';

  @override
  String get emptySelectionTitle => 'ಇನ್ನೂ ಯಾವುದೇ ಫೈಲ್‌ಗಳಿಲ್ಲ';

  @override
  String get emptySelectionBody =>
      'ಫೋಟೋಗಳು, ವೀಡಿಯೊಗಳು ಅಥವಾ ಆಡಿಯೊ ಸೇರಿಸಿ. ಎಲ್ಲವನ್ನೂ ಈ ಸಾಧನದಲ್ಲಿಯೇ ಸಂಸ್ಕರಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get sectionOutput => 'ಔಟ್‌ಪುಟ್';

  @override
  String get sectionVideo => 'ವೀಡಿಯೊ';

  @override
  String get sectionAudio => 'ಆಡಿಯೊ';

  @override
  String get sectionImage => 'ಚಿತ್ರ';

  @override
  String get sectionPrivacy => 'ಗೌಪ್ಯತೆ';

  @override
  String get outputFormat => 'ಸ್ವರೂಪ';

  @override
  String get videoCodec => 'ವೀಡಿಯೊ ಕೋಡೆಕ್';

  @override
  String get audioCodec => 'ಆಡಿಯೊ ಕೋಡೆಕ್';

  @override
  String get rateControl => 'ದರ ನಿಯಂತ್ರಣ';

  @override
  String get rateControlQuality => 'ಸ್ಥಿರ ಗುಣಮಟ್ಟ (CRF)';

  @override
  String get rateControlBitrate => 'ಗುರಿ ಬಿಟ್‌ರೇಟ್';

  @override
  String crfLabel(int value) {
    return 'ಗುಣಮಟ್ಟ (CRF $value)';
  }

  @override
  String get crfHint =>
      'ಕಡಿಮೆ ಮೌಲ್ಯವು ಉತ್ತಮ ಗುಣಮಟ್ಟ ಮತ್ತು ದೊಡ್ಡ ಫೈಲ್ ನೀಡುತ್ತದೆ.';

  @override
  String videoBitrate(int value) {
    return 'ವೀಡಿಯೊ ಬಿಟ್‌ರೇಟ್: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ಆಡಿಯೊ ಬಿಟ್‌ರೇಟ್: $value kbps';
  }

  @override
  String get encodingPreset => 'ಎನ್‌ಕೋಡರ್ ಪ್ರಿಸೆಟ್';

  @override
  String get encodingPresetHint =>
      'ನಿಧಾನ ಪ್ರಿಸೆಟ್‌ಗಳು ಉತ್ತಮವಾಗಿ ಸಂಕುಚಿಸುತ್ತವೆ, ಆದರೆ ಸಾಧನವನ್ನು ಹೆಚ್ಚು ಬಿಸಿಯಾಗಿಸುತ್ತವೆ.';

  @override
  String get presetOriginal => 'ಮೂಲ';

  @override
  String get resolution => 'ರೆಸಲ್ಯೂಶನ್';

  @override
  String get frameRate => 'ಫ್ರೇಮ್ ದರ';

  @override
  String imageQuality(int value) {
    return 'ಗುಣಮಟ್ಟ: $value';
  }

  @override
  String get lossless => 'ನಷ್ಟರಹಿತ';

  @override
  String get losslessHint =>
      'ದೊಡ್ಡ ಫೈಲ್‌ಗಳು, ಪಿಕ್ಸೆಲ್ ಮಟ್ಟದಲ್ಲಿ ನಿಖರವಾದ ಔಟ್‌ಪುಟ್.';

  @override
  String get sectionEnhance => 'ಸುಧಾರಣೆ';

  @override
  String get sharpenLabel => 'ಹರಿತ';

  @override
  String get sharpenHint =>
      'ಅಂಚುಗಳನ್ನು ಹೆಚ್ಚು ಸ್ಪಷ್ಟಗೊಳಿಸುತ್ತದೆ. ಮಸುಕಾದ ಅಥವಾ ಫೋಕಸ್ ತಪ್ಪಿದ ಚಿತ್ರವನ್ನು ಇದು ಮರಳಿ ಪಡೆಯಲಾರದು — ಆ ವಿವರವು ಫೈಲ್‌ನಲ್ಲಿ ಇಲ್ಲ.';

  @override
  String get sharpenStrongHint =>
      'ಬಲವಾದ ಹರಿತಗೊಳಿಸುವಿಕೆ ಅಂಚುಗಳ ಸುತ್ತ ಪ್ರಕಾಶಮಾನ ವರ್ತುಲಗಳನ್ನು ಬಿಡಬಹುದು. ಮೊದಲು ಮಧ್ಯಮವನ್ನು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get denoiseLabel => 'ನಾಯ್ಸ್ ಕಡಿತ';

  @override
  String get denoiseHint =>
      'ಕತ್ತಲೆಯ ಮತ್ತು ರಾತ್ರಿಯ ಫೋಟೋಗಳಲ್ಲಿನ ಕಣಿಕೆಯನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸುತ್ತದೆ. ಹೆಚ್ಚಾದರೆ ಸೂಕ್ಷ್ಮ ವಿವರಗಳು ಅಳಿಸಿಹೋಗುತ್ತವೆ.';

  @override
  String get autoColorLabel => 'ಸ್ವಯಂಚಾಲಿತ ಬಣ್ಣ ಮತ್ತು ಮಟ್ಟಗಳು';

  @override
  String get autoColorHint =>
      'ಕಾಂಟ್ರಾಸ್ಟ್ ಅನ್ನು ವಿಸ್ತರಿಸಿ ಮಂದ ಬಣ್ಣಗಳನ್ನು ಸ್ವಲ್ಪ ಎತ್ತುತ್ತದೆ.';

  @override
  String get upscaleLabel => '2× ದೊಡ್ಡದಾಗಿಸಿ';

  @override
  String get upscaleHint =>
      'ಅಗಲ ಮತ್ತು ಎತ್ತರವನ್ನು ದ್ವಿಗುಣಗೊಳಿಸುತ್ತದೆ. ಇದು ವಿವರವನ್ನು ಸೇರಿಸುವುದಿಲ್ಲ — ಮುದ್ರಿಸುವಾಗ ಅಥವಾ ಕ್ರಾಪ್ ಮಾಡುವಾಗ ಸಹಾಯವಾಗುತ್ತದೆ.';

  @override
  String get upscaleConflictHint =>
      'ದೊಡ್ಡದಾಗಿಸಲು ರೆಸಲ್ಯೂಶನ್ ಅನ್ನು ಮೂಲಕ್ಕೆ ಹಿಂತಿರುಗಿಸಿ.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ಆಫ್';

  @override
  String get enhanceLight => 'ಹಗುರ';

  @override
  String get enhanceMedium => 'ಮಧ್ಯಮ';

  @override
  String get enhanceStrong => 'ಬಲವಾದ';

  @override
  String get stripMetadata => 'ಮೆಟಾಡೇಟಾ ತೆಗೆದುಹಾಕಿ';

  @override
  String get stripMetadataHint =>
      'ಔಟ್‌ಪುಟ್‌ನಿಂದ EXIF, GPS ಮತ್ತು ಸಮಯಮುದ್ರೆಗಳನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ.';

  @override
  String startConversion(int count) {
    return 'ಫೈಲ್‌ಗಳನ್ನು ಪರಿವರ್ತಿಸಿ ($count)';
  }

  @override
  String get batchResumed => 'ಅಡಚಣೆಯಾದ ಪರಿವರ್ತನೆಯನ್ನು ಮುಂದುವರಿಸಲಾಗಿದೆ.';

  @override
  String get converting => 'ಪರಿವರ್ತಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String get cancelBatch => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get cancelJob => 'ರದ್ದುಮಾಡಿ';

  @override
  String get clearFinished => 'ಪೂರ್ಣಗೊಂಡವನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get removeJob => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String get shareFile => 'ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get retryJob => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get queueEmptyTitle => 'ಸರತಿ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String get queueEmptyBody =>
      'ಪರಿವರ್ತನೆ ಟ್ಯಾಬ್‌ನಲ್ಲಿ ಸೇರಿಸಿದ ಫೈಲ್‌ಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.';

  @override
  String queueActiveTab(int count) {
    return 'ಸಕ್ರಿಯ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'ಪೂರ್ಣಗೊಂಡ · $count';
  }

  @override
  String get queueNoActiveTitle => 'ಏನೂ ನಡೆಯುತ್ತಿಲ್ಲ';

  @override
  String get queueNoActiveBody =>
      'ಕಾಯುತ್ತಿರುವ ಅಥವಾ ಪರಿವರ್ತನೆಯಾಗುತ್ತಿರುವ ಫೈಲ್‌ಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.';

  @override
  String get queueNoFinishedTitle => 'ಇನ್ನೂ ಏನೂ ಪೂರ್ಣಗೊಂಡಿಲ್ಲ';

  @override
  String get queueNoFinishedBody =>
      'ಪರಿವರ್ತಿತ ಫೈಲ್‌ಗಳು ಇಲ್ಲಿಗೆ ಬರುತ್ತವೆ — ತೆರೆಯಲು, ಉಳಿಸಲು ಅಥವಾ ಹಂಚಿಕೊಳ್ಳಲು ಸಿದ್ಧ.';

  @override
  String get statusQueued => 'ಸರತಿಯಲ್ಲಿ';

  @override
  String get statusRunning => 'ಪರಿವರ್ತನೆಯಾಗುತ್ತಿದೆ';

  @override
  String get statusCompleted => 'ಮುಗಿದಿದೆ';

  @override
  String get statusFailed => 'ವಿಫಲವಾಗಿದೆ';

  @override
  String get statusCancelled => 'ರದ್ದಾಗಿದೆ';

  @override
  String batchSummary(int done, int total) {
    return '$total ರಲ್ಲಿ $done ಮುಗಿದಿದೆ';
  }

  @override
  String batchCompleted(int done) {
    return 'ಪರಿವರ್ತಿತ ಫೈಲ್‌ಗಳು: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done ಪರಿವರ್ತಿಸಲಾಗಿದೆ, $failed ವಿಫಲವಾಗಿದೆ.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% ಚಿಕ್ಕದು';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% ದೊಡ್ಡದು';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'ಗೋಚರಿಕೆ';

  @override
  String get themeSystem => 'ಸಿಸ್ಟಂ';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get languageSystem => 'ಸಿಸ್ಟಂ';

  @override
  String get privacyTitle => 'ಗೌಪ್ಯತೆ';

  @override
  String get privacyBody =>
      'Eluna Media ನಿಮ್ಮ ಫೈಲ್‌ಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಈ ಸಾಧನದಲ್ಲಿಯೇ, ಜೊತೆಗೆ ಸೇರಿಸಲಾದ FFmpeg ಬಳಸಿ ಪರಿವರ್ತಿಸುತ್ತದೆ. ನಿಮ್ಮ ಫೈಲ್‌ಗಳು ಎಂದಿಗೂ ಸಾಧನವನ್ನು ಬಿಟ್ಟು ಹೋಗುವುದಿಲ್ಲ, ಖಾತೆಯ ಅಗತ್ಯವಿಲ್ಲ, ಮತ್ತು ಟೆಲಿಮೆಟ್ರಿ ಇಲ್ಲ. ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಯಾವುದೂ ನೆಟ್‌ವರ್ಕ್ ಅನ್ನು ಬಳಸುವುದಿಲ್ಲ — ಇದಕ್ಕೆ ಇಂಟರ್ನೆಟ್ ಅನುಮತಿಯೂ ಇಲ್ಲ.\n\nಮೆಟಾಡೇಟಾ ತೆಗೆದುಹಾಕುವಿಕೆ ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ ಆನ್ ಆಗಿದೆ, ಆದ್ದರಿಂದ ನೀವು ರಫ್ತು ಮಾಡುವ ಫೈಲ್‌ಗಳಿಂದ EXIF, GPS ನಿರ್ದೇಶಾಂಕಗಳು ಮತ್ತು ಸಮಯಮುದ್ರೆಗಳನ್ನು ಕೈಬಿಡಲಾಗುತ್ತದೆ.';

  @override
  String get licenseTitle => 'ಪರವಾನಗಿ';

  @override
  String get licenseBody =>
      'ಈ ಅಪ್ಲಿಕೇಶನ್ x264, x265 ಮತ್ತು ಇತರ GPL ಘಟಕಗಳೊಂದಿಗೆ ನಿರ್ಮಿಸಲಾದ FFmpeg ಅನ್ನು ಒಳಗೊಂಡಿದೆ, ಆದ್ದರಿಂದ ಅಪ್ಲಿಕೇಶನ್ ಒಟ್ಟಾರೆಯಾಗಿ GNU GPL v3 ಅಡಿಯಲ್ಲಿ ವಿತರಣೆಯಾಗುತ್ತದೆ.';

  @override
  String get sourceMissing => 'ಮೂಲ ಫೈಲ್ ಇನ್ನು ಮುಂದೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get tabSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get introTitle => 'ವಿನ್ಯಾಸದಿಂದಲೇ ಖಾಸಗಿ';

  @override
  String get introOfflineTitle => 'ಈ ಸಾಧನದಲ್ಲಿ ಪರಿವರ್ತನೆ';

  @override
  String get introOfflineBody =>
      'ಜೊತೆಗೆ ಸೇರಿಸಲಾದ FFmpeg ಎಲ್ಲ ಕೆಲಸವನ್ನೂ ಮಾಡುತ್ತದೆ. ನಿಮ್ಮ ಫೈಲ್‌ಗಳು ಎಂದಿಗೂ ಫೋನ್ ಬಿಟ್ಟು ಹೋಗುವುದಿಲ್ಲ — ಏರ್‌ಪ್ಲೇನ್ ಮೋಡ್‌ನಲ್ಲಿಯೂ ಪರಿವರ್ತನೆ ನಡೆಯುತ್ತದೆ.';

  @override
  String get introTelemetryTitle => 'ಶೂನ್ಯ ಟೆಲಿಮೆಟ್ರಿ';

  @override
  String get introTelemetryBody =>
      'ಖಾತೆ ಇಲ್ಲ, ಅನಾಲಿಟಿಕ್ಸ್ ಇಲ್ಲ, ಕ್ರ್ಯಾಶ್ ವರದಿ ಇಲ್ಲ. ನೀವು ಯಾರೆಂದು ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಗೊತ್ತಿಲ್ಲ.';

  @override
  String get introMetadataTitle => 'ಮೆಟಾಡೇಟಾ ನಿಯಂತ್ರಣದಲ್ಲಿ';

  @override
  String get introMetadataBody =>
      'ಪ್ರತಿ ಔಟ್‌ಪುಟ್‌ನಿಂದ EXIF, GPS ಮತ್ತು ಸಮಯಮುದ್ರೆಗಳನ್ನು ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ. ಅದನ್ನು ನೀವು ಆಫ್ ಮಾಡಬಹುದು.';

  @override
  String get introFreeNote =>
      'ಉಚಿತ, ಜಾಹೀರಾತುಗಳಿಲ್ಲ, ಚಂದಾದಾರಿಕೆಗಳಿಲ್ಲ. ಬ್ಯಾಚ್ ಪರಿವರ್ತನೆ ಸೇರಿದಂತೆ ಪ್ರತಿಯೊಂದು ವೈಶಿಷ್ಟ್ಯವೂ ಆರಂಭದಿಂದಲೇ ನಿಮ್ಮದು — ಖರೀದಿಸಬಹುದಾದ ಒಂದೇ ಒಂದು ವಿಷಯವೆಂದರೆ ಟಿಪ್, ಮತ್ತು ಅದು ಏನನ್ನೂ ಅನ್‌ಲಾಕ್ ಮಾಡುವುದಿಲ್ಲ.';

  @override
  String get introContinue => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get modeSimple => 'ಸರಳ';

  @override
  String get modeAdvanced => 'ಸುಧಾರಿತ';

  @override
  String get modeAdvancedHint =>
      'ಪ್ರಿಸೆಟ್ ಕಾರ್ಡ್‌ಗಳ ಬದಲಿಗೆ ಪ್ರತಿ ಕೋಡೆಕ್, ಬಿಟ್‌ರೇಟ್ ಮತ್ತು ರೂಪಾಂತರ ನಿಯಂತ್ರಣವನ್ನು ತೋರಿಸುತ್ತದೆ.';

  @override
  String get presetCompressVideoTitle => 'ವೀಡಿಯೊ ಸಂಕುಚಿಸಿ';

  @override
  String get presetCompressVideoBody =>
      'ಬಹಳ ಚಿಕ್ಕ MP4, ಗುಣಮಟ್ಟ ಚೆನ್ನಾಗಿಯೇ ಉಳಿಯುತ್ತದೆ';

  @override
  String get presetFitToSizeTitle => 'ಗಾತ್ರಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get presetFitToSizeBody =>
      'ನಿಖರ ಮಿತಿಯನ್ನು ಮುಟ್ಟಿ — Discord, ಇಮೇಲ್, ಚಾಟ್‌ಗಳು';

  @override
  String get presetCompatibleMp4Title => 'ಹೊಂದಾಣಿಕೆಯ MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. ಎಲ್ಲೆಡೆ ಪ್ಲೇ ಆಗುತ್ತದೆ';

  @override
  String get presetExtractAudioTitle => 'ಆಡಿಯೊ ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get presetExtractAudioBody => 'ಯಾವುದೇ ವೀಡಿಯೊದಿಂದ MP3';

  @override
  String get presetVideoToGifTitle => 'ವೀಡಿಯೊದಿಂದ GIF';

  @override
  String get presetVideoToGifBody => 'ಸಣ್ಣ ತುಣುಕನ್ನು ಅನಿಮೇಟೆಡ್ GIF ಆಗಿ';

  @override
  String get presetMergeTitle => 'ವೀಡಿಯೊಗಳನ್ನು ವಿಲೀನಗೊಳಿಸಿ';

  @override
  String get presetMergeBody => 'ತುಣುಕುಗಳನ್ನು ಕ್ರಮವಾಗಿ ಒಂದೇ MP4 ಆಗಿ ಜೋಡಿಸಿ';

  @override
  String get mergeNeedsTwo =>
      'ವಿಲೀನಗೊಳಿಸಲು ಕನಿಷ್ಠ ಎರಡು ವೀಡಿಯೊಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String mergedVideoName(int count) {
    return 'ವಿಲೀನಗೊಂಡ ವೀಡಿಯೊ ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ಫೋಟೋ ಸಂಕುಚಿಸಿ';

  @override
  String get presetCompressImageBody => 'ಚಿಕ್ಕ JPEG, ನಷ್ಟ ಕಣ್ಣಿಗೆ ಕಾಣುವುದಿಲ್ಲ';

  @override
  String get presetEnhancePhotoTitle => 'ಫೋಟೋ ಸುಧಾರಿಸಿ';

  @override
  String get presetEnhancePhotoBody => 'ಹೆಚ್ಚು ಸ್ವಚ್ಛ, ಹರಿತ, ಉತ್ತಮ ಬಣ್ಣ';

  @override
  String get presetImageToWebpTitle => 'ಫೋಟೋದಿಂದ WebP';

  @override
  String get presetImageToWebpBody => 'ಆಧುನಿಕ ಸ್ವರೂಪ, JPEG ಗಿಂತ ಚಿಕ್ಕದು';

  @override
  String get sizeTargetTitle => 'ಗುರಿ ಗಾತ್ರ';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'ಕಸ್ಟಮ್…';

  @override
  String get sizeTargetDialogTitle => 'MB ಯಲ್ಲಿ ಗುರಿ ಗಾತ್ರ';

  @override
  String get sizeTargetTooSmall =>
      'ಈ ಅವಧಿಗೆ ಗುರಿ ತುಂಬಾ ಚಿಕ್ಕದು; ಸಾಧ್ಯವಿರುವ ಅತ್ಯಂತ ಹತ್ತಿರದ ಗುಣಮಟ್ಟವನ್ನು ಬಳಸಲಾಗುತ್ತದೆ.';

  @override
  String estimatePerFile(String size) {
    return 'ಪ್ರತಿ ಫೈಲ್‌ಗೆ ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'ಅಂದಾಜು ಔಟ್‌ಪುಟ್: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'ಆಯ್ಕೆಯಾದ ಫೈಲ್‌ಗಳು: $count';
  }

  @override
  String get promiseOffline => '100% ಆಫ್‌ಲೈನ್ ಪರಿವರ್ತನೆ';

  @override
  String get promiseBatchFree => 'ಬ್ಯಾಚ್ ಉಚಿತ';

  @override
  String get promiseNoWatermark => 'ವಾಟರ್‌ಮಾರ್ಕ್ ಇಲ್ಲ';

  @override
  String get sectionTransform => 'ರೂಪಾಂತರ';

  @override
  String get rotateLabel => 'ತಿರುಗಿಸಿ';

  @override
  String get flipLabel => 'ಅಡ್ಡಲಾಗಿ ಪ್ರತಿಬಿಂಬಿಸಿ';

  @override
  String get speedLabel => 'ವೇಗ';

  @override
  String get cropLabel => 'ಕ್ರಾಪ್';

  @override
  String get cropHint =>
      'ಆಯ್ಕೆಮಾಡಿದ ಆಕಾರ ಅನುಪಾತಕ್ಕೆ ಮಧ್ಯಭಾಗವನ್ನು ಕ್ರಾಪ್ ಮಾಡುತ್ತದೆ — ಫೀಡ್‌ಗಳಿಗೆ ಚೌಕ, ಸ್ಟೋರಿಗಳಿಗೆ 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'ಧ್ವನಿ: $percent%';
  }

  @override
  String get addAudioFiles => 'ಆಡಿಯೊ ಮತ್ತು ಇತರ ಫೈಲ್‌ಗಳು';

  @override
  String get hwEncoderLabel => 'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್';

  @override
  String get hwEncoderHint =>
      'ಬಿಟ್‌ರೇಟ್ ಮತ್ತು ಗಾತ್ರಕ್ಕೆ-ಹೊಂದಿಸುವ ಮೋಡ್‌ಗಳಲ್ಲಿ ಸಾಧನದ ವೀಡಿಯೊ ಚಿಪ್ ಅನ್ನು ಬಳಸುತ್ತದೆ — ಬಹಳ ವೇಗ ಮತ್ತು ಕಡಿಮೆ ಬಿಸಿ. ಗುಣಮಟ್ಟ (CRF) ಮೋಡ್ ಯಾವಾಗಲೂ ನಿಖರವಾದ ಸಾಫ್ಟ್‌ವೇರ್ ಎನ್‌ಕೋಡರ್ ಅನ್ನು ಬಳಸುತ್ತದೆ, ಮತ್ತು ವಿಫಲವಾದ ಹಾರ್ಡ್‌ವೇರ್ ಕೆಲಸವು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಾಫ್ಟ್‌ವೇರ್‌ನಲ್ಲಿ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸುತ್ತದೆ.';

  @override
  String get transformNeedsReencode =>
      'ತಿರುಗಿಸುವಿಕೆ, ಪ್ರತಿಬಿಂಬ ಮತ್ತು ವೇಗಕ್ಕೆ ಮರು-ಎನ್‌ಕೋಡ್ ಅಗತ್ಯವಿದೆ, ಆದ್ದರಿಂದ ಸ್ಟ್ರೀಮ್ ಕಾಪಿಯ ಸಮಯದಲ್ಲಿ ಅವು ಆಫ್ ಆಗಿರುತ್ತವೆ.';

  @override
  String get capBitrateLabel => 'ಫೈಲ್ ಅನ್ನು ಎಂದಿಗೂ ದೊಡ್ಡದಾಗಿಸಬೇಡಿ';

  @override
  String get capBitrateHint =>
      'ಮೂಲದ ಸ್ವಂತ ಬಿಟ್‌ರೇಟ್‌ಗೆ ಎನ್‌ಕೋಡ್ ಅನ್ನು ಮಿತಿಗೊಳಿಸುತ್ತದೆ. ಸ್ಥಿರ ಗುಣಮಟ್ಟಕ್ಕೆ ತನ್ನದೇ ಆದ ಮೇಲ್ಮಿತಿ ಇಲ್ಲ, ಆದ್ದರಿಂದ ಈಗಾಗಲೇ ಸಂಕುಚಿತಗೊಂಡ ವೀಡಿಯೊ ಇಲ್ಲದಿದ್ದರೆ ದೊಡ್ಡದಾಗಿ ಹೊರಬರಬಹುದು.';

  @override
  String get keepSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಉಳಿಸಿಕೊಳ್ಳಿ';

  @override
  String get keepSubtitlesHint =>
      'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಔಟ್‌ಪುಟ್‌ಗೆ ಒಯ್ಯುತ್ತದೆ. ಪಠ್ಯ ಉಪಶೀರ್ಷಿಕೆಗಳು ಮಾತ್ರ.';

  @override
  String get sectionTrim => 'ಟ್ರಿಮ್';

  @override
  String get trimEnable => 'ಮೂಲವನ್ನು ಟ್ರಿಮ್ ಮಾಡಿ';

  @override
  String get trimHint => 'ತಿಳಿದ ಅವಧಿಯ ನಿಖರವಾಗಿ ಒಂದೇ ಫೈಲ್ ಸರತಿಯಲ್ಲಿದ್ದಾಗ ಲಭ್ಯ.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ಗುರಿ ಗಾತ್ರ';

  @override
  String get lowBatteryTitle => 'ಬ್ಯಾಟರಿ ಕಡಿಮೆಯಿದೆ';

  @override
  String get lowBatteryBody =>
      'ಪರಿವರ್ತನೆಯು ಪ್ರೊಸೆಸರ್‌ಗೆ ಸಾಕಷ್ಟು ಕೆಲಸ ಕೊಡುತ್ತದೆ. ಮೊದಲು ಚಾರ್ಜ್‌ಗೆ ಹಾಕಬಹುದು, ಅಥವಾ ಈಗಲೇ ಮುಂದುವರಿಯಬಹುದು.';

  @override
  String get lowBatteryContinue => 'ಹಾಗಿದ್ದರೂ ಪರಿವರ್ತಿಸಿ';

  @override
  String get commonCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get commonOk => 'ಸರಿ';

  @override
  String filesReceived(int count) {
    return 'ಸ್ವೀಕರಿಸಿದ ಫೈಲ್‌ಗಳು: $count';
  }

  @override
  String get saveFile => 'ಉಳಿಸಿ';

  @override
  String get savedToGallery =>
      'ಗ್ಯಾಲರಿಯಲ್ಲಿ “Eluna Media” ಆಲ್ಬಂನಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ.';

  @override
  String get savedToDownloads => 'ಡೌನ್‌ಲೋಡ್‌ಗಳಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ.';

  @override
  String get saveFailed => 'ಫೈಲ್ ಉಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get jobRemovedUndo => 'ಕೆಲಸವನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ.';

  @override
  String get finishedClearedUndo => 'ಪೂರ್ಣಗೊಂಡ ಕೆಲಸಗಳನ್ನು ತೆರವುಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get undo => 'ಹಿಂತಿರುಗಿಸಿ';

  @override
  String get errorDetailsTitle => 'ದೋಷದ ವಿವರಗಳು';

  @override
  String get sectionConversionPrefs => 'ಪರಿವರ್ತನೆ';

  @override
  String get powerModeLabel => 'ಪವರ್ ಮೋಡ್';

  @override
  String get powerEfficiency => 'ತಂಪು ಮತ್ತು ವೇಗ';

  @override
  String get powerBalanced => 'ಸಮತೋಲಿತ';

  @override
  String get powerQuality => 'ಗರಿಷ್ಠ ಸಂಕುಚನ';

  @override
  String get powerModeHint =>
      'ವೀಡಿಯೊ ಎನ್‌ಕೋಡರ್ ಎಷ್ಟು ಶ್ರಮಿಸುತ್ತದೆ ಎಂಬುದು. ತಂಪು ಮತ್ತು ವೇಗ ಎಂದರೆ ಫೈಲ್‌ಗಳು ಸ್ವಲ್ಪ ದೊಡ್ಡವಾಗುತ್ತವೆ. ಬೇರೆ ಯಾವುದನ್ನೂ ಎಂದಿಗೂ ನಿರ್ಬಂಧಿಸುವುದಿಲ್ಲ.';

  @override
  String get hapticsLabel => 'ಕಂಪನ ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String get networkPrivacyTitle => 'ನೆಟ್‌ವರ್ಕ್ ಮತ್ತು ಗೌಪ್ಯತೆ';

  @override
  String get netAuditIntro =>
      'ಈ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ನೆಟ್‌ವರ್ಕ್ ಅನ್ನು ಮುಟ್ಟಬಲ್ಲ ಎಲ್ಲದರ ಸಂಪೂರ್ಣ ಪಟ್ಟಿ.';

  @override
  String get netAuditNoneTitle => 'ನೆಟ್‌ವರ್ಕ್ ಪ್ರವೇಶವೇ ಇಲ್ಲ';

  @override
  String get netAuditNoneBody =>
      'ಅಪ್ಲಿಕೇಶನ್ ಇಂಟರ್ನೆಟ್ ಅನುಮತಿಯನ್ನು ಕೇಳುವುದಿಲ್ಲ, ಆದ್ದರಿಂದ ಪ್ರಯತ್ನಿಸಿದರೂ ಅದು ನೆಟ್‌ವರ್ಕ್ ತಲುಪಲಾರದು — ಸಿಸ್ಟಂನ ಅಪ್ಲಿಕೇಶನ್ ಮಾಹಿತಿಯಲ್ಲಿ ನೀವು ಅದನ್ನು ಪರಿಶೀಲಿಸಬಹುದು. ಜಾಹೀರಾತುಗಳಿಲ್ಲ, ಅನಾಲಿಟಿಕ್ಸ್ ಇಲ್ಲ, ಅಪ್‌ಡೇಟ್ ಪರಿಶೀಲನೆಗಳಿಲ್ಲ. “ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ರೇಟಿಂಗ್ ನೀಡಿ” ಎಂಬುದು ಸ್ಟೋರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಹಸ್ತಾಂತರಿಸುತ್ತದೆ, ಅದು ತನ್ನದೇ ಸಂವಹನವನ್ನು ನಡೆಸುತ್ತದೆ.';

  @override
  String get netAuditConversionTitle => 'ಪರಿವರ್ತನೆ';

  @override
  String get netAuditConversionBody =>
      'ಜೊತೆಗೆ ಸೇರಿಸಲಾದ FFmpeg ಮೂಲಕ ಸಂಪೂರ್ಣವಾಗಿ ಈ ಸಾಧನದಲ್ಲಿ ನಡೆಯುತ್ತದೆ. ಏರ್‌ಪ್ಲೇನ್ ಮೋಡ್ ಆನ್ ಮಾಡಿ ಪರಿವರ್ತಿಸಿ ನೋಡಿ — ಅದು ಕೆಲಸ ಮಾಡುತ್ತದೆ.';

  @override
  String get netAuditTelemetryTitle => 'ಟೆಲಿಮೆಟ್ರಿ';

  @override
  String get netAuditTelemetryBody =>
      'ಅದು ಇಲ್ಲವೇ ಇಲ್ಲ. ಅಪ್ಲಿಕೇಶನ್ ಯಾವುದೇ ಅನಾಲಿಟಿಕ್ಸ್, ಕ್ರ್ಯಾಶ್ ವರದಿಗಳು ಅಥವಾ ಗುರುತಿಸುವ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ, ಮತ್ತು ಖಾತೆ ವ್ಯವಸ್ಥೆಯೂ ಇಲ್ಲ.';

  @override
  String get netAuditTipsTitle => 'ಟಿಪ್‌ಗಳು';

  @override
  String get netAuditTipsBody =>
      'ಟಿಪ್ ಅನ್ನು Play Store ಅಪ್ಲಿಕೇಶನ್ ನಿರ್ವಹಿಸುತ್ತದೆ, ಈ ಅಪ್ಲಿಕೇಶನ್ ಅಲ್ಲ — ಇದಕ್ಕೆ ಈಗಲೂ ಇಂಟರ್ನೆಟ್ ಅನುಮತಿ ಇಲ್ಲ. ಬಿಲ್ಲಿಂಗ್ ಅನುಮತಿ ಪಟ್ಟಿಗೆ ಎರಡು ಸಾಲುಗಳನ್ನು ಸೇರಿಸುತ್ತದೆ: “ಇನ್-ಆಪ್ ಖರೀದಿಗಳು”, ಮತ್ತು “ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕಗಳನ್ನು ವೀಕ್ಷಿಸಿ” — ಇದು ಸಂಪರ್ಕವಿದೆಯೇ ಎಂಬುದನ್ನು ಮಾತ್ರ ಓದುತ್ತದೆ, ಅದನ್ನು ಬಳಸಲಾರದು. ಯಾವುದನ್ನೂ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಖರೀದಿಸಲಾಗುವುದಿಲ್ಲ, ಮತ್ತು ಟಿಪ್ ಏನನ್ನೂ ಅನ್‌ಲಾಕ್ ಮಾಡುವುದಿಲ್ಲ: ಇಲ್ಲಿ ಪ್ರತಿಯೊಂದು ವೈಶಿಷ್ಟ್ಯವೂ ಉಚಿತ.';

  @override
  String get sectionSupport => 'ಬೆಂಬಲ';

  @override
  String get rateApp => 'ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ರೇಟಿಂಗ್ ನೀಡಿ';

  @override
  String get openLicenses => 'ಓಪನ್ ಸೋರ್ಸ್ ಪರವಾನಗಿಗಳು';

  @override
  String get presetAudioToMp3Title => 'ಆಡಿಯೊ ಪರಿವರ್ತಿಸಿ';

  @override
  String get presetAudioToMp3Body => 'MP3 ಗೆ — ಎಲ್ಲದರಲ್ಲೂ ಪ್ಲೇ ಆಗುತ್ತದೆ';

  @override
  String get presetCompressAudioTitle => 'ಆಡಿಯೊ ಸಂಕುಚಿಸಿ';

  @override
  String get presetCompressAudioBody =>
      'ಹಗುರವಾದ AAC — ಧ್ವನಿ ಟಿಪ್ಪಣಿಗಳು, ಪಾಡ್‌ಕಾಸ್ಟ್‌ಗಳು';

  @override
  String get convertTo => 'ಇದಕ್ಕೆ ಪರಿವರ್ತಿಸಿ';

  @override
  String get formatSectionHint =>
      'ನಿಮ್ಮ ಫೈಲ್‌ಗಳು ನಿಜವಾಗಿಯೂ ಆಗಬಲ್ಲ ಸ್ವರೂಪಗಳನ್ನು ಮಾತ್ರ ಪಟ್ಟಿ ಮಾಡಲಾಗಿದೆ.';

  @override
  String get sourceVideo => 'ವೀಡಿಯೊ';

  @override
  String get sourceImage => 'ಫೋಟೋ';

  @override
  String get sourceAudio => 'ಆಡಿಯೊ';

  @override
  String get sourceUnknown => 'ಫೈಲ್';

  @override
  String get mixedSelectionTitle => 'ಬೇರೆ ಬೇರೆ ಬಗೆಯ ಫೈಲ್‌ಗಳು ಆಯ್ಕೆಯಾಗಿವೆ';

  @override
  String get mixedSelectionBody =>
      'ಪ್ರತಿ ಫೈಲ್ ಅನ್ನು ಅದರ ಸ್ವಂತ ಬಗೆಗೆ ಅತ್ಯುತ್ತಮವಾದ ಪ್ರಿಸೆಟ್‌ನೊಂದಿಗೆ ಪರಿವರ್ತಿಸಲಾಗುತ್ತದೆ. ಪೂರ್ಣ ನಿಯಂತ್ರಣಕ್ಕಾಗಿ ಒಂದೊಂದೇ ಬಗೆಯನ್ನು ಸೇರಿಸಿ.';

  @override
  String get filesTitle => 'ಫೈಲ್‌ಗಳು';

  @override
  String get removeFile => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String timeLeft(String time) {
    return '≈ $time ಬಾಕಿ';
  }

  @override
  String get jobSettingsTitle => 'ಪರಿವರ್ತನೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get jobDetails => 'ವಿವರಗಳು';

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
  String get summaryEnhanced => 'ಸುಧಾರಿಸಲಾಗಿದೆ';

  @override
  String get summaryMetadataStripped => 'ಮೆಟಾಡೇಟಾ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String summaryMerge(int count) {
    return 'ವಿಲೀನಗೊಂಡ ತುಣುಕುಗಳು: $count';
  }

  @override
  String get shareApp => 'ಅಪ್ಲಿಕೇಶನ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get shareAppText =>
      'Eluna Media — ಉಚಿತ, ಸಂಪೂರ್ಣ ಆಫ್‌ಲೈನ್ ಫೋಟೋ, ವೀಡಿಯೊ ಮತ್ತು ಆಡಿಯೊ ಪರಿವರ್ತಕ. ಚಂದಾದಾರಿಕೆಗಳಿಲ್ಲ, ವಾಟರ್‌ಮಾರ್ಕ್‌ಗಳಿಲ್ಲ, ಖಾತೆಗಳಿಲ್ಲ.';

  @override
  String appVersionLabel(String version) {
    return 'ಆವೃತ್ತಿ $version';
  }

  @override
  String get openFile => 'ತೆರೆಯಿರಿ';

  @override
  String get openFolder => 'ಫೋಲ್ಡರ್ ತೋರಿಸಿ';

  @override
  String get noAppToOpen =>
      'ಆ ಫೈಲ್ ಅನ್ನು ತೆರೆಯಬಲ್ಲ ಯಾವುದೇ ಅಪ್ಲಿಕೇಶನ್ ಈ ಸಾಧನದಲ್ಲಿ ಇಲ್ಲ.';

  @override
  String get openFailed => 'ಫೈಲ್ ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get twoPassLabel => 'ನಿಖರ ಗಾತ್ರಕ್ಕಾಗಿ ಎರಡು-ಪಾಸ್';

  @override
  String get twoPassHint =>
      'ಗಾತ್ರಕ್ಕೆ-ಹೊಂದಿಸುವ ಕೆಲಸಗಳು ಎರಡು ಬಾರಿ ಎನ್‌ಕೋಡ್ ಆಗುತ್ತವೆ ಮತ್ತು ಬೈಟ್ ಮಿತಿಯನ್ನು ಗಮನಾರ್ಹವಾಗಿ ಹೆಚ್ಚು ನಿಖರವಾಗಿ ಮುಟ್ಟುತ್ತವೆ — ಸುಮಾರು ಎರಡು ಪಟ್ಟು ಸಮಯ ಮತ್ತು ಬ್ಯಾಟರಿಯ ವೆಚ್ಚದಲ್ಲಿ.';

  @override
  String get whatsNewTitle => 'ಹೊಸದೇನಿದೆ';

  @override
  String get whatsNew1 =>
      'ವೀಡಿಯೊ ಈಗ AV1 ಆಗಬಹುದು: ಗಮನಾರ್ಹವಾಗಿ ಚಿಕ್ಕ ಫೈಲ್‌ಗಳು, ನೀವು ಕಾಯಲು ಸಿದ್ಧರಿದ್ದರೆ.';

  @override
  String get whatsNew2 =>
      'ಚಿತ್ರಗಳಿಗೆ ಹೊಸತು: AVIF — ಸುಮಾರು JPEG ನ ಅರ್ಧದಷ್ಟು — ಮತ್ತು GIF ಬದಲಿಗೆ ಅನಿಮೇಟೆಡ್ WebP.';

  @override
  String get whatsNew3 => 'M4A ನಷ್ಟರಹಿತವಾಗಬಹುದು — ALAC ಈಗ AAC ಪಕ್ಕದಲ್ಲಿದೆ.';

  @override
  String get whatsNew4 =>
      'ಗೋಚರಿಕೆಗೆ ಒಂದೇ ಪರದೆ: ಪ್ರಕಾಶ, ಆಕ್ಸೆಂಟ್ ಬಣ್ಣ, ಶುದ್ಧ ಕಪ್ಪು OLED ಮತ್ತು Material You.';

  @override
  String get whatsNew5 =>
      'ಸಾಧನೆಗಳಿಗೆ ಪದಕಗಳು, ಮೂರು ಟ್ಯಾಬ್‌ಗಳು ಮತ್ತು ಚಿತ್ರವಾಗಿ ಹಂಚಿಕೊಳ್ಳಬಹುದಾದ ಪ್ರಗತಿ.';

  @override
  String get achievementsTitle => 'ಸಾಧನೆಗಳು';

  @override
  String achievementsProgress(int done, int total) {
    return '$total ರಲ್ಲಿ $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಮಾತ್ರ ಎಣಿಸಲಾಗುತ್ತದೆ. ಏನನ್ನೂ ಎಲ್ಲಿಗೂ ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get achFirstConversionTitle => 'ಮೊದಲ ಹೆಜ್ಜೆಗಳು';

  @override
  String get achFirstConversionBody => 'ನಿಮ್ಮ ಮೊದಲ ಫೈಲ್ ಅನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achTenConversionsTitle => 'ಬಿಸಿಯೇರಿತು';

  @override
  String get achTenConversionsBody => '10 ಫೈಲ್‌ಗಳನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achFiftyConversionsTitle => 'ನಿಯಮಿತ';

  @override
  String get achFiftyConversionsBody => '50 ಫೈಲ್‌ಗಳನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achTwoHundredConversionsTitle => 'ದುಡಿಮೆಗಾರ';

  @override
  String get achTwoHundredConversionsBody => '200 ಫೈಲ್‌ಗಳನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achThousandConversionsTitle => 'ಕನ್ವೇಯರ್';

  @override
  String get achThousandConversionsBody => '1000 ಫೈಲ್‌ಗಳನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achSaved100MbTitle => 'ಸ್ಥಳ ಉಳಿತಾಯಗಾರ';

  @override
  String get achSaved100MbBody => 'ಒಟ್ಟು 100 MB ಮುಕ್ತಗೊಳಿಸಿ.';

  @override
  String get achSaved1GbTitle => 'ಗಿಗಾಬೈಟ್ ಬೇಟೆಗಾರ';

  @override
  String get achSaved1GbBody => 'ಒಟ್ಟು 1 GB ಮುಕ್ತಗೊಳಿಸಿ.';

  @override
  String get achSaved10GbTitle => 'ಸಂಗ್ರಹಣೆಯ ನಾಯಕ';

  @override
  String get achSaved10GbBody => 'ಒಟ್ಟು 10 GB ಮುಕ್ತಗೊಳಿಸಿ.';

  @override
  String get achBatchOfFiveTitle => 'ಬ್ಯಾಚ್ ಕೆಲಸಗಾರ';

  @override
  String get achBatchOfFiveBody =>
      '5 ಅಥವಾ ಹೆಚ್ಚು ಫೈಲ್‌ಗಳ ಬ್ಯಾಚ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ.';

  @override
  String get achBatchOfTwentyTitle => 'ಜೋಡಣಾ ಸಾಲು';

  @override
  String get achBatchOfTwentyBody =>
      '20 ಅಥವಾ ಹೆಚ್ಚು ಫೈಲ್‌ಗಳ ಬ್ಯಾಚ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ.';

  @override
  String get achSniperTitle => 'ಸ್ನೈಪರ್';

  @override
  String get achSniperBody =>
      'ಗಾತ್ರಕ್ಕೆ-ಹೊಂದಿಸುವಿಕೆಯಿಂದ ನಿಖರ ಗಾತ್ರವನ್ನು ಮುಟ್ಟಿ.';

  @override
  String get achMemeSmithTitle => 'ಮೀಮ್ ಶಿಲ್ಪಿ';

  @override
  String get achMemeSmithBody => 'ಒಂದು ವೀಡಿಯೊವನ್ನು GIF ಆಗಿ ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achSoundHunterTitle => 'ಧ್ವನಿ ಬೇಟೆಗಾರ';

  @override
  String get achSoundHunterBody => 'ವೀಡಿಯೊದಿಂದ ಆಡಿಯೊ ಹೊರತೆಗೆಯಿರಿ.';

  @override
  String get achSubtitleKeeperTitle => 'ಉಪಶೀರ್ಷಿಕೆ ರಕ್ಷಕ';

  @override
  String get achSubtitleKeeperBody =>
      'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಉಳಿಸಿಕೊಂಡು ಒಂದು ವೀಡಿಯೊವನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achDirectorTitle => 'ನಿರ್ದೇಶಕ';

  @override
  String get achDirectorBody =>
      'ಒಂದು ರೂಪಾಂತರವನ್ನು ಅನ್ವಯಿಸಿ — ತಿರುಗಿಸುವಿಕೆ, ಕ್ರಾಪ್, ವೇಗ ಅಥವಾ ಧ್ವನಿ.';

  @override
  String get achAllRounderTitle => 'ಸರ್ವಸಮರ್ಥ';

  @override
  String get achAllRounderBody =>
      'ವೀಡಿಯೊ, ಆಡಿಯೊ ಮತ್ತು ಒಂದು ಚಿತ್ರವನ್ನು ಪರಿವರ್ತಿಸಿ.';

  @override
  String get achNightOwlTitle => 'ರಾತ್ರಿ ಹಕ್ಕಿ';

  @override
  String get achNightOwlBody =>
      'ಮಧ್ಯರಾತ್ರಿ ಮತ್ತು ಬೆಳಗ್ಗೆ 5 ಗಂಟೆಯ ನಡುವೆ ಒಂದು ಪರಿವರ್ತನೆಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ.';

  @override
  String get achPlatinumTitle => 'ಪ್ಲಾಟಿನಂ';

  @override
  String get achPlatinumBody => 'ಉಳಿದ ಎಲ್ಲಾ ಸಾಧನೆಗಳನ್ನು ಗಳಿಸಿ.';

  @override
  String get storageTitle => 'ಸಂಗ್ರಹಣೆ';

  @override
  String get storageBody =>
      'ಪರಿವರ್ತಿತ ಫೈಲ್‌ಗಳು ನೀವು ಅವನ್ನು ಉಳಿಸುವ ಅಥವಾ ಹಂಚಿಕೊಳ್ಳುವ ತನಕ ಅಪ್ಲಿಕೇಶನ್‌ನ ಒಳಗೇ ಇರುತ್ತವೆ — ಅಲ್ಲಿಗೆ ಯಾವ ಫೈಲ್ ಮ್ಯಾನೇಜರ್ ಕೂಡ ತಲುಪಲಾರದು.';

  @override
  String get storageEmpty => 'ಏನೂ ಸಂಗ್ರಹವಾಗಿಲ್ಲ';

  @override
  String storageUsage(String size) {
    return 'ಸಂಗ್ರಹಿಸಲಾಗಿದೆ: $size';
  }

  @override
  String get storageClearTitle => 'ಸಂಗ್ರಹಿಸಿದ ಫೈಲ್‌ಗಳನ್ನು ತೆರವುಗೊಳಿಸಬೇಕೆ?';

  @override
  String get storageClearBody =>
      'ಅಪ್ಲಿಕೇಶನ್ ಇನ್ನೂ ಹಿಡಿದಿಟ್ಟಿರುವ ಎಲ್ಲಾ ಪೂರ್ಣಗೊಂಡ ಫಲಿತಾಂಶಗಳನ್ನು ಅಳಿಸುತ್ತದೆ. ನೀವು ಈಗಾಗಲೇ ಉಳಿಸಿದ ಅಥವಾ ಹಂಚಿಕೊಂಡ ಫೈಲ್‌ಗಳಿಗೆ ಏನೂ ಆಗುವುದಿಲ್ಲ.';

  @override
  String get storageClearAction => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String storageCleared(String size) {
    return '$size ಮುಕ್ತಗೊಳಿಸಲಾಗಿದೆ';
  }

  @override
  String get autoSaveLabel => 'ಫಲಿತಾಂಶಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಉಳಿಸಿ';

  @override
  String get autoSaveHint =>
      'ಪೂರ್ಣಗೊಂಡ ಪ್ರತಿ ಫೈಲ್ ಅನ್ನು ಸಿದ್ಧವಾದ ಕೂಡಲೇ ಗ್ಯಾಲರಿಯಲ್ಲಿ — ಆಡಿಯೊವನ್ನು ಡೌನ್‌ಲೋಡ್‌ಗಳಲ್ಲಿ — ಇರಿಸುತ್ತದೆ.';

  @override
  String get lowSpaceTitle => 'ಹೆಚ್ಚು ಜಾಗ ಉಳಿದಿಲ್ಲ';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ಈ ಬ್ಯಾಚ್‌ಗೆ ಸುಮಾರು $needed ಬೇಕು ಮತ್ತು $free ಮಾತ್ರ ಖಾಲಿ ಇದೆ. ಪರಿವರ್ತನೆ ಮಧ್ಯದಲ್ಲೇ ನಿಂತುಹೋಗಬಹುದು.';
  }

  @override
  String saveAll(int count) {
    return 'ಎಲ್ಲವನ್ನೂ ಉಳಿಸಿ ($count)';
  }

  @override
  String savedAll(int count) {
    return 'ಉಳಿಸಲಾಗಿದೆ: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total ರಲ್ಲಿ $saved ಉಳಿಸಲಾಗಿದೆ';
  }

  @override
  String get presetFitPhotoTitle => 'ಫೋಟೋವನ್ನು ಗಾತ್ರಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get presetFitPhotoBody =>
      'ಚಿತ್ರವನ್ನು ನಿಖರ ಮಿತಿಯೊಳಗೆ ಅಡಕಗೊಳಿಸಿ — ಅಪ್‌ಲೋಡ್ ಫಾರ್ಮ್‌ಗಳು, ಅರ್ಜಿಗಳು.';

  @override
  String get photoFitHint =>
      'ಒಂದು ಹೊಂದುವ ತನಕ ಅಪ್ಲಿಕೇಶನ್ ಬೇರೆ ಬೇರೆ ಗುಣಮಟ್ಟಗಳನ್ನು ಪ್ರಯತ್ನಿಸುತ್ತದೆ. ಚಿತ್ರಕ್ಕೆ ಮಿತಿ ತೀರಾ ಚಿಕ್ಕದಾದರೆ ಅದು ಫ್ರೇಮ್ ಗಾತ್ರವನ್ನೂ ಕಡಿಮೆ ಮಾಡುತ್ತದೆ.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'KB ಯಲ್ಲಿ ಗುರಿ ಗಾತ್ರ';

  @override
  String get compareAction => 'ಹೋಲಿಸಿ';

  @override
  String get compareBefore => 'ಮೊದಲು';

  @override
  String get compareAfter => 'ನಂತರ';

  @override
  String get compareHint => 'ಮೂಲವನ್ನು ನೋಡಲು ಒತ್ತಿ ಹಿಡಿಯಿರಿ.';

  @override
  String get trimStart => 'ಪ್ರಾರಂಭ';

  @override
  String get trimEnd => 'ಅಂತ್ಯ';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration ವರೆಗೆ';
  }

  @override
  String get imageScaleLabel => 'ಸ್ಕೇಲ್';

  @override
  String get audioChannelsLabel => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get audioMono => 'ಮೊನೊ';

  @override
  String get audioStereo => 'ಸ್ಟೀರಿಯೊ';

  @override
  String get sampleRateLabel => 'ಸ್ಯಾಂಪಲ್ ದರ';

  @override
  String get voiceAudioHint =>
      '22.05 kHz ನಲ್ಲಿ ಮೊನೊ ಒಂದು ಧ್ವನಿ ರೆಕಾರ್ಡಿಂಗ್ ಅನ್ನು ಕೇಳಿಸುವ ನಷ್ಟವಿಲ್ಲದೆ ಸುಮಾರು ಕಾಲು ಭಾಗಕ್ಕೆ ಇಳಿಸುತ್ತದೆ. ಸಂಗೀತಕ್ಕೆ ಎರಡನ್ನೂ ಮೂಲದಂತೆಯೇ ಬಿಡಿ.';

  @override
  String get moveUp => 'ಮೇಲಕ್ಕೆ ಸರಿಸಿ';

  @override
  String get moveDown => 'ಕೆಳಕ್ಕೆ ಸರಿಸಿ';

  @override
  String get renameOutput => 'ಫಲಿತಾಂಶವನ್ನು ಮರುಹೆಸರಿಸಿ';

  @override
  String get renameOutputHint => 'ಹೊಸ ಹೆಸರು';

  @override
  String get renameOutputHelp =>
      'ವಿಸ್ತರಣೆಯು ಔಟ್‌ಪುಟ್ ಸ್ವರೂಪದಿಂದ ಬರುತ್ತದೆ. ಫಲಿತಾಂಶಕ್ಕೆ ಮೂಲದ ಹೆಸರನ್ನೇ ಇಡಲು ಇದನ್ನು ಖಾಲಿ ಬಿಡಿ.';

  @override
  String deleteOriginalsAction(int count) {
    return 'ಮೂಲಗಳನ್ನು ಅಳಿಸಿ ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'ಪರಿವರ್ತನೆಯ ನಂತರ ಮೂಲಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteOriginalsHint =>
      'ಫಲಿತಾಂಶವನ್ನು ಉಳಿಸಿದ ಬಳಿಕ ಮೂಲ ಫೈಲ್‌ಗಳನ್ನು ತೆಗೆದುಹಾಕುವಂತೆ ಸಿಸ್ಟಂಗೆ ಕೇಳುತ್ತದೆ. ಏನು ಹೋಗುತ್ತದೆ ಎಂಬುದನ್ನು ಸಿಸ್ಟಂ ಯಾವಾಗಲೂ ತೋರಿಸುತ್ತದೆ ಮತ್ತು ನಿಮ್ಮ ದೃಢೀಕರಣಕ್ಕಾಗಿ ಕಾಯುತ್ತದೆ.';

  @override
  String get mediaAccessRequired =>
      'ಮೂಲ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಲು ಮೀಡಿಯಾ ಲೈಬ್ರರಿ ಪ್ರವೇಶ ಅಗತ್ಯವಿದೆ.';

  @override
  String originalsDeleted(String size) {
    return 'ಮೂಲಗಳನ್ನು ಅಳಿಸಲಾಗಿದೆ — $size ಮುಕ್ತವಾಗಿದೆ';
  }

  @override
  String get originalsNoneDeleted =>
      'ಏನನ್ನೂ ಅಳಿಸಲಾಗಿಲ್ಲ. ಗ್ಯಾಲರಿ ಈಗಲೂ ಅವುಗಳ ಮೂಲ ಹೆಸರಿನಲ್ಲಿ ಹಿಡಿದಿಟ್ಟಿರುವ ಫೈಲ್‌ಗಳನ್ನು ಮಾತ್ರ ಹುಡುಕಲು ಸಾಧ್ಯ.';

  @override
  String reclaimedTotal(String size) {
    return 'ಈ ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಮುಕ್ತಗೊಳಿಸಿದ್ದು: $size';
  }

  @override
  String get deleteAllData => 'ಎಲ್ಲಾ ಡೇಟಾ ಅಳಿಸಿ';

  @override
  String get deleteAllDataHint =>
      'ಅಪ್ಲಿಕೇಶನ್ ಈ ಸಾಧನದಲ್ಲಿ ಇಟ್ಟುಕೊಂಡಿರುವ ಎಲ್ಲವನ್ನೂ ಅಳಿಸುತ್ತದೆ: ಸರತಿ, ಪರಿವರ್ತಿತ ಫೈಲ್‌ಗಳು, ಪೂರ್ವವೀಕ್ಷಣೆಗಳು, ಸಾಧನೆಗಳು ಮತ್ತು ಸೆಟ್ಟಿಂಗ್‌ಗಳು. ನೀವು ಈಗಾಗಲೇ ಗ್ಯಾಲರಿಗೆ ಉಳಿಸಿದ ಫೈಲ್‌ಗಳನ್ನು ಮುಟ್ಟುವುದಿಲ್ಲ.';

  @override
  String get codecCopy => 'ಕಾಪಿ';

  @override
  String get codecCopyRemux => 'ಕಾಪಿ (ರೀಮಕ್ಸ್)';

  @override
  String get codecNoVideo => 'ವೀಡಿಯೊ ಇಲ್ಲ';

  @override
  String get codecNoAudio => 'ಆಡಿಯೊ ಇಲ್ಲ';

  @override
  String codecLossless(String codec) {
    return '$codec (ನಷ್ಟರಹಿತ)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (ಅನಿಮೇಟೆಡ್)';
  }

  @override
  String get sizeTargetEmail => 'ಇಮೇಲ್';

  @override
  String get trimTimeHint => 'm:ss';
}
