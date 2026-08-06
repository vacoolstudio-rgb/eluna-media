// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Convert';

  @override
  String get tabQueue => 'Queue';

  @override
  String get addFiles => 'Add files';

  @override
  String get emptySelectionTitle => 'No files yet';

  @override
  String get emptySelectionBody =>
      'Add photos, videos or audio. Everything is processed on this device.';

  @override
  String get sectionOutput => 'Output';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Image';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Video codec';

  @override
  String get audioCodec => 'Audio codec';

  @override
  String get rateControl => 'Rate control';

  @override
  String get rateControlQuality => 'Constant quality (CRF)';

  @override
  String get rateControlBitrate => 'Target bitrate';

  @override
  String crfLabel(int value) {
    return 'Quality (CRF $value)';
  }

  @override
  String get crfHint => 'Lower is better quality and a larger file.';

  @override
  String videoBitrate(int value) {
    return 'Video bitrate: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Audio bitrate: $value kbps';
  }

  @override
  String get encodingPreset => 'Encoder preset';

  @override
  String get encodingPresetHint =>
      'Slower presets compress better but heat the device more.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Resolution';

  @override
  String get frameRate => 'Frame rate';

  @override
  String imageQuality(int value) {
    return 'Quality: $value';
  }

  @override
  String get lossless => 'Lossless';

  @override
  String get losslessHint => 'Larger files, pixel-perfect output.';

  @override
  String get sectionEnhance => 'Enhancement';

  @override
  String get sharpenLabel => 'Sharpness';

  @override
  String get sharpenHint =>
      'Makes edges crisper. It cannot recover a blurred or out-of-focus shot — that detail is not in the file.';

  @override
  String get sharpenStrongHint =>
      'Strong sharpening can leave bright halos along edges. Try medium first.';

  @override
  String get denoiseLabel => 'Noise reduction';

  @override
  String get denoiseHint =>
      'Cleans up grain in dark and night photos. Too much smooths away fine detail.';

  @override
  String get autoColorLabel => 'Auto colour and levels';

  @override
  String get autoColorHint =>
      'Stretches contrast and lifts flat colours a little.';

  @override
  String get upscaleLabel => 'Upscale 2×';

  @override
  String get upscaleHint =>
      'Doubles the width and height. It does not add detail — it helps when printing or cropping.';

  @override
  String get upscaleConflictHint =>
      'Set Resolution back to Original to upscale.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Off';

  @override
  String get enhanceLight => 'Light';

  @override
  String get enhanceMedium => 'Medium';

  @override
  String get enhanceStrong => 'Strong';

  @override
  String get stripMetadata => 'Remove metadata';

  @override
  String get stripMetadataHint =>
      'Strips EXIF, GPS and timestamps from the output.';

  @override
  String startConversion(int count) {
    return 'Convert $count files';
  }

  @override
  String get batchResumed => 'Resumed the interrupted conversion.';

  @override
  String get converting => 'Converting…';

  @override
  String get cancelBatch => 'Stop';

  @override
  String get cancelJob => 'Cancel';

  @override
  String get clearFinished => 'Clear finished';

  @override
  String get removeJob => 'Remove';

  @override
  String get shareFile => 'Share';

  @override
  String get retryJob => 'Retry';

  @override
  String get queueEmptyTitle => 'The queue is empty';

  @override
  String get queueEmptyBody => 'Files you add on the Convert tab appear here.';

  @override
  String queueActiveTab(int count) {
    return 'Active · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Finished · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nothing in progress';

  @override
  String get queueNoActiveBody => 'Files waiting or converting show up here.';

  @override
  String get queueNoFinishedTitle => 'Nothing finished yet';

  @override
  String get queueNoFinishedBody =>
      'Converted files land here, ready to open, save or share.';

  @override
  String get statusQueued => 'Queued';

  @override
  String get statusRunning => 'Converting';

  @override
  String get statusCompleted => 'Done';

  @override
  String get statusFailed => 'Failed';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String batchSummary(int done, int total) {
    return '$done of $total done';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Converted $done files',
      one: 'Converted 1 file',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Converted $done, failed $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% smaller';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% larger';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Appearance';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyBody =>
      'Eluna Media converts your files entirely on this device using a bundled copy of FFmpeg. Your files never leave the device, no account is required, and there is no telemetry. Nothing in the app uses the network at all — it does not even hold the internet permission.\n\nMetadata removal is on by default, so EXIF, GPS coordinates and timestamps are dropped from the files you export.';

  @override
  String get licenseTitle => 'Licensing';

  @override
  String get licenseBody =>
      'This app bundles FFmpeg built with x264, x265 and other GPL components, so the application as a whole is distributed under the GNU GPL v3.';

  @override
  String get sourceMissing => 'The source file is no longer available.';

  @override
  String get tabSettings => 'Settings';

  @override
  String get introTitle => 'Private by design';

  @override
  String get introOfflineTitle => 'Converts on this device';

  @override
  String get introOfflineBody =>
      'A bundled copy of FFmpeg does all the work. Your files never leave the phone — conversion works in airplane mode.';

  @override
  String get introTelemetryTitle => 'Zero telemetry';

  @override
  String get introTelemetryBody =>
      'No account, no analytics, no crash reporting. The app does not know who you are.';

  @override
  String get introMetadataTitle => 'Metadata under control';

  @override
  String get introMetadataBody =>
      'EXIF, GPS and timestamps are stripped from every output by default. You can turn that off.';

  @override
  String get introFreeNote =>
      'Free, with no ads, no subscriptions and no in-app purchases. Every feature, batch conversion included, is yours.';

  @override
  String get introContinue => 'Get started';

  @override
  String get modeSimple => 'Simple';

  @override
  String get modeAdvanced => 'Advanced';

  @override
  String get modeAdvancedHint =>
      'Show every codec, bitrate and transform control instead of the preset cards.';

  @override
  String get presetCompressVideoTitle => 'Compress video';

  @override
  String get presetCompressVideoBody => 'Much smaller MP4, quality stays good';

  @override
  String get presetFitToSizeTitle => 'Fit to size';

  @override
  String get presetFitToSizeBody =>
      'Hit an exact limit — Discord, email, chats';

  @override
  String get presetCompatibleMp4Title => 'Compatible MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Plays everywhere';

  @override
  String get presetExtractAudioTitle => 'Extract audio';

  @override
  String get presetExtractAudioBody => 'MP3 out of any video';

  @override
  String get presetVideoToGifTitle => 'Video to GIF';

  @override
  String get presetVideoToGifBody => 'Short clip into an animated GIF';

  @override
  String get presetMergeTitle => 'Merge videos';

  @override
  String get presetMergeBody => 'Stitch clips into one MP4, in order';

  @override
  String get mergeNeedsTwo => 'Select at least two videos to merge.';

  @override
  String mergedVideoName(int count) {
    return 'Merged video ($count clips).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Compress photo';

  @override
  String get presetCompressImageBody => 'Smaller JPEG, hardly visible loss';

  @override
  String get presetEnhancePhotoTitle => 'Enhance photo';

  @override
  String get presetEnhancePhotoBody => 'Cleaner, crisper, better colour';

  @override
  String get presetImageToWebpTitle => 'Photo to WebP';

  @override
  String get presetImageToWebpBody => 'Modern format, smaller than JPEG';

  @override
  String get sizeTargetTitle => 'Target size';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Custom…';

  @override
  String get sizeTargetDialogTitle => 'Target size in MB';

  @override
  String get sizeTargetTooSmall =>
      'The target is too small for this duration; the closest possible quality will be used.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per file';
  }

  @override
  String estimateTotal(String size) {
    return 'Estimated output: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files selected',
      one: '1 file selected',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% offline conversion';

  @override
  String get promiseBatchFree => 'Batch is free';

  @override
  String get promiseNoWatermark => 'No watermark';

  @override
  String get sectionTransform => 'Transform';

  @override
  String get rotateLabel => 'Rotate';

  @override
  String get flipLabel => 'Mirror horizontally';

  @override
  String get speedLabel => 'Speed';

  @override
  String get cropLabel => 'Crop';

  @override
  String get cropHint =>
      'Centre crop to the chosen aspect ratio — square for feeds, 9:16 for stories.';

  @override
  String volumeLabel(int percent) {
    return 'Volume: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio & other files';

  @override
  String get hwEncoderLabel => 'Hardware encoding';

  @override
  String get hwEncoderHint =>
      'Uses the device\'s video chip in bitrate and fit-to-size modes — much faster and cooler. Quality (CRF) mode always uses the precise software encoder, and a failed hardware job retries on software automatically.';

  @override
  String get transformNeedsReencode =>
      'Rotation, mirror and speed require re-encoding, so they are off during a stream copy.';

  @override
  String get capBitrateLabel => 'Never make the file bigger';

  @override
  String get capBitrateHint =>
      'Caps the encode at the source\'s own bitrate. Constant quality has no ceiling of its own, so an already-compressed video can otherwise come out larger.';

  @override
  String get keepSubtitles => 'Keep subtitles';

  @override
  String get keepSubtitlesHint =>
      'Carries subtitle tracks into the output. Text subtitles only.';

  @override
  String get sectionTrim => 'Trim';

  @override
  String get trimEnable => 'Trim the source';

  @override
  String get trimHint =>
      'Available when exactly one file with a known duration is queued.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Target size';

  @override
  String get lowBatteryTitle => 'Battery is low';

  @override
  String get lowBatteryBody =>
      'Converting works the processor hard. You can plug in first, or continue anyway.';

  @override
  String get lowBatteryContinue => 'Convert anyway';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Received $count files',
      one: 'Received 1 file',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Save';

  @override
  String get savedToGallery => 'Saved to the gallery, album “Eluna Media”.';

  @override
  String get savedToDownloads => 'Saved to Downloads.';

  @override
  String get saveFailed => 'Could not save the file.';

  @override
  String get jobRemovedUndo => 'Job removed.';

  @override
  String get finishedClearedUndo => 'Finished jobs cleared.';

  @override
  String get undo => 'Undo';

  @override
  String get errorDetailsTitle => 'Error details';

  @override
  String get oledDark => 'Pure black dark theme';

  @override
  String get oledDarkHint => 'True black saves power on OLED screens.';

  @override
  String get dynamicColorLabel => 'System colors (Material You)';

  @override
  String get dynamicColorHint =>
      'Follow the device wallpaper palette where supported.';

  @override
  String get sectionConversionPrefs => 'Conversion';

  @override
  String get powerModeLabel => 'Power mode';

  @override
  String get powerEfficiency => 'Cool & fast';

  @override
  String get powerBalanced => 'Balanced';

  @override
  String get powerQuality => 'Max compression';

  @override
  String get powerModeHint =>
      'How hard the video encoder works. Cooler and faster means somewhat larger files. Nothing else is throttled — ever.';

  @override
  String get hapticsLabel => 'Vibration feedback';

  @override
  String get networkPrivacyTitle => 'Network & privacy';

  @override
  String get netAuditIntro =>
      'A complete list of everything in this app that can touch the network.';

  @override
  String get netAuditNoneTitle => 'No network access at all';

  @override
  String get netAuditNoneBody =>
      'The app does not request the internet permission, so it cannot reach the network even if it tried — you can verify that in the system app info. No ads, no analytics, no update checks. “Rate the app” hands over to the store app, which does its own talking.';

  @override
  String get netAuditConversionTitle => 'Conversion';

  @override
  String get netAuditConversionBody =>
      'Runs entirely on this device through a bundled FFmpeg. Turn on airplane mode and convert — it works.';

  @override
  String get netAuditTelemetryTitle => 'Telemetry';

  @override
  String get netAuditTelemetryBody =>
      'There is none. The app collects no analytics, no crash reports, no identifiers, and has no account system.';

  @override
  String get sectionSupport => 'Support';

  @override
  String get rateApp => 'Rate the app';

  @override
  String get openLicenses => 'Open source licenses';

  @override
  String get presetAudioToMp3Title => 'Convert audio';

  @override
  String get presetAudioToMp3Body => 'To MP3 — plays on anything';

  @override
  String get presetCompressAudioTitle => 'Compress audio';

  @override
  String get presetCompressAudioBody => 'Leaner AAC — voice notes, podcasts';

  @override
  String get convertTo => 'Convert to';

  @override
  String get formatSectionHint =>
      'Only formats your files can actually become are listed.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Photo';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'File';

  @override
  String get mixedSelectionTitle => 'Different file types selected';

  @override
  String get mixedSelectionBody =>
      'Each file is converted with the best preset for its own type. Add one kind at a time for full control.';

  @override
  String get filesTitle => 'Files';

  @override
  String get removeFile => 'Remove';

  @override
  String timeLeft(String time) {
    return '≈ $time left';
  }

  @override
  String get jobSettingsTitle => 'Conversion settings';

  @override
  String get jobDetails => 'Details';

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
  String get summaryEnhanced => 'Enhanced';

  @override
  String get summaryMetadataStripped => 'Metadata removed';

  @override
  String summaryMerge(int count) {
    return '$count clips merged';
  }

  @override
  String get shareApp => 'Share the app';

  @override
  String get shareAppText =>
      'Eluna Media — a free, fully offline photo, video and audio converter. No subscriptions, no watermarks, no accounts.';

  @override
  String appVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get openFile => 'Open';

  @override
  String get openFolder => 'Show folder';

  @override
  String get noAppToOpen => 'No app on this device can open that file.';

  @override
  String get openFailed => 'Could not open the file.';

  @override
  String get twoPassLabel => 'Two-pass for exact size';

  @override
  String get twoPassHint =>
      'Fit-to-size jobs encode twice and hit the byte budget noticeably more precisely — at roughly double the time and battery.';

  @override
  String get whatsNewTitle => 'What\'s new';

  @override
  String get whatsNew1 =>
      'Finished files now go straight to your gallery — and \"Save all\" takes a whole batch at once.';

  @override
  String get whatsNew2 =>
      'Fit a photo to an exact size — 100 KB to 2 MB, or a number you type.';

  @override
  String get whatsNew3 =>
      'The app no longer hoards gigabytes: Settings shows what it is holding and clears it.';

  @override
  String get whatsNew4 =>
      'Stop a conversion from the notification, and get a warning before the disk runs out.';

  @override
  String get whatsNew5 =>
      'Thumbnails, before/after comparison, GIF → MP4, exact trim times — and photo batches run several at once.';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String achievementsProgress(int done, int total) {
    return '$done of $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Achievement unlocked: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Counted on this device only. Nothing is uploaded anywhere.';

  @override
  String get achFirstConversionTitle => 'First steps';

  @override
  String get achFirstConversionBody => 'Convert your first file.';

  @override
  String get achTenConversionsTitle => 'Warmed up';

  @override
  String get achTenConversionsBody => 'Convert 10 files.';

  @override
  String get achFiftyConversionsTitle => 'Regular';

  @override
  String get achFiftyConversionsBody => 'Convert 50 files.';

  @override
  String get achTwoHundredConversionsTitle => 'Workhorse';

  @override
  String get achTwoHundredConversionsBody => 'Convert 200 files.';

  @override
  String get achThousandConversionsTitle => 'Conveyor';

  @override
  String get achThousandConversionsBody => 'Convert 1000 files.';

  @override
  String get achSaved100MbTitle => 'Space saver';

  @override
  String get achSaved100MbBody => 'Free up 100 MB in total.';

  @override
  String get achSaved1GbTitle => 'Gigabyte hunter';

  @override
  String get achSaved1GbBody => 'Free up 1 GB in total.';

  @override
  String get achSaved10GbTitle => 'Storage hero';

  @override
  String get achSaved10GbBody => 'Free up 10 GB in total.';

  @override
  String get achBatchOfFiveTitle => 'Batch worker';

  @override
  String get achBatchOfFiveBody => 'Finish a batch of 5 files or more.';

  @override
  String get achBatchOfTwentyTitle => 'Assembly line';

  @override
  String get achBatchOfTwentyBody => 'Finish a batch of 20 files or more.';

  @override
  String get achSniperTitle => 'Sniper';

  @override
  String get achSniperBody => 'Hit an exact size with fit-to-size.';

  @override
  String get achMemeSmithTitle => 'Meme smith';

  @override
  String get achMemeSmithBody => 'Turn a video into a GIF.';

  @override
  String get achSoundHunterTitle => 'Sound hunter';

  @override
  String get achSoundHunterBody => 'Extract audio from a video.';

  @override
  String get achSubtitleKeeperTitle => 'Subtitle keeper';

  @override
  String get achSubtitleKeeperBody =>
      'Convert a video with its subtitles kept.';

  @override
  String get achDirectorTitle => 'Director';

  @override
  String get achDirectorBody =>
      'Apply a transform — rotate, crop, speed or volume.';

  @override
  String get achAllRounderTitle => 'All-rounder';

  @override
  String get achAllRounderBody => 'Convert video, audio and an image.';

  @override
  String get achNightOwlTitle => 'Night owl';

  @override
  String get achNightOwlBody =>
      'Finish a conversion between midnight and 5 AM.';

  @override
  String get achPlatinumTitle => 'Platinum';

  @override
  String get achPlatinumBody => 'Earn every other achievement.';

  @override
  String get storageTitle => 'Storage';

  @override
  String get storageBody =>
      'Converted files stay inside the app until you save or share them, where no file manager can reach them.';

  @override
  String get storageEmpty => 'Nothing stored';

  @override
  String storageUsage(String size) {
    return 'Stored: $size';
  }

  @override
  String get storageClearTitle => 'Clear stored files?';

  @override
  String get storageClearBody =>
      'Deletes every finished result the app is still holding. Files you already saved or shared are untouched.';

  @override
  String get storageClearAction => 'Clear';

  @override
  String storageCleared(String size) {
    return 'Freed $size';
  }

  @override
  String get autoSaveLabel => 'Save results automatically';

  @override
  String get autoSaveHint =>
      'Puts each finished file in the gallery — audio in Downloads — as soon as it is ready.';

  @override
  String get lowSpaceTitle => 'Not much room left';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'This batch needs about $needed and only $free is free. The conversion may stop part-way.';
  }

  @override
  String saveAll(int count) {
    return 'Save all ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Saved: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Saved $saved of $total';
  }

  @override
  String get presetFitPhotoTitle => 'Fit photo to size';

  @override
  String get presetFitPhotoBody =>
      'Squeeze a picture under an exact limit — upload forms, applications.';

  @override
  String get photoFitHint =>
      'The app tries qualities until one fits. If the budget is too small for the picture, it reduces the frame size as well.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Target size in KB';

  @override
  String get compareAction => 'Compare';

  @override
  String get compareBefore => 'Before';

  @override
  String get compareAfter => 'After';

  @override
  String get compareHint => 'Press and hold to see the original.';

  @override
  String get trimStart => 'Start';

  @override
  String get trimEnd => 'End';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, up to $duration';
  }

  @override
  String get imageScaleLabel => 'Scale';

  @override
  String get audioChannelsLabel => 'Channels';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Sample rate';

  @override
  String get voiceAudioHint =>
      'Mono at 22.05 kHz roughly quarters a voice recording with no audible loss. Leave both original for music.';

  @override
  String get moveUp => 'Move up';

  @override
  String get moveDown => 'Move down';

  @override
  String get renameOutput => 'Rename result';

  @override
  String get renameOutputHint => 'New name';

  @override
  String get renameOutputHelp =>
      'The extension comes from the output format. Leave it empty to name the result after the source.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Delete originals ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Delete originals after converting';

  @override
  String get deleteOriginalsHint =>
      'Asks the system to remove the source files once the result has been saved. The system always shows what will go and waits for your confirmation.';

  @override
  String originalsDeleted(String size) {
    return 'Originals deleted — $size freed';
  }

  @override
  String get originalsNoneDeleted =>
      'Nothing was deleted. Only files the gallery still holds under their original name can be found.';

  @override
  String reclaimedTotal(String size) {
    return 'Freed with this app: $size';
  }

  @override
  String get deleteAllData => 'Delete all data';

  @override
  String get deleteAllDataHint =>
      'Erases everything the app keeps on this device: the queue, converted files, previews, achievements and settings. Files you have already saved to your gallery are left alone.';
}
