// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => '変換';

  @override
  String get tabQueue => 'キュー';

  @override
  String get addFiles => 'ファイルを追加';

  @override
  String get emptySelectionTitle => 'ファイルがまだありません';

  @override
  String get emptySelectionBody => '写真・動画・音声を追加してください。すべてこの端末上で処理されます。';

  @override
  String get sectionOutput => '出力';

  @override
  String get sectionVideo => '動画';

  @override
  String get sectionAudio => '音声';

  @override
  String get sectionImage => '画像';

  @override
  String get sectionPrivacy => 'プライバシー';

  @override
  String get outputFormat => '形式';

  @override
  String get videoCodec => '動画コーデック';

  @override
  String get audioCodec => '音声コーデック';

  @override
  String get rateControl => 'レート制御';

  @override
  String get rateControlQuality => '固定品質 (CRF)';

  @override
  String get rateControlBitrate => '目標ビットレート';

  @override
  String crfLabel(int value) {
    return '品質 (CRF $value)';
  }

  @override
  String get crfHint => '値が小さいほど高品質で、ファイルは大きくなります。';

  @override
  String videoBitrate(int value) {
    return '動画ビットレート: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return '音声ビットレート: $value kbps';
  }

  @override
  String get encodingPreset => 'エンコーダープリセット';

  @override
  String get encodingPresetHint => '遅いプリセットほどよく圧縮できますが、端末は熱くなりやすくなります。';

  @override
  String get presetOriginal => '元のまま';

  @override
  String get resolution => '解像度';

  @override
  String get frameRate => 'フレームレート';

  @override
  String imageQuality(int value) {
    return '品質: $value';
  }

  @override
  String get lossless => 'ロスレス';

  @override
  String get losslessHint => 'ファイルは大きくなりますが、画質は完全に維持されます。';

  @override
  String get sectionEnhance => '補正';

  @override
  String get sharpenLabel => 'シャープネス';

  @override
  String get sharpenHint =>
      '輪郭をくっきりさせます。ただし、手ブレやピンボケの写真は救えません — その細部はもともとファイルに残っていないからです。';

  @override
  String get sharpenStrongHint =>
      'シャープネスが強すぎると、輪郭に明るい縁取り（ハロー）が出ることがあります。まずは「中」から試してください。';

  @override
  String get denoiseLabel => 'ノイズ除去';

  @override
  String get denoiseHint => '暗い場所や夜景の写真のざらつきを抑えます。強すぎると細かいディテールまで失われます。';

  @override
  String get autoColorLabel => '色とレベルの自動補正';

  @override
  String get autoColorHint => 'コントラストを広げ、くすんだ色を少し鮮やかにします。';

  @override
  String get upscaleLabel => '2倍に拡大';

  @override
  String get upscaleHint =>
      '幅と高さを2倍にします。ディテールが増えるわけではありません — 印刷やトリミングのときに役立ちます。';

  @override
  String get upscaleConflictHint => '拡大するには「解像度」を「元のまま」に戻してください。';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'オフ';

  @override
  String get enhanceLight => '弱';

  @override
  String get enhanceMedium => '中';

  @override
  String get enhanceStrong => '強';

  @override
  String get stripMetadata => 'メタデータを削除';

  @override
  String get stripMetadataHint => '出力から EXIF・GPS・タイムスタンプを取り除きます。';

  @override
  String startConversion(int count) {
    return '$count 件のファイルを変換';
  }

  @override
  String get batchResumed => '中断された変換を再開しました。';

  @override
  String get converting => '変換中…';

  @override
  String get cancelBatch => '停止';

  @override
  String get cancelJob => 'キャンセル';

  @override
  String get clearFinished => '完了分を消去';

  @override
  String get removeJob => '削除';

  @override
  String get shareFile => '共有';

  @override
  String get retryJob => '再試行';

  @override
  String get queueEmptyTitle => 'キューは空です';

  @override
  String get queueEmptyBody => '「変換」タブで追加したファイルがここに表示されます。';

  @override
  String queueActiveTab(int count) {
    return '実行中 · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return '完了 · $count';
  }

  @override
  String get queueNoActiveTitle => '実行中のものはありません';

  @override
  String get queueNoActiveBody => '待機中または変換中のファイルがここに表示されます。';

  @override
  String get queueNoFinishedTitle => '完了したものはまだありません';

  @override
  String get queueNoFinishedBody =>
      '変換したファイルはここに集まります。そのまま開いたり、保存したり、共有したりできます。';

  @override
  String get statusQueued => '待機中';

  @override
  String get statusRunning => '変換中';

  @override
  String get statusCompleted => '完了';

  @override
  String get statusFailed => '失敗';

  @override
  String get statusCancelled => 'キャンセル済み';

  @override
  String batchSummary(int done, int total) {
    return '$total 件中 $done 件完了';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done 件のファイルを変換しました',
      one: '1 件のファイルを変換しました',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done 件変換、$failed 件失敗。';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% 削減';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% 増加';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => '外観';

  @override
  String get themeSystem => 'システムに合わせる';

  @override
  String get language => '言語';

  @override
  String get languageSystem => 'システム';

  @override
  String get privacyTitle => 'プライバシー';

  @override
  String get privacyBody =>
      'Eluna Media は、内蔵の FFmpeg を使ってファイルをすべてこの端末上で変換します。ファイルが端末の外に出ることはなく、アカウントも不要で、テレメトリーもありません。ネットワークを使う機能は一つもなく、インターネット権限すら持っていません。\n\nメタデータの削除は初期設定でオンになっているため、書き出したファイルから EXIF・GPS 座標・タイムスタンプは取り除かれます。';

  @override
  String get licenseTitle => 'ライセンス';

  @override
  String get licenseBody =>
      'このアプリには x264、x265 などの GPL コンポーネントを含む FFmpeg が同梱されているため、アプリ全体が GNU GPL v3 の下で配布されます。';

  @override
  String get sourceMissing => '元のファイルが見つかりません。';

  @override
  String get tabSettings => '設定';

  @override
  String get introTitle => '設計からプライベート';

  @override
  String get introOfflineTitle => 'この端末上で変換';

  @override
  String get introOfflineBody =>
      '処理はすべて内蔵の FFmpeg が行います。ファイルがスマホの外に出ることはなく、機内モードでも変換できます。';

  @override
  String get introTelemetryTitle => 'テレメトリーゼロ';

  @override
  String get introTelemetryBody =>
      'アカウントも、アナリティクスも、クラッシュレポートもありません。アプリはあなたが誰なのか知りません。';

  @override
  String get introMetadataTitle => 'メタデータも管理下に';

  @override
  String get introMetadataBody =>
      'EXIF・GPS・タイムスタンプは初期設定ですべての出力から取り除かれます。オフにすることもできます。';

  @override
  String get introFreeNote => '無料です。広告なし、サブスクなし、アプリ内課金なし。一括変換を含むすべての機能が使えます。';

  @override
  String get introContinue => 'はじめる';

  @override
  String get modeSimple => 'シンプル';

  @override
  String get modeAdvanced => '詳細';

  @override
  String get modeAdvancedHint => 'プリセットカードの代わりに、コーデック・ビットレート・変形のすべての設定を表示します。';

  @override
  String get presetCompressVideoTitle => '動画を圧縮';

  @override
  String get presetCompressVideoBody => 'MP4 を大幅に小さく、品質はそのまま';

  @override
  String get presetFitToSizeTitle => 'サイズに合わせる';

  @override
  String get presetFitToSizeBody => '上限ぴったりに — Discord・メール・チャット';

  @override
  String get presetCompatibleMp4Title => '互換性重視の MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC。どこでも再生できます';

  @override
  String get presetExtractAudioTitle => '音声を抽出';

  @override
  String get presetExtractAudioBody => 'どんな動画からでも MP3 に';

  @override
  String get presetVideoToGifTitle => '動画を GIF に';

  @override
  String get presetVideoToGifBody => '短いクリップをアニメーション GIF に';

  @override
  String get presetMergeTitle => '動画を結合';

  @override
  String get presetMergeBody => 'クリップを順番どおり 1 つの MP4 に';

  @override
  String get mergeNeedsTwo => '結合するには動画を 2 本以上選んでください。';

  @override
  String mergedVideoName(int count) {
    return '結合した動画（$count クリップ）.mp4';
  }

  @override
  String get presetCompressImageTitle => '写真を圧縮';

  @override
  String get presetCompressImageBody => 'JPEG を小さく、劣化はほぼ見えません';

  @override
  String get presetEnhancePhotoTitle => '写真を補正';

  @override
  String get presetEnhancePhotoBody => 'ノイズを抑え、くっきり、色鮮やかに';

  @override
  String get presetImageToWebpTitle => '写真を WebP に';

  @override
  String get presetImageToWebpBody => 'JPEG より小さいモダンな形式';

  @override
  String get sizeTargetTitle => '目標サイズ';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'カスタム…';

  @override
  String get sizeTargetDialogTitle => '目標サイズ（MB）';

  @override
  String get sizeTargetTooSmall => 'この長さには目標が小さすぎます。可能な範囲で最も近い品質を使用します。';

  @override
  String estimatePerFile(String size) {
    return '1 ファイルあたり ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return '予想出力サイズ: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のファイルを選択中',
      one: '1 件のファイルを選択中',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '変換は 100% オフライン';

  @override
  String get promiseBatchFree => '一括変換も無料';

  @override
  String get promiseNoWatermark => 'ウォーターマークなし';

  @override
  String get sectionTransform => '変形';

  @override
  String get rotateLabel => '回転';

  @override
  String get flipLabel => '左右反転';

  @override
  String get speedLabel => '速度';

  @override
  String get cropLabel => '切り抜き';

  @override
  String get cropHint => '選んだアスペクト比に中央で切り抜きます。フィードには正方形、ストーリーには 9:16。';

  @override
  String volumeLabel(int percent) {
    return '音量: $percent%';
  }

  @override
  String get addAudioFiles => '音声・その他のファイル';

  @override
  String get hwEncoderLabel => 'ハードウェアエンコード';

  @override
  String get hwEncoderHint =>
      'ビットレート指定とサイズ指定のモードで端末の動画チップを使います。ずっと速く、発熱も少なくなります。品質 (CRF) モードでは常に精密なソフトウェアエンコーダーを使用し、失敗したハードウェア処理は自動的にソフトウェアで再試行されます。';

  @override
  String get transformNeedsReencode =>
      '回転・反転・速度変更には再エンコードが必要なため、ストリームコピー中は無効になります。';

  @override
  String get capBitrateLabel => 'ファイルを大きくしない';

  @override
  String get capBitrateHint =>
      'エンコードを元ファイルのビットレート以下に制限します。固定品質にはそれ自体の上限がないため、すでに圧縮済みの動画はこの設定がないと元より大きくなることがあります。';

  @override
  String get keepSubtitles => '字幕を保持';

  @override
  String get keepSubtitlesHint => '字幕トラックを出力に引き継ぎます。テキスト字幕のみ対応です。';

  @override
  String get sectionTrim => 'トリミング';

  @override
  String get trimEnable => '元ファイルをトリミング';

  @override
  String get trimHint => '長さがわかっているファイルが 1 つだけキューにあるときに使えます。';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => '目標サイズ';

  @override
  String get lowBatteryTitle => 'バッテリー残量が少なくなっています';

  @override
  String get lowBatteryBody => '変換はプロセッサーに大きな負荷をかけます。先に充電するか、このまま続けることもできます。';

  @override
  String get lowBatteryContinue => 'このまま変換';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のファイルを受け取りました',
      one: '1 件のファイルを受け取りました',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => '保存';

  @override
  String get savedToGallery => 'ギャラリーの「Eluna Media」アルバムに保存しました。';

  @override
  String get savedToDownloads => 'ダウンロードに保存しました。';

  @override
  String get saveFailed => 'ファイルを保存できませんでした。';

  @override
  String get jobRemovedUndo => 'ジョブを削除しました。';

  @override
  String get finishedClearedUndo => '完了したジョブを消去しました。';

  @override
  String get undo => '元に戻す';

  @override
  String get errorDetailsTitle => 'エラーの詳細';

  @override
  String get sectionConversionPrefs => '変換';

  @override
  String get powerModeLabel => 'パワーモード';

  @override
  String get powerEfficiency => '低発熱・高速';

  @override
  String get powerBalanced => 'バランス';

  @override
  String get powerQuality => '最大圧縮';

  @override
  String get powerModeHint =>
      '動画エンコーダーの頑張り具合です。低発熱・高速にするとファイルはやや大きくなります。それ以外が制限されることは一切ありません。';

  @override
  String get hapticsLabel => 'バイブレーション';

  @override
  String get networkPrivacyTitle => 'ネットワークとプライバシー';

  @override
  String get netAuditIntro => 'このアプリでネットワークに触れる可能性があるものの完全なリストです。';

  @override
  String get netAuditNoneTitle => 'ネットワークには一切つながりません';

  @override
  String get netAuditNoneBody =>
      'このアプリはインターネット権限を要求していないため、つなごうとしてもつながりません。端末の「アプリ情報」で確認できます。広告も、解析も、更新確認もありません。「アプリを評価」はストアアプリに引き継ぐだけで、通信するのはストア側です。';

  @override
  String get netAuditConversionTitle => '変換';

  @override
  String get netAuditConversionBody =>
      '内蔵の FFmpeg によってすべてこの端末上で実行されます。機内モードにして変換してみてください — ちゃんと動きます。';

  @override
  String get netAuditTelemetryTitle => 'テレメトリー';

  @override
  String get netAuditTelemetryBody =>
      'ありません。アプリはアナリティクスもクラッシュレポートも識別子も収集せず、アカウントの仕組みもありません。';

  @override
  String get netAuditTipsTitle => 'チップ';

  @override
  String get netAuditTipsBody =>
      'チップの決済を行うのはPlayストアアプリで、このアプリではありません。このアプリには今もインターネット権限がありません。購入機能によって権限一覧に2行が加わります。「アプリ内購入」と「ネットワーク接続の表示」で、後者は接続があるかどうかを読むだけで、使うことはできません。勝手に購入されることはなく、チップで何かが解放されることもありません。ここにあるものはすべて無料です。';

  @override
  String get sectionSupport => 'サポート';

  @override
  String get rateApp => 'アプリを評価';

  @override
  String get openLicenses => 'オープンソースライセンス';

  @override
  String get presetAudioToMp3Title => '音声を変換';

  @override
  String get presetAudioToMp3Body => 'MP3 へ — どこでも再生できます';

  @override
  String get presetCompressAudioTitle => '音声を圧縮';

  @override
  String get presetCompressAudioBody => '軽い AAC — ボイスメモ、ポッドキャスト';

  @override
  String get convertTo => '変換先';

  @override
  String get formatSectionHint => '選んだファイルが実際に変換できる形式だけを表示しています。';

  @override
  String get sourceVideo => '動画';

  @override
  String get sourceImage => '写真';

  @override
  String get sourceAudio => '音声';

  @override
  String get sourceUnknown => 'ファイル';

  @override
  String get mixedSelectionTitle => '種類の違うファイルが選ばれています';

  @override
  String get mixedSelectionBody =>
      '各ファイルはその種類にいちばん合ったプリセットで変換されます。細かく設定したいときは、同じ種類のファイルだけを追加してください。';

  @override
  String get filesTitle => 'ファイル';

  @override
  String get removeFile => '削除';

  @override
  String timeLeft(String time) {
    return '残り ≈ $time';
  }

  @override
  String get jobSettingsTitle => '変換設定';

  @override
  String get jobDetails => '詳細';

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
  String get summaryEnhanced => '補正済み';

  @override
  String get summaryMetadataStripped => 'メタデータを削除';

  @override
  String summaryMerge(int count) {
    return '$count クリップを結合';
  }

  @override
  String get shareApp => 'アプリを共有';

  @override
  String get shareAppText =>
      'Eluna Media — 完全オフラインで使える無料の写真・動画・音声コンバーター。サブスクも、ウォーターマークも、アカウントもありません。';

  @override
  String appVersionLabel(String version) {
    return 'バージョン $version';
  }

  @override
  String get openFile => '開く';

  @override
  String get openFolder => 'フォルダを表示';

  @override
  String get noAppToOpen => 'このファイルを開けるアプリがこの端末にありません。';

  @override
  String get openFailed => 'ファイルを開けませんでした。';

  @override
  String get twoPassLabel => '正確なサイズのための 2 パス';

  @override
  String get twoPassHint =>
      'サイズ指定のジョブを 2 回エンコードし、バイト上限にぐっと正確に収めます。時間とバッテリーはおよそ 2 倍かかります。';

  @override
  String get whatsNewTitle => '新機能';

  @override
  String get whatsNew1 => '動画をAV1で書き出せるようになりました。時間はかかりますが、ファイルはかなり小さくなります。';

  @override
  String get whatsNew2 => '画像に新顔。JPEGの約半分になるAVIFと、GIFの代わりになるアニメーションWebPです。';

  @override
  String get whatsNew3 => 'M4Aをロスレスにできます。AACの隣にALACが並びました。';

  @override
  String get whatsNew4 => '外観は1画面にまとまりました。明るさ、アクセント色、真っ黒なOLED、Material You。';

  @override
  String get whatsNew5 => '実績にメダルと3つのタブが付き、進み具合を画像で共有できます。';

  @override
  String get achievementsTitle => '実績';

  @override
  String achievementsProgress(int done, int total) {
    return '$total 件中 $done 件';
  }

  @override
  String get achievementsPrivacyNote => 'この端末上でのみカウントされます。どこにもアップロードされません。';

  @override
  String get achFirstConversionTitle => 'はじめの一歩';

  @override
  String get achFirstConversionBody => '最初のファイルを変換しましょう。';

  @override
  String get achTenConversionsTitle => 'ウォームアップ';

  @override
  String get achTenConversionsBody => '10 件のファイルを変換。';

  @override
  String get achFiftyConversionsTitle => '常連';

  @override
  String get achFiftyConversionsBody => '50 件のファイルを変換。';

  @override
  String get achTwoHundredConversionsTitle => '働き者';

  @override
  String get achTwoHundredConversionsBody => '200 件のファイルを変換。';

  @override
  String get achThousandConversionsTitle => 'コンベヤー';

  @override
  String get achThousandConversionsBody => '1000 件のファイルを変換。';

  @override
  String get achSaved100MbTitle => 'スペース節約家';

  @override
  String get achSaved100MbBody => '合計 100 MB を解放。';

  @override
  String get achSaved1GbTitle => 'ギガバイトハンター';

  @override
  String get achSaved1GbBody => '合計 1 GB を解放。';

  @override
  String get achSaved10GbTitle => 'ストレージの英雄';

  @override
  String get achSaved10GbBody => '合計 10 GB を解放。';

  @override
  String get achBatchOfFiveTitle => 'バッチ職人';

  @override
  String get achBatchOfFiveBody => '5 件以上のバッチを完了。';

  @override
  String get achBatchOfTwentyTitle => '流れ作業';

  @override
  String get achBatchOfTwentyBody => '20 件以上のバッチを完了。';

  @override
  String get achSniperTitle => 'スナイパー';

  @override
  String get achSniperBody => 'サイズ指定でぴったりのサイズを達成。';

  @override
  String get achMemeSmithTitle => 'ミーム職人';

  @override
  String get achMemeSmithBody => '動画を GIF に変換。';

  @override
  String get achSoundHunterTitle => '音のハンター';

  @override
  String get achSoundHunterBody => '動画から音声を抽出。';

  @override
  String get achSubtitleKeeperTitle => '字幕の番人';

  @override
  String get achSubtitleKeeperBody => '字幕を保持したまま動画を変換。';

  @override
  String get achDirectorTitle => '監督';

  @override
  String get achDirectorBody => '変形を適用 — 回転・切り抜き・速度・音量のいずれか。';

  @override
  String get achAllRounderTitle => 'オールラウンダー';

  @override
  String get achAllRounderBody => '動画・音声・画像をそれぞれ変換。';

  @override
  String get achNightOwlTitle => '夜ふかし';

  @override
  String get achNightOwlBody => '深夜 0 時から朝 5 時の間に変換を完了。';

  @override
  String get achPlatinumTitle => 'プラチナ';

  @override
  String get achPlatinumBody => '他のすべての実績を解除。';

  @override
  String get storageTitle => 'ストレージ';

  @override
  String get storageBody => '変換したファイルは保存または共有するまでアプリ内に残り、ファイルマネージャーからは見えません。';

  @override
  String get storageEmpty => '保存されたファイルはありません';

  @override
  String storageUsage(String size) {
    return '使用中: $size';
  }

  @override
  String get storageClearTitle => '保存中のファイルを削除しますか？';

  @override
  String get storageClearBody =>
      'アプリが保持している完了済みの結果をすべて削除します。すでに保存または共有したファイルはそのままです。';

  @override
  String get storageClearAction => '削除';

  @override
  String storageCleared(String size) {
    return '$size を解放しました';
  }

  @override
  String get autoSaveLabel => '結果を自動的に保存';

  @override
  String get autoSaveHint => '完了したファイルをすぐにギャラリー（音声はダウンロード）へ保存します。';

  @override
  String get lowSpaceTitle => '空き容量が少なくなっています';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'この一括処理には約 $needed が必要ですが、空きは $free しかありません。途中で失敗する可能性があります。';
  }

  @override
  String saveAll(int count) {
    return 'すべて保存（$count）';
  }

  @override
  String savedAll(int count) {
    return '保存しました: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total 件中 $saved 件を保存しました';
  }

  @override
  String get presetFitPhotoTitle => '写真を指定サイズに';

  @override
  String get presetFitPhotoBody => '画像を指定の上限以下に圧縮します（アップロードフォームや申請書類向け）。';

  @override
  String get photoFitHint => '収まるまで画質を試します。指定サイズが小さすぎる場合は画像サイズも縮小します。';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => '目標サイズ（KB）';

  @override
  String get compareAction => '比較';

  @override
  String get compareBefore => '変換前';

  @override
  String get compareAfter => '変換後';

  @override
  String get compareHint => '長押しすると元の画像が表示されます。';

  @override
  String get trimStart => '開始';

  @override
  String get trimEnd => '終了';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss 形式、最大 $duration';
  }

  @override
  String get imageScaleLabel => '拡大縮小';

  @override
  String get audioChannelsLabel => 'チャンネル';

  @override
  String get audioMono => 'モノラル';

  @override
  String get audioStereo => 'ステレオ';

  @override
  String get sampleRateLabel => 'サンプリング周波数';

  @override
  String get voiceAudioHint =>
      '22.05 kHz モノラルなら、音声録音は聞こえる劣化なしでおよそ 1/4 になります。音楽では両方とも元のままに。';

  @override
  String get moveUp => '上へ';

  @override
  String get moveDown => '下へ';

  @override
  String get renameOutput => '変換結果の名前を変更';

  @override
  String get renameOutputHint => '新しい名前';

  @override
  String get renameOutputHelp => '拡張子は出力形式で決まります。空欄にすると元のファイル名が使われます。';

  @override
  String deleteOriginalsAction(int count) {
    return '元のファイルを削除 ($count)';
  }

  @override
  String get deleteOriginalsAuto => '変換後に元のファイルを削除する';

  @override
  String get deleteOriginalsHint =>
      '変換結果を保存したあと、元のファイルの削除をシステムに依頼します。何が消えるかは必ずシステムが表示し、確認を待ちます。';

  @override
  String originalsDeleted(String size) {
    return '元のファイルを削除しました（$size の空き）';
  }

  @override
  String get originalsNoneDeleted =>
      '何も削除されませんでした。元の名前のままギャラリーに残っているファイルだけが見つかります。';

  @override
  String reclaimedTotal(String size) {
    return 'このアプリで空けた容量: $size';
  }

  @override
  String get deleteAllData => 'すべてのデータを削除';

  @override
  String get deleteAllDataHint =>
      'このアプリが端末に保存しているものをすべて消去します。キュー、変換したファイル、プレビュー、実績、設定が対象です。すでにギャラリーに保存したファイルはそのまま残ります。';
}
