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
  String get themeSystem => '跟随系统';

  @override
  String get language => '语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get privacyTitle => '隐私';

  @override
  String get privacyBody =>
      'Eluna Media 使用内置的 FFmpeg 完全在本机转换文件。文件绝不离开设备，无需账号，也没有遥测。应用没有任何功能使用网络——它连联网权限都没有申请。\n\n元数据移除默认开启，导出的文件中不会包含 EXIF、GPS 坐标和时间戳。';

  @override
  String get licenseTitle => '许可';

  @override
  String get licenseBody =>
      '本应用内置的 FFmpeg 包含 x264、x265 等 GPL 组件，因此整个应用依 GNU GPL v3 分发。';

  @override
  String get sourceMissing => '源文件已不可用。';

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
  String get introFreeNote =>
      '免费：没有广告，没有订阅。包括批量转换在内的所有功能一开始就可用；唯一能买的是打赏，而它不会解锁任何东西。';

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
  String get networkPrivacyTitle => '网络与隐私';

  @override
  String get netAuditIntro => '本应用中所有可能访问网络的部分的完整清单。';

  @override
  String get netAuditNoneTitle => '完全不联网';

  @override
  String get netAuditNoneBody =>
      '应用没有申请联网权限，就算想联网也做不到——你可以在系统的应用信息里核实。没有广告、没有统计、没有更新检查。点击“给应用评分”只是交给商店应用，联网的是它。';

  @override
  String get netAuditConversionTitle => '转换';

  @override
  String get netAuditConversionBody => '通过内置 FFmpeg 完全在本机运行。开启飞行模式再转换试试——照样能用。';

  @override
  String get netAuditTelemetryTitle => '遥测';

  @override
  String get netAuditTelemetryBody => '没有。应用不收集任何分析数据、崩溃报告或标识符，也没有账号系统。';

  @override
  String get netAuditTipsTitle => '打赏';

  @override
  String get netAuditTipsBody =>
      '打赏由 Play 商店应用完成，而不是本应用——它依然没有联网权限。内购会给权限列表添加两项：“应用内购买”和“查看网络连接”，后者只能读取是否有连接，无法使用它。不会自动扣费，打赏也不会解锁任何功能：这里的一切都是免费的。';

  @override
  String get sectionSupport => '支持';

  @override
  String get rateApp => '为应用评分';

  @override
  String get openLicenses => '开源许可';

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
  String get summaryEnhanced => '已增强';

  @override
  String get summaryMetadataStripped => '已移除元数据';

  @override
  String summaryMerge(int count) {
    return '已合并 $count 个片段';
  }

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
  String get whatsNew1 => '视频可以用 AV1 编码了：只要等得起，文件会小很多。';

  @override
  String get whatsNew2 => '图片新增 AVIF（约为 JPEG 的一半）和动态 WebP（用来代替 GIF）。';

  @override
  String get whatsNew3 => 'M4A 也能无损了：AAC 旁边多了 ALAC。';

  @override
  String get whatsNew4 => '外观集中到一个页面：亮度、强调色、纯黑 OLED 和 Material You。';

  @override
  String get whatsNew5 => '成就有了奖章和三个标签页，进度还能做成图片分享。';

  @override
  String get achievementsTitle => '成就';

  @override
  String achievementsProgress(int done, int total) {
    return '$done/$total';
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

  @override
  String get renameOutput => '重命名结果';

  @override
  String get renameOutputHint => '新名称';

  @override
  String get renameOutputHelp => '扩展名由输出格式决定。留空则沿用源文件的名称。';

  @override
  String deleteOriginalsAction(int count) {
    return '删除原文件（$count）';
  }

  @override
  String get deleteOriginalsAuto => '转换后删除原文件';

  @override
  String get deleteOriginalsHint => '在结果保存之后，请求系统删除源文件。系统始终会显示将要删除的内容并等待你确认。';

  @override
  String originalsDeleted(String size) {
    return '已删除原文件——释放 $size';
  }

  @override
  String get originalsNoneDeleted => '没有删除任何内容。只能找到仍以原名保存在相册中的文件。';

  @override
  String reclaimedTotal(String size) {
    return '通过本应用释放：$size';
  }

  @override
  String get deleteAllData => '删除所有数据';

  @override
  String get deleteAllDataHint =>
      '清除应用保存在本机上的一切：队列、已转换的文件、预览图、成就和设置。已保存到相册的文件不受影响。';

  @override
  String get codecCopy => '复制';

  @override
  String get codecCopyRemux => '复制（封装转换）';

  @override
  String get codecNoVideo => '无视频';

  @override
  String get codecNoAudio => '无音频';

  @override
  String codecLossless(String codec) {
    return '$codec（无损）';
  }

  @override
  String formatAnimated(String format) {
    return '$format（动图）';
  }

  @override
  String get sizeTargetEmail => '电子邮件';

  @override
  String get trimTimeHint => '分:秒';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class L10nZhTw extends L10nZh {
  L10nZhTw() : super('zh_TW');

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => '轉換';

  @override
  String get tabQueue => '佇列';

  @override
  String get addFiles => '加入檔案';

  @override
  String get emptySelectionTitle => '尚無檔案';

  @override
  String get emptySelectionBody => '加入相片、影片或音訊。所有處理都在這部裝置上完成。';

  @override
  String get sectionOutput => '輸出';

  @override
  String get sectionVideo => '影片';

  @override
  String get sectionAudio => '音訊';

  @override
  String get sectionImage => '圖片';

  @override
  String get sectionPrivacy => '隱私';

  @override
  String get outputFormat => '格式';

  @override
  String get videoCodec => '視訊編碼器';

  @override
  String get audioCodec => '音訊編碼器';

  @override
  String get rateControl => '位元率控制';

  @override
  String get rateControlQuality => '固定品質（CRF）';

  @override
  String get rateControlBitrate => '目標位元率';

  @override
  String crfLabel(int value) {
    return '品質（CRF $value）';
  }

  @override
  String get crfHint => '數值越低品質越好，檔案也越大。';

  @override
  String videoBitrate(int value) {
    return '視訊位元率：$value kbps';
  }

  @override
  String audioBitrate(int value) {
    return '音訊位元率：$value kbps';
  }

  @override
  String get encodingPreset => '編碼器預設';

  @override
  String get encodingPresetHint => '較慢的預設壓縮效果較好，但裝置也會更熱。';

  @override
  String get presetOriginal => '原始';

  @override
  String get resolution => '解析度';

  @override
  String get frameRate => '影格率';

  @override
  String imageQuality(int value) {
    return '品質：$value';
  }

  @override
  String get lossless => '無損';

  @override
  String get losslessHint => '檔案較大，輸出與原圖完全一致。';

  @override
  String get sectionEnhance => '增強';

  @override
  String get sharpenLabel => '銳利度';

  @override
  String get sharpenHint => '讓邊緣更清晰。但無法救回模糊或失焦的照片——那些細節本來就不在檔案裡。';

  @override
  String get sharpenStrongHint => '強烈銳化可能在邊緣留下明顯光暈。建議先試中等。';

  @override
  String get denoiseLabel => '降噪';

  @override
  String get denoiseHint => '清除暗處與夜景照片的雜訊。過度使用會抹平細節。';

  @override
  String get autoColorLabel => '自動色彩與色階';

  @override
  String get autoColorHint => '拉開對比，並稍微提亮平淡的色彩。';

  @override
  String get upscaleLabel => '放大 2×';

  @override
  String get upscaleHint => '寬與高各加倍。不會增加細節——但列印或裁切時有幫助。';

  @override
  String get upscaleConflictHint => '將「解析度」改回「原始」才能放大。';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => '關閉';

  @override
  String get enhanceLight => '輕微';

  @override
  String get enhanceMedium => '中等';

  @override
  String get enhanceStrong => '強烈';

  @override
  String get stripMetadata => '移除中繼資料';

  @override
  String get stripMetadataHint => '從輸出檔案中移除 EXIF、GPS 與時間戳記。';

  @override
  String startConversion(int count) {
    return '轉換 $count 個檔案';
  }

  @override
  String get batchResumed => '已繼續中斷的轉換。';

  @override
  String get converting => '轉換中…';

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
  String get retryJob => '重試';

  @override
  String get queueEmptyTitle => '佇列是空的';

  @override
  String get queueEmptyBody => '你在「轉換」分頁加入的檔案會顯示在這裡。';

  @override
  String queueActiveTab(int count) {
    return '進行中 · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return '已完成 · $count';
  }

  @override
  String get queueNoActiveTitle => '目前沒有工作';

  @override
  String get queueNoActiveBody => '等待中或轉換中的檔案會出現在這裡。';

  @override
  String get queueNoFinishedTitle => '尚未完成任何項目';

  @override
  String get queueNoFinishedBody => '轉換完成的檔案會出現在這裡，可以開啟、儲存或分享。';

  @override
  String get statusQueued => '等待中';

  @override
  String get statusRunning => '轉換中';

  @override
  String get statusCompleted => '完成';

  @override
  String get statusFailed => '失敗';

  @override
  String get statusCancelled => '已取消';

  @override
  String batchSummary(int done, int total) {
    return '已完成 $done / $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '已轉換 $done 個檔案',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '已轉換 $done 個，失敗 $failed 個。';
  }

  @override
  String savedPercent(int percent) {
    return '縮小了 $percent%';
  }

  @override
  String grewPercent(int percent) {
    return '變大了 $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => '外觀';

  @override
  String get themeSystem => '跟隨系統';

  @override
  String get language => '語言';

  @override
  String get languageSystem => '跟隨系統';

  @override
  String get privacyTitle => '隱私';

  @override
  String get privacyBody =>
      'Eluna Media 使用內建的 FFmpeg，完全在這部裝置上轉換你的檔案。檔案永遠不會離開裝置，不需要帳號，也沒有遙測。這個應用程式完全不使用網路——它甚至沒有網際網路權限。\n\n預設會移除中繼資料，因此匯出的檔案不會帶有 EXIF、GPS 座標與時間戳記。';

  @override
  String get licenseTitle => '授權';

  @override
  String get licenseBody =>
      '本應用程式內含以 x264、x265 及其他 GPL 元件建置的 FFmpeg，因此整個應用程式依 GNU GPL v3 散布。';

  @override
  String get sourceMissing => '來源檔案已不存在。';

  @override
  String get tabSettings => '設定';

  @override
  String get introTitle => '從設計上就保護隱私';

  @override
  String get introOfflineTitle => '在這部裝置上轉換';

  @override
  String get introOfflineBody => '所有工作都由內建的 FFmpeg 完成。檔案永遠不會離開手機——開飛航模式也能轉換。';

  @override
  String get introTelemetryTitle => '零遙測';

  @override
  String get introTelemetryBody => '沒有帳號、沒有分析、沒有當機回報。應用程式不知道你是誰。';

  @override
  String get introMetadataTitle => '中繼資料由你掌握';

  @override
  String get introMetadataBody => '預設會從每個輸出檔案移除 EXIF、GPS 與時間戳記。你也可以關掉。';

  @override
  String get introFreeNote =>
      '免費，沒有廣告也沒有訂閱。所有功能，包含批次轉換，一開始就是你的——唯一能買的只有小費，而且它不會解鎖任何東西。';

  @override
  String get introContinue => '開始使用';

  @override
  String get modeSimple => '簡易';

  @override
  String get modeAdvanced => '進階';

  @override
  String get modeAdvancedHint => '顯示所有編碼器、位元率與變換選項，取代預設卡片。';

  @override
  String get presetCompressVideoTitle => '壓縮影片';

  @override
  String get presetCompressVideoBody => 'MP4 小很多，品質依然良好';

  @override
  String get presetFitToSizeTitle => '符合大小';

  @override
  String get presetFitToSizeBody => '命中精確上限——Discord、電子郵件、聊天';

  @override
  String get presetCompatibleMp4Title => '相容 MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC，到哪都能播';

  @override
  String get presetExtractAudioTitle => '擷取音訊';

  @override
  String get presetExtractAudioBody => '從任何影片取出 MP3';

  @override
  String get presetVideoToGifTitle => '影片轉 GIF';

  @override
  String get presetVideoToGifBody => '短片變成動態 GIF';

  @override
  String get presetMergeTitle => '合併影片';

  @override
  String get presetMergeBody => '依順序把片段接成一個 MP4';

  @override
  String get mergeNeedsTwo => '請至少選擇兩部影片才能合併。';

  @override
  String mergedVideoName(int count) {
    return '合併影片（$count 個片段）.mp4';
  }

  @override
  String get presetCompressImageTitle => '壓縮相片';

  @override
  String get presetCompressImageBody => '更小的 JPEG，幾乎看不出差別';

  @override
  String get presetEnhancePhotoTitle => '增強相片';

  @override
  String get presetEnhancePhotoBody => '更乾淨、更清晰、色彩更好';

  @override
  String get presetImageToWebpTitle => '相片轉 WebP';

  @override
  String get presetImageToWebpBody => '現代格式，比 JPEG 更小';

  @override
  String get sizeTargetTitle => '目標大小';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => '自訂…';

  @override
  String get sizeTargetDialogTitle => '目標大小（MB）';

  @override
  String get sizeTargetTooSmall => '以這段長度來說目標太小了；將使用最接近的品質。';

  @override
  String estimatePerFile(String size) {
    return '每個檔案約 $size';
  }

  @override
  String estimateTotal(String size) {
    return '預估輸出：約 $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已選擇 $count 個檔案',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% 離線轉換';

  @override
  String get promiseBatchFree => '批次轉換免費';

  @override
  String get promiseNoWatermark => '沒有浮水印';

  @override
  String get sectionTransform => '變換';

  @override
  String get rotateLabel => '旋轉';

  @override
  String get flipLabel => '水平鏡射';

  @override
  String get speedLabel => '速度';

  @override
  String get cropLabel => '裁切';

  @override
  String get cropHint => '從中心裁切為選定比例——動態消息用正方形，限時動態用 9:16。';

  @override
  String volumeLabel(int percent) {
    return '音量：$percent%';
  }

  @override
  String get addAudioFiles => '音訊與其他檔案';

  @override
  String get hwEncoderLabel => '硬體編碼';

  @override
  String get hwEncoderHint =>
      '在位元率與符合大小模式下使用裝置的視訊晶片——快得多也涼得多。品質（CRF）模式一律使用精確的軟體編碼器；硬體工作若失敗，會自動改用軟體重試。';

  @override
  String get transformNeedsReencode => '旋轉、鏡射與速度都需要重新編碼，因此在串流複製時無法使用。';

  @override
  String get capBitrateLabel => '永不讓檔案變大';

  @override
  String get capBitrateHint => '把編碼限制在來源本身的位元率。固定品質沒有上限，否則已經壓縮過的影片可能會變得更大。';

  @override
  String get keepSubtitles => '保留字幕';

  @override
  String get keepSubtitlesHint => '把字幕軌帶入輸出檔案。僅限文字字幕。';

  @override
  String get sectionTrim => '剪裁';

  @override
  String get trimEnable => '剪裁來源';

  @override
  String get trimHint => '佇列中剛好只有一個已知長度的檔案時可用。';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => '目標大小';

  @override
  String get lowBatteryTitle => '電量偏低';

  @override
  String get lowBatteryBody => '轉換會讓處理器全力運作。你可以先接上電源，或直接繼續。';

  @override
  String get lowBatteryContinue => '仍要轉換';

  @override
  String get commonCancel => '取消';

  @override
  String get commonOk => '確定';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已接收 $count 個檔案',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => '儲存';

  @override
  String get savedToGallery => '已儲存至相簿「Eluna Media」。';

  @override
  String get savedToDownloads => '已儲存至「下載」。';

  @override
  String get saveFailed => '無法儲存檔案。';

  @override
  String get jobRemovedUndo => '已移除工作。';

  @override
  String get finishedClearedUndo => '已清除完成的工作。';

  @override
  String get undo => '復原';

  @override
  String get errorDetailsTitle => '錯誤詳情';

  @override
  String get sectionConversionPrefs => '轉換';

  @override
  String get powerModeLabel => '效能模式';

  @override
  String get powerEfficiency => '低溫快速';

  @override
  String get powerBalanced => '平衡';

  @override
  String get powerQuality => '最大壓縮';

  @override
  String get powerModeHint => '視訊編碼器要多賣力。越涼越快，檔案就稍大一些。其他部分永遠不會被降速。';

  @override
  String get hapticsLabel => '震動回饋';

  @override
  String get networkPrivacyTitle => '網路與隱私';

  @override
  String get netAuditIntro => '這個應用程式裡所有可能碰到網路的東西，完整列在下面。';

  @override
  String get netAuditNoneTitle => '完全沒有網路存取';

  @override
  String get netAuditNoneBody =>
      '應用程式沒有申請網際網路權限，因此就算想連也連不上——你可以在系統的應用程式資訊裡查證。沒有廣告、沒有分析、不檢查更新。「為應用程式評分」會交給商店應用程式，由它自己去連線。';

  @override
  String get netAuditConversionTitle => '轉換';

  @override
  String get netAuditConversionBody => '透過內建的 FFmpeg 完全在這部裝置上執行。開飛航模式試試——照樣能轉。';

  @override
  String get netAuditTelemetryTitle => '遙測';

  @override
  String get netAuditTelemetryBody => '完全沒有。不收集分析資料、不收集當機報告、不收集識別碼，也沒有帳號系統。';

  @override
  String get netAuditTipsTitle => '小費';

  @override
  String get netAuditTipsBody =>
      '小費由 Play 商店應用程式處理，不是這個應用程式——它依然沒有網際網路權限。不過付款機制確實會在權限清單多出兩項：「應用程式內購買」與「查看網路連線」，後者只讀取是否有連線，並不能使用連線。永遠不會自動購買，小費也不解鎖任何東西：這裡的一切都是免費的。';

  @override
  String get sectionSupport => '支援';

  @override
  String get rateApp => '為應用程式評分';

  @override
  String get openLicenses => '開放原始碼授權';

  @override
  String get presetAudioToMp3Title => '轉換音訊';

  @override
  String get presetAudioToMp3Body => '轉成 MP3——什麼都能播';

  @override
  String get presetCompressAudioTitle => '壓縮音訊';

  @override
  String get presetCompressAudioBody => '更精簡的 AAC——語音備忘、Podcast';

  @override
  String get convertTo => '轉換為';

  @override
  String get formatSectionHint => '只會列出你的檔案真正能變成的格式。';

  @override
  String get sourceVideo => '影片';

  @override
  String get sourceImage => '相片';

  @override
  String get sourceAudio => '音訊';

  @override
  String get sourceUnknown => '檔案';

  @override
  String get mixedSelectionTitle => '已選擇不同類型的檔案';

  @override
  String get mixedSelectionBody => '每個檔案都會用最適合它類型的預設來轉換。想完全掌控，請一次只加入一種類型。';

  @override
  String get filesTitle => '檔案';

  @override
  String get removeFile => '移除';

  @override
  String timeLeft(String time) {
    return '約剩 $time';
  }

  @override
  String get jobSettingsTitle => '轉換設定';

  @override
  String get jobDetails => '詳細資料';

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
  String get summaryEnhanced => '已增強';

  @override
  String get summaryMetadataStripped => '已移除中繼資料';

  @override
  String summaryMerge(int count) {
    return '已合併 $count 個片段';
  }

  @override
  String get shareApp => '分享應用程式';

  @override
  String get shareAppText =>
      'Eluna Media——免費、完全離線的相片、影片與音訊轉換工具。沒有訂閱、沒有浮水印、沒有帳號。';

  @override
  String appVersionLabel(String version) {
    return '版本 $version';
  }

  @override
  String get openFile => '開啟';

  @override
  String get openFolder => '顯示資料夾';

  @override
  String get noAppToOpen => '這部裝置上沒有應用程式能開啟該檔案。';

  @override
  String get openFailed => '無法開啟檔案。';

  @override
  String get twoPassLabel => '兩階段編碼以求精確大小';

  @override
  String get twoPassHint => '符合大小的工作會編碼兩次，命中位元組上限明顯更準確——代價是大約兩倍的時間與電力。';

  @override
  String get whatsNewTitle => '最新消息';

  @override
  String get whatsNew1 => '影片現在可以用 AV1：檔案明顯更小，前提是你等得起。';

  @override
  String get whatsNew2 => '圖片新增：AVIF 大約只有 JPEG 的一半，還有動態 WebP 可以取代 GIF。';

  @override
  String get whatsNew3 => 'M4A 也能無損了——ALAC 現在與 AAC 並列。';

  @override
  String get whatsNew4 => '外觀集中到同一個畫面：亮度、強調色、純黑 OLED 與 Material You。';

  @override
  String get whatsNew5 => '成就有了獎章、三個分頁，以及可以做成圖片分享的進度。';

  @override
  String get achievementsTitle => '成就';

  @override
  String achievementsProgress(int done, int total) {
    return '$done / $total';
  }

  @override
  String get achievementsPrivacyNote => '只在這部裝置上計算，不會上傳到任何地方。';

  @override
  String get achFirstConversionTitle => '第一步';

  @override
  String get achFirstConversionBody => '轉換你的第一個檔案。';

  @override
  String get achTenConversionsTitle => '暖身完畢';

  @override
  String get achTenConversionsBody => '轉換 10 個檔案。';

  @override
  String get achFiftyConversionsTitle => '常客';

  @override
  String get achFiftyConversionsBody => '轉換 50 個檔案。';

  @override
  String get achTwoHundredConversionsTitle => '主力';

  @override
  String get achTwoHundredConversionsBody => '轉換 200 個檔案。';

  @override
  String get achThousandConversionsTitle => '生產線';

  @override
  String get achThousandConversionsBody => '轉換 1000 個檔案。';

  @override
  String get achSaved100MbTitle => '空間節省者';

  @override
  String get achSaved100MbBody => '總共釋出 100 MB。';

  @override
  String get achSaved1GbTitle => 'GB 獵人';

  @override
  String get achSaved1GbBody => '總共釋出 1 GB。';

  @override
  String get achSaved10GbTitle => '儲存空間英雄';

  @override
  String get achSaved10GbBody => '總共釋出 10 GB。';

  @override
  String get achBatchOfFiveTitle => '批次工';

  @override
  String get achBatchOfFiveBody => '完成一批 5 個以上的檔案。';

  @override
  String get achBatchOfTwentyTitle => '裝配線';

  @override
  String get achBatchOfTwentyBody => '完成一批 20 個以上的檔案。';

  @override
  String get achSniperTitle => '狙擊手';

  @override
  String get achSniperBody => '用「符合大小」命中精確的檔案大小。';

  @override
  String get achMemeSmithTitle => '迷因鐵匠';

  @override
  String get achMemeSmithBody => '把影片變成 GIF。';

  @override
  String get achSoundHunterTitle => '獵音者';

  @override
  String get achSoundHunterBody => '從影片中擷取音訊。';

  @override
  String get achSubtitleKeeperTitle => '字幕守護者';

  @override
  String get achSubtitleKeeperBody => '轉換影片並保留字幕。';

  @override
  String get achDirectorTitle => '導演';

  @override
  String get achDirectorBody => '套用一項變換——旋轉、裁切、速度或音量。';

  @override
  String get achAllRounderTitle => '全能';

  @override
  String get achAllRounderBody => '影片、音訊與圖片都轉換過。';

  @override
  String get achNightOwlTitle => '夜貓子';

  @override
  String get achNightOwlBody => '在午夜到清晨 5 點之間完成一次轉換。';

  @override
  String get achPlatinumTitle => '白金';

  @override
  String get achPlatinumBody => '取得其他所有成就。';

  @override
  String get storageTitle => '儲存空間';

  @override
  String get storageBody => '轉換後的檔案會留在應用程式內，直到你儲存或分享為止；在那之前任何檔案管理員都碰不到。';

  @override
  String get storageEmpty => '沒有儲存任何東西';

  @override
  String storageUsage(String size) {
    return '已佔用：$size';
  }

  @override
  String get storageClearTitle => '清除已儲存的檔案？';

  @override
  String get storageClearBody => '刪除應用程式仍保留的所有完成結果。你已經儲存或分享過的檔案不受影響。';

  @override
  String get storageClearAction => '清除';

  @override
  String storageCleared(String size) {
    return '已釋出 $size';
  }

  @override
  String get autoSaveLabel => '自動儲存結果';

  @override
  String get autoSaveHint => '每個檔案一完成就放進相簿——音訊放進「下載」。';

  @override
  String get lowSpaceTitle => '剩餘空間不多';

  @override
  String lowSpaceBody(String needed, String free) {
    return '這批工作大約需要 $needed，但只剩 $free。轉換可能會中途停止。';
  }

  @override
  String saveAll(int count) {
    return '全部儲存（$count）';
  }

  @override
  String savedAll(int count) {
    return '已儲存：$count';
  }

  @override
  String savedSome(int saved, int total) {
    return '已儲存 $saved / $total';
  }

  @override
  String get presetFitPhotoTitle => '相片符合大小';

  @override
  String get presetFitPhotoBody => '把相片壓到精確上限以下——上傳表單、申請文件。';

  @override
  String get photoFitHint => '應用程式會逐一嘗試品質，直到有一個符合。若上限對這張相片來說太小，也會一併縮小尺寸。';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => '目標大小（KB）';

  @override
  String get compareAction => '比較';

  @override
  String get compareBefore => '轉換前';

  @override
  String get compareAfter => '轉換後';

  @override
  String get compareHint => '長按可查看原圖。';

  @override
  String get trimStart => '起點';

  @override
  String get trimEnd => '終點';

  @override
  String trimTimeHelp(String duration) {
    return '分:秒，最多 $duration';
  }

  @override
  String get imageScaleLabel => '縮放';

  @override
  String get audioChannelsLabel => '聲道';

  @override
  String get audioMono => '單聲道';

  @override
  String get audioStereo => '立體聲';

  @override
  String get sampleRateLabel => '取樣率';

  @override
  String get voiceAudioHint =>
      '單聲道 22.05 kHz 大約能把語音錄音縮到四分之一，而且聽不出差別。音樂請兩項都保持原始。';

  @override
  String get moveUp => '上移';

  @override
  String get moveDown => '下移';

  @override
  String get renameOutput => '重新命名結果';

  @override
  String get renameOutputHint => '新名稱';

  @override
  String get renameOutputHelp => '副檔名由輸出格式決定。留空則沿用來源檔案的名稱。';

  @override
  String deleteOriginalsAction(int count) {
    return '刪除原始檔（$count）';
  }

  @override
  String get deleteOriginalsAuto => '轉換後刪除原始檔';

  @override
  String get deleteOriginalsHint => '在結果儲存後，請系統移除來源檔案。系統一定會顯示將被刪除的內容並等待你確認。';

  @override
  String originalsDeleted(String size) {
    return '已刪除原始檔——釋出 $size';
  }

  @override
  String get originalsNoneDeleted => '沒有刪除任何東西。只有相簿仍以原始名稱保存的檔案才找得到。';

  @override
  String reclaimedTotal(String size) {
    return '用這個應用程式釋出：$size';
  }

  @override
  String get deleteAllData => '刪除所有資料';

  @override
  String get deleteAllDataHint =>
      '清除應用程式在這部裝置上保存的一切：佇列、轉換後的檔案、預覽圖、成就與設定。你已經存進相簿的檔案不受影響。';

  @override
  String get codecCopy => '複製';

  @override
  String get codecCopyRemux => '複製（重新封裝）';

  @override
  String get codecNoVideo => '無視訊';

  @override
  String get codecNoAudio => '無音訊';

  @override
  String codecLossless(String codec) {
    return '$codec（無損）';
  }

  @override
  String formatAnimated(String format) {
    return '$format（動態）';
  }

  @override
  String get sizeTargetEmail => '電子郵件';

  @override
  String get trimTimeHint => '分:秒';
}
