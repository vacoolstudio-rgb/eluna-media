// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class L10nOr extends L10n {
  L10nOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'ରୂପାନ୍ତର';

  @override
  String get tabQueue => 'ଧାଡ଼ି';

  @override
  String get addFiles => 'ଫାଇଲ ଯୋଡ଼ନ୍ତୁ';

  @override
  String get emptySelectionTitle => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଫାଇଲ ନାହିଁ';

  @override
  String get emptySelectionBody =>
      'ଫଟୋ, ଭିଡିଓ କିମ୍ବା ଅଡିଓ ଯୋଡ଼ନ୍ତୁ। ସବୁକିଛି ଏହି ଡିଭାଇସରେ ହିଁ ପ୍ରକ୍ରିୟାକୃତ ହୁଏ।';

  @override
  String get sectionOutput => 'ଆଉଟପୁଟ';

  @override
  String get sectionVideo => 'ଭିଡିଓ';

  @override
  String get sectionAudio => 'ଅଡିଓ';

  @override
  String get sectionImage => 'ଛବି';

  @override
  String get sectionPrivacy => 'ଗୋପନୀୟତା';

  @override
  String get outputFormat => 'ଫର୍ମାଟ';

  @override
  String get videoCodec => 'ଭିଡିଓ କୋଡେକ';

  @override
  String get audioCodec => 'ଅଡିଓ କୋଡେକ';

  @override
  String get rateControl => 'ରେଟ ନିୟନ୍ତ୍ରଣ';

  @override
  String get rateControlQuality => 'ସ୍ଥିର ଗୁଣବତ୍ତା (CRF)';

  @override
  String get rateControlBitrate => 'ଲକ୍ଷ୍ୟ ବିଟରେଟ';

  @override
  String crfLabel(int value) {
    return 'ଗୁଣବତ୍ତା (CRF $value)';
  }

  @override
  String get crfHint => 'ମୂଲ୍ୟ ଯେତେ କମ୍, ଗୁଣବତ୍ତା ସେତେ ଭଲ ଏବଂ ଫାଇଲ ସେତେ ବଡ଼।';

  @override
  String videoBitrate(int value) {
    return 'ଭିଡିଓ ବିଟରେଟ: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ଅଡିଓ ବିଟରେଟ: $value kbps';
  }

  @override
  String get encodingPreset => 'ଏନକୋଡର ପ୍ରିସେଟ';

  @override
  String get encodingPresetHint =>
      'ଧୀର ପ୍ରିସେଟ ଭଲ ସଙ୍କୁଚିତ କରେ, କିନ୍ତୁ ଡିଭାଇସକୁ ଅଧିକ ଗରମ କରେ।';

  @override
  String get presetOriginal => 'ମୂଳ';

  @override
  String get resolution => 'ରେଜୋଲ୍ୟୁସନ';

  @override
  String get frameRate => 'ଫ୍ରେମ ରେଟ';

  @override
  String imageQuality(int value) {
    return 'ଗୁଣବତ୍ତା: $value';
  }

  @override
  String get lossless => 'କ୍ଷତିହୀନ';

  @override
  String get losslessHint => 'ଫାଇଲ ବଡ଼, ଫଳାଫଳ ପିକସେଲ-ପିକସେଲ ହୁବହୁ।';

  @override
  String get sectionEnhance => 'ଉନ୍ନତିକରଣ';

  @override
  String get sharpenLabel => 'ତୀକ୍ଷ୍ଣତା';

  @override
  String get sharpenHint =>
      'କଡ଼ଗୁଡ଼ିକୁ ଅଧିକ ସ୍ପଷ୍ଟ କରେ। ଝାପସା କିମ୍ବା ଫୋକସ ବାହାରେ ଉଠିଥିବା ଫଟୋକୁ ଏହା ଫେରାଇ ପାରିବ ନାହିଁ — ସେହି ବିବରଣୀ ଫାଇଲରେ ନାହିଁ।';

  @override
  String get sharpenStrongHint =>
      'ପ୍ରବଳ ତୀକ୍ଷ୍ଣୀକରଣ କଡ଼ ପାଖରେ ଉଜ୍ଜ୍ୱଳ ବଳୟ ଛାଡ଼ି ପାରେ। ପ୍ରଥମେ ମଧ୍ୟମ ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get denoiseLabel => 'ଶବ୍ଦ ହ୍ରାସ';

  @override
  String get denoiseHint =>
      'ଅନ୍ଧାର ଓ ରାତିର ଫଟୋର ଦାନା ସଫା କରେ। ଅତ୍ୟଧିକ ହେଲେ ସୂକ୍ଷ୍ମ ବିବରଣୀ ମଧ୍ୟ ମିଳାଇ ଯାଏ।';

  @override
  String get autoColorLabel => 'ସ୍ୱଚାଳିତ ରଙ୍ଗ ଓ ସ୍ତର';

  @override
  String get autoColorHint =>
      'କଣ୍ଟ୍ରାଷ୍ଟକୁ ବିସ୍ତାର କରେ ଏବଂ ଫିକା ରଙ୍ଗକୁ ଟିକିଏ ଉଠାଏ।';

  @override
  String get upscaleLabel => '2× ବଡ଼ କରନ୍ତୁ';

  @override
  String get upscaleHint =>
      'ଓସାର ଓ ଉଚ୍ଚତାକୁ ଦୁଇଗୁଣ କରେ। ଏହା ବିବରଣୀ ଯୋଗ କରେ ନାହିଁ — ମୁଦ୍ରଣ କିମ୍ବା କାଟିବା ସମୟରେ ସାହାଯ୍ୟ କରେ।';

  @override
  String get upscaleConflictHint =>
      'ବଡ଼ କରିବା ପାଇଁ ରେଜୋଲ୍ୟୁସନକୁ ପୁଣି ମୂଳ ଉପରେ ରଖନ୍ତୁ।';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ବନ୍ଦ';

  @override
  String get enhanceLight => 'ହାଲୁକା';

  @override
  String get enhanceMedium => 'ମଧ୍ୟମ';

  @override
  String get enhanceStrong => 'ପ୍ରବଳ';

  @override
  String get stripMetadata => 'ମେଟାଡାଟା ହଟାନ୍ତୁ';

  @override
  String get stripMetadataHint => 'ଫଳାଫଳରୁ EXIF, GPS ଏବଂ ସମୟ-ମୋହର ହଟାଇ ଦିଏ।';

  @override
  String startConversion(int count) {
    return '$count ଫାଇଲ ରୂପାନ୍ତର କରନ୍ତୁ';
  }

  @override
  String get batchResumed => 'ବାଧାପ୍ରାପ୍ତ ରୂପାନ୍ତର ପୁଣି ଆରମ୍ଭ ହେଲା।';

  @override
  String get converting => 'ରୂପାନ୍ତର ହେଉଛି…';

  @override
  String get cancelBatch => 'ବନ୍ଦ କରନ୍ତୁ';

  @override
  String get cancelJob => 'ବାତିଲ କରନ୍ତୁ';

  @override
  String get clearFinished => 'ସମାପ୍ତଗୁଡ଼ିକ ସଫା କରନ୍ତୁ';

  @override
  String get removeJob => 'ହଟାନ୍ତୁ';

  @override
  String get shareFile => 'ସେୟାର କରନ୍ତୁ';

  @override
  String get retryJob => 'ପୁଣି ଚେଷ୍ଟା';

  @override
  String get queueEmptyTitle => 'ଧାଡ଼ି ଖାଲି ଅଛି';

  @override
  String get queueEmptyBody => 'ରୂପାନ୍ତର ଟ୍ୟାବରେ ଯୋଡ଼ିଥିବା ଫାଇଲ ଏଠାରେ ଦେଖାଯାଏ।';

  @override
  String queueActiveTab(int count) {
    return 'ସକ୍ରିୟ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'ସମାପ୍ତ · $count';
  }

  @override
  String get queueNoActiveTitle => 'କିଛି ଚାଲୁ ନାହିଁ';

  @override
  String get queueNoActiveBody =>
      'ଅପେକ୍ଷାରତ କିମ୍ବା ରୂପାନ୍ତର ହେଉଥିବା ଫାଇଲ ଏଠାରେ ଦେଖାଯାଏ।';

  @override
  String get queueNoFinishedTitle => 'ଏପର୍ଯ୍ୟନ୍ତ କିଛି ସମାପ୍ତ ହୋଇନାହିଁ';

  @override
  String get queueNoFinishedBody =>
      'ରୂପାନ୍ତରିତ ଫାଇଲ ଏଠାରେ ଆସେ — ଖୋଲିବା, ସାଇତିବା କିମ୍ବା ସେୟାର କରିବା ପାଇଁ ପ୍ରସ୍ତୁତ।';

  @override
  String get statusQueued => 'ଧାଡ଼ିରେ';

  @override
  String get statusRunning => 'ରୂପାନ୍ତର ହେଉଛି';

  @override
  String get statusCompleted => 'ହୋଇଗଲା';

  @override
  String get statusFailed => 'ବିଫଳ';

  @override
  String get statusCancelled => 'ବାତିଲ';

  @override
  String batchSummary(int done, int total) {
    return '$totalରୁ $done ହୋଇଗଲା';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$doneଟି ଫାଇଲ ରୂପାନ୍ତରିତ',
      one: '1ଟି ଫାଇଲ ରୂପାନ୍ତରିତ',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$doneଟି ରୂପାନ୍ତରିତ, $failedଟି ବିଫଳ।';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% ଛୋଟ';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% ବଡ଼';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'ରୂପ';

  @override
  String get themeSystem => 'ସିଷ୍ଟମ';

  @override
  String get language => 'ଭାଷା';

  @override
  String get languageSystem => 'ସିଷ୍ଟମ';

  @override
  String get privacyTitle => 'ଗୋପନୀୟତା';

  @override
  String get privacyBody =>
      'Eluna Media ଆପଣଙ୍କ ଫାଇଲଗୁଡ଼ିକୁ ସମ୍ପୂର୍ଣ୍ଣ ଭାବରେ ଏହି ଡିଭାଇସରେ, ସାଙ୍ଗରେ ଦିଆଯାଇଥିବା FFmpegର ଏକ କପି ବ୍ୟବହାର କରି ରୂପାନ୍ତର କରେ। ଆପଣଙ୍କ ଫାଇଲ କେବେ ଡିଭାଇସ ଛାଡ଼େ ନାହିଁ, କୌଣସି ଆକାଉଣ୍ଟ ଆବଶ୍ୟକ ନାହିଁ, ଏବଂ କୌଣସି ଟେଲିମେଟ୍ରି ନାହିଁ। ଆପ୍‌ର କୌଣସି ଅଂଶ ନେଟୱାର୍କ ବ୍ୟବହାର କରେ ନାହିଁ — ଏହା ଇଣ୍ଟରନେଟ ଅନୁମତି ପର୍ଯ୍ୟନ୍ତ ରଖେ ନାହିଁ।\n\nମେଟାଡାଟା ହଟାଇବା ପୂର୍ବନିର୍ଦ୍ଧାରିତ ଭାବରେ ଚାଲୁ ଅଛି, ତେଣୁ ଆପଣ ରପ୍ତାନି କରୁଥିବା ଫାଇଲରୁ EXIF, GPS ସ୍ଥାନାଙ୍କ ଏବଂ ସମୟ-ମୋହର ବାଦ ଦିଆଯାଏ।';

  @override
  String get licenseTitle => 'ଲାଇସେନ୍ସ';

  @override
  String get licenseBody =>
      'ଏହି ଆପ୍‌ରେ x264, x265 ଓ ଅନ୍ୟାନ୍ୟ GPL ଉପାଦାନ ସହିତ ନିର୍ମିତ FFmpeg ଅନ୍ତର୍ଭୁକ୍ତ ଅଛି, ତେଣୁ ସମଗ୍ର ଆପ୍ଲିକେସନ GNU GPL v3 ଅଧୀନରେ ବଣ୍ଟନ କରାଯାଏ।';

  @override
  String get sourceMissing => 'ମୂଳ ଫାଇଲ ଆଉ ଉପଲବ୍ଧ ନାହିଁ।';

  @override
  String get tabSettings => 'ସେଟିଂସ';

  @override
  String get introTitle => 'ଡିଜାଇନରୁ ହିଁ ଗୋପନୀୟ';

  @override
  String get introOfflineTitle => 'ଏହି ଡିଭାଇସରେ ରୂପାନ୍ତର କରେ';

  @override
  String get introOfflineBody =>
      'ସମସ୍ତ କାମ ସାଙ୍ଗରେ ଦିଆଯାଇଥିବା FFmpegର କପି କରେ। ଆପଣଙ୍କ ଫାଇଲ କେବେ ଫୋନ ଛାଡ଼େ ନାହିଁ — ରୂପାନ୍ତର ଏରୋପ୍ଲେନ ମୋଡରେ ମଧ୍ୟ ଚାଲେ।';

  @override
  String get introTelemetryTitle => 'ଶୂନ୍ୟ ଟେଲିମେଟ୍ରି';

  @override
  String get introTelemetryBody =>
      'ଆକାଉଣ୍ଟ ନାହିଁ, ଆନାଲିଟିକ୍ସ ନାହିଁ, କ୍ରାସ ରିପୋର୍ଟ ନାହିଁ। ଆପଣ କିଏ, ଆପ୍ ଜାଣେ ନାହିଁ।';

  @override
  String get introMetadataTitle => 'ମେଟାଡାଟା ଆପଣଙ୍କ ନିୟନ୍ତ୍ରଣରେ';

  @override
  String get introMetadataBody =>
      'EXIF, GPS ଏବଂ ସମୟ-ମୋହର ପୂର୍ବନିର୍ଦ୍ଧାରିତ ଭାବରେ ପ୍ରତ୍ୟେକ ଫଳାଫଳରୁ ହଟାଇ ଦିଆଯାଏ। ଆପଣ ଏହା ବନ୍ଦ କରିପାରିବେ।';

  @override
  String get introFreeNote =>
      'ମାଗଣା, ବିଜ୍ଞାପନ ନାହିଁ ଓ ସବସ୍କ୍ରିପସନ ନାହିଁ। ବ୍ୟାଚ ରୂପାନ୍ତର ସହିତ ପ୍ରତ୍ୟେକ ସୁବିଧା ଆରମ୍ଭରୁ ହିଁ ଆପଣଙ୍କର — କେବଳ ଗୋଟିଏ ଟିପ୍ କିଣାଯାଇପାରେ, ଏବଂ ତାହା କିଛି ଖୋଲେ ନାହିଁ।';

  @override
  String get introContinue => 'ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get modeSimple => 'ସରଳ';

  @override
  String get modeAdvanced => 'ଉନ୍ନତ';

  @override
  String get modeAdvancedHint =>
      'ପ୍ରିସେଟ କାର୍ଡ ବଦଳରେ ପ୍ରତ୍ୟେକ କୋଡେକ, ବିଟରେଟ ଓ ରୂପାନ୍ତରଣ ନିୟନ୍ତ୍ରଣ ଦେଖାନ୍ତୁ।';

  @override
  String get presetCompressVideoTitle => 'ଭିଡିଓ ସଙ୍କୁଚିତ କରନ୍ତୁ';

  @override
  String get presetCompressVideoBody => 'ବହୁତ ଛୋଟ MP4, ଗୁଣବତ୍ତା ଭଲ ରହେ';

  @override
  String get presetFitToSizeTitle => 'ଆକାରରେ ବସାନ୍ତୁ';

  @override
  String get presetFitToSizeBody =>
      'ନିର୍ଦ୍ଦିଷ୍ଟ ସୀମା ଛୁଅଁନ୍ତୁ — Discord, ଇମେଲ, ଚାଟ';

  @override
  String get presetCompatibleMp4Title => 'ସୁସଙ୍ଗତ MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. ସବୁଠି ଚାଲେ';

  @override
  String get presetExtractAudioTitle => 'ଅଡିଓ ବାହାର କରନ୍ତୁ';

  @override
  String get presetExtractAudioBody => 'ଯେକୌଣସି ଭିଡିଓରୁ MP3';

  @override
  String get presetVideoToGifTitle => 'ଭିଡିଓରୁ GIF';

  @override
  String get presetVideoToGifBody => 'ଛୋଟ କ୍ଲିପରୁ ଚଳନ୍ତି GIF';

  @override
  String get presetMergeTitle => 'ଭିଡିଓ ମିଶାନ୍ତୁ';

  @override
  String get presetMergeBody => 'କ୍ଲିପଗୁଡ଼ିକୁ କ୍ରମରେ ଗୋଟିଏ MP4ରେ ଯୋଡ଼ନ୍ତୁ';

  @override
  String get mergeNeedsTwo => 'ମିଶାଇବା ପାଇଁ ଅନ୍ତତଃ ଦୁଇଟି ଭିଡିଓ ବାଛନ୍ତୁ।';

  @override
  String mergedVideoName(int count) {
    return 'ମିଶ୍ରିତ ଭିଡିଓ ($countଟି କ୍ଲିପ).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ଫଟୋ ସଙ୍କୁଚିତ କରନ୍ତୁ';

  @override
  String get presetCompressImageBody => 'ଛୋଟ JPEG, କ୍ଷତି ପ୍ରାୟ ଦେଖାଯାଏ ନାହିଁ';

  @override
  String get presetEnhancePhotoTitle => 'ଫଟୋ ଉନ୍ନତ କରନ୍ତୁ';

  @override
  String get presetEnhancePhotoBody => 'ଅଧିକ ସଫା, ତୀକ୍ଷ୍ଣ, ଭଲ ରଙ୍ଗ';

  @override
  String get presetImageToWebpTitle => 'ଫଟୋରୁ WebP';

  @override
  String get presetImageToWebpBody => 'ଆଧୁନିକ ଫର୍ମାଟ, JPEGଠାରୁ ଛୋଟ';

  @override
  String get sizeTargetTitle => 'ଲକ୍ଷ୍ୟ ଆକାର';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'ନିଜସ୍ୱ…';

  @override
  String get sizeTargetDialogTitle => 'MBରେ ଲକ୍ଷ୍ୟ ଆକାର';

  @override
  String get sizeTargetTooSmall =>
      'ଏହି ଅବଧି ପାଇଁ ଲକ୍ଷ୍ୟ ବହୁତ ଛୋଟ; ସମ୍ଭବ ହୋଇଥିବା ନିକଟତମ ଗୁଣବତ୍ତା ବ୍ୟବହାର କରାଯିବ।';

  @override
  String estimatePerFile(String size) {
    return '≈ $size ପ୍ରତି ଫାଇଲ';
  }

  @override
  String estimateTotal(String size) {
    return 'ଆନୁମାନିକ ଫଳାଫଳ: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countଟି ଫାଇଲ ବଛାଯାଇଛି',
      one: '1ଟି ଫାଇଲ ବଛାଯାଇଛି',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% ଅଫଲାଇନ ରୂପାନ୍ତର';

  @override
  String get promiseBatchFree => 'ବ୍ୟାଚ ମାଗଣା';

  @override
  String get promiseNoWatermark => 'ୱାଟରମାର୍କ ନାହିଁ';

  @override
  String get sectionTransform => 'ରୂପାନ୍ତରଣ';

  @override
  String get rotateLabel => 'ଘୂରାନ୍ତୁ';

  @override
  String get flipLabel => 'ଭୂସମାନ୍ତର ଦର୍ପଣ';

  @override
  String get speedLabel => 'ଗତି';

  @override
  String get cropLabel => 'କାଟନ୍ତୁ';

  @override
  String get cropHint =>
      'ବଛା ଆସ୍ପେକ୍ଟ ଅନୁପାତ ଅନୁଯାୟୀ ମଝିରୁ କାଟେ — ଫିଡ ପାଇଁ ବର୍ଗ, ଷ୍ଟୋରି ପାଇଁ 9:16।';

  @override
  String volumeLabel(int percent) {
    return 'ଭଲ୍ୟୁମ: $percent%';
  }

  @override
  String get addAudioFiles => 'ଅଡିଓ ଓ ଅନ୍ୟ ଫାଇଲ';

  @override
  String get hwEncoderLabel => 'ହାର୍ଡୱେର ଏନକୋଡିଂ';

  @override
  String get hwEncoderHint =>
      'ବିଟରେଟ ଓ ଆକାରରେ-ବସାଇବା ମୋଡରେ ଡିଭାଇସର ଭିଡିଓ ଚିପ ବ୍ୟବହାର କରେ — ବହୁତ ଦ୍ରୁତ ଏବଂ କମ ଗରମ। ଗୁଣବତ୍ତା (CRF) ମୋଡ ସର୍ବଦା ସଠିକ ସଫ୍ଟୱେର ଏନକୋଡର ବ୍ୟବହାର କରେ, ଏବଂ ହାର୍ଡୱେରରେ ବିଫଳ ହୋଇଥିବା କାମ ସ୍ୱଚାଳିତ ଭାବରେ ସଫ୍ଟୱେରରେ ପୁଣି ଚେଷ୍ଟା କରାଯାଏ।';

  @override
  String get transformNeedsReencode =>
      'ଘୂରାଇବା, ଦର୍ପଣ ଓ ଗତି ପାଇଁ ପୁନଃ-ଏନକୋଡିଂ ଆବଶ୍ୟକ, ତେଣୁ ଷ୍ଟ୍ରିମ କପି ସମୟରେ ସେଗୁଡ଼ିକ ବନ୍ଦ ରହେ।';

  @override
  String get capBitrateLabel => 'ଫାଇଲକୁ କେବେ ବଡ଼ କରନ୍ତୁ ନାହିଁ';

  @override
  String get capBitrateHint =>
      'ଏନକୋଡିଂକୁ ମୂଳ ଫାଇଲର ନିଜ ବିଟରେଟ ପର୍ଯ୍ୟନ୍ତ ସୀମିତ ରଖେ। ସ୍ଥିର ଗୁଣବତ୍ତାର ନିଜର କୌଣସି ଉପର ସୀମା ନାହିଁ, ତେଣୁ ପୂର୍ବରୁ ସଙ୍କୁଚିତ ଭିଡିଓ ନଚେତ ଆହୁରି ବଡ଼ ହୋଇ ବାହାରି ପାରେ।';

  @override
  String get keepSubtitles => 'ସବଟାଇଟଲ ରଖନ୍ତୁ';

  @override
  String get keepSubtitlesHint =>
      'ସବଟାଇଟଲ ଟ୍ରାକକୁ ଫଳାଫଳରେ ନେଇଯାଏ। କେବଳ ଲିଖିତ ସବଟାଇଟଲ।';

  @override
  String get sectionTrim => 'ଛେଦନ';

  @override
  String get trimEnable => 'ମୂଳ ଫାଇଲ ଛେଦନ କରନ୍ତୁ';

  @override
  String get trimHint =>
      'ଯେତେବେଳେ ଧାଡ଼ିରେ ଜଣା ଅବଧି ଥିବା ଠିକ ଗୋଟିଏ ଫାଇଲ ଥାଏ, ସେତେବେଳେ ଉପଲବ୍ଧ।';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ଲକ୍ଷ୍ୟ ଆକାର';

  @override
  String get lowBatteryTitle => 'ବ୍ୟାଟେରି କମ ଅଛି';

  @override
  String get lowBatteryBody =>
      'ରୂପାନ୍ତର ପ୍ରୋସେସର ଉପରେ ଅଧିକ ଚାପ ପକାଏ। ଆପଣ ପ୍ରଥମେ ଚାର୍ଜରେ ଲଗାଇପାରିବେ, କିମ୍ବା ତଥାପି ଜାରି ରଖିପାରିବେ।';

  @override
  String get lowBatteryContinue => 'ତଥାପି ରୂପାନ୍ତର କରନ୍ତୁ';

  @override
  String get commonCancel => 'ବାତିଲ କରନ୍ତୁ';

  @override
  String get commonOk => 'ଠିକ ଅଛି';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countଟି ଫାଇଲ ମିଳିଲା',
      one: '1ଟି ଫାଇଲ ମିଳିଲା',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'ସାଇତନ୍ତୁ';

  @override
  String get savedToGallery => 'ଗ୍ୟାଲେରିରେ, “Eluna Media” ଆଲବମରେ ସାଇତାଗଲା।';

  @override
  String get savedToDownloads => 'ଡାଉନଲୋଡରେ ସାଇତାଗଲା।';

  @override
  String get saveFailed => 'ଫାଇଲ ସାଇତାଯାଇ ପାରିଲା ନାହିଁ।';

  @override
  String get jobRemovedUndo => 'କାମ ହଟାଗଲା।';

  @override
  String get finishedClearedUndo => 'ସମାପ୍ତ କାମ ସଫା କରାଗଲା।';

  @override
  String get undo => 'ପୂର୍ବବତ କରନ୍ତୁ';

  @override
  String get errorDetailsTitle => 'ତ୍ରୁଟିର ବିବରଣୀ';

  @override
  String get sectionConversionPrefs => 'ରୂପାନ୍ତର';

  @override
  String get powerModeLabel => 'ପାୱାର ମୋଡ';

  @override
  String get powerEfficiency => 'ଥଣ୍ଡା ଓ ଦ୍ରୁତ';

  @override
  String get powerBalanced => 'ସନ୍ତୁଳିତ';

  @override
  String get powerQuality => 'ସର୍ବାଧିକ ସଙ୍କୋଚନ';

  @override
  String get powerModeHint =>
      'ଭିଡିଓ ଏନକୋଡର କେତେ ପରିଶ୍ରମ କରିବ। ଥଣ୍ଡା ଓ ଦ୍ରୁତ ଅର୍ଥ ଟିକିଏ ବଡ଼ ଫାଇଲ। ଆଉ କିଛି କେବେ ସୀମିତ କରାଯାଏ ନାହିଁ।';

  @override
  String get hapticsLabel => 'କମ୍ପନ ପ୍ରତିକ୍ରିୟା';

  @override
  String get networkPrivacyTitle => 'ନେଟୱାର୍କ ଓ ଗୋପନୀୟତା';

  @override
  String get netAuditIntro =>
      'ଏହି ଆପ୍‌ରେ ଥିବା ଯାହା କିଛି ନେଟୱାର୍କ ଛୁଇଁ ପାରେ, ତାହାର ସମ୍ପୂର୍ଣ୍ଣ ତାଲିକା।';

  @override
  String get netAuditNoneTitle => 'ନେଟୱାର୍କକୁ ଆଦୌ ପ୍ରବେଶ ନାହିଁ';

  @override
  String get netAuditNoneBody =>
      'ଆପ୍ ଇଣ୍ଟରନେଟ ଅନୁମତି ମାଗେ ନାହିଁ, ତେଣୁ ଚେଷ୍ଟା କଲେ ମଧ୍ୟ ନେଟୱାର୍କ ପର୍ଯ୍ୟନ୍ତ ପହଞ୍ଚି ପାରିବ ନାହିଁ — ଏହା ଆପଣ ସିଷ୍ଟମର ଆପ୍ ସୂଚନାରେ ଯାଞ୍ଚ କରିପାରିବେ। ବିଜ୍ଞାପନ ନାହିଁ, ଆନାଲିଟିକ୍ସ ନାହିଁ, ଅପଡେଟ ଯାଞ୍ଚ ନାହିଁ। “ଆପ୍‌କୁ ମୂଲ୍ୟାୟନ କରନ୍ତୁ” କାମଟିକୁ ଷ୍ଟୋର ଆପ୍ ହାତରେ ଦେଇଦିଏ, ଯିଏ ନିଜର କଥାବାର୍ତ୍ତା ନିଜେ କରେ।';

  @override
  String get netAuditConversionTitle => 'ରୂପାନ୍ତର';

  @override
  String get netAuditConversionBody =>
      'ସମ୍ପୂର୍ଣ୍ଣ ଭାବରେ ଏହି ଡିଭାଇସରେ, ସାଙ୍ଗରେ ଦିଆଯାଇଥିବା FFmpeg ମାଧ୍ୟମରେ ଚାଲେ। ଏରୋପ୍ଲେନ ମୋଡ ଚାଲୁ କରି ରୂପାନ୍ତର କରି ଦେଖନ୍ତୁ — କାମ କରେ।';

  @override
  String get netAuditTelemetryTitle => 'ଟେଲିମେଟ୍ରି';

  @override
  String get netAuditTelemetryBody =>
      'କିଛି ନାହିଁ। ଆପ୍ କୌଣସି ଆନାଲିଟିକ୍ସ, କ୍ରାସ ରିପୋର୍ଟ କିମ୍ବା ପରିଚୟ ସଂଗ୍ରହ କରେ ନାହିଁ, ଏବଂ ଏଥିରେ ଆକାଉଣ୍ଟ ବ୍ୟବସ୍ଥା ନାହିଁ।';

  @override
  String get netAuditTipsTitle => 'ଟିପ୍';

  @override
  String get netAuditTipsBody =>
      'ଟିପ୍ Play Store ଆପ୍ ଦେଇ ହୁଏ, ଏହି ଆପ୍ ଦେଇ ନୁହେଁ — ଯାହାର ଏବେ ମଧ୍ୟ ଇଣ୍ଟରନେଟ ଅନୁମତି ନାହିଁ। ବିଲିଂ ଅନୁମତି ତାଲିକାରେ ଦୁଇଟି ଧାଡ଼ି ଯୋଡ଼େ: “ଇନ-ଆପ୍ କ୍ରୟ”, ଏବଂ “ନେଟୱାର୍କ ସଂଯୋଗ ଦେଖିବା”, ଯାହା କେବଳ ସଂଯୋଗ ଅଛି କି ନାହିଁ ତାହା ପଢ଼େ ଏବଂ ତାହାକୁ ବ୍ୟବହାର କରିପାରେ ନାହିଁ। କିଛି କେବେ ସ୍ୱଚାଳିତ ଭାବରେ କିଣାଯାଏ ନାହିଁ, ଏବଂ ଟିପ୍ କିଛି ଖୋଲେ ନାହିଁ: ଏଠାରେ ପ୍ରତ୍ୟେକ ସୁବିଧା ମାଗଣା।';

  @override
  String get sectionSupport => 'ସହଯୋଗ';

  @override
  String get rateApp => 'ଆପ୍‌କୁ ମୂଲ୍ୟାୟନ କରନ୍ତୁ';

  @override
  String get openLicenses => 'ଓପନ ସୋର୍ସ ଲାଇସେନ୍ସ';

  @override
  String get presetAudioToMp3Title => 'ଅଡିଓ ରୂପାନ୍ତର କରନ୍ତୁ';

  @override
  String get presetAudioToMp3Body => 'MP3ରେ — ସବୁଠି ଚାଲେ';

  @override
  String get presetCompressAudioTitle => 'ଅଡିଓ ସଙ୍କୁଚିତ କରନ୍ତୁ';

  @override
  String get presetCompressAudioBody => 'ହାଲୁକା AAC — ଭଏସ ନୋଟ, ପଡକାଷ୍ଟ';

  @override
  String get convertTo => 'ଏଥିରେ ରୂପାନ୍ତର କରନ୍ତୁ';

  @override
  String get formatSectionHint =>
      'କେବଳ ସେହି ଫର୍ମାଟ ଦେଖାଯାଏ ଯେଉଁଥିରେ ଆପଣଙ୍କ ଫାଇଲ ପ୍ରକୃତରେ ପରିଣତ ହୋଇପାରିବ।';

  @override
  String get sourceVideo => 'ଭିଡିଓ';

  @override
  String get sourceImage => 'ଫଟୋ';

  @override
  String get sourceAudio => 'ଅଡିଓ';

  @override
  String get sourceUnknown => 'ଫାଇଲ';

  @override
  String get mixedSelectionTitle => 'ଭିନ୍ନ ଭିନ୍ନ ପ୍ରକାରର ଫାଇଲ ବଛାଯାଇଛି';

  @override
  String get mixedSelectionBody =>
      'ପ୍ରତ୍ୟେକ ଫାଇଲ ତାହାର ନିଜ ପ୍ରକାର ପାଇଁ ସର୍ବୋତ୍ତମ ପ୍ରିସେଟ ସହିତ ରୂପାନ୍ତରିତ ହୁଏ। ପୂର୍ଣ୍ଣ ନିୟନ୍ତ୍ରଣ ପାଇଁ ଥରକେ ଗୋଟିଏ ପ୍ରକାର ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get filesTitle => 'ଫାଇଲ';

  @override
  String get removeFile => 'ହଟାନ୍ତୁ';

  @override
  String timeLeft(String time) {
    return '≈ $time ବାକି';
  }

  @override
  String get jobSettingsTitle => 'ରୂପାନ୍ତର ସେଟିଂସ';

  @override
  String get jobDetails => 'ବିବରଣୀ';

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
  String get summaryEnhanced => 'ଉନ୍ନତ କରାଯାଇଛି';

  @override
  String get summaryMetadataStripped => 'ମେଟାଡାଟା ହଟାଯାଇଛି';

  @override
  String summaryMerge(int count) {
    return '$countଟି କ୍ଲିପ ମିଶାଯାଇଛି';
  }

  @override
  String get shareApp => 'ଆପ୍ ସେୟାର କରନ୍ତୁ';

  @override
  String get shareAppText =>
      'Eluna Media — ଏକ ମାଗଣା, ସମ୍ପୂର୍ଣ୍ଣ ଅଫଲାଇନ ଫଟୋ, ଭିଡିଓ ଓ ଅଡିଓ କନଭର୍ଟର। ସବସ୍କ୍ରିପସନ ନାହିଁ, ୱାଟରମାର୍କ ନାହିଁ, ଆକାଉଣ୍ଟ ନାହିଁ।';

  @override
  String appVersionLabel(String version) {
    return 'ସଂସ୍କରଣ $version';
  }

  @override
  String get openFile => 'ଖୋଲନ୍ତୁ';

  @override
  String get openFolder => 'ଫୋଲ୍ଡର ଦେଖାନ୍ତୁ';

  @override
  String get noAppToOpen => 'ଏହି ଡିଭାଇସର କୌଣସି ଆପ୍ ସେହି ଫାଇଲ ଖୋଲିପାରିବ ନାହିଁ।';

  @override
  String get openFailed => 'ଫାଇଲ ଖୋଲାଯାଇ ପାରିଲା ନାହିଁ।';

  @override
  String get twoPassLabel => 'ସଠିକ ଆକାର ପାଇଁ ଦୁଇ ପାସ';

  @override
  String get twoPassHint =>
      'ଆକାରରେ-ବସାଇବା କାମ ଦୁଇଥର ଏନକୋଡ ହୁଏ ଏବଂ ବାଇଟ ବଜେଟକୁ ଲକ୍ଷଣୀୟ ଭାବରେ ଅଧିକ ସଠିକ ଭାବରେ ଛୁଏଁ — ପ୍ରାୟ ଦୁଇଗୁଣ ସମୟ ଓ ବ୍ୟାଟେରି ଖର୍ଚ୍ଚରେ।';

  @override
  String get whatsNewTitle => 'ନୂଆ କଣ ଅଛି';

  @override
  String get whatsNew1 =>
      'ଭିଡିଓ ଏବେ AV1 ହୋଇପାରିବ: ଉଲ୍ଲେଖନୀୟ ଭାବରେ ଛୋଟ ଫାଇଲ, ଯଦି ଆପଣ ଅପେକ୍ଷା କରିପାରିବେ।';

  @override
  String get whatsNew2 =>
      'ଛବି ପାଇଁ ନୂଆ: AVIF, ପ୍ରାୟ ଅଧା JPEG, ଏବଂ GIF ବଦଳରେ ଚଳନ୍ତି WebP।';

  @override
  String get whatsNew3 =>
      'M4A କ୍ଷତିହୀନ ହୋଇପାରିବ — ଏବେ AAC ପାଖରେ ALAC ମଧ୍ୟ ଅଛି।';

  @override
  String get whatsNew4 =>
      'ରୂପ ପାଇଁ ଗୋଟିଏ ସ୍କ୍ରିନ: ଉଜ୍ଜ୍ୱଳତା, ଆକ୍ସେଣ୍ଟ ରଙ୍ଗ, ପୂର୍ଣ୍ଣ କଳା OLED ଏବଂ Material You।';

  @override
  String get whatsNew5 =>
      'ସଫଳତାରେ ପଦକ, ତିନୋଟି ଟ୍ୟାବ, ଏବଂ ଛବି ଭାବରେ ସେୟାର କରାଯାଇପାରୁଥିବା ଅଗ୍ରଗତି।';

  @override
  String get achievementsTitle => 'ସଫଳତା';

  @override
  String achievementsProgress(int done, int total) {
    return '$totalରୁ $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'କେବଳ ଏହି ଡିଭାଇସରେ ଗଣାଯାଏ। କିଛି କେଉଁଆଡ଼େ ଅପଲୋଡ ହୁଏ ନାହିଁ।';

  @override
  String get achFirstConversionTitle => 'ପ୍ରଥମ ପାଦ';

  @override
  String get achFirstConversionBody => 'ନିଜର ପ୍ରଥମ ଫାଇଲ ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achTenConversionsTitle => 'ହାତ ଖୋଲିଲା';

  @override
  String get achTenConversionsBody => '10ଟି ଫାଇଲ ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achFiftyConversionsTitle => 'ନିୟମିତ';

  @override
  String get achFiftyConversionsBody => '50ଟି ଫାଇଲ ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achTwoHundredConversionsTitle => 'ପରିଶ୍ରମୀ';

  @override
  String get achTwoHundredConversionsBody => '200ଟି ଫାଇଲ ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achThousandConversionsTitle => 'କନଭେୟର';

  @override
  String get achThousandConversionsBody => '1000ଟି ଫାଇଲ ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achSaved100MbTitle => 'ସ୍ଥାନ ସଞ୍ଚୟକାରୀ';

  @override
  String get achSaved100MbBody => 'ମୋଟ 100 MB ଖାଲି କରନ୍ତୁ।';

  @override
  String get achSaved1GbTitle => 'ଗିଗାବାଇଟ ଶିକାରୀ';

  @override
  String get achSaved1GbBody => 'ମୋଟ 1 GB ଖାଲି କରନ୍ତୁ।';

  @override
  String get achSaved10GbTitle => 'ଷ୍ଟୋରେଜ ନାୟକ';

  @override
  String get achSaved10GbBody => 'ମୋଟ 10 GB ଖାଲି କରନ୍ତୁ।';

  @override
  String get achBatchOfFiveTitle => 'ବ୍ୟାଚ କର୍ମୀ';

  @override
  String get achBatchOfFiveBody =>
      '5 କିମ୍ବା ଅଧିକ ଫାଇଲର ଏକ ବ୍ୟାଚ ସମାପ୍ତ କରନ୍ତୁ।';

  @override
  String get achBatchOfTwentyTitle => 'ଆସେମ୍ବ୍ଲି ଲାଇନ';

  @override
  String get achBatchOfTwentyBody =>
      '20 କିମ୍ବା ଅଧିକ ଫାଇଲର ଏକ ବ୍ୟାଚ ସମାପ୍ତ କରନ୍ତୁ।';

  @override
  String get achSniperTitle => 'ନିଶାଣବାଜ';

  @override
  String get achSniperBody => 'ଆକାରରେ-ବସାଇବା ଦେଇ ଠିକ ଆକାର ଛୁଅଁନ୍ତୁ।';

  @override
  String get achMemeSmithTitle => 'ମିମ୍ କାରିଗର';

  @override
  String get achMemeSmithBody => 'ଏକ ଭିଡିଓକୁ GIFରେ ପରିଣତ କରନ୍ତୁ।';

  @override
  String get achSoundHunterTitle => 'ଶବ୍ଦ ଶିକାରୀ';

  @override
  String get achSoundHunterBody => 'ଏକ ଭିଡିଓରୁ ଅଡିଓ ବାହାର କରନ୍ତୁ।';

  @override
  String get achSubtitleKeeperTitle => 'ସବଟାଇଟଲ ରକ୍ଷକ';

  @override
  String get achSubtitleKeeperBody => 'ସବଟାଇଟଲ ରଖି ଏକ ଭିଡିଓ ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achDirectorTitle => 'ନିର୍ଦ୍ଦେଶକ';

  @override
  String get achDirectorBody =>
      'ଗୋଟିଏ ରୂପାନ୍ତରଣ ଲଗାନ୍ତୁ — ଘୂରାଇବା, କାଟିବା, ଗତି କିମ୍ବା ଭଲ୍ୟୁମ।';

  @override
  String get achAllRounderTitle => 'ସର୍ବଗୁଣୀ';

  @override
  String get achAllRounderBody => 'ଭିଡିଓ, ଅଡିଓ ଏବଂ ଏକ ଛବି ରୂପାନ୍ତର କରନ୍ତୁ।';

  @override
  String get achNightOwlTitle => 'ରାତିର ପେଚା';

  @override
  String get achNightOwlBody =>
      'ମଧ୍ୟରାତ୍ରି ଠାରୁ ସକାଳ 5ଟା ମଧ୍ୟରେ ଏକ ରୂପାନ୍ତର ସମାପ୍ତ କରନ୍ତୁ।';

  @override
  String get achPlatinumTitle => 'ପ୍ଲାଟିନମ';

  @override
  String get achPlatinumBody => 'ଅନ୍ୟ ସମସ୍ତ ସଫଳତା ଅର୍ଜନ କରନ୍ତୁ।';

  @override
  String get storageTitle => 'ଷ୍ଟୋରେଜ';

  @override
  String get storageBody =>
      'ଆପଣ ସାଇତିବା କିମ୍ବା ସେୟାର କରିବା ପର୍ଯ୍ୟନ୍ତ ରୂପାନ୍ତରିତ ଫାଇଲ ଆପ୍ ଭିତରେ ହିଁ ରହେ, ଯେଉଁଠି କୌଣସି ଫାଇଲ ମ୍ୟାନେଜର ପହଞ୍ଚି ପାରିବ ନାହିଁ।';

  @override
  String get storageEmpty => 'କିଛି ସାଇତା ହୋଇନାହିଁ';

  @override
  String storageUsage(String size) {
    return 'ସାଇତା ହୋଇଛି: $size';
  }

  @override
  String get storageClearTitle => 'ସାଇତା ଫାଇଲ ସଫା କରିବେ?';

  @override
  String get storageClearBody =>
      'ଆପ୍ ଏବେ ମଧ୍ୟ ରଖିଥିବା ପ୍ରତ୍ୟେକ ସମାପ୍ତ ଫଳାଫଳ ବିଲୋପ କରେ। ଆପଣ ପୂର୍ବରୁ ସାଇତି କିମ୍ବା ସେୟାର କରିଥିବା ଫାଇଲ ଅକ୍ଷତ ରହେ।';

  @override
  String get storageClearAction => 'ସଫା କରନ୍ତୁ';

  @override
  String storageCleared(String size) {
    return '$size ଖାଲି ହେଲା';
  }

  @override
  String get autoSaveLabel => 'ଫଳାଫଳ ସ୍ୱଚାଳିତ ଭାବରେ ସାଇତନ୍ତୁ';

  @override
  String get autoSaveHint =>
      'ପ୍ରତ୍ୟେକ ସମାପ୍ତ ଫାଇଲ ପ୍ରସ୍ତୁତ ହେବା ମାତ୍ରେ ଗ୍ୟାଲେରିରେ ରଖିଦିଏ — ଅଡିଓ ଡାଉନଲୋଡରେ।';

  @override
  String get lowSpaceTitle => 'ଅଧିକ ସ୍ଥାନ ବାକି ନାହିଁ';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ଏହି ବ୍ୟାଚ ପାଇଁ ପ୍ରାୟ $needed ଦରକାର ଏବଂ କେବଳ $free ଖାଲି ଅଛି। ରୂପାନ୍ତର ମଝିରେ ଅଟକି ଯାଇପାରେ।';
  }

  @override
  String saveAll(int count) {
    return 'ସବୁ ସାଇତନ୍ତୁ ($count)';
  }

  @override
  String savedAll(int count) {
    return 'ସାଇତାଗଲା: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$totalରୁ $saved ସାଇତାଗଲା';
  }

  @override
  String get presetFitPhotoTitle => 'ଫଟୋକୁ ଆକାରରେ ବସାନ୍ତୁ';

  @override
  String get presetFitPhotoBody =>
      'ଏକ ଛବିକୁ ନିର୍ଦ୍ଦିଷ୍ଟ ସୀମା ତଳକୁ ଆଣନ୍ତୁ — ଅପଲୋଡ ଫର୍ମ, ଆବେଦନ।';

  @override
  String get photoFitHint =>
      'ଗୋଟିଏ ବସିବା ପର୍ଯ୍ୟନ୍ତ ଆପ୍ ବିଭିନ୍ନ ଗୁଣବତ୍ତା ଚେଷ୍ଟା କରେ। ଯଦି ବଜେଟ ଛବି ପାଇଁ ବହୁତ ଛୋଟ ହୁଏ, ତେବେ ଏହା ଫ୍ରେମର ଆକାର ମଧ୍ୟ କମାଇଦିଏ।';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'KBରେ ଲକ୍ଷ୍ୟ ଆକାର';

  @override
  String get compareAction => 'ତୁଳନା';

  @override
  String get compareBefore => 'ପୂର୍ବରୁ';

  @override
  String get compareAfter => 'ପରେ';

  @override
  String get compareHint => 'ମୂଳ ଛବି ଦେଖିବା ପାଇଁ ଦବାଇ ଧରନ୍ତୁ।';

  @override
  String get trimStart => 'ଆରମ୍ଭ';

  @override
  String get trimEnd => 'ଶେଷ';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration ପର୍ଯ୍ୟନ୍ତ';
  }

  @override
  String get imageScaleLabel => 'ମାପ';

  @override
  String get audioChannelsLabel => 'ଚ୍ୟାନେଲ';

  @override
  String get audioMono => 'ମୋନୋ';

  @override
  String get audioStereo => 'ଷ୍ଟେରିଓ';

  @override
  String get sampleRateLabel => 'ସାମ୍ପଲ ରେଟ';

  @override
  String get voiceAudioHint =>
      '22.05 kHzରେ ମୋନୋ ଏକ ଭଏସ ରେକର୍ଡିଂକୁ ଶୁଣିବାଯୋଗ୍ୟ କ୍ଷତି ବିନା ପ୍ରାୟ ଏକ ଚତୁର୍ଥାଂଶ କରିଦିଏ। ସଙ୍ଗୀତ ପାଇଁ ଦୁଇଟିଯାକ ମୂଳ ଅବସ୍ଥାରେ ରଖନ୍ତୁ।';

  @override
  String get moveUp => 'ଉପରକୁ ନିଅନ୍ତୁ';

  @override
  String get moveDown => 'ତଳକୁ ନିଅନ୍ତୁ';

  @override
  String get renameOutput => 'ଫଳାଫଳର ନାମ ବଦଳାନ୍ତୁ';

  @override
  String get renameOutputHint => 'ନୂଆ ନାମ';

  @override
  String get renameOutputHelp =>
      'ଏକ୍ସଟେନସନ ଆଉଟପୁଟ ଫର୍ମାଟରୁ ଆସେ। ଫଳାଫଳକୁ ମୂଳ ଫାଇଲର ନାମ ଦେବା ପାଇଁ ଏହାକୁ ଖାଲି ଛାଡ଼ନ୍ତୁ।';

  @override
  String deleteOriginalsAction(int count) {
    return 'ମୂଳ ଫାଇଲ ବିଲୋପ କରନ୍ତୁ ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'ରୂପାନ୍ତର ପରେ ମୂଳ ଫାଇଲ ବିଲୋପ କରନ୍ତୁ';

  @override
  String get deleteOriginalsHint =>
      'ଫଳାଫଳ ସାଇତା ହେବା ପରେ ମୂଳ ଫାଇଲ ହଟାଇବାକୁ ସିଷ୍ଟମକୁ କୁହେ। ସିଷ୍ଟମ ସର୍ବଦା ଦେଖାଏ କଣ ଯିବ ଏବଂ ଆପଣଙ୍କ ନିଶ୍ଚିତିକରଣ ପାଇଁ ଅପେକ୍ଷା କରେ।';

  @override
  String originalsDeleted(String size) {
    return 'ମୂଳ ଫାଇଲ ବିଲୋପ ହେଲା — $size ଖାଲି ହେଲା';
  }

  @override
  String get originalsNoneDeleted =>
      'କିଛି ବିଲୋପ ହେଲା ନାହିଁ। କେବଳ ସେହି ଫାଇଲ ମିଳିପାରିବ ଯାହା ଗ୍ୟାଲେରି ଏବେ ମଧ୍ୟ ସେମାନଙ୍କ ମୂଳ ନାମରେ ରଖିଛି।';

  @override
  String reclaimedTotal(String size) {
    return 'ଏହି ଆପ୍ ଦେଇ ଖାଲି କରାଯାଇଛି: $size';
  }

  @override
  String get deleteAllData => 'ସମସ୍ତ ଡାଟା ବିଲୋପ କରନ୍ତୁ';

  @override
  String get deleteAllDataHint =>
      'ଏହି ଡିଭାଇସରେ ଆପ୍ ରଖିଥିବା ସବୁକିଛି ମିଟାଇଦିଏ: ଧାଡ଼ି, ରୂପାନ୍ତରିତ ଫାଇଲ, ପ୍ରିଭ୍ୟୁ, ସଫଳତା ଏବଂ ସେଟିଂସ। ଆପଣ ପୂର୍ବରୁ ନିଜ ଗ୍ୟାଲେରିରେ ସାଇତିଥିବା ଫାଇଲ ଛୁଆଁଯାଏ ନାହିଁ।';

  @override
  String get codecCopy => 'କପି';

  @override
  String get codecCopyRemux => 'କପି (ରିମକ୍ସ)';

  @override
  String get codecNoVideo => 'ଭିଡିଓ ନାହିଁ';

  @override
  String get codecNoAudio => 'ଅଡିଓ ନାହିଁ';

  @override
  String codecLossless(String codec) {
    return '$codec (କ୍ଷତିହୀନ)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (ଚଳନ୍ତି)';
  }

  @override
  String get sizeTargetEmail => 'ଇମେଲ';

  @override
  String get trimTimeHint => 'm:ss';
}
