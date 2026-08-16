// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class L10nBn extends L10n {
  L10nBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'রূপান্তর';

  @override
  String get tabQueue => 'সারি';

  @override
  String get addFiles => 'ফাইল যোগ করুন';

  @override
  String get emptySelectionTitle => 'এখনও কোনও ফাইল নেই';

  @override
  String get emptySelectionBody =>
      'ছবি, ভিডিও বা অডিও যোগ করুন। সবকিছু এই ডিভাইসেই প্রক্রিয়া করা হয়।';

  @override
  String get sectionOutput => 'আউটপুট';

  @override
  String get sectionVideo => 'ভিডিও';

  @override
  String get sectionAudio => 'অডিও';

  @override
  String get sectionImage => 'ছবি';

  @override
  String get sectionPrivacy => 'গোপনীয়তা';

  @override
  String get outputFormat => 'ফরম্যাট';

  @override
  String get videoCodec => 'ভিডিও কোডেক';

  @override
  String get audioCodec => 'অডিও কোডেক';

  @override
  String get rateControl => 'রেট নিয়ন্ত্রণ';

  @override
  String get rateControlQuality => 'ধ্রুব মান (CRF)';

  @override
  String get rateControlBitrate => 'লক্ষ্য বিটরেট';

  @override
  String crfLabel(int value) {
    return 'মান (CRF $value)';
  }

  @override
  String get crfHint => 'সংখ্যা যত কম, মান তত ভালো এবং ফাইল তত বড়।';

  @override
  String videoBitrate(int value) {
    return 'ভিডিও বিটরেট: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'অডিও বিটরেট: $value kbps';
  }

  @override
  String get encodingPreset => 'এনকোডার প্রিসেট';

  @override
  String get encodingPresetHint =>
      'ধীর প্রিসেট ভালো সংকোচন দেয়, তবে ডিভাইস বেশি গরম করে।';

  @override
  String get presetOriginal => 'মূল';

  @override
  String get resolution => 'রেজোলিউশন';

  @override
  String get frameRate => 'ফ্রেম রেট';

  @override
  String imageQuality(int value) {
    return 'মান: $value';
  }

  @override
  String get lossless => 'ক্ষতিহীন';

  @override
  String get losslessHint => 'বড় ফাইল, পিক্সেল-নিখুঁত ফল।';

  @override
  String get sectionEnhance => 'উন্নতি';

  @override
  String get sharpenLabel => 'তীক্ষ্ণতা';

  @override
  String get sharpenHint =>
      'প্রান্তগুলোকে আরও স্পষ্ট করে। ঝাপসা বা ফোকাসের বাইরে থাকা ছবি এতে ফিরে আসে না — সেই বিশদ ফাইলেই নেই।';

  @override
  String get sharpenStrongHint =>
      'বেশি তীক্ষ্ণ করলে প্রান্ত বরাবর উজ্জ্বল আভা থেকে যেতে পারে। আগে মাঝারি দিয়ে দেখুন।';

  @override
  String get denoiseLabel => 'নয়েজ কমানো';

  @override
  String get denoiseHint =>
      'অন্ধকার ও রাতের ছবির দানা পরিষ্কার করে। বেশি হলে সূক্ষ্ম বিশদও মুছে যায়।';

  @override
  String get autoColorLabel => 'স্বয়ংক্রিয় রং ও লেভেল';

  @override
  String get autoColorHint =>
      'কনট্রাস্ট বাড়ায় এবং ফ্যাকাশে রং কিছুটা উজ্জ্বল করে।';

  @override
  String get upscaleLabel => 'আপস্কেল 2×';

  @override
  String get upscaleHint =>
      'প্রস্থ ও উচ্চতা দ্বিগুণ করে। এতে নতুন বিশদ যোগ হয় না — ছাপা বা ক্রপ করার সময় কাজে লাগে।';

  @override
  String get upscaleConflictHint =>
      'আপস্কেল করতে রেজোলিউশন আবার ‘মূল’-এ রাখুন।';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'বন্ধ';

  @override
  String get enhanceLight => 'হালকা';

  @override
  String get enhanceMedium => 'মাঝারি';

  @override
  String get enhanceStrong => 'জোরালো';

  @override
  String get stripMetadata => 'মেটাডেটা সরান';

  @override
  String get stripMetadataHint =>
      'আউটপুট থেকে EXIF, GPS ও সময়ের ছাপ সরিয়ে দেয়।';

  @override
  String startConversion(int count) {
    return 'ফাইল রূপান্তর করুন ($count)';
  }

  @override
  String get batchResumed => 'থেমে যাওয়া রূপান্তর আবার শুরু হয়েছে।';

  @override
  String get converting => 'রূপান্তর হচ্ছে…';

  @override
  String get cancelBatch => 'থামান';

  @override
  String get cancelJob => 'বাতিল';

  @override
  String get clearFinished => 'সম্পন্নগুলো মুছুন';

  @override
  String get removeJob => 'সরান';

  @override
  String get shareFile => 'শেয়ার';

  @override
  String get retryJob => 'আবার চেষ্টা';

  @override
  String get queueEmptyTitle => 'সারি খালি';

  @override
  String get queueEmptyBody =>
      '‘রূপান্তর’ ট্যাবে যোগ করা ফাইল এখানে দেখা যায়।';

  @override
  String queueActiveTab(int count) {
    return 'সক্রিয় · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'সম্পন্ন · $count';
  }

  @override
  String get queueNoActiveTitle => 'কিছুই চলছে না';

  @override
  String get queueNoActiveBody =>
      'অপেক্ষমাণ বা রূপান্তর হতে থাকা ফাইল এখানে দেখা যায়।';

  @override
  String get queueNoFinishedTitle => 'এখনও কিছু সম্পন্ন হয়নি';

  @override
  String get queueNoFinishedBody =>
      'রূপান্তরিত ফাইল এখানে আসে — খোলা, সংরক্ষণ বা শেয়ার করার জন্য প্রস্তুত।';

  @override
  String get statusQueued => 'সারিতে';

  @override
  String get statusRunning => 'রূপান্তর হচ্ছে';

  @override
  String get statusCompleted => 'সম্পন্ন';

  @override
  String get statusFailed => 'ব্যর্থ';

  @override
  String get statusCancelled => 'বাতিল';

  @override
  String batchSummary(int done, int total) {
    return '$totalটির মধ্যে $doneটি সম্পন্ন';
  }

  @override
  String batchCompleted(int done) {
    return 'রূপান্তরিত ফাইল: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$doneটি রূপান্তরিত, $failedটি ব্যর্থ।';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% ছোট';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% বড়';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'চেহারা';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSystem => 'সিস্টেম';

  @override
  String get privacyTitle => 'গোপনীয়তা';

  @override
  String get privacyBody =>
      'Eluna Media সঙ্গে থাকা FFmpeg দিয়ে আপনার ফাইল সম্পূর্ণভাবে এই ডিভাইসেই রূপান্তর করে। আপনার ফাইল কখনও ডিভাইস ছেড়ে যায় না, কোনও অ্যাকাউন্ট লাগে না, আর কোনও টেলিমেট্রি নেই। অ্যাপের কোনও অংশই নেটওয়ার্ক ব্যবহার করে না — এর ইন্টারনেট অনুমতিটুকুও নেই।\n\nমেটাডেটা সরানো ডিফল্টে চালু, তাই আপনি যে ফাইলগুলো রপ্তানি করেন সেগুলো থেকে EXIF, GPS স্থানাঙ্ক ও সময়ের ছাপ বাদ পড়ে।';

  @override
  String get licenseTitle => 'লাইসেন্স';

  @override
  String get licenseBody =>
      'এই অ্যাপে x264, x265 ও অন্যান্য GPL উপাদান দিয়ে তৈরি FFmpeg যুক্ত আছে, তাই সম্পূর্ণ অ্যাপ্লিকেশনটি GNU GPL v3-এর অধীনে বিতরণ করা হয়।';

  @override
  String get sourceMissing => 'উৎস ফাইলটি আর নেই।';

  @override
  String get tabSettings => 'সেটিংস';

  @override
  String get introTitle => 'গোড়া থেকেই ব্যক্তিগত';

  @override
  String get introOfflineTitle => 'এই ডিভাইসেই রূপান্তর';

  @override
  String get introOfflineBody =>
      'সব কাজ করে সঙ্গে থাকা FFmpeg। আপনার ফাইল ফোন ছেড়ে যায় না — বিমান মোডেও রূপান্তর চলে।';

  @override
  String get introTelemetryTitle => 'কোনও টেলিমেট্রি নেই';

  @override
  String get introTelemetryBody =>
      'কোনও অ্যাকাউন্ট নেই, অ্যানালিটিক্স নেই, ক্র্যাশ রিপোর্টিং নেই। অ্যাপ জানেই না আপনি কে।';

  @override
  String get introMetadataTitle => 'মেটাডেটা আপনার নিয়ন্ত্রণে';

  @override
  String get introMetadataBody =>
      'প্রতিটি আউটপুট থেকে EXIF, GPS ও সময়ের ছাপ ডিফল্টে বাদ দেওয়া হয়। চাইলে তা বন্ধ করতে পারেন।';

  @override
  String get introFreeNote =>
      'বিনামূল্যে, বিজ্ঞাপন নেই, সাবস্ক্রিপশন নেই। ব্যাচ রূপান্তর সহ প্রতিটি সুবিধা শুরু থেকেই আপনার — কেনা যায় কেবল একটি টিপ, আর তাতে নতুন কিছুই খোলে না।';

  @override
  String get introContinue => 'শুরু করুন';

  @override
  String get modeSimple => 'সরল';

  @override
  String get modeAdvanced => 'উন্নত';

  @override
  String get modeAdvancedHint =>
      'প্রিসেট কার্ডের বদলে প্রতিটি কোডেক, বিটরেট ও রূপ বদলের নিয়ন্ত্রণ দেখায়।';

  @override
  String get presetCompressVideoTitle => 'ভিডিও সংকুচিত করুন';

  @override
  String get presetCompressVideoBody => 'অনেক ছোট MP4, মান ভালোই থাকে';

  @override
  String get presetFitToSizeTitle => 'মাপে আঁটান';

  @override
  String get presetFitToSizeBody =>
      'নির্দিষ্ট সীমার মধ্যে — Discord, ইমেল, চ্যাট';

  @override
  String get presetCompatibleMp4Title => 'সর্বত্র চলে এমন MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC। সব জায়গায় চলে';

  @override
  String get presetExtractAudioTitle => 'অডিও বের করুন';

  @override
  String get presetExtractAudioBody => 'যেকোনও ভিডিও থেকে MP3';

  @override
  String get presetVideoToGifTitle => 'ভিডিও থেকে GIF';

  @override
  String get presetVideoToGifBody => 'ছোট ক্লিপ থেকে চলমান GIF';

  @override
  String get presetMergeTitle => 'ভিডিও জোড়া লাগান';

  @override
  String get presetMergeBody => 'ক্লিপগুলো ক্রম অনুসারে একটি MP4-তে জুড়ুন';

  @override
  String get mergeNeedsTwo => 'জোড়া লাগাতে অন্তত দুটি ভিডিও বেছে নিন।';

  @override
  String mergedVideoName(int count) {
    return 'জোড়া ভিডিও ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ছবি সংকুচিত করুন';

  @override
  String get presetCompressImageBody => 'ছোট JPEG, ক্ষতি প্রায় চোখে পড়ে না';

  @override
  String get presetEnhancePhotoTitle => 'ছবি উন্নত করুন';

  @override
  String get presetEnhancePhotoBody => 'পরিষ্কার, স্পষ্ট, রং আরও ভালো';

  @override
  String get presetImageToWebpTitle => 'ছবি থেকে WebP';

  @override
  String get presetImageToWebpBody => 'আধুনিক ফরম্যাট, JPEG-এর চেয়ে ছোট';

  @override
  String get sizeTargetTitle => 'লক্ষ্য আকার';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'নিজের মতো…';

  @override
  String get sizeTargetDialogTitle => 'লক্ষ্য আকার MB-তে';

  @override
  String get sizeTargetTooSmall =>
      'এই দৈর্ঘ্যের জন্য লক্ষ্যটি খুব ছোট; সম্ভাব্য সবচেয়ে কাছাকাছি মান ব্যবহার করা হবে।';

  @override
  String estimatePerFile(String size) {
    return '≈ $size প্রতি ফাইল';
  }

  @override
  String estimateTotal(String size) {
    return 'আনুমানিক আউটপুট: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'নির্বাচিত ফাইল: $count';
  }

  @override
  String get promiseOffline => '100% অফলাইন রূপান্তর';

  @override
  String get promiseBatchFree => 'ব্যাচ বিনামূল্যে';

  @override
  String get promiseNoWatermark => 'কোনও ওয়াটারমার্ক নেই';

  @override
  String get sectionTransform => 'রূপ বদল';

  @override
  String get rotateLabel => 'ঘোরান';

  @override
  String get flipLabel => 'আনুভূমিকভাবে আয়না';

  @override
  String get speedLabel => 'গতি';

  @override
  String get cropLabel => 'ক্রপ';

  @override
  String get cropHint =>
      'বেছে নেওয়া অনুপাতে মাঝ বরাবর ক্রপ — ফিডের জন্য বর্গ, স্টোরির জন্য 9:16।';

  @override
  String volumeLabel(int percent) {
    return 'শব্দ: $percent%';
  }

  @override
  String get addAudioFiles => 'অডিও ও অন্যান্য ফাইল';

  @override
  String get hwEncoderLabel => 'হার্ডওয়্যার এনকোডিং';

  @override
  String get hwEncoderHint =>
      'বিটরেট ও মাপে-আঁটানো মোডে ডিভাইসের ভিডিও চিপ ব্যবহার করে — অনেক দ্রুত ও কম গরম। মান (CRF) মোড সবসময় নিখুঁত সফটওয়্যার এনকোডার ব্যবহার করে, আর হার্ডওয়্যারে ব্যর্থ কাজ নিজে থেকেই সফটওয়্যারে আবার চলে।';

  @override
  String get transformNeedsReencode =>
      'ঘোরানো, আয়না ও গতির জন্য নতুন করে এনকোড করা লাগে, তাই স্ট্রিম কপির সময় এগুলো বন্ধ থাকে।';

  @override
  String get capBitrateLabel => 'ফাইল কখনও বড় করবেন না';

  @override
  String get capBitrateHint =>
      'উৎসের নিজস্ব বিটরেটেই এনকোডিং সীমাবদ্ধ রাখে। ধ্রুব মানের নিজের কোনও ঊর্ধ্বসীমা নেই, তাই আগে থেকেই সংকুচিত ভিডিও না হলে বড় হয়ে বেরোতে পারে।';

  @override
  String get keepSubtitles => 'সাবটাইটেল রাখুন';

  @override
  String get keepSubtitlesHint =>
      'সাবটাইটেল ট্র্যাক আউটপুটে নিয়ে যায়। কেবল লেখা সাবটাইটেল।';

  @override
  String get sectionTrim => 'ছাঁটাই';

  @override
  String get trimEnable => 'উৎস ছেঁটে নিন';

  @override
  String get trimHint =>
      'সারিতে জানা দৈর্ঘ্যের ঠিক একটি ফাইল থাকলে পাওয়া যায়।';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'লক্ষ্য আকার';

  @override
  String get lowBatteryTitle => 'ব্যাটারি কম';

  @override
  String get lowBatteryBody =>
      'রূপান্তরে প্রসেসরের উপর বেশ চাপ পড়ে। আগে চার্জে দিতে পারেন, বা এভাবেই চালিয়ে যেতে পারেন।';

  @override
  String get lowBatteryContinue => 'তবুও রূপান্তর করুন';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonOk => 'ঠিক আছে';

  @override
  String filesReceived(int count) {
    return 'প্রাপ্ত ফাইল: $count';
  }

  @override
  String get saveFile => 'সংরক্ষণ';

  @override
  String get savedToGallery =>
      'গ্যালারিতে ‘Eluna Media’ অ্যালবামে সংরক্ষিত হয়েছে।';

  @override
  String get savedToDownloads => 'Downloads-এ সংরক্ষিত হয়েছে।';

  @override
  String get saveFailed => 'ফাইলটি সংরক্ষণ করা যায়নি।';

  @override
  String get jobRemovedUndo => 'কাজটি সরানো হয়েছে।';

  @override
  String get finishedClearedUndo => 'সম্পন্ন কাজগুলো মুছে ফেলা হয়েছে।';

  @override
  String get undo => 'ফিরিয়ে আনুন';

  @override
  String get errorDetailsTitle => 'ত্রুটির বিবরণ';

  @override
  String get sectionConversionPrefs => 'রূপান্তর';

  @override
  String get powerModeLabel => 'পাওয়ার মোড';

  @override
  String get powerEfficiency => 'ঠান্ডা ও দ্রুত';

  @override
  String get powerBalanced => 'ভারসাম্যপূর্ণ';

  @override
  String get powerQuality => 'সর্বোচ্চ সংকোচন';

  @override
  String get powerModeHint =>
      'ভিডিও এনকোডার কতটা খাটবে। ঠান্ডা ও দ্রুত মানে ফাইল কিছুটা বড়। এর বাইরে আর কিছুই সীমিত করা হয় না — কখনও না।';

  @override
  String get hapticsLabel => 'কম্পন প্রতিক্রিয়া';

  @override
  String get networkPrivacyTitle => 'নেটওয়ার্ক ও গোপনীয়তা';

  @override
  String get netAuditIntro =>
      'এই অ্যাপের যা কিছু নেটওয়ার্ক ছুঁতে পারে, তার পূর্ণ তালিকা।';

  @override
  String get netAuditNoneTitle => 'নেটওয়ার্কে কোনও প্রবেশাধিকার নেই';

  @override
  String get netAuditNoneBody =>
      'অ্যাপটি ইন্টারনেট অনুমতিই চায় না, তাই চাইলেও নেটওয়ার্কে পৌঁছাতে পারে না — সিস্টেমের অ্যাপ তথ্যে আপনি তা যাচাই করতে পারেন। বিজ্ঞাপন নেই, অ্যানালিটিক্স নেই, আপডেট পরীক্ষা নেই। ‘অ্যাপ রেট করুন’ কাজটি স্টোর অ্যাপের হাতে তুলে দেয়, যা নিজের কথা নিজেই বলে।';

  @override
  String get netAuditConversionTitle => 'রূপান্তর';

  @override
  String get netAuditConversionBody =>
      'সবটাই এই ডিভাইসে, সঙ্গে থাকা FFmpeg দিয়ে চলে। বিমান মোড চালু করে রূপান্তর করে দেখুন — কাজ করে।';

  @override
  String get netAuditTelemetryTitle => 'টেলিমেট্রি';

  @override
  String get netAuditTelemetryBody =>
      'কিছুই নেই। অ্যাপ কোনও অ্যানালিটিক্স, ক্র্যাশ রিপোর্ট বা শনাক্তকারী সংগ্রহ করে না, আর এর কোনও অ্যাকাউন্ট ব্যবস্থা নেই।';

  @override
  String get netAuditTipsTitle => 'টিপ';

  @override
  String get netAuditTipsBody =>
      'টিপের লেনদেন করে Play Store অ্যাপ, এই অ্যাপ নয় — যার এখনও ইন্টারনেট অনুমতি নেই। বিলিং অবশ্য অনুমতির তালিকায় দুটি লাইন যোগ করে: ‘অ্যাপের ভেতরে কেনাকাটা’ এবং ‘নেটওয়ার্ক সংযোগ দেখা’, যার দ্বিতীয়টি কেবল সংযোগ আছে কি না তা পড়ে, ব্যবহার করতে পারে না। কিছুই কখনও নিজে থেকে কেনা হয় না, আর টিপে নতুন কিছু খোলে না: এখানে প্রতিটি সুবিধাই বিনামূল্যে।';

  @override
  String get sectionSupport => 'সহায়তা';

  @override
  String get rateApp => 'অ্যাপ রেট করুন';

  @override
  String get openLicenses => 'ওপেন সোর্স লাইসেন্স';

  @override
  String get presetAudioToMp3Title => 'অডিও রূপান্তর';

  @override
  String get presetAudioToMp3Body => 'MP3-তে — সব জায়গায় চলে';

  @override
  String get presetCompressAudioTitle => 'অডিও সংকুচিত করুন';

  @override
  String get presetCompressAudioBody => 'হালকা AAC — ভয়েস নোট, পডকাস্ট';

  @override
  String get convertTo => 'যাতে রূপান্তর';

  @override
  String get formatSectionHint =>
      'আপনার ফাইল আসলে যেসব ফরম্যাটে হতে পারে, কেবল সেগুলোই দেখানো হয়।';

  @override
  String get sourceVideo => 'ভিডিও';

  @override
  String get sourceImage => 'ছবি';

  @override
  String get sourceAudio => 'অডিও';

  @override
  String get sourceUnknown => 'ফাইল';

  @override
  String get mixedSelectionTitle => 'বিভিন্ন ধরনের ফাইল নির্বাচিত';

  @override
  String get mixedSelectionBody =>
      'প্রতিটি ফাইল তার নিজের ধরনের সেরা প্রিসেট দিয়ে রূপান্তরিত হয়। পূর্ণ নিয়ন্ত্রণের জন্য একবারে এক ধরনের ফাইল যোগ করুন।';

  @override
  String get filesTitle => 'ফাইল';

  @override
  String get removeFile => 'সরান';

  @override
  String timeLeft(String time) {
    return '≈ $time বাকি';
  }

  @override
  String get jobSettingsTitle => 'রূপান্তরের সেটিংস';

  @override
  String get jobDetails => 'বিবরণ';

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
  String get summaryEnhanced => 'উন্নত করা';

  @override
  String get summaryMetadataStripped => 'মেটাডেটা সরানো';

  @override
  String summaryMerge(int count) {
    return 'জোড়া ক্লিপ: $count';
  }

  @override
  String get shareApp => 'অ্যাপটি শেয়ার করুন';

  @override
  String get shareAppText =>
      'Eluna Media — বিনামূল্যের, সম্পূর্ণ অফলাইন ছবি, ভিডিও ও অডিও কনভার্টার। সাবস্ক্রিপশন নেই, ওয়াটারমার্ক নেই, অ্যাকাউন্ট নেই।';

  @override
  String appVersionLabel(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get openFile => 'খুলুন';

  @override
  String get openFolder => 'ফোল্ডার দেখান';

  @override
  String get noAppToOpen => 'এই ডিভাইসের কোনও অ্যাপ ফাইলটি খুলতে পারে না।';

  @override
  String get openFailed => 'ফাইলটি খোলা যায়নি।';

  @override
  String get twoPassLabel => 'সঠিক আকারের জন্য দুই ধাপ';

  @override
  String get twoPassHint =>
      'মাপে-আঁটানো কাজ দুবার এনকোড হয় এবং বাইটের বাজেট লক্ষণীয়ভাবে বেশি নিখুঁতভাবে মেলায় — প্রায় দ্বিগুণ সময় ও ব্যাটারির বিনিময়ে।';

  @override
  String get whatsNewTitle => 'নতুন কী';

  @override
  String get whatsNew1 =>
      'ভিডিও এখন AV1-এও হতে পারে: উল্লেখযোগ্যভাবে ছোট ফাইল, যদি অপেক্ষা করতে পারেন।';

  @override
  String get whatsNew2 =>
      'ছবির জন্য নতুন: AVIF, JPEG-এর প্রায় অর্ধেক, আর GIF-এর বদলে চলমান WebP।';

  @override
  String get whatsNew3 => 'M4A ক্ষতিহীনও হতে পারে — ALAC এখন AAC-এর পাশে।';

  @override
  String get whatsNew4 =>
      'চেহারার জন্য একটিই পর্দা: উজ্জ্বলতা, অ্যাকসেন্ট রং, নিখাদ কালো OLED ও Material You।';

  @override
  String get whatsNew5 =>
      'অর্জনে এখন পদক, তিনটি ট্যাব, আর অগ্রগতি যা ছবি হিসেবে শেয়ার করা যায়।';

  @override
  String get achievementsTitle => 'অর্জন';

  @override
  String achievementsProgress(int done, int total) {
    return '$totalটির মধ্যে $doneটি';
  }

  @override
  String get achievementsPrivacyNote =>
      'কেবল এই ডিভাইসেই গোনা হয়। কোথাও কিছু আপলোড হয় না।';

  @override
  String get achFirstConversionTitle => 'প্রথম পদক্ষেপ';

  @override
  String get achFirstConversionBody => 'আপনার প্রথম ফাইলটি রূপান্তর করুন।';

  @override
  String get achTenConversionsTitle => 'হাত খুলেছে';

  @override
  String get achTenConversionsBody => '10টি ফাইল রূপান্তর করুন।';

  @override
  String get achFiftyConversionsTitle => 'নিয়মিত';

  @override
  String get achFiftyConversionsBody => '50টি ফাইল রূপান্তর করুন।';

  @override
  String get achTwoHundredConversionsTitle => 'পরিশ্রমী';

  @override
  String get achTwoHundredConversionsBody => '200টি ফাইল রূপান্তর করুন।';

  @override
  String get achThousandConversionsTitle => 'কনভেয়র';

  @override
  String get achThousandConversionsBody => '1000টি ফাইল রূপান্তর করুন।';

  @override
  String get achSaved100MbTitle => 'জায়গা বাঁচানো';

  @override
  String get achSaved100MbBody => 'মোট 100 MB খালি করুন।';

  @override
  String get achSaved1GbTitle => 'গিগাবাইট শিকারি';

  @override
  String get achSaved1GbBody => 'মোট 1 GB খালি করুন।';

  @override
  String get achSaved10GbTitle => 'স্টোরেজ নায়ক';

  @override
  String get achSaved10GbBody => 'মোট 10 GB খালি করুন।';

  @override
  String get achBatchOfFiveTitle => 'ব্যাচ কর্মী';

  @override
  String get achBatchOfFiveBody =>
      '5টি বা তার বেশি ফাইলের একটি ব্যাচ শেষ করুন।';

  @override
  String get achBatchOfTwentyTitle => 'অ্যাসেম্বলি লাইন';

  @override
  String get achBatchOfTwentyBody =>
      '20টি বা তার বেশি ফাইলের একটি ব্যাচ শেষ করুন।';

  @override
  String get achSniperTitle => 'নিশানাবাজ';

  @override
  String get achSniperBody =>
      'মাপে-আঁটানো দিয়ে ঠিক নির্দিষ্ট আকার ছুঁয়ে দেখান।';

  @override
  String get achMemeSmithTitle => 'মিম কারিগর';

  @override
  String get achMemeSmithBody => 'একটি ভিডিওকে GIF-এ বদলান।';

  @override
  String get achSoundHunterTitle => 'শব্দ শিকারি';

  @override
  String get achSoundHunterBody => 'একটি ভিডিও থেকে অডিও বের করুন।';

  @override
  String get achSubtitleKeeperTitle => 'সাবটাইটেল রক্ষক';

  @override
  String get achSubtitleKeeperBody =>
      'সাবটাইটেল রেখে একটি ভিডিও রূপান্তর করুন।';

  @override
  String get achDirectorTitle => 'পরিচালক';

  @override
  String get achDirectorBody =>
      'একটি রূপ বদল প্রয়োগ করুন — ঘোরানো, ক্রপ, গতি বা শব্দ।';

  @override
  String get achAllRounderTitle => 'সব্যসাচী';

  @override
  String get achAllRounderBody => 'ভিডিও, অডিও ও একটি ছবি রূপান্তর করুন।';

  @override
  String get achNightOwlTitle => 'নিশাচর';

  @override
  String get achNightOwlBody =>
      'মধ্যরাত থেকে ভোর 5টার মধ্যে একটি রূপান্তর শেষ করুন।';

  @override
  String get achPlatinumTitle => 'প্ল্যাটিনাম';

  @override
  String get achPlatinumBody => 'বাকি সব অর্জন সম্পূর্ণ করুন।';

  @override
  String get storageTitle => 'স্টোরেজ';

  @override
  String get storageBody =>
      'রূপান্তরিত ফাইল আপনি সংরক্ষণ বা শেয়ার না করা পর্যন্ত অ্যাপের ভেতরেই থাকে, যেখানে কোনও ফাইল ম্যানেজার পৌঁছাতে পারে না।';

  @override
  String get storageEmpty => 'কিছু জমা নেই';

  @override
  String storageUsage(String size) {
    return 'জমা আছে: $size';
  }

  @override
  String get storageClearTitle => 'জমা থাকা ফাইল মুছবেন?';

  @override
  String get storageClearBody =>
      'অ্যাপ এখনও ধরে রাখা প্রতিটি সম্পন্ন ফল মুছে দেয়। আপনি আগে যেগুলো সংরক্ষণ বা শেয়ার করেছেন সেগুলোতে হাত পড়ে না।';

  @override
  String get storageClearAction => 'মুছুন';

  @override
  String storageCleared(String size) {
    return '$size খালি হয়েছে';
  }

  @override
  String get autoSaveLabel => 'ফল স্বয়ংক্রিয়ভাবে সংরক্ষণ করুন';

  @override
  String get autoSaveHint =>
      'প্রতিটি সম্পন্ন ফাইল তৈরি হওয়ামাত্র গ্যালারিতে রাখে — অডিও Downloads-এ।';

  @override
  String get lowSpaceTitle => 'বেশি জায়গা বাকি নেই';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'এই ব্যাচের জন্য প্রায় $needed দরকার, খালি আছে মাত্র $free। রূপান্তর মাঝপথে থেমে যেতে পারে।';
  }

  @override
  String saveAll(int count) {
    return 'সব সংরক্ষণ করুন ($count)';
  }

  @override
  String savedAll(int count) {
    return 'সংরক্ষিত: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$totalটির মধ্যে $savedটি সংরক্ষিত';
  }

  @override
  String get presetFitPhotoTitle => 'ছবি মাপে আঁটান';

  @override
  String get presetFitPhotoBody =>
      'ছবিকে নির্দিষ্ট সীমার নিচে আনুন — আপলোড ফর্ম, আবেদনপত্র।';

  @override
  String get photoFitHint =>
      'অ্যাপ একের পর এক মান পরখ করে, যতক্ষণ না একটি মাপে আঁটে। বাজেট ছবির জন্য খুব ছোট হলে ফ্রেমের আকারও কমিয়ে দেয়।';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'লক্ষ্য আকার KB-তে';

  @override
  String get compareAction => 'তুলনা';

  @override
  String get compareBefore => 'আগে';

  @override
  String get compareAfter => 'পরে';

  @override
  String get compareHint => 'মূলটি দেখতে চেপে ধরে রাখুন।';

  @override
  String get trimStart => 'শুরু';

  @override
  String get trimEnd => 'শেষ';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration পর্যন্ত';
  }

  @override
  String get imageScaleLabel => 'মাপ';

  @override
  String get audioChannelsLabel => 'চ্যানেল';

  @override
  String get audioMono => 'মনো';

  @override
  String get audioStereo => 'স্টেরিও';

  @override
  String get sampleRateLabel => 'স্যাম্পল রেট';

  @override
  String get voiceAudioHint =>
      '22.05 kHz-এ মনো একটি কণ্ঠ রেকর্ডিংকে প্রায় এক-চতুর্থাংশে নামিয়ে আনে, শোনার মতো কোনও ক্ষতি ছাড়াই। গানের জন্য দুটোই মূল অবস্থায় রাখুন।';

  @override
  String get moveUp => 'উপরে নিন';

  @override
  String get moveDown => 'নিচে নিন';

  @override
  String get renameOutput => 'ফলের নাম বদলান';

  @override
  String get renameOutputHint => 'নতুন নাম';

  @override
  String get renameOutputHelp =>
      'এক্সটেনশন আসে আউটপুট ফরম্যাট থেকে। উৎসের নামেই ফলের নাম রাখতে ঘরটি খালি রাখুন।';

  @override
  String deleteOriginalsAction(int count) {
    return 'মূল ফাইল মুছুন ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'রূপান্তরের পর মূল ফাইল মুছুন';

  @override
  String get deleteOriginalsHint =>
      'ফল সংরক্ষিত হয়ে গেলে সিস্টেমকে উৎস ফাইলগুলো সরাতে বলে। সিস্টেম সবসময় দেখায় কী কী যাবে এবং আপনার নিশ্চিতকরণের অপেক্ষা করে।';

  @override
  String get mediaAccessRequired =>
      'মূল ফাইল মুছতে মিডিয়া লাইব্রেরিতে অ্যাক্সেস প্রয়োজন।';

  @override
  String originalsDeleted(String size) {
    return 'মূল ফাইল মোছা হয়েছে — $size খালি হয়েছে';
  }

  @override
  String get originalsNoneDeleted =>
      'কিছুই মোছা হয়নি। গ্যালারিতে যেসব ফাইল এখনও নিজের মূল নামে আছে, কেবল সেগুলোই খুঁজে পাওয়া যায়।';

  @override
  String reclaimedTotal(String size) {
    return 'এই অ্যাপ দিয়ে খালি হয়েছে: $size';
  }

  @override
  String get deleteAllData => 'সব তথ্য মুছুন';

  @override
  String get deleteAllDataHint =>
      'অ্যাপ এই ডিভাইসে যা কিছু রাখে সব মুছে দেয়: সারি, রূপান্তরিত ফাইল, প্রিভিউ, অর্জন ও সেটিংস। আপনি আগেই গ্যালারিতে সংরক্ষণ করা ফাইলগুলোতে হাত পড়ে না।';

  @override
  String get codecCopy => 'কপি';

  @override
  String get codecCopyRemux => 'কপি (রিমাক্স)';

  @override
  String get codecNoVideo => 'ভিডিও নেই';

  @override
  String get codecNoAudio => 'অডিও নেই';

  @override
  String codecLossless(String codec) {
    return '$codec (ক্ষতিহীন)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (চলমান)';
  }

  @override
  String get sizeTargetEmail => 'ইমেল';

  @override
  String get trimTimeHint => 'm:ss';
}
