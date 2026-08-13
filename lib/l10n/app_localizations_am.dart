// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class L10nAm extends L10n {
  L10nAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'ቀይር';

  @override
  String get tabQueue => 'ወረፋ';

  @override
  String get addFiles => 'ፋይሎችን አክል';

  @override
  String get emptySelectionTitle => 'እስካሁን ፋይል የለም';

  @override
  String get emptySelectionBody =>
      'ፎቶዎችን፣ ቪዲዮዎችን ወይም ድምፅን አክል። ሁሉም ነገር በዚህ መሣሪያ ላይ ይሠራል።';

  @override
  String get sectionOutput => 'ውጤት';

  @override
  String get sectionVideo => 'ቪዲዮ';

  @override
  String get sectionAudio => 'ድምፅ';

  @override
  String get sectionImage => 'ምስል';

  @override
  String get sectionPrivacy => 'ግላዊነት';

  @override
  String get outputFormat => 'ቅርጸት';

  @override
  String get videoCodec => 'የቪዲዮ ኮዴክ';

  @override
  String get audioCodec => 'የድምፅ ኮዴክ';

  @override
  String get rateControl => 'የመጠን ቁጥጥር';

  @override
  String get rateControlQuality => 'ቋሚ ጥራት (CRF)';

  @override
  String get rateControlBitrate => 'የታለመ ቢትሬት';

  @override
  String crfLabel(int value) {
    return 'ጥራት (CRF $value)';
  }

  @override
  String get crfHint => 'ዝቅተኛ ቁጥር የተሻለ ጥራትና ትልቅ ፋይል ማለት ነው።';

  @override
  String videoBitrate(int value) {
    return 'የቪዲዮ ቢትሬት፦ $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'የድምፅ ቢትሬት፦ $value kbps';
  }

  @override
  String get encodingPreset => 'የኢንኮደር ቅድመ-ቅንብር';

  @override
  String get encodingPresetHint =>
      'ቀርፋፋ ቅድመ-ቅንብሮች በተሻለ ይጨመቃሉ፤ ነገር ግን መሣሪያውን የበለጠ ያሞቁታል።';

  @override
  String get presetOriginal => 'ዋናው';

  @override
  String get resolution => 'ሬዞሉሽን';

  @override
  String get frameRate => 'የፍሬም ፍጥነት';

  @override
  String imageQuality(int value) {
    return 'ጥራት፦ $value';
  }

  @override
  String get lossless => 'ያለ ብክነት';

  @override
  String get losslessHint => 'ትልቅ ፋይሎች፤ ፒክሰል በፒክሰል ትክክለኛ ውጤት።';

  @override
  String get sectionEnhance => 'ማሻሻያ';

  @override
  String get sharpenLabel => 'ስለት';

  @override
  String get sharpenHint =>
      'ጠርዞችን ይበልጥ ግልጽ ያደርጋል። የደበዘዘ ወይም ከትኩረት የወጣ ምስልን መመለስ አይችልም — ያ ዝርዝር በፋይሉ ውስጥ የለም።';

  @override
  String get sharpenStrongHint =>
      'ጠንካራ ማስለት በጠርዞች ላይ ብሩህ ቀለበቶችን ሊተው ይችላል። መጀመሪያ መካከለኛውን ሞክር።';

  @override
  String get denoiseLabel => 'ጫጫታ መቀነስ';

  @override
  String get denoiseHint =>
      'በጨለማና በሌሊት ፎቶዎች ላይ ያለውን ሻካራነት ያጸዳል። ከመጠን በላይ ከሆነ ጥቃቅን ዝርዝሮችን ያጠፋል።';

  @override
  String get autoColorLabel => 'ራስ-ሰር ቀለምና ደረጃዎች';

  @override
  String get autoColorHint => 'ንጽጽርን ይዘረጋል፤ ጠፍጣፋ ቀለሞችንም በጥቂቱ ያነሳል።';

  @override
  String get upscaleLabel => '2× ማጉላት';

  @override
  String get upscaleHint =>
      'ወርድና ቁመትን በእጥፍ ያሳድጋል። ዝርዝር አይጨምርም — ለህትመት ወይም ለመቁረጥ ይረዳል።';

  @override
  String get upscaleConflictHint => 'ለማጉላት ሬዞሉሽኑን ወደ «ዋናው» መልስ።';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ጠፍቷል';

  @override
  String get enhanceLight => 'ቀላል';

  @override
  String get enhanceMedium => 'መካከለኛ';

  @override
  String get enhanceStrong => 'ጠንካራ';

  @override
  String get stripMetadata => 'ሜታዳታ አስወግድ';

  @override
  String get stripMetadataHint => 'EXIF፣ GPS እና የጊዜ ማህተሞችን ከውጤቱ ያስወግዳል።';

  @override
  String startConversion(int count) {
    return '$count ፋይሎችን ቀይር';
  }

  @override
  String get batchResumed => 'የተቋረጠው መቀየር ቀጥሏል።';

  @override
  String get converting => 'በመቀየር ላይ…';

  @override
  String get cancelBatch => 'አቁም';

  @override
  String get cancelJob => 'ሰርዝ';

  @override
  String get clearFinished => 'የተጠናቀቁትን አጽዳ';

  @override
  String get removeJob => 'አስወግድ';

  @override
  String get shareFile => 'አጋራ';

  @override
  String get retryJob => 'እንደገና ሞክር';

  @override
  String get queueEmptyTitle => 'ወረፋው ባዶ ነው';

  @override
  String get queueEmptyBody => 'በ«ቀይር» ትር ላይ የምትጨምራቸው ፋይሎች እዚህ ይታያሉ።';

  @override
  String queueActiveTab(int count) {
    return 'በሂደት ላይ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'የተጠናቀቁ · $count';
  }

  @override
  String get queueNoActiveTitle => 'በሂደት ላይ ምንም የለም';

  @override
  String get queueNoActiveBody => 'በመጠባበቅ ላይ ያሉ ወይም በመቀየር ላይ ያሉ ፋይሎች እዚህ ይታያሉ።';

  @override
  String get queueNoFinishedTitle => 'እስካሁን የተጠናቀቀ የለም';

  @override
  String get queueNoFinishedBody =>
      'የተቀየሩ ፋይሎች ለመክፈት፣ ለማስቀመጥ ወይም ለማጋራት ዝግጁ ሆነው እዚህ ይደርሳሉ።';

  @override
  String get statusQueued => 'በወረፋ ላይ';

  @override
  String get statusRunning => 'በመቀየር ላይ';

  @override
  String get statusCompleted => 'ተጠናቋል';

  @override
  String get statusFailed => 'አልተሳካም';

  @override
  String get statusCancelled => 'ተሰርዟል';

  @override
  String batchSummary(int done, int total) {
    return 'ከ$total ውስጥ $done ተጠናቋል';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done ፋይሎች ተቀይረዋል',
      one: '1 ፋይል ተቀይሯል',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done ተቀይሯል፣ $failed አልተሳካም።';
  }

  @override
  String savedPercent(int percent) {
    return 'በ$percent% አነሰ';
  }

  @override
  String grewPercent(int percent) {
    return 'በ$percent% ጨመረ';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'አቀራረብ';

  @override
  String get themeSystem => 'የሥርዓቱ';

  @override
  String get language => 'ቋንቋ';

  @override
  String get languageSystem => 'የሥርዓቱ';

  @override
  String get privacyTitle => 'ግላዊነት';

  @override
  String get privacyBody =>
      'Eluna Media ፋይሎችህን ሙሉ በሙሉ በዚህ መሣሪያ ላይ፣ አብሮ በተያዘ የFFmpeg ቅጂ ይቀይራል። ፋይሎችህ ከመሣሪያው በጭራሽ አይወጡም፣ መለያ አያስፈልግም፣ ቴሌሜትሪም የለም። በመተግበሪያው ውስጥ ምንም ነገር አውታረ መረቡን አይጠቀምም — የኢንተርኔት ፈቃድ እንኳ አልያዘም።\n\nሜታዳታ ማስወገድ በነባሪ የበራ ነው፤ ስለዚህ EXIF፣ የGPS መጋጠሚያዎችና የጊዜ ማህተሞች ከምታወጣቸው ፋይሎች ይወገዳሉ።';

  @override
  String get licenseTitle => 'ፈቃድ';

  @override
  String get licenseBody =>
      'ይህ መተግበሪያ በx264፣ x265 እና በሌሎች የGPL አካላት የተገነባ FFmpeg ስለያዘ፣ መተግበሪያው በአጠቃላይ በGNU GPL v3 ስር ይሰራጫል።';

  @override
  String get sourceMissing => 'የመነሻው ፋይል ከእንግዲህ አይገኝም።';

  @override
  String get tabSettings => 'ቅንብሮች';

  @override
  String get introTitle => 'በንድፉ ግላዊ';

  @override
  String get introOfflineTitle => 'በዚህ መሣሪያ ላይ ይቀይራል';

  @override
  String get introOfflineBody =>
      'አብሮ የተያዘ የFFmpeg ቅጂ ሥራውን በሙሉ ይሠራል። ፋይሎችህ ከስልኩ በጭራሽ አይወጡም — መቀየር በአውሮፕላን ሁነታም ይሠራል።';

  @override
  String get introTelemetryTitle => 'ዜሮ ቴሌሜትሪ';

  @override
  String get introTelemetryBody =>
      'መለያ የለም፣ ትንታኔ የለም፣ የብልሽት ሪፖርት የለም። መተግበሪያው ማን እንደሆንክ አያውቅም።';

  @override
  String get introMetadataTitle => 'ሜታዳታ በቁጥጥር ስር';

  @override
  String get introMetadataBody =>
      'EXIF፣ GPS እና የጊዜ ማህተሞች በነባሪ ከእያንዳንዱ ውጤት ይወገዳሉ። ይህን ማጥፋት ትችላለህ።';

  @override
  String get introFreeNote =>
      'ነጻ ነው፤ ማስታወቂያ የለም፣ ምዝገባም የለም። እያንዳንዱ ባህሪ፣ የጅምላ መቀየርን ጨምሮ፣ ከመጀመሪያው ጀምሮ ያንተ ነው — ሊገዛ የሚችለው ብቸኛው ነገር ጉርሻ ብቻ ነው፤ እሱም ምንም አይከፍትም።';

  @override
  String get introContinue => 'ጀምር';

  @override
  String get modeSimple => 'ቀላል';

  @override
  String get modeAdvanced => 'የላቀ';

  @override
  String get modeAdvancedHint =>
      'ከቅድመ-ቅንብር ካርዶች ይልቅ ሁሉንም ኮዴክ፣ ቢትሬትና የለውጥ መቆጣጠሪያዎችን አሳይ።';

  @override
  String get presetCompressVideoTitle => 'ቪዲዮ ጨምቅ';

  @override
  String get presetCompressVideoBody => 'በጣም ያነሰ MP4፤ ጥራቱ ጥሩ ሆኖ ይቆያል';

  @override
  String get presetFitToSizeTitle => 'ወደ መጠን አስማማ';

  @override
  String get presetFitToSizeBody => 'ትክክለኛ ገደብ ላይ ድረስ — Discord፣ ኢሜይል፣ ውይይቶች';

  @override
  String get presetCompatibleMp4Title => 'ተስማሚ MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC። በሁሉም ቦታ ይጫወታል';

  @override
  String get presetExtractAudioTitle => 'ድምፅ አውጣ';

  @override
  String get presetExtractAudioBody => 'ከማንኛውም ቪዲዮ MP3';

  @override
  String get presetVideoToGifTitle => 'ቪዲዮ ወደ GIF';

  @override
  String get presetVideoToGifBody => 'አጭር ቅንጫቢን ወደ እንቅስቃሴ ያለው GIF';

  @override
  String get presetMergeTitle => 'ቪዲዮዎችን አዋህድ';

  @override
  String get presetMergeBody => 'ቅንጫቢዎችን በቅደም ተከተል ወደ አንድ MP4 አገጣጥም';

  @override
  String get mergeNeedsTwo => 'ለማዋሃድ ቢያንስ ሁለት ቪዲዮዎችን ምረጥ።';

  @override
  String mergedVideoName(int count) {
    return 'የተዋሃደ ቪዲዮ ($count ቅንጫቢዎች).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ፎቶ ጨምቅ';

  @override
  String get presetCompressImageBody => 'ያነሰ JPEG፤ ብክነቱ ብዙም አይታይም';

  @override
  String get presetEnhancePhotoTitle => 'ፎቶ አሻሽል';

  @override
  String get presetEnhancePhotoBody => 'ይበልጥ ንጹህ፣ ግልጽና የተሻለ ቀለም';

  @override
  String get presetImageToWebpTitle => 'ፎቶ ወደ WebP';

  @override
  String get presetImageToWebpBody => 'ዘመናዊ ቅርጸት፤ ከJPEG ያነሰ';

  @override
  String get sizeTargetTitle => 'የታለመ መጠን';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'ብጁ…';

  @override
  String get sizeTargetDialogTitle => 'የታለመ መጠን በMB';

  @override
  String get sizeTargetTooSmall =>
      'ለዚህ ርዝመት ዒላማው በጣም ትንሽ ነው፤ በተቻለ መጠን ቅርብ የሆነው ጥራት ይሠራበታል።';

  @override
  String estimatePerFile(String size) {
    return '≈ $size በአንድ ፋይል';
  }

  @override
  String estimateTotal(String size) {
    return 'የሚገመት ውጤት፦ ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ፋይሎች ተመርጠዋል',
      one: '1 ፋይል ተመርጧል',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% ከመስመር ውጭ መቀየር';

  @override
  String get promiseBatchFree => 'የጅምላ ሥራ ነጻ ነው';

  @override
  String get promiseNoWatermark => 'የውሃ ምልክት የለም';

  @override
  String get sectionTransform => 'ለውጥ';

  @override
  String get rotateLabel => 'አሽከርክር';

  @override
  String get flipLabel => 'በአግድም መስተዋት አድርግ';

  @override
  String get speedLabel => 'ፍጥነት';

  @override
  String get cropLabel => 'ቁረጥ';

  @override
  String get cropHint =>
      'ወደ ተመረጠው የጎን ጥምርታ ከመሃል መቁረጥ — ለማህበራዊ ፍሰት ካሬ፣ ለታሪኮች 9:16።';

  @override
  String volumeLabel(int percent) {
    return 'ድምፅ፦ $percent%';
  }

  @override
  String get addAudioFiles => 'ድምፅና ሌሎች ፋይሎች';

  @override
  String get hwEncoderLabel => 'የሃርድዌር ኢንኮዲንግ';

  @override
  String get hwEncoderHint =>
      'በቢትሬትና ወደ-መጠን-ማስማማት ሁነታዎች የመሣሪያውን የቪዲዮ ቺፕ ይጠቀማል — በጣም ፈጣንና ያነሰ ሙቀት ያለው። የጥራት (CRF) ሁነታ ሁልጊዜ ትክክለኛውን የሶፍትዌር ኢንኮደር ይጠቀማል፤ ያልተሳካ የሃርድዌር ሥራም በራስ-ሰር በሶፍትዌር ይደገማል።';

  @override
  String get transformNeedsReencode =>
      'ማሽከርከር፣ መስተዋትና ፍጥነት እንደገና ኢንኮዲንግ ስለሚጠይቁ በዥረት ቅጂ ጊዜ ጠፍተዋል።';

  @override
  String get capBitrateLabel => 'ፋይሉን በጭራሽ አታሳድግ';

  @override
  String get capBitrateHint =>
      'ኢንኮዲንጉን በምንጩ ቢትሬት ላይ ይገድባል። ቋሚ ጥራት የራሱ ጣሪያ ስለሌለው፣ አስቀድሞ የተጨመቀ ቪዲዮ ካለበለዚያ ይበልጥ ትልቅ ሆኖ ሊወጣ ይችላል።';

  @override
  String get keepSubtitles => 'የትርጉም ጽሑፎችን አቆይ';

  @override
  String get keepSubtitlesHint =>
      'የትርጉም ጽሑፍ ትራኮችን ወደ ውጤቱ ያሸጋግራል። የጽሑፍ ትርጉሞች ብቻ።';

  @override
  String get sectionTrim => 'መከርከም';

  @override
  String get trimEnable => 'ምንጩን ከርክም';

  @override
  String get trimHint => 'በወረፋ ላይ ርዝመቱ የሚታወቅ አንድ ፋይል ብቻ ሲኖር ይገኛል።';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'የታለመ መጠን';

  @override
  String get lowBatteryTitle => 'ባትሪው አነስተኛ ነው';

  @override
  String get lowBatteryBody =>
      'መቀየር ፕሮሰሰሩን በጣም ያሠራል። መጀመሪያ ኃይል መሙላት ትችላለህ፤ ወይም እንዲሁ መቀጠል።';

  @override
  String get lowBatteryContinue => 'ለማንኛውም ቀይር';

  @override
  String get commonCancel => 'ሰርዝ';

  @override
  String get commonOk => 'እሺ';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ፋይሎች ደርሰዋል',
      one: '1 ፋይል ደርሷል',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'አስቀምጥ';

  @override
  String get savedToGallery => 'በጋለሪ ውስጥ፣ በ«Eluna Media» አልበም ተቀምጧል።';

  @override
  String get savedToDownloads => 'በ«Downloads» ተቀምጧል።';

  @override
  String get saveFailed => 'ፋይሉን ማስቀመጥ አልተቻለም።';

  @override
  String get jobRemovedUndo => 'ሥራው ተወግዷል።';

  @override
  String get finishedClearedUndo => 'የተጠናቀቁ ሥራዎች ጸድተዋል።';

  @override
  String get undo => 'መልስ';

  @override
  String get errorDetailsTitle => 'የስህተት ዝርዝር';

  @override
  String get sectionConversionPrefs => 'መቀየር';

  @override
  String get powerModeLabel => 'የኃይል ሁነታ';

  @override
  String get powerEfficiency => 'ቀዝቃዛና ፈጣን';

  @override
  String get powerBalanced => 'ሚዛናዊ';

  @override
  String get powerQuality => 'ከፍተኛ ጭመቃ';

  @override
  String get powerModeHint =>
      'የቪዲዮ ኢንኮደሩ ምን ያህል ጠንክሮ እንደሚሠራ። ይበልጥ ቀዝቃዛና ፈጣን ማለት በመጠኑ ትልቅ ፋይሎች ማለት ነው። ከዚህ ውጪ ምንም ነገር በጭራሽ አይገደብም።';

  @override
  String get hapticsLabel => 'የንዝረት ግብረ መልስ';

  @override
  String get networkPrivacyTitle => 'አውታረ መረብና ግላዊነት';

  @override
  String get netAuditIntro =>
      'በዚህ መተግበሪያ ውስጥ አውታረ መረብን ሊነካ የሚችል ነገር ሁሉ ሙሉ ዝርዝር።';

  @override
  String get netAuditNoneTitle => 'ምንም ዓይነት የአውታረ መረብ መዳረሻ የለም';

  @override
  String get netAuditNoneBody =>
      'መተግበሪያው የኢንተርኔት ፈቃድ አይጠይቅም፤ ስለዚህ ቢሞክርም እንኳ አውታረ መረቡ ላይ መድረስ አይችልም — ይህን በሥርዓቱ የመተግበሪያ መረጃ ውስጥ ማረጋገጥ ትችላለህ። ማስታወቂያ የለም፣ ትንታኔ የለም፣ የዝማኔ ፍተሻ የለም። «መተግበሪያውን ገምግም» ሥራውን ለመደብሩ መተግበሪያ ያስረክባል፤ እሱም የራሱን ግንኙነት ያደርጋል።';

  @override
  String get netAuditConversionTitle => 'መቀየር';

  @override
  String get netAuditConversionBody =>
      'አብሮ በተያዘ FFmpeg አማካኝነት ሙሉ በሙሉ በዚህ መሣሪያ ላይ ይሠራል። የአውሮፕላን ሁነታን አብራና ቀይር — ይሠራል።';

  @override
  String get netAuditTelemetryTitle => 'ቴሌሜትሪ';

  @override
  String get netAuditTelemetryBody =>
      'ምንም የለም። መተግበሪያው ምንም ትንታኔ፣ የብልሽት ሪፖርት ወይም መለያ ምልክት አይሰበስብም፤ የመለያ ሥርዓትም የለውም።';

  @override
  String get netAuditTipsTitle => 'ጉርሻ';

  @override
  String get netAuditTipsBody =>
      'ጉርሻው የሚፈጸመው በPlay Store መተግበሪያ እንጂ በዚህኛው አይደለም — ይህኛው አሁንም የኢንተርኔት ፈቃድ የለውም። ክፍያው በፈቃዶቹ ዝርዝር ላይ ሁለት መስመሮች ይጨምራል፦ «የመተግበሪያ ውስጥ ግዢዎች» እና «የአውታረ መረብ ግንኙነቶችን መመልከት»፤ ይህኛው ግንኙነት መኖሩን ብቻ ያነባል እንጂ ሊጠቀምበት አይችልም። ምንም ነገር በራስ-ሰር አይገዛም፤ ጉርሻም ምንም አይከፍትም፦ እዚህ ያለው እያንዳንዱ ባህሪ ነጻ ነው።';

  @override
  String get sectionSupport => 'ድጋፍ';

  @override
  String get rateApp => 'መተግበሪያውን ገምግም';

  @override
  String get openLicenses => 'የክፍት ምንጭ ፈቃዶች';

  @override
  String get presetAudioToMp3Title => 'ድምፅ ቀይር';

  @override
  String get presetAudioToMp3Body => 'ወደ MP3 — በሁሉም ነገር ላይ ይጫወታል';

  @override
  String get presetCompressAudioTitle => 'ድምፅ ጨምቅ';

  @override
  String get presetCompressAudioBody => 'ቀለል ያለ AAC — የድምፅ ማስታወሻዎች፣ ፖድካስቶች';

  @override
  String get convertTo => 'ቀይር ወደ';

  @override
  String get formatSectionHint => 'ፋይሎችህ በእውነት ሊሆኑ የሚችሉት ቅርጸቶች ብቻ ተዘርዝረዋል።';

  @override
  String get sourceVideo => 'ቪዲዮ';

  @override
  String get sourceImage => 'ፎቶ';

  @override
  String get sourceAudio => 'ድምፅ';

  @override
  String get sourceUnknown => 'ፋይል';

  @override
  String get mixedSelectionTitle => 'የተለያዩ የፋይል ዓይነቶች ተመርጠዋል';

  @override
  String get mixedSelectionBody =>
      'እያንዳንዱ ፋይል ለራሱ ዓይነት በሚስማማው ምርጥ ቅድመ-ቅንብር ይቀየራል። ሙሉ ቁጥጥር ከፈለግህ በአንድ ጊዜ አንድ ዓይነት አክል።';

  @override
  String get filesTitle => 'ፋይሎች';

  @override
  String get removeFile => 'አስወግድ';

  @override
  String timeLeft(String time) {
    return '≈ $time ቀርቷል';
  }

  @override
  String get jobSettingsTitle => 'የመቀየሪያ ቅንብሮች';

  @override
  String get jobDetails => 'ዝርዝሮች';

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
  String get summaryEnhanced => 'ተሻሽሏል';

  @override
  String get summaryMetadataStripped => 'ሜታዳታ ተወግዷል';

  @override
  String summaryMerge(int count) {
    return '$count ቅንጫቢዎች ተዋህደዋል';
  }

  @override
  String get shareApp => 'መተግበሪያውን አጋራ';

  @override
  String get shareAppText =>
      'Eluna Media — ነጻ፣ ሙሉ በሙሉ ከመስመር ውጭ የሚሠራ የፎቶ፣ ቪዲዮና ድምፅ መቀየሪያ። ምዝገባ የለም፣ የውሃ ምልክት የለም፣ መለያ የለም።';

  @override
  String appVersionLabel(String version) {
    return 'ስሪት $version';
  }

  @override
  String get openFile => 'ክፈት';

  @override
  String get openFolder => 'አቃፊውን አሳይ';

  @override
  String get noAppToOpen => 'በዚህ መሣሪያ ላይ ያንን ፋይል መክፈት የሚችል መተግበሪያ የለም።';

  @override
  String get openFailed => 'ፋይሉን መክፈት አልተቻለም።';

  @override
  String get twoPassLabel => 'ለትክክለኛ መጠን ሁለት ዙር';

  @override
  String get twoPassHint =>
      'ወደ-መጠን-ማስማማት ሥራዎች ሁለት ጊዜ ኢንኮድ ይደረጋሉ፤ የባይት በጀቱንም በሚታይ ሁኔታ በተሻለ ትክክለኛነት ይመታሉ — በግምት በእጥፍ ጊዜና ባትሪ።';

  @override
  String get whatsNewTitle => 'አዲስ ነገር';

  @override
  String get whatsNew1 => 'ቪዲዮ አሁን AV1 ሊሆን ይችላል፦ በእጅጉ ያነሱ ፋይሎች፣ መጠበቅ ከቻልክ።';

  @override
  String get whatsNew2 =>
      'ለምስሎች አዲስ፦ AVIF፣ ከJPEG ግማሽ ያህል፣ እና ከGIF ይልቅ እንቅስቃሴ ያለው WebP።';

  @override
  String get whatsNew3 => 'M4A ያለ ብክነት ሊሆን ይችላል — ALAC አሁን ከAAC ጎን ተቀምጧል።';

  @override
  String get whatsNew4 =>
      'ለመልኩ አንድ ማያ፦ ብሩህነት፣ የማጉያ ቀለም፣ ንጹህ ጥቁር OLED እና Material You።';

  @override
  String get whatsNew5 =>
      'ስኬቶች ሜዳሊያዎች፣ ሦስት ትሮችና እንደ ምስል ማጋራት የምትችለው እድገት አላቸው።';

  @override
  String get achievementsTitle => 'ስኬቶች';

  @override
  String achievementsProgress(int done, int total) {
    return 'ከ$total ውስጥ $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'በዚህ መሣሪያ ላይ ብቻ ይቆጠራል። ምንም ነገር ወደ የትም አይላክም።';

  @override
  String get achFirstConversionTitle => 'የመጀመሪያ እርምጃዎች';

  @override
  String get achFirstConversionBody => 'የመጀመሪያ ፋይልህን ቀይር።';

  @override
  String get achTenConversionsTitle => 'ተሟሟቀ';

  @override
  String get achTenConversionsBody => '10 ፋይሎችን ቀይር።';

  @override
  String get achFiftyConversionsTitle => 'መደበኛ';

  @override
  String get achFiftyConversionsBody => '50 ፋይሎችን ቀይር።';

  @override
  String get achTwoHundredConversionsTitle => 'ታታሪ';

  @override
  String get achTwoHundredConversionsBody => '200 ፋይሎችን ቀይር።';

  @override
  String get achThousandConversionsTitle => 'ማጓጓዣ';

  @override
  String get achThousandConversionsBody => '1000 ፋይሎችን ቀይር።';

  @override
  String get achSaved100MbTitle => 'ቦታ ቆጣቢ';

  @override
  String get achSaved100MbBody => 'በጠቅላላ 100 MB ነጻ አድርግ።';

  @override
  String get achSaved1GbTitle => 'የጊጋባይት አዳኝ';

  @override
  String get achSaved1GbBody => 'በጠቅላላ 1 GB ነጻ አድርግ።';

  @override
  String get achSaved10GbTitle => 'የማከማቻ ጀግና';

  @override
  String get achSaved10GbBody => 'በጠቅላላ 10 GB ነጻ አድርግ።';

  @override
  String get achBatchOfFiveTitle => 'የጅምላ ሠራተኛ';

  @override
  String get achBatchOfFiveBody => 'የ5 ወይም ከዚያ በላይ ፋይሎች ጥቅል አጠናቅቅ።';

  @override
  String get achBatchOfTwentyTitle => 'የመገጣጠሚያ መስመር';

  @override
  String get achBatchOfTwentyBody => 'የ20 ወይም ከዚያ በላይ ፋይሎች ጥቅል አጠናቅቅ።';

  @override
  String get achSniperTitle => 'ተኳሽ';

  @override
  String get achSniperBody => 'ወደ-መጠን-ማስማማትን ተጠቅመህ ትክክለኛውን መጠን ምታ።';

  @override
  String get achMemeSmithTitle => 'የሜም ሠሪ';

  @override
  String get achMemeSmithBody => 'ቪዲዮን ወደ GIF ቀይር።';

  @override
  String get achSoundHunterTitle => 'የድምፅ አዳኝ';

  @override
  String get achSoundHunterBody => 'ከቪዲዮ ውስጥ ድምፅ አውጣ።';

  @override
  String get achSubtitleKeeperTitle => 'የትርጉም ጽሑፍ ጠባቂ';

  @override
  String get achSubtitleKeeperBody => 'ቪዲዮን ከትርጉም ጽሑፎቹ ጋር ቀይር።';

  @override
  String get achDirectorTitle => 'ዳይሬክተር';

  @override
  String get achDirectorBody => 'ለውጥ ተግብር — ማሽከርከር፣ መቁረጥ፣ ፍጥነት ወይም ድምፅ።';

  @override
  String get achAllRounderTitle => 'ሁለገብ';

  @override
  String get achAllRounderBody => 'ቪዲዮ፣ ድምፅና ምስል ቀይር።';

  @override
  String get achNightOwlTitle => 'የሌሊት ወፍ';

  @override
  String get achNightOwlBody => 'በእኩለ ሌሊትና በጠዋቱ 5 ሰዓት መካከል መቀየር አጠናቅቅ።';

  @override
  String get achPlatinumTitle => 'ፕላቲነም';

  @override
  String get achPlatinumBody => 'ሌሎቹን ስኬቶች በሙሉ አግኝ።';

  @override
  String get storageTitle => 'ማከማቻ';

  @override
  String get storageBody =>
      'የተቀየሩ ፋይሎች እስክታስቀምጣቸው ወይም እስክታጋራቸው ድረስ በመተግበሪያው ውስጥ ይቆያሉ፤ እዚያ ምንም የፋይል አስተዳዳሪ ሊደርስባቸው አይችልም።';

  @override
  String get storageEmpty => 'ምንም አልተከማቸም';

  @override
  String storageUsage(String size) {
    return 'የተከማቸ፦ $size';
  }

  @override
  String get storageClearTitle => 'የተከማቹ ፋይሎች ይጽዱ?';

  @override
  String get storageClearBody =>
      'መተግበሪያው እስካሁን የያዘውን እያንዳንዱን የተጠናቀቀ ውጤት ይሰርዛል። አስቀድመህ ያስቀመጥካቸው ወይም ያጋራሃቸው ፋይሎች አይነኩም።';

  @override
  String get storageClearAction => 'አጽዳ';

  @override
  String storageCleared(String size) {
    return '$size ነጻ ወጥቷል';
  }

  @override
  String get autoSaveLabel => 'ውጤቶችን በራስ-ሰር አስቀምጥ';

  @override
  String get autoSaveHint =>
      'እያንዳንዱ የተጠናቀቀ ፋይል ዝግጁ እንደሆነ ወዲያውኑ ወደ ጋለሪ — ድምፅን ደግሞ ወደ Downloads — ያስቀምጣል።';

  @override
  String get lowSpaceTitle => 'ብዙ ቦታ አልቀረም';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ይህ ጥቅል በግምት $needed ይፈልጋል፤ ነጻ የሆነው ግን $free ብቻ ነው። መቀየሩ በመሃል ሊቆም ይችላል።';
  }

  @override
  String saveAll(int count) {
    return 'ሁሉንም አስቀምጥ ($count)';
  }

  @override
  String savedAll(int count) {
    return 'ተቀምጧል፦ $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'ከ$total ውስጥ $saved ተቀምጧል';
  }

  @override
  String get presetFitPhotoTitle => 'ፎቶን ወደ መጠን አስማማ';

  @override
  String get presetFitPhotoBody =>
      'ምስልን ከትክክለኛ ገደብ በታች ጨምቅ — የመስቀያ ቅጾች፣ ማመልከቻዎች።';

  @override
  String get photoFitHint =>
      'መተግበሪያው የሚስማማ እስኪያገኝ ድረስ የተለያዩ ጥራቶችን ይሞክራል። በጀቱ ለምስሉ በጣም ትንሽ ከሆነ የፍሬሙን መጠንም ይቀንሳል።';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'የታለመ መጠን በKB';

  @override
  String get compareAction => 'አወዳድር';

  @override
  String get compareBefore => 'በፊት';

  @override
  String get compareAfter => 'በኋላ';

  @override
  String get compareHint => 'ዋናውን ለማየት ተጭነህ ያዝ።';

  @override
  String get trimStart => 'መጀመሪያ';

  @override
  String get trimEnd => 'መጨረሻ';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss፣ እስከ $duration ድረስ';
  }

  @override
  String get imageScaleLabel => 'ልኬት';

  @override
  String get audioChannelsLabel => 'ቻናሎች';

  @override
  String get audioMono => 'ሞኖ';

  @override
  String get audioStereo => 'ስቴሪዮ';

  @override
  String get sampleRateLabel => 'የናሙና ፍጥነት';

  @override
  String get voiceAudioHint =>
      'በ22.05 kHz ሞኖ የድምፅ ቀረጻን ያለ የሚሰማ ብክነት በግምት ወደ አንድ አራተኛ ይቀንሳል። ለሙዚቃ ሁለቱንም በዋናው ተዋቸው።';

  @override
  String get moveUp => 'ወደ ላይ አንቀሳቅስ';

  @override
  String get moveDown => 'ወደ ታች አንቀሳቅስ';

  @override
  String get renameOutput => 'ውጤቱን ዳግም ሰይም';

  @override
  String get renameOutputHint => 'አዲስ ስም';

  @override
  String get renameOutputHelp =>
      'ቅጥያው ከውጤቱ ቅርጸት ይመጣል። ውጤቱ በምንጩ ስም እንዲሰየም ባዶ ተወው።';

  @override
  String deleteOriginalsAction(int count) {
    return 'ዋናዎቹን ሰርዝ ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'ከመቀየር በኋላ ዋናዎቹን ሰርዝ';

  @override
  String get deleteOriginalsHint =>
      'ውጤቱ ከተቀመጠ በኋላ የመነሻ ፋይሎቹን እንዲያስወግድ ሥርዓቱን ይጠይቃል። ሥርዓቱ ሁልጊዜ ምን እንደሚሰረዝ ያሳያል፤ የአንተንም ማረጋገጫ ይጠብቃል።';

  @override
  String originalsDeleted(String size) {
    return 'ዋናዎቹ ተሰርዘዋል — $size ነጻ ወጥቷል';
  }

  @override
  String get originalsNoneDeleted =>
      'ምንም አልተሰረዘም። ጋለሪው አሁንም በዋናው ስማቸው የያዛቸው ፋይሎች ብቻ ሊገኙ ይችላሉ።';

  @override
  String reclaimedTotal(String size) {
    return 'በዚህ መተግበሪያ ነጻ የወጣ፦ $size';
  }

  @override
  String get deleteAllData => 'ሁሉንም ውሂብ ሰርዝ';

  @override
  String get deleteAllDataHint =>
      'መተግበሪያው በዚህ መሣሪያ ላይ የሚይዘውን ሁሉ ያጠፋል፦ ወረፋውን፣ የተቀየሩ ፋይሎችን፣ ቅድመ-እይታዎችን፣ ስኬቶችንና ቅንብሮችን። አስቀድመህ ወደ ጋለሪህ ያስቀመጥካቸው ፋይሎች አይነኩም።';

  @override
  String get codecCopy => 'ቅዳ';

  @override
  String get codecCopyRemux => 'ቅዳ (ዳግም ማሸግ)';

  @override
  String get codecNoVideo => 'ቪዲዮ የለም';

  @override
  String get codecNoAudio => 'ድምፅ የለም';

  @override
  String codecLossless(String codec) {
    return '$codec (ያለ ብክነት)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (እንቅስቃሴ ያለው)';
  }

  @override
  String get sizeTargetEmail => 'ኢሜይል';

  @override
  String get trimTimeHint => 'm:ss';
}
