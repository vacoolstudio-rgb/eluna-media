// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class L10nZh extends L10n {
  L10nZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => '转换';

  @override
  String get tabQueue => '队列';

  @override
  String get tabAbout => '关于';

  @override
  String get addFiles => '添加文件';

  @override
  String get emptySelectionTitle => '还没有文件';

  @override
  String get emptySelectionBody => '添加照片、视频或音频，一切都在本机处理。';

  @override
  String get sectionOutput => '输出';

  @override
  String get sectionVideo => '视频';

  @override
  String get sectionAudio => '音频';

  @override
  String get sectionImage => '图片';

  @override
  String get sectionPrivacy => '隐私';

  @override
  String get outputFormat => '格式';

  @override
  String get videoCodec => '视频编码';

  @override
  String get audioCodec => '音频编码';

  @override
  String get rateControl => '码率控制';

  @override
  String get rateControlQuality => '恒定质量 (CRF)';

  @override
  String get rateControlBitrate => '目标码率';

  @override
  String crfLabel(int value) {
    return '质量 (CRF $value)';
  }

  @override
  String get crfHint => '数值越低，质量越好，文件越大。';

  @override
  String videoBitrate(int value) {
    return '视频码率：$value kbps';
  }

  @override
  String audioBitrate(int value) {
    return '音频码率：$value kbps';
  }

  @override
  String get encodingPreset => '编码器预设';

  @override
  String get encodingPresetHint => '越慢的预设压缩效果越好，但设备发热越明显。';

  @override
  String get presetOriginal => '原始';

  @override
  String get resolution => '分辨率';

  @override
  String get frameRate => '帧率';

  @override
  String imageQuality(int value) {
    return '质量：$value';
  }

  @override
  String get lossless => '无损';

  @override
  String get losslessHint => '文件更大，画质逐像素还原。';

  @override
  String get sectionEnhance => '增强';

  @override
  String get sharpenLabel => '锐化';

  @override
  String get sharpenHint => '让边缘更清晰。但救不回糊掉或跑焦的照片——那些细节本来就不在文件里。';

  @override
  String get sharpenStrongHint => '锐化过强会在边缘留下明亮的白边。建议先从“中”开始。';

  @override
  String get denoiseLabel => '降噪';

  @override
  String get denoiseHint => '清理暗光和夜景照片里的噪点。过度降噪会把细节一起抹平。';

  @override
  String get autoColorLabel => '自动色彩与色阶';

  @override
  String get autoColorHint => '拉开对比度，让发灰的颜色稍微鲜活一些。';

  @override
  String get upscaleLabel => '放大 2×';

  @override
  String get upscaleHint => '把宽和高各放大一倍。不会增加细节——打印或裁剪时会派上用场。';

  @override
  String get upscaleConflictHint => '要放大，请先把“分辨率”改回“原始”。';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => '关';

  @override
  String get enhanceLight => '弱';

  @override
  String get enhanceMedium => '中';

  @override
  String get enhanceStrong => '强';

  @override
  String get stripMetadata => '移除元数据';

  @override
  String get stripMetadataHint => '从输出中去除 EXIF、GPS 和时间戳。';

  @override
  String startConversion(int count) {
    return '转换 $count 个文件';
  }

  @override
  String get batchResumed => '已恢复被中断的转换。';

  @override
  String get converting => '转换中…';

  @override
  String get cancelBatch => '停止';

  @override
  String get cancelJob => '取消';

  @override
  String get clearFinished => '清除已完成';

  @override
  String get removeJob => '移除';

  @override
  String get shareFile => '分享';

  @override
  String get retryJob => '重试';

  @override
  String get queueEmptyTitle => '队列为空';

  @override
  String get queueEmptyBody => '在“转换”标签页添加的文件会出现在这里。';

  @override
  String queueActiveTab(int count) {
    return '进行中 · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return '已完成 · $count';
  }

  @override
  String get queueNoActiveTitle => '没有正在进行的任务';

  @override
  String get queueNoActiveBody => '等待中或正在转换的文件会显示在这里。';

  @override
  String get queueNoFinishedTitle => '还没有完成的文件';

  @override
  String get queueNoFinishedBody => '转换好的文件会出现在这里，可以直接打开、保存或分享。';

  @override
  String get statusQueued => '排队中';

  @override
  String get statusRunning => '转换中';

  @override
  String get statusCompleted => '已完成';

  @override
  String get statusFailed => '失败';

  @override
  String get statusCancelled => '已取消';

  @override
  String batchSummary(int done, int total) {
    return '已完成 $done/$total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '已转换 $done 个文件',
      one: '已转换 1 个文件',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '成功 $done 个，失败 $failed 个。';
  }

  @override
  String savedPercent(int percent) {
    return '缩小 $percent%';
  }

  @override
  String grewPercent(int percent) {
    return '增大 $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get language => '语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get privacyTitle => '隐私';

  @override
  String get privacyBody =>
      'Eluna Media 使用内置的 FFmpeg 完全在本机转换文件。文件绝不离开设备，无需账号，也没有遥测。唯一使用网络的是一条非个性化广告横幅，且转换进行时绝不加载——完整清单见“网络与隐私”页面。\n\n元数据移除默认开启，导出的文件中不会包含 EXIF、GPS 坐标和时间戳。';

  @override
  String get licenseTitle => '许可';

  @override
  String get licenseBody =>
      '本应用内置的 FFmpeg 包含 x264、x265 等 GPL 组件，因此整个应用依 GNU GPL v3 分发。';

  @override
  String get formatUnsupportedForSource => '该格式无法容纳所选编码。';

  @override
  String get sourceMissing => '源文件已不可用。';

  @override
  String get errorTitle => '转换失败';

  @override
  String get tabSettings => '设置';

  @override
  String get introTitle => '隐私优先的设计';

  @override
  String get introOfflineTitle => '在本机转换';

  @override
  String get introOfflineBody => '所有工作由内置的 FFmpeg 完成。文件不会离开手机——开着飞行模式也能转换。';

  @override
  String get introTelemetryTitle => '零遥测';

  @override
  String get introTelemetryBody => '没有账号、没有分析、没有崩溃上报。应用不知道你是谁。';

  @override
  String get introMetadataTitle => '元数据尽在掌控';

  @override
  String get introMetadataBody => '默认从每个输出中去除 EXIF、GPS 和时间戳。也可以关闭。';

  @override
  String get introAdNote => '免费版只显示一条非个性化横幅——转换时绝不显示，前 14 天完全没有。';

  @override
  String get introContinue => '开始使用';

  @override
  String get modeSimple => '简单';

  @override
  String get modeAdvanced => '高级';

  @override
  String get modeAdvancedHint => '显示全部编解码器、比特率和变换选项，而不是预设卡片。';

  @override
  String get presetCompressVideoTitle => '压缩视频';

  @override
  String get presetCompressVideoBody => 'MP4 小得多，画质依旧';

  @override
  String get presetFitToSizeTitle => '压到指定大小';

  @override
  String get presetFitToSizeBody => '精准卡进限制——Discord、邮件、聊天';

  @override
  String get presetCompatibleMp4Title => '兼容 MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC，随处可播';

  @override
  String get presetExtractAudioTitle => '提取音频';

  @override
  String get presetExtractAudioBody => '从任意视频提取 MP3';

  @override
  String get presetVideoToGifTitle => '视频转 GIF';

  @override
  String get presetVideoToGifBody => '短片变成动态 GIF';

  @override
  String get presetMergeTitle => '合并视频';

  @override
  String get presetMergeBody => '按顺序拼接成一个 MP4';

  @override
  String get mergeNeedsTwo => '请至少选择两个视频进行合并。';

  @override
  String mergedVideoName(int count) {
    return '合并视频（$count 个片段）.mp4';
  }

  @override
  String get presetCompressImageTitle => '压缩照片';

  @override
  String get presetCompressImageBody => 'JPEG 更小，肉眼几乎无损';

  @override
  String get presetEnhancePhotoTitle => '增强照片';

  @override
  String get presetEnhancePhotoBody => '更干净、更清晰、色彩更好';

  @override
  String get presetImageToWebpTitle => '照片转 WebP';

  @override
  String get presetImageToWebpBody => '现代格式，比 JPEG 更小';

  @override
  String get sizeTargetTitle => '目标大小';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => '自定义…';

  @override
  String get sizeTargetDialogTitle => '目标大小（MB）';

  @override
  String get sizeTargetTooSmall => '对这个时长来说目标太小了，将使用尽可能接近的质量。';

  @override
  String estimatePerFile(String size) {
    return '每个文件 ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return '预计输出：≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已选择 $count 个文件',
      one: '已选择 1 个文件',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => '清除';

  @override
  String get presetExpectsVideo => '此预设仅适用于视频文件。';

  @override
  String get presetExpectsImage => '此预设仅适用于图片。';

  @override
  String get promiseOffline => '100% 离线转换';

  @override
  String get promiseBatchFree => '批量转换免费';

  @override
  String get promiseNoWatermark => '无水印';

  @override
  String get sectionTransform => '变换';

  @override
  String get rotateLabel => '旋转';

  @override
  String get flipLabel => '水平镜像';

  @override
  String get speedLabel => '速度';

  @override
  String get cropLabel => '裁剪';

  @override
  String get cropHint => '按所选宽高比居中裁剪——信息流用方形，快拍用 9:16。';

  @override
  String volumeLabel(int percent) {
    return '音量：$percent%';
  }

  @override
  String get addAudioFiles => '音频及其他文件';

  @override
  String get hwEncoderLabel => '硬件编码';

  @override
  String get hwEncoderHint =>
      '在码率和指定大小模式下使用设备的视频芯片——更快、更凉。质量 (CRF) 模式始终使用精确的软件编码器；硬件任务失败后会自动改用软件重试。';

  @override
  String get transformNeedsReencode => '旋转、镜像和变速需要重新编码，因此在流复制时不可用。';

  @override
  String get capBitrateLabel => '绝不让文件变大';

  @override
  String get capBitrateHint =>
      '将编码限制在源文件自身的比特率以内。恒定质量本身没有上限，否则已经压缩过的视频可能会变得更大。';

  @override
  String get keepSubtitles => '保留字幕';

  @override
  String get keepSubtitlesHint => '将字幕轨道带入输出。仅支持文本字幕。';

  @override
  String get sectionTrim => '截取';

  @override
  String get trimEnable => '截取源片段';

  @override
  String get trimHint => '仅当队列中恰好有一个已知时长的文件时可用。';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => '目标大小';

  @override
  String get lowBatteryTitle => '电量不足';

  @override
  String get lowBatteryBody => '转换会让处理器高负荷运转。你可以先接上电源，也可以直接继续。';

  @override
  String get lowBatteryContinue => '仍要转换';

  @override
  String get commonCancel => '取消';

  @override
  String get commonOk => '确定';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已接收 $count 个文件',
      one: '已接收 1 个文件',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => '保存';

  @override
  String get savedToGallery => '已保存到相册“Eluna Media”。';

  @override
  String get savedToDownloads => '已保存到“下载”。';

  @override
  String get saveFailed => '无法保存文件。';

  @override
  String get jobRemovedUndo => '已移除任务。';

  @override
  String get finishedClearedUndo => '已清除完成的任务。';

  @override
  String get undo => '撤销';

  @override
  String get errorDetailsTitle => '错误详情';

  @override
  String get oledDark => '纯黑深色主题';

  @override
  String get oledDarkHint => '纯黑在 OLED 屏幕上更省电。';

  @override
  String get dynamicColorLabel => '系统配色 (Material You)';

  @override
  String get dynamicColorHint => '在支持的设备上跟随壁纸取色。';

  @override
  String get sectionConversionPrefs => '转换';

  @override
  String get powerModeLabel => '功耗模式';

  @override
  String get powerEfficiency => '凉快·迅速';

  @override
  String get powerBalanced => '均衡';

  @override
  String get powerQuality => '极致压缩';

  @override
  String get powerModeHint => '决定视频编码器的用力程度。更凉更快意味着文件略大。除此之外不会限制任何东西——永远不会。';

  @override
  String get hapticsLabel => '振动反馈';

  @override
  String get adPrivacyTitle => '广告隐私设置';

  @override
  String get adPrivacySubtitle => '更改你的广告同意选项';

  @override
  String get networkPrivacyTitle => '网络与隐私';

  @override
  String get netAuditIntro => '本应用中所有可能访问网络的部分的完整清单。';

  @override
  String get netAuditAdTitle => '广告横幅——唯一的网络使用者';

  @override
  String get netAuditAdBody =>
      '只有一条横幅，且仅发送非个性化请求——广告 ID 权限已从应用中彻底移除。转换进行时绝不加载，购买“移除广告”后即会消失。除此之外，唯一会触及网络的只有点按“为应用评分”时商店自带的对话框。';

  @override
  String get netAuditConversionTitle => '转换';

  @override
  String get netAuditConversionBody => '通过内置 FFmpeg 完全在本机运行。开启飞行模式再转换试试——照样能用。';

  @override
  String get netAuditTelemetryTitle => '遥测';

  @override
  String get netAuditTelemetryBody => '没有。应用不收集任何分析数据、崩溃报告或标识符，也没有账号系统。';

  @override
  String get sectionSupport => '支持';

  @override
  String get removeAdsTitle => '移除广告';

  @override
  String get removeAdsSubtitle => '一次性购买。所有功能本来就免费。';

  @override
  String get removeAdsBullet1 => '横幅永久消失';

  @override
  String get removeAdsBullet2 => '一次付款——没有订阅';

  @override
  String get removeAdsBullet3 => '所有功能对所有人保持免费';

  @override
  String buyFor(String price) {
    return '购买 · $price';
  }

  @override
  String get restorePurchase => '恢复购买';

  @override
  String get purchaseSuccess => '广告已移除。感谢你支持开发！';

  @override
  String get purchaseUnavailable => '商店暂时不可用，请稍后再试。';

  @override
  String get purchaseFailed => '购买未完成。';

  @override
  String get adFreeBadge => '无广告';

  @override
  String get rateApp => '为应用评分';

  @override
  String get openLicenses => '开源许可';

  @override
  String get errorFallbackTitle => '出了点问题';

  @override
  String get errorFallbackBody => '应用遇到了意外错误。你的队列和设置都完好——返回后重试即可。';

  @override
  String get presetAudioToMp3Title => '转换音频';

  @override
  String get presetAudioToMp3Body => '转成 MP3，哪儿都能放';

  @override
  String get presetCompressAudioTitle => '压缩音频';

  @override
  String get presetCompressAudioBody => '更轻的 AAC，适合语音和播客';

  @override
  String get convertTo => '转换为';

  @override
  String get formatRecommended => '推荐';

  @override
  String get formatSectionHint => '这里只列出你的文件真正能转成的格式。';

  @override
  String get sourceVideo => '视频';

  @override
  String get sourceImage => '照片';

  @override
  String get sourceAudio => '音频';

  @override
  String get sourceUnknown => '文件';

  @override
  String get mixedSelectionTitle => '选择了不同类型的文件';

  @override
  String get mixedSelectionBody => '每个文件都会用最适合它自身类型的预设来转换。想要完全掌控，就一次只添加一种类型。';

  @override
  String get filesTitle => '文件';

  @override
  String get removeFile => '移除';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '剩余 ≈ $time';
  }

  @override
  String get jobSettingsTitle => '转换设置';

  @override
  String get jobDetails => '详情';

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
  String get summaryTwoPass => '两遍编码';

  @override
  String get summaryEnhanced => '已增强';

  @override
  String get summaryMetadataStripped => '已移除元数据';

  @override
  String summaryMerge(int count) {
    return '已合并 $count 个片段';
  }

  @override
  String get rateDialogTitle => '喜欢 Eluna Media 吗？';

  @override
  String get rateDialogBody => '点一颗星。评分只留在你和应用商店之间。';

  @override
  String get rateDialogLater => '暂不';

  @override
  String get rateFeedbackTitle => '哪里可以做得更好？';

  @override
  String get rateFeedbackBody => '告诉我们哪里出了问题，我们来修。没有账号，没有追踪——只有一封你自己写的邮件。';

  @override
  String get rateSendFeedback => '写反馈';

  @override
  String get rateThanks => '谢谢！';

  @override
  String feedbackSubject(int stars) {
    return 'Eluna Media 反馈 ($stars/5)';
  }

  @override
  String get noEmailApp => '此设备上没有设置邮件应用。';

  @override
  String get shareApp => '分享应用';

  @override
  String get shareAppText =>
      'Eluna Media — 免费、完全离线的照片、视频和音频转换器。没有订阅，没有水印，没有账号。';

  @override
  String appVersionLabel(String version) {
    return '版本 $version';
  }

  @override
  String get openFile => '打开';

  @override
  String get openFolder => '显示文件夹';

  @override
  String get noAppToOpen => '此设备上没有能打开该文件的应用。';

  @override
  String get openFailed => '无法打开文件。';

  @override
  String get twoPassLabel => '两遍编码，精确大小';

  @override
  String get twoPassHint => '指定大小的任务会编码两遍，明显更精确地贴近字节预算——代价是约两倍的时间和电量。';

  @override
  String get whatsNewTitle => '新功能';

  @override
  String get whatsNew1 => '转换完成的文件直接进入相册，“全部保存”可一次取走整批。';

  @override
  String get whatsNew2 => '把照片压到精确大小——100 KB 到 2 MB，也可以自己填数值。';

  @override
  String get whatsNew3 => '应用不再悄悄占用几个 GB：设置里能看到占用并一键清理。';

  @override
  String get whatsNew4 => '可以直接在通知里停止转换，空间不足时也会提前提醒。';

  @override
  String get whatsNew5 => '缩略图、转换前后对比、GIF → MP4、精确的剪辑时间——照片现在还能并行处理。';

  @override
  String get achievementsTitle => '成就';

  @override
  String achievementsProgress(int done, int total) {
    return '$done/$total';
  }

  @override
  String achievementUnlocked(String title) {
    return '成就达成：$title';
  }

  @override
  String get achievementsPrivacyNote => '仅在本机统计，不会上传到任何地方。';

  @override
  String get achFirstConversionTitle => '第一步';

  @override
  String get achFirstConversionBody => '转换你的第一个文件。';

  @override
  String get achTenConversionsTitle => '热身完毕';

  @override
  String get achTenConversionsBody => '转换 10 个文件。';

  @override
  String get achFiftyConversionsTitle => '常客';

  @override
  String get achFiftyConversionsBody => '转换 50 个文件。';

  @override
  String get achTwoHundredConversionsTitle => '劳模';

  @override
  String get achTwoHundredConversionsBody => '转换 200 个文件。';

  @override
  String get achThousandConversionsTitle => '传送带';

  @override
  String get achThousandConversionsBody => '转换 1000 个文件。';

  @override
  String get achSaved100MbTitle => '省空间达人';

  @override
  String get achSaved100MbBody => '累计释放 100 MB。';

  @override
  String get achSaved1GbTitle => 'GB 猎人';

  @override
  String get achSaved1GbBody => '累计释放 1 GB。';

  @override
  String get achSaved10GbTitle => '存储英雄';

  @override
  String get achSaved10GbBody => '累计释放 10 GB。';

  @override
  String get achBatchOfFiveTitle => '批量能手';

  @override
  String get achBatchOfFiveBody => '完成一批 5 个或以上的文件。';

  @override
  String get achBatchOfTwentyTitle => '流水线';

  @override
  String get achBatchOfTwentyBody => '完成一批 20 个或以上的文件。';

  @override
  String get achSniperTitle => '狙击手';

  @override
  String get achSniperBody => '用“压到指定大小”精准命中目标大小。';

  @override
  String get achMemeSmithTitle => '梗图匠';

  @override
  String get achMemeSmithBody => '把一个视频做成 GIF。';

  @override
  String get achSoundHunterTitle => '声音猎人';

  @override
  String get achSoundHunterBody => '从视频中提取音频。';

  @override
  String get achSubtitleKeeperTitle => '字幕守护者';

  @override
  String get achSubtitleKeeperBody => '保留字幕转换一个视频。';

  @override
  String get achDirectorTitle => '导演';

  @override
  String get achDirectorBody => '应用一次变换——旋转、裁剪、变速或音量。';

  @override
  String get achAllRounderTitle => '全能选手';

  @override
  String get achAllRounderBody => '分别转换视频、音频和图片。';

  @override
  String get achNightOwlTitle => '夜猫子';

  @override
  String get achNightOwlBody => '在午夜到凌晨 5 点之间完成一次转换。';

  @override
  String get achPlatinumTitle => '白金';

  @override
  String get achPlatinumBody => '解锁其余所有成就。';

  @override
  String get storageTitle => '存储';

  @override
  String get storageBody => '转换后的文件在你保存或分享之前会留在应用内部，文件管理器无法访问。';

  @override
  String get storageEmpty => '没有存储内容';

  @override
  String storageUsage(String size) {
    return '已占用：$size';
  }

  @override
  String get storageClearTitle => '清除已存储的文件？';

  @override
  String get storageClearBody => '删除应用仍保留的所有已完成结果。已保存或已分享的文件不受影响。';

  @override
  String get storageClearAction => '清除';

  @override
  String storageCleared(String size) {
    return '已释放 $size';
  }

  @override
  String get autoSaveLabel => '自动保存结果';

  @override
  String get autoSaveHint => '每个文件转换完成后立即存入相册，音频存入“下载”。';

  @override
  String get lowSpaceTitle => '剩余空间不足';

  @override
  String lowSpaceBody(String needed, String free) {
    return '这批文件大约需要 $needed，但只剩 $free 可用。转换可能中途失败。';
  }

  @override
  String saveAll(int count) {
    return '全部保存（$count）';
  }

  @override
  String savedAll(int count) {
    return '已保存：$count';
  }

  @override
  String savedSome(int saved, int total) {
    return '已保存 $saved/$total';
  }

  @override
  String get presetFitPhotoTitle => '把照片压到指定大小';

  @override
  String get presetFitPhotoBody => '把图片压到精确的上限以内——上传表单、申请材料。';

  @override
  String get photoFitHint => '应用会反复尝试画质直到文件达标。如果上限过小，还会一并缩小画面尺寸。';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => '目标大小（KB）';

  @override
  String get compareAction => '对比';

  @override
  String get compareBefore => '转换前';

  @override
  String get compareAfter => '转换后';

  @override
  String get compareHint => '长按可查看原图。';

  @override
  String get trimStart => '起点';

  @override
  String get trimEnd => '终点';

  @override
  String trimTimeHelp(String duration) {
    return '格式 m:ss，最长 $duration';
  }

  @override
  String get imageScaleLabel => '缩放';

  @override
  String get audioChannelsLabel => '声道';

  @override
  String get audioMono => '单声道';

  @override
  String get audioStereo => '立体声';

  @override
  String get sampleRateLabel => '采样率';

  @override
  String get voiceAudioHint =>
      '22.05 kHz 单声道能把语音录音压到约四分之一，且几乎听不出差别。音乐请两项都保持原始。';

  @override
  String get moveUp => '上移';

  @override
  String get moveDown => '下移';
}
