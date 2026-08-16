// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class L10nGu extends L10n {
  L10nGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'રૂપાંતર';

  @override
  String get tabQueue => 'કતાર';

  @override
  String get addFiles => 'ફાઇલો ઉમેરો';

  @override
  String get emptySelectionTitle => 'હજી કોઈ ફાઇલ નથી';

  @override
  String get emptySelectionBody =>
      'ફોટો, વીડિયો કે ઑડિયો ઉમેરો. બધું જ આ જ ડિવાઇસ પર પ્રોસેસ થાય છે.';

  @override
  String get sectionOutput => 'આઉટપુટ';

  @override
  String get sectionVideo => 'વીડિયો';

  @override
  String get sectionAudio => 'ઑડિયો';

  @override
  String get sectionImage => 'ઇમેજ';

  @override
  String get sectionPrivacy => 'ગોપનીયતા';

  @override
  String get outputFormat => 'ફૉર્મેટ';

  @override
  String get videoCodec => 'વીડિયો કોડેક';

  @override
  String get audioCodec => 'ઑડિયો કોડેક';

  @override
  String get rateControl => 'રેટ કંટ્રોલ';

  @override
  String get rateControlQuality => 'સ્થિર ગુણવત્તા (CRF)';

  @override
  String get rateControlBitrate => 'લક્ષ્ય બિટરેટ';

  @override
  String crfLabel(int value) {
    return 'ગુણવત્તા (CRF $value)';
  }

  @override
  String get crfHint => 'ઓછું મૂલ્ય એટલે વધુ સારી ગુણવત્તા અને મોટી ફાઇલ.';

  @override
  String videoBitrate(int value) {
    return 'વીડિયો બિટરેટ: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'ઑડિયો બિટરેટ: $value kbps';
  }

  @override
  String get encodingPreset => 'એન્કોડર પ્રીસેટ';

  @override
  String get encodingPresetHint =>
      'ધીમા પ્રીસેટ વધુ સારું કૉમ્પ્રેસ કરે છે, પણ ડિવાઇસ વધારે ગરમ થાય છે.';

  @override
  String get presetOriginal => 'મૂળ';

  @override
  String get resolution => 'રિઝોલ્યુશન';

  @override
  String get frameRate => 'ફ્રેમ રેટ';

  @override
  String imageQuality(int value) {
    return 'ગુણવત્તા: $value';
  }

  @override
  String get lossless => 'લૉસલેસ';

  @override
  String get losslessHint => 'ફાઇલો મોટી, પણ પિક્સેલ-પરફેક્ટ આઉટપુટ.';

  @override
  String get sectionEnhance => 'સુધારણા';

  @override
  String get sharpenLabel => 'શાર્પનેસ';

  @override
  String get sharpenHint =>
      'કિનારીઓ વધુ સ્પષ્ટ કરે છે. ધૂંધળો કે ફોકસ ચૂકી ગયેલો ફોટો એ બચાવી શકતું નથી — એ વિગત ફાઇલમાં છે જ નહીં.';

  @override
  String get sharpenStrongHint =>
      'વધુ પડતું શાર્પનિંગ કિનારીઓ પર ચમકતાં વલયો છોડી શકે છે. પહેલાં મધ્યમ અજમાવો.';

  @override
  String get denoiseLabel => 'નૉઇઝ ઘટાડો';

  @override
  String get denoiseHint =>
      'અંધારા અને રાત્રિના ફોટામાંનો ગ્રેન સાફ કરે છે. વધુ પડતું હોય તો ઝીણી વિગત પણ ભૂંસાઈ જાય છે.';

  @override
  String get autoColorLabel => 'ઑટો રંગ અને લેવલ';

  @override
  String get autoColorHint =>
      'કૉન્ટ્રાસ્ટ વધારે છે અને ફિક્કા રંગોમાં થોડો પ્રાણ પૂરે છે.';

  @override
  String get upscaleLabel => '2× મોટું કરો';

  @override
  String get upscaleHint =>
      'પહોળાઈ અને ઊંચાઈ બમણી કરે છે. વિગત ઉમેરતું નથી — પ્રિન્ટ કરતી વખતે કે ક્રૉપ કરતી વખતે કામ લાગે છે.';

  @override
  String get upscaleConflictHint =>
      'મોટું કરવા માટે રિઝોલ્યુશન પાછું મૂળ પર સેટ કરો.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'બંધ';

  @override
  String get enhanceLight => 'હળવું';

  @override
  String get enhanceMedium => 'મધ્યમ';

  @override
  String get enhanceStrong => 'વધુ';

  @override
  String get stripMetadata => 'મેટાડેટા દૂર કરો';

  @override
  String get stripMetadataHint =>
      'આઉટપુટમાંથી EXIF, GPS અને ટાઇમસ્ટૅમ્પ કાઢી નાખે છે.';

  @override
  String startConversion(int count) {
    return 'ફાઇલો રૂપાંતરિત કરો ($count)';
  }

  @override
  String get batchResumed => 'અધૂરું રહેલું રૂપાંતર ફરી શરૂ કર્યું.';

  @override
  String get converting => 'રૂપાંતર થઈ રહ્યું છે…';

  @override
  String get cancelBatch => 'રોકો';

  @override
  String get cancelJob => 'રદ કરો';

  @override
  String get clearFinished => 'પૂર્ણ થયેલાં દૂર કરો';

  @override
  String get removeJob => 'દૂર કરો';

  @override
  String get shareFile => 'શેર કરો';

  @override
  String get retryJob => 'ફરી પ્રયાસ કરો';

  @override
  String get queueEmptyTitle => 'કતાર ખાલી છે';

  @override
  String get queueEmptyBody => 'રૂપાંતર ટૅબ પર ઉમેરેલી ફાઇલો અહીં દેખાશે.';

  @override
  String queueActiveTab(int count) {
    return 'ચાલુ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'પૂર્ણ · $count';
  }

  @override
  String get queueNoActiveTitle => 'અત્યારે કશું ચાલી રહ્યું નથી';

  @override
  String get queueNoActiveBody =>
      'કતારમાં રહેલી કે રૂપાંતરિત થઈ રહેલી ફાઇલો અહીં દેખાય છે.';

  @override
  String get queueNoFinishedTitle => 'હજી કશું પૂર્ણ થયું નથી';

  @override
  String get queueNoFinishedBody =>
      'રૂપાંતરિત ફાઇલો અહીં આવે છે — ખોલવા, સાચવવા કે શેર કરવા તૈયાર.';

  @override
  String get statusQueued => 'કતારમાં';

  @override
  String get statusRunning => 'રૂપાંતર થઈ રહ્યું છે';

  @override
  String get statusCompleted => 'પૂર્ણ';

  @override
  String get statusFailed => 'નિષ્ફળ';

  @override
  String get statusCancelled => 'રદ';

  @override
  String batchSummary(int done, int total) {
    return '$total માંથી $done પૂર્ણ';
  }

  @override
  String batchCompleted(int done) {
    return 'રૂપાંતરિત ફાઇલો: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done રૂપાંતરિત થઈ, $failed નિષ્ફળ.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% નાની';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% મોટી';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'દેખાવ';

  @override
  String get themeSystem => 'સિસ્ટમ પ્રમાણે';

  @override
  String get language => 'ભાષા';

  @override
  String get languageSystem => 'સિસ્ટમ';

  @override
  String get privacyTitle => 'ગોપનીયતા';

  @override
  String get privacyBody =>
      'Eluna Media તમારી ફાઇલો સંપૂર્ણપણે આ જ ડિવાઇસ પર, સાથે આવેલી FFmpeg ની નકલ વડે રૂપાંતરિત કરે છે. તમારી ફાઇલો ક્યારેય ડિવાઇસની બહાર જતી નથી, ખાતાની જરૂર નથી અને કોઈ ટેલિમેટ્રી નથી. ઍપમાં કશું જ નેટવર્ક વાપરતું નથી — તેની પાસે ઇન્ટરનેટની પરવાનગી સુધ્ધાં નથી.\n\nમેટાડેટા દૂર કરવાનું ડિફૉલ્ટ રીતે ચાલુ છે, એટલે તમે એક્સપોર્ટ કરો છો તે ફાઇલોમાંથી EXIF, GPS યામ અને ટાઇમસ્ટૅમ્પ કાઢી નાખવામાં આવે છે.';

  @override
  String get licenseTitle => 'લાઇસન્સ';

  @override
  String get licenseBody =>
      'આ ઍપ સાથે x264, x265 અને બીજા GPL ઘટકો સાથે બનેલું FFmpeg આવે છે, તેથી આખી ઍપ્લિકેશન GNU GPL v3 હેઠળ વિતરિત થાય છે.';

  @override
  String get sourceMissing => 'સ્રોત ફાઇલ હવે ઉપલબ્ધ નથી.';

  @override
  String get tabSettings => 'સેટિંગ્સ';

  @override
  String get introTitle => 'રચનાથી જ ખાનગી';

  @override
  String get introOfflineTitle => 'આ જ ડિવાઇસ પર રૂપાંતર';

  @override
  String get introOfflineBody =>
      'બધું કામ સાથે આવેલી FFmpeg ની નકલ કરે છે. તમારી ફાઇલો ફોનની બહાર જતી નથી — રૂપાંતર એરપ્લેન મોડમાં પણ ચાલે છે.';

  @override
  String get introTelemetryTitle => 'શૂન્ય ટેલિમેટ્રી';

  @override
  String get introTelemetryBody =>
      'ખાતું નહીં, ઍનલિટિક્સ નહીં, ક્રૅશ રિપોર્ટ નહીં. તમે કોણ છો એ ઍપને ખબર જ નથી.';

  @override
  String get introMetadataTitle => 'મેટાડેટા તમારા નિયંત્રણમાં';

  @override
  String get introMetadataBody =>
      'દરેક આઉટપુટમાંથી EXIF, GPS અને ટાઇમસ્ટૅમ્પ ડિફૉલ્ટ રીતે કાઢી નાખવામાં આવે છે. ઇચ્છો તો એ બંધ કરી શકો છો.';

  @override
  String get introFreeNote =>
      'મફત — જાહેરાતો નહીં, સબસ્ક્રિપ્શન નહીં. બૅચ રૂપાંતર સહિત દરેક સુવિધા શરૂઆતથી જ તમારી છે; ખરીદી શકાય એવી એક જ વસ્તુ છે ટિપ, અને તેનાથી કશું અનલૉક થતું નથી.';

  @override
  String get introContinue => 'શરૂ કરો';

  @override
  String get modeSimple => 'સરળ';

  @override
  String get modeAdvanced => 'અદ્યતન';

  @override
  String get modeAdvancedHint =>
      'પ્રીસેટ કાર્ડને બદલે દરેક કોડેક, બિટરેટ અને ટ્રાન્સફૉર્મ નિયંત્રણ બતાવો.';

  @override
  String get presetCompressVideoTitle => 'વીડિયો કૉમ્પ્રેસ કરો';

  @override
  String get presetCompressVideoBody => 'ઘણો નાનો MP4, ગુણવત્તા સારી રહે છે';

  @override
  String get presetFitToSizeTitle => 'કદમાં બેસાડો';

  @override
  String get presetFitToSizeBody => 'ચોક્કસ મર્યાદામાં — Discord, ઇમેઇલ, ચૅટ';

  @override
  String get presetCompatibleMp4Title => 'સુસંગત MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. બધે જ ચાલે છે';

  @override
  String get presetExtractAudioTitle => 'ઑડિયો કાઢો';

  @override
  String get presetExtractAudioBody => 'કોઈ પણ વીડિયોમાંથી MP3';

  @override
  String get presetVideoToGifTitle => 'વીડિયોમાંથી GIF';

  @override
  String get presetVideoToGifBody => 'ટૂંકી ક્લિપમાંથી ઍનિમેટેડ GIF';

  @override
  String get presetMergeTitle => 'વીડિયો જોડો';

  @override
  String get presetMergeBody => 'ક્લિપ ક્રમમાં એક MP4 માં જોડો';

  @override
  String get mergeNeedsTwo => 'જોડવા માટે ઓછામાં ઓછા બે વીડિયો પસંદ કરો.';

  @override
  String mergedVideoName(int count) {
    return 'જોડેલો વીડિયો ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'ફોટો કૉમ્પ્રેસ કરો';

  @override
  String get presetCompressImageBody => 'નાનો JPEG, ફરક ભાગ્યે જ દેખાય';

  @override
  String get presetEnhancePhotoTitle => 'ફોટો સુધારો';

  @override
  String get presetEnhancePhotoBody => 'વધુ સ્વચ્છ, વધુ સ્પષ્ટ, સારા રંગ';

  @override
  String get presetImageToWebpTitle => 'ફોટામાંથી WebP';

  @override
  String get presetImageToWebpBody => 'આધુનિક ફૉર્મેટ, JPEG કરતાં નાનું';

  @override
  String get sizeTargetTitle => 'લક્ષ્ય કદ';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'કસ્ટમ…';

  @override
  String get sizeTargetDialogTitle => 'લક્ષ્ય કદ (MB માં)';

  @override
  String get sizeTargetTooSmall =>
      'આ સમયગાળા માટે લક્ષ્ય બહુ નાનું છે; શક્ય હોય એટલી નજીકની ગુણવત્તા વપરાશે.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size પ્રતિ ફાઇલ';
  }

  @override
  String estimateTotal(String size) {
    return 'અંદાજિત આઉટપુટ: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'પસંદ કરેલી ફાઇલો: $count';
  }

  @override
  String get promiseOffline => '100% ઑફલાઇન રૂપાંતર';

  @override
  String get promiseBatchFree => 'બૅચ રૂપાંતર મફત';

  @override
  String get promiseNoWatermark => 'કોઈ વૉટરમાર્ક નહીં';

  @override
  String get sectionTransform => 'ટ્રાન્સફૉર્મ';

  @override
  String get rotateLabel => 'ફેરવો';

  @override
  String get flipLabel => 'આડું મિરર';

  @override
  String get speedLabel => 'ઝડપ';

  @override
  String get cropLabel => 'ક્રૉપ';

  @override
  String get cropHint =>
      'પસંદ કરેલા આસ્પેક્ટ રેશિયો પર મધ્યથી ક્રૉપ — ફીડ માટે ચોરસ, સ્ટોરી માટે 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'અવાજ: $percent%';
  }

  @override
  String get addAudioFiles => 'ઑડિયો અને બીજી ફાઇલો';

  @override
  String get hwEncoderLabel => 'હાર્ડવેર એન્કોડિંગ';

  @override
  String get hwEncoderHint =>
      'બિટરેટ અને કદમાં-બેસાડો મોડમાં ડિવાઇસની વીડિયો ચિપ વપરાય છે — ઘણું ઝડપી અને ઓછું ગરમ. ગુણવત્તા (CRF) મોડ હંમેશાં ચોકસાઈવાળા સૉફ્ટવેર એન્કોડરનો ઉપયોગ કરે છે, અને નિષ્ફળ ગયેલું હાર્ડવેર કામ આપોઆપ સૉફ્ટવેર પર ફરી ચાલે છે.';

  @override
  String get transformNeedsReencode =>
      'ફેરવવું, મિરર અને ઝડપ માટે ફરીથી એન્કોડ કરવું પડે છે, તેથી સ્ટ્રીમ કૉપી દરમિયાન એ બંધ રહે છે.';

  @override
  String get capBitrateLabel => 'ફાઇલ ક્યારેય મોટી ન કરો';

  @override
  String get capBitrateHint =>
      'એન્કોડિંગને સ્રોતના પોતાના બિટરેટ સુધી મર્યાદિત રાખે છે. સ્થિર ગુણવત્તાની પોતાની કોઈ ઉપલી મર્યાદા હોતી નથી, એટલે પહેલેથી કૉમ્પ્રેસ થયેલો વીડિયો નહીંતર મોટો થઈ શકે છે.';

  @override
  String get keepSubtitles => 'સબટાઇટલ રાખો';

  @override
  String get keepSubtitlesHint =>
      'સબટાઇટલ ટ્રૅક આઉટપુટમાં લઈ જાય છે. ફક્ત ટેક્સ્ટ સબટાઇટલ.';

  @override
  String get sectionTrim => 'ટ્રિમ';

  @override
  String get trimEnable => 'સ્રોત ટ્રિમ કરો';

  @override
  String get trimHint =>
      'કતારમાં જાણીતા સમયગાળાવાળી બરાબર એક જ ફાઇલ હોય ત્યારે જ ઉપલબ્ધ.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'લક્ષ્ય કદ';

  @override
  String get lowBatteryTitle => 'બૅટરી ઓછી છે';

  @override
  String get lowBatteryBody =>
      'રૂપાંતરમાં પ્રોસેસર પર ઘણો ભાર આવે છે. પહેલાં ચાર્જર લગાવી શકો, અથવા આમ જ આગળ વધો.';

  @override
  String get lowBatteryContinue => 'તોય રૂપાંતરિત કરો';

  @override
  String get commonCancel => 'રદ કરો';

  @override
  String get commonOk => 'બરાબર';

  @override
  String filesReceived(int count) {
    return 'મળેલી ફાઇલો: $count';
  }

  @override
  String get saveFile => 'સાચવો';

  @override
  String get savedToGallery => 'ગૅલરીમાં, “Eluna Media” આલ્બમમાં સાચવી.';

  @override
  String get savedToDownloads => 'ડાઉનલોડમાં સાચવી.';

  @override
  String get saveFailed => 'ફાઇલ સાચવી શકાઈ નહીં.';

  @override
  String get jobRemovedUndo => 'કામ દૂર કર્યું.';

  @override
  String get finishedClearedUndo => 'પૂર્ણ થયેલાં કામ સાફ કર્યાં.';

  @override
  String get undo => 'પૂર્વવત્ કરો';

  @override
  String get errorDetailsTitle => 'ભૂલની વિગત';

  @override
  String get sectionConversionPrefs => 'રૂપાંતર';

  @override
  String get powerModeLabel => 'પાવર મોડ';

  @override
  String get powerEfficiency => 'ઠંડું અને ઝડપી';

  @override
  String get powerBalanced => 'સંતુલિત';

  @override
  String get powerQuality => 'મહત્તમ કૉમ્પ્રેશન';

  @override
  String get powerModeHint =>
      'વીડિયો એન્કોડરે કેટલી મહેનત કરવી. ઠંડું અને ઝડપી એટલે ફાઇલો થોડી મોટી. બીજું કશું ધીમું કરવામાં આવતું નથી — ક્યારેય નહીં.';

  @override
  String get hapticsLabel => 'વાઇબ્રેશન ફીડબૅક';

  @override
  String get networkPrivacyTitle => 'નેટવર્ક અને ગોપનીયતા';

  @override
  String get netAuditIntro =>
      'આ ઍપમાં નેટવર્કને અડી શકે એવી દરેક વસ્તુની સંપૂર્ણ યાદી.';

  @override
  String get netAuditNoneTitle => 'નેટવર્કનો ઉપયોગ જ નથી';

  @override
  String get netAuditNoneBody =>
      'ઍપ ઇન્ટરનેટની પરવાનગી માગતી જ નથી, એટલે પ્રયત્ન કરે તોય નેટવર્ક સુધી પહોંચી શકતી નથી — સિસ્ટમની ઍપ માહિતીમાં તમે જાતે ચકાસી શકો છો. જાહેરાતો નહીં, ઍનલિટિક્સ નહીં, અપડેટની તપાસ નહીં. “ઍપને રેટિંગ આપો” તમને સ્ટોર ઍપને સોંપી દે છે; વાતચીત એ ઍપ પોતે કરે છે.';

  @override
  String get netAuditConversionTitle => 'રૂપાંતર';

  @override
  String get netAuditConversionBody =>
      'સાથે આવેલા FFmpeg દ્વારા સંપૂર્ણપણે આ જ ડિવાઇસ પર ચાલે છે. એરપ્લેન મોડ ચાલુ કરીને રૂપાંતર કરી જુઓ — ચાલે છે.';

  @override
  String get netAuditTelemetryTitle => 'ટેલિમેટ્રી';

  @override
  String get netAuditTelemetryBody =>
      'એ છે જ નહીં. ઍપ કોઈ ઍનલિટિક્સ, ક્રૅશ રિપોર્ટ કે ઓળખચિહ્ન ભેગાં કરતી નથી, અને તેમાં ખાતાની વ્યવસ્થા પણ નથી.';

  @override
  String get netAuditTipsTitle => 'ટિપ';

  @override
  String get netAuditTipsBody =>
      'ટિપનો વ્યવહાર Play Store ઍપ કરે છે, આ ઍપ નહીં — તેની પાસે હજી પણ ઇન્ટરનેટની પરવાનગી નથી. બિલિંગને કારણે પરવાનગીઓની યાદીમાં બે લીટી ઉમેરાય છે: “ઍપમાં ખરીદી” અને “નેટવર્ક કનેક્શન જોવું”; બીજી ફક્ત કનેક્શન છે કે નહીં એટલું જ વાંચે છે, તેનો ઉપયોગ કરી શકતી નથી. કશું આપોઆપ ખરીદાતું નથી, અને ટિપથી કશું અનલૉક થતું નથી: અહીં દરેક સુવિધા મફત છે.';

  @override
  String get sectionSupport => 'સહયોગ';

  @override
  String get rateApp => 'ઍપને રેટિંગ આપો';

  @override
  String get openLicenses => 'ઓપન સોર્સ લાઇસન્સ';

  @override
  String get presetAudioToMp3Title => 'ઑડિયો રૂપાંતરિત કરો';

  @override
  String get presetAudioToMp3Body => 'MP3 માં — બધે જ ચાલે છે';

  @override
  String get presetCompressAudioTitle => 'ઑડિયો કૉમ્પ્રેસ કરો';

  @override
  String get presetCompressAudioBody => 'હળવું AAC — વૉઇસ નોટ, પોડકાસ્ટ';

  @override
  String get convertTo => 'આમાં રૂપાંતરિત કરો';

  @override
  String get formatSectionHint =>
      'તમારી ફાઇલો ખરેખર જેમાં બદલાઈ શકે એ જ ફૉર્મેટ અહીં દેખાય છે.';

  @override
  String get sourceVideo => 'વીડિયો';

  @override
  String get sourceImage => 'ફોટો';

  @override
  String get sourceAudio => 'ઑડિયો';

  @override
  String get sourceUnknown => 'ફાઇલ';

  @override
  String get mixedSelectionTitle => 'જુદા જુદા પ્રકારની ફાઇલો પસંદ કરી';

  @override
  String get mixedSelectionBody =>
      'દરેક ફાઇલ તેના પોતાના પ્રકાર માટેના શ્રેષ્ઠ પ્રીસેટથી રૂપાંતરિત થાય છે. પૂરું નિયંત્રણ જોઈએ તો એક સમયે એક જ પ્રકારની ફાઇલો ઉમેરો.';

  @override
  String get filesTitle => 'ફાઇલો';

  @override
  String get removeFile => 'દૂર કરો';

  @override
  String timeLeft(String time) {
    return '≈ $time બાકી';
  }

  @override
  String get jobSettingsTitle => 'રૂપાંતર સેટિંગ્સ';

  @override
  String get jobDetails => 'વિગત';

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
  String get summaryEnhanced => 'સુધારેલું';

  @override
  String get summaryMetadataStripped => 'મેટાડેટા દૂર કર્યો';

  @override
  String summaryMerge(int count) {
    return 'જોડેલી ક્લિપ: $count';
  }

  @override
  String get shareApp => 'ઍપ શેર કરો';

  @override
  String get shareAppText =>
      'Eluna Media — ફોટો, વીડિયો અને ઑડિયો માટે મફત, સંપૂર્ણપણે ઑફલાઇન કન્વર્ટર. સબસ્ક્રિપ્શન નહીં, વૉટરમાર્ક નહીં, ખાતું નહીં.';

  @override
  String appVersionLabel(String version) {
    return 'આવૃત્તિ $version';
  }

  @override
  String get openFile => 'ખોલો';

  @override
  String get openFolder => 'ફોલ્ડર બતાવો';

  @override
  String get noAppToOpen => 'આ ફાઇલ ખોલી શકે એવી કોઈ ઍપ આ ડિવાઇસ પર નથી.';

  @override
  String get openFailed => 'ફાઇલ ખોલી શકાઈ નહીં.';

  @override
  String get twoPassLabel => 'ચોક્કસ કદ માટે ટૂ-પાસ';

  @override
  String get twoPassHint =>
      'કદમાં-બેસાડો કામ બે વાર એન્કોડ થાય છે અને બાઇટ મર્યાદામાં નોંધપાત્ર રીતે વધુ ચોકસાઈથી બેસે છે — તેના બદલામાં લગભગ બમણો સમય અને બૅટરી.';

  @override
  String get whatsNewTitle => 'નવું શું છે';

  @override
  String get whatsNew1 =>
      'વીડિયો હવે AV1 માં પણ થઈ શકે છે: ફાઇલો નોંધપાત્ર રીતે નાની, જો રાહ જોઈ શકો તો.';

  @override
  String get whatsNew2 =>
      'ચિત્રો માટે નવું: AVIF, JPEG કરતાં લગભગ અડધું, અને GIF ને બદલે ઍનિમેટેડ WebP.';

  @override
  String get whatsNew3 =>
      'M4A હવે લૉસલેસ પણ હોઈ શકે — AAC ની બાજુમાં હવે ALAC છે.';

  @override
  String get whatsNew4 =>
      'દેખાવ માટે એક જ સ્ક્રીન: તેજ, ઍક્સેન્ટ રંગ, પૂરો કાળો OLED અને Material You.';

  @override
  String get whatsNew5 =>
      'સિદ્ધિઓમાં ચંદ્રકો, ત્રણ ટૅબ અને પ્રગતિ — જેને ચિત્ર તરીકે શેર કરી શકાય.';

  @override
  String get achievementsTitle => 'સિદ્ધિઓ';

  @override
  String achievementsProgress(int done, int total) {
    return '$total માંથી $done';
  }

  @override
  String get achievementsPrivacyNote =>
      'ફક્ત આ જ ડિવાઇસ પર ગણાય છે. ક્યાંય અપલોડ થતું નથી.';

  @override
  String get achFirstConversionTitle => 'પહેલું પગલું';

  @override
  String get achFirstConversionBody => 'તમારી પહેલી ફાઇલ રૂપાંતરિત કરો.';

  @override
  String get achTenConversionsTitle => 'હાથ બેઠો';

  @override
  String get achTenConversionsBody => '10 ફાઇલો રૂપાંતરિત કરો.';

  @override
  String get achFiftyConversionsTitle => 'નિયમિત';

  @override
  String get achFiftyConversionsBody => '50 ફાઇલો રૂપાંતરિત કરો.';

  @override
  String get achTwoHundredConversionsTitle => 'મહેનતુ';

  @override
  String get achTwoHundredConversionsBody => '200 ફાઇલો રૂપાંતરિત કરો.';

  @override
  String get achThousandConversionsTitle => 'કન્વેયર';

  @override
  String get achThousandConversionsBody => '1000 ફાઇલો રૂપાંતરિત કરો.';

  @override
  String get achSaved100MbTitle => 'જગ્યા બચાવનાર';

  @override
  String get achSaved100MbBody => 'કુલ 100 MB ખાલી કરો.';

  @override
  String get achSaved1GbTitle => 'ગીગાબાઇટ શિકારી';

  @override
  String get achSaved1GbBody => 'કુલ 1 GB ખાલી કરો.';

  @override
  String get achSaved10GbTitle => 'સ્ટોરેજ હીરો';

  @override
  String get achSaved10GbBody => 'કુલ 10 GB ખાલી કરો.';

  @override
  String get achBatchOfFiveTitle => 'બૅચ કામદાર';

  @override
  String get achBatchOfFiveBody => '5 કે વધુ ફાઇલોનો બૅચ પૂરો કરો.';

  @override
  String get achBatchOfTwentyTitle => 'ઍસેમ્બ્લી લાઇન';

  @override
  String get achBatchOfTwentyBody => '20 કે વધુ ફાઇલોનો બૅચ પૂરો કરો.';

  @override
  String get achSniperTitle => 'સ્નાઇપર';

  @override
  String get achSniperBody => 'કદમાં-બેસાડોથી બરાબર ચોક્કસ કદ સાધો.';

  @override
  String get achMemeSmithTitle => 'મીમ કારીગર';

  @override
  String get achMemeSmithBody => 'વીડિયોમાંથી GIF બનાવો.';

  @override
  String get achSoundHunterTitle => 'ધ્વનિ શિકારી';

  @override
  String get achSoundHunterBody => 'વીડિયોમાંથી ઑડિયો કાઢો.';

  @override
  String get achSubtitleKeeperTitle => 'સબટાઇટલ રક્ષક';

  @override
  String get achSubtitleKeeperBody => 'સબટાઇટલ જાળવીને વીડિયો રૂપાંતરિત કરો.';

  @override
  String get achDirectorTitle => 'દિગ્દર્શક';

  @override
  String get achDirectorBody =>
      'કોઈ ટ્રાન્સફૉર્મ લગાવો — ફેરવવું, ક્રૉપ, ઝડપ કે અવાજ.';

  @override
  String get achAllRounderTitle => 'ઑલરાઉન્ડર';

  @override
  String get achAllRounderBody => 'વીડિયો, ઑડિયો અને ઇમેજ રૂપાંતરિત કરો.';

  @override
  String get achNightOwlTitle => 'રાતપંખી';

  @override
  String get achNightOwlBody =>
      'મધરાત અને સવારે 5 વાગ્યાની વચ્ચે કોઈ રૂપાંતર પૂરું કરો.';

  @override
  String get achPlatinumTitle => 'પ્લેટિનમ';

  @override
  String get achPlatinumBody => 'બીજી બધી સિદ્ધિઓ મેળવો.';

  @override
  String get storageTitle => 'સ્ટોરેજ';

  @override
  String get storageBody =>
      'રૂપાંતરિત ફાઇલો તમે તેમને સાચવો કે શેર કરો ત્યાં સુધી ઍપની અંદર જ રહે છે, જ્યાં કોઈ ફાઇલ મૅનેજર પહોંચી શકતું નથી.';

  @override
  String get storageEmpty => 'કશું સંગ્રહાયેલું નથી';

  @override
  String storageUsage(String size) {
    return 'સંગ્રહાયેલું: $size';
  }

  @override
  String get storageClearTitle => 'સંગ્રહાયેલી ફાઇલો દૂર કરવી?';

  @override
  String get storageClearBody =>
      'ઍપ પાસે હજી પડેલાં દરેક પૂર્ણ પરિણામ કાઢી નાખે છે. તમે પહેલેથી સાચવેલી કે શેર કરેલી ફાઇલોને અડકાતું નથી.';

  @override
  String get storageClearAction => 'દૂર કરો';

  @override
  String storageCleared(String size) {
    return '$size ખાલી થયું';
  }

  @override
  String get autoSaveLabel => 'પરિણામ આપોઆપ સાચવો';

  @override
  String get autoSaveHint =>
      'દરેક તૈયાર ફાઇલ તરત જ ગૅલરીમાં — ઑડિયો ડાઉનલોડમાં — મૂકી દે છે.';

  @override
  String get lowSpaceTitle => 'જગ્યા ઝાઝી બાકી નથી';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'આ બૅચને આશરે $needed જોઈશે અને માત્ર $free ખાલી છે. રૂપાંતર વચ્ચે અટકી શકે છે.';
  }

  @override
  String saveAll(int count) {
    return 'બધું સાચવો ($count)';
  }

  @override
  String savedAll(int count) {
    return 'સાચવ્યું: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total માંથી $saved સાચવ્યાં';
  }

  @override
  String get presetFitPhotoTitle => 'ફોટો કદમાં બેસાડો';

  @override
  String get presetFitPhotoBody =>
      'ચિત્રને ચોક્કસ મર્યાદાની નીચે લાવો — અપલોડ ફૉર્મ, અરજી.';

  @override
  String get photoFitHint =>
      'ફાઇલ મર્યાદામાં બેસે ત્યાં સુધી ઍપ જુદી જુદી ગુણવત્તા અજમાવે છે. મર્યાદા ચિત્ર માટે બહુ નાની હોય તો એ ફ્રેમનું કદ પણ ઘટાડે છે.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'લક્ષ્ય કદ (KB માં)';

  @override
  String get compareAction => 'સરખાવો';

  @override
  String get compareBefore => 'પહેલાં';

  @override
  String get compareAfter => 'પછી';

  @override
  String get compareHint => 'મૂળ જોવા માટે દબાવી રાખો.';

  @override
  String get trimStart => 'શરૂઆત';

  @override
  String get trimEnd => 'અંત';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, વધુમાં વધુ $duration';
  }

  @override
  String get imageScaleLabel => 'સ્કેલ';

  @override
  String get audioChannelsLabel => 'ચૅનલ';

  @override
  String get audioMono => 'મોનો';

  @override
  String get audioStereo => 'સ્ટીરિયો';

  @override
  String get sampleRateLabel => 'સૅમ્પલ રેટ';

  @override
  String get voiceAudioHint =>
      '22.05 kHz પર મોનો કરવાથી અવાજનું રેકૉર્ડિંગ સંભળાય એવા નુકસાન વગર લગભગ એક-ચતુર્થાંશ થઈ જાય છે. સંગીત માટે બંને મૂળ જ રહેવા દો.';

  @override
  String get moveUp => 'ઉપર ખસેડો';

  @override
  String get moveDown => 'નીચે ખસેડો';

  @override
  String get renameOutput => 'પરિણામનું નામ બદલો';

  @override
  String get renameOutputHint => 'નવું નામ';

  @override
  String get renameOutputHelp =>
      'એક્સટેન્શન આઉટપુટ ફૉર્મેટ પરથી નક્કી થાય છે. ખાલી રાખશો તો પરિણામને સ્રોત ફાઇલનું નામ મળશે.';

  @override
  String deleteOriginalsAction(int count) {
    return 'મૂળ ફાઇલો કાઢી નાખો ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'રૂપાંતર પછી મૂળ ફાઇલો કાઢી નાખો';

  @override
  String get deleteOriginalsHint =>
      'પરિણામ સચવાઈ ગયા પછી સ્રોત ફાઇલો દૂર કરવાનું સિસ્ટમને કહે છે. શું જશે એ સિસ્ટમ હંમેશાં બતાવે છે અને તમારી પુષ્ટિની રાહ જુએ છે.';

  @override
  String get mediaAccessRequired =>
      'મૂળ ફાઇલો કાઢી નાખવા માટે મીડિયા લાઇબ્રેરીની ઍક્સેસ જરૂરી છે.';

  @override
  String originalsDeleted(String size) {
    return 'મૂળ ફાઇલો કાઢી નાખી — $size ખાલી થયું';
  }

  @override
  String get originalsNoneDeleted =>
      'કશું કાઢી નાખવામાં આવ્યું નથી. ગૅલરીમાં તેમના મૂળ નામે જ પડેલી ફાઇલો જ મળી શકે છે.';

  @override
  String reclaimedTotal(String size) {
    return 'આ ઍપથી ખાલી થયું: $size';
  }

  @override
  String get deleteAllData => 'બધો ડેટા કાઢી નાખો';

  @override
  String get deleteAllDataHint =>
      'ઍપ આ ડિવાઇસ પર જે કંઈ રાખે છે એ બધું ભૂંસી નાખે છે: કતાર, રૂપાંતરિત ફાઇલો, પ્રીવ્યૂ, સિદ્ધિઓ અને સેટિંગ્સ. તમે પહેલેથી ગૅલરીમાં સાચવેલી ફાઇલોને અડકાતું નથી.';

  @override
  String get codecCopy => 'કૉપી';

  @override
  String get codecCopyRemux => 'કૉપી (રીમક્સ)';

  @override
  String get codecNoVideo => 'વીડિયો નહીં';

  @override
  String get codecNoAudio => 'ઑડિયો નહીં';

  @override
  String codecLossless(String codec) {
    return '$codec (લૉસલેસ)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (ઍનિમેટેડ)';
  }

  @override
  String get sizeTargetEmail => 'ઇમેઇલ';

  @override
  String get trimTimeHint => 'm:ss';
}
