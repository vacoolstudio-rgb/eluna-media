// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class L10nHe extends L10n {
  L10nHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'המרה';

  @override
  String get tabQueue => 'תור';

  @override
  String get addFiles => 'הוספת קבצים';

  @override
  String get emptySelectionTitle => 'אין עדיין קבצים';

  @override
  String get emptySelectionBody =>
      'הוסיפו תמונות, סרטונים או אודיו. כל העיבוד מתבצע במכשיר הזה.';

  @override
  String get sectionOutput => 'פלט';

  @override
  String get sectionVideo => 'וידאו';

  @override
  String get sectionAudio => 'אודיו';

  @override
  String get sectionImage => 'תמונה';

  @override
  String get sectionPrivacy => 'פרטיות';

  @override
  String get outputFormat => 'פורמט';

  @override
  String get videoCodec => 'קודק וידאו';

  @override
  String get audioCodec => 'קודק אודיו';

  @override
  String get rateControl => 'בקרת קצב';

  @override
  String get rateControlQuality => 'איכות קבועה (CRF)';

  @override
  String get rateControlBitrate => 'קצב סיביות יעד';

  @override
  String crfLabel(int value) {
    return 'איכות (CRF $value)';
  }

  @override
  String get crfHint => 'ערך נמוך יותר נותן איכות טובה יותר וקובץ גדול יותר.';

  @override
  String videoBitrate(int value) {
    return 'קצב סיביות וידאו: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'קצב סיביות אודיו: $value kbps';
  }

  @override
  String get encodingPreset => 'פריסט של המקודד';

  @override
  String get encodingPresetHint =>
      'פריסטים איטיים יותר דוחסים טוב יותר, אך מחממים את המכשיר יותר.';

  @override
  String get presetOriginal => 'מקורי';

  @override
  String get resolution => 'רזולוציה';

  @override
  String get frameRate => 'קצב פריימים';

  @override
  String imageQuality(int value) {
    return 'איכות: $value';
  }

  @override
  String get lossless => 'ללא אובדן';

  @override
  String get losslessHint => 'קבצים גדולים יותר, פלט מדויק פיקסל בפיקסל.';

  @override
  String get sectionEnhance => 'שיפור';

  @override
  String get sharpenLabel => 'חדות';

  @override
  String get sharpenHint =>
      'מחדד את הקצוות. אי אפשר לשחזר בעזרתו צילום מטושטש או לא ממוקד — הפרטים האלה פשוט אינם בקובץ.';

  @override
  String get sharpenStrongHint =>
      'חידוד חזק עלול להשאיר הילות בהירות לאורך הקצוות. כדאי לנסות קודם בינוני.';

  @override
  String get denoiseLabel => 'הפחתת רעש';

  @override
  String get denoiseHint =>
      'מנקה גרעיניות בתמונות כהות ובצילומי לילה. יותר מדי מחליק גם פרטים עדינים.';

  @override
  String get autoColorLabel => 'צבע ורמות אוטומטיים';

  @override
  String get autoColorHint => 'מותח את הניגודיות ומרענן מעט צבעים שטוחים.';

  @override
  String get upscaleLabel => 'הגדלה ×2';

  @override
  String get upscaleHint =>
      'מכפיל את הרוחב ואת הגובה. זה לא מוסיף פרטים — זה עוזר בהדפסה או בחיתוך.';

  @override
  String get upscaleConflictHint => 'כדי להגדיל, החזירו את הרזולוציה למקורי.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'כבוי';

  @override
  String get enhanceLight => 'קל';

  @override
  String get enhanceMedium => 'בינוני';

  @override
  String get enhanceStrong => 'חזק';

  @override
  String get stripMetadata => 'הסרת מטא-נתונים';

  @override
  String get stripMetadataHint => 'מסיר EXIF, GPS וחותמות זמן מהפלט.';

  @override
  String startConversion(int count) {
    return 'המרת קבצים ($count)';
  }

  @override
  String get batchResumed => 'ההמרה שנקטעה חודשה.';

  @override
  String get converting => 'ממיר…';

  @override
  String get cancelBatch => 'עצירה';

  @override
  String get cancelJob => 'ביטול';

  @override
  String get clearFinished => 'ניקוי שהושלמו';

  @override
  String get removeJob => 'הסרה';

  @override
  String get shareFile => 'שיתוף';

  @override
  String get retryJob => 'ניסיון חוזר';

  @override
  String get queueEmptyTitle => 'התור ריק';

  @override
  String get queueEmptyBody => 'קבצים שתוסיפו בלשונית ההמרה יופיעו כאן.';

  @override
  String queueActiveTab(int count) {
    return 'פעילים · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'הושלמו · $count';
  }

  @override
  String get queueNoActiveTitle => 'אין משימות בתהליך';

  @override
  String get queueNoActiveBody => 'קבצים שממתינים או שמומרים כרגע מופיעים כאן.';

  @override
  String get queueNoFinishedTitle => 'עדיין לא הושלם דבר';

  @override
  String get queueNoFinishedBody =>
      'קבצים מומרים מגיעים לכאן, מוכנים לפתיחה, לשמירה או לשיתוף.';

  @override
  String get statusQueued => 'בתור';

  @override
  String get statusRunning => 'ממיר';

  @override
  String get statusCompleted => 'הושלם';

  @override
  String get statusFailed => 'נכשל';

  @override
  String get statusCancelled => 'בוטל';

  @override
  String batchSummary(int done, int total) {
    return '$done מתוך $total הושלמו';
  }

  @override
  String batchCompleted(int done) {
    return 'קבצים שהומרו: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'הומרו $done, נכשלו $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% קטן יותר';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% גדול יותר';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'מראה';

  @override
  String get themeSystem => 'מערכת';

  @override
  String get language => 'שפה';

  @override
  String get languageSystem => 'מערכת';

  @override
  String get privacyTitle => 'פרטיות';

  @override
  String get privacyBody =>
      'Eluna Media ממיר את הקבצים שלכם כולם במכשיר הזה, בעזרת עותק של FFmpeg המצורף לאפליקציה. הקבצים לעולם אינם עוזבים את המכשיר, אין צורך בחשבון ואין טלמטריה. שום דבר באפליקציה אינו משתמש ברשת כלל — היא אפילו לא מחזיקה בהרשאת האינטרנט.\n\nהסרת מטא-נתונים פעילה כברירת מחדל, ולכן EXIF, קואורדינטות GPS וחותמות זמן מוסרים מהקבצים שאתם מייצאים.';

  @override
  String get licenseTitle => 'רישוי';

  @override
  String get licenseBody =>
      'האפליקציה מצרפת את FFmpeg שנבנה עם x264, x265 ורכיבי GPL נוספים, ולכן היא מופצת בשלמותה תחת GNU GPL v3.';

  @override
  String get sourceMissing => 'קובץ המקור אינו זמין עוד.';

  @override
  String get tabSettings => 'הגדרות';

  @override
  String get introTitle => 'פרטיות מעצם התכנון';

  @override
  String get introOfflineTitle => 'ממיר במכשיר הזה';

  @override
  String get introOfflineBody =>
      'עותק של FFmpeg המצורף לאפליקציה עושה את כל העבודה. הקבצים שלכם לעולם אינם עוזבים את הטלפון — ההמרה עובדת גם במצב טיסה.';

  @override
  String get introTelemetryTitle => 'אפס טלמטריה';

  @override
  String get introTelemetryBody =>
      'בלי חשבון, בלי אנליטיקה, בלי דיווחי קריסות. האפליקציה לא יודעת מי אתם.';

  @override
  String get introMetadataTitle => 'מטא-נתונים בשליטה';

  @override
  String get introMetadataBody =>
      'EXIF, GPS וחותמות זמן מוסרים מכל פלט כברירת מחדל. אפשר לכבות את זה.';

  @override
  String get introFreeNote =>
      'חינם, בלי פרסומות ובלי מנויים. כל היכולות, כולל המרה מרובת קבצים, שלכם מההתחלה — הדבר היחיד שאפשר לקנות הוא טיפ, והוא אינו פותח שום דבר.';

  @override
  String get introContinue => 'בואו נתחיל';

  @override
  String get modeSimple => 'פשוט';

  @override
  String get modeAdvanced => 'מתקדם';

  @override
  String get modeAdvancedHint =>
      'מציג כל קודק, קצב סיביות ובקרת שינוי, במקום כרטיסי הפריסטים.';

  @override
  String get presetCompressVideoTitle => 'דחיסת וידאו';

  @override
  String get presetCompressVideoBody => 'MP4 קטן בהרבה, האיכות נשארת טובה';

  @override
  String get presetFitToSizeTitle => 'התאמה לגודל';

  @override
  String get presetFitToSizeBody =>
      'לעמוד במגבלה מדויקת — Discord, אימייל, צ׳אטים';

  @override
  String get presetCompatibleMp4Title => 'MP4 תואם';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. מתנגן בכל מקום';

  @override
  String get presetExtractAudioTitle => 'חילוץ אודיו';

  @override
  String get presetExtractAudioBody => 'MP3 מכל סרטון';

  @override
  String get presetVideoToGifTitle => 'וידאו ל-GIF';

  @override
  String get presetVideoToGifBody => 'קטע קצר לכדי GIF מונפש';

  @override
  String get presetMergeTitle => 'מיזוג סרטונים';

  @override
  String get presetMergeBody => 'חיבור קטעים ל-MP4 אחד, לפי הסדר';

  @override
  String get mergeNeedsTwo => 'בחרו לפחות שני סרטונים למיזוג.';

  @override
  String mergedVideoName(int count) {
    return 'וידאו ממוזג ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'דחיסת תמונה';

  @override
  String get presetCompressImageBody => 'JPEG קטן יותר, אובדן כמעט בלתי נראה';

  @override
  String get presetEnhancePhotoTitle => 'שיפור תמונה';

  @override
  String get presetEnhancePhotoBody => 'נקייה יותר, חדה יותר, צבע טוב יותר';

  @override
  String get presetImageToWebpTitle => 'תמונה ל-WebP';

  @override
  String get presetImageToWebpBody => 'פורמט מודרני, קטן מ-JPEG';

  @override
  String get sizeTargetTitle => 'גודל יעד';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'מותאם אישית…';

  @override
  String get sizeTargetDialogTitle => 'גודל יעד ב-MB';

  @override
  String get sizeTargetTooSmall =>
      'היעד קטן מדי למשך הזה; תיבחר האיכות הקרובה ביותר שאפשרית.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size לכל קובץ';
  }

  @override
  String estimateTotal(String size) {
    return 'פלט משוער: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'קבצים שנבחרו: $count';
  }

  @override
  String get promiseOffline => 'המרה לא מקוונת ב-100%';

  @override
  String get promiseBatchFree => 'המרה מרובת קבצים בחינם';

  @override
  String get promiseNoWatermark => 'בלי סימן מים';

  @override
  String get sectionTransform => 'שינויים';

  @override
  String get rotateLabel => 'סיבוב';

  @override
  String get flipLabel => 'היפוך אופקי';

  @override
  String get speedLabel => 'מהירות';

  @override
  String get cropLabel => 'חיתוך';

  @override
  String get cropHint =>
      'חיתוך ממורכז ליחס הגובה-רוחב שנבחר — ריבוע לפיד, 9:16 לסטוריז.';

  @override
  String volumeLabel(int percent) {
    return 'עוצמת קול: $percent%';
  }

  @override
  String get addAudioFiles => 'אודיו וקבצים אחרים';

  @override
  String get hwEncoderLabel => 'קידוד בחומרה';

  @override
  String get hwEncoderHint =>
      'משתמש בשבב הווידאו של המכשיר במצבי קצב סיביות והתאמה לגודל — מהיר וקריר בהרבה. מצב איכות (CRF) תמיד משתמש במקודד התוכנה המדויק, ומשימת חומרה שנכשלה חוזרת אוטומטית על מקודד התוכנה.';

  @override
  String get transformNeedsReencode =>
      'סיבוב, היפוך ומהירות דורשים קידוד מחדש, ולכן הם כבויים בזמן העתקת זרם.';

  @override
  String get capBitrateLabel => 'לעולם לא להגדיל את הקובץ';

  @override
  String get capBitrateHint =>
      'מגביל את הקידוד לקצב הסיביות של המקור עצמו. לאיכות קבועה אין תקרה משלה, ולכן וידאו שכבר נדחס עלול אחרת לצאת גדול יותר.';

  @override
  String get keepSubtitles => 'שמירת כתוביות';

  @override
  String get keepSubtitlesHint =>
      'מעביר רצועות כתוביות אל הפלט. כתוביות טקסט בלבד.';

  @override
  String get sectionTrim => 'גזירה';

  @override
  String get trimEnable => 'גזירת המקור';

  @override
  String get trimHint => 'זמין כאשר בתור נמצא קובץ אחד בדיוק עם משך ידוע.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'גודל יעד';

  @override
  String get lowBatteryTitle => 'הסוללה חלשה';

  @override
  String get lowBatteryBody =>
      'המרה מעמיסה על המעבד. אפשר לחבר קודם לחשמל, או להמשיך בכל זאת.';

  @override
  String get lowBatteryContinue => 'להמיר בכל זאת';

  @override
  String get commonCancel => 'ביטול';

  @override
  String get commonOk => 'אישור';

  @override
  String filesReceived(int count) {
    return 'קבצים שהתקבלו: $count';
  }

  @override
  String get saveFile => 'שמירה';

  @override
  String get savedToGallery => 'נשמר בגלריה, באלבום “Eluna Media”.';

  @override
  String get savedToDownloads => 'נשמר בהורדות.';

  @override
  String get saveFailed => 'לא ניתן היה לשמור את הקובץ.';

  @override
  String get jobRemovedUndo => 'המשימה הוסרה.';

  @override
  String get finishedClearedUndo => 'המשימות שהושלמו נוקו.';

  @override
  String get undo => 'ביטול פעולה';

  @override
  String get errorDetailsTitle => 'פרטי השגיאה';

  @override
  String get sectionConversionPrefs => 'המרה';

  @override
  String get powerModeLabel => 'מצב הספק';

  @override
  String get powerEfficiency => 'קריר ומהיר';

  @override
  String get powerBalanced => 'מאוזן';

  @override
  String get powerQuality => 'דחיסה מרבית';

  @override
  String get powerModeHint =>
      'כמה קשה עובד מקודד הווידאו. קריר ומהיר יותר פירושו קבצים גדולים במקצת. שום דבר אחר אינו מוגבל — אף פעם.';

  @override
  String get hapticsLabel => 'משוב רטט';

  @override
  String get networkPrivacyTitle => 'רשת ופרטיות';

  @override
  String get netAuditIntro =>
      'רשימה מלאה של כל מה שבאפליקציה הזאת שיכול לגעת ברשת.';

  @override
  String get netAuditNoneTitle => 'אין גישה לרשת כלל';

  @override
  String get netAuditNoneBody =>
      'האפליקציה אינה מבקשת את הרשאת האינטרנט, ולכן אינה יכולה להגיע לרשת גם אם תנסה — אפשר לוודא זאת בפרטי האפליקציה במערכת. בלי פרסומות, בלי אנליטיקה, בלי בדיקות עדכון. “דירוג האפליקציה” מעביר את הפעולה לאפליקציית החנות, שמדברת בעצמה.';

  @override
  String get netAuditConversionTitle => 'המרה';

  @override
  String get netAuditConversionBody =>
      'רצה כולה במכשיר הזה, דרך FFmpeg המצורף לאפליקציה. הפעילו מצב טיסה והמירו — זה עובד.';

  @override
  String get netAuditTelemetryTitle => 'טלמטריה';

  @override
  String get netAuditTelemetryBody =>
      'אין כזו. האפליקציה אינה אוספת אנליטיקה, דיווחי קריסות או מזהים, ואין בה מערכת חשבונות.';

  @override
  String get netAuditTipsTitle => 'טיפים';

  @override
  String get netAuditTipsBody =>
      'טיפ מתבצע על ידי אפליקציית Play Store, לא על ידי זו — שעדיין אינה מחזיקה בהרשאת אינטרנט. החיוב אכן מוסיף שתי שורות לרשימת ההרשאות: “רכישות בתוך האפליקציה” ו“צפייה בחיבורי רשת”, שרק קוראת אם קיים חיבור ואינה יכולה להשתמש בו. שום דבר אינו נרכש אוטומטית, וטיפ אינו פותח דבר: כל יכולת כאן היא חינמית.';

  @override
  String get sectionSupport => 'תמיכה';

  @override
  String get rateApp => 'דירוג האפליקציה';

  @override
  String get openLicenses => 'רישיונות קוד פתוח';

  @override
  String get presetAudioToMp3Title => 'המרת אודיו';

  @override
  String get presetAudioToMp3Body => 'ל-MP3 — מתנגן בכל דבר';

  @override
  String get presetCompressAudioTitle => 'דחיסת אודיו';

  @override
  String get presetCompressAudioBody => 'AAC חסכוני — הקלטות קוליות, פודקאסטים';

  @override
  String get convertTo => 'המרה אל';

  @override
  String get formatSectionHint =>
      'מוצגים רק פורמטים שהקבצים שלכם באמת יכולים להפוך אליהם.';

  @override
  String get sourceVideo => 'וידאו';

  @override
  String get sourceImage => 'תמונה';

  @override
  String get sourceAudio => 'אודיו';

  @override
  String get sourceUnknown => 'קובץ';

  @override
  String get mixedSelectionTitle => 'נבחרו סוגי קבצים שונים';

  @override
  String get mixedSelectionBody =>
      'כל קובץ מומר עם הפריסט המתאים לסוג שלו. הוסיפו סוג אחד בכל פעם לשליטה מלאה.';

  @override
  String get filesTitle => 'קבצים';

  @override
  String get removeFile => 'הסרה';

  @override
  String timeLeft(String time) {
    return 'נותרו ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'הגדרות המרה';

  @override
  String get jobDetails => 'פרטים';

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
  String get summaryEnhanced => 'שופר';

  @override
  String get summaryMetadataStripped => 'מטא-נתונים הוסרו';

  @override
  String summaryMerge(int count) {
    return 'קטעים שמוזגו: $count';
  }

  @override
  String get shareApp => 'שיתוף האפליקציה';

  @override
  String get shareAppText =>
      'Eluna Media — ממיר תמונות, וידאו ואודיו חינמי, שעובד לגמרי במצב לא מקוון. בלי מנויים, בלי סימני מים, בלי חשבונות.';

  @override
  String appVersionLabel(String version) {
    return 'גרסה $version';
  }

  @override
  String get openFile => 'פתיחה';

  @override
  String get openFolder => 'הצגת התיקייה';

  @override
  String get noAppToOpen =>
      'אין במכשיר הזה אפליקציה שיכולה לפתוח את הקובץ הזה.';

  @override
  String get openFailed => 'לא ניתן היה לפתוח את הקובץ.';

  @override
  String get twoPassLabel => 'שני מעברים לגודל מדויק';

  @override
  String get twoPassHint =>
      'משימות של התאמה לגודל מקודדות פעמיים ופוגעות בתקציב הבתים בדיוק רב בהרבה — בערך בכפליים זמן וסוללה.';

  @override
  String get whatsNewTitle => 'מה חדש';

  @override
  String get whatsNew1 =>
      'וידאו יכול להיות עכשיו AV1: קבצים קטנים במידה ניכרת, אם יש לכם סבלנות לחכות להם.';

  @override
  String get whatsNew2 =>
      'חדש לתמונות: AVIF, בערך חצי JPEG, ו-WebP מונפש במקום GIF.';

  @override
  String get whatsNew3 => 'M4A יכול להיות ללא אובדן — ALAC יושב עכשיו לצד AAC.';

  @override
  String get whatsNew4 =>
      'מסך אחד למראה: בהירות, צבע הדגשה, שחור מלא ל-OLED ו-Material You.';

  @override
  String get whatsNew5 =>
      'להישגים יש מדליות, שלוש לשוניות, והתקדמות שאפשר לשתף כתמונה.';

  @override
  String get achievementsTitle => 'הישגים';

  @override
  String achievementsProgress(int done, int total) {
    return '$done מתוך $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'נספר במכשיר הזה בלבד. שום דבר אינו נשלח לשום מקום.';

  @override
  String get achFirstConversionTitle => 'צעדים ראשונים';

  @override
  String get achFirstConversionBody => 'המירו את הקובץ הראשון שלכם.';

  @override
  String get achTenConversionsTitle => 'מתחממים';

  @override
  String get achTenConversionsBody => 'המירו 10 קבצים.';

  @override
  String get achFiftyConversionsTitle => 'קבוע';

  @override
  String get achFiftyConversionsBody => 'המירו 50 קבצים.';

  @override
  String get achTwoHundredConversionsTitle => 'סוס עבודה';

  @override
  String get achTwoHundredConversionsBody => 'המירו 200 קבצים.';

  @override
  String get achThousandConversionsTitle => 'מסוע';

  @override
  String get achThousandConversionsBody => 'המירו 1000 קבצים.';

  @override
  String get achSaved100MbTitle => 'חוסך מקום';

  @override
  String get achSaved100MbBody => 'פנו 100 MB בסך הכול.';

  @override
  String get achSaved1GbTitle => 'צייד ג׳יגה-בייטים';

  @override
  String get achSaved1GbBody => 'פנו 1 GB בסך הכול.';

  @override
  String get achSaved10GbTitle => 'גיבור האחסון';

  @override
  String get achSaved10GbBody => 'פנו 10 GB בסך הכול.';

  @override
  String get achBatchOfFiveTitle => 'עובד אצוות';

  @override
  String get achBatchOfFiveBody => 'סיימו אצווה של 5 קבצים או יותר.';

  @override
  String get achBatchOfTwentyTitle => 'פס ייצור';

  @override
  String get achBatchOfTwentyBody => 'סיימו אצווה של 20 קבצים או יותר.';

  @override
  String get achSniperTitle => 'צלף';

  @override
  String get achSniperBody => 'פגעו בגודל מדויק בעזרת התאמה לגודל.';

  @override
  String get achMemeSmithTitle => 'נפח ממים';

  @override
  String get achMemeSmithBody => 'הפכו וידאו ל-GIF.';

  @override
  String get achSoundHunterTitle => 'צייד צלילים';

  @override
  String get achSoundHunterBody => 'חלצו אודיו מתוך וידאו.';

  @override
  String get achSubtitleKeeperTitle => 'שומר הכתוביות';

  @override
  String get achSubtitleKeeperBody => 'המירו וידאו תוך שמירת הכתוביות שלו.';

  @override
  String get achDirectorTitle => 'במאי';

  @override
  String get achDirectorBody =>
      'החילו שינוי — סיבוב, חיתוך, מהירות או עוצמת קול.';

  @override
  String get achAllRounderTitle => 'רב-תחומי';

  @override
  String get achAllRounderBody => 'המירו וידאו, אודיו ותמונה.';

  @override
  String get achNightOwlTitle => 'ציפור לילה';

  @override
  String get achNightOwlBody => 'סיימו המרה בין חצות ל-5 לפנות בוקר.';

  @override
  String get achPlatinumTitle => 'פלטינה';

  @override
  String get achPlatinumBody => 'זכו בכל שאר ההישגים.';

  @override
  String get storageTitle => 'אחסון';

  @override
  String get storageBody =>
      'קבצים מומרים נשארים בתוך האפליקציה עד שתשמרו או תשתפו אותם, במקום שאף מנהל קבצים אינו מגיע אליו.';

  @override
  String get storageEmpty => 'אין מאוחסן דבר';

  @override
  String storageUsage(String size) {
    return 'מאוחסן: $size';
  }

  @override
  String get storageClearTitle => 'לנקות את הקבצים המאוחסנים?';

  @override
  String get storageClearBody =>
      'מוחק כל תוצאה מוגמרת שהאפליקציה עדיין מחזיקה. קבצים ששמרתם או ששיתפתם כבר נשארים כמות שהם.';

  @override
  String get storageClearAction => 'ניקוי';

  @override
  String storageCleared(String size) {
    return 'פונו $size';
  }

  @override
  String get autoSaveLabel => 'שמירת תוצאות אוטומטית';

  @override
  String get autoSaveHint =>
      'מכניס כל קובץ מוגמר לגלריה — אודיו להורדות — ברגע שהוא מוכן.';

  @override
  String get lowSpaceTitle => 'לא נשאר הרבה מקום';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'האצווה הזאת צריכה בערך $needed ופנויים רק $free. ההמרה עלולה להיעצר באמצע.';
  }

  @override
  String saveAll(int count) {
    return 'שמירת הכול ($count)';
  }

  @override
  String savedAll(int count) {
    return 'נשמרו: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'נשמרו $saved מתוך $total';
  }

  @override
  String get presetFitPhotoTitle => 'התאמת תמונה לגודל';

  @override
  String get presetFitPhotoBody =>
      'לדחוס תמונה אל מתחת למגבלה מדויקת — טפסי העלאה, בקשות.';

  @override
  String get photoFitHint =>
      'האפליקציה מנסה רמות איכות עד שאחת מהן נכנסת. אם התקציב קטן מדי לתמונה, היא מקטינה גם את מידות הפריים.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'גודל יעד ב-KB';

  @override
  String get compareAction => 'השוואה';

  @override
  String get compareBefore => 'לפני';

  @override
  String get compareAfter => 'אחרי';

  @override
  String get compareHint => 'לחצו והחזיקו כדי לראות את המקור.';

  @override
  String get trimStart => 'התחלה';

  @override
  String get trimEnd => 'סיום';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, עד $duration';
  }

  @override
  String get imageScaleLabel => 'קנה מידה';

  @override
  String get audioChannelsLabel => 'ערוצים';

  @override
  String get audioMono => 'מונו';

  @override
  String get audioStereo => 'סטריאו';

  @override
  String get sampleRateLabel => 'תדר דגימה';

  @override
  String get voiceAudioHint =>
      'מונו ב-22.05 kHz מקטין הקלטת דיבור לרבע בערך, בלי אובדן שנשמע. למוזיקה השאירו את שניהם מקוריים.';

  @override
  String get moveUp => 'העברה למעלה';

  @override
  String get moveDown => 'העברה למטה';

  @override
  String get renameOutput => 'שינוי שם התוצאה';

  @override
  String get renameOutputHint => 'שם חדש';

  @override
  String get renameOutputHelp =>
      'הסיומת נקבעת לפי פורמט הפלט. השאירו ריק כדי לקרוא לתוצאה על שם המקור.';

  @override
  String deleteOriginalsAction(int count) {
    return 'מחיקת המקורות ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'מחיקת המקורות אחרי ההמרה';

  @override
  String get deleteOriginalsHint =>
      'מבקש מהמערכת להסיר את קובצי המקור לאחר שהתוצאה נשמרה. המערכת תמיד מציגה מה עומד להימחק וממתינה לאישור שלכם.';

  @override
  String get mediaAccessRequired =>
      'כדי למחוק את הקבצים המקוריים נדרשת גישה לספריית המדיה.';

  @override
  String originalsDeleted(String size) {
    return 'המקורות נמחקו — פונו $size';
  }

  @override
  String get originalsNoneDeleted =>
      'שום דבר לא נמחק. אפשר למצוא רק קבצים שהגלריה עדיין מחזיקה בשמם המקורי.';

  @override
  String reclaimedTotal(String size) {
    return 'פונה בעזרת האפליקציה הזאת: $size';
  }

  @override
  String get deleteAllData => 'מחיקת כל הנתונים';

  @override
  String get deleteAllDataHint =>
      'מוחק את כל מה שהאפליקציה שומרת במכשיר הזה: התור, קבצים מומרים, תצוגות מקדימות, הישגים והגדרות. קבצים ששמרתם כבר בגלריה נשארים כמות שהם.';

  @override
  String get codecCopy => 'העתקה';

  @override
  String get codecCopyRemux => 'העתקה (remux)';

  @override
  String get codecNoVideo => 'בלי וידאו';

  @override
  String get codecNoAudio => 'בלי אודיו';

  @override
  String codecLossless(String codec) {
    return '$codec (ללא אובדן)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (מונפש)';
  }

  @override
  String get sizeTargetEmail => 'אימייל';

  @override
  String get trimTimeHint => 'm:ss';
}
