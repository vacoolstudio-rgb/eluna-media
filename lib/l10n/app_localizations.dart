import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Eluna Media'**
  String get appTitle;

  /// No description provided for @tabConvert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get tabConvert;

  /// No description provided for @tabQueue.
  ///
  /// In en, this message translates to:
  /// **'Queue'**
  String get tabQueue;

  /// No description provided for @tabAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get tabAbout;

  /// No description provided for @addFiles.
  ///
  /// In en, this message translates to:
  /// **'Add files'**
  String get addFiles;

  /// No description provided for @emptySelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'No files yet'**
  String get emptySelectionTitle;

  /// No description provided for @emptySelectionBody.
  ///
  /// In en, this message translates to:
  /// **'Add photos, videos or audio. Everything is processed on this device.'**
  String get emptySelectionBody;

  /// No description provided for @sectionOutput.
  ///
  /// In en, this message translates to:
  /// **'Output'**
  String get sectionOutput;

  /// No description provided for @sectionVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get sectionVideo;

  /// No description provided for @sectionAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get sectionAudio;

  /// No description provided for @sectionImage.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get sectionImage;

  /// No description provided for @sectionPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get sectionPrivacy;

  /// No description provided for @outputFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get outputFormat;

  /// No description provided for @videoCodec.
  ///
  /// In en, this message translates to:
  /// **'Video codec'**
  String get videoCodec;

  /// No description provided for @audioCodec.
  ///
  /// In en, this message translates to:
  /// **'Audio codec'**
  String get audioCodec;

  /// No description provided for @rateControl.
  ///
  /// In en, this message translates to:
  /// **'Rate control'**
  String get rateControl;

  /// No description provided for @rateControlQuality.
  ///
  /// In en, this message translates to:
  /// **'Constant quality (CRF)'**
  String get rateControlQuality;

  /// No description provided for @rateControlBitrate.
  ///
  /// In en, this message translates to:
  /// **'Target bitrate'**
  String get rateControlBitrate;

  /// No description provided for @crfLabel.
  ///
  /// In en, this message translates to:
  /// **'Quality (CRF {value})'**
  String crfLabel(int value);

  /// No description provided for @crfHint.
  ///
  /// In en, this message translates to:
  /// **'Lower is better quality and a larger file.'**
  String get crfHint;

  /// No description provided for @videoBitrate.
  ///
  /// In en, this message translates to:
  /// **'Video bitrate: {value} kbps'**
  String videoBitrate(int value);

  /// No description provided for @audioBitrate.
  ///
  /// In en, this message translates to:
  /// **'Audio bitrate: {value} kbps'**
  String audioBitrate(int value);

  /// No description provided for @encodingPreset.
  ///
  /// In en, this message translates to:
  /// **'Encoder preset'**
  String get encodingPreset;

  /// No description provided for @encodingPresetHint.
  ///
  /// In en, this message translates to:
  /// **'Slower presets compress better but heat the device more.'**
  String get encodingPresetHint;

  /// No description provided for @presetOriginal.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get presetOriginal;

  /// No description provided for @resolution.
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get resolution;

  /// No description provided for @frameRate.
  ///
  /// In en, this message translates to:
  /// **'Frame rate'**
  String get frameRate;

  /// No description provided for @imageQuality.
  ///
  /// In en, this message translates to:
  /// **'Quality: {value}'**
  String imageQuality(int value);

  /// No description provided for @lossless.
  ///
  /// In en, this message translates to:
  /// **'Lossless'**
  String get lossless;

  /// No description provided for @losslessHint.
  ///
  /// In en, this message translates to:
  /// **'Larger files, pixel-perfect output.'**
  String get losslessHint;

  /// No description provided for @sectionEnhance.
  ///
  /// In en, this message translates to:
  /// **'Enhancement'**
  String get sectionEnhance;

  /// No description provided for @sharpenLabel.
  ///
  /// In en, this message translates to:
  /// **'Sharpness'**
  String get sharpenLabel;

  /// No description provided for @sharpenHint.
  ///
  /// In en, this message translates to:
  /// **'Makes edges crisper. It cannot recover a blurred or out-of-focus shot — that detail is not in the file.'**
  String get sharpenHint;

  /// No description provided for @sharpenStrongHint.
  ///
  /// In en, this message translates to:
  /// **'Strong sharpening can leave bright halos along edges. Try medium first.'**
  String get sharpenStrongHint;

  /// No description provided for @denoiseLabel.
  ///
  /// In en, this message translates to:
  /// **'Noise reduction'**
  String get denoiseLabel;

  /// No description provided for @denoiseHint.
  ///
  /// In en, this message translates to:
  /// **'Cleans up grain in dark and night photos. Too much smooths away fine detail.'**
  String get denoiseHint;

  /// No description provided for @autoColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Auto colour and levels'**
  String get autoColorLabel;

  /// No description provided for @autoColorHint.
  ///
  /// In en, this message translates to:
  /// **'Stretches contrast and lifts flat colours a little.'**
  String get autoColorHint;

  /// No description provided for @upscaleLabel.
  ///
  /// In en, this message translates to:
  /// **'Upscale 2×'**
  String get upscaleLabel;

  /// No description provided for @upscaleHint.
  ///
  /// In en, this message translates to:
  /// **'Doubles the width and height. It does not add detail — it helps when printing or cropping.'**
  String get upscaleHint;

  /// No description provided for @upscaleConflictHint.
  ///
  /// In en, this message translates to:
  /// **'Set Resolution back to Original to upscale.'**
  String get upscaleConflictHint;

  /// No description provided for @upscaleChip.
  ///
  /// In en, this message translates to:
  /// **'2×'**
  String get upscaleChip;

  /// No description provided for @enhanceOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get enhanceOff;

  /// No description provided for @enhanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get enhanceLight;

  /// No description provided for @enhanceMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get enhanceMedium;

  /// No description provided for @enhanceStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get enhanceStrong;

  /// No description provided for @stripMetadata.
  ///
  /// In en, this message translates to:
  /// **'Remove metadata'**
  String get stripMetadata;

  /// No description provided for @stripMetadataHint.
  ///
  /// In en, this message translates to:
  /// **'Strips EXIF, GPS and timestamps from the output.'**
  String get stripMetadataHint;

  /// No description provided for @startConversion.
  ///
  /// In en, this message translates to:
  /// **'Convert {count} files'**
  String startConversion(int count);

  /// No description provided for @batchResumed.
  ///
  /// In en, this message translates to:
  /// **'Resumed the interrupted conversion.'**
  String get batchResumed;

  /// No description provided for @converting.
  ///
  /// In en, this message translates to:
  /// **'Converting…'**
  String get converting;

  /// No description provided for @cancelBatch.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get cancelBatch;

  /// No description provided for @cancelJob.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelJob;

  /// No description provided for @clearFinished.
  ///
  /// In en, this message translates to:
  /// **'Clear finished'**
  String get clearFinished;

  /// No description provided for @removeJob.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeJob;

  /// No description provided for @shareFile.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareFile;

  /// No description provided for @retryJob.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryJob;

  /// No description provided for @queueEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'The queue is empty'**
  String get queueEmptyTitle;

  /// No description provided for @queueEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Files you add on the Convert tab appear here.'**
  String get queueEmptyBody;

  /// No description provided for @queueActiveTab.
  ///
  /// In en, this message translates to:
  /// **'Active · {count}'**
  String queueActiveTab(int count);

  /// No description provided for @queueFinishedTab.
  ///
  /// In en, this message translates to:
  /// **'Finished · {count}'**
  String queueFinishedTab(int count);

  /// No description provided for @queueNoActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing in progress'**
  String get queueNoActiveTitle;

  /// No description provided for @queueNoActiveBody.
  ///
  /// In en, this message translates to:
  /// **'Files waiting or converting show up here.'**
  String get queueNoActiveBody;

  /// No description provided for @queueNoFinishedTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing finished yet'**
  String get queueNoFinishedTitle;

  /// No description provided for @queueNoFinishedBody.
  ///
  /// In en, this message translates to:
  /// **'Converted files land here, ready to open, save or share.'**
  String get queueNoFinishedBody;

  /// No description provided for @statusQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get statusQueued;

  /// No description provided for @statusRunning.
  ///
  /// In en, this message translates to:
  /// **'Converting'**
  String get statusRunning;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get statusCompleted;

  /// No description provided for @statusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get statusFailed;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @batchSummary.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} done'**
  String batchSummary(int done, int total);

  /// No description provided for @batchCompleted.
  ///
  /// In en, this message translates to:
  /// **'{done, plural, =1{Converted 1 file} other{Converted {done} files}}'**
  String batchCompleted(int done);

  /// No description provided for @batchCompletedWithFailures.
  ///
  /// In en, this message translates to:
  /// **'Converted {done}, failed {failed}.'**
  String batchCompletedWithFailures(int done, int failed);

  /// No description provided for @savedPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% smaller'**
  String savedPercent(int percent);

  /// No description provided for @grewPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% larger'**
  String grewPercent(int percent);

  /// No description provided for @sizeChange.
  ///
  /// In en, this message translates to:
  /// **'{from} → {to}'**
  String sizeChange(String from, String to);

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyTitle;

  /// No description provided for @privacyBody.
  ///
  /// In en, this message translates to:
  /// **'Eluna Media converts your files entirely on this device using a bundled copy of FFmpeg. Your files never leave the device, no account is required, and there is no telemetry. Nothing in the app uses the network at all — it does not even hold the internet permission.\n\nMetadata removal is on by default, so EXIF, GPS coordinates and timestamps are dropped from the files you export.'**
  String get privacyBody;

  /// No description provided for @licenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Licensing'**
  String get licenseTitle;

  /// No description provided for @licenseBody.
  ///
  /// In en, this message translates to:
  /// **'This app bundles FFmpeg built with x264, x265 and other GPL components, so the application as a whole is distributed under the GNU GPL v3.'**
  String get licenseBody;

  /// No description provided for @formatUnsupportedForSource.
  ///
  /// In en, this message translates to:
  /// **'This format cannot hold the selected codec.'**
  String get formatUnsupportedForSource;

  /// No description provided for @sourceMissing.
  ///
  /// In en, this message translates to:
  /// **'The source file is no longer available.'**
  String get sourceMissing;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversion failed'**
  String get errorTitle;

  /// No description provided for @tabSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// No description provided for @introTitle.
  ///
  /// In en, this message translates to:
  /// **'Private by design'**
  String get introTitle;

  /// No description provided for @introOfflineTitle.
  ///
  /// In en, this message translates to:
  /// **'Converts on this device'**
  String get introOfflineTitle;

  /// No description provided for @introOfflineBody.
  ///
  /// In en, this message translates to:
  /// **'A bundled copy of FFmpeg does all the work. Your files never leave the phone — conversion works in airplane mode.'**
  String get introOfflineBody;

  /// No description provided for @introTelemetryTitle.
  ///
  /// In en, this message translates to:
  /// **'Zero telemetry'**
  String get introTelemetryTitle;

  /// No description provided for @introTelemetryBody.
  ///
  /// In en, this message translates to:
  /// **'No account, no analytics, no crash reporting. The app does not know who you are.'**
  String get introTelemetryBody;

  /// No description provided for @introMetadataTitle.
  ///
  /// In en, this message translates to:
  /// **'Metadata under control'**
  String get introMetadataTitle;

  /// No description provided for @introMetadataBody.
  ///
  /// In en, this message translates to:
  /// **'EXIF, GPS and timestamps are stripped from every output by default. You can turn that off.'**
  String get introMetadataBody;

  /// No description provided for @introFreeNote.
  ///
  /// In en, this message translates to:
  /// **'Free, with no ads, no subscriptions and no in-app purchases. Every feature, batch conversion included, is yours.'**
  String get introFreeNote;

  /// No description provided for @introContinue.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get introContinue;

  /// No description provided for @modeSimple.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get modeSimple;

  /// No description provided for @modeAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get modeAdvanced;

  /// No description provided for @modeAdvancedHint.
  ///
  /// In en, this message translates to:
  /// **'Show every codec, bitrate and transform control instead of the preset cards.'**
  String get modeAdvancedHint;

  /// No description provided for @presetCompressVideoTitle.
  ///
  /// In en, this message translates to:
  /// **'Compress video'**
  String get presetCompressVideoTitle;

  /// No description provided for @presetCompressVideoBody.
  ///
  /// In en, this message translates to:
  /// **'Much smaller MP4, quality stays good'**
  String get presetCompressVideoBody;

  /// No description provided for @presetFitToSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fit to size'**
  String get presetFitToSizeTitle;

  /// No description provided for @presetFitToSizeBody.
  ///
  /// In en, this message translates to:
  /// **'Hit an exact limit — Discord, email, chats'**
  String get presetFitToSizeBody;

  /// No description provided for @presetCompatibleMp4Title.
  ///
  /// In en, this message translates to:
  /// **'Compatible MP4'**
  String get presetCompatibleMp4Title;

  /// No description provided for @presetCompatibleMp4Body.
  ///
  /// In en, this message translates to:
  /// **'H.264 + AAC. Plays everywhere'**
  String get presetCompatibleMp4Body;

  /// No description provided for @presetExtractAudioTitle.
  ///
  /// In en, this message translates to:
  /// **'Extract audio'**
  String get presetExtractAudioTitle;

  /// No description provided for @presetExtractAudioBody.
  ///
  /// In en, this message translates to:
  /// **'MP3 out of any video'**
  String get presetExtractAudioBody;

  /// No description provided for @presetVideoToGifTitle.
  ///
  /// In en, this message translates to:
  /// **'Video to GIF'**
  String get presetVideoToGifTitle;

  /// No description provided for @presetVideoToGifBody.
  ///
  /// In en, this message translates to:
  /// **'Short clip into an animated GIF'**
  String get presetVideoToGifBody;

  /// No description provided for @presetMergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Merge videos'**
  String get presetMergeTitle;

  /// No description provided for @presetMergeBody.
  ///
  /// In en, this message translates to:
  /// **'Stitch clips into one MP4, in order'**
  String get presetMergeBody;

  /// No description provided for @mergeNeedsTwo.
  ///
  /// In en, this message translates to:
  /// **'Select at least two videos to merge.'**
  String get mergeNeedsTwo;

  /// No description provided for @mergedVideoName.
  ///
  /// In en, this message translates to:
  /// **'Merged video ({count} clips).mp4'**
  String mergedVideoName(int count);

  /// No description provided for @presetCompressImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Compress photo'**
  String get presetCompressImageTitle;

  /// No description provided for @presetCompressImageBody.
  ///
  /// In en, this message translates to:
  /// **'Smaller JPEG, hardly visible loss'**
  String get presetCompressImageBody;

  /// No description provided for @presetEnhancePhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'Enhance photo'**
  String get presetEnhancePhotoTitle;

  /// No description provided for @presetEnhancePhotoBody.
  ///
  /// In en, this message translates to:
  /// **'Cleaner, crisper, better colour'**
  String get presetEnhancePhotoBody;

  /// No description provided for @presetImageToWebpTitle.
  ///
  /// In en, this message translates to:
  /// **'Photo to WebP'**
  String get presetImageToWebpTitle;

  /// No description provided for @presetImageToWebpBody.
  ///
  /// In en, this message translates to:
  /// **'Modern format, smaller than JPEG'**
  String get presetImageToWebpBody;

  /// No description provided for @sizeTargetTitle.
  ///
  /// In en, this message translates to:
  /// **'Target size'**
  String get sizeTargetTitle;

  /// No description provided for @sizeTargetMb.
  ///
  /// In en, this message translates to:
  /// **'{mb} MB'**
  String sizeTargetMb(int mb);

  /// No description provided for @sizeTargetNamed.
  ///
  /// In en, this message translates to:
  /// **'{service} · {mb} MB'**
  String sizeTargetNamed(String service, int mb);

  /// No description provided for @sizeTargetCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom…'**
  String get sizeTargetCustom;

  /// No description provided for @sizeTargetDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Target size in MB'**
  String get sizeTargetDialogTitle;

  /// No description provided for @sizeTargetTooSmall.
  ///
  /// In en, this message translates to:
  /// **'The target is too small for this duration; the closest possible quality will be used.'**
  String get sizeTargetTooSmall;

  /// No description provided for @estimatePerFile.
  ///
  /// In en, this message translates to:
  /// **'≈ {size} per file'**
  String estimatePerFile(String size);

  /// No description provided for @estimateTotal.
  ///
  /// In en, this message translates to:
  /// **'Estimated output: ≈ {size}'**
  String estimateTotal(String size);

  /// No description provided for @selectedFiles.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 file selected} other{{count} files selected}}'**
  String selectedFiles(int count);

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearSelection;

  /// No description provided for @presetExpectsVideo.
  ///
  /// In en, this message translates to:
  /// **'This preset expects video files.'**
  String get presetExpectsVideo;

  /// No description provided for @presetExpectsImage.
  ///
  /// In en, this message translates to:
  /// **'This preset expects images.'**
  String get presetExpectsImage;

  /// No description provided for @promiseOffline.
  ///
  /// In en, this message translates to:
  /// **'100% offline conversion'**
  String get promiseOffline;

  /// No description provided for @promiseBatchFree.
  ///
  /// In en, this message translates to:
  /// **'Batch is free'**
  String get promiseBatchFree;

  /// No description provided for @promiseNoWatermark.
  ///
  /// In en, this message translates to:
  /// **'No watermark'**
  String get promiseNoWatermark;

  /// No description provided for @sectionTransform.
  ///
  /// In en, this message translates to:
  /// **'Transform'**
  String get sectionTransform;

  /// No description provided for @rotateLabel.
  ///
  /// In en, this message translates to:
  /// **'Rotate'**
  String get rotateLabel;

  /// No description provided for @flipLabel.
  ///
  /// In en, this message translates to:
  /// **'Mirror horizontally'**
  String get flipLabel;

  /// No description provided for @speedLabel.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get speedLabel;

  /// No description provided for @cropLabel.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get cropLabel;

  /// No description provided for @cropHint.
  ///
  /// In en, this message translates to:
  /// **'Centre crop to the chosen aspect ratio — square for feeds, 9:16 for stories.'**
  String get cropHint;

  /// No description provided for @volumeLabel.
  ///
  /// In en, this message translates to:
  /// **'Volume: {percent}%'**
  String volumeLabel(int percent);

  /// No description provided for @addAudioFiles.
  ///
  /// In en, this message translates to:
  /// **'Audio & other files'**
  String get addAudioFiles;

  /// No description provided for @hwEncoderLabel.
  ///
  /// In en, this message translates to:
  /// **'Hardware encoding'**
  String get hwEncoderLabel;

  /// No description provided for @hwEncoderHint.
  ///
  /// In en, this message translates to:
  /// **'Uses the device\'s video chip in bitrate and fit-to-size modes — much faster and cooler. Quality (CRF) mode always uses the precise software encoder, and a failed hardware job retries on software automatically.'**
  String get hwEncoderHint;

  /// No description provided for @transformNeedsReencode.
  ///
  /// In en, this message translates to:
  /// **'Rotation, mirror and speed require re-encoding, so they are off during a stream copy.'**
  String get transformNeedsReencode;

  /// No description provided for @capBitrateLabel.
  ///
  /// In en, this message translates to:
  /// **'Never make the file bigger'**
  String get capBitrateLabel;

  /// No description provided for @capBitrateHint.
  ///
  /// In en, this message translates to:
  /// **'Caps the encode at the source\'s own bitrate. Constant quality has no ceiling of its own, so an already-compressed video can otherwise come out larger.'**
  String get capBitrateHint;

  /// No description provided for @keepSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Keep subtitles'**
  String get keepSubtitles;

  /// No description provided for @keepSubtitlesHint.
  ///
  /// In en, this message translates to:
  /// **'Carries subtitle tracks into the output. Text subtitles only.'**
  String get keepSubtitlesHint;

  /// No description provided for @sectionTrim.
  ///
  /// In en, this message translates to:
  /// **'Trim'**
  String get sectionTrim;

  /// No description provided for @trimEnable.
  ///
  /// In en, this message translates to:
  /// **'Trim the source'**
  String get trimEnable;

  /// No description provided for @trimHint.
  ///
  /// In en, this message translates to:
  /// **'Available when exactly one file with a known duration is queued.'**
  String get trimHint;

  /// No description provided for @trimRangeLabel.
  ///
  /// In en, this message translates to:
  /// **'{from} – {to}'**
  String trimRangeLabel(String from, String to);

  /// No description provided for @rateControlSize.
  ///
  /// In en, this message translates to:
  /// **'Target size'**
  String get rateControlSize;

  /// No description provided for @lowBatteryTitle.
  ///
  /// In en, this message translates to:
  /// **'Battery is low'**
  String get lowBatteryTitle;

  /// No description provided for @lowBatteryBody.
  ///
  /// In en, this message translates to:
  /// **'Converting works the processor hard. You can plug in first, or continue anyway.'**
  String get lowBatteryBody;

  /// No description provided for @lowBatteryContinue.
  ///
  /// In en, this message translates to:
  /// **'Convert anyway'**
  String get lowBatteryContinue;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @filesReceived.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Received 1 file} other{Received {count} files}}'**
  String filesReceived(int count);

  /// No description provided for @saveFile.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveFile;

  /// No description provided for @savedToGallery.
  ///
  /// In en, this message translates to:
  /// **'Saved to the gallery, album “Eluna Media”.'**
  String get savedToGallery;

  /// No description provided for @savedToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads.'**
  String get savedToDownloads;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save the file.'**
  String get saveFailed;

  /// No description provided for @jobRemovedUndo.
  ///
  /// In en, this message translates to:
  /// **'Job removed.'**
  String get jobRemovedUndo;

  /// No description provided for @finishedClearedUndo.
  ///
  /// In en, this message translates to:
  /// **'Finished jobs cleared.'**
  String get finishedClearedUndo;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @errorDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Error details'**
  String get errorDetailsTitle;

  /// No description provided for @oledDark.
  ///
  /// In en, this message translates to:
  /// **'Pure black dark theme'**
  String get oledDark;

  /// No description provided for @oledDarkHint.
  ///
  /// In en, this message translates to:
  /// **'True black saves power on OLED screens.'**
  String get oledDarkHint;

  /// No description provided for @dynamicColorLabel.
  ///
  /// In en, this message translates to:
  /// **'System colors (Material You)'**
  String get dynamicColorLabel;

  /// No description provided for @dynamicColorHint.
  ///
  /// In en, this message translates to:
  /// **'Follow the device wallpaper palette where supported.'**
  String get dynamicColorHint;

  /// No description provided for @sectionConversionPrefs.
  ///
  /// In en, this message translates to:
  /// **'Conversion'**
  String get sectionConversionPrefs;

  /// No description provided for @powerModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Power mode'**
  String get powerModeLabel;

  /// No description provided for @powerEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Cool & fast'**
  String get powerEfficiency;

  /// No description provided for @powerBalanced.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get powerBalanced;

  /// No description provided for @powerQuality.
  ///
  /// In en, this message translates to:
  /// **'Max compression'**
  String get powerQuality;

  /// No description provided for @powerModeHint.
  ///
  /// In en, this message translates to:
  /// **'How hard the video encoder works. Cooler and faster means somewhat larger files. Nothing else is throttled — ever.'**
  String get powerModeHint;

  /// No description provided for @hapticsLabel.
  ///
  /// In en, this message translates to:
  /// **'Vibration feedback'**
  String get hapticsLabel;

  /// No description provided for @networkPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Network & privacy'**
  String get networkPrivacyTitle;

  /// No description provided for @netAuditIntro.
  ///
  /// In en, this message translates to:
  /// **'A complete list of everything in this app that can touch the network.'**
  String get netAuditIntro;

  /// No description provided for @netAuditNoneTitle.
  ///
  /// In en, this message translates to:
  /// **'No network access at all'**
  String get netAuditNoneTitle;

  /// No description provided for @netAuditNoneBody.
  ///
  /// In en, this message translates to:
  /// **'The app does not request the internet permission, so it cannot reach the network even if it tried — you can verify that in the system app info. No ads, no analytics, no update checks. “Rate the app” hands over to the store app, which does its own talking.'**
  String get netAuditNoneBody;

  /// No description provided for @netAuditConversionTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversion'**
  String get netAuditConversionTitle;

  /// No description provided for @netAuditConversionBody.
  ///
  /// In en, this message translates to:
  /// **'Runs entirely on this device through a bundled FFmpeg. Turn on airplane mode and convert — it works.'**
  String get netAuditConversionBody;

  /// No description provided for @netAuditTelemetryTitle.
  ///
  /// In en, this message translates to:
  /// **'Telemetry'**
  String get netAuditTelemetryTitle;

  /// No description provided for @netAuditTelemetryBody.
  ///
  /// In en, this message translates to:
  /// **'There is none. The app collects no analytics, no crash reports, no identifiers, and has no account system.'**
  String get netAuditTelemetryBody;

  /// No description provided for @sectionSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get sectionSupport;

  /// No description provided for @rateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get rateApp;

  /// No description provided for @openLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open source licenses'**
  String get openLicenses;

  /// No description provided for @errorFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorFallbackTitle;

  /// No description provided for @errorFallbackBody.
  ///
  /// In en, this message translates to:
  /// **'The app hit an unexpected error. Your queue and settings are safe — go back and try again.'**
  String get errorFallbackBody;

  /// No description provided for @presetAudioToMp3Title.
  ///
  /// In en, this message translates to:
  /// **'Convert audio'**
  String get presetAudioToMp3Title;

  /// No description provided for @presetAudioToMp3Body.
  ///
  /// In en, this message translates to:
  /// **'To MP3 — plays on anything'**
  String get presetAudioToMp3Body;

  /// No description provided for @presetCompressAudioTitle.
  ///
  /// In en, this message translates to:
  /// **'Compress audio'**
  String get presetCompressAudioTitle;

  /// No description provided for @presetCompressAudioBody.
  ///
  /// In en, this message translates to:
  /// **'Leaner AAC — voice notes, podcasts'**
  String get presetCompressAudioBody;

  /// No description provided for @convertTo.
  ///
  /// In en, this message translates to:
  /// **'Convert to'**
  String get convertTo;

  /// No description provided for @formatRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get formatRecommended;

  /// No description provided for @formatSectionHint.
  ///
  /// In en, this message translates to:
  /// **'Only formats your files can actually become are listed.'**
  String get formatSectionHint;

  /// No description provided for @sourceVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get sourceVideo;

  /// No description provided for @sourceImage.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get sourceImage;

  /// No description provided for @sourceAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get sourceAudio;

  /// No description provided for @sourceUnknown.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get sourceUnknown;

  /// No description provided for @mixedSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Different file types selected'**
  String get mixedSelectionTitle;

  /// No description provided for @mixedSelectionBody.
  ///
  /// In en, this message translates to:
  /// **'Each file is converted with the best preset for its own type. Add one kind at a time for full control.'**
  String get mixedSelectionBody;

  /// No description provided for @filesTitle.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get filesTitle;

  /// No description provided for @removeFile.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeFile;

  /// No description provided for @unknownDuration.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get unknownDuration;

  /// No description provided for @percentDone.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String percentDone(int percent);

  /// No description provided for @timeLeft.
  ///
  /// In en, this message translates to:
  /// **'≈ {time} left'**
  String timeLeft(String time);

  /// No description provided for @jobSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversion settings'**
  String get jobSettingsTitle;

  /// No description provided for @jobDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get jobDetails;

  /// No description provided for @summaryQuality.
  ///
  /// In en, this message translates to:
  /// **'CRF {value}'**
  String summaryQuality(int value);

  /// No description provided for @summaryBitrate.
  ///
  /// In en, this message translates to:
  /// **'{value} kbps'**
  String summaryBitrate(int value);

  /// No description provided for @summaryTargetSize.
  ///
  /// In en, this message translates to:
  /// **'≤ {size}'**
  String summaryTargetSize(String size);

  /// No description provided for @summaryTwoPass.
  ///
  /// In en, this message translates to:
  /// **'Two-pass'**
  String get summaryTwoPass;

  /// No description provided for @summaryEnhanced.
  ///
  /// In en, this message translates to:
  /// **'Enhanced'**
  String get summaryEnhanced;

  /// No description provided for @summaryMetadataStripped.
  ///
  /// In en, this message translates to:
  /// **'Metadata removed'**
  String get summaryMetadataStripped;

  /// No description provided for @summaryMerge.
  ///
  /// In en, this message translates to:
  /// **'{count} clips merged'**
  String summaryMerge(int count);

  /// No description provided for @rateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoying Eluna Media?'**
  String get rateDialogTitle;

  /// No description provided for @rateDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Tap a star. Your rating stays between you and the store.'**
  String get rateDialogBody;

  /// No description provided for @rateDialogLater.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get rateDialogLater;

  /// No description provided for @rateFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'What would make it better?'**
  String get rateFeedbackTitle;

  /// No description provided for @rateFeedbackBody.
  ///
  /// In en, this message translates to:
  /// **'Tell us what went wrong and we\'ll fix it. No account, no tracking — just an email you write yourself.'**
  String get rateFeedbackBody;

  /// No description provided for @rateSendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Write feedback'**
  String get rateSendFeedback;

  /// No description provided for @rateThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get rateThanks;

  /// No description provided for @feedbackSubject.
  ///
  /// In en, this message translates to:
  /// **'Eluna Media feedback ({stars}/5)'**
  String feedbackSubject(int stars);

  /// No description provided for @noEmailApp.
  ///
  /// In en, this message translates to:
  /// **'No email app is set up on this device.'**
  String get noEmailApp;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share the app'**
  String get shareApp;

  /// No description provided for @shareAppText.
  ///
  /// In en, this message translates to:
  /// **'Eluna Media — a free, fully offline photo, video and audio converter. No subscriptions, no watermarks, no accounts.'**
  String get shareAppText;

  /// No description provided for @appVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String appVersionLabel(String version);

  /// No description provided for @openFile.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openFile;

  /// No description provided for @openFolder.
  ///
  /// In en, this message translates to:
  /// **'Show folder'**
  String get openFolder;

  /// No description provided for @noAppToOpen.
  ///
  /// In en, this message translates to:
  /// **'No app on this device can open that file.'**
  String get noAppToOpen;

  /// No description provided for @openFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open the file.'**
  String get openFailed;

  /// No description provided for @twoPassLabel.
  ///
  /// In en, this message translates to:
  /// **'Two-pass for exact size'**
  String get twoPassLabel;

  /// No description provided for @twoPassHint.
  ///
  /// In en, this message translates to:
  /// **'Fit-to-size jobs encode twice and hit the byte budget noticeably more precisely — at roughly double the time and battery.'**
  String get twoPassHint;

  /// No description provided for @whatsNewTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get whatsNewTitle;

  /// No description provided for @whatsNew1.
  ///
  /// In en, this message translates to:
  /// **'Finished files now go straight to your gallery — and \"Save all\" takes a whole batch at once.'**
  String get whatsNew1;

  /// No description provided for @whatsNew2.
  ///
  /// In en, this message translates to:
  /// **'Fit a photo to an exact size — 100 KB to 2 MB, or a number you type.'**
  String get whatsNew2;

  /// No description provided for @whatsNew3.
  ///
  /// In en, this message translates to:
  /// **'The app no longer hoards gigabytes: Settings shows what it is holding and clears it.'**
  String get whatsNew3;

  /// No description provided for @whatsNew4.
  ///
  /// In en, this message translates to:
  /// **'Stop a conversion from the notification, and get a warning before the disk runs out.'**
  String get whatsNew4;

  /// No description provided for @whatsNew5.
  ///
  /// In en, this message translates to:
  /// **'Thumbnails, before/after comparison, GIF → MP4, exact trim times — and photo batches run several at once.'**
  String get whatsNew5;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @achievementsProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total}'**
  String achievementsProgress(int done, int total);

  /// No description provided for @achievementUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Achievement unlocked: {title}'**
  String achievementUnlocked(String title);

  /// No description provided for @achievementsPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'Counted on this device only. Nothing is uploaded anywhere.'**
  String get achievementsPrivacyNote;

  /// No description provided for @achFirstConversionTitle.
  ///
  /// In en, this message translates to:
  /// **'First steps'**
  String get achFirstConversionTitle;

  /// No description provided for @achFirstConversionBody.
  ///
  /// In en, this message translates to:
  /// **'Convert your first file.'**
  String get achFirstConversionBody;

  /// No description provided for @achTenConversionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Warmed up'**
  String get achTenConversionsTitle;

  /// No description provided for @achTenConversionsBody.
  ///
  /// In en, this message translates to:
  /// **'Convert 10 files.'**
  String get achTenConversionsBody;

  /// No description provided for @achFiftyConversionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get achFiftyConversionsTitle;

  /// No description provided for @achFiftyConversionsBody.
  ///
  /// In en, this message translates to:
  /// **'Convert 50 files.'**
  String get achFiftyConversionsBody;

  /// No description provided for @achTwoHundredConversionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Workhorse'**
  String get achTwoHundredConversionsTitle;

  /// No description provided for @achTwoHundredConversionsBody.
  ///
  /// In en, this message translates to:
  /// **'Convert 200 files.'**
  String get achTwoHundredConversionsBody;

  /// No description provided for @achThousandConversionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Conveyor'**
  String get achThousandConversionsTitle;

  /// No description provided for @achThousandConversionsBody.
  ///
  /// In en, this message translates to:
  /// **'Convert 1000 files.'**
  String get achThousandConversionsBody;

  /// No description provided for @achSaved100MbTitle.
  ///
  /// In en, this message translates to:
  /// **'Space saver'**
  String get achSaved100MbTitle;

  /// No description provided for @achSaved100MbBody.
  ///
  /// In en, this message translates to:
  /// **'Free up 100 MB in total.'**
  String get achSaved100MbBody;

  /// No description provided for @achSaved1GbTitle.
  ///
  /// In en, this message translates to:
  /// **'Gigabyte hunter'**
  String get achSaved1GbTitle;

  /// No description provided for @achSaved1GbBody.
  ///
  /// In en, this message translates to:
  /// **'Free up 1 GB in total.'**
  String get achSaved1GbBody;

  /// No description provided for @achSaved10GbTitle.
  ///
  /// In en, this message translates to:
  /// **'Storage hero'**
  String get achSaved10GbTitle;

  /// No description provided for @achSaved10GbBody.
  ///
  /// In en, this message translates to:
  /// **'Free up 10 GB in total.'**
  String get achSaved10GbBody;

  /// No description provided for @achBatchOfFiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Batch worker'**
  String get achBatchOfFiveTitle;

  /// No description provided for @achBatchOfFiveBody.
  ///
  /// In en, this message translates to:
  /// **'Finish a batch of 5 files or more.'**
  String get achBatchOfFiveBody;

  /// No description provided for @achBatchOfTwentyTitle.
  ///
  /// In en, this message translates to:
  /// **'Assembly line'**
  String get achBatchOfTwentyTitle;

  /// No description provided for @achBatchOfTwentyBody.
  ///
  /// In en, this message translates to:
  /// **'Finish a batch of 20 files or more.'**
  String get achBatchOfTwentyBody;

  /// No description provided for @achSniperTitle.
  ///
  /// In en, this message translates to:
  /// **'Sniper'**
  String get achSniperTitle;

  /// No description provided for @achSniperBody.
  ///
  /// In en, this message translates to:
  /// **'Hit an exact size with fit-to-size.'**
  String get achSniperBody;

  /// No description provided for @achMemeSmithTitle.
  ///
  /// In en, this message translates to:
  /// **'Meme smith'**
  String get achMemeSmithTitle;

  /// No description provided for @achMemeSmithBody.
  ///
  /// In en, this message translates to:
  /// **'Turn a video into a GIF.'**
  String get achMemeSmithBody;

  /// No description provided for @achSoundHunterTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound hunter'**
  String get achSoundHunterTitle;

  /// No description provided for @achSoundHunterBody.
  ///
  /// In en, this message translates to:
  /// **'Extract audio from a video.'**
  String get achSoundHunterBody;

  /// No description provided for @achSubtitleKeeperTitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitle keeper'**
  String get achSubtitleKeeperTitle;

  /// No description provided for @achSubtitleKeeperBody.
  ///
  /// In en, this message translates to:
  /// **'Convert a video with its subtitles kept.'**
  String get achSubtitleKeeperBody;

  /// No description provided for @achDirectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Director'**
  String get achDirectorTitle;

  /// No description provided for @achDirectorBody.
  ///
  /// In en, this message translates to:
  /// **'Apply a transform — rotate, crop, speed or volume.'**
  String get achDirectorBody;

  /// No description provided for @achAllRounderTitle.
  ///
  /// In en, this message translates to:
  /// **'All-rounder'**
  String get achAllRounderTitle;

  /// No description provided for @achAllRounderBody.
  ///
  /// In en, this message translates to:
  /// **'Convert video, audio and an image.'**
  String get achAllRounderBody;

  /// No description provided for @achNightOwlTitle.
  ///
  /// In en, this message translates to:
  /// **'Night owl'**
  String get achNightOwlTitle;

  /// No description provided for @achNightOwlBody.
  ///
  /// In en, this message translates to:
  /// **'Finish a conversion between midnight and 5 AM.'**
  String get achNightOwlBody;

  /// No description provided for @achPlatinumTitle.
  ///
  /// In en, this message translates to:
  /// **'Platinum'**
  String get achPlatinumTitle;

  /// No description provided for @achPlatinumBody.
  ///
  /// In en, this message translates to:
  /// **'Earn every other achievement.'**
  String get achPlatinumBody;

  /// No description provided for @storageTitle.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storageTitle;

  /// No description provided for @storageBody.
  ///
  /// In en, this message translates to:
  /// **'Converted files stay inside the app until you save or share them, where no file manager can reach them.'**
  String get storageBody;

  /// No description provided for @storageEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing stored'**
  String get storageEmpty;

  /// No description provided for @storageUsage.
  ///
  /// In en, this message translates to:
  /// **'Stored: {size}'**
  String storageUsage(String size);

  /// No description provided for @storageClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear stored files?'**
  String get storageClearTitle;

  /// No description provided for @storageClearBody.
  ///
  /// In en, this message translates to:
  /// **'Deletes every finished result the app is still holding. Files you already saved or shared are untouched.'**
  String get storageClearBody;

  /// No description provided for @storageClearAction.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get storageClearAction;

  /// No description provided for @storageCleared.
  ///
  /// In en, this message translates to:
  /// **'Freed {size}'**
  String storageCleared(String size);

  /// No description provided for @autoSaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Save results automatically'**
  String get autoSaveLabel;

  /// No description provided for @autoSaveHint.
  ///
  /// In en, this message translates to:
  /// **'Puts each finished file in the gallery — audio in Downloads — as soon as it is ready.'**
  String get autoSaveHint;

  /// No description provided for @lowSpaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Not much room left'**
  String get lowSpaceTitle;

  /// No description provided for @lowSpaceBody.
  ///
  /// In en, this message translates to:
  /// **'This batch needs about {needed} and only {free} is free. The conversion may stop part-way.'**
  String lowSpaceBody(String needed, String free);

  /// No description provided for @saveAll.
  ///
  /// In en, this message translates to:
  /// **'Save all ({count})'**
  String saveAll(int count);

  /// No description provided for @savedAll.
  ///
  /// In en, this message translates to:
  /// **'Saved: {count}'**
  String savedAll(int count);

  /// No description provided for @savedSome.
  ///
  /// In en, this message translates to:
  /// **'Saved {saved} of {total}'**
  String savedSome(int saved, int total);

  /// No description provided for @presetFitPhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'Fit photo to size'**
  String get presetFitPhotoTitle;

  /// No description provided for @presetFitPhotoBody.
  ///
  /// In en, this message translates to:
  /// **'Squeeze a picture under an exact limit — upload forms, applications.'**
  String get presetFitPhotoBody;

  /// No description provided for @photoFitHint.
  ///
  /// In en, this message translates to:
  /// **'The app tries qualities until one fits. If the budget is too small for the picture, it reduces the frame size as well.'**
  String get photoFitHint;

  /// No description provided for @sizeTargetKb.
  ///
  /// In en, this message translates to:
  /// **'{kb} KB'**
  String sizeTargetKb(int kb);

  /// No description provided for @sizeTargetDialogTitleKb.
  ///
  /// In en, this message translates to:
  /// **'Target size in KB'**
  String get sizeTargetDialogTitleKb;

  /// No description provided for @compareAction.
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compareAction;

  /// No description provided for @compareBefore.
  ///
  /// In en, this message translates to:
  /// **'Before'**
  String get compareBefore;

  /// No description provided for @compareAfter.
  ///
  /// In en, this message translates to:
  /// **'After'**
  String get compareAfter;

  /// No description provided for @compareHint.
  ///
  /// In en, this message translates to:
  /// **'Press and hold to see the original.'**
  String get compareHint;

  /// No description provided for @trimStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get trimStart;

  /// No description provided for @trimEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get trimEnd;

  /// No description provided for @trimTimeHelp.
  ///
  /// In en, this message translates to:
  /// **'m:ss, up to {duration}'**
  String trimTimeHelp(String duration);

  /// No description provided for @imageScaleLabel.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get imageScaleLabel;

  /// No description provided for @audioChannelsLabel.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get audioChannelsLabel;

  /// No description provided for @audioMono.
  ///
  /// In en, this message translates to:
  /// **'Mono'**
  String get audioMono;

  /// No description provided for @audioStereo.
  ///
  /// In en, this message translates to:
  /// **'Stereo'**
  String get audioStereo;

  /// No description provided for @sampleRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Sample rate'**
  String get sampleRateLabel;

  /// No description provided for @voiceAudioHint.
  ///
  /// In en, this message translates to:
  /// **'Mono at 22.05 kHz roughly quarters a voice recording with no audible loss. Leave both original for music.'**
  String get voiceAudioHint;

  /// No description provided for @moveUp.
  ///
  /// In en, this message translates to:
  /// **'Move up'**
  String get moveUp;

  /// No description provided for @moveDown.
  ///
  /// In en, this message translates to:
  /// **'Move down'**
  String get moveDown;

  /// No description provided for @renameOutput.
  ///
  /// In en, this message translates to:
  /// **'Rename result'**
  String get renameOutput;

  /// No description provided for @renameOutputHint.
  ///
  /// In en, this message translates to:
  /// **'New name'**
  String get renameOutputHint;

  /// No description provided for @renameOutputHelp.
  ///
  /// In en, this message translates to:
  /// **'The extension comes from the output format. Leave it empty to name the result after the source.'**
  String get renameOutputHelp;

  /// No description provided for @deleteOriginalsAction.
  ///
  /// In en, this message translates to:
  /// **'Delete originals ({count})'**
  String deleteOriginalsAction(int count);

  /// No description provided for @deleteOriginalsAuto.
  ///
  /// In en, this message translates to:
  /// **'Delete originals after converting'**
  String get deleteOriginalsAuto;

  /// No description provided for @deleteOriginalsHint.
  ///
  /// In en, this message translates to:
  /// **'Asks the system to remove the source files once the result has been saved. The system always shows what will go and waits for your confirmation.'**
  String get deleteOriginalsHint;

  /// No description provided for @originalsDeleted.
  ///
  /// In en, this message translates to:
  /// **'Originals deleted — {size} freed'**
  String originalsDeleted(String size);

  /// No description provided for @originalsNoneDeleted.
  ///
  /// In en, this message translates to:
  /// **'Nothing was deleted. Only files the gallery still holds under their original name can be found.'**
  String get originalsNoneDeleted;

  /// No description provided for @reclaimedTotal.
  ///
  /// In en, this message translates to:
  /// **'Freed with this app: {size}'**
  String reclaimedTotal(String size);
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'pl',
    'pt',
    'ru',
    'tr',
    'uk',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return L10nDe();
    case 'en':
      return L10nEn();
    case 'es':
      return L10nEs();
    case 'fr':
      return L10nFr();
    case 'hi':
      return L10nHi();
    case 'id':
      return L10nId();
    case 'it':
      return L10nIt();
    case 'ja':
      return L10nJa();
    case 'ko':
      return L10nKo();
    case 'pl':
      return L10nPl();
    case 'pt':
      return L10nPt();
    case 'ru':
      return L10nRu();
    case 'tr':
      return L10nTr();
    case 'uk':
      return L10nUk();
    case 'zh':
      return L10nZh();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
