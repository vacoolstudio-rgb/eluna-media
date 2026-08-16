// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class L10nMy extends L10n {
  L10nMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'ပြောင်းရန်';

  @override
  String get tabQueue => 'စီတန်း';

  @override
  String get addFiles => 'ဖိုင်များ ထည့်ရန်';

  @override
  String get emptySelectionTitle => 'ဖိုင် မရှိသေးပါ';

  @override
  String get emptySelectionBody =>
      'ဓာတ်ပုံ၊ ဗီဒီယို သို့မဟုတ် အသံဖိုင်များ ထည့်ပါ။ အားလုံးကို ဤစက်ပစ္စည်းပေါ်တွင်ပင် လုပ်ဆောင်ပါသည်။';

  @override
  String get sectionOutput => 'အထွက်';

  @override
  String get sectionVideo => 'ဗီဒီယို';

  @override
  String get sectionAudio => 'အသံ';

  @override
  String get sectionImage => 'ပုံ';

  @override
  String get sectionPrivacy => 'ကိုယ်ရေးကိုယ်တာ';

  @override
  String get outputFormat => 'ဖော်မတ်';

  @override
  String get videoCodec => 'ဗီဒီယို ကိုဒက်ခ်';

  @override
  String get audioCodec => 'အသံ ကိုဒက်ခ်';

  @override
  String get rateControl => 'နှုန်း ထိန်းချုပ်မှု';

  @override
  String get rateControlQuality => 'အရည်အသွေး တစ်သမတ်တည်း (CRF)';

  @override
  String get rateControlBitrate => 'ရည်မှန်း ဘစ်နှုန်း';

  @override
  String crfLabel(int value) {
    return 'အရည်အသွေး (CRF $value)';
  }

  @override
  String get crfHint =>
      'တန်ဖိုး နိမ့်လေ အရည်အသွေး ကောင်းလေ၊ ဖိုင်အရွယ်လည်း ကြီးလေ ဖြစ်သည်။';

  @override
  String videoBitrate(int value) {
    return 'ဗီဒီယို ဘစ်နှုန်း: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'အသံ ဘစ်နှုန်း: $value kbps';
  }

  @override
  String get encodingPreset => 'အင်ကုဒ်ဒါ ပရီဆက်';

  @override
  String get encodingPresetHint =>
      'နှေးသော ပရီဆက်များက ပိုကောင်းစွာ ချုံ့ပေးသော်လည်း စက်ကို ပိုပူစေသည်။';

  @override
  String get presetOriginal => 'မူရင်း';

  @override
  String get resolution => 'ကြည်လင်ပြတ်သားမှု';

  @override
  String get frameRate => 'ဖရိမ်နှုန်း';

  @override
  String imageQuality(int value) {
    return 'အရည်အသွေး: $value';
  }

  @override
  String get lossless => 'ဆုံးရှုံးမှုမဲ့';

  @override
  String get losslessHint =>
      'ဖိုင် ပိုကြီးသော်လည်း ပစ်ဆယ်တိုင်း မူရင်းအတိုင်း ဖြစ်သည်။';

  @override
  String get sectionEnhance => 'မြှင့်တင်မှု';

  @override
  String get sharpenLabel => 'ထက်မြက်မှု';

  @override
  String get sharpenHint =>
      'အနားသတ်များကို ပိုကွက်ကွက်ကွင်းကွင်း ဖြစ်စေသည်။ ဝါးနေသော သို့မဟုတ် ဖိုကပ် မမိသော ဓာတ်ပုံကို ပြန်ကောင်းအောင် မလုပ်နိုင်ပါ — ထိုအသေးစိတ်သည် ဖိုင်ထဲတွင် မရှိပါ။';

  @override
  String get sharpenStrongHint =>
      'ထက်မြက်မှု အားပြင်းလျှင် အနားသတ်များတွင် အလင်းဝိုင်းများ ကျန်နိုင်သည်။ အလယ်အလတ်ကို အရင် စမ်းကြည့်ပါ။';

  @override
  String get denoiseLabel => 'ဆူညံမှု လျှော့ချခြင်း';

  @override
  String get denoiseHint =>
      'မှောင်သော နှင့် ညဘက် ဓာတ်ပုံများရှိ အစက်အပြောက်များကို သန့်စင်ပေးသည်။ များလွန်းလျှင် အသေးစိတ် အသွင်အပြင်များ ပျောက်သွားသည်။';

  @override
  String get autoColorLabel => 'အရောင်နှင့် အလင်းအမှောင် အလိုအလျောက်';

  @override
  String get autoColorHint =>
      'အလင်းအမှောင် ကွာခြားချက်ကို ဆွဲဆန့်ပြီး ပြားနေသော အရောင်များကို အနည်းငယ် မြှင့်ပေးသည်။';

  @override
  String get upscaleLabel => '2× ချဲ့ရန်';

  @override
  String get upscaleHint =>
      'အနံနှင့် အမြင့်ကို နှစ်ဆ တိုးပေးသည်။ အသေးစိတ် အသစ် ထပ်မထည့်ပါ — ပုံနှိပ်ရာတွင် သို့မဟုတ် ဖြတ်ညှပ်ရာတွင် အသုံးဝင်သည်။';

  @override
  String get upscaleConflictHint =>
      'ချဲ့နိုင်ရန် ကြည်လင်ပြတ်သားမှုကို မူရင်းသို့ ပြန်ထားပါ။';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ပိတ်';

  @override
  String get enhanceLight => 'အနည်းငယ်';

  @override
  String get enhanceMedium => 'အလယ်အလတ်';

  @override
  String get enhanceStrong => 'ပြင်းထန်';

  @override
  String get stripMetadata => 'မက်တာဒေတာ ဖယ်ရှားရန်';

  @override
  String get stripMetadataHint =>
      'အထွက်ဖိုင်မှ EXIF၊ GPS နှင့် အချိန်တံဆိပ်များကို ဖယ်ရှားသည်။';

  @override
  String startConversion(int count) {
    return 'ဖိုင်များ ပြောင်းရန် ($count)';
  }

  @override
  String get batchResumed =>
      'ရပ်တန့်သွားသော ပြောင်းလဲမှုကို ပြန်စတင်ပြီးပါပြီ။';

  @override
  String get converting => 'ပြောင်းနေသည်…';

  @override
  String get cancelBatch => 'ရပ်ရန်';

  @override
  String get cancelJob => 'ပယ်ဖျက်ရန်';

  @override
  String get clearFinished => 'ပြီးဆုံးသည်များ ရှင်းရန်';

  @override
  String get removeJob => 'ဖယ်ရှားရန်';

  @override
  String get shareFile => 'မျှဝေရန်';

  @override
  String get retryJob => 'ပြန်လုပ်ရန်';

  @override
  String get queueEmptyTitle => 'စီတန်း ဗလာ ဖြစ်နေသည်';

  @override
  String get queueEmptyBody =>
      'ပြောင်းရန် တက်ဘ်တွင် ထည့်သော ဖိုင်များ ဤနေရာတွင် ပေါ်လာမည်။';

  @override
  String queueActiveTab(int count) {
    return 'လုပ်ဆောင်ဆဲ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'ပြီးဆုံး · $count';
  }

  @override
  String get queueNoActiveTitle => 'လုပ်ဆောင်နေသည် မရှိပါ';

  @override
  String get queueNoActiveBody =>
      'စောင့်ဆိုင်းနေသော သို့မဟုတ် ပြောင်းနေသော ဖိုင်များ ဤနေရာတွင် ပေါ်မည်။';

  @override
  String get queueNoFinishedTitle => 'ပြီးဆုံးသည် မရှိသေးပါ';

  @override
  String get queueNoFinishedBody =>
      'ပြောင်းပြီးသော ဖိုင်များ ဤနေရာသို့ ရောက်လာပြီး ဖွင့်ရန်၊ သိမ်းရန် သို့မဟုတ် မျှဝေရန် အဆင်သင့် ဖြစ်နေမည်။';

  @override
  String get statusQueued => 'စောင့်ဆိုင်းဆဲ';

  @override
  String get statusRunning => 'ပြောင်းနေသည်';

  @override
  String get statusCompleted => 'ပြီးပါပြီ';

  @override
  String get statusFailed => 'မအောင်မြင်ပါ';

  @override
  String get statusCancelled => 'ပယ်ဖျက်ပြီး';

  @override
  String batchSummary(int done, int total) {
    return '$total ခုအနက် $done ခု ပြီးပါပြီ';
  }

  @override
  String batchCompleted(int done) {
    return 'ပြောင်းပြီးသော ဖိုင်များ: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done ခု ပြောင်းပြီး၊ $failed ခု မအောင်မြင်ပါ။';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% သေးသွားသည်';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% ကြီးသွားသည်';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'အသွင်အပြင်';

  @override
  String get themeSystem => 'စနစ်အတိုင်း';

  @override
  String get language => 'ဘာသာစကား';

  @override
  String get languageSystem => 'စနစ်အတိုင်း';

  @override
  String get privacyTitle => 'ကိုယ်ရေးကိုယ်တာ';

  @override
  String get privacyBody =>
      'Eluna Media သည် သင့်ဖိုင်များကို တွဲပါလာသော FFmpeg ကို အသုံးပြု၍ ဤစက်ပစ္စည်းပေါ်တွင်သာ အပြည့်အဝ ပြောင်းလဲပေးပါသည်။ သင့်ဖိုင်များ စက်မှ ထွက်မသွားပါ၊ အကောင့် မလိုအပ်ပါ၊ တယ်လီမက်ထရီလည်း မရှိပါ။ အက်ပ်ထဲမှ မည်သည့်အရာမျှ ကွန်ရက်ကို လုံးဝ မသုံးပါ — အင်တာနက် ခွင့်ပြုချက်ကိုပင် မကိုင်ဆောင်ထားပါ။\n\nမက်တာဒေတာ ဖယ်ရှားမှုကို မူရင်းအတိုင်း ဖွင့်ထားသဖြင့် သင် ထုတ်ယူသော ဖိုင်များမှ EXIF၊ GPS တည်နေရာနှင့် အချိန်တံဆိပ်များကို ဖယ်ထုတ်ပါသည်။';

  @override
  String get licenseTitle => 'လိုင်စင်';

  @override
  String get licenseBody =>
      'ဤအက်ပ်တွင် x264၊ x265 နှင့် အခြား GPL အစိတ်အပိုင်းများဖြင့် တည်ဆောက်ထားသော FFmpeg ပါဝင်သဖြင့် အက်ပ်တစ်ခုလုံးကို GNU GPL v3 အောက်တွင် ဖြန့်ဝေပါသည်။';

  @override
  String get sourceMissing => 'မူရင်းဖိုင်ကို ရှာမတွေ့တော့ပါ။';

  @override
  String get tabSettings => 'ဆက်တင်များ';

  @override
  String get introTitle => 'ဒီဇိုင်းအရ ကိုယ်ရေးကိုယ်တာ';

  @override
  String get introOfflineTitle => 'ဤစက်ပေါ်တွင်ပင် ပြောင်းသည်';

  @override
  String get introOfflineBody =>
      'တွဲပါလာသော FFmpeg က အလုပ်အားလုံးကို လုပ်ပေးသည်။ သင့်ဖိုင်များ ဖုန်းမှ ထွက်မသွားပါ — လေယာဉ်ပျံမုဒ်တွင်ပင် ပြောင်းလဲမှု အလုပ်လုပ်သည်။';

  @override
  String get introTelemetryTitle => 'တယ်လီမက်ထရီ လုံးဝ မရှိ';

  @override
  String get introTelemetryBody =>
      'အကောင့် မရှိ၊ ခွဲခြမ်းစိတ်ဖြာမှု မရှိ၊ ချွတ်ယွင်းချက် အစီရင်ခံမှု မရှိ။ အက်ပ်သည် သင် မည်သူမည်ဝါ ဖြစ်ကြောင်း မသိပါ။';

  @override
  String get introMetadataTitle => 'မက်တာဒေတာ ထိန်းချုပ်မှုအောက်တွင်';

  @override
  String get introMetadataBody =>
      'EXIF၊ GPS နှင့် အချိန်တံဆိပ်များကို အထွက်ဖိုင်တိုင်းမှ မူရင်းအတိုင်း ဖယ်ရှားသည်။ ၎င်းကို ပိတ်ထားနိုင်သည်။';

  @override
  String get introFreeNote =>
      'ကြော်ငြာ မပါ၊ စာရင်းသွင်းခ မပါဘဲ အခမဲ့။ အသုတ်လိုက် ပြောင်းလဲမှု အပါအဝင် လုပ်ဆောင်ချက်တိုင်းသည် အစကတည်းက သင့်လက်ထဲတွင် ရှိသည် — ဝယ်နိုင်သည့် တစ်ခုတည်းသော အရာမှာ လက်ဆောင်ငွေ ဖြစ်ပြီး ၎င်းက မည်သည့်အရာကိုမျှ ဖွင့်ပေးခြင်း မရှိပါ။';

  @override
  String get introContinue => 'စတင်ရန်';

  @override
  String get modeSimple => 'ရိုးရှင်း';

  @override
  String get modeAdvanced => 'အဆင့်မြင့်';

  @override
  String get modeAdvancedHint =>
      'ပရီဆက် ကတ်များအစား ကိုဒက်ခ်၊ ဘစ်နှုန်းနှင့် အသွင်ပြောင်း ထိန်းချုပ်မှု အားလုံးကို ပြသည်။';

  @override
  String get presetCompressVideoTitle => 'ဗီဒီယို ချုံ့ရန်';

  @override
  String get presetCompressVideoBody =>
      'MP4 အလွန် သေးသွားပြီး အရည်အသွေး ကောင်းနေဆဲ';

  @override
  String get presetFitToSizeTitle => 'အရွယ်အစားနှင့် ကိုက်ညီအောင်';

  @override
  String get presetFitToSizeBody =>
      'တိကျသော ကန့်သတ်ချက်သို့ — Discord၊ အီးမေးလ်၊ ချက်တင်';

  @override
  String get presetCompatibleMp4Title => 'တွဲဖက်အသုံးပြုနိုင်သော MP4';

  @override
  String get presetCompatibleMp4Body =>
      'H.264 + AAC။ နေရာတိုင်းတွင် ဖွင့်လို့ရသည်';

  @override
  String get presetExtractAudioTitle => 'အသံ ထုတ်ယူရန်';

  @override
  String get presetExtractAudioBody => 'မည်သည့် ဗီဒီယိုမှမဆို MP3';

  @override
  String get presetVideoToGifTitle => 'ဗီဒီယိုမှ GIF သို့';

  @override
  String get presetVideoToGifBody => 'တိုတောင်းသော ကလစ်ကို လှုပ်ရှား GIF အဖြစ်';

  @override
  String get presetMergeTitle => 'ဗီဒီယိုများ ပေါင်းစပ်ရန်';

  @override
  String get presetMergeBody =>
      'ကလစ်များကို အစဉ်လိုက် MP4 တစ်ခုတည်းအဖြစ် ချုပ်ပေးသည်';

  @override
  String get mergeNeedsTwo => 'ပေါင်းစပ်ရန် ဗီဒီယို အနည်းဆုံး နှစ်ခု ရွေးပါ။';

  @override
  String mergedVideoName(int count) {
    return 'ပေါင်းစပ်ထားသော ဗီဒီယို ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ဓာတ်ပုံ ချုံ့ရန်';

  @override
  String get presetCompressImageBody => 'JPEG ပိုသေး၊ အကျအဆုံး မမြင်သာ';

  @override
  String get presetEnhancePhotoTitle => 'ဓာတ်ပုံ မြှင့်တင်ရန်';

  @override
  String get presetEnhancePhotoBody => 'ပိုသန့်၊ ပိုကြည်၊ အရောင် ပိုကောင်း';

  @override
  String get presetImageToWebpTitle => 'ဓာတ်ပုံမှ WebP သို့';

  @override
  String get presetImageToWebpBody => 'ခေတ်မီ ဖော်မတ်၊ JPEG ထက် သေးသည်';

  @override
  String get sizeTargetTitle => 'ရည်မှန်း အရွယ်အစား';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'စိတ်ကြိုက်…';

  @override
  String get sizeTargetDialogTitle => 'ရည်မှန်း အရွယ်အစား (MB)';

  @override
  String get sizeTargetTooSmall =>
      'ဤကြာချိန်အတွက် ရည်မှန်းချက် သေးလွန်းသည်၊ ဖြစ်နိုင်သမျှ အနီးစပ်ဆုံး အရည်အသွေးကို သုံးပါမည်။';

  @override
  String estimatePerFile(String size) {
    return 'ဖိုင်တစ်ခုလျှင် ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'ခန့်မှန်း အထွက်: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'ရွေးထားသော ဖိုင်များ: $count';
  }

  @override
  String get promiseOffline => '100% အော့ဖ်လိုင်း ပြောင်းလဲမှု';

  @override
  String get promiseBatchFree => 'အသုတ်လိုက် အခမဲ့';

  @override
  String get promiseNoWatermark => 'ရေစာ မပါ';

  @override
  String get sectionTransform => 'အသွင်ပြောင်းခြင်း';

  @override
  String get rotateLabel => 'လှည့်ရန်';

  @override
  String get flipLabel => 'ဘေးတိုက် မှန်ပြန်ရန်';

  @override
  String get speedLabel => 'အမြန်နှုန်း';

  @override
  String get cropLabel => 'ဖြတ်ညှပ်ရန်';

  @override
  String get cropHint =>
      'ရွေးထားသော အချိုးအစားသို့ အလယ်မှ ဖြတ်ညှပ်သည် — ဖိဒ်များအတွက် စတုရန်း၊ စတိုရီများအတွက် 9:16။';

  @override
  String volumeLabel(int percent) {
    return 'အသံအတိုးအကျယ်: $percent%';
  }

  @override
  String get addAudioFiles => 'အသံနှင့် အခြားဖိုင်များ';

  @override
  String get hwEncoderLabel => 'ဟာ့ဒ်ဝဲဖြင့် အင်ကုဒ်လုပ်ခြင်း';

  @override
  String get hwEncoderHint =>
      'ဘစ်နှုန်း နှင့် အရွယ်ကိုက်ညီအောင် မုဒ်များတွင် စက်၏ ဗီဒီယို ချစ်ပ်ကို သုံးသည် — များစွာ ပိုမြန်ပြီး ပိုအေးသည်။ အရည်အသွေး (CRF) မုဒ်သည် တိကျသော ဆော့ဖ်ဝဲ အင်ကုဒ်ဒါကို အမြဲသုံးပြီး ဟာ့ဒ်ဝဲဖြင့် မအောင်မြင်သော အလုပ်ကို ဆော့ဖ်ဝဲဖြင့် အလိုအလျောက် ပြန်လုပ်ပေးသည်။';

  @override
  String get transformNeedsReencode =>
      'လှည့်ခြင်း၊ မှန်ပြန်ခြင်းနှင့် အမြန်နှုန်းသည် ပြန်အင်ကုဒ်ရန် လိုအပ်သဖြင့် စတရင်း ကူးယူစဉ်တွင် ပိတ်ထားသည်။';

  @override
  String get capBitrateLabel => 'ဖိုင်ကို ပိုမကြီးစေရန်';

  @override
  String get capBitrateHint =>
      'အင်ကုဒ်ကို မူရင်း၏ ဘစ်နှုန်းအထိသာ ကန့်သတ်သည်။ အရည်အသွေး တစ်သမတ်တည်း မုဒ်တွင် ကိုယ်ပိုင် အမြင့်ဆုံး ကန့်သတ်ချက် မရှိသဖြင့် ချုံ့ပြီးသား ဗီဒီယိုသည် ပိုကြီးလာနိုင်သည်။';

  @override
  String get keepSubtitles => 'စာတန်းထိုးများ ထားရှိရန်';

  @override
  String get keepSubtitlesHint =>
      'စာတန်းထိုး ထရက်များကို အထွက်ဖိုင်သို့ ယူဆောင်သွားသည်။ စာသား စာတန်းထိုးများသာ။';

  @override
  String get sectionTrim => 'ဖြတ်တောက်ခြင်း';

  @override
  String get trimEnable => 'မူရင်းကို ဖြတ်တောက်ရန်';

  @override
  String get trimHint =>
      'ကြာချိန် သိရှိသော ဖိုင်တစ်ခုတည်းသာ စီတန်းထဲတွင် ရှိမှ အသုံးပြုနိုင်သည်။';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ရည်မှန်း အရွယ်အစား';

  @override
  String get lowBatteryTitle => 'ဘက်ထရီ နည်းနေသည်';

  @override
  String get lowBatteryBody =>
      'ပြောင်းလဲမှုသည် ပရိုဆက်ဆာကို အလုပ်များစေသည်။ အားသွင်းပြီးမှ ဆက်လုပ်နိုင်သလို ယခုပင်လည်း ဆက်လုပ်နိုင်သည်။';

  @override
  String get lowBatteryContinue => 'ဆက်ပြီး ပြောင်းရန်';

  @override
  String get commonCancel => 'ပယ်ဖျက်ရန်';

  @override
  String get commonOk => 'ကောင်းပြီ';

  @override
  String filesReceived(int count) {
    return 'လက်ခံရရှိသော ဖိုင်များ: $count';
  }

  @override
  String get saveFile => 'သိမ်းရန်';

  @override
  String get savedToGallery =>
      'ပြခန်းထဲ “Eluna Media” အယ်လ်ဘမ်တွင် သိမ်းပြီးပါပြီ။';

  @override
  String get savedToDownloads => 'Downloads ထဲတွင် သိမ်းပြီးပါပြီ။';

  @override
  String get saveFailed => 'ဖိုင်ကို မသိမ်းနိုင်ပါ။';

  @override
  String get jobRemovedUndo => 'အလုပ်ကို ဖယ်ရှားပြီးပါပြီ။';

  @override
  String get finishedClearedUndo =>
      'ပြီးဆုံးသော အလုပ်များကို ရှင်းလင်းပြီးပါပြီ။';

  @override
  String get undo => 'ပြန်ဖျက်ရန်';

  @override
  String get errorDetailsTitle => 'အမှား အသေးစိတ်';

  @override
  String get sectionConversionPrefs => 'ပြောင်းလဲခြင်း';

  @override
  String get powerModeLabel => 'စွမ်းအင် မုဒ်';

  @override
  String get powerEfficiency => 'အေးပြီး မြန်';

  @override
  String get powerBalanced => 'မျှတ';

  @override
  String get powerQuality => 'အမြင့်ဆုံး ချုံ့မှု';

  @override
  String get powerModeHint =>
      'ဗီဒီယို အင်ကုဒ်ဒါ မည်မျှ အားစိုက်မည်ကို သတ်မှတ်သည်။ ပိုအေးပြီး ပိုမြန်လျှင် ဖိုင် အနည်းငယ် ပိုကြီးသည်။ အခြား မည်သည့်အရာကိုမျှ — ဘယ်တော့မှ — မကန့်သတ်ပါ။';

  @override
  String get hapticsLabel => 'တုန်ခါမှု တုံ့ပြန်ချက်';

  @override
  String get networkPrivacyTitle => 'ကွန်ရက်နှင့် ကိုယ်ရေးကိုယ်တာ';

  @override
  String get netAuditIntro =>
      'ဤအက်ပ်ထဲတွင် ကွန်ရက်ကို ထိတွေ့နိုင်သည့် အရာအားလုံး၏ ပြည့်စုံသော စာရင်း။';

  @override
  String get netAuditNoneTitle => 'ကွန်ရက် ချိတ်ဆက်မှု လုံးဝ မရှိ';

  @override
  String get netAuditNoneBody =>
      'အက်ပ်သည် အင်တာနက် ခွင့်ပြုချက်ကို မတောင်းသဖြင့် လုပ်ချင်လျှင်ပင် ကွန်ရက်သို့ မရောက်နိုင်ပါ — ၎င်းကို စနစ်၏ အက်ပ်အချက်အလက်တွင် စစ်ဆေးနိုင်သည်။ ကြော်ငြာ မရှိ၊ ခွဲခြမ်းစိတ်ဖြာမှု မရှိ၊ အပ်ဒိတ် စစ်ဆေးမှု မရှိ။ “အက်ပ်ကို အဆင့်သတ်မှတ်ရန်” သည် စတိုးအက်ပ်ကို လွှဲပေးလိုက်ပြီး ၎င်းက ကိုယ့်ဟာကိုယ် ဆက်သွယ်သည်။';

  @override
  String get netAuditConversionTitle => 'ပြောင်းလဲခြင်း';

  @override
  String get netAuditConversionBody =>
      'တွဲပါ FFmpeg ဖြင့် ဤစက်ပေါ်တွင်သာ လုပ်ဆောင်သည်။ လေယာဉ်ပျံမုဒ် ဖွင့်ပြီး ပြောင်းကြည့်ပါ — အလုပ်လုပ်သည်။';

  @override
  String get netAuditTelemetryTitle => 'တယ်လီမက်ထရီ';

  @override
  String get netAuditTelemetryBody =>
      'မရှိပါ။ အက်ပ်သည် ခွဲခြမ်းစိတ်ဖြာမှု၊ ချွတ်ယွင်းချက် အစီရင်ခံစာ၊ မှတ်သားကိန်း မည်သည့်အရာမျှ မစုဆောင်းပါ၊ အကောင့်စနစ်လည်း မရှိပါ။';

  @override
  String get netAuditTipsTitle => 'လက်ဆောင်ငွေ';

  @override
  String get netAuditTipsBody =>
      'လက်ဆောင်ငွေကို Play Store အက်ပ်က ဆောင်ရွက်ပေးခြင်း ဖြစ်ပြီး ဤအက်ပ်က မဟုတ်ပါ — ဤအက်ပ်တွင် အင်တာနက် ခွင့်ပြုချက် ဆက်လက်၍ မရှိပါ။ ငွေပေးချေမှုက ခွင့်ပြုချက် စာရင်းတွင် နှစ်ကြောင်း ထပ်ဖြည့်သည် — “အက်ပ်တွင်း ဝယ်ယူမှုများ” နှင့် “ကွန်ရက် ချိတ်ဆက်မှုများကို ကြည့်ရန်” ဖြစ်ပြီး နောက်တစ်ခုက ချိတ်ဆက်မှု ရှိ မရှိကိုသာ ဖတ်ပြီး ၎င်းကို အသုံးမပြုနိုင်ပါ။ မည်သည့်အရာမျှ အလိုအလျောက် ဝယ်ယူခြင်း မရှိပါ၊ လက်ဆောင်ငွေက မည်သည့်အရာကိုမျှ ဖွင့်မပေးပါ — ဤနေရာရှိ လုပ်ဆောင်ချက်တိုင်းသည် အခမဲ့ ဖြစ်သည်။';

  @override
  String get sectionSupport => 'ပံ့ပိုးမှု';

  @override
  String get rateApp => 'အက်ပ်ကို အဆင့်သတ်မှတ်ရန်';

  @override
  String get openLicenses => 'ပွင့်လင်းအရင်းအမြစ် လိုင်စင်များ';

  @override
  String get presetAudioToMp3Title => 'အသံ ပြောင်းရန်';

  @override
  String get presetAudioToMp3Body =>
      'MP3 သို့ — မည်သည့်နေရာတွင်မဆို ဖွင့်လို့ရ';

  @override
  String get presetCompressAudioTitle => 'အသံ ချုံ့ရန်';

  @override
  String get presetCompressAudioBody =>
      'ပါးလွှာသော AAC — အသံမှတ်စု၊ ပေါ့ဒ်ကတ်စ်';

  @override
  String get convertTo => 'ပြောင်းမည့် ဖော်မတ်';

  @override
  String get formatSectionHint =>
      'သင့်ဖိုင်များ အမှန်တကယ် ဖြစ်လာနိုင်သည့် ဖော်မတ်များကိုသာ ဖော်ပြထားသည်။';

  @override
  String get sourceVideo => 'ဗီဒီယို';

  @override
  String get sourceImage => 'ဓာတ်ပုံ';

  @override
  String get sourceAudio => 'အသံ';

  @override
  String get sourceUnknown => 'ဖိုင်';

  @override
  String get mixedSelectionTitle => 'ဖိုင်အမျိုးအစား မတူညီစွာ ရွေးထားသည်';

  @override
  String get mixedSelectionBody =>
      'ဖိုင်တစ်ခုချင်းစီကို ၎င်း၏ အမျိုးအစားနှင့် အသင့်တော်ဆုံး ပရီဆက်ဖြင့် ပြောင်းပေးသည်။ အပြည့်အဝ ထိန်းချုပ်လိုပါက တစ်မျိုးချင်းစီ ထည့်ပါ။';

  @override
  String get filesTitle => 'ဖိုင်များ';

  @override
  String get removeFile => 'ဖယ်ရှားရန်';

  @override
  String timeLeft(String time) {
    return '≈ $time ကျန်သည်';
  }

  @override
  String get jobSettingsTitle => 'ပြောင်းလဲမှု ဆက်တင်များ';

  @override
  String get jobDetails => 'အသေးစိတ်';

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
  String get summaryEnhanced => 'မြှင့်တင်ပြီး';

  @override
  String get summaryMetadataStripped => 'မက်တာဒေတာ ဖယ်ရှားပြီး';

  @override
  String summaryMerge(int count) {
    return 'ပေါင်းစပ်ပြီးသော ကလစ်များ: $count';
  }

  @override
  String get shareApp => 'အက်ပ်ကို မျှဝေရန်';

  @override
  String get shareAppText =>
      'Eluna Media — အခမဲ့၊ လုံးဝ အော့ဖ်လိုင်း ဓာတ်ပုံ၊ ဗီဒီယိုနှင့် အသံ ပြောင်းလဲပေးသည့် အက်ပ်။ စာရင်းသွင်းခ မရှိ၊ ရေစာ မရှိ၊ အကောင့် မရှိ။';

  @override
  String appVersionLabel(String version) {
    return 'ဗားရှင်း $version';
  }

  @override
  String get openFile => 'ဖွင့်ရန်';

  @override
  String get openFolder => 'ဖိုင်တွဲ ပြရန်';

  @override
  String get noAppToOpen =>
      'ဤစက်ပေါ်တွင် ထိုဖိုင်ကို ဖွင့်နိုင်သည့် အက်ပ် မရှိပါ။';

  @override
  String get openFailed => 'ဖိုင်ကို မဖွင့်နိုင်ပါ။';

  @override
  String get twoPassLabel => 'အရွယ်အစား တိကျရန် နှစ်ကြိမ် အင်ကုဒ်';

  @override
  String get twoPassHint =>
      'အရွယ်ကိုက်ညီအောင် အလုပ်များသည် နှစ်ကြိမ် အင်ကုဒ်လုပ်ပြီး ဘိုက် ကန့်သတ်ချက်ကို သိသိသာသာ ပိုတိကျစွာ ရောက်အောင် လုပ်သည် — အချိန်နှင့် ဘက်ထရီ နှစ်ဆခန့် ကုန်သည်။';

  @override
  String get whatsNewTitle => 'အသစ်များ';

  @override
  String get whatsNew1 =>
      'ဗီဒီယိုကို ယခု AV1 ဖြင့် လုပ်နိုင်ပြီ — ဖိုင် သိသိသာသာ သေးသည်၊ စောင့်နိုင်လျှင်။';

  @override
  String get whatsNew2 =>
      'ပုံများအတွက် အသစ် — JPEG ၏ တစ်ဝက်ခန့်သာ ရှိသော AVIF နှင့် GIF အစား လှုပ်ရှား WebP။';

  @override
  String get whatsNew3 =>
      'M4A ကို ဆုံးရှုံးမှုမဲ့ လုပ်နိုင်ပြီ — ALAC သည် ယခု AAC ဘေးတွင် ရှိနေပြီ။';

  @override
  String get whatsNew4 =>
      'အသွင်အပြင်အတွက် စခရင်တစ်ခုတည်း — အလင်းအမှောင်၊ အသားပေးအရောင်၊ အနက်ရင့် OLED နှင့် Material You။';

  @override
  String get whatsNew5 =>
      'အောင်မြင်မှုများတွင် ဆုတံဆိပ်များ၊ တက်ဘ်သုံးခုနှင့် ပုံအဖြစ် မျှဝေနိုင်သော တိုးတက်မှု ပါဝင်သည်။';

  @override
  String get achievementsTitle => 'အောင်မြင်မှုများ';

  @override
  String achievementsProgress(int done, int total) {
    return '$total အနက် $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'ဤစက်ပေါ်တွင်သာ ရေတွက်သည်။ မည်သည့်နေရာသို့မျှ တင်ပို့ခြင်း မရှိပါ။';

  @override
  String get achFirstConversionTitle => 'ပထမဆုံး ခြေလှမ်း';

  @override
  String get achFirstConversionBody => 'ပထမဆုံး ဖိုင်ကို ပြောင်းပါ။';

  @override
  String get achTenConversionsTitle => 'အရှိန်ရလာပြီ';

  @override
  String get achTenConversionsBody => 'ဖိုင် 10 ခု ပြောင်းပါ။';

  @override
  String get achFiftyConversionsTitle => 'ပုံမှန် သုံးစွဲသူ';

  @override
  String get achFiftyConversionsBody => 'ဖိုင် 50 ခု ပြောင်းပါ။';

  @override
  String get achTwoHundredConversionsTitle => 'အားကိုးရသူ';

  @override
  String get achTwoHundredConversionsBody => 'ဖိုင် 200 ခု ပြောင်းပါ။';

  @override
  String get achThousandConversionsTitle => 'ဆက်တိုက် လိုင်း';

  @override
  String get achThousandConversionsBody => 'ဖိုင် 1000 ခု ပြောင်းပါ။';

  @override
  String get achSaved100MbTitle => 'နေရာ ချွေတာသူ';

  @override
  String get achSaved100MbBody => 'စုစုပေါင်း 100 MB လွတ်အောင် လုပ်ပါ။';

  @override
  String get achSaved1GbTitle => 'ဂစ်ဂါဘိုက် အလိုက်';

  @override
  String get achSaved1GbBody => 'စုစုပေါင်း 1 GB လွတ်အောင် လုပ်ပါ။';

  @override
  String get achSaved10GbTitle => 'သိုလှောင်မှု သူရဲကောင်း';

  @override
  String get achSaved10GbBody => 'စုစုပေါင်း 10 GB လွတ်အောင် လုပ်ပါ။';

  @override
  String get achBatchOfFiveTitle => 'အသုတ်လိုက် လုပ်သား';

  @override
  String get achBatchOfFiveBody =>
      'ဖိုင် 5 ခု သို့မဟုတ် ထို့ထက်ပိုသော အသုတ်တစ်ခုကို ပြီးအောင် လုပ်ပါ။';

  @override
  String get achBatchOfTwentyTitle => 'တပ်ဆင်လိုင်း';

  @override
  String get achBatchOfTwentyBody =>
      'ဖိုင် 20 ခု သို့မဟုတ် ထို့ထက်ပိုသော အသုတ်တစ်ခုကို ပြီးအောင် လုပ်ပါ။';

  @override
  String get achSniperTitle => 'ပစ်ကွင်းမှန်သူ';

  @override
  String get achSniperBody =>
      'အရွယ်ကိုက်ညီအောင် မုဒ်ဖြင့် တိကျသော အရွယ်အစားကို ရအောင် လုပ်ပါ။';

  @override
  String get achMemeSmithTitle => 'မီးမ်း ပန်းပဲ';

  @override
  String get achMemeSmithBody => 'ဗီဒီယိုတစ်ခုကို GIF အဖြစ် ပြောင်းပါ။';

  @override
  String get achSoundHunterTitle => 'အသံ မုဆိုး';

  @override
  String get achSoundHunterBody => 'ဗီဒီယိုမှ အသံကို ထုတ်ယူပါ။';

  @override
  String get achSubtitleKeeperTitle => 'စာတန်းထိုး ထိန်းသိမ်းသူ';

  @override
  String get achSubtitleKeeperBody =>
      'စာတန်းထိုးများ ပါအောင် ဗီဒီယိုတစ်ခု ပြောင်းပါ။';

  @override
  String get achDirectorTitle => 'ဒါရိုက်တာ';

  @override
  String get achDirectorBody =>
      'အသွင်ပြောင်းမှု တစ်ခု အသုံးပြုပါ — လှည့်ခြင်း၊ ဖြတ်ညှပ်ခြင်း၊ အမြန်နှုန်း သို့မဟုတ် အသံအတိုးအကျယ်။';

  @override
  String get achAllRounderTitle => 'အစုံလုပ်နိုင်သူ';

  @override
  String get achAllRounderBody => 'ဗီဒီယို၊ အသံနှင့် ပုံတစ်ပုံ ပြောင်းပါ။';

  @override
  String get achNightOwlTitle => 'ညဇီးကွက်';

  @override
  String get achNightOwlBody =>
      'သန်းခေါင်နှင့် နံနက် 5 နာရီ ကြားတွင် ပြောင်းလဲမှုတစ်ခု ပြီးအောင် လုပ်ပါ။';

  @override
  String get achPlatinumTitle => 'ပလက်တီနမ်';

  @override
  String get achPlatinumBody => 'အခြား အောင်မြင်မှု အားလုံးကို ရယူပါ။';

  @override
  String get storageTitle => 'သိုလှောင်မှု';

  @override
  String get storageBody =>
      'ပြောင်းပြီးသော ဖိုင်များသည် သင် သိမ်းဆည်းသည် သို့မဟုတ် မျှဝေသည်အထိ အက်ပ်အတွင်း၌ ရှိနေပြီး မည်သည့် ဖိုင်မန်နေဂျာမျှ မရောက်နိုင်ပါ။';

  @override
  String get storageEmpty => 'သိုလှောင်ထားသည် မရှိပါ';

  @override
  String storageUsage(String size) {
    return 'သိုလှောင်ထားမှု: $size';
  }

  @override
  String get storageClearTitle => 'သိုလှောင်ထားသော ဖိုင်များကို ရှင်းမလား';

  @override
  String get storageClearBody =>
      'အက်ပ်တွင် ကျန်ရှိနေသေးသော ပြီးဆုံးရလဒ် အားလုံးကို ဖျက်ပါမည်။ သိမ်းပြီး သို့မဟုတ် မျှဝေပြီးသော ဖိုင်များကို မထိပါ။';

  @override
  String get storageClearAction => 'ရှင်းရန်';

  @override
  String storageCleared(String size) {
    return '$size လွတ်သွားပါပြီ';
  }

  @override
  String get autoSaveLabel => 'ရလဒ်များကို အလိုအလျောက် သိမ်းရန်';

  @override
  String get autoSaveHint =>
      'ပြီးဆုံးသည်နှင့် ဖိုင်တစ်ခုချင်းစီကို ပြခန်းထဲ — အသံဖိုင်ကို Downloads ထဲ — ချက်ချင်း ထည့်ပေးသည်။';

  @override
  String get lowSpaceTitle => 'နေရာ သိပ်မကျန်တော့ပါ';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ဤအသုတ်အတွက် $needed ခန့် လိုအပ်ပြီး $free သာ လွတ်နေသည်။ ပြောင်းလဲမှု အလယ်တွင် ရပ်သွားနိုင်သည်။';
  }

  @override
  String saveAll(int count) {
    return 'အားလုံး သိမ်းရန် ($count)';
  }

  @override
  String savedAll(int count) {
    return 'သိမ်းပြီး: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total အနက် $saved ခု သိမ်းပြီး';
  }

  @override
  String get presetFitPhotoTitle => 'ဓာတ်ပုံကို အရွယ်ကိုက်ညီအောင်';

  @override
  String get presetFitPhotoBody =>
      'ပုံတစ်ပုံကို တိကျသော ကန့်သတ်ချက်အောက် ရောက်အောင် ချုံ့ပါ — အပ်လုဒ် ဖောင်များ၊ လျှောက်လွှာများ။';

  @override
  String get photoFitHint =>
      'အက်ပ်သည် ကိုက်ညီသည့် အရည်အသွေး ရသည်အထိ တစ်ဆင့်ချင်း စမ်းသပ်သည်။ ပုံအတွက် ကန့်သတ်ချက် သေးလွန်းပါက ဖရိမ် အရွယ်အစားကိုပါ လျှော့ချသည်။';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'ရည်မှန်း အရွယ်အစား (KB)';

  @override
  String get compareAction => 'နှိုင်းယှဉ်ရန်';

  @override
  String get compareBefore => 'မတိုင်မီ';

  @override
  String get compareAfter => 'ပြီးနောက်';

  @override
  String get compareHint => 'မူရင်းကို ကြည့်ရန် ဖိထားပါ။';

  @override
  String get trimStart => 'အစ';

  @override
  String get trimEnd => 'အဆုံး';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss၊ $duration အထိ';
  }

  @override
  String get imageScaleLabel => 'အရွယ်ချိန်';

  @override
  String get audioChannelsLabel => 'ချန်နယ်များ';

  @override
  String get audioMono => 'မိုနို';

  @override
  String get audioStereo => 'စတီရီယို';

  @override
  String get sampleRateLabel => 'နမူနာနှုန်း';

  @override
  String get voiceAudioHint =>
      '22.05 kHz တွင် မိုနိုသည် အသံသွင်းချက်တစ်ခုကို နားဖြင့် သိသာမှု မရှိဘဲ လေးပုံတစ်ပုံခန့်အထိ လျှော့ချပေးသည်။ ဂီတအတွက် နှစ်ခုစလုံးကို မူရင်းအတိုင်း ထားပါ။';

  @override
  String get moveUp => 'အပေါ်တင်ရန်';

  @override
  String get moveDown => 'အောက်ချရန်';

  @override
  String get renameOutput => 'ရလဒ်ကို အမည်ပြောင်းရန်';

  @override
  String get renameOutputHint => 'အမည်သစ်';

  @override
  String get renameOutputHelp =>
      'ဖိုင်အဆုံးသတ်သည် အထွက် ဖော်မတ်မှ လာသည်။ ရလဒ်ကို မူရင်းဖိုင်၏ အမည်အတိုင်း ပေးလိုပါက ဗလာထားပါ။';

  @override
  String deleteOriginalsAction(int count) {
    return 'မူရင်းများ ဖျက်ရန် ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'ပြောင်းပြီးနောက် မူရင်းများ ဖျက်ရန်';

  @override
  String get deleteOriginalsHint =>
      'ရလဒ်ကို သိမ်းပြီးသည်နှင့် မူရင်းဖိုင်များကို ဖယ်ရှားပေးရန် စနစ်ကို တောင်းဆိုသည်။ စနစ်က မည်သည့်ဖိုင်များ ပျောက်မည်ကို အမြဲပြပြီး သင့်အတည်ပြုချက်ကို စောင့်သည်။';

  @override
  String get mediaAccessRequired =>
      'မူရင်းဖိုင်များ ဖျက်ရန် မီဒီယာစာကြည့်တိုက်သို့ ဝင်ရောက်ခွင့် လိုအပ်သည်။';

  @override
  String originalsDeleted(String size) {
    return 'မူရင်းများ ဖျက်ပြီး — $size လွတ်သွားသည်';
  }

  @override
  String get originalsNoneDeleted =>
      'မည်သည့်အရာမျှ မဖျက်ခဲ့ပါ။ ပြခန်းတွင် မူရင်းအမည်ဖြင့် ကျန်နေသေးသော ဖိုင်များကိုသာ ရှာတွေ့နိုင်သည်။';

  @override
  String reclaimedTotal(String size) {
    return 'ဤအက်ပ်ဖြင့် လွတ်သွားသည်: $size';
  }

  @override
  String get deleteAllData => 'ဒေတာအားလုံး ဖျက်ရန်';

  @override
  String get deleteAllDataHint =>
      'အက်ပ်က ဤစက်ပေါ်တွင် သိမ်းထားသမျှ အားလုံးကို ဖျက်သည် — စီတန်း၊ ပြောင်းပြီးဖိုင်များ၊ အစမ်းကြည့်ပုံများ၊ အောင်မြင်မှုများနှင့် ဆက်တင်များ။ ပြခန်းသို့ သိမ်းပြီးသော ဖိုင်များကို မထိပါ။';

  @override
  String get codecCopy => 'ကူးယူရန်';

  @override
  String get codecCopyRemux => 'ကူးယူရန် (remux)';

  @override
  String get codecNoVideo => 'ဗီဒီယို မပါ';

  @override
  String get codecNoAudio => 'အသံ မပါ';

  @override
  String codecLossless(String codec) {
    return '$codec (ဆုံးရှုံးမှုမဲ့)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (လှုပ်ရှား)';
  }

  @override
  String get sizeTargetEmail => 'အီးမေးလ်';

  @override
  String get trimTimeHint => 'm:ss';
}
