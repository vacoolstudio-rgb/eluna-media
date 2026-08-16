// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class L10nAr extends L10n {
  L10nAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'تحويل';

  @override
  String get tabQueue => 'قائمة الانتظار';

  @override
  String get addFiles => 'إضافة ملفات';

  @override
  String get emptySelectionTitle => 'لا توجد ملفات بعد';

  @override
  String get emptySelectionBody =>
      'أضف صورًا أو مقاطع فيديو أو صوتًا. تتم المعالجة كلها على هذا الجهاز.';

  @override
  String get sectionOutput => 'الإخراج';

  @override
  String get sectionVideo => 'الفيديو';

  @override
  String get sectionAudio => 'الصوت';

  @override
  String get sectionImage => 'الصورة';

  @override
  String get sectionPrivacy => 'الخصوصية';

  @override
  String get outputFormat => 'الصيغة';

  @override
  String get videoCodec => 'ترميز الفيديو';

  @override
  String get audioCodec => 'ترميز الصوت';

  @override
  String get rateControl => 'التحكم في المعدل';

  @override
  String get rateControlQuality => 'جودة ثابتة (CRF)';

  @override
  String get rateControlBitrate => 'معدل البت المستهدف';

  @override
  String crfLabel(int value) {
    return 'الجودة (CRF $value)';
  }

  @override
  String get crfHint => 'الأقل يعني جودة أفضل وملفًا أكبر.';

  @override
  String videoBitrate(int value) {
    return 'معدل بت الفيديو: $value ك.بت/ث';
  }

  @override
  String audioBitrate(int value) {
    return 'معدل بت الصوت: $value ك.بت/ث';
  }

  @override
  String get encodingPreset => 'إعداد المُرمِّز';

  @override
  String get encodingPresetHint =>
      'الإعدادات الأبطأ تضغط أفضل لكنها تُسخّن الجهاز أكثر.';

  @override
  String get presetOriginal => 'الأصلي';

  @override
  String get resolution => 'الدقة';

  @override
  String get frameRate => 'معدل الإطارات';

  @override
  String imageQuality(int value) {
    return 'الجودة: $value';
  }

  @override
  String get lossless => 'بلا فقدان';

  @override
  String get losslessHint => 'ملفات أكبر، ومخرجات مطابقة للبكسل.';

  @override
  String get sectionEnhance => 'التحسين';

  @override
  String get sharpenLabel => 'الحدة';

  @override
  String get sharpenHint =>
      'يجعل الحواف أوضح. لا يمكنه استعادة لقطة ضبابية أو خارج التركيز — تلك التفاصيل ليست في الملف.';

  @override
  String get sharpenStrongHint =>
      'الحدة القوية قد تترك هالات ساطعة على الحواف. جرّب المتوسطة أولًا.';

  @override
  String get denoiseLabel => 'تقليل التشويش';

  @override
  String get denoiseHint =>
      'ينظّف الحبيبات في الصور المظلمة والليلية. المبالغة تمحو التفاصيل الدقيقة.';

  @override
  String get autoColorLabel => 'لون ومستويات تلقائية';

  @override
  String get autoColorHint => 'يوسّع التباين ويرفع الألوان الباهتة قليلًا.';

  @override
  String get upscaleLabel => 'تكبير ٢×';

  @override
  String get upscaleHint =>
      'يضاعف العرض والارتفاع. لا يضيف تفاصيل — لكنه يفيد عند الطباعة أو الاقتصاص.';

  @override
  String get upscaleConflictHint => 'أعد الدقة إلى «الأصلي» لتتمكن من التكبير.';

  @override
  String get upscaleChip => '٢×';

  @override
  String get enhanceOff => 'إيقاف';

  @override
  String get enhanceLight => 'خفيف';

  @override
  String get enhanceMedium => 'متوسط';

  @override
  String get enhanceStrong => 'قوي';

  @override
  String get stripMetadata => 'إزالة البيانات الوصفية';

  @override
  String get stripMetadataHint =>
      'يزيل EXIF وGPS والطوابع الزمنية من الملف الناتج.';

  @override
  String startConversion(int count) {
    return 'تحويل الملفات ($count)';
  }

  @override
  String get batchResumed => 'استُؤنف التحويل المتوقف.';

  @override
  String get converting => 'جارٍ التحويل…';

  @override
  String get cancelBatch => 'إيقاف';

  @override
  String get cancelJob => 'إلغاء';

  @override
  String get clearFinished => 'مسح المكتملة';

  @override
  String get removeJob => 'إزالة';

  @override
  String get shareFile => 'مشاركة';

  @override
  String get retryJob => 'إعادة المحاولة';

  @override
  String get queueEmptyTitle => 'قائمة الانتظار فارغة';

  @override
  String get queueEmptyBody => 'الملفات التي تضيفها في تبويب التحويل تظهر هنا.';

  @override
  String queueActiveTab(int count) {
    return 'نشط · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'مكتمل · $count';
  }

  @override
  String get queueNoActiveTitle => 'لا شيء قيد التنفيذ';

  @override
  String get queueNoActiveBody =>
      'الملفات المنتظرة أو الجاري تحويلها تظهر هنا.';

  @override
  String get queueNoFinishedTitle => 'لم يكتمل شيء بعد';

  @override
  String get queueNoFinishedBody =>
      'الملفات المحوّلة تصل إلى هنا، جاهزة للفتح أو الحفظ أو المشاركة.';

  @override
  String get statusQueued => 'في الانتظار';

  @override
  String get statusRunning => 'جارٍ التحويل';

  @override
  String get statusCompleted => 'تم';

  @override
  String get statusFailed => 'فشل';

  @override
  String get statusCancelled => 'أُلغي';

  @override
  String batchSummary(int done, int total) {
    return 'اكتمل $done من $total';
  }

  @override
  String batchCompleted(int done) {
    return 'الملفات المحوَّلة: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'تم تحويل $done، وفشل $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'أصغر بنسبة $percent%';
  }

  @override
  String grewPercent(int percent) {
    return 'أكبر بنسبة $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from ← $to';
  }

  @override
  String get appearance => 'المظهر';

  @override
  String get themeSystem => 'النظام';

  @override
  String get language => 'اللغة';

  @override
  String get languageSystem => 'النظام';

  @override
  String get privacyTitle => 'الخصوصية';

  @override
  String get privacyBody =>
      'يحوّل Eluna Media ملفاتك بالكامل على هذا الجهاز باستخدام نسخة مضمّنة من FFmpeg. ملفاتك لا تغادر الجهاز أبدًا، ولا يلزم حساب، ولا توجد قياسات عن بُعد. لا شيء في التطبيق يستخدم الشبكة إطلاقًا — بل إنه لا يملك حتى إذن الإنترنت.\n\nإزالة البيانات الوصفية مفعّلة افتراضيًا، لذا تُحذف EXIF وإحداثيات GPS والطوابع الزمنية من الملفات التي تصدّرها.';

  @override
  String get licenseTitle => 'التراخيص';

  @override
  String get licenseBody =>
      'يتضمّن هذا التطبيق FFmpeg المبني مع x264 وx265 ومكوّنات GPL أخرى، لذا يُوزَّع التطبيق ككل بموجب رخصة GNU GPL v3.';

  @override
  String get sourceMissing => 'لم يعد الملف المصدر متاحًا.';

  @override
  String get tabSettings => 'الإعدادات';

  @override
  String get introTitle => 'خاص بالتصميم';

  @override
  String get introOfflineTitle => 'يحوّل على هذا الجهاز';

  @override
  String get introOfflineBody =>
      'نسخة مضمّنة من FFmpeg تقوم بكل العمل. ملفاتك لا تغادر الهاتف — والتحويل يعمل في وضع الطيران.';

  @override
  String get introTelemetryTitle => 'صفر قياسات عن بُعد';

  @override
  String get introTelemetryBody =>
      'لا حساب، ولا تحليلات، ولا تقارير أعطال. التطبيق لا يعرف من أنت.';

  @override
  String get introMetadataTitle => 'البيانات الوصفية تحت السيطرة';

  @override
  String get introMetadataBody =>
      'تُزال EXIF وGPS والطوابع الزمنية من كل ناتج افتراضيًا. ويمكنك إيقاف ذلك.';

  @override
  String get introFreeNote =>
      'مجاني، بلا إعلانات وبلا اشتراكات. كل ميزة، بما فيها التحويل الجماعي، لك منذ البداية — والشيء الوحيد القابل للشراء هو إكرامية، وهي لا تفتح شيئًا.';

  @override
  String get introContinue => 'لنبدأ';

  @override
  String get modeSimple => 'بسيط';

  @override
  String get modeAdvanced => 'متقدم';

  @override
  String get modeAdvancedHint =>
      'اعرض كل ترميز ومعدل بت وأداة تحويل بدلًا من بطاقات الإعدادات الجاهزة.';

  @override
  String get presetCompressVideoTitle => 'ضغط الفيديو';

  @override
  String get presetCompressVideoBody => 'ملف MP4 أصغر بكثير مع جودة جيدة';

  @override
  String get presetFitToSizeTitle => 'ملاءمة الحجم';

  @override
  String get presetFitToSizeBody => 'بلوغ حد دقيق — ديسكورد، البريد، المحادثات';

  @override
  String get presetCompatibleMp4Title => 'MP4 متوافق';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. يعمل في كل مكان';

  @override
  String get presetExtractAudioTitle => 'استخراج الصوت';

  @override
  String get presetExtractAudioBody => 'MP3 من أي فيديو';

  @override
  String get presetVideoToGifTitle => 'فيديو إلى GIF';

  @override
  String get presetVideoToGifBody => 'مقطع قصير إلى صورة GIF متحركة';

  @override
  String get presetMergeTitle => 'دمج مقاطع الفيديو';

  @override
  String get presetMergeBody => 'ضم المقاطع في MP4 واحد بالترتيب';

  @override
  String get mergeNeedsTwo => 'اختر مقطعي فيديو على الأقل للدمج.';

  @override
  String mergedVideoName(int count) {
    return 'فيديو مدمج ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ضغط الصورة';

  @override
  String get presetCompressImageBody => 'JPEG أصغر بفقد لا يكاد يُرى';

  @override
  String get presetEnhancePhotoTitle => 'تحسين الصورة';

  @override
  String get presetEnhancePhotoBody => 'أنظف وأوضح وبلون أفضل';

  @override
  String get presetImageToWebpTitle => 'صورة إلى WebP';

  @override
  String get presetImageToWebpBody => 'صيغة حديثة أصغر من JPEG';

  @override
  String get sizeTargetTitle => 'الحجم المستهدف';

  @override
  String sizeTargetMb(int mb) {
    return '$mb م.ب';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb م.ب';
  }

  @override
  String get sizeTargetCustom => 'مخصص…';

  @override
  String get sizeTargetDialogTitle => 'الحجم المستهدف بالميغابايت';

  @override
  String get sizeTargetTooSmall =>
      'الهدف أصغر من أن يناسب هذه المدة؛ ستُستخدم أقرب جودة ممكنة.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size لكل ملف';
  }

  @override
  String estimateTotal(String size) {
    return 'الناتج المقدّر: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'الملفات المحددة: $count';
  }

  @override
  String get promiseOffline => 'تحويل بلا إنترنت ١٠٠٪';

  @override
  String get promiseBatchFree => 'التحويل الجماعي مجاني';

  @override
  String get promiseNoWatermark => 'بلا علامة مائية';

  @override
  String get sectionTransform => 'التحويلات';

  @override
  String get rotateLabel => 'تدوير';

  @override
  String get flipLabel => 'عكس أفقي';

  @override
  String get speedLabel => 'السرعة';

  @override
  String get cropLabel => 'اقتصاص';

  @override
  String get cropHint =>
      'اقتصاص من المنتصف إلى النسبة المختارة — مربع للمنشورات، و٩:١٦ للقصص.';

  @override
  String volumeLabel(int percent) {
    return 'مستوى الصوت: $percent%';
  }

  @override
  String get addAudioFiles => 'صوت وملفات أخرى';

  @override
  String get hwEncoderLabel => 'ترميز عتادي';

  @override
  String get hwEncoderHint =>
      'يستخدم شريحة الفيديو في الجهاز في وضعَي معدل البت وملاءمة الحجم — أسرع بكثير وأبرد. أما وضع الجودة (CRF) فيستخدم دائمًا المُرمِّز البرمجي الدقيق، والمهمة العتادية الفاشلة يُعاد تنفيذها برمجيًا تلقائيًا.';

  @override
  String get transformNeedsReencode =>
      'التدوير والعكس والسرعة تتطلب إعادة ترميز، لذا تُعطَّل أثناء نسخ التدفق.';

  @override
  String get capBitrateLabel => 'لا تجعل الملف أكبر أبدًا';

  @override
  String get capBitrateHint =>
      'يحدّ الترميز عند معدل بت المصدر نفسه. الجودة الثابتة بلا سقف خاص بها، لذا قد يخرج فيديو مضغوط أصلًا أكبر من دون هذا الحد.';

  @override
  String get keepSubtitles => 'إبقاء الترجمات';

  @override
  String get keepSubtitlesHint =>
      'ينقل مسارات الترجمة إلى الناتج. الترجمات النصية فقط.';

  @override
  String get sectionTrim => 'القص';

  @override
  String get trimEnable => 'قص المصدر';

  @override
  String get trimHint =>
      'متاح عندما يكون في قائمة الانتظار ملف واحد بالضبط ومدته معروفة.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'الحجم المستهدف';

  @override
  String get lowBatteryTitle => 'البطارية منخفضة';

  @override
  String get lowBatteryBody =>
      'التحويل يُجهد المعالج. يمكنك توصيل الشاحن أولًا، أو المتابعة على أي حال.';

  @override
  String get lowBatteryContinue => 'تحويل على أي حال';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonOk => 'حسنًا';

  @override
  String filesReceived(int count) {
    return 'الملفات المستلمة: $count';
  }

  @override
  String get saveFile => 'حفظ';

  @override
  String get savedToGallery => 'حُفظ في المعرض، ألبوم «Eluna Media».';

  @override
  String get savedToDownloads => 'حُفظ في التنزيلات.';

  @override
  String get saveFailed => 'تعذّر حفظ الملف.';

  @override
  String get jobRemovedUndo => 'أُزيلت المهمة.';

  @override
  String get finishedClearedUndo => 'مُسحت المهام المكتملة.';

  @override
  String get undo => 'تراجع';

  @override
  String get errorDetailsTitle => 'تفاصيل الخطأ';

  @override
  String get sectionConversionPrefs => 'التحويل';

  @override
  String get powerModeLabel => 'وضع الطاقة';

  @override
  String get powerEfficiency => 'بارد وسريع';

  @override
  String get powerBalanced => 'متوازن';

  @override
  String get powerQuality => 'أقصى ضغط';

  @override
  String get powerModeHint =>
      'مدى إجهاد مُرمِّز الفيديو. الأبرد والأسرع يعني ملفات أكبر قليلًا. ولا يُخفَّض أي شيء آخر أبدًا.';

  @override
  String get hapticsLabel => 'استجابة اهتزازية';

  @override
  String get networkPrivacyTitle => 'الشبكة والخصوصية';

  @override
  String get netAuditIntro =>
      'قائمة كاملة بكل ما في هذا التطبيق يمكنه أن يمس الشبكة.';

  @override
  String get netAuditNoneTitle => 'لا وصول إلى الشبكة إطلاقًا';

  @override
  String get netAuditNoneBody =>
      'لا يطلب التطبيق إذن الإنترنت، فلا يستطيع الوصول إلى الشبكة حتى لو حاول — ويمكنك التحقق من ذلك في معلومات التطبيق بالنظام. لا إعلانات ولا تحليلات ولا فحص تحديثات. و«قيّم التطبيق» يسلّم الأمر إلى تطبيق المتجر، وهو من يتواصل.';

  @override
  String get netAuditConversionTitle => 'التحويل';

  @override
  String get netAuditConversionBody =>
      'يعمل كليًا على هذا الجهاز عبر FFmpeg مضمّن. فعّل وضع الطيران وحوّل — سيعمل.';

  @override
  String get netAuditTelemetryTitle => 'القياسات عن بُعد';

  @override
  String get netAuditTelemetryBody =>
      'لا وجود لها. لا يجمع التطبيق تحليلات ولا تقارير أعطال ولا معرّفات، ولا يملك نظام حسابات.';

  @override
  String get netAuditTipsTitle => 'الإكراميات';

  @override
  String get netAuditTipsBody =>
      'الإكرامية ينفّذها تطبيق Play Store لا هذا التطبيق — الذي ما زال بلا إذن إنترنت. لكن الفوترة تضيف سطرين إلى قائمة الأذونات: «عمليات شراء داخل التطبيق»، و«عرض اتصالات الشبكة» الذي يقرأ فقط ما إذا كان هناك اتصال ولا يستطيع استخدامه. لا يُشترى شيء تلقائيًا أبدًا، والإكرامية لا تفتح شيئًا: كل ما هنا مجاني.';

  @override
  String get sectionSupport => 'الدعم';

  @override
  String get rateApp => 'قيّم التطبيق';

  @override
  String get openLicenses => 'تراخيص المصادر المفتوحة';

  @override
  String get presetAudioToMp3Title => 'تحويل الصوت';

  @override
  String get presetAudioToMp3Body => 'إلى MP3 — يعمل على كل شيء';

  @override
  String get presetCompressAudioTitle => 'ضغط الصوت';

  @override
  String get presetCompressAudioBody => 'AAC أخف — ملاحظات صوتية وبودكاست';

  @override
  String get convertTo => 'تحويل إلى';

  @override
  String get formatSectionHint =>
      'تُعرض فقط الصيغ التي يمكن لملفاتك أن تصبح عليها فعلًا.';

  @override
  String get sourceVideo => 'فيديو';

  @override
  String get sourceImage => 'صورة';

  @override
  String get sourceAudio => 'صوت';

  @override
  String get sourceUnknown => 'ملف';

  @override
  String get mixedSelectionTitle => 'أنواع ملفات مختلفة محدّدة';

  @override
  String get mixedSelectionBody =>
      'يُحوَّل كل ملف بأفضل إعداد لنوعه. أضف نوعًا واحدًا في كل مرة للتحكم الكامل.';

  @override
  String get filesTitle => 'الملفات';

  @override
  String get removeFile => 'إزالة';

  @override
  String timeLeft(String time) {
    return '≈ $time متبقية';
  }

  @override
  String get jobSettingsTitle => 'إعدادات التحويل';

  @override
  String get jobDetails => 'التفاصيل';

  @override
  String summaryQuality(int value) {
    return 'CRF $value';
  }

  @override
  String summaryBitrate(int value) {
    return '$value ك.بت/ث';
  }

  @override
  String summaryTargetSize(String size) {
    return '≤ $size';
  }

  @override
  String get summaryEnhanced => 'محسّن';

  @override
  String get summaryMetadataStripped => 'أُزيلت البيانات الوصفية';

  @override
  String summaryMerge(int count) {
    return 'المقاطع المدمجة: $count';
  }

  @override
  String get shareApp => 'مشاركة التطبيق';

  @override
  String get shareAppText =>
      'Eluna Media — محوّل صور وفيديو وصوت مجاني يعمل بلا إنترنت تمامًا. بلا اشتراكات، بلا علامات مائية، بلا حسابات.';

  @override
  String appVersionLabel(String version) {
    return 'الإصدار $version';
  }

  @override
  String get openFile => 'فتح';

  @override
  String get openFolder => 'إظهار المجلد';

  @override
  String get noAppToOpen =>
      'لا يوجد تطبيق على هذا الجهاز يستطيع فتح ذلك الملف.';

  @override
  String get openFailed => 'تعذّر فتح الملف.';

  @override
  String get twoPassLabel => 'مروران لحجم دقيق';

  @override
  String get twoPassHint =>
      'مهام ملاءمة الحجم تُرمَّز مرتين وتصيب حد البايتات بدقة أوضح — مقابل ضعف الوقت والبطارية تقريبًا.';

  @override
  String get whatsNewTitle => 'ما الجديد';

  @override
  String get whatsNew1 =>
      'يمكن للفيديو أن يكون AV1 الآن: ملفات أصغر بوضوح، إن كنت تستطيع الانتظار.';

  @override
  String get whatsNew2 =>
      'جديد للصور: AVIF بنحو نصف حجم JPEG، وWebP متحركة بدلًا من GIF.';

  @override
  String get whatsNew3 =>
      'يمكن لـ M4A أن يكون بلا فقدان — إذ صار ALAC إلى جانب AAC.';

  @override
  String get whatsNew4 =>
      'شاشة واحدة للمظهر: السطوع، ولون التمييز، والأسود الخالص لشاشات OLED، وMaterial You.';

  @override
  String get whatsNew5 =>
      'صارت للإنجازات ميداليات وثلاثة تبويبات وتقدّم يمكن مشاركته كصورة.';

  @override
  String get achievementsTitle => 'الإنجازات';

  @override
  String achievementsProgress(int done, int total) {
    return '$done من $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'تُحسب على هذا الجهاز فقط. لا يُرفع شيء إلى أي مكان.';

  @override
  String get achFirstConversionTitle => 'الخطوات الأولى';

  @override
  String get achFirstConversionBody => 'حوّل ملفك الأول.';

  @override
  String get achTenConversionsTitle => 'إحماء';

  @override
  String get achTenConversionsBody => 'حوّل ١٠ ملفات.';

  @override
  String get achFiftyConversionsTitle => 'منتظم';

  @override
  String get achFiftyConversionsBody => 'حوّل ٥٠ ملفًا.';

  @override
  String get achTwoHundredConversionsTitle => 'حصان عمل';

  @override
  String get achTwoHundredConversionsBody => 'حوّل ٢٠٠ ملف.';

  @override
  String get achThousandConversionsTitle => 'خط إنتاج';

  @override
  String get achThousandConversionsBody => 'حوّل ١٠٠٠ ملف.';

  @override
  String get achSaved100MbTitle => 'موفّر مساحة';

  @override
  String get achSaved100MbBody => 'وفّر ١٠٠ م.ب إجمالًا.';

  @override
  String get achSaved1GbTitle => 'صائد الغيغابايت';

  @override
  String get achSaved1GbBody => 'وفّر ١ غ.ب إجمالًا.';

  @override
  String get achSaved10GbTitle => 'بطل التخزين';

  @override
  String get achSaved10GbBody => 'وفّر ١٠ غ.ب إجمالًا.';

  @override
  String get achBatchOfFiveTitle => 'عامل الدفعات';

  @override
  String get achBatchOfFiveBody => 'أنهِ دفعة من ٥ ملفات أو أكثر.';

  @override
  String get achBatchOfTwentyTitle => 'خط تجميع';

  @override
  String get achBatchOfTwentyBody => 'أنهِ دفعة من ٢٠ ملفًا أو أكثر.';

  @override
  String get achSniperTitle => 'قنّاص';

  @override
  String get achSniperBody => 'أصب حجمًا دقيقًا بملاءمة الحجم.';

  @override
  String get achMemeSmithTitle => 'حدّاد الميمات';

  @override
  String get achMemeSmithBody => 'حوّل فيديو إلى GIF.';

  @override
  String get achSoundHunterTitle => 'صائد الصوت';

  @override
  String get achSoundHunterBody => 'استخرج الصوت من فيديو.';

  @override
  String get achSubtitleKeeperTitle => 'حافظ الترجمات';

  @override
  String get achSubtitleKeeperBody => 'حوّل فيديو مع الإبقاء على ترجماته.';

  @override
  String get achDirectorTitle => 'مخرج';

  @override
  String get achDirectorBody =>
      'طبّق تحويلًا — تدوير أو اقتصاص أو سرعة أو مستوى صوت.';

  @override
  String get achAllRounderTitle => 'شامل';

  @override
  String get achAllRounderBody => 'حوّل فيديو وصوتًا وصورة.';

  @override
  String get achNightOwlTitle => 'بومة ليل';

  @override
  String get achNightOwlBody => 'أنهِ تحويلًا بين منتصف الليل والخامسة صباحًا.';

  @override
  String get achPlatinumTitle => 'بلاتيني';

  @override
  String get achPlatinumBody => 'احصل على كل الإنجازات الأخرى.';

  @override
  String get storageTitle => 'التخزين';

  @override
  String get storageBody =>
      'تبقى الملفات المحوّلة داخل التطبيق حتى تحفظها أو تشاركها، حيث لا يصل إليها أي مدير ملفات.';

  @override
  String get storageEmpty => 'لا شيء مخزّن';

  @override
  String storageUsage(String size) {
    return 'مخزّن: $size';
  }

  @override
  String get storageClearTitle => 'مسح الملفات المخزّنة؟';

  @override
  String get storageClearBody =>
      'يحذف كل نتيجة مكتملة ما زال التطبيق يحتفظ بها. أما الملفات التي حفظتها أو شاركتها فلا تُمس.';

  @override
  String get storageClearAction => 'مسح';

  @override
  String storageCleared(String size) {
    return 'تحرّر $size';
  }

  @override
  String get autoSaveLabel => 'حفظ النتائج تلقائيًا';

  @override
  String get autoSaveHint =>
      'يضع كل ملف مكتمل في المعرض — والصوت في التنزيلات — فور جهوزه.';

  @override
  String get lowSpaceTitle => 'المساحة المتبقية قليلة';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'تحتاج هذه الدفعة إلى نحو $needed ولا يتوفر سوى $free. قد يتوقف التحويل في منتصفه.';
  }

  @override
  String saveAll(int count) {
    return 'حفظ الكل ($count)';
  }

  @override
  String savedAll(int count) {
    return 'حُفظ: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'حُفظ $saved من $total';
  }

  @override
  String get presetFitPhotoTitle => 'ملاءمة حجم الصورة';

  @override
  String get presetFitPhotoBody =>
      'اضغط صورة تحت حد دقيق — نماذج الرفع والطلبات.';

  @override
  String get photoFitHint =>
      'يجرّب التطبيق مستويات الجودة حتى تناسب إحداها. وإن كانت الميزانية أصغر من أن تكفي الصورة، يقلّل أبعادها أيضًا.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb ك.ب';
  }

  @override
  String get sizeTargetDialogTitleKb => 'الحجم المستهدف بالكيلوبايت';

  @override
  String get compareAction => 'مقارنة';

  @override
  String get compareBefore => 'قبل';

  @override
  String get compareAfter => 'بعد';

  @override
  String get compareHint => 'اضغط مطوّلًا لرؤية الأصل.';

  @override
  String get trimStart => 'البداية';

  @override
  String get trimEnd => 'النهاية';

  @override
  String trimTimeHelp(String duration) {
    return 'د:ثث، حتى $duration';
  }

  @override
  String get imageScaleLabel => 'المقياس';

  @override
  String get audioChannelsLabel => 'القنوات';

  @override
  String get audioMono => 'أحادي';

  @override
  String get audioStereo => 'ستيريو';

  @override
  String get sampleRateLabel => 'معدل العيّنات';

  @override
  String get voiceAudioHint =>
      'الأحادي عند ٢٢٫٠٥ ك.هرتز يقلّص تسجيلًا صوتيًا إلى نحو ربعه بلا فقد مسموع. أبقِ الاثنين على الأصلي للموسيقى.';

  @override
  String get moveUp => 'تحريك لأعلى';

  @override
  String get moveDown => 'تحريك لأسفل';

  @override
  String get renameOutput => 'إعادة تسمية النتيجة';

  @override
  String get renameOutputHint => 'الاسم الجديد';

  @override
  String get renameOutputHelp =>
      'الامتداد يأتي من صيغة الإخراج. اتركه فارغًا لتسمية النتيجة باسم المصدر.';

  @override
  String deleteOriginalsAction(int count) {
    return 'حذف الأصول ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'حذف الأصول بعد التحويل';

  @override
  String get deleteOriginalsHint =>
      'يطلب من النظام إزالة الملفات المصدر بعد حفظ النتيجة. ويعرض النظام دائمًا ما سيُحذف وينتظر تأكيدك.';

  @override
  String get mediaAccessRequired =>
      'يلزم الوصول إلى مكتبة الوسائط لحذف الملفات الأصلية.';

  @override
  String originalsDeleted(String size) {
    return 'حُذفت الأصول — تحرّر $size';
  }

  @override
  String get originalsNoneDeleted =>
      'لم يُحذف شيء. لا يمكن العثور إلا على الملفات التي ما زال المعرض يحفظها باسمها الأصلي.';

  @override
  String reclaimedTotal(String size) {
    return 'تحرّر بهذا التطبيق: $size';
  }

  @override
  String get deleteAllData => 'حذف كل البيانات';

  @override
  String get deleteAllDataHint =>
      'يمحو كل ما يحتفظ به التطبيق على هذا الجهاز: قائمة الانتظار والملفات المحوّلة والمعاينات والإنجازات والإعدادات. أما الملفات التي حفظتها في معرضك فتبقى كما هي.';

  @override
  String get codecCopy => 'نسخ';

  @override
  String get codecCopyRemux => 'نسخ (إعادة تغليف)';

  @override
  String get codecNoVideo => 'بلا فيديو';

  @override
  String get codecNoAudio => 'بلا صوت';

  @override
  String codecLossless(String codec) {
    return '$codec (بلا فقدان)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (متحرك)';
  }

  @override
  String get sizeTargetEmail => 'البريد';

  @override
  String get trimTimeHint => 'د:ثث';
}
