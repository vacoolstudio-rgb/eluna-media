// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class L10nKm extends L10n {
  L10nKm([String locale = 'km']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'បម្លែង';

  @override
  String get tabQueue => 'ជួរ';

  @override
  String get addFiles => 'បន្ថែមឯកសារ';

  @override
  String get emptySelectionTitle => 'មិនទាន់មានឯកសារ';

  @override
  String get emptySelectionBody =>
      'បន្ថែមរូបថត វីដេអូ ឬសំឡេង។ អ្វីៗទាំងអស់ត្រូវបានដំណើរការនៅលើឧបករណ៍នេះ។';

  @override
  String get sectionOutput => 'លទ្ធផល';

  @override
  String get sectionVideo => 'វីដេអូ';

  @override
  String get sectionAudio => 'សំឡេង';

  @override
  String get sectionImage => 'រូបភាព';

  @override
  String get sectionPrivacy => 'ឯកជនភាព';

  @override
  String get outputFormat => 'ទ្រង់ទ្រាយ';

  @override
  String get videoCodec => 'កូដិកវីដេអូ';

  @override
  String get audioCodec => 'កូដិកសំឡេង';

  @override
  String get rateControl => 'ការគ្រប់គ្រងអត្រា';

  @override
  String get rateControlQuality => 'គុណភាពថេរ (CRF)';

  @override
  String get rateControlBitrate => 'អត្រាប៊ីតគោលដៅ';

  @override
  String crfLabel(int value) {
    return 'គុណភាព (CRF $value)';
  }

  @override
  String get crfHint => 'តម្លៃទាបជាង មានន័យថាគុណភាពល្អជាង និងឯកសារធំជាង។';

  @override
  String videoBitrate(int value) {
    return 'អត្រាប៊ីតវីដេអូ៖ $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'អត្រាប៊ីតសំឡេង៖ $value kbps';
  }

  @override
  String get encodingPreset => 'ការកំណត់ជាមុនរបស់អ៊ិនកូឌ័រ';

  @override
  String get encodingPresetHint =>
      'ការកំណត់ជាមុនដែលយឺតជាង បង្ហាប់បានល្អជាង ប៉ុន្តែធ្វើឱ្យឧបករណ៍ក្តៅជាង។';

  @override
  String get presetOriginal => 'ដើម';

  @override
  String get resolution => 'គុណភាពបង្ហាញ';

  @override
  String get frameRate => 'អត្រាហ្វ្រេម';

  @override
  String imageQuality(int value) {
    return 'គុណភាព៖ $value';
  }

  @override
  String get lossless => 'គ្មានការបាត់បង់';

  @override
  String get losslessHint => 'ឯកសារធំជាង តែលទ្ធផលត្រឹមត្រូវគ្រប់ភីកសែល។';

  @override
  String get sectionEnhance => 'ការកែលម្អ';

  @override
  String get sharpenLabel => 'ភាពច្បាស់';

  @override
  String get sharpenHint =>
      'ធ្វើឱ្យគែមមុតច្បាស់ជាង។ វាមិនអាចសង្គ្រោះរូបថតដែលព្រិល ឬចាប់ចំណុចមិនច្បាស់បានទេ — ព័ត៌មានលម្អិតនោះមិនមាននៅក្នុងឯកសារ។';

  @override
  String get sharpenStrongHint =>
      'ការបន្ថែមភាពច្បាស់ខ្លាំង អាចបន្សល់ទុករង្វង់ភ្លឺតាមគែម។ សូមសាកល្បងកម្រិតមធ្យមជាមុនសិន។';

  @override
  String get denoiseLabel => 'ការកាត់បន្ថយភាពរំខាន';

  @override
  String get denoiseHint =>
      'សម្អាតគ្រាប់រំខាននៅក្នុងរូបថតងងឹត និងរូបថតពេលយប់។ ច្រើនពេកនឹងលុបព័ត៌មានលម្អិតតូចៗចោល។';

  @override
  String get autoColorLabel => 'ពណ៌ និងកម្រិតដោយស្វ័យប្រវត្តិ';

  @override
  String get autoColorHint => 'ពង្រីកកុងត្រាស់ និងលើកពណ៌ដែលរាបស្មើឡើងបន្តិច។';

  @override
  String get upscaleLabel => 'ពង្រីក 2×';

  @override
  String get upscaleHint =>
      'បង្កើនទទឹង និងកម្ពស់ទ្វេដង។ វាមិនបន្ថែមព័ត៌មានលម្អិតទេ — វាមានប្រយោជន៍ពេលបោះពុម្ព ឬច្រឹប។';

  @override
  String get upscaleConflictHint =>
      'កំណត់គុណភាពបង្ហាញត្រឡប់ទៅ “ដើម” វិញ ដើម្បីពង្រីក។';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'បិទ';

  @override
  String get enhanceLight => 'ស្រាល';

  @override
  String get enhanceMedium => 'មធ្យម';

  @override
  String get enhanceStrong => 'ខ្លាំង';

  @override
  String get stripMetadata => 'លុបទិន្នន័យមេតា';

  @override
  String get stripMetadataHint => 'ដក EXIF, GPS និងត្រាពេលវេលាចេញពីលទ្ធផល។';

  @override
  String startConversion(int count) {
    return 'បម្លែងឯកសារ $count';
  }

  @override
  String get batchResumed => 'បានបន្តការបម្លែងដែលត្រូវបានរំខាន។';

  @override
  String get converting => 'កំពុងបម្លែង…';

  @override
  String get cancelBatch => 'ឈប់';

  @override
  String get cancelJob => 'បោះបង់';

  @override
  String get clearFinished => 'សម្អាតអ្វីដែលរួចរាល់';

  @override
  String get removeJob => 'ដកចេញ';

  @override
  String get shareFile => 'ចែករំលែក';

  @override
  String get retryJob => 'ព្យាយាមម្តងទៀត';

  @override
  String get queueEmptyTitle => 'ជួរទទេ';

  @override
  String get queueEmptyBody =>
      'ឯកសារដែលអ្នកបន្ថែមនៅផ្ទាំង “បម្លែង” នឹងបង្ហាញនៅទីនេះ។';

  @override
  String queueActiveTab(int count) {
    return 'កំពុងដំណើរការ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'រួចរាល់ · $count';
  }

  @override
  String get queueNoActiveTitle => 'គ្មានអ្វីកំពុងដំណើរការ';

  @override
  String get queueNoActiveBody =>
      'ឯកសារដែលកំពុងរង់ចាំ ឬកំពុងបម្លែង នឹងបង្ហាញនៅទីនេះ។';

  @override
  String get queueNoFinishedTitle => 'មិនទាន់មានអ្វីរួចរាល់';

  @override
  String get queueNoFinishedBody =>
      'ឯកសារដែលបម្លែងរួច នឹងមកដល់ទីនេះ ត្រៀមរួចសម្រាប់បើក រក្សាទុក ឬចែករំលែក។';

  @override
  String get statusQueued => 'រង់ចាំក្នុងជួរ';

  @override
  String get statusRunning => 'កំពុងបម្លែង';

  @override
  String get statusCompleted => 'រួចរាល់';

  @override
  String get statusFailed => 'បរាជ័យ';

  @override
  String get statusCancelled => 'បានបោះបង់';

  @override
  String batchSummary(int done, int total) {
    return 'រួចរាល់ $done ក្នុងចំណោម $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'បានបម្លែងឯកសារ $done',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'បានបម្លែង $done, បរាជ័យ $failed។';
  }

  @override
  String savedPercent(int percent) {
    return 'តូចជាង $percent%';
  }

  @override
  String grewPercent(int percent) {
    return 'ធំជាង $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'រូបរាង';

  @override
  String get themeSystem => 'តាមប្រព័ន្ធ';

  @override
  String get language => 'ភាសា';

  @override
  String get languageSystem => 'តាមប្រព័ន្ធ';

  @override
  String get privacyTitle => 'ឯកជនភាព';

  @override
  String get privacyBody =>
      'Eluna Media បម្លែងឯកសាររបស់អ្នកទាំងស្រុងនៅលើឧបករណ៍នេះ ដោយប្រើ FFmpeg ដែលភ្ជាប់មកជាមួយ។ ឯកសាររបស់អ្នកមិនដែលចាកចេញពីឧបករណ៍ទេ មិនត្រូវការគណនី ហើយគ្មានទិន្នន័យតេឡេម៉ែត្រឡើយ។ គ្មានអ្វីនៅក្នុងកម្មវិធីប្រើបណ្តាញទាល់តែសោះ — វាមិនសូម្បីតែកាន់សិទ្ធិអនុញ្ញាតអ៊ីនធឺណិតផង។\n\nការលុបទិន្នន័យមេតាត្រូវបានបើកតាមលំនាំដើម ដូច្នេះ EXIF កូអរដោណេ GPS និងត្រាពេលវេលា ត្រូវបានដកចេញពីឯកសារដែលអ្នកនាំចេញ។';

  @override
  String get licenseTitle => 'អាជ្ញាបណ្ណ';

  @override
  String get licenseBody =>
      'កម្មវិធីនេះភ្ជាប់មកជាមួយ FFmpeg ដែលបង្កើតឡើងជាមួយ x264, x265 និងសមាសភាគ GPL ផ្សេងទៀត ដូច្នេះកម្មវិធីទាំងមូលត្រូវបានចែកចាយក្រោម GNU GPL v3។';

  @override
  String get sourceMissing => 'ឯកសារដើមលែងមានទៀតហើយ។';

  @override
  String get tabSettings => 'ការកំណត់';

  @override
  String get introTitle => 'ឯកជនតាំងពីការរចនា';

  @override
  String get introOfflineTitle => 'បម្លែងនៅលើឧបករណ៍នេះ';

  @override
  String get introOfflineBody =>
      'FFmpeg ដែលភ្ជាប់មកជាមួយធ្វើការទាំងអស់។ ឯកសាររបស់អ្នកមិនដែលចាកចេញពីទូរស័ព្ទទេ — ការបម្លែងដំណើរការសូម្បីក្នុងរបៀបយន្តហោះ។';

  @override
  String get introTelemetryTitle => 'គ្មានតេឡេម៉ែត្រ';

  @override
  String get introTelemetryBody =>
      'គ្មានគណនី គ្មានការវិភាគ គ្មានរបាយការណ៍កំហុស។ កម្មវិធីមិនដឹងថាអ្នកជានរណាទេ។';

  @override
  String get introMetadataTitle => 'ទិន្នន័យមេតាក្រោមការគ្រប់គ្រង';

  @override
  String get introMetadataBody =>
      'EXIF, GPS និងត្រាពេលវេលាត្រូវបានដកចេញពីលទ្ធផលទាំងអស់តាមលំនាំដើម។ អ្នកអាចបិទវាបាន។';

  @override
  String get introFreeNote =>
      'ឥតគិតថ្លៃ គ្មានការផ្សាយពាណិជ្ជកម្ម និងគ្មានការជាវ។ មុខងារគ្រប់យ៉ាង រួមទាំងការបម្លែងជាបាច់ ជារបស់អ្នកតាំងពីដំបូង — រឿងតែមួយគត់ដែលអាចទិញបានគឺការឱ្យតម្លៃលើកទឹកចិត្ត ហើយវាមិនដោះសោអ្វីទាំងអស់។';

  @override
  String get introContinue => 'ចាប់ផ្តើម';

  @override
  String get modeSimple => 'សាមញ្ញ';

  @override
  String get modeAdvanced => 'កម្រិតខ្ពស់';

  @override
  String get modeAdvancedHint =>
      'បង្ហាញកូដិក អត្រាប៊ីត និងការគ្រប់គ្រងការបំប្លែងទាំងអស់ ជំនួសឱ្យកាតកំណត់ជាមុន។';

  @override
  String get presetCompressVideoTitle => 'បង្ហាប់វីដេអូ';

  @override
  String get presetCompressVideoBody => 'MP4 តូចជាងច្រើន គុណភាពនៅតែល្អ';

  @override
  String get presetFitToSizeTitle => 'ឱ្យសមនឹងទំហំ';

  @override
  String get presetFitToSizeBody =>
      'ត្រូវនឹងដែនកំណត់ជាក់លាក់ — Discord, អ៊ីមែល, ការជជែក';

  @override
  String get presetCompatibleMp4Title => 'MP4 ត្រូវគ្នាបានទូលាយ';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC។ លេងបានគ្រប់ទីកន្លែង';

  @override
  String get presetExtractAudioTitle => 'ស្រង់សំឡេងចេញ';

  @override
  String get presetExtractAudioBody => 'MP3 ចេញពីវីដេអូណាមួយ';

  @override
  String get presetVideoToGifTitle => 'វីដេអូទៅ GIF';

  @override
  String get presetVideoToGifBody => 'ឈុតខ្លីទៅជា GIF ចលនា';

  @override
  String get presetMergeTitle => 'បញ្ចូលវីដេអូ';

  @override
  String get presetMergeBody => 'ភ្ជាប់ឈុតទាំងឡាយទៅជា MP4 តែមួយ តាមលំដាប់';

  @override
  String get mergeNeedsTwo => 'សូមជ្រើសរើសវីដេអូយ៉ាងតិចពីរ ដើម្បីបញ្ចូលគ្នា។';

  @override
  String mergedVideoName(int count) {
    return 'វីដេអូបញ្ចូលគ្នា (ឈុត $count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'បង្ហាប់រូបថត';

  @override
  String get presetCompressImageBody => 'JPEG តូចជាង ការបាត់បង់ស្ទើរមើលមិនឃើញ';

  @override
  String get presetEnhancePhotoTitle => 'កែលម្អរូបថត';

  @override
  String get presetEnhancePhotoBody => 'ស្អាតជាង ច្បាស់ជាង ពណ៌ល្អជាង';

  @override
  String get presetImageToWebpTitle => 'រូបថតទៅ WebP';

  @override
  String get presetImageToWebpBody => 'ទ្រង់ទ្រាយទំនើប តូចជាង JPEG';

  @override
  String get sizeTargetTitle => 'ទំហំគោលដៅ';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'កំណត់ដោយខ្លួនឯង…';

  @override
  String get sizeTargetDialogTitle => 'ទំហំគោលដៅជា MB';

  @override
  String get sizeTargetTooSmall =>
      'គោលដៅតូចពេកសម្រាប់រយៈពេលនេះ ដូច្នេះនឹងប្រើគុណភាពដែលជិតបំផុតតាមដែលអាចធ្វើបាន។';

  @override
  String estimatePerFile(String size) {
    return '≈ $size ក្នុងមួយឯកសារ';
  }

  @override
  String estimateTotal(String size) {
    return 'លទ្ធផលប៉ាន់ស្មាន៖ ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'បានជ្រើសរើសឯកសារ $count',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => 'បម្លែងក្រៅបណ្តាញ 100%';

  @override
  String get promiseBatchFree => 'បាច់ឥតគិតថ្លៃ';

  @override
  String get promiseNoWatermark => 'គ្មានស្លាកទឹក';

  @override
  String get sectionTransform => 'ការបំប្លែង';

  @override
  String get rotateLabel => 'បង្វិល';

  @override
  String get flipLabel => 'ត្រឡប់ផ្ដេក';

  @override
  String get speedLabel => 'ល្បឿន';

  @override
  String get cropLabel => 'ច្រឹប';

  @override
  String get cropHint =>
      'ច្រឹបពីកណ្តាលទៅតាមសមាមាត្រដែលបានជ្រើស — ការ៉េសម្រាប់ហ្វីត 9:16 សម្រាប់ស្តូរី។';

  @override
  String volumeLabel(int percent) {
    return 'កម្រិតសំឡេង៖ $percent%';
  }

  @override
  String get addAudioFiles => 'សំឡេង និងឯកសារផ្សេងទៀត';

  @override
  String get hwEncoderLabel => 'ការអ៊ិនកូដដោយផ្នែករឹង';

  @override
  String get hwEncoderHint =>
      'ប្រើឈីបវីដេអូរបស់ឧបករណ៍ក្នុងរបៀបអត្រាប៊ីត និងរបៀបឱ្យសមនឹងទំហំ — លឿនជាង និងត្រជាក់ជាងច្រើន។ របៀបគុណភាព (CRF) ប្រើអ៊ិនកូឌ័រកម្មវិធីដ៏ជាក់លាក់ជានិច្ច ហើយការងារដែលបរាជ័យលើផ្នែករឹង នឹងព្យាយាមម្តងទៀតលើកម្មវិធីដោយស្វ័យប្រវត្តិ។';

  @override
  String get transformNeedsReencode =>
      'ការបង្វិល ការត្រឡប់ និងល្បឿន ត្រូវការការអ៊ិនកូដឡើងវិញ ដូច្នេះវាត្រូវបានបិទនៅពេលចម្លងស្ទ្រីម។';

  @override
  String get capBitrateLabel => 'កុំធ្វើឱ្យឯកសារធំជាងមុន';

  @override
  String get capBitrateHint =>
      'កំណត់ដែនកំពូលនៃការអ៊ិនកូដត្រឹមអត្រាប៊ីតរបស់ប្រភពខ្លួនឯង។ គុណភាពថេរគ្មានពិដានផ្ទាល់ខ្លួនទេ ដូច្នេះវីដេអូដែលបានបង្ហាប់រួច អាចចេញមកធំជាងមុន។';

  @override
  String get keepSubtitles => 'រក្សាអក្សររត់';

  @override
  String get keepSubtitlesHint =>
      'នាំបទអក្សររត់ចូលទៅក្នុងលទ្ធផល។ តែអក្សររត់ជាអត្ថបទប៉ុណ្ណោះ។';

  @override
  String get sectionTrim => 'ការកាត់';

  @override
  String get trimEnable => 'កាត់ប្រភព';

  @override
  String get trimHint => 'អាចប្រើបាន នៅពេលមានឯកសារតែមួយដែលដឹងរយៈពេលនៅក្នុងជួរ។';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ទំហំគោលដៅ';

  @override
  String get lowBatteryTitle => 'ថ្មនៅសល់តិច';

  @override
  String get lowBatteryBody =>
      'ការបម្លែងធ្វើឱ្យប្រូសេស័រធ្វើការខ្លាំង។ អ្នកអាចដោតសាកជាមុនសិន ឬបន្តតទៅ។';

  @override
  String get lowBatteryContinue => 'បម្លែងតទៅ';

  @override
  String get commonCancel => 'បោះបង់';

  @override
  String get commonOk => 'យល់ព្រម';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'បានទទួលឯកសារ $count',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'រក្សាទុក';

  @override
  String get savedToGallery =>
      'បានរក្សាទុកក្នុងវិចិត្រសាល អាល់ប៊ុម “Eluna Media”។';

  @override
  String get savedToDownloads => 'បានរក្សាទុកក្នុង Downloads។';

  @override
  String get saveFailed => 'មិនអាចរក្សាទុកឯកសារបានទេ។';

  @override
  String get jobRemovedUndo => 'បានដកការងារចេញ។';

  @override
  String get finishedClearedUndo => 'បានសម្អាតការងារដែលរួចរាល់។';

  @override
  String get undo => 'មិនធ្វើវិញ';

  @override
  String get errorDetailsTitle => 'ព័ត៌មានលម្អិតអំពីកំហុស';

  @override
  String get sectionConversionPrefs => 'ការបម្លែង';

  @override
  String get powerModeLabel => 'របៀបថាមពល';

  @override
  String get powerEfficiency => 'ត្រជាក់ និងលឿន';

  @override
  String get powerBalanced => 'តុល្យភាព';

  @override
  String get powerQuality => 'បង្ហាប់អតិបរមា';

  @override
  String get powerModeHint =>
      'កំណត់ថាអ៊ិនកូឌ័រវីដេអូធ្វើការខ្លាំងប៉ុណ្ណា។ ត្រជាក់ជាង និងលឿនជាង មានន័យថាឯកសារធំជាងបន្តិច។ គ្មានអ្វីផ្សេងទៀតត្រូវបានបន្ថយល្បឿនទេ — មិនដែលឡើយ។';

  @override
  String get hapticsLabel => 'ការឆ្លើយតបដោយរំញ័រ';

  @override
  String get networkPrivacyTitle => 'បណ្តាញ និងឯកជនភាព';

  @override
  String get netAuditIntro =>
      'បញ្ជីពេញលេញនៃអ្វីៗគ្រប់យ៉ាងក្នុងកម្មវិធីនេះ ដែលអាចប៉ះពាល់បណ្តាញ។';

  @override
  String get netAuditNoneTitle => 'គ្មានការចូលបណ្តាញទាល់តែសោះ';

  @override
  String get netAuditNoneBody =>
      'កម្មវិធីមិនស្នើសុំសិទ្ធិអនុញ្ញាតអ៊ីនធឺណិតទេ ដូច្នេះវាមិនអាចទៅដល់បណ្តាញបានឡើយ ទោះបីវាព្យាយាមក៏ដោយ — អ្នកអាចផ្ទៀងផ្ទាត់រឿងនេះនៅក្នុងព័ត៌មានកម្មវិធីរបស់ប្រព័ន្ធ។ គ្មានការផ្សាយពាណិជ្ជកម្ម គ្មានការវិភាគ គ្មានការពិនិត្យបច្ចុប្បន្នភាព។ “វាយតម្លៃកម្មវិធី” ប្រគល់បន្តទៅកម្មវិធីហាង ដែលទាក់ទងបណ្តាញដោយខ្លួនឯង។';

  @override
  String get netAuditConversionTitle => 'ការបម្លែង';

  @override
  String get netAuditConversionBody =>
      'ដំណើរការទាំងស្រុងនៅលើឧបករណ៍នេះតាមរយៈ FFmpeg ដែលភ្ជាប់មកជាមួយ។ បើករបៀបយន្តហោះ រួចបម្លែងមើល — វាដំណើរការ។';

  @override
  String get netAuditTelemetryTitle => 'តេឡេម៉ែត្រ';

  @override
  String get netAuditTelemetryBody =>
      'គ្មានទេ។ កម្មវិធីមិនប្រមូលការវិភាគ របាយការណ៍កំហុស ឬអត្តសញ្ញាណណាមួយឡើយ ហើយក៏គ្មានប្រព័ន្ធគណនីដែរ។';

  @override
  String get netAuditTipsTitle => 'ការឱ្យតម្លៃលើកទឹកចិត្ត';

  @override
  String get netAuditTipsBody =>
      'ការឱ្យតម្លៃលើកទឹកចិត្តត្រូវបានអនុវត្តដោយកម្មវិធី Play Store មិនមែនដោយកម្មវិធីនេះទេ — ដែលនៅតែគ្មានសិទ្ធិអនុញ្ញាតអ៊ីនធឺណិត។ ការទូទាត់បន្ថែមពីរបន្ទាត់ទៅក្នុងបញ្ជីសិទ្ធិ៖ “ការទិញក្នុងកម្មវិធី” និង “មើលការតភ្ជាប់បណ្តាញ” ដែលគ្រាន់តែអានថាតើមានការតភ្ជាប់ឬអត់ ហើយមិនអាចប្រើវាបានទេ។ គ្មានអ្វីត្រូវបានទិញដោយស្វ័យប្រវត្តិទេ ហើយការឱ្យតម្លៃមិនដោះសោអ្វីទាំងអស់៖ មុខងារគ្រប់យ៉ាងនៅទីនេះឥតគិតថ្លៃ។';

  @override
  String get sectionSupport => 'ការគាំទ្រ';

  @override
  String get rateApp => 'វាយតម្លៃកម្មវិធី';

  @override
  String get openLicenses => 'អាជ្ញាបណ្ណប្រភពបើកចំហ';

  @override
  String get presetAudioToMp3Title => 'បម្លែងសំឡេង';

  @override
  String get presetAudioToMp3Body => 'ទៅ MP3 — លេងបានលើអ្វីៗគ្រប់យ៉ាង';

  @override
  String get presetCompressAudioTitle => 'បង្ហាប់សំឡេង';

  @override
  String get presetCompressAudioBody => 'AAC ស្តើងជាង — កំណត់ត្រាសំឡេង ផតខាស់';

  @override
  String get convertTo => 'បម្លែងទៅជា';

  @override
  String get formatSectionHint =>
      'មានតែទ្រង់ទ្រាយដែលឯកសាររបស់អ្នកអាចក្លាយជាបានពិតប្រាកដប៉ុណ្ណោះ ដែលត្រូវបានរាយបញ្ជី។';

  @override
  String get sourceVideo => 'វីដេអូ';

  @override
  String get sourceImage => 'រូបថត';

  @override
  String get sourceAudio => 'សំឡេង';

  @override
  String get sourceUnknown => 'ឯកសារ';

  @override
  String get mixedSelectionTitle => 'បានជ្រើសរើសប្រភេទឯកសារខុសៗគ្នា';

  @override
  String get mixedSelectionBody =>
      'ឯកសារនីមួយៗត្រូវបានបម្លែងដោយប្រើការកំណត់ជាមុនដ៏ល្អបំផុតសម្រាប់ប្រភេទរបស់វា។ បន្ថែមម្តងមួយប្រភេទ ដើម្បីគ្រប់គ្រងបានពេញលេញ។';

  @override
  String get filesTitle => 'ឯកសារ';

  @override
  String get removeFile => 'ដកចេញ';

  @override
  String timeLeft(String time) {
    return 'នៅសល់ ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'ការកំណត់ការបម្លែង';

  @override
  String get jobDetails => 'ព័ត៌មានលម្អិត';

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
  String get summaryEnhanced => 'បានកែលម្អ';

  @override
  String get summaryMetadataStripped => 'បានលុបទិន្នន័យមេតា';

  @override
  String summaryMerge(int count) {
    return 'បានបញ្ចូលឈុត $count';
  }

  @override
  String get shareApp => 'ចែករំលែកកម្មវិធី';

  @override
  String get shareAppText =>
      'Eluna Media — កម្មវិធីបម្លែងរូបថត វីដេអូ និងសំឡេង ឥតគិតថ្លៃ និងក្រៅបណ្តាញទាំងស្រុង។ គ្មានការជាវ គ្មានស្លាកទឹក គ្មានគណនី។';

  @override
  String appVersionLabel(String version) {
    return 'កំណែ $version';
  }

  @override
  String get openFile => 'បើក';

  @override
  String get openFolder => 'បង្ហាញថត';

  @override
  String get noAppToOpen => 'គ្មានកម្មវិធីណានៅលើឧបករណ៍នេះ អាចបើកឯកសារនោះបានទេ។';

  @override
  String get openFailed => 'មិនអាចបើកឯកសារបានទេ។';

  @override
  String get twoPassLabel => 'អ៊ិនកូដពីរជុំ ដើម្បីទំហំជាក់លាក់';

  @override
  String get twoPassHint =>
      'ការងារឱ្យសមនឹងទំហំនឹងអ៊ិនកូដពីរដង ហើយត្រូវនឹងថវិកាបៃបានជាក់លាក់ជាងគួរឱ្យកត់សម្គាល់ — ដោយចំណាយពេល និងថ្មប្រហែលទ្វេដង។';

  @override
  String get whatsNewTitle => 'អ្វីថ្មី';

  @override
  String get whatsNew1 =>
      'ឥឡូវវីដេអូអាចជា AV1 — ឯកសារតូចជាងគួរឱ្យកត់សម្គាល់ បើអ្នកអាចរង់ចាំបាន។';

  @override
  String get whatsNew2 =>
      'ថ្មីសម្រាប់រូបភាព៖ AVIF ប្រហែលពាក់កណ្តាលនៃ JPEG និង WebP ចលនាជំនួស GIF។';

  @override
  String get whatsNew3 =>
      'M4A អាចគ្មានការបាត់បង់ — ឥឡូវ ALAC ស្ថិតនៅក្បែរ AAC។';

  @override
  String get whatsNew4 =>
      'អេក្រង់តែមួយសម្រាប់រូបរាង៖ ពន្លឺ ពណ៌សង្កត់ ខ្មៅសុទ្ធសម្រាប់ OLED និង Material You។';

  @override
  String get whatsNew5 =>
      'សមិទ្ធផលមានមេដាយ ផ្ទាំងបី និងវឌ្ឍនភាពដែលអ្នកអាចចែករំលែកជារូបភាព។';

  @override
  String get achievementsTitle => 'សមិទ្ធផល';

  @override
  String achievementsProgress(int done, int total) {
    return '$done ក្នុងចំណោម $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'រាប់នៅលើឧបករណ៍នេះតែប៉ុណ្ណោះ។ គ្មានអ្វីត្រូវបានផ្ទុកឡើងទៅកន្លែងណាទេ។';

  @override
  String get achFirstConversionTitle => 'ជំហានដំបូង';

  @override
  String get achFirstConversionBody => 'បម្លែងឯកសារដំបូងរបស់អ្នក។';

  @override
  String get achTenConversionsTitle => 'ចាប់ផ្តើមស៊ាំ';

  @override
  String get achTenConversionsBody => 'បម្លែងឯកសារ 10។';

  @override
  String get achFiftyConversionsTitle => 'អ្នកប្រើប្រចាំ';

  @override
  String get achFiftyConversionsBody => 'បម្លែងឯកសារ 50។';

  @override
  String get achTwoHundredConversionsTitle => 'អ្នកខ្នះខ្នែង';

  @override
  String get achTwoHundredConversionsBody => 'បម្លែងឯកសារ 200។';

  @override
  String get achThousandConversionsTitle => 'ខ្សែបញ្ជូន';

  @override
  String get achThousandConversionsBody => 'បម្លែងឯកសារ 1000។';

  @override
  String get achSaved100MbTitle => 'អ្នកសន្សំទំហំ';

  @override
  String get achSaved100MbBody => 'រំដោះទំហំ 100 MB សរុប។';

  @override
  String get achSaved1GbTitle => 'អ្នកប្រមាញ់ជីកាបៃ';

  @override
  String get achSaved1GbBody => 'រំដោះទំហំ 1 GB សរុប។';

  @override
  String get achSaved10GbTitle => 'វីរបុរសនៃការផ្ទុក';

  @override
  String get achSaved10GbBody => 'រំដោះទំហំ 10 GB សរុប។';

  @override
  String get achBatchOfFiveTitle => 'អ្នកធ្វើការជាបាច់';

  @override
  String get achBatchOfFiveBody => 'បញ្ចប់បាច់ 5 ឯកសារ ឬច្រើនជាងនេះ។';

  @override
  String get achBatchOfTwentyTitle => 'ខ្សែផលិតកម្ម';

  @override
  String get achBatchOfTwentyBody => 'បញ្ចប់បាច់ 20 ឯកសារ ឬច្រើនជាងនេះ។';

  @override
  String get achSniperTitle => 'អ្នកបាញ់ត្រង់គោលដៅ';

  @override
  String get achSniperBody => 'ត្រូវនឹងទំហំជាក់លាក់ដោយប្រើ “ឱ្យសមនឹងទំហំ”។';

  @override
  String get achMemeSmithTitle => 'ជាងមេម';

  @override
  String get achMemeSmithBody => 'ប្រែវីដេអូទៅជា GIF។';

  @override
  String get achSoundHunterTitle => 'អ្នកប្រមាញ់សំឡេង';

  @override
  String get achSoundHunterBody => 'ស្រង់សំឡេងចេញពីវីដេអូ។';

  @override
  String get achSubtitleKeeperTitle => 'អ្នកថែរក្សាអក្សររត់';

  @override
  String get achSubtitleKeeperBody => 'បម្លែងវីដេអូដោយរក្សាអក្សររត់របស់វា។';

  @override
  String get achDirectorTitle => 'អ្នកដឹកនាំរឿង';

  @override
  String get achDirectorBody =>
      'អនុវត្តការបំប្លែងមួយ — បង្វិល ច្រឹប ល្បឿន ឬកម្រិតសំឡេង។';

  @override
  String get achAllRounderTitle => 'អ្នកធ្វើបានគ្រប់យ៉ាង';

  @override
  String get achAllRounderBody => 'បម្លែងវីដេអូ សំឡេង និងរូបភាព។';

  @override
  String get achNightOwlTitle => 'មនុស្សយប់';

  @override
  String get achNightOwlBody =>
      'បញ្ចប់ការបម្លែងមួយ នៅចន្លោះពាក់កណ្តាលអធ្រាត្រ និងម៉ោង 5 ព្រឹក។';

  @override
  String get achPlatinumTitle => 'ផ្លាទីន';

  @override
  String get achPlatinumBody => 'ទទួលបានសមិទ្ធផលផ្សេងទៀតទាំងអស់។';

  @override
  String get storageTitle => 'ការផ្ទុក';

  @override
  String get storageBody =>
      'ឯកសារដែលបម្លែងរួច នៅតែស្ថិតក្នុងកម្មវិធីរហូតដល់អ្នករក្សាទុក ឬចែករំលែកវា ដែលជាកន្លែងគ្មានកម្មវិធីគ្រប់គ្រងឯកសារណាអាចទៅដល់។';

  @override
  String get storageEmpty => 'គ្មានអ្វីត្រូវបានផ្ទុក';

  @override
  String storageUsage(String size) {
    return 'បានផ្ទុក៖ $size';
  }

  @override
  String get storageClearTitle => 'សម្អាតឯកសារដែលបានផ្ទុក?';

  @override
  String get storageClearBody =>
      'លុបលទ្ធផលដែលរួចរាល់ទាំងអស់ដែលកម្មវិធីនៅកាន់។ ឯកសារដែលអ្នកបានរក្សាទុក ឬចែករំលែករួច មិនត្រូវបានប៉ះទេ។';

  @override
  String get storageClearAction => 'សម្អាត';

  @override
  String storageCleared(String size) {
    return 'បានរំដោះ $size';
  }

  @override
  String get autoSaveLabel => 'រក្សាទុកលទ្ធផលដោយស្វ័យប្រវត្តិ';

  @override
  String get autoSaveHint =>
      'ដាក់ឯកសាររួចរាល់នីមួយៗទៅក្នុងវិចិត្រសាល — សំឡេងទៅក្នុង Downloads — ភ្លាមៗនៅពេលវារួចរាល់។';

  @override
  String get lowSpaceTitle => 'នៅសល់ទំហំមិនច្រើនទេ';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'បាច់នេះត្រូវការប្រហែល $needed ហើយនៅទំនេរតែ $free។ ការបម្លែងអាចនឹងឈប់ពាក់កណ្តាលទី។';
  }

  @override
  String saveAll(int count) {
    return 'រក្សាទុកទាំងអស់ ($count)';
  }

  @override
  String savedAll(int count) {
    return 'បានរក្សាទុក៖ $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'បានរក្សាទុក $saved ក្នុងចំណោម $total';
  }

  @override
  String get presetFitPhotoTitle => 'ឱ្យរូបថតសមនឹងទំហំ';

  @override
  String get presetFitPhotoBody =>
      'បង្ហាប់រូបភាពឱ្យនៅក្រោមដែនកំណត់ជាក់លាក់ — ទម្រង់បញ្ចូល ពាក្យសុំ។';

  @override
  String get photoFitHint =>
      'កម្មវិធីសាកល្បងគុណភាពជាបន្តបន្ទាប់រហូតដល់មានមួយសម។ បើថវិកាតូចពេកសម្រាប់រូបភាព វានឹងបន្ថយទំហំហ្វ្រេមផងដែរ។';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'ទំហំគោលដៅជា KB';

  @override
  String get compareAction => 'ប្រៀបធៀប';

  @override
  String get compareBefore => 'មុន';

  @override
  String get compareAfter => 'ក្រោយ';

  @override
  String get compareHint => 'ចុចឱ្យជាប់ ដើម្បីមើលរូបដើម។';

  @override
  String get trimStart => 'ចាប់ផ្តើម';

  @override
  String get trimEnd => 'បញ្ចប់';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss រហូតដល់ $duration';
  }

  @override
  String get imageScaleLabel => 'មាត្រដ្ឋាន';

  @override
  String get audioChannelsLabel => 'ឆានែល';

  @override
  String get audioMono => 'ម៉ូណូ';

  @override
  String get audioStereo => 'ស្តេរ៉េអូ';

  @override
  String get sampleRateLabel => 'អត្រាគំរូ';

  @override
  String get voiceAudioHint =>
      'ម៉ូណូនៅ 22.05 kHz កាត់បន្ថយការថតសំឡេងមកនៅប្រហែលមួយភាគបួន ដោយគ្មានការបាត់បង់ដែលអាចស្តាប់ឮ។ សម្រាប់តន្ត្រី សូមទុកទាំងពីរជាដើម។';

  @override
  String get moveUp => 'ផ្លាស់ឡើងលើ';

  @override
  String get moveDown => 'ផ្លាស់ចុះក្រោម';

  @override
  String get renameOutput => 'ប្តូរឈ្មោះលទ្ធផល';

  @override
  String get renameOutputHint => 'ឈ្មោះថ្មី';

  @override
  String get renameOutputHelp =>
      'ផ្នែកបន្ថែមឈ្មោះមកពីទ្រង់ទ្រាយលទ្ធផល។ ទុកឱ្យទទេ ដើម្បីដាក់ឈ្មោះលទ្ធផលតាមឯកសារប្រភព។';

  @override
  String deleteOriginalsAction(int count) {
    return 'លុបឯកសារដើម ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'លុបឯកសារដើមបន្ទាប់ពីបម្លែង';

  @override
  String get deleteOriginalsHint =>
      'ស្នើឱ្យប្រព័ន្ធដកឯកសារប្រភពចេញ បន្ទាប់ពីលទ្ធផលត្រូវបានរក្សាទុក។ ប្រព័ន្ធតែងតែបង្ហាញថាអ្វីនឹងត្រូវលុប ហើយរង់ចាំការបញ្ជាក់របស់អ្នក។';

  @override
  String originalsDeleted(String size) {
    return 'បានលុបឯកសារដើម — រំដោះបាន $size';
  }

  @override
  String get originalsNoneDeleted =>
      'គ្មានអ្វីត្រូវបានលុបទេ។ មានតែឯកសារដែលវិចិត្រសាលនៅកាន់ក្រោមឈ្មោះដើមរបស់វា ទើបអាចរកឃើញ។';

  @override
  String reclaimedTotal(String size) {
    return 'បានរំដោះដោយកម្មវិធីនេះ៖ $size';
  }

  @override
  String get deleteAllData => 'លុបទិន្នន័យទាំងអស់';

  @override
  String get deleteAllDataHint =>
      'លុបអ្វីៗគ្រប់យ៉ាងដែលកម្មវិធីរក្សាទុកនៅលើឧបករណ៍នេះ៖ ជួរ ឯកសារដែលបម្លែងរួច រូបមើលជាមុន សមិទ្ធផល និងការកំណត់។ ឯកសារដែលអ្នកបានរក្សាទុកក្នុងវិចិត្រសាលរួច មិនត្រូវបានប៉ះទេ។';

  @override
  String get codecCopy => 'ចម្លង';

  @override
  String get codecCopyRemux => 'ចម្លង (remux)';

  @override
  String get codecNoVideo => 'គ្មានវីដេអូ';

  @override
  String get codecNoAudio => 'គ្មានសំឡេង';

  @override
  String codecLossless(String codec) {
    return '$codec (គ្មានការបាត់បង់)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (ចលនា)';
  }

  @override
  String get sizeTargetEmail => 'អ៊ីមែល';

  @override
  String get trimTimeHint => 'm:ss';
}
