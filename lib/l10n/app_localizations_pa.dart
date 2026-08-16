// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class L10nPa extends L10n {
  L10nPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'ਬਦਲੋ';

  @override
  String get tabQueue => 'ਕਤਾਰ';

  @override
  String get addFiles => 'ਫ਼ਾਈਲਾਂ ਜੋੜੋ';

  @override
  String get emptySelectionTitle => 'ਅਜੇ ਕੋਈ ਫ਼ਾਈਲ ਨਹੀਂ';

  @override
  String get emptySelectionBody =>
      'ਫ਼ੋਟੋਆਂ, ਵੀਡੀਓ ਜਾਂ ਆਡੀਓ ਜੋੜੋ। ਸਭ ਕੁਝ ਇਸੇ ਡੀਵਾਈਸ ਉੱਤੇ ਹੀ ਪ੍ਰੋਸੈੱਸ ਹੁੰਦਾ ਹੈ।';

  @override
  String get sectionOutput => 'ਆਊਟਪੁੱਟ';

  @override
  String get sectionVideo => 'ਵੀਡੀਓ';

  @override
  String get sectionAudio => 'ਆਡੀਓ';

  @override
  String get sectionImage => 'ਤਸਵੀਰ';

  @override
  String get sectionPrivacy => 'ਨਿੱਜਤਾ';

  @override
  String get outputFormat => 'ਫਾਰਮੈਟ';

  @override
  String get videoCodec => 'ਵੀਡੀਓ ਕੋਡੈਕ';

  @override
  String get audioCodec => 'ਆਡੀਓ ਕੋਡੈਕ';

  @override
  String get rateControl => 'ਰੇਟ ਕੰਟਰੋਲ';

  @override
  String get rateControlQuality => 'ਸਥਿਰ ਗੁਣਵੱਤਾ (CRF)';

  @override
  String get rateControlBitrate => 'ਟੀਚਾ ਬਿੱਟਰੇਟ';

  @override
  String crfLabel(int value) {
    return 'ਗੁਣਵੱਤਾ (CRF $value)';
  }

  @override
  String get crfHint => 'ਘੱਟ ਮੁੱਲ ਦਾ ਮਤਲਬ ਬਿਹਤਰ ਗੁਣਵੱਤਾ ਅਤੇ ਵੱਡੀ ਫ਼ਾਈਲ।';

  @override
  String videoBitrate(int value) {
    return 'ਵੀਡੀਓ ਬਿੱਟਰੇਟ: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ਆਡੀਓ ਬਿੱਟਰੇਟ: $value kbps';
  }

  @override
  String get encodingPreset => 'ਏਨਕੋਡਰ ਪ੍ਰੀਸੈੱਟ';

  @override
  String get encodingPresetHint =>
      'ਹੌਲੀ ਪ੍ਰੀਸੈੱਟ ਬਿਹਤਰ ਸੰਕੁਚਨ ਕਰਦੇ ਹਨ, ਪਰ ਡੀਵਾਈਸ ਨੂੰ ਵੱਧ ਗਰਮ ਕਰਦੇ ਹਨ।';

  @override
  String get presetOriginal => 'ਅਸਲੀ';

  @override
  String get resolution => 'ਰੈਜ਼ੋਲਿਊਸ਼ਨ';

  @override
  String get frameRate => 'ਫ੍ਰੇਮ ਰੇਟ';

  @override
  String imageQuality(int value) {
    return 'ਗੁਣਵੱਤਾ: $value';
  }

  @override
  String get lossless => 'ਬਿਨਾਂ ਨੁਕਸਾਨ';

  @override
  String get losslessHint => 'ਫ਼ਾਈਲਾਂ ਵੱਡੀਆਂ, ਨਤੀਜਾ ਪਿਕਸਲ ਦਰ ਪਿਕਸਲ ਹੂਬਹੂ।';

  @override
  String get sectionEnhance => 'ਸੁਧਾਰ';

  @override
  String get sharpenLabel => 'ਤਿੱਖਾਪਣ';

  @override
  String get sharpenHint =>
      'ਕਿਨਾਰਿਆਂ ਨੂੰ ਵੱਧ ਸਾਫ਼ ਕਰਦਾ ਹੈ। ਧੁੰਦਲੀ ਜਾਂ ਫੋਕਸ ਤੋਂ ਬਾਹਰ ਖਿੱਚੀ ਤਸਵੀਰ ਇਹ ਵਾਪਸ ਨਹੀਂ ਲਿਆ ਸਕਦਾ — ਉਹ ਵੇਰਵਾ ਫ਼ਾਈਲ ਵਿੱਚ ਹੈ ਹੀ ਨਹੀਂ।';

  @override
  String get sharpenStrongHint =>
      'ਤੇਜ਼ ਤਿੱਖਾਪਣ ਕਿਨਾਰਿਆਂ ਦੇ ਨਾਲ ਚਮਕਦਾਰ ਹਾਲੇ ਛੱਡ ਸਕਦਾ ਹੈ। ਪਹਿਲਾਂ ਦਰਮਿਆਨਾ ਅਜ਼ਮਾਓ।';

  @override
  String get denoiseLabel => 'ਸ਼ੋਰ ਘਟਾਉਣਾ';

  @override
  String get denoiseHint =>
      'ਹਨੇਰੀਆਂ ਅਤੇ ਰਾਤ ਦੀਆਂ ਤਸਵੀਰਾਂ ਦਾ ਦਾਣਾਪਣ ਸਾਫ਼ ਕਰਦਾ ਹੈ। ਵੱਧ ਹੋਵੇ ਤਾਂ ਬਾਰੀਕ ਵੇਰਵਾ ਵੀ ਮਿਟ ਜਾਂਦਾ ਹੈ।';

  @override
  String get autoColorLabel => 'ਆਪਣੇ-ਆਪ ਰੰਗ ਤੇ ਪੱਧਰ';

  @override
  String get autoColorHint =>
      'ਕੰਟ੍ਰਾਸਟ ਨੂੰ ਖਿੱਚਦਾ ਹੈ ਅਤੇ ਫਿੱਕੇ ਰੰਗਾਂ ਨੂੰ ਥੋੜ੍ਹਾ ਉਭਾਰਦਾ ਹੈ।';

  @override
  String get upscaleLabel => '2× ਵੱਡਾ ਕਰੋ';

  @override
  String get upscaleHint =>
      'ਚੌੜਾਈ ਅਤੇ ਉਚਾਈ ਦੁੱਗਣੀ ਕਰਦਾ ਹੈ। ਇਹ ਵੇਰਵਾ ਨਹੀਂ ਜੋੜਦਾ — ਛਪਾਈ ਜਾਂ ਕੱਟਣ ਵੇਲੇ ਕੰਮ ਆਉਂਦਾ ਹੈ।';

  @override
  String get upscaleConflictHint =>
      'ਵੱਡਾ ਕਰਨ ਲਈ ਰੈਜ਼ੋਲਿਊਸ਼ਨ ਨੂੰ ਵਾਪਸ ਅਸਲੀ ਉੱਤੇ ਲਿਆਓ।';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ਬੰਦ';

  @override
  String get enhanceLight => 'ਹਲਕਾ';

  @override
  String get enhanceMedium => 'ਦਰਮਿਆਨਾ';

  @override
  String get enhanceStrong => 'ਤੇਜ਼';

  @override
  String get stripMetadata => 'ਮੈਟਾਡਾਟਾ ਹਟਾਓ';

  @override
  String get stripMetadataHint =>
      'ਨਤੀਜੇ ਵਿੱਚੋਂ EXIF, GPS ਅਤੇ ਸਮਾਂ-ਮੋਹਰਾਂ ਹਟਾ ਦਿੰਦਾ ਹੈ।';

  @override
  String startConversion(int count) {
    return 'ਫ਼ਾਈਲਾਂ ਬਦਲੋ ($count)';
  }

  @override
  String get batchResumed => 'ਵਿਚਾਲੇ ਰੁਕੀ ਤਬਦੀਲੀ ਮੁੜ ਸ਼ੁਰੂ ਕੀਤੀ ਗਈ।';

  @override
  String get converting => 'ਬਦਲਿਆ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get cancelBatch => 'ਰੋਕੋ';

  @override
  String get cancelJob => 'ਰੱਦ ਕਰੋ';

  @override
  String get clearFinished => 'ਮੁਕੰਮਲ ਹੋਏ ਸਾਫ਼ ਕਰੋ';

  @override
  String get removeJob => 'ਹਟਾਓ';

  @override
  String get shareFile => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get retryJob => 'ਮੁੜ ਕੋਸ਼ਿਸ਼';

  @override
  String get queueEmptyTitle => 'ਕਤਾਰ ਖ਼ਾਲੀ ਹੈ';

  @override
  String get queueEmptyBody => 'ਬਦਲੋ ਟੈਬ ਉੱਤੇ ਜੋੜੀਆਂ ਫ਼ਾਈਲਾਂ ਇੱਥੇ ਦਿਖਦੀਆਂ ਹਨ।';

  @override
  String queueActiveTab(int count) {
    return 'ਚਾਲੂ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'ਮੁਕੰਮਲ · $count';
  }

  @override
  String get queueNoActiveTitle => 'ਕੁਝ ਵੀ ਚੱਲ ਨਹੀਂ ਰਿਹਾ';

  @override
  String get queueNoActiveBody =>
      'ਉਡੀਕ ਕਰ ਰਹੀਆਂ ਜਾਂ ਬਦਲੀਆਂ ਜਾ ਰਹੀਆਂ ਫ਼ਾਈਲਾਂ ਇੱਥੇ ਦਿਖਦੀਆਂ ਹਨ।';

  @override
  String get queueNoFinishedTitle => 'ਅਜੇ ਕੁਝ ਮੁਕੰਮਲ ਨਹੀਂ ਹੋਇਆ';

  @override
  String get queueNoFinishedBody =>
      'ਬਦਲੀਆਂ ਫ਼ਾਈਲਾਂ ਇੱਥੇ ਆਉਂਦੀਆਂ ਹਨ — ਖੋਲ੍ਹਣ, ਸੰਭਾਲਣ ਜਾਂ ਸਾਂਝਾ ਕਰਨ ਲਈ ਤਿਆਰ।';

  @override
  String get statusQueued => 'ਕਤਾਰ ਵਿੱਚ';

  @override
  String get statusRunning => 'ਬਦਲਿਆ ਜਾ ਰਿਹਾ';

  @override
  String get statusCompleted => 'ਹੋ ਗਿਆ';

  @override
  String get statusFailed => 'ਅਸਫਲ';

  @override
  String get statusCancelled => 'ਰੱਦ ਕੀਤਾ';

  @override
  String batchSummary(int done, int total) {
    return '$total ਵਿੱਚੋਂ $done ਹੋ ਗਈਆਂ';
  }

  @override
  String batchCompleted(int done) {
    return 'ਬਦਲੀਆਂ ਫ਼ਾਈਲਾਂ: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done ਬਦਲੀਆਂ, $failed ਅਸਫਲ।';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% ਛੋਟੀ';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% ਵੱਡੀ';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get themeSystem => 'ਸਿਸਟਮ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get languageSystem => 'ਸਿਸਟਮ';

  @override
  String get privacyTitle => 'ਨਿੱਜਤਾ';

  @override
  String get privacyBody =>
      'Eluna Media ਤੁਹਾਡੀਆਂ ਫ਼ਾਈਲਾਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਇਸੇ ਡੀਵਾਈਸ ਉੱਤੇ, ਨਾਲ ਦਿੱਤੀ FFmpeg ਦੀ ਕਾਪੀ ਨਾਲ ਬਦਲਦਾ ਹੈ। ਤੁਹਾਡੀਆਂ ਫ਼ਾਈਲਾਂ ਕਦੇ ਡੀਵਾਈਸ ਤੋਂ ਬਾਹਰ ਨਹੀਂ ਜਾਂਦੀਆਂ, ਕਿਸੇ ਖਾਤੇ ਦੀ ਲੋੜ ਨਹੀਂ, ਅਤੇ ਕੋਈ ਟੈਲੀਮੈਟਰੀ ਨਹੀਂ ਹੈ। ਐਪ ਵਿੱਚ ਕੁਝ ਵੀ ਨੈੱਟਵਰਕ ਨਹੀਂ ਵਰਤਦਾ — ਇਸ ਕੋਲ ਇੰਟਰਨੈੱਟ ਦੀ ਇਜਾਜ਼ਤ ਤੱਕ ਨਹੀਂ ਹੈ।\n\nਮੈਟਾਡਾਟਾ ਹਟਾਉਣਾ ਮੂਲ ਰੂਪ ਵਿੱਚ ਚਾਲੂ ਹੈ, ਇਸ ਲਈ ਤੁਹਾਡੀਆਂ ਬਾਹਰ ਭੇਜੀਆਂ ਫ਼ਾਈਲਾਂ ਵਿੱਚੋਂ EXIF, GPS ਧੁਰੇ ਅਤੇ ਸਮਾਂ-ਮੋਹਰਾਂ ਹਟਾ ਦਿੱਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।';

  @override
  String get licenseTitle => 'ਲਾਇਸੰਸ';

  @override
  String get licenseBody =>
      'ਇਸ ਐਪ ਵਿੱਚ x264, x265 ਅਤੇ ਹੋਰ GPL ਹਿੱਸਿਆਂ ਨਾਲ ਬਣਿਆ FFmpeg ਸ਼ਾਮਲ ਹੈ, ਇਸ ਲਈ ਪੂਰੀ ਐਪਲੀਕੇਸ਼ਨ GNU GPL v3 ਹੇਠ ਵੰਡੀ ਜਾਂਦੀ ਹੈ।';

  @override
  String get sourceMissing => 'ਸਰੋਤ ਫ਼ਾਈਲ ਹੁਣ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get tabSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get introTitle => 'ਬਣਤਰ ਤੋਂ ਹੀ ਨਿੱਜੀ';

  @override
  String get introOfflineTitle => 'ਇਸੇ ਡੀਵਾਈਸ ਉੱਤੇ ਬਦਲਦਾ ਹੈ';

  @override
  String get introOfflineBody =>
      'ਸਾਰਾ ਕੰਮ ਨਾਲ ਦਿੱਤੀ FFmpeg ਦੀ ਕਾਪੀ ਕਰਦੀ ਹੈ। ਤੁਹਾਡੀਆਂ ਫ਼ਾਈਲਾਂ ਕਦੇ ਫ਼ੋਨ ਤੋਂ ਬਾਹਰ ਨਹੀਂ ਜਾਂਦੀਆਂ — ਤਬਦੀਲੀ ਏਅਰਪਲੇਨ ਮੋਡ ਵਿੱਚ ਵੀ ਕੰਮ ਕਰਦੀ ਹੈ।';

  @override
  String get introTelemetryTitle => 'ਬਿਲਕੁਲ ਟੈਲੀਮੈਟਰੀ ਨਹੀਂ';

  @override
  String get introTelemetryBody =>
      'ਨਾ ਖਾਤਾ, ਨਾ ਵਿਸ਼ਲੇਸ਼ਣ, ਨਾ ਕਰੈਸ਼ ਰਿਪੋਰਟਾਂ। ਐਪ ਨੂੰ ਪਤਾ ਹੀ ਨਹੀਂ ਕਿ ਤੁਸੀਂ ਕੌਣ ਹੋ।';

  @override
  String get introMetadataTitle => 'ਮੈਟਾਡਾਟਾ ਤੁਹਾਡੇ ਕਾਬੂ ਵਿੱਚ';

  @override
  String get introMetadataBody =>
      'EXIF, GPS ਅਤੇ ਸਮਾਂ-ਮੋਹਰਾਂ ਮੂਲ ਰੂਪ ਵਿੱਚ ਹਰ ਨਤੀਜੇ ਵਿੱਚੋਂ ਹਟਾ ਦਿੱਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ। ਤੁਸੀਂ ਇਹ ਬੰਦ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get introFreeNote =>
      'ਮੁਫ਼ਤ, ਨਾ ਇਸ਼ਤਿਹਾਰ ਨਾ ਸਬਸਕ੍ਰਿਪਸ਼ਨਾਂ। ਬੈਚ ਤਬਦੀਲੀ ਸਮੇਤ ਹਰ ਸਹੂਲਤ ਸ਼ੁਰੂ ਤੋਂ ਹੀ ਤੁਹਾਡੀ ਹੈ — ਖ਼ਰੀਦੀ ਸਿਰਫ਼ ਇੱਕ ਟਿੱਪ ਜਾ ਸਕਦੀ ਹੈ, ਅਤੇ ਉਹ ਕੁਝ ਵੀ ਨਹੀਂ ਖੋਲ੍ਹਦੀ।';

  @override
  String get introContinue => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get modeSimple => 'ਸਧਾਰਨ';

  @override
  String get modeAdvanced => 'ਉੱਨਤ';

  @override
  String get modeAdvancedHint =>
      'ਪ੍ਰੀਸੈੱਟ ਕਾਰਡਾਂ ਦੀ ਥਾਂ ਹਰ ਕੋਡੈਕ, ਬਿੱਟਰੇਟ ਅਤੇ ਬਦਲਾਅ ਦਾ ਕੰਟਰੋਲ ਦਿਖਾਓ।';

  @override
  String get presetCompressVideoTitle => 'ਵੀਡੀਓ ਸੰਕੁਚਿਤ ਕਰੋ';

  @override
  String get presetCompressVideoBody => 'ਕਿਤੇ ਛੋਟੀ MP4, ਗੁਣਵੱਤਾ ਚੰਗੀ ਰਹਿੰਦੀ ਹੈ';

  @override
  String get presetFitToSizeTitle => 'ਆਕਾਰ ਵਿੱਚ ਬਿਠਾਓ';

  @override
  String get presetFitToSizeBody => 'ਸਹੀ ਹੱਦ ਤੱਕ — Discord, ਈਮੇਲ, ਚੈਟਾਂ';

  @override
  String get presetCompatibleMp4Title => 'ਅਨੁਕੂਲ MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. ਹਰ ਥਾਂ ਚੱਲਦੀ ਹੈ';

  @override
  String get presetExtractAudioTitle => 'ਆਡੀਓ ਕੱਢੋ';

  @override
  String get presetExtractAudioBody => 'ਕਿਸੇ ਵੀ ਵੀਡੀਓ ਵਿੱਚੋਂ MP3';

  @override
  String get presetVideoToGifTitle => 'ਵੀਡੀਓ ਤੋਂ GIF';

  @override
  String get presetVideoToGifBody => 'ਛੋਟੀ ਕਲਿੱਪ ਤੋਂ ਚੱਲਦੀ GIF';

  @override
  String get presetMergeTitle => 'ਵੀਡੀਓ ਜੋੜੋ';

  @override
  String get presetMergeBody => 'ਕਲਿੱਪਾਂ ਨੂੰ ਤਰਤੀਬ ਨਾਲ ਇੱਕ MP4 ਵਿੱਚ ਸਿਊਂਓ';

  @override
  String get mergeNeedsTwo => 'ਜੋੜਨ ਲਈ ਘੱਟੋ-ਘੱਟ ਦੋ ਵੀਡੀਓ ਚੁਣੋ।';

  @override
  String mergedVideoName(int count) {
    return 'ਜੋੜੀ ਵੀਡੀਓ ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ਫ਼ੋਟੋ ਸੰਕੁਚਿਤ ਕਰੋ';

  @override
  String get presetCompressImageBody =>
      'ਛੋਟੀ JPEG, ਨੁਕਸਾਨ ਮੁਸ਼ਕਿਲ ਨਾਲ ਦਿਖਦਾ ਹੈ';

  @override
  String get presetEnhancePhotoTitle => 'ਫ਼ੋਟੋ ਸੁਧਾਰੋ';

  @override
  String get presetEnhancePhotoBody => 'ਸਾਫ਼, ਤਿੱਖੀ, ਬਿਹਤਰ ਰੰਗ';

  @override
  String get presetImageToWebpTitle => 'ਫ਼ੋਟੋ ਤੋਂ WebP';

  @override
  String get presetImageToWebpBody => 'ਨਵਾਂ ਫਾਰਮੈਟ, JPEG ਤੋਂ ਛੋਟਾ';

  @override
  String get sizeTargetTitle => 'ਟੀਚਾ ਆਕਾਰ';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'ਆਪਣੀ ਮਰਜ਼ੀ…';

  @override
  String get sizeTargetDialogTitle => 'MB ਵਿੱਚ ਟੀਚਾ ਆਕਾਰ';

  @override
  String get sizeTargetTooSmall =>
      'ਇਸ ਮਿਆਦ ਲਈ ਟੀਚਾ ਬਹੁਤ ਛੋਟਾ ਹੈ; ਸਭ ਤੋਂ ਨੇੜਲੀ ਸੰਭਵ ਗੁਣਵੱਤਾ ਵਰਤੀ ਜਾਵੇਗੀ।';

  @override
  String estimatePerFile(String size) {
    return '≈ $size ਪ੍ਰਤੀ ਫ਼ਾਈਲ';
  }

  @override
  String estimateTotal(String size) {
    return 'ਅੰਦਾਜ਼ਨ ਨਤੀਜਾ: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'ਚੁਣੀਆਂ ਫ਼ਾਈਲਾਂ: $count';
  }

  @override
  String get promiseOffline => '100% ਔਫ਼ਲਾਈਨ ਤਬਦੀਲੀ';

  @override
  String get promiseBatchFree => 'ਬੈਚ ਮੁਫ਼ਤ ਹੈ';

  @override
  String get promiseNoWatermark => 'ਕੋਈ ਵਾਟਰਮਾਰਕ ਨਹੀਂ';

  @override
  String get sectionTransform => 'ਬਦਲਾਅ';

  @override
  String get rotateLabel => 'ਘੁਮਾਓ';

  @override
  String get flipLabel => 'ਲੇਟਵਾਂ ਸ਼ੀਸ਼ਾ';

  @override
  String get speedLabel => 'ਰਫ਼ਤਾਰ';

  @override
  String get cropLabel => 'ਕੱਟੋ';

  @override
  String get cropHint =>
      'ਚੁਣੇ ਅਨੁਪਾਤ ਅਨੁਸਾਰ ਵਿਚਕਾਰੋਂ ਕੱਟਦਾ ਹੈ — ਫੀਡਾਂ ਲਈ ਵਰਗ, ਸਟੋਰੀਆਂ ਲਈ 9:16।';

  @override
  String volumeLabel(int percent) {
    return 'ਆਵਾਜ਼: $percent%';
  }

  @override
  String get addAudioFiles => 'ਆਡੀਓ ਤੇ ਹੋਰ ਫ਼ਾਈਲਾਂ';

  @override
  String get hwEncoderLabel => 'ਹਾਰਡਵੇਅਰ ਏਨਕੋਡਿੰਗ';

  @override
  String get hwEncoderHint =>
      'ਬਿੱਟਰੇਟ ਅਤੇ ਆਕਾਰ-ਵਿੱਚ-ਬਿਠਾਉਣ ਵਾਲੇ ਢੰਗਾਂ ਵਿੱਚ ਡੀਵਾਈਸ ਦੀ ਵੀਡੀਓ ਚਿੱਪ ਵਰਤਦਾ ਹੈ — ਕਿਤੇ ਤੇਜ਼ ਅਤੇ ਘੱਟ ਗਰਮ। ਗੁਣਵੱਤਾ (CRF) ਢੰਗ ਹਮੇਸ਼ਾ ਸਹੀ ਸਾਫ਼ਟਵੇਅਰ ਏਨਕੋਡਰ ਵਰਤਦਾ ਹੈ, ਅਤੇ ਹਾਰਡਵੇਅਰ ਉੱਤੇ ਅਸਫਲ ਹੋਇਆ ਕੰਮ ਆਪਣੇ-ਆਪ ਸਾਫ਼ਟਵੇਅਰ ਉੱਤੇ ਮੁੜ ਅਜ਼ਮਾਇਆ ਜਾਂਦਾ ਹੈ।';

  @override
  String get transformNeedsReencode =>
      'ਘੁਮਾਉਣ, ਸ਼ੀਸ਼ਾ ਅਤੇ ਰਫ਼ਤਾਰ ਲਈ ਮੁੜ-ਏਨਕੋਡਿੰਗ ਲੋੜੀਂਦੀ ਹੈ, ਇਸ ਲਈ ਸਟ੍ਰੀਮ ਕਾਪੀ ਦੌਰਾਨ ਇਹ ਬੰਦ ਰਹਿੰਦੇ ਹਨ।';

  @override
  String get capBitrateLabel => 'ਫ਼ਾਈਲ ਨੂੰ ਕਦੇ ਵੱਡਾ ਨਾ ਕਰੋ';

  @override
  String get capBitrateHint =>
      'ਏਨਕੋਡਿੰਗ ਨੂੰ ਸਰੋਤ ਦੇ ਆਪਣੇ ਬਿੱਟਰੇਟ ਤੱਕ ਸੀਮਤ ਰੱਖਦਾ ਹੈ। ਸਥਿਰ ਗੁਣਵੱਤਾ ਦੀ ਆਪਣੀ ਕੋਈ ਉੱਪਰਲੀ ਹੱਦ ਨਹੀਂ ਹੁੰਦੀ, ਇਸ ਲਈ ਪਹਿਲਾਂ ਤੋਂ ਸੰਕੁਚਿਤ ਵੀਡੀਓ ਨਹੀਂ ਤਾਂ ਵੱਡੀ ਵੀ ਨਿਕਲ ਸਕਦੀ ਹੈ।';

  @override
  String get keepSubtitles => 'ਉਪਸਿਰਲੇਖ ਰੱਖੋ';

  @override
  String get keepSubtitlesHint =>
      'ਉਪਸਿਰਲੇਖ ਟਰੈਕ ਨਤੀਜੇ ਵਿੱਚ ਲੈ ਜਾਂਦਾ ਹੈ। ਸਿਰਫ਼ ਲਿਖਤੀ ਉਪਸਿਰਲੇਖ।';

  @override
  String get sectionTrim => 'ਕਟਾਈ';

  @override
  String get trimEnable => 'ਸਰੋਤ ਨੂੰ ਕੱਟੋ';

  @override
  String get trimHint =>
      'ਉਦੋਂ ਉਪਲਬਧ ਜਦੋਂ ਕਤਾਰ ਵਿੱਚ ਜਾਣੀ-ਪਛਾਣੀ ਮਿਆਦ ਵਾਲੀ ਸਿਰਫ਼ ਇੱਕ ਫ਼ਾਈਲ ਹੋਵੇ।';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ਟੀਚਾ ਆਕਾਰ';

  @override
  String get lowBatteryTitle => 'ਬੈਟਰੀ ਘੱਟ ਹੈ';

  @override
  String get lowBatteryBody =>
      'ਤਬਦੀਲੀ ਪ੍ਰੋਸੈਸਰ ਤੋਂ ਸਖ਼ਤ ਕੰਮ ਲੈਂਦੀ ਹੈ। ਤੁਸੀਂ ਪਹਿਲਾਂ ਚਾਰਜਰ ਲਾ ਸਕਦੇ ਹੋ, ਜਾਂ ਫਿਰ ਵੀ ਜਾਰੀ ਰੱਖ ਸਕਦੇ ਹੋ।';

  @override
  String get lowBatteryContinue => 'ਫਿਰ ਵੀ ਬਦਲੋ';

  @override
  String get commonCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get commonOk => 'ਠੀਕ ਹੈ';

  @override
  String filesReceived(int count) {
    return 'ਮਿਲੀਆਂ ਫ਼ਾਈਲਾਂ: $count';
  }

  @override
  String get saveFile => 'ਸੰਭਾਲੋ';

  @override
  String get savedToGallery => 'ਗੈਲਰੀ ਵਿੱਚ, ਐਲਬਮ “Eluna Media” ਵਿੱਚ ਸੰਭਾਲ ਲਿਆ।';

  @override
  String get savedToDownloads => 'ਡਾਊਨਲੋਡ ਵਿੱਚ ਸੰਭਾਲ ਲਿਆ।';

  @override
  String get saveFailed => 'ਫ਼ਾਈਲ ਸੰਭਾਲੀ ਨਹੀਂ ਜਾ ਸਕੀ।';

  @override
  String get jobRemovedUndo => 'ਕੰਮ ਹਟਾ ਦਿੱਤਾ।';

  @override
  String get finishedClearedUndo => 'ਮੁਕੰਮਲ ਹੋਏ ਕੰਮ ਸਾਫ਼ ਕਰ ਦਿੱਤੇ।';

  @override
  String get undo => 'ਵਾਪਸ ਲਓ';

  @override
  String get errorDetailsTitle => 'ਗ਼ਲਤੀ ਦੇ ਵੇਰਵੇ';

  @override
  String get sectionConversionPrefs => 'ਤਬਦੀਲੀ';

  @override
  String get powerModeLabel => 'ਪਾਵਰ ਮੋਡ';

  @override
  String get powerEfficiency => 'ਠੰਢਾ ਤੇ ਤੇਜ਼';

  @override
  String get powerBalanced => 'ਸੰਤੁਲਿਤ';

  @override
  String get powerQuality => 'ਵੱਧ ਤੋਂ ਵੱਧ ਸੰਕੁਚਨ';

  @override
  String get powerModeHint =>
      'ਵੀਡੀਓ ਏਨਕੋਡਰ ਕਿੰਨੀ ਸਖ਼ਤੀ ਨਾਲ ਕੰਮ ਕਰੇ। ਠੰਢਾ ਤੇ ਤੇਜ਼ ਦਾ ਮਤਲਬ ਕੁਝ ਵੱਡੀਆਂ ਫ਼ਾਈਲਾਂ। ਹੋਰ ਕੁਝ ਵੀ ਕਦੇ ਸੀਮਤ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ।';

  @override
  String get hapticsLabel => 'ਕੰਬਣੀ ਵਾਲਾ ਜਵਾਬ';

  @override
  String get networkPrivacyTitle => 'ਨੈੱਟਵਰਕ ਤੇ ਨਿੱਜਤਾ';

  @override
  String get netAuditIntro =>
      'ਇਸ ਐਪ ਵਿੱਚ ਹਰ ਉਸ ਚੀਜ਼ ਦੀ ਪੂਰੀ ਸੂਚੀ ਜੋ ਨੈੱਟਵਰਕ ਨੂੰ ਛੂਹ ਸਕਦੀ ਹੈ।';

  @override
  String get netAuditNoneTitle => 'ਨੈੱਟਵਰਕ ਤੱਕ ਬਿਲਕੁਲ ਪਹੁੰਚ ਨਹੀਂ';

  @override
  String get netAuditNoneBody =>
      'ਐਪ ਇੰਟਰਨੈੱਟ ਦੀ ਇਜਾਜ਼ਤ ਮੰਗਦੀ ਹੀ ਨਹੀਂ, ਇਸ ਲਈ ਚਾਹ ਕੇ ਵੀ ਨੈੱਟਵਰਕ ਤੱਕ ਨਹੀਂ ਪਹੁੰਚ ਸਕਦੀ — ਤੁਸੀਂ ਇਹ ਸਿਸਟਮ ਦੀ ਐਪ ਜਾਣਕਾਰੀ ਵਿੱਚ ਪਰਖ ਸਕਦੇ ਹੋ। ਨਾ ਇਸ਼ਤਿਹਾਰ, ਨਾ ਵਿਸ਼ਲੇਸ਼ਣ, ਨਾ ਅੱਪਡੇਟ ਦੀ ਜਾਂਚ। “ਐਪ ਨੂੰ ਦਰਜਾ ਦਿਓ” ਕੰਮ ਸਟੋਰ ਐਪ ਦੇ ਹਵਾਲੇ ਕਰ ਦਿੰਦਾ ਹੈ, ਜੋ ਆਪਣੀ ਗੱਲਬਾਤ ਆਪ ਕਰਦੀ ਹੈ।';

  @override
  String get netAuditConversionTitle => 'ਤਬਦੀਲੀ';

  @override
  String get netAuditConversionBody =>
      'ਪੂਰੀ ਤਰ੍ਹਾਂ ਇਸੇ ਡੀਵਾਈਸ ਉੱਤੇ, ਨਾਲ ਦਿੱਤੇ FFmpeg ਰਾਹੀਂ ਚੱਲਦੀ ਹੈ। ਏਅਰਪਲੇਨ ਮੋਡ ਚਾਲੂ ਕਰ ਕੇ ਬਦਲ ਕੇ ਦੇਖੋ — ਕੰਮ ਕਰਦੀ ਹੈ।';

  @override
  String get netAuditTelemetryTitle => 'ਟੈਲੀਮੈਟਰੀ';

  @override
  String get netAuditTelemetryBody =>
      'ਕੋਈ ਨਹੀਂ ਹੈ। ਐਪ ਨਾ ਵਿਸ਼ਲੇਸ਼ਣ ਇਕੱਠਾ ਕਰਦੀ ਹੈ, ਨਾ ਕਰੈਸ਼ ਰਿਪੋਰਟਾਂ, ਨਾ ਪਛਾਣਕਾਰ, ਅਤੇ ਇਸ ਵਿੱਚ ਖਾਤਿਆਂ ਦੀ ਕੋਈ ਪ੍ਰਣਾਲੀ ਨਹੀਂ ਹੈ।';

  @override
  String get netAuditTipsTitle => 'ਟਿੱਪ';

  @override
  String get netAuditTipsBody =>
      'ਟਿੱਪ ਦਾ ਕੰਮ Play Store ਐਪ ਕਰਦੀ ਹੈ, ਇਹ ਐਪ ਨਹੀਂ — ਜਿਸ ਕੋਲ ਹੁਣ ਵੀ ਇੰਟਰਨੈੱਟ ਦੀ ਇਜਾਜ਼ਤ ਨਹੀਂ ਹੈ। ਬਿਲਿੰਗ ਇਜਾਜ਼ਤਾਂ ਦੀ ਸੂਚੀ ਵਿੱਚ ਦੋ ਸਤਰਾਂ ਜ਼ਰੂਰ ਜੋੜਦੀ ਹੈ: “ਐਪ ਵਿੱਚ ਖ਼ਰੀਦਾਂ” ਅਤੇ “ਨੈੱਟਵਰਕ ਕੁਨੈਕਸ਼ਨ ਵੇਖਣਾ”, ਜੋ ਸਿਰਫ਼ ਇਹ ਪੜ੍ਹਦੀ ਹੈ ਕਿ ਕੁਨੈਕਸ਼ਨ ਹੈ ਜਾਂ ਨਹੀਂ ਅਤੇ ਉਸ ਨੂੰ ਵਰਤ ਨਹੀਂ ਸਕਦੀ। ਕੁਝ ਵੀ ਕਦੇ ਆਪਣੇ-ਆਪ ਨਹੀਂ ਖ਼ਰੀਦਿਆ ਜਾਂਦਾ, ਅਤੇ ਟਿੱਪ ਕੁਝ ਵੀ ਨਹੀਂ ਖੋਲ੍ਹਦੀ: ਇੱਥੇ ਹਰ ਸਹੂਲਤ ਮੁਫ਼ਤ ਹੈ।';

  @override
  String get sectionSupport => 'ਸਹਿਯੋਗ';

  @override
  String get rateApp => 'ਐਪ ਨੂੰ ਦਰਜਾ ਦਿਓ';

  @override
  String get openLicenses => 'ਓਪਨ ਸੋਰਸ ਲਾਇਸੰਸ';

  @override
  String get presetAudioToMp3Title => 'ਆਡੀਓ ਬਦਲੋ';

  @override
  String get presetAudioToMp3Body => 'MP3 ਵਿੱਚ — ਹਰ ਥਾਂ ਚੱਲਦੀ ਹੈ';

  @override
  String get presetCompressAudioTitle => 'ਆਡੀਓ ਸੰਕੁਚਿਤ ਕਰੋ';

  @override
  String get presetCompressAudioBody => 'ਹਲਕੀ AAC — ਆਵਾਜ਼ੀ ਨੋਟ, ਪੌਡਕਾਸਟ';

  @override
  String get convertTo => 'ਇਸ ਵਿੱਚ ਬਦਲੋ';

  @override
  String get formatSectionHint =>
      'ਸਿਰਫ਼ ਉਹੀ ਫਾਰਮੈਟ ਦਿਖਾਏ ਜਾਂਦੇ ਹਨ ਜਿਨ੍ਹਾਂ ਵਿੱਚ ਤੁਹਾਡੀਆਂ ਫ਼ਾਈਲਾਂ ਸੱਚਮੁੱਚ ਬਦਲ ਸਕਦੀਆਂ ਹਨ।';

  @override
  String get sourceVideo => 'ਵੀਡੀਓ';

  @override
  String get sourceImage => 'ਫ਼ੋਟੋ';

  @override
  String get sourceAudio => 'ਆਡੀਓ';

  @override
  String get sourceUnknown => 'ਫ਼ਾਈਲ';

  @override
  String get mixedSelectionTitle => 'ਵੱਖ-ਵੱਖ ਕਿਸਮਾਂ ਦੀਆਂ ਫ਼ਾਈਲਾਂ ਚੁਣੀਆਂ ਗਈਆਂ';

  @override
  String get mixedSelectionBody =>
      'ਹਰ ਫ਼ਾਈਲ ਉਸ ਦੀ ਆਪਣੀ ਕਿਸਮ ਲਈ ਸਭ ਤੋਂ ਢੁਕਵੇਂ ਪ੍ਰੀਸੈੱਟ ਨਾਲ ਬਦਲੀ ਜਾਂਦੀ ਹੈ। ਪੂਰੇ ਕਾਬੂ ਲਈ ਇੱਕ ਵਾਰ ਵਿੱਚ ਇੱਕੋ ਕਿਸਮ ਜੋੜੋ।';

  @override
  String get filesTitle => 'ਫ਼ਾਈਲਾਂ';

  @override
  String get removeFile => 'ਹਟਾਓ';

  @override
  String timeLeft(String time) {
    return '≈ $time ਬਾਕੀ';
  }

  @override
  String get jobSettingsTitle => 'ਤਬਦੀਲੀ ਦੀਆਂ ਸੈਟਿੰਗਾਂ';

  @override
  String get jobDetails => 'ਵੇਰਵੇ';

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
  String get summaryEnhanced => 'ਸੁਧਾਰਿਆ';

  @override
  String get summaryMetadataStripped => 'ਮੈਟਾਡਾਟਾ ਹਟਾਇਆ';

  @override
  String summaryMerge(int count) {
    return 'ਜੋੜੀਆਂ ਕਲਿੱਪਾਂ: $count';
  }

  @override
  String get shareApp => 'ਐਪ ਸਾਂਝੀ ਕਰੋ';

  @override
  String get shareAppText =>
      'Eluna Media — ਮੁਫ਼ਤ, ਪੂਰੀ ਤਰ੍ਹਾਂ ਔਫ਼ਲਾਈਨ ਫ਼ੋਟੋ, ਵੀਡੀਓ ਅਤੇ ਆਡੀਓ ਕਨਵਰਟਰ। ਨਾ ਸਬਸਕ੍ਰਿਪਸ਼ਨਾਂ, ਨਾ ਵਾਟਰਮਾਰਕ, ਨਾ ਖਾਤੇ।';

  @override
  String appVersionLabel(String version) {
    return 'ਵਰਜਨ $version';
  }

  @override
  String get openFile => 'ਖੋਲ੍ਹੋ';

  @override
  String get openFolder => 'ਫੋਲਡਰ ਵਿਖਾਓ';

  @override
  String get noAppToOpen => 'ਇਸ ਡੀਵਾਈਸ ਉੱਤੇ ਕੋਈ ਐਪ ਉਹ ਫ਼ਾਈਲ ਨਹੀਂ ਖੋਲ੍ਹ ਸਕਦੀ।';

  @override
  String get openFailed => 'ਫ਼ਾਈਲ ਖੋਲ੍ਹੀ ਨਹੀਂ ਜਾ ਸਕੀ।';

  @override
  String get twoPassLabel => 'ਸਹੀ ਆਕਾਰ ਲਈ ਦੋ ਗੇੜ';

  @override
  String get twoPassHint =>
      'ਆਕਾਰ ਵਿੱਚ ਬਿਠਾਉਣ ਵਾਲੇ ਕੰਮ ਦੋ ਵਾਰ ਏਨਕੋਡ ਹੁੰਦੇ ਹਨ ਅਤੇ ਬਾਈਟਾਂ ਦੇ ਬਜਟ ਉੱਤੇ ਸਾਫ਼ ਤੌਰ ਤੇ ਵੱਧ ਸਹੀ ਬੈਠਦੇ ਹਨ — ਪਰ ਸਮਾਂ ਅਤੇ ਬੈਟਰੀ ਲਗਭਗ ਦੁੱਗਣੀ ਲੱਗਦੀ ਹੈ।';

  @override
  String get whatsNewTitle => 'ਨਵਾਂ ਕੀ ਹੈ';

  @override
  String get whatsNew1 =>
      'ਵੀਡੀਓ ਹੁਣ AV1 ਵਿੱਚ ਹੋ ਸਕਦੀ ਹੈ: ਕਿਤੇ ਛੋਟੀਆਂ ਫ਼ਾਈਲਾਂ, ਜੇ ਤੁਸੀਂ ਉਡੀਕ ਕਰ ਸਕੋ।';

  @override
  String get whatsNew2 =>
      'ਤਸਵੀਰਾਂ ਲਈ ਨਵਾਂ: AVIF, ਲਗਭਗ ਅੱਧੀ JPEG ਜਿੰਨਾ, ਅਤੇ GIF ਦੀ ਥਾਂ ਚੱਲਦੀ WebP।';

  @override
  String get whatsNew3 =>
      'M4A ਬਿਨਾਂ ਨੁਕਸਾਨ ਵੀ ਹੋ ਸਕਦੀ ਹੈ — ਹੁਣ AAC ਦੇ ਨਾਲ ALAC ਵੀ ਹੈ।';

  @override
  String get whatsNew4 =>
      'ਦਿੱਖ ਲਈ ਇੱਕੋ ਸਕ੍ਰੀਨ: ਚਮਕ, ਲਹਿਜ਼ਾ ਰੰਗ, ਪੂਰਾ ਕਾਲਾ OLED ਅਤੇ Material You।';

  @override
  String get whatsNew5 =>
      'ਪ੍ਰਾਪਤੀਆਂ ਵਿੱਚ ਤਮਗ਼ੇ, ਤਿੰਨ ਟੈਬਾਂ, ਅਤੇ ਤਸਵੀਰ ਵਜੋਂ ਸਾਂਝੀ ਕੀਤੀ ਜਾ ਸਕਣ ਵਾਲੀ ਤਰੱਕੀ।';

  @override
  String get achievementsTitle => 'ਪ੍ਰਾਪਤੀਆਂ';

  @override
  String achievementsProgress(int done, int total) {
    return '$total ਵਿੱਚੋਂ $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'ਸਿਰਫ਼ ਇਸੇ ਡੀਵਾਈਸ ਉੱਤੇ ਗਿਣੀਆਂ ਜਾਂਦੀਆਂ ਹਨ। ਕੁਝ ਵੀ ਕਿਤੇ ਅੱਪਲੋਡ ਨਹੀਂ ਹੁੰਦਾ।';

  @override
  String get achFirstConversionTitle => 'ਪਹਿਲੇ ਕਦਮ';

  @override
  String get achFirstConversionBody => 'ਆਪਣੀ ਪਹਿਲੀ ਫ਼ਾਈਲ ਬਦਲੋ।';

  @override
  String get achTenConversionsTitle => 'ਹੱਥ ਖੁੱਲ੍ਹ ਗਿਆ';

  @override
  String get achTenConversionsBody => '10 ਫ਼ਾਈਲਾਂ ਬਦਲੋ।';

  @override
  String get achFiftyConversionsTitle => 'ਨਿਯਮਿਤ';

  @override
  String get achFiftyConversionsBody => '50 ਫ਼ਾਈਲਾਂ ਬਦਲੋ।';

  @override
  String get achTwoHundredConversionsTitle => 'ਮਿਹਨਤੀ';

  @override
  String get achTwoHundredConversionsBody => '200 ਫ਼ਾਈਲਾਂ ਬਦਲੋ।';

  @override
  String get achThousandConversionsTitle => 'ਕਨਵੇਅਰ';

  @override
  String get achThousandConversionsBody => '1000 ਫ਼ਾਈਲਾਂ ਬਦਲੋ।';

  @override
  String get achSaved100MbTitle => 'ਥਾਂ ਬਚਾਊ';

  @override
  String get achSaved100MbBody => 'ਕੁੱਲ ਮਿਲਾ ਕੇ 100 MB ਖ਼ਾਲੀ ਕਰੋ।';

  @override
  String get achSaved1GbTitle => 'ਗੀਗਾਬਾਈਟ ਸ਼ਿਕਾਰੀ';

  @override
  String get achSaved1GbBody => 'ਕੁੱਲ ਮਿਲਾ ਕੇ 1 GB ਖ਼ਾਲੀ ਕਰੋ।';

  @override
  String get achSaved10GbTitle => 'ਸਟੋਰੇਜ ਦਾ ਨਾਇਕ';

  @override
  String get achSaved10GbBody => 'ਕੁੱਲ ਮਿਲਾ ਕੇ 10 GB ਖ਼ਾਲੀ ਕਰੋ।';

  @override
  String get achBatchOfFiveTitle => 'ਬੈਚ ਕਾਮਾ';

  @override
  String get achBatchOfFiveBody => '5 ਜਾਂ ਵੱਧ ਫ਼ਾਈਲਾਂ ਦਾ ਬੈਚ ਪੂਰਾ ਕਰੋ।';

  @override
  String get achBatchOfTwentyTitle => 'ਅਸੈਂਬਲੀ ਲਾਈਨ';

  @override
  String get achBatchOfTwentyBody => '20 ਜਾਂ ਵੱਧ ਫ਼ਾਈਲਾਂ ਦਾ ਬੈਚ ਪੂਰਾ ਕਰੋ।';

  @override
  String get achSniperTitle => 'ਨਿਸ਼ਾਨੇਬਾਜ਼';

  @override
  String get achSniperBody => 'ਆਕਾਰ ਵਿੱਚ ਬਿਠਾਉਣ ਨਾਲ ਸਹੀ ਆਕਾਰ ਉੱਤੇ ਨਿਸ਼ਾਨਾ ਲਾਓ।';

  @override
  String get achMemeSmithTitle => 'ਮੀਮ ਘੜਨ ਵਾਲਾ';

  @override
  String get achMemeSmithBody => 'ਕਿਸੇ ਵੀਡੀਓ ਨੂੰ GIF ਵਿੱਚ ਬਦਲੋ।';

  @override
  String get achSoundHunterTitle => 'ਆਵਾਜ਼ ਦਾ ਸ਼ਿਕਾਰੀ';

  @override
  String get achSoundHunterBody => 'ਕਿਸੇ ਵੀਡੀਓ ਵਿੱਚੋਂ ਆਡੀਓ ਕੱਢੋ।';

  @override
  String get achSubtitleKeeperTitle => 'ਉਪਸਿਰਲੇਖਾਂ ਦਾ ਰਾਖਾ';

  @override
  String get achSubtitleKeeperBody => 'ਕੋਈ ਵੀਡੀਓ ਉਸ ਦੇ ਉਪਸਿਰਲੇਖਾਂ ਸਮੇਤ ਬਦਲੋ।';

  @override
  String get achDirectorTitle => 'ਨਿਰਦੇਸ਼ਕ';

  @override
  String get achDirectorBody =>
      'ਕੋਈ ਬਦਲਾਅ ਲਾਗੂ ਕਰੋ — ਘੁਮਾਉਣਾ, ਕੱਟਣਾ, ਰਫ਼ਤਾਰ ਜਾਂ ਆਵਾਜ਼।';

  @override
  String get achAllRounderTitle => 'ਹਰਫ਼ਨਮੌਲਾ';

  @override
  String get achAllRounderBody => 'ਵੀਡੀਓ, ਆਡੀਓ ਅਤੇ ਇੱਕ ਤਸਵੀਰ ਬਦਲੋ।';

  @override
  String get achNightOwlTitle => 'ਰਾਤ ਦਾ ਉੱਲੂ';

  @override
  String get achNightOwlBody =>
      'ਅੱਧੀ ਰਾਤ ਤੋਂ ਸਵੇਰੇ 5 ਵਜੇ ਵਿਚਕਾਰ ਕੋਈ ਤਬਦੀਲੀ ਪੂਰੀ ਕਰੋ।';

  @override
  String get achPlatinumTitle => 'ਪਲੈਟੀਨਮ';

  @override
  String get achPlatinumBody => 'ਬਾਕੀ ਸਾਰੀਆਂ ਪ੍ਰਾਪਤੀਆਂ ਹਾਸਲ ਕਰੋ।';

  @override
  String get storageTitle => 'ਸਟੋਰੇਜ';

  @override
  String get storageBody =>
      'ਬਦਲੀਆਂ ਫ਼ਾਈਲਾਂ ਉਦੋਂ ਤੱਕ ਐਪ ਦੇ ਅੰਦਰ ਹੀ ਰਹਿੰਦੀਆਂ ਹਨ ਜਦੋਂ ਤੱਕ ਤੁਸੀਂ ਉਹਨਾਂ ਨੂੰ ਸੰਭਾਲ ਜਾਂ ਸਾਂਝਾ ਨਹੀਂ ਕਰਦੇ, ਜਿੱਥੇ ਕੋਈ ਫ਼ਾਈਲ ਮੈਨੇਜਰ ਨਹੀਂ ਪਹੁੰਚ ਸਕਦਾ।';

  @override
  String get storageEmpty => 'ਕੁਝ ਵੀ ਸਟੋਰ ਨਹੀਂ';

  @override
  String storageUsage(String size) {
    return 'ਸਟੋਰ ਕੀਤਾ: $size';
  }

  @override
  String get storageClearTitle => 'ਸਟੋਰ ਕੀਤੀਆਂ ਫ਼ਾਈਲਾਂ ਸਾਫ਼ ਕਰੀਏ?';

  @override
  String get storageClearBody =>
      'ਐਪ ਕੋਲ ਪਏ ਹਰ ਮੁਕੰਮਲ ਨਤੀਜੇ ਨੂੰ ਮਿਟਾ ਦਿੰਦਾ ਹੈ। ਜੋ ਫ਼ਾਈਲਾਂ ਤੁਸੀਂ ਪਹਿਲਾਂ ਸੰਭਾਲ ਜਾਂ ਸਾਂਝੀਆਂ ਕਰ ਚੁੱਕੇ ਹੋ, ਉਹਨਾਂ ਨੂੰ ਹੱਥ ਨਹੀਂ ਲੱਗਦਾ।';

  @override
  String get storageClearAction => 'ਸਾਫ਼ ਕਰੋ';

  @override
  String storageCleared(String size) {
    return '$size ਖ਼ਾਲੀ ਹੋਈ';
  }

  @override
  String get autoSaveLabel => 'ਨਤੀਜੇ ਆਪਣੇ-ਆਪ ਸੰਭਾਲੋ';

  @override
  String get autoSaveHint =>
      'ਹਰ ਮੁਕੰਮਲ ਫ਼ਾਈਲ ਤਿਆਰ ਹੁੰਦਿਆਂ ਹੀ ਗੈਲਰੀ ਵਿੱਚ ਰੱਖ ਦਿੰਦਾ ਹੈ — ਆਡੀਓ ਡਾਊਨਲੋਡ ਵਿੱਚ।';

  @override
  String get lowSpaceTitle => 'ਥਾਂ ਬਹੁਤੀ ਨਹੀਂ ਬਚੀ';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ਇਸ ਬੈਚ ਨੂੰ ਲਗਭਗ $needed ਚਾਹੀਦੀ ਹੈ ਅਤੇ ਸਿਰਫ਼ $free ਖ਼ਾਲੀ ਹੈ। ਤਬਦੀਲੀ ਵਿਚਾਲੇ ਰੁਕ ਸਕਦੀ ਹੈ।';
  }

  @override
  String saveAll(int count) {
    return 'ਸਾਰੀਆਂ ਸੰਭਾਲੋ ($count)';
  }

  @override
  String savedAll(int count) {
    return 'ਸੰਭਾਲੀਆਂ: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total ਵਿੱਚੋਂ $saved ਸੰਭਾਲੀਆਂ';
  }

  @override
  String get presetFitPhotoTitle => 'ਫ਼ੋਟੋ ਆਕਾਰ ਵਿੱਚ ਬਿਠਾਓ';

  @override
  String get presetFitPhotoBody =>
      'ਤਸਵੀਰ ਨੂੰ ਸਹੀ ਹੱਦ ਤੋਂ ਹੇਠਾਂ ਲਿਆਓ — ਅੱਪਲੋਡ ਫਾਰਮ, ਅਰਜ਼ੀਆਂ।';

  @override
  String get photoFitHint =>
      'ਐਪ ਵੱਖ-ਵੱਖ ਗੁਣਵੱਤਾਵਾਂ ਅਜ਼ਮਾਉਂਦੀ ਹੈ ਜਦੋਂ ਤੱਕ ਕੋਈ ਬੈਠ ਨਾ ਜਾਵੇ। ਜੇ ਬਜਟ ਤਸਵੀਰ ਲਈ ਬਹੁਤ ਛੋਟਾ ਹੋਵੇ, ਤਾਂ ਇਹ ਫ੍ਰੇਮ ਦਾ ਆਕਾਰ ਵੀ ਘਟਾ ਦਿੰਦੀ ਹੈ।';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'KB ਵਿੱਚ ਟੀਚਾ ਆਕਾਰ';

  @override
  String get compareAction => 'ਤੁਲਨਾ';

  @override
  String get compareBefore => 'ਪਹਿਲਾਂ';

  @override
  String get compareAfter => 'ਬਾਅਦ';

  @override
  String get compareHint => 'ਅਸਲੀ ਵੇਖਣ ਲਈ ਦਬਾ ਕੇ ਰੱਖੋ।';

  @override
  String get trimStart => 'ਸ਼ੁਰੂ';

  @override
  String get trimEnd => 'ਅੰਤ';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration ਤੱਕ';
  }

  @override
  String get imageScaleLabel => 'ਪੈਮਾਨਾ';

  @override
  String get audioChannelsLabel => 'ਚੈਨਲ';

  @override
  String get audioMono => 'ਮੋਨੋ';

  @override
  String get audioStereo => 'ਸਟੀਰੀਓ';

  @override
  String get sampleRateLabel => 'ਸੈਂਪਲ ਰੇਟ';

  @override
  String get voiceAudioHint =>
      '22.05 kHz ਉੱਤੇ ਮੋਨੋ ਕਿਸੇ ਆਵਾਜ਼ੀ ਰਿਕਾਰਡਿੰਗ ਨੂੰ ਬਿਨਾਂ ਸੁਣਨਯੋਗ ਨੁਕਸਾਨ ਲਗਭਗ ਚੌਥਾ ਹਿੱਸਾ ਕਰ ਦਿੰਦਾ ਹੈ। ਸੰਗੀਤ ਲਈ ਦੋਵੇਂ ਅਸਲੀ ਹੀ ਰਹਿਣ ਦਿਓ।';

  @override
  String get moveUp => 'ਉੱਪਰ ਲਿਜਾਓ';

  @override
  String get moveDown => 'ਹੇਠਾਂ ਲਿਜਾਓ';

  @override
  String get renameOutput => 'ਨਤੀਜੇ ਦਾ ਨਾਂ ਬਦਲੋ';

  @override
  String get renameOutputHint => 'ਨਵਾਂ ਨਾਂ';

  @override
  String get renameOutputHelp =>
      'ਐਕਸਟੈਂਸ਼ਨ ਆਊਟਪੁੱਟ ਫਾਰਮੈਟ ਤੋਂ ਆਉਂਦੀ ਹੈ। ਨਤੀਜੇ ਦਾ ਨਾਂ ਸਰੋਤ ਵਾਲਾ ਰੱਖਣ ਲਈ ਇਸ ਨੂੰ ਖ਼ਾਲੀ ਛੱਡੋ।';

  @override
  String deleteOriginalsAction(int count) {
    return 'ਅਸਲ ਫ਼ਾਈਲਾਂ ਮਿਟਾਓ ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'ਬਦਲਣ ਤੋਂ ਬਾਅਦ ਅਸਲ ਫ਼ਾਈਲਾਂ ਮਿਟਾਓ';

  @override
  String get deleteOriginalsHint =>
      'ਨਤੀਜਾ ਸੰਭਾਲੇ ਜਾਣ ਪਿੱਛੋਂ ਸਿਸਟਮ ਨੂੰ ਸਰੋਤ ਫ਼ਾਈਲਾਂ ਹਟਾਉਣ ਲਈ ਕਹਿੰਦਾ ਹੈ। ਸਿਸਟਮ ਹਮੇਸ਼ਾ ਵਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕੀ ਜਾਵੇਗਾ ਅਤੇ ਤੁਹਾਡੀ ਪੁਸ਼ਟੀ ਦੀ ਉਡੀਕ ਕਰਦਾ ਹੈ।';

  @override
  String get mediaAccessRequired =>
      'ਮੂਲ ਫ਼ਾਈਲਾਂ ਮਿਟਾਉਣ ਲਈ ਮੀਡੀਆ ਲਾਇਬ੍ਰੇਰੀ ਤੱਕ ਪਹੁੰਚ ਲੋੜੀਂਦੀ ਹੈ।';

  @override
  String originalsDeleted(String size) {
    return 'ਅਸਲ ਫ਼ਾਈਲਾਂ ਮਿਟਾ ਦਿੱਤੀਆਂ — $size ਖ਼ਾਲੀ ਹੋਈ';
  }

  @override
  String get originalsNoneDeleted =>
      'ਕੁਝ ਵੀ ਨਹੀਂ ਮਿਟਾਇਆ ਗਿਆ। ਸਿਰਫ਼ ਉਹੀ ਫ਼ਾਈਲਾਂ ਲੱਭੀਆਂ ਜਾ ਸਕਦੀਆਂ ਹਨ ਜੋ ਗੈਲਰੀ ਕੋਲ ਹੁਣ ਵੀ ਉਹਨਾਂ ਦੇ ਅਸਲ ਨਾਂ ਹੇਠ ਮੌਜੂਦ ਹਨ।';

  @override
  String reclaimedTotal(String size) {
    return 'ਇਸ ਐਪ ਨਾਲ ਖ਼ਾਲੀ ਕੀਤੀ: $size';
  }

  @override
  String get deleteAllData => 'ਸਾਰਾ ਡਾਟਾ ਮਿਟਾਓ';

  @override
  String get deleteAllDataHint =>
      'ਇਸ ਡੀਵਾਈਸ ਉੱਤੇ ਐਪ ਦੀ ਰੱਖੀ ਹਰ ਚੀਜ਼ ਮਿਟਾ ਦਿੰਦਾ ਹੈ: ਕਤਾਰ, ਬਦਲੀਆਂ ਫ਼ਾਈਲਾਂ, ਝਲਕਾਂ, ਪ੍ਰਾਪਤੀਆਂ ਅਤੇ ਸੈਟਿੰਗਾਂ। ਜੋ ਫ਼ਾਈਲਾਂ ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ ਆਪਣੀ ਗੈਲਰੀ ਵਿੱਚ ਸੰਭਾਲ ਚੁੱਕੇ ਹੋ, ਉਹ ਉਵੇਂ ਹੀ ਰਹਿੰਦੀਆਂ ਹਨ।';

  @override
  String get codecCopy => 'ਕਾਪੀ';

  @override
  String get codecCopyRemux => 'ਕਾਪੀ (ਰੀਮਕਸ)';

  @override
  String get codecNoVideo => 'ਵੀਡੀਓ ਨਹੀਂ';

  @override
  String get codecNoAudio => 'ਆਡੀਓ ਨਹੀਂ';

  @override
  String codecLossless(String codec) {
    return '$codec (ਬਿਨਾਂ ਨੁਕਸਾਨ)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (ਚੱਲਦਾ)';
  }

  @override
  String get sizeTargetEmail => 'ਈਮੇਲ';

  @override
  String get trimTimeHint => 'm:ss';
}
