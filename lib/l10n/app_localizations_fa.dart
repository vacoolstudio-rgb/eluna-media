// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class L10nFa extends L10n {
  L10nFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'تبدیل';

  @override
  String get tabQueue => 'صف';

  @override
  String get addFiles => 'افزودن فایل';

  @override
  String get emptySelectionTitle => 'هنوز فایلی نیست';

  @override
  String get emptySelectionBody =>
      'عکس، ویدیو یا صدا اضافه کنید. همه‌چیز روی همین دستگاه پردازش می‌شود.';

  @override
  String get sectionOutput => 'خروجی';

  @override
  String get sectionVideo => 'ویدیو';

  @override
  String get sectionAudio => 'صدا';

  @override
  String get sectionImage => 'تصویر';

  @override
  String get sectionPrivacy => 'حریم خصوصی';

  @override
  String get outputFormat => 'قالب';

  @override
  String get videoCodec => 'کدک ویدیو';

  @override
  String get audioCodec => 'کدک صدا';

  @override
  String get rateControl => 'کنترل نرخ';

  @override
  String get rateControlQuality => 'کیفیت ثابت (CRF)';

  @override
  String get rateControlBitrate => 'نرخ بیت هدف';

  @override
  String crfLabel(int value) {
    return 'کیفیت (CRF $value)';
  }

  @override
  String get crfHint => 'مقدار کمتر یعنی کیفیت بهتر و فایل بزرگ‌تر.';

  @override
  String videoBitrate(int value) {
    return 'نرخ بیت ویدیو: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'نرخ بیت صدا: $value kbps';
  }

  @override
  String get encodingPreset => 'پیش‌تنظیم رمزگذار';

  @override
  String get encodingPresetHint =>
      'پیش‌تنظیم‌های کندتر بهتر فشرده می‌کنند، اما دستگاه را بیشتر گرم می‌کنند.';

  @override
  String get presetOriginal => 'اصلی';

  @override
  String get resolution => 'وضوح';

  @override
  String get frameRate => 'نرخ فریم';

  @override
  String imageQuality(int value) {
    return 'کیفیت: $value';
  }

  @override
  String get lossless => 'بدون افت';

  @override
  String get losslessHint => 'فایل‌های بزرگ‌تر، خروجی دقیقاً پیکسل‌به‌پیکسل.';

  @override
  String get sectionEnhance => 'بهبود';

  @override
  String get sharpenLabel => 'تیزی';

  @override
  String get sharpenHint =>
      'لبه‌ها را واضح‌تر می‌کند. نمی‌تواند عکس تار یا خارج از فوکوس را برگرداند — آن جزئیات در فایل نیست.';

  @override
  String get sharpenStrongHint =>
      'تیز کردن زیاد می‌تواند هاله‌های روشن کنار لبه‌ها به جا بگذارد. اول متوسط را امتحان کنید.';

  @override
  String get denoiseLabel => 'کاهش نویز';

  @override
  String get denoiseHint =>
      'دانه‌دانگی عکس‌های تاریک و شبانه را پاک می‌کند. زیاده‌روی، جزئیات ریز را هم صاف می‌کند.';

  @override
  String get autoColorLabel => 'رنگ و ترازهای خودکار';

  @override
  String get autoColorHint =>
      'کنتراست را گسترده می‌کند و رنگ‌های تخت را کمی زنده‌تر می‌کند.';

  @override
  String get upscaleLabel => 'بزرگ‌نمایی ۲×';

  @override
  String get upscaleHint =>
      'عرض و ارتفاع را دو برابر می‌کند. جزئیات اضافه نمی‌کند — برای چاپ یا برش به کار می‌آید.';

  @override
  String get upscaleConflictHint =>
      'برای بزرگ‌نمایی، وضوح را به اصلی برگردانید.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'خاموش';

  @override
  String get enhanceLight => 'کم';

  @override
  String get enhanceMedium => 'متوسط';

  @override
  String get enhanceStrong => 'زیاد';

  @override
  String get stripMetadata => 'حذف فراداده';

  @override
  String get stripMetadataHint =>
      'EXIF، GPS و مهرهای زمانی را از خروجی حذف می‌کند.';

  @override
  String startConversion(int count) {
    return 'تبدیل $count فایل';
  }

  @override
  String get batchResumed => 'تبدیل نیمه‌کاره از سر گرفته شد.';

  @override
  String get converting => 'در حال تبدیل…';

  @override
  String get cancelBatch => 'توقف';

  @override
  String get cancelJob => 'لغو';

  @override
  String get clearFinished => 'پاک کردن پایان‌یافته‌ها';

  @override
  String get removeJob => 'حذف';

  @override
  String get shareFile => 'اشتراک‌گذاری';

  @override
  String get retryJob => 'تلاش دوباره';

  @override
  String get queueEmptyTitle => 'صف خالی است';

  @override
  String get queueEmptyBody =>
      'فایل‌هایی که در زبانهٔ تبدیل اضافه می‌کنید اینجا نمایش داده می‌شوند.';

  @override
  String queueActiveTab(int count) {
    return 'فعال · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'پایان‌یافته · $count';
  }

  @override
  String get queueNoActiveTitle => 'چیزی در جریان نیست';

  @override
  String get queueNoActiveBody =>
      'فایل‌های در انتظار یا در حال تبدیل اینجا نشان داده می‌شوند.';

  @override
  String get queueNoFinishedTitle => 'هنوز چیزی تمام نشده';

  @override
  String get queueNoFinishedBody =>
      'فایل‌های تبدیل‌شده اینجا می‌نشینند، آمادهٔ باز کردن، ذخیره یا اشتراک‌گذاری.';

  @override
  String get statusQueued => 'در صف';

  @override
  String get statusRunning => 'در حال تبدیل';

  @override
  String get statusCompleted => 'انجام شد';

  @override
  String get statusFailed => 'ناموفق';

  @override
  String get statusCancelled => 'لغو شد';

  @override
  String batchSummary(int done, int total) {
    return '$done از $total انجام شد';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done فایل تبدیل شد',
      one: 'یک فایل تبدیل شد',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done تبدیل شد، $failed ناموفق بود.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent٪ کوچک‌تر';
  }

  @override
  String grewPercent(int percent) {
    return '$percent٪ بزرگ‌تر';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'ظاهر';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get language => 'زبان';

  @override
  String get languageSystem => 'سیستم';

  @override
  String get privacyTitle => 'حریم خصوصی';

  @override
  String get privacyBody =>
      'Eluna Media فایل‌های شما را کاملاً روی همین دستگاه و با نسخه‌ای از FFmpeg که همراه برنامه است تبدیل می‌کند. فایل‌ها هرگز از دستگاه بیرون نمی‌روند، حساب کاربری لازم نیست و هیچ داده‌ای گزارش نمی‌شود. هیچ بخشی از برنامه اصلاً از شبکه استفاده نمی‌کند — حتی اجازهٔ اینترنت را هم ندارد.\n\nحذف فراداده به‌طور پیش‌فرض روشن است، پس EXIF، مختصات GPS و مهرهای زمانی از فایل‌هایی که خروجی می‌گیرید برداشته می‌شوند.';

  @override
  String get licenseTitle => 'مجوز';

  @override
  String get licenseBody =>
      'این برنامه FFmpeg ساخته‌شده با x264، x265 و دیگر اجزای GPL را همراه دارد، پس کل برنامه تحت GNU GPL v3 منتشر می‌شود.';

  @override
  String get sourceMissing => 'فایل مبدأ دیگر در دسترس نیست.';

  @override
  String get tabSettings => 'تنظیمات';

  @override
  String get introTitle => 'خصوصی از پایه';

  @override
  String get introOfflineTitle => 'روی همین دستگاه تبدیل می‌کند';

  @override
  String get introOfflineBody =>
      'نسخه‌ای از FFmpeg که همراه برنامه است همهٔ کار را انجام می‌دهد. فایل‌های شما هرگز از گوشی بیرون نمی‌روند — تبدیل در حالت پرواز هم کار می‌کند.';

  @override
  String get introTelemetryTitle => 'بدون هیچ گزارش‌دهی';

  @override
  String get introTelemetryBody =>
      'نه حساب کاربری، نه تحلیل رفتار، نه گزارش خرابی. برنامه نمی‌داند شما که هستید.';

  @override
  String get introMetadataTitle => 'فراداده زیر کنترل شما';

  @override
  String get introMetadataBody =>
      'EXIF، GPS و مهرهای زمانی به‌طور پیش‌فرض از هر خروجی حذف می‌شوند. می‌توانید این را خاموش کنید.';

  @override
  String get introFreeNote =>
      'رایگان، بدون تبلیغ و بدون اشتراک. همهٔ امکانات، از جمله تبدیل دسته‌ای، از همان ابتدا در اختیار شماست — تنها چیزی که می‌شود خرید یک انعام است، و هیچ چیزی را باز نمی‌کند.';

  @override
  String get introContinue => 'شروع کنیم';

  @override
  String get modeSimple => 'ساده';

  @override
  String get modeAdvanced => 'پیشرفته';

  @override
  String get modeAdvancedHint =>
      'به‌جای کارت‌های آماده، همهٔ کدک‌ها، نرخ بیت‌ها و ابزارهای تغییر را نشان می‌دهد.';

  @override
  String get presetCompressVideoTitle => 'فشرده‌سازی ویدیو';

  @override
  String get presetCompressVideoBody => 'MP4 بسیار کوچک‌تر، کیفیت همچنان خوب';

  @override
  String get presetFitToSizeTitle => 'جا شدن در اندازه';

  @override
  String get presetFitToSizeBody =>
      'رسیدن به سقفی دقیق — Discord، ایمیل، گفتگوها';

  @override
  String get presetCompatibleMp4Title => 'MP4 سازگار';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. همه‌جا پخش می‌شود';

  @override
  String get presetExtractAudioTitle => 'استخراج صدا';

  @override
  String get presetExtractAudioBody => 'MP3 از هر ویدیویی';

  @override
  String get presetVideoToGifTitle => 'ویدیو به GIF';

  @override
  String get presetVideoToGifBody => 'کلیپ کوتاه به یک GIF متحرک';

  @override
  String get presetMergeTitle => 'ادغام ویدیوها';

  @override
  String get presetMergeBody => 'دوختن کلیپ‌ها در یک MP4، به ترتیب';

  @override
  String get mergeNeedsTwo => 'برای ادغام دست‌کم دو ویدیو انتخاب کنید.';

  @override
  String mergedVideoName(int count) {
    return 'ویدیوی ادغام‌شده ($count کلیپ).mp4';
  }

  @override
  String get presetCompressImageTitle => 'فشرده‌سازی عکس';

  @override
  String get presetCompressImageBody => 'JPEG کوچک‌تر، افت به‌سختی دیده می‌شود';

  @override
  String get presetEnhancePhotoTitle => 'بهبود عکس';

  @override
  String get presetEnhancePhotoBody => 'تمیزتر، شفاف‌تر، رنگ بهتر';

  @override
  String get presetImageToWebpTitle => 'عکس به WebP';

  @override
  String get presetImageToWebpBody => 'قالبی امروزی، کوچک‌تر از JPEG';

  @override
  String get sizeTargetTitle => 'اندازهٔ هدف';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'دلخواه…';

  @override
  String get sizeTargetDialogTitle => 'اندازهٔ هدف به MB';

  @override
  String get sizeTargetTooSmall =>
      'هدف برای این مدت زمان خیلی کوچک است؛ نزدیک‌ترین کیفیت ممکن استفاده می‌شود.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size برای هر فایل';
  }

  @override
  String estimateTotal(String size) {
    return 'خروجی تخمینی: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فایل انتخاب شد',
      one: 'یک فایل انتخاب شد',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => 'تبدیل ۱۰۰٪ آفلاین';

  @override
  String get promiseBatchFree => 'تبدیل دسته‌ای رایگان';

  @override
  String get promiseNoWatermark => 'بدون واترمارک';

  @override
  String get sectionTransform => 'تغییر شکل';

  @override
  String get rotateLabel => 'چرخش';

  @override
  String get flipLabel => 'آینه‌کردن افقی';

  @override
  String get speedLabel => 'سرعت';

  @override
  String get cropLabel => 'برش';

  @override
  String get cropHint =>
      'برش از مرکز با نسبت ابعاد انتخابی — مربع برای فید، 9:16 برای استوری.';

  @override
  String volumeLabel(int percent) {
    return 'بلندی صدا: $percent٪';
  }

  @override
  String get addAudioFiles => 'صدا و فایل‌های دیگر';

  @override
  String get hwEncoderLabel => 'رمزگذاری سخت‌افزاری';

  @override
  String get hwEncoderHint =>
      'در حالت‌های نرخ بیت و جا شدن در اندازه از تراشهٔ ویدیوی دستگاه استفاده می‌کند — بسیار سریع‌تر و خنک‌تر. حالت کیفیت (CRF) همیشه از رمزگذار نرم‌افزاری دقیق استفاده می‌کند، و کاری که روی سخت‌افزار شکست بخورد به‌طور خودکار با نرم‌افزار دوباره اجرا می‌شود.';

  @override
  String get transformNeedsReencode =>
      'چرخش، آینه و سرعت نیاز به رمزگذاری دوباره دارند، پس هنگام کپی جریان خاموش‌اند.';

  @override
  String get capBitrateLabel => 'فایل هرگز بزرگ‌تر نشود';

  @override
  String get capBitrateHint =>
      'رمزگذاری را به نرخ بیت خودِ مبدأ محدود می‌کند. کیفیت ثابت سقفی از خود ندارد، پس ویدیویی که از پیش فشرده شده وگرنه ممکن است بزرگ‌تر از آب دربیاید.';

  @override
  String get keepSubtitles => 'نگه داشتن زیرنویس‌ها';

  @override
  String get keepSubtitlesHint =>
      'ردهای زیرنویس را به خروجی می‌برد. فقط زیرنویس متنی.';

  @override
  String get sectionTrim => 'برش زمانی';

  @override
  String get trimEnable => 'برش مبدأ';

  @override
  String get trimHint =>
      'وقتی دقیقاً یک فایل با مدت زمان مشخص در صف باشد در دسترس است.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'اندازهٔ هدف';

  @override
  String get lowBatteryTitle => 'باتری کم است';

  @override
  String get lowBatteryBody =>
      'تبدیل، پردازنده را سخت به کار می‌گیرد. می‌توانید اول به شارژ بزنید، یا به‌هرحال ادامه دهید.';

  @override
  String get lowBatteryContinue => 'به‌هرحال تبدیل کن';

  @override
  String get commonCancel => 'لغو';

  @override
  String get commonOk => 'باشه';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فایل دریافت شد',
      one: 'یک فایل دریافت شد',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'ذخیره';

  @override
  String get savedToGallery => 'در گالری، آلبوم «Eluna Media» ذخیره شد.';

  @override
  String get savedToDownloads => 'در پوشهٔ دانلودها ذخیره شد.';

  @override
  String get saveFailed => 'ذخیرهٔ فایل ممکن نشد.';

  @override
  String get jobRemovedUndo => 'کار حذف شد.';

  @override
  String get finishedClearedUndo => 'کارهای پایان‌یافته پاک شدند.';

  @override
  String get undo => 'برگرداندن';

  @override
  String get errorDetailsTitle => 'جزئیات خطا';

  @override
  String get sectionConversionPrefs => 'تبدیل';

  @override
  String get powerModeLabel => 'حالت توان';

  @override
  String get powerEfficiency => 'خنک و سریع';

  @override
  String get powerBalanced => 'متعادل';

  @override
  String get powerQuality => 'بیشترین فشرده‌سازی';

  @override
  String get powerModeHint =>
      'اینکه رمزگذار ویدیو چقدر سخت کار کند. خنک‌تر و سریع‌تر یعنی فایل‌هایی کمی بزرگ‌تر. هیچ چیز دیگری محدود نمی‌شود — هیچ‌وقت.';

  @override
  String get hapticsLabel => 'بازخورد لرزشی';

  @override
  String get networkPrivacyTitle => 'شبکه و حریم خصوصی';

  @override
  String get netAuditIntro =>
      'فهرست کامل هر چیزی در این برنامه که می‌تواند به شبکه دست بزند.';

  @override
  String get netAuditNoneTitle => 'هیچ دسترسی‌ای به شبکه نیست';

  @override
  String get netAuditNoneBody =>
      'برنامه اجازهٔ اینترنت را درخواست نمی‌کند، پس حتی اگر بخواهد هم نمی‌تواند به شبکه برسد — این را می‌توانید در اطلاعات برنامه در سیستم ببینید. نه تبلیغی، نه تحلیلی، نه بررسی به‌روزرسانی. «امتیاز به برنامه» کار را به برنامهٔ فروشگاه می‌سپارد، که خودش با شبکه حرف می‌زند.';

  @override
  String get netAuditConversionTitle => 'تبدیل';

  @override
  String get netAuditConversionBody =>
      'کاملاً روی همین دستگاه و با FFmpeg همراه برنامه اجرا می‌شود. حالت پرواز را روشن کنید و تبدیل کنید — کار می‌کند.';

  @override
  String get netAuditTelemetryTitle => 'گزارش‌دهی';

  @override
  String get netAuditTelemetryBody =>
      'چنین چیزی وجود ندارد. برنامه هیچ تحلیلی، هیچ گزارش خرابی و هیچ شناسه‌ای جمع نمی‌کند و سامانهٔ حساب کاربری ندارد.';

  @override
  String get netAuditTipsTitle => 'انعام';

  @override
  String get netAuditTipsBody =>
      'انعام را برنامهٔ Play Store انجام می‌دهد، نه این برنامه — که همچنان اجازهٔ اینترنت ندارد. صورت‌حساب دو سطر به فهرست مجوزها اضافه می‌کند: «خریدهای درون‌برنامه‌ای» و «دیدن اتصال‌های شبکه»، که فقط می‌خواند آیا اتصالی هست و نمی‌تواند از آن استفاده کند. هیچ‌چیز هرگز خودکار خریداری نمی‌شود و انعام چیزی را باز نمی‌کند: همهٔ امکانات اینجا رایگان است.';

  @override
  String get sectionSupport => 'پشتیبانی';

  @override
  String get rateApp => 'امتیاز به برنامه';

  @override
  String get openLicenses => 'مجوزهای متن‌باز';

  @override
  String get presetAudioToMp3Title => 'تبدیل صدا';

  @override
  String get presetAudioToMp3Body => 'به MP3 — همه‌جا پخش می‌شود';

  @override
  String get presetCompressAudioTitle => 'فشرده‌سازی صدا';

  @override
  String get presetCompressAudioBody => 'AAC سبک‌تر — پیام صوتی، پادکست';

  @override
  String get convertTo => 'تبدیل به';

  @override
  String get formatSectionHint =>
      'فقط قالب‌هایی فهرست می‌شوند که فایل‌های شما واقعاً می‌توانند به آن‌ها تبدیل شوند.';

  @override
  String get sourceVideo => 'ویدیو';

  @override
  String get sourceImage => 'عکس';

  @override
  String get sourceAudio => 'صدا';

  @override
  String get sourceUnknown => 'فایل';

  @override
  String get mixedSelectionTitle => 'نوع‌های مختلف فایل انتخاب شده';

  @override
  String get mixedSelectionBody =>
      'هر فایل با بهترین پیش‌تنظیم نوع خودش تبدیل می‌شود. برای کنترل کامل، هر بار یک نوع اضافه کنید.';

  @override
  String get filesTitle => 'فایل‌ها';

  @override
  String get removeFile => 'حذف';

  @override
  String timeLeft(String time) {
    return '≈ $time مانده';
  }

  @override
  String get jobSettingsTitle => 'تنظیمات تبدیل';

  @override
  String get jobDetails => 'جزئیات';

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
  String get summaryEnhanced => 'بهبودیافته';

  @override
  String get summaryMetadataStripped => 'فراداده حذف شد';

  @override
  String summaryMerge(int count) {
    return '$count کلیپ ادغام شد';
  }

  @override
  String get shareApp => 'اشتراک‌گذاری برنامه';

  @override
  String get shareAppText =>
      'Eluna Media — مبدل رایگان و کاملاً آفلاین عکس، ویدیو و صدا. بدون اشتراک، بدون واترمارک، بدون حساب کاربری.';

  @override
  String appVersionLabel(String version) {
    return 'نسخهٔ $version';
  }

  @override
  String get openFile => 'باز کردن';

  @override
  String get openFolder => 'نمایش پوشه';

  @override
  String get noAppToOpen =>
      'هیچ برنامه‌ای روی این دستگاه نمی‌تواند آن فایل را باز کند.';

  @override
  String get openFailed => 'باز کردن فایل ممکن نشد.';

  @override
  String get twoPassLabel => 'دومرحله‌ای برای اندازهٔ دقیق';

  @override
  String get twoPassHint =>
      'کارهای جا شدن در اندازه دو بار رمزگذاری می‌شوند و به‌طور محسوسی دقیق‌تر به بودجهٔ بایت می‌رسند — با حدود دو برابر زمان و باتری.';

  @override
  String get whatsNewTitle => 'تازه‌ها';

  @override
  String get whatsNew1 =>
      'حالا ویدیو می‌تواند AV1 باشد: فایل‌هایی به‌مراتب کوچک‌تر، اگر حوصلهٔ انتظارش را داشته باشید.';

  @override
  String get whatsNew2 =>
      'تازه برای عکس‌ها: AVIF، تقریباً نصف یک JPEG، و WebP متحرک به‌جای GIF.';

  @override
  String get whatsNew3 =>
      'M4A می‌تواند بدون افت باشد — ALAC حالا کنار AAC نشسته است.';

  @override
  String get whatsNew4 =>
      'یک صفحه برای ظاهر: روشنایی، رنگ تأکید، سیاه مطلق برای OLED و Material You.';

  @override
  String get whatsNew5 =>
      'دستاوردها مدال دارند، سه زبانه، و پیشرفتی که می‌توانید آن را به شکل تصویر به اشتراک بگذارید.';

  @override
  String get achievementsTitle => 'دستاوردها';

  @override
  String achievementsProgress(int done, int total) {
    return '$done از $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'فقط روی همین دستگاه شمرده می‌شود. هیچ چیزی جایی بارگذاری نمی‌شود.';

  @override
  String get achFirstConversionTitle => 'قدم‌های اول';

  @override
  String get achFirstConversionBody => 'اولین فایلتان را تبدیل کنید.';

  @override
  String get achTenConversionsTitle => 'گرم شدید';

  @override
  String get achTenConversionsBody => '۱۰ فایل تبدیل کنید.';

  @override
  String get achFiftyConversionsTitle => 'همیشگی';

  @override
  String get achFiftyConversionsBody => '۵۰ فایل تبدیل کنید.';

  @override
  String get achTwoHundredConversionsTitle => 'اسب کاری';

  @override
  String get achTwoHundredConversionsBody => '۲۰۰ فایل تبدیل کنید.';

  @override
  String get achThousandConversionsTitle => 'نوار نقاله';

  @override
  String get achThousandConversionsBody => '۱۰۰۰ فایل تبدیل کنید.';

  @override
  String get achSaved100MbTitle => 'صرفه‌جوی فضا';

  @override
  String get achSaved100MbBody => 'در مجموع ۱۰۰ MB آزاد کنید.';

  @override
  String get achSaved1GbTitle => 'شکارچی گیگابایت';

  @override
  String get achSaved1GbBody => 'در مجموع ۱ GB آزاد کنید.';

  @override
  String get achSaved10GbTitle => 'قهرمان حافظه';

  @override
  String get achSaved10GbBody => 'در مجموع ۱۰ GB آزاد کنید.';

  @override
  String get achBatchOfFiveTitle => 'کارگر دسته‌ای';

  @override
  String get achBatchOfFiveBody => 'دسته‌ای از ۵ فایل یا بیشتر را تمام کنید.';

  @override
  String get achBatchOfTwentyTitle => 'خط تولید';

  @override
  String get achBatchOfTwentyBody =>
      'دسته‌ای از ۲۰ فایل یا بیشتر را تمام کنید.';

  @override
  String get achSniperTitle => 'تک‌تیرانداز';

  @override
  String get achSniperBody => 'با جا شدن در اندازه به اندازه‌ای دقیق برسید.';

  @override
  String get achMemeSmithTitle => 'میم‌ساز';

  @override
  String get achMemeSmithBody => 'یک ویدیو را به GIF تبدیل کنید.';

  @override
  String get achSoundHunterTitle => 'شکارچی صدا';

  @override
  String get achSoundHunterBody => 'صدا را از یک ویدیو استخراج کنید.';

  @override
  String get achSubtitleKeeperTitle => 'نگهبان زیرنویس';

  @override
  String get achSubtitleKeeperBody =>
      'ویدیویی را با حفظ زیرنویس‌هایش تبدیل کنید.';

  @override
  String get achDirectorTitle => 'کارگردان';

  @override
  String get achDirectorBody =>
      'یک تغییر اعمال کنید — چرخش، برش، سرعت یا بلندی صدا.';

  @override
  String get achAllRounderTitle => 'همه‌فن‌حریف';

  @override
  String get achAllRounderBody => 'ویدیو، صدا و یک تصویر تبدیل کنید.';

  @override
  String get achNightOwlTitle => 'شب‌زنده‌دار';

  @override
  String get achNightOwlBody => 'تبدیلی را بین نیمه‌شب و ۵ بامداد تمام کنید.';

  @override
  String get achPlatinumTitle => 'پلاتین';

  @override
  String get achPlatinumBody => 'همهٔ دستاوردهای دیگر را به دست آورید.';

  @override
  String get storageTitle => 'فضای ذخیره';

  @override
  String get storageBody =>
      'فایل‌های تبدیل‌شده تا وقتی ذخیره یا به اشتراک گذاشته نشوند داخل برنامه می‌مانند، جایی که هیچ مدیر فایلی به آن نمی‌رسد.';

  @override
  String get storageEmpty => 'چیزی ذخیره نشده';

  @override
  String storageUsage(String size) {
    return 'ذخیره‌شده: $size';
  }

  @override
  String get storageClearTitle => 'فایل‌های ذخیره‌شده پاک شوند؟';

  @override
  String get storageClearBody =>
      'هر نتیجهٔ پایان‌یافته‌ای را که برنامه هنوز نگه داشته حذف می‌کند. فایل‌هایی که پیش‌تر ذخیره یا به اشتراک گذاشته‌اید دست‌نخورده می‌مانند.';

  @override
  String get storageClearAction => 'پاک کردن';

  @override
  String storageCleared(String size) {
    return '$size آزاد شد';
  }

  @override
  String get autoSaveLabel => 'ذخیرهٔ خودکار نتیجه‌ها';

  @override
  String get autoSaveHint =>
      'هر فایل آماده را همان لحظه در گالری می‌گذارد — صدا را در پوشهٔ دانلودها.';

  @override
  String get lowSpaceTitle => 'فضای زیادی نمانده';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'این دسته حدود $needed لازم دارد و فقط $free آزاد است. تبدیل ممکن است نیمه‌کاره بایستد.';
  }

  @override
  String saveAll(int count) {
    return 'ذخیرهٔ همه ($count)';
  }

  @override
  String savedAll(int count) {
    return 'ذخیره شد: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved از $total ذخیره شد';
  }

  @override
  String get presetFitPhotoTitle => 'جا کردن عکس در اندازه';

  @override
  String get presetFitPhotoBody =>
      'فشردن یک تصویر زیر سقفی دقیق — فرم‌های بارگذاری، درخواست‌ها.';

  @override
  String get photoFitHint =>
      'برنامه کیفیت‌ها را یکی‌یکی امتحان می‌کند تا یکی جا شود. اگر بودجه برای تصویر خیلی کم باشد، اندازهٔ کادر را هم کوچک می‌کند.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'اندازهٔ هدف به KB';

  @override
  String get compareAction => 'مقایسه';

  @override
  String get compareBefore => 'پیش';

  @override
  String get compareAfter => 'پس';

  @override
  String get compareHint => 'برای دیدن نسخهٔ اصلی، انگشتتان را نگه دارید.';

  @override
  String get trimStart => 'شروع';

  @override
  String get trimEnd => 'پایان';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss، تا $duration';
  }

  @override
  String get imageScaleLabel => 'مقیاس';

  @override
  String get audioChannelsLabel => 'کانال‌ها';

  @override
  String get audioMono => 'مونو';

  @override
  String get audioStereo => 'استریو';

  @override
  String get sampleRateLabel => 'نرخ نمونه‌برداری';

  @override
  String get voiceAudioHint =>
      'مونو با 22.05 kHz حجم یک ضبط گفتار را تقریباً به یک‌چهارم می‌رساند، بدون افت شنیدنی. برای موسیقی هر دو را اصلی بگذارید.';

  @override
  String get moveUp => 'انتقال به بالا';

  @override
  String get moveDown => 'انتقال به پایین';

  @override
  String get renameOutput => 'تغییر نام نتیجه';

  @override
  String get renameOutputHint => 'نام تازه';

  @override
  String get renameOutputHelp =>
      'پسوند از قالب خروجی می‌آید. خالی بگذارید تا نتیجه هم‌نام مبدأ شود.';

  @override
  String deleteOriginalsAction(int count) {
    return 'حذف نسخه‌های اصلی ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'حذف نسخه‌های اصلی پس از تبدیل';

  @override
  String get deleteOriginalsHint =>
      'از سیستم می‌خواهد فایل‌های مبدأ را پس از ذخیرهٔ نتیجه حذف کند. سیستم همیشه نشان می‌دهد چه چیزی حذف می‌شود و منتظر تأیید شما می‌ماند.';

  @override
  String originalsDeleted(String size) {
    return 'نسخه‌های اصلی حذف شدند — $size آزاد شد';
  }

  @override
  String get originalsNoneDeleted =>
      'چیزی حذف نشد. فقط فایل‌هایی پیدا می‌شوند که گالری هنوز آن‌ها را با نام اصلی نگه داشته است.';

  @override
  String reclaimedTotal(String size) {
    return 'آزادشده با این برنامه: $size';
  }

  @override
  String get deleteAllData => 'حذف همهٔ داده‌ها';

  @override
  String get deleteAllDataHint =>
      'هر چه را برنامه روی این دستگاه نگه می‌دارد پاک می‌کند: صف، فایل‌های تبدیل‌شده، پیش‌نمایش‌ها، دستاوردها و تنظیمات. فایل‌هایی که پیش‌تر در گالری ذخیره کرده‌اید دست‌نخورده می‌مانند.';

  @override
  String get codecCopy => 'کپی';

  @override
  String get codecCopyRemux => 'کپی (remux)';

  @override
  String get codecNoVideo => 'بدون ویدیو';

  @override
  String get codecNoAudio => 'بدون صدا';

  @override
  String codecLossless(String codec) {
    return '$codec (بدون افت)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (متحرک)';
  }

  @override
  String get sizeTargetEmail => 'ایمیل';

  @override
  String get trimTimeHint => 'm:ss';
}
