// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class L10nUr extends L10n {
  L10nUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'تبدیل کریں';

  @override
  String get tabQueue => 'قطار';

  @override
  String get addFiles => 'فائلیں شامل کریں';

  @override
  String get emptySelectionTitle => 'ابھی کوئی فائل نہیں';

  @override
  String get emptySelectionBody =>
      'تصاویر، ویڈیو یا آڈیو شامل کریں۔ سب کچھ اسی ڈیوائس پر پروسیس ہوتا ہے۔';

  @override
  String get sectionOutput => 'آؤٹ پٹ';

  @override
  String get sectionVideo => 'ویڈیو';

  @override
  String get sectionAudio => 'آڈیو';

  @override
  String get sectionImage => 'تصویر';

  @override
  String get sectionPrivacy => 'رازداری';

  @override
  String get outputFormat => 'فارمیٹ';

  @override
  String get videoCodec => 'ویڈیو کوڈیک';

  @override
  String get audioCodec => 'آڈیو کوڈیک';

  @override
  String get rateControl => 'ریٹ کنٹرول';

  @override
  String get rateControlQuality => 'مستقل معیار (CRF)';

  @override
  String get rateControlBitrate => 'ہدف بٹ ریٹ';

  @override
  String crfLabel(int value) {
    return 'معیار (CRF $value)';
  }

  @override
  String get crfHint =>
      'قدر جتنی کم ہو، معیار اتنا بہتر اور فائل اتنی بڑی ہوتی ہے۔';

  @override
  String videoBitrate(int value) {
    return 'ویڈیو بٹ ریٹ: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'آڈیو بٹ ریٹ: $value kbps';
  }

  @override
  String get encodingPreset => 'اینکوڈر پری سیٹ';

  @override
  String get encodingPresetHint =>
      'سست پری سیٹ بہتر کمپریشن دیتے ہیں مگر ڈیوائس کو زیادہ گرم کرتے ہیں۔';

  @override
  String get presetOriginal => 'اصل';

  @override
  String get resolution => 'ریزولوشن';

  @override
  String get frameRate => 'فریم ریٹ';

  @override
  String imageQuality(int value) {
    return 'معیار: $value';
  }

  @override
  String get lossless => 'بغیر نقصان';

  @override
  String get losslessHint => 'بڑی فائلیں، پکسل کے لحاظ سے بالکل درست نتیجہ۔';

  @override
  String get sectionEnhance => 'بہتری';

  @override
  String get sharpenLabel => 'تیزی';

  @override
  String get sharpenHint =>
      'کناروں کو زیادہ واضح بناتا ہے۔ یہ کسی دھندلی یا فوکس سے باہر تصویر کو بحال نہیں کر سکتا — وہ تفصیل فائل میں موجود ہی نہیں۔';

  @override
  String get sharpenStrongHint =>
      'زیادہ شارپننگ کناروں پر روشن ہالے چھوڑ سکتی ہے۔ پہلے درمیانہ آزمائیں۔';

  @override
  String get denoiseLabel => 'شور میں کمی';

  @override
  String get denoiseHint =>
      'اندھیرے اور رات کی تصاویر کا دانہ صاف کرتا ہے۔ حد سے زیادہ ہو تو باریک تفصیل بھی ہموار ہو جاتی ہے۔';

  @override
  String get autoColorLabel => 'خودکار رنگ اور لیولز';

  @override
  String get autoColorHint =>
      'کنٹراسٹ بڑھاتا ہے اور پھیکے رنگوں کو تھوڑا نکھارتا ہے۔';

  @override
  String get upscaleLabel => 'اپ اسکیل 2×';

  @override
  String get upscaleHint =>
      'چوڑائی اور اونچائی دگنی کر دیتا ہے۔ یہ نئی تفصیل نہیں بناتا — پرنٹ یا کراپ کرتے وقت مدد دیتا ہے۔';

  @override
  String get upscaleConflictHint =>
      'اپ اسکیل کے لیے ریزولوشن دوبارہ ”اصل“ پر رکھیں۔';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'بند';

  @override
  String get enhanceLight => 'ہلکا';

  @override
  String get enhanceMedium => 'درمیانہ';

  @override
  String get enhanceStrong => 'زیادہ';

  @override
  String get stripMetadata => 'میٹا ڈیٹا ہٹائیں';

  @override
  String get stripMetadataHint =>
      'آؤٹ پٹ سے EXIF، GPS اور اوقات کی معلومات ہٹا دیتا ہے۔';

  @override
  String startConversion(int count) {
    return 'فائلیں تبدیل کریں ($count)';
  }

  @override
  String get batchResumed => 'رکا ہوا تبادلہ دوبارہ شروع کر دیا گیا۔';

  @override
  String get converting => 'تبدیل ہو رہا ہے…';

  @override
  String get cancelBatch => 'روکیں';

  @override
  String get cancelJob => 'منسوخ کریں';

  @override
  String get clearFinished => 'مکمل شدہ صاف کریں';

  @override
  String get removeJob => 'ہٹائیں';

  @override
  String get shareFile => 'شیئر کریں';

  @override
  String get retryJob => 'دوبارہ کوشش';

  @override
  String get queueEmptyTitle => 'قطار خالی ہے';

  @override
  String get queueEmptyBody =>
      '”تبدیل کریں“ ٹیب میں شامل کی گئی فائلیں یہاں دکھائی دیتی ہیں۔';

  @override
  String queueActiveTab(int count) {
    return 'فعال · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'مکمل · $count';
  }

  @override
  String get queueNoActiveTitle => 'کچھ جاری نہیں';

  @override
  String get queueNoActiveBody =>
      'انتظار میں یا تبدیل ہوتی ہوئی فائلیں یہاں نظر آتی ہیں۔';

  @override
  String get queueNoFinishedTitle => 'ابھی کچھ مکمل نہیں ہوا';

  @override
  String get queueNoFinishedBody =>
      'تبدیل شدہ فائلیں یہاں آتی ہیں — کھولنے، محفوظ کرنے یا شیئر کرنے کے لیے تیار۔';

  @override
  String get statusQueued => 'قطار میں';

  @override
  String get statusRunning => 'تبدیل ہو رہی ہے';

  @override
  String get statusCompleted => 'مکمل';

  @override
  String get statusFailed => 'ناکام';

  @override
  String get statusCancelled => 'منسوخ';

  @override
  String batchSummary(int done, int total) {
    return '$total میں سے $done مکمل';
  }

  @override
  String batchCompleted(int done) {
    return 'تبدیل شدہ فائلیں: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done تبدیل ہوئیں، $failed ناکام۔';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% چھوٹی';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% بڑی';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get themeSystem => 'سسٹم';

  @override
  String get language => 'زبان';

  @override
  String get languageSystem => 'سسٹم';

  @override
  String get privacyTitle => 'رازداری';

  @override
  String get privacyBody =>
      'Eluna Media آپ کی فائلیں مکمل طور پر اسی ڈیوائس پر، ساتھ شامل FFmpeg کی مدد سے تبدیل کرتا ہے۔ آپ کی فائلیں کبھی ڈیوائس سے باہر نہیں جاتیں، کسی اکاؤنٹ کی ضرورت نہیں، اور کوئی ٹیلی میٹری نہیں ہے۔ ایپ میں کچھ بھی نیٹ ورک استعمال نہیں کرتا — اس کے پاس انٹرنیٹ کی اجازت تک نہیں۔\n\nمیٹا ڈیٹا ہٹانا بطور طے شدہ آن ہے، اس لیے آپ کی برآمد کردہ فائلوں سے EXIF، GPS کوآرڈینیٹس اور اوقات ہٹا دیے جاتے ہیں۔';

  @override
  String get licenseTitle => 'لائسنس';

  @override
  String get licenseBody =>
      'یہ ایپ FFmpeg کو x264، x265 اور دیگر GPL اجزا کے ساتھ شامل کرتی ہے، اس لیے پوری ایپلیکیشن GNU GPL v3 کے تحت تقسیم کی جاتی ہے۔';

  @override
  String get sourceMissing => 'اصل فائل اب دستیاب نہیں۔';

  @override
  String get tabSettings => 'ترتیبات';

  @override
  String get introTitle => 'بنیاد سے نجی';

  @override
  String get introOfflineTitle => 'اسی ڈیوائس پر تبدیلی';

  @override
  String get introOfflineBody =>
      'سارا کام ساتھ شامل FFmpeg کرتا ہے۔ آپ کی فائلیں فون سے باہر نہیں جاتیں — تبدیلی ہوائی جہاز موڈ میں بھی چلتی ہے۔';

  @override
  String get introTelemetryTitle => 'کوئی ٹیلی میٹری نہیں';

  @override
  String get introTelemetryBody =>
      'نہ اکاؤنٹ، نہ اینالیٹکس، نہ کریش رپورٹنگ۔ ایپ کو معلوم ہی نہیں کہ آپ کون ہیں۔';

  @override
  String get introMetadataTitle => 'میٹا ڈیٹا آپ کے اختیار میں';

  @override
  String get introMetadataBody =>
      'ہر آؤٹ پٹ سے EXIF، GPS اور اوقات بطور طے شدہ ہٹا دیے جاتے ہیں۔ آپ یہ بند بھی کر سکتے ہیں۔';

  @override
  String get introFreeNote =>
      'مفت، بغیر اشتہارات اور بغیر سبسکرپشن۔ ہر خصوصیت، بشمول بیچ تبدیلی، شروع سے آپ کی ہے — خریدی صرف ایک ٹِپ جا سکتی ہے، اور اس سے کچھ بھی نہیں کھلتا۔';

  @override
  String get introContinue => 'شروع کریں';

  @override
  String get modeSimple => 'سادہ';

  @override
  String get modeAdvanced => 'تفصیلی';

  @override
  String get modeAdvancedHint =>
      'پری سیٹ کارڈز کے بجائے ہر کوڈیک، بٹ ریٹ اور ٹرانسفارم کنٹرول دکھاتا ہے۔';

  @override
  String get presetCompressVideoTitle => 'ویڈیو کمپریس کریں';

  @override
  String get presetCompressVideoBody => 'کہیں چھوٹی MP4، معیار اچھا رہتا ہے';

  @override
  String get presetFitToSizeTitle => 'سائز کے مطابق';

  @override
  String get presetFitToSizeBody => 'ایک مقررہ حد تک — Discord، ای میل، چیٹس';

  @override
  String get presetCompatibleMp4Title => 'ہم آہنگ MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC۔ ہر جگہ چلتی ہے';

  @override
  String get presetExtractAudioTitle => 'آڈیو نکالیں';

  @override
  String get presetExtractAudioBody => 'کسی بھی ویڈیو سے MP3';

  @override
  String get presetVideoToGifTitle => 'ویڈیو سے GIF';

  @override
  String get presetVideoToGifBody => 'مختصر کلپ کو متحرک GIF میں';

  @override
  String get presetMergeTitle => 'ویڈیوز ملائیں';

  @override
  String get presetMergeBody => 'کلپس کو ترتیب سے ایک MP4 میں جوڑیں';

  @override
  String get mergeNeedsTwo => 'ملانے کے لیے کم از کم دو ویڈیو منتخب کریں۔';

  @override
  String mergedVideoName(int count) {
    return 'ملی ہوئی ویڈیو ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'تصویر کمپریس کریں';

  @override
  String get presetCompressImageBody => 'چھوٹی JPEG، نقصان بمشکل نظر آتا ہے';

  @override
  String get presetEnhancePhotoTitle => 'تصویر بہتر بنائیں';

  @override
  String get presetEnhancePhotoBody => 'صاف تر، واضح تر، بہتر رنگ';

  @override
  String get presetImageToWebpTitle => 'تصویر سے WebP';

  @override
  String get presetImageToWebpBody => 'جدید فارمیٹ، JPEG سے چھوٹا';

  @override
  String get sizeTargetTitle => 'ہدف سائز';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'اپنی مرضی…';

  @override
  String get sizeTargetDialogTitle => 'ہدف سائز MB میں';

  @override
  String get sizeTargetTooSmall =>
      'اس دورانیے کے لیے ہدف بہت چھوٹا ہے؛ ممکنہ حد تک قریب ترین معیار استعمال کیا جائے گا۔';

  @override
  String estimatePerFile(String size) {
    return '≈ $size فی فائل';
  }

  @override
  String estimateTotal(String size) {
    return 'متوقع آؤٹ پٹ: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'منتخب فائلیں: $count';
  }

  @override
  String get promiseOffline => '100% آف لائن تبدیلی';

  @override
  String get promiseBatchFree => 'بیچ مفت ہے';

  @override
  String get promiseNoWatermark => 'کوئی واٹر مارک نہیں';

  @override
  String get sectionTransform => 'ٹرانسفارم';

  @override
  String get rotateLabel => 'گھمائیں';

  @override
  String get flipLabel => 'افقی طور پر آئینہ';

  @override
  String get speedLabel => 'رفتار';

  @override
  String get cropLabel => 'کراپ';

  @override
  String get cropHint =>
      'منتخب تناسب کے مطابق درمیان سے کراپ — فیڈ کے لیے مربع، اسٹوریز کے لیے 9:16۔';

  @override
  String volumeLabel(int percent) {
    return 'آواز: $percent%';
  }

  @override
  String get addAudioFiles => 'آڈیو اور دیگر فائلیں';

  @override
  String get hwEncoderLabel => 'ہارڈویئر اینکوڈنگ';

  @override
  String get hwEncoderHint =>
      'بٹ ریٹ اور سائز کے مطابق موڈ میں ڈیوائس کی ویڈیو چپ استعمال کرتا ہے — کہیں تیز اور کم گرم۔ معیار (CRF) موڈ ہمیشہ درست سافٹ ویئر اینکوڈر استعمال کرتا ہے، اور ناکام ہارڈویئر کام خودکار طور پر سافٹ ویئر پر دوبارہ چلتا ہے۔';

  @override
  String get transformNeedsReencode =>
      'گھمانا، آئینہ اور رفتار کے لیے دوبارہ اینکوڈنگ ضروری ہے، اس لیے اسٹریم کاپی کے دوران یہ بند رہتے ہیں۔';

  @override
  String get capBitrateLabel => 'فائل کبھی بڑی نہ کریں';

  @override
  String get capBitrateHint =>
      'اینکوڈنگ کو ماخذ کے اپنے بٹ ریٹ تک محدود رکھتا ہے۔ مستقل معیار کی اپنی کوئی حد نہیں ہوتی، اس لیے پہلے سے کمپریس شدہ ویڈیو ورنہ بڑی نکل سکتی ہے۔';

  @override
  String get keepSubtitles => 'سب ٹائٹل رکھیں';

  @override
  String get keepSubtitlesHint =>
      'سب ٹائٹل ٹریک آؤٹ پٹ میں منتقل کرتا ہے۔ صرف متنی سب ٹائٹل۔';

  @override
  String get sectionTrim => 'ٹرم';

  @override
  String get trimEnable => 'ماخذ کو ٹرم کریں';

  @override
  String get trimHint =>
      'جب قطار میں معلوم دورانیے والی بالکل ایک فائل ہو تو دستیاب ہے۔';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ہدف سائز';

  @override
  String get lowBatteryTitle => 'بیٹری کم ہے';

  @override
  String get lowBatteryBody =>
      'تبدیلی پروسیسر پر خاصا بوجھ ڈالتی ہے۔ آپ پہلے چارجر لگا سکتے ہیں، یا پھر بھی جاری رکھ سکتے ہیں۔';

  @override
  String get lowBatteryContinue => 'پھر بھی تبدیل کریں';

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String get commonOk => 'ٹھیک ہے';

  @override
  String filesReceived(int count) {
    return 'موصول فائلیں: $count';
  }

  @override
  String get saveFile => 'محفوظ کریں';

  @override
  String get savedToGallery =>
      'گیلری میں البم ”Eluna Media“ کے اندر محفوظ ہو گئی۔';

  @override
  String get savedToDownloads => 'Downloads میں محفوظ ہو گئی۔';

  @override
  String get saveFailed => 'فائل محفوظ نہیں ہو سکی۔';

  @override
  String get jobRemovedUndo => 'کام ہٹا دیا گیا۔';

  @override
  String get finishedClearedUndo => 'مکمل شدہ کام صاف کر دیے گئے۔';

  @override
  String get undo => 'واپس کریں';

  @override
  String get errorDetailsTitle => 'خرابی کی تفصیل';

  @override
  String get sectionConversionPrefs => 'تبدیلی';

  @override
  String get powerModeLabel => 'پاور موڈ';

  @override
  String get powerEfficiency => 'ٹھنڈا اور تیز';

  @override
  String get powerBalanced => 'متوازن';

  @override
  String get powerQuality => 'زیادہ سے زیادہ کمپریشن';

  @override
  String get powerModeHint =>
      'ویڈیو اینکوڈر کتنی محنت کرے۔ ٹھنڈا اور تیز ہونے کا مطلب کچھ بڑی فائلیں ہیں۔ اس کے سوا کسی چیز کو محدود نہیں کیا جاتا — کبھی نہیں۔';

  @override
  String get hapticsLabel => 'وائبریشن فیڈ بیک';

  @override
  String get networkPrivacyTitle => 'نیٹ ورک اور رازداری';

  @override
  String get netAuditIntro =>
      'اس ایپ میں ہر اُس چیز کی مکمل فہرست جو نیٹ ورک کو چھو سکتی ہے۔';

  @override
  String get netAuditNoneTitle => 'نیٹ ورک تک کوئی رسائی نہیں';

  @override
  String get netAuditNoneBody =>
      'ایپ انٹرنیٹ کی اجازت مانگتی ہی نہیں، اس لیے چاہے بھی تو نیٹ ورک تک نہیں پہنچ سکتی — آپ یہ سسٹم کی ایپ معلومات میں دیکھ سکتے ہیں۔ نہ اشتہارات، نہ اینالیٹکس، نہ اپ ڈیٹ کی جانچ۔ ”ایپ کو ریٹ کریں“ کام اسٹور ایپ کے حوالے کر دیتا ہے، جو اپنی بات چیت خود کرتی ہے۔';

  @override
  String get netAuditConversionTitle => 'تبدیلی';

  @override
  String get netAuditConversionBody =>
      'سب کچھ اسی ڈیوائس پر ساتھ شامل FFmpeg کے ذریعے چلتا ہے۔ ہوائی جہاز موڈ آن کر کے تبدیل کریں — کام کرتا ہے۔';

  @override
  String get netAuditTelemetryTitle => 'ٹیلی میٹری';

  @override
  String get netAuditTelemetryBody =>
      'کوئی نہیں ہے۔ ایپ نہ اینالیٹکس جمع کرتی ہے، نہ کریش رپورٹس، نہ شناخت کنندہ، اور اس میں اکاؤنٹ کا نظام سرے سے نہیں۔';

  @override
  String get netAuditTipsTitle => 'ٹِپ';

  @override
  String get netAuditTipsBody =>
      'ٹِپ کا لین دین Play Store ایپ کرتی ہے، یہ ایپ نہیں — جس کے پاس اب بھی انٹرنیٹ کی اجازت نہیں۔ بلنگ اجازتوں کی فہرست میں دو سطریں ضرور بڑھا دیتی ہے: ”ایپ کے اندر خریداری“ اور ”نیٹ ورک کنکشن دیکھنا“، جو صرف یہ پڑھتی ہے کہ کنکشن موجود ہے یا نہیں اور اسے استعمال نہیں کر سکتی۔ کچھ بھی خودکار طور پر نہیں خریدا جاتا، اور ٹِپ سے کچھ نہیں کھلتا: یہاں ہر خصوصیت مفت ہے۔';

  @override
  String get sectionSupport => 'معاونت';

  @override
  String get rateApp => 'ایپ کو ریٹ کریں';

  @override
  String get openLicenses => 'اوپن سورس لائسنس';

  @override
  String get presetAudioToMp3Title => 'آڈیو تبدیل کریں';

  @override
  String get presetAudioToMp3Body => 'MP3 میں — ہر چیز پر چلتی ہے';

  @override
  String get presetCompressAudioTitle => 'آڈیو کمپریس کریں';

  @override
  String get presetCompressAudioBody => 'ہلکی AAC — وائس نوٹس، پوڈکاسٹ';

  @override
  String get convertTo => 'اس میں تبدیل کریں';

  @override
  String get formatSectionHint =>
      'صرف وہی فارمیٹ دکھائے جاتے ہیں جن میں آپ کی فائلیں واقعی بدل سکتی ہیں۔';

  @override
  String get sourceVideo => 'ویڈیو';

  @override
  String get sourceImage => 'تصویر';

  @override
  String get sourceAudio => 'آڈیو';

  @override
  String get sourceUnknown => 'فائل';

  @override
  String get mixedSelectionTitle => 'مختلف اقسام کی فائلیں منتخب ہیں';

  @override
  String get mixedSelectionBody =>
      'ہر فائل اپنی قسم کے بہترین پری سیٹ سے تبدیل ہوتی ہے۔ مکمل اختیار کے لیے ایک وقت میں ایک ہی قسم شامل کریں۔';

  @override
  String get filesTitle => 'فائلیں';

  @override
  String get removeFile => 'ہٹائیں';

  @override
  String timeLeft(String time) {
    return '≈ $time باقی';
  }

  @override
  String get jobSettingsTitle => 'تبدیلی کی ترتیبات';

  @override
  String get jobDetails => 'تفصیلات';

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
  String get summaryEnhanced => 'بہتر کی گئی';

  @override
  String get summaryMetadataStripped => 'میٹا ڈیٹا ہٹا دیا گیا';

  @override
  String summaryMerge(int count) {
    return 'ملائے گئے کلپس: $count';
  }

  @override
  String get shareApp => 'ایپ شیئر کریں';

  @override
  String get shareAppText =>
      'Eluna Media — مفت، مکمل آف لائن تصویر، ویڈیو اور آڈیو کنورٹر۔ نہ سبسکرپشن، نہ واٹر مارک، نہ اکاؤنٹ۔';

  @override
  String appVersionLabel(String version) {
    return 'ورژن $version';
  }

  @override
  String get openFile => 'کھولیں';

  @override
  String get openFolder => 'فولڈر دکھائیں';

  @override
  String get noAppToOpen => 'اس ڈیوائس پر کوئی ایپ یہ فائل نہیں کھول سکتی۔';

  @override
  String get openFailed => 'فائل کھولی نہیں جا سکی۔';

  @override
  String get twoPassLabel => 'درست سائز کے لیے دو مرحلے';

  @override
  String get twoPassHint =>
      'سائز کے مطابق کام دو بار اینکوڈ ہوتے ہیں اور بائٹ کے بجٹ پر نمایاں طور پر زیادہ درستی سے پہنچتے ہیں — تقریباً دگنے وقت اور بیٹری کے بدلے۔';

  @override
  String get whatsNewTitle => 'نیا کیا ہے';

  @override
  String get whatsNew1 =>
      'ویڈیو اب AV1 میں بھی ہو سکتی ہے: نمایاں طور پر چھوٹی فائلیں، اگر آپ ان کا انتظار کر سکیں۔';

  @override
  String get whatsNew2 =>
      'تصاویر کے لیے نیا: AVIF، تقریباً آدھی JPEG، اور GIF کی جگہ متحرک WebP۔';

  @override
  String get whatsNew3 =>
      'M4A بغیر نقصان بھی ہو سکتی ہے — ALAC اب AAC کے ساتھ موجود ہے۔';

  @override
  String get whatsNew4 =>
      'ظاہری شکل کے لیے ایک ہی اسکرین: روشنی، ایکسنٹ رنگ، خالص سیاہ OLED اور Material You۔';

  @override
  String get whatsNew5 =>
      'کارناموں کے لیے تمغے، تین ٹیب، اور پیش رفت جسے آپ تصویر کے طور پر شیئر کر سکتے ہیں۔';

  @override
  String get achievementsTitle => 'کارنامے';

  @override
  String achievementsProgress(int done, int total) {
    return '$total میں سے $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'صرف اسی ڈیوائس پر شمار ہوتے ہیں۔ کہیں کچھ اپ لوڈ نہیں ہوتا۔';

  @override
  String get achFirstConversionTitle => 'پہلے قدم';

  @override
  String get achFirstConversionBody => 'اپنی پہلی فائل تبدیل کریں۔';

  @override
  String get achTenConversionsTitle => 'ہاتھ کھل گیا';

  @override
  String get achTenConversionsBody => '10 فائلیں تبدیل کریں۔';

  @override
  String get achFiftyConversionsTitle => 'باقاعدہ';

  @override
  String get achFiftyConversionsBody => '50 فائلیں تبدیل کریں۔';

  @override
  String get achTwoHundredConversionsTitle => 'محنت کش';

  @override
  String get achTwoHundredConversionsBody => '200 فائلیں تبدیل کریں۔';

  @override
  String get achThousandConversionsTitle => 'کنویئر';

  @override
  String get achThousandConversionsBody => '1000 فائلیں تبدیل کریں۔';

  @override
  String get achSaved100MbTitle => 'جگہ بچانے والا';

  @override
  String get achSaved100MbBody => 'کل ملا کر 100 MB خالی کریں۔';

  @override
  String get achSaved1GbTitle => 'گیگا بائٹ کا شکاری';

  @override
  String get achSaved1GbBody => 'کل ملا کر 1 GB خالی کریں۔';

  @override
  String get achSaved10GbTitle => 'اسٹوریج کا ہیرو';

  @override
  String get achSaved10GbBody => 'کل ملا کر 10 GB خالی کریں۔';

  @override
  String get achBatchOfFiveTitle => 'بیچ کارکن';

  @override
  String get achBatchOfFiveBody => '5 یا زیادہ فائلوں کا ایک بیچ مکمل کریں۔';

  @override
  String get achBatchOfTwentyTitle => 'اسمبلی لائن';

  @override
  String get achBatchOfTwentyBody => '20 یا زیادہ فائلوں کا ایک بیچ مکمل کریں۔';

  @override
  String get achSniperTitle => 'نشانہ باز';

  @override
  String get achSniperBody => 'سائز کے مطابق موڈ سے بالکل درست سائز حاصل کریں۔';

  @override
  String get achMemeSmithTitle => 'میم ساز';

  @override
  String get achMemeSmithBody => 'ایک ویڈیو کو GIF میں بدلیں۔';

  @override
  String get achSoundHunterTitle => 'آواز کا شکاری';

  @override
  String get achSoundHunterBody => 'کسی ویڈیو سے آڈیو نکالیں۔';

  @override
  String get achSubtitleKeeperTitle => 'سب ٹائٹل کا محافظ';

  @override
  String get achSubtitleKeeperBody =>
      'سب ٹائٹل برقرار رکھتے ہوئے ایک ویڈیو تبدیل کریں۔';

  @override
  String get achDirectorTitle => 'ہدایت کار';

  @override
  String get achDirectorBody =>
      'کوئی ٹرانسفارم لگائیں — گھمانا، کراپ، رفتار یا آواز۔';

  @override
  String get achAllRounderTitle => 'ہمہ جہت';

  @override
  String get achAllRounderBody => 'ویڈیو، آڈیو اور ایک تصویر تبدیل کریں۔';

  @override
  String get achNightOwlTitle => 'رات کا جاگنے والا';

  @override
  String get achNightOwlBody =>
      'آدھی رات سے صبح 5 بجے کے درمیان کوئی تبدیلی مکمل کریں۔';

  @override
  String get achPlatinumTitle => 'پلاٹینم';

  @override
  String get achPlatinumBody => 'باقی سارے کارنامے حاصل کریں۔';

  @override
  String get storageTitle => 'اسٹوریج';

  @override
  String get storageBody =>
      'تبدیل شدہ فائلیں محفوظ یا شیئر کرنے تک ایپ کے اندر ہی رہتی ہیں، جہاں کوئی فائل مینیجر ان تک نہیں پہنچ سکتا۔';

  @override
  String get storageEmpty => 'کچھ محفوظ نہیں';

  @override
  String storageUsage(String size) {
    return 'محفوظ: $size';
  }

  @override
  String get storageClearTitle => 'محفوظ فائلیں صاف کریں؟';

  @override
  String get storageClearBody =>
      'ایپ کے پاس موجود ہر مکمل شدہ نتیجہ حذف کر دیتا ہے۔ جو فائلیں آپ پہلے ہی محفوظ یا شیئر کر چکے ہیں، انہیں کچھ نہیں ہوتا۔';

  @override
  String get storageClearAction => 'صاف کریں';

  @override
  String storageCleared(String size) {
    return '$size خالی ہوئی';
  }

  @override
  String get autoSaveLabel => 'نتائج خودکار طور پر محفوظ کریں';

  @override
  String get autoSaveHint =>
      'ہر مکمل فائل تیار ہوتے ہی گیلری میں رکھ دیتا ہے — آڈیو Downloads میں۔';

  @override
  String get lowSpaceTitle => 'جگہ زیادہ نہیں بچی';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'اس بیچ کو تقریباً $needed چاہیے اور صرف $free خالی ہے۔ تبدیلی درمیان میں رک سکتی ہے۔';
  }

  @override
  String saveAll(int count) {
    return 'سب محفوظ کریں ($count)';
  }

  @override
  String savedAll(int count) {
    return 'محفوظ: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total میں سے $saved محفوظ ہوئیں';
  }

  @override
  String get presetFitPhotoTitle => 'تصویر سائز کے مطابق';

  @override
  String get presetFitPhotoBody =>
      'تصویر کو ایک مقررہ حد سے نیچے لائیں — اپ لوڈ فارم، درخواستیں۔';

  @override
  String get photoFitHint =>
      'ایپ مختلف معیار آزماتی رہتی ہے یہاں تک کہ کوئی حد میں آ جائے۔ اگر بجٹ تصویر کے لیے بہت چھوٹا ہو تو فریم کا سائز بھی کم کر دیتی ہے۔';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'ہدف سائز KB میں';

  @override
  String get compareAction => 'موازنہ';

  @override
  String get compareBefore => 'پہلے';

  @override
  String get compareAfter => 'بعد';

  @override
  String get compareHint => 'اصل دیکھنے کے لیے دبا کر رکھیں۔';

  @override
  String get trimStart => 'آغاز';

  @override
  String get trimEnd => 'اختتام';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss، $duration تک';
  }

  @override
  String get imageScaleLabel => 'اسکیل';

  @override
  String get audioChannelsLabel => 'چینلز';

  @override
  String get audioMono => 'مونو';

  @override
  String get audioStereo => 'اسٹیریو';

  @override
  String get sampleRateLabel => 'سیمپل ریٹ';

  @override
  String get voiceAudioHint =>
      '22.05 kHz پر مونو کسی آواز کی ریکارڈنگ کو تقریباً چوتھائی کر دیتا ہے، بغیر کسی سنائی دینے والے نقصان کے۔ موسیقی کے لیے دونوں کو اصل پر رہنے دیں۔';

  @override
  String get moveUp => 'اوپر لے جائیں';

  @override
  String get moveDown => 'نیچے لے جائیں';

  @override
  String get renameOutput => 'نتیجے کا نام بدلیں';

  @override
  String get renameOutputHint => 'نیا نام';

  @override
  String get renameOutputHelp =>
      'ایکسٹینشن آؤٹ پٹ فارمیٹ سے آتی ہے۔ نتیجے کا نام ماخذ کے مطابق رکھنے کے لیے اسے خالی چھوڑ دیں۔';

  @override
  String deleteOriginalsAction(int count) {
    return 'اصل فائلیں حذف کریں ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'تبدیلی کے بعد اصل فائلیں حذف کریں';

  @override
  String get deleteOriginalsHint =>
      'نتیجہ محفوظ ہو جانے کے بعد سسٹم سے ماخذ فائلیں ہٹانے کو کہتا ہے۔ سسٹم ہمیشہ دکھاتا ہے کہ کیا حذف ہوگا اور آپ کی تصدیق کا انتظار کرتا ہے۔';

  @override
  String originalsDeleted(String size) {
    return 'اصل فائلیں حذف ہو گئیں — $size خالی ہوئی';
  }

  @override
  String get originalsNoneDeleted =>
      'کچھ حذف نہیں ہوا۔ صرف وہی فائلیں مل سکتی ہیں جو گیلری میں اب بھی اپنے اصل نام سے موجود ہوں۔';

  @override
  String reclaimedTotal(String size) {
    return 'اس ایپ سے خالی ہوئی: $size';
  }

  @override
  String get deleteAllData => 'تمام ڈیٹا حذف کریں';

  @override
  String get deleteAllDataHint =>
      'ایپ اس ڈیوائس پر جو کچھ رکھتی ہے سب مٹا دیتا ہے: قطار، تبدیل شدہ فائلیں، پیش نظارے، کارنامے اور ترتیبات۔ جو فائلیں آپ پہلے ہی گیلری میں محفوظ کر چکے ہیں، وہ محفوظ رہتی ہیں۔';

  @override
  String get codecCopy => 'کاپی';

  @override
  String get codecCopyRemux => 'کاپی (ریمکس)';

  @override
  String get codecNoVideo => 'ویڈیو نہیں';

  @override
  String get codecNoAudio => 'آڈیو نہیں';

  @override
  String codecLossless(String codec) {
    return '$codec (بغیر نقصان)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (متحرک)';
  }

  @override
  String get sizeTargetEmail => 'ای میل';

  @override
  String get trimTimeHint => 'm:ss';
}
