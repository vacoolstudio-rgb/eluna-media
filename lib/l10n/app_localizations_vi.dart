// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class L10nVi extends L10n {
  L10nVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Chuyển đổi';

  @override
  String get tabQueue => 'Hàng đợi';

  @override
  String get addFiles => 'Thêm tệp';

  @override
  String get emptySelectionTitle => 'Chưa có tệp nào';

  @override
  String get emptySelectionBody =>
      'Thêm ảnh, video hoặc âm thanh. Mọi thứ đều được xử lý trên thiết bị này.';

  @override
  String get sectionOutput => 'Đầu ra';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Âm thanh';

  @override
  String get sectionImage => 'Hình ảnh';

  @override
  String get sectionPrivacy => 'Quyền riêng tư';

  @override
  String get outputFormat => 'Định dạng';

  @override
  String get videoCodec => 'Codec video';

  @override
  String get audioCodec => 'Codec âm thanh';

  @override
  String get rateControl => 'Kiểm soát tốc độ bit';

  @override
  String get rateControlQuality => 'Chất lượng cố định (CRF)';

  @override
  String get rateControlBitrate => 'Tốc độ bit mục tiêu';

  @override
  String crfLabel(int value) {
    return 'Chất lượng (CRF $value)';
  }

  @override
  String get crfHint => 'Số thấp hơn cho chất lượng tốt hơn và tệp lớn hơn.';

  @override
  String videoBitrate(int value) {
    return 'Tốc độ bit video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Tốc độ bit âm thanh: $value kbps';
  }

  @override
  String get encodingPreset => 'Cài đặt sẵn của bộ mã hoá';

  @override
  String get encodingPresetHint =>
      'Cài đặt chậm hơn nén tốt hơn nhưng làm máy nóng hơn.';

  @override
  String get presetOriginal => 'Gốc';

  @override
  String get resolution => 'Độ phân giải';

  @override
  String get frameRate => 'Tốc độ khung hình';

  @override
  String imageQuality(int value) {
    return 'Chất lượng: $value';
  }

  @override
  String get lossless => 'Không mất dữ liệu';

  @override
  String get losslessHint => 'Tệp lớn hơn, đầu ra chính xác từng điểm ảnh.';

  @override
  String get sectionEnhance => 'Tăng cường';

  @override
  String get sharpenLabel => 'Độ sắc nét';

  @override
  String get sharpenHint =>
      'Làm cạnh sắc hơn. Nó không cứu được ảnh mờ hay mất nét — chi tiết đó vốn không có trong tệp.';

  @override
  String get sharpenStrongHint =>
      'Làm nét mạnh có thể để lại quầng sáng dọc theo cạnh. Hãy thử mức trung bình trước.';

  @override
  String get denoiseLabel => 'Giảm nhiễu';

  @override
  String get denoiseHint =>
      'Dọn hạt nhiễu trong ảnh tối và ảnh ban đêm. Quá tay sẽ xoá mất chi tiết nhỏ.';

  @override
  String get autoColorLabel => 'Màu và mức tự động';

  @override
  String get autoColorHint =>
      'Kéo giãn độ tương phản và nâng nhẹ những màu bị nhạt.';

  @override
  String get upscaleLabel => 'Phóng to 2×';

  @override
  String get upscaleHint =>
      'Nhân đôi chiều rộng và chiều cao. Nó không thêm chi tiết — nhưng có ích khi in hoặc cắt ảnh.';

  @override
  String get upscaleConflictHint =>
      'Đặt Độ phân giải về Gốc để có thể phóng to.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Tắt';

  @override
  String get enhanceLight => 'Nhẹ';

  @override
  String get enhanceMedium => 'Vừa';

  @override
  String get enhanceStrong => 'Mạnh';

  @override
  String get stripMetadata => 'Xoá siêu dữ liệu';

  @override
  String get stripMetadataHint =>
      'Loại bỏ EXIF, GPS và dấu thời gian khỏi tệp đầu ra.';

  @override
  String startConversion(int count) {
    return 'Chuyển đổi $count tệp';
  }

  @override
  String get batchResumed => 'Đã tiếp tục lần chuyển đổi bị gián đoạn.';

  @override
  String get converting => 'Đang chuyển đổi…';

  @override
  String get cancelBatch => 'Dừng';

  @override
  String get cancelJob => 'Huỷ';

  @override
  String get clearFinished => 'Xoá mục đã xong';

  @override
  String get removeJob => 'Gỡ bỏ';

  @override
  String get shareFile => 'Chia sẻ';

  @override
  String get retryJob => 'Thử lại';

  @override
  String get queueEmptyTitle => 'Hàng đợi trống';

  @override
  String get queueEmptyBody =>
      'Các tệp bạn thêm ở thẻ Chuyển đổi sẽ xuất hiện ở đây.';

  @override
  String queueActiveTab(int count) {
    return 'Đang chạy · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Đã xong · $count';
  }

  @override
  String get queueNoActiveTitle => 'Không có gì đang chạy';

  @override
  String get queueNoActiveBody =>
      'Tệp đang chờ hoặc đang chuyển đổi sẽ hiện ở đây.';

  @override
  String get queueNoFinishedTitle => 'Chưa có gì hoàn tất';

  @override
  String get queueNoFinishedBody =>
      'Tệp đã chuyển đổi sẽ đến đây, sẵn sàng để mở, lưu hoặc chia sẻ.';

  @override
  String get statusQueued => 'Trong hàng đợi';

  @override
  String get statusRunning => 'Đang chuyển đổi';

  @override
  String get statusCompleted => 'Xong';

  @override
  String get statusFailed => 'Thất bại';

  @override
  String get statusCancelled => 'Đã huỷ';

  @override
  String batchSummary(int done, int total) {
    return 'Xong $done trên $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Đã chuyển đổi $done tệp',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Đã chuyển đổi $done, thất bại $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'Nhỏ hơn $percent%';
  }

  @override
  String grewPercent(int percent) {
    return 'Lớn hơn $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Giao diện';

  @override
  String get themeSystem => 'Theo hệ thống';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSystem => 'Theo hệ thống';

  @override
  String get privacyTitle => 'Quyền riêng tư';

  @override
  String get privacyBody =>
      'Eluna Media chuyển đổi tệp của bạn hoàn toàn trên thiết bị này bằng một bản FFmpeg đi kèm. Tệp của bạn không bao giờ rời khỏi thiết bị, không cần tài khoản, và không có đo từ xa. Không có gì trong ứng dụng dùng đến mạng — nó thậm chí không giữ quyền truy cập internet.\n\nViệc xoá siêu dữ liệu được bật sẵn, nên EXIF, toạ độ GPS và dấu thời gian đều bị loại khỏi những tệp bạn xuất ra.';

  @override
  String get licenseTitle => 'Giấy phép';

  @override
  String get licenseBody =>
      'Ứng dụng này đi kèm FFmpeg được dựng với x264, x265 và các thành phần GPL khác, nên toàn bộ ứng dụng được phân phối theo GNU GPL v3.';

  @override
  String get sourceMissing => 'Tệp nguồn không còn nữa.';

  @override
  String get tabSettings => 'Cài đặt';

  @override
  String get introTitle => 'Riêng tư ngay từ thiết kế';

  @override
  String get introOfflineTitle => 'Chuyển đổi trên thiết bị này';

  @override
  String get introOfflineBody =>
      'Một bản FFmpeg đi kèm làm toàn bộ công việc. Tệp của bạn không rời khỏi điện thoại — bật chế độ máy bay vẫn chuyển đổi được.';

  @override
  String get introTelemetryTitle => 'Không đo từ xa';

  @override
  String get introTelemetryBody =>
      'Không tài khoản, không phân tích, không báo cáo sự cố. Ứng dụng không biết bạn là ai.';

  @override
  String get introMetadataTitle => 'Siêu dữ liệu trong tầm kiểm soát';

  @override
  String get introMetadataBody =>
      'EXIF, GPS và dấu thời gian bị loại khỏi mọi tệp đầu ra theo mặc định. Bạn có thể tắt điều đó.';

  @override
  String get introFreeNote =>
      'Miễn phí, không quảng cáo và không thuê bao. Mọi tính năng, kể cả chuyển đổi hàng loạt, là của bạn ngay từ đầu — thứ duy nhất có thể mua là tiền boa, và nó không mở khoá gì cả.';

  @override
  String get introContinue => 'Bắt đầu';

  @override
  String get modeSimple => 'Đơn giản';

  @override
  String get modeAdvanced => 'Nâng cao';

  @override
  String get modeAdvancedHint =>
      'Hiện mọi codec, tốc độ bit và tuỳ chọn biến đổi thay cho các thẻ cài đặt sẵn.';

  @override
  String get presetCompressVideoTitle => 'Nén video';

  @override
  String get presetCompressVideoBody => 'MP4 nhỏ hơn nhiều, chất lượng vẫn tốt';

  @override
  String get presetFitToSizeTitle => 'Vừa dung lượng';

  @override
  String get presetFitToSizeBody =>
      'Đạt đúng giới hạn — Discord, email, tin nhắn';

  @override
  String get presetCompatibleMp4Title => 'MP4 tương thích';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Phát được ở mọi nơi';

  @override
  String get presetExtractAudioTitle => 'Tách âm thanh';

  @override
  String get presetExtractAudioBody => 'MP3 từ bất kỳ video nào';

  @override
  String get presetVideoToGifTitle => 'Video sang GIF';

  @override
  String get presetVideoToGifBody => 'Đoạn ngắn thành ảnh GIF động';

  @override
  String get presetMergeTitle => 'Ghép video';

  @override
  String get presetMergeBody => 'Nối các đoạn thành một MP4, theo thứ tự';

  @override
  String get mergeNeedsTwo => 'Hãy chọn ít nhất hai video để ghép.';

  @override
  String mergedVideoName(int count) {
    return 'Video đã ghép ($count đoạn).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Nén ảnh';

  @override
  String get presetCompressImageBody =>
      'JPEG nhỏ hơn, hầu như không thấy mất chất';

  @override
  String get presetEnhancePhotoTitle => 'Tăng cường ảnh';

  @override
  String get presetEnhancePhotoBody => 'Sạch hơn, nét hơn, màu đẹp hơn';

  @override
  String get presetImageToWebpTitle => 'Ảnh sang WebP';

  @override
  String get presetImageToWebpBody => 'Định dạng hiện đại, nhỏ hơn JPEG';

  @override
  String get sizeTargetTitle => 'Dung lượng mục tiêu';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Tuỳ chỉnh…';

  @override
  String get sizeTargetDialogTitle => 'Dung lượng mục tiêu tính bằng MB';

  @override
  String get sizeTargetTooSmall =>
      'Mục tiêu quá nhỏ so với thời lượng này; chất lượng gần nhất có thể sẽ được dùng.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size mỗi tệp';
  }

  @override
  String estimateTotal(String size) {
    return 'Đầu ra ước tính: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã chọn $count tệp',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => 'Chuyển đổi ngoại tuyến 100%';

  @override
  String get promiseBatchFree => 'Hàng loạt là miễn phí';

  @override
  String get promiseNoWatermark => 'Không hình mờ';

  @override
  String get sectionTransform => 'Biến đổi';

  @override
  String get rotateLabel => 'Xoay';

  @override
  String get flipLabel => 'Lật ngang';

  @override
  String get speedLabel => 'Tốc độ';

  @override
  String get cropLabel => 'Cắt';

  @override
  String get cropHint =>
      'Cắt từ giữa theo tỷ lệ đã chọn — vuông cho bảng tin, 9:16 cho tin nhanh.';

  @override
  String volumeLabel(int percent) {
    return 'Âm lượng: $percent%';
  }

  @override
  String get addAudioFiles => 'Âm thanh và tệp khác';

  @override
  String get hwEncoderLabel => 'Mã hoá bằng phần cứng';

  @override
  String get hwEncoderHint =>
      'Dùng chip video của thiết bị ở chế độ tốc độ bit và vừa dung lượng — nhanh hơn nhiều và mát hơn. Chế độ chất lượng (CRF) luôn dùng bộ mã hoá phần mềm chính xác, và một tác vụ phần cứng thất bại sẽ tự động thử lại bằng phần mềm.';

  @override
  String get transformNeedsReencode =>
      'Xoay, lật và tốc độ đều cần mã hoá lại, nên chúng bị tắt khi sao chép luồng.';

  @override
  String get capBitrateLabel => 'Không bao giờ làm tệp lớn hơn';

  @override
  String get capBitrateHint =>
      'Giới hạn mã hoá ở đúng tốc độ bit của nguồn. Chất lượng cố định vốn không có trần, nên một video đã nén sẵn có thể ra lớn hơn nếu không có giới hạn này.';

  @override
  String get keepSubtitles => 'Giữ phụ đề';

  @override
  String get keepSubtitlesHint =>
      'Mang các rãnh phụ đề sang tệp đầu ra. Chỉ phụ đề dạng văn bản.';

  @override
  String get sectionTrim => 'Cắt thời lượng';

  @override
  String get trimEnable => 'Cắt tệp nguồn';

  @override
  String get trimHint =>
      'Khả dụng khi trong hàng đợi có đúng một tệp với thời lượng đã biết.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Dung lượng mục tiêu';

  @override
  String get lowBatteryTitle => 'Pin yếu';

  @override
  String get lowBatteryBody =>
      'Chuyển đổi bắt bộ xử lý làm việc nặng. Bạn có thể cắm sạc trước, hoặc cứ tiếp tục.';

  @override
  String get lowBatteryContinue => 'Vẫn chuyển đổi';

  @override
  String get commonCancel => 'Huỷ';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã nhận $count tệp',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Lưu';

  @override
  String get savedToGallery => 'Đã lưu vào thư viện, album “Eluna Media”.';

  @override
  String get savedToDownloads => 'Đã lưu vào Tải xuống.';

  @override
  String get saveFailed => 'Không lưu được tệp.';

  @override
  String get jobRemovedUndo => 'Đã gỡ tác vụ.';

  @override
  String get finishedClearedUndo => 'Đã xoá các tác vụ hoàn tất.';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get errorDetailsTitle => 'Chi tiết lỗi';

  @override
  String get sectionConversionPrefs => 'Chuyển đổi';

  @override
  String get powerModeLabel => 'Chế độ năng lượng';

  @override
  String get powerEfficiency => 'Mát và nhanh';

  @override
  String get powerBalanced => 'Cân bằng';

  @override
  String get powerQuality => 'Nén tối đa';

  @override
  String get powerModeHint =>
      'Bộ mã hoá video làm việc nặng đến đâu. Mát hơn và nhanh hơn nghĩa là tệp lớn hơn đôi chút. Không có gì khác bị hạn chế — bao giờ cũng vậy.';

  @override
  String get hapticsLabel => 'Phản hồi rung';

  @override
  String get networkPrivacyTitle => 'Mạng và quyền riêng tư';

  @override
  String get netAuditIntro =>
      'Danh sách đầy đủ mọi thứ trong ứng dụng này có thể chạm tới mạng.';

  @override
  String get netAuditNoneTitle => 'Hoàn toàn không truy cập mạng';

  @override
  String get netAuditNoneBody =>
      'Ứng dụng không xin quyền internet, nên dù có muốn cũng không thể ra mạng — bạn có thể kiểm chứng trong thông tin ứng dụng của hệ thống. Không quảng cáo, không phân tích, không kiểm tra cập nhật. “Đánh giá ứng dụng” chuyển việc đó cho ứng dụng cửa hàng, và chính nó mới kết nối.';

  @override
  String get netAuditConversionTitle => 'Chuyển đổi';

  @override
  String get netAuditConversionBody =>
      'Chạy hoàn toàn trên thiết bị này qua FFmpeg đi kèm. Bật chế độ máy bay rồi chuyển đổi thử — vẫn chạy.';

  @override
  String get netAuditTelemetryTitle => 'Đo từ xa';

  @override
  String get netAuditTelemetryBody =>
      'Không hề có. Ứng dụng không thu thập phân tích, không báo cáo sự cố, không định danh, và không có hệ thống tài khoản.';

  @override
  String get netAuditTipsTitle => 'Tiền boa';

  @override
  String get netAuditTipsBody =>
      'Tiền boa do ứng dụng Play Store thực hiện, không phải ứng dụng này — vốn vẫn không có quyền internet. Nhưng thanh toán có thêm hai dòng vào danh sách quyền: “mua hàng trong ứng dụng”, và “xem kết nối mạng”, thứ chỉ đọc xem có kết nối hay không chứ không dùng được kết nối. Không có gì bị mua tự động, và tiền boa không mở khoá thứ gì: mọi tính năng ở đây đều miễn phí.';

  @override
  String get sectionSupport => 'Hỗ trợ';

  @override
  String get rateApp => 'Đánh giá ứng dụng';

  @override
  String get openLicenses => 'Giấy phép nguồn mở';

  @override
  String get presetAudioToMp3Title => 'Chuyển đổi âm thanh';

  @override
  String get presetAudioToMp3Body => 'Sang MP3 — phát được trên mọi thứ';

  @override
  String get presetCompressAudioTitle => 'Nén âm thanh';

  @override
  String get presetCompressAudioBody =>
      'AAC gọn hơn — ghi âm giọng nói, podcast';

  @override
  String get convertTo => 'Chuyển sang';

  @override
  String get formatSectionHint =>
      'Chỉ liệt kê những định dạng mà tệp của bạn thực sự có thể trở thành.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Ảnh';

  @override
  String get sourceAudio => 'Âm thanh';

  @override
  String get sourceUnknown => 'Tệp';

  @override
  String get mixedSelectionTitle => 'Đã chọn nhiều loại tệp khác nhau';

  @override
  String get mixedSelectionBody =>
      'Mỗi tệp được chuyển đổi bằng cài đặt phù hợp nhất với loại của nó. Thêm từng loại một để kiểm soát hoàn toàn.';

  @override
  String get filesTitle => 'Tệp';

  @override
  String get removeFile => 'Gỡ bỏ';

  @override
  String timeLeft(String time) {
    return 'còn ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Cài đặt chuyển đổi';

  @override
  String get jobDetails => 'Chi tiết';

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
  String get summaryEnhanced => 'Đã tăng cường';

  @override
  String get summaryMetadataStripped => 'Đã xoá siêu dữ liệu';

  @override
  String summaryMerge(int count) {
    return 'Đã ghép $count đoạn';
  }

  @override
  String get shareApp => 'Chia sẻ ứng dụng';

  @override
  String get shareAppText =>
      'Eluna Media — trình chuyển đổi ảnh, video và âm thanh miễn phí, hoàn toàn ngoại tuyến. Không thuê bao, không hình mờ, không tài khoản.';

  @override
  String appVersionLabel(String version) {
    return 'Phiên bản $version';
  }

  @override
  String get openFile => 'Mở';

  @override
  String get openFolder => 'Hiện thư mục';

  @override
  String get noAppToOpen =>
      'Không ứng dụng nào trên thiết bị này mở được tệp đó.';

  @override
  String get openFailed => 'Không mở được tệp.';

  @override
  String get twoPassLabel => 'Hai lượt để có dung lượng chính xác';

  @override
  String get twoPassHint =>
      'Tác vụ vừa dung lượng sẽ mã hoá hai lần và bám sát ngân sách byte chính xác hơn hẳn — đổi lại tốn khoảng gấp đôi thời gian và pin.';

  @override
  String get whatsNewTitle => 'Có gì mới';

  @override
  String get whatsNew1 =>
      'Video giờ có thể dùng AV1: tệp nhỏ hơn rõ rệt, nếu bạn đợi được.';

  @override
  String get whatsNew2 =>
      'Mới cho hình ảnh: AVIF chỉ khoảng một nửa JPEG, và WebP động thay cho GIF.';

  @override
  String get whatsNew3 =>
      'M4A có thể không mất dữ liệu — ALAC giờ nằm cạnh AAC.';

  @override
  String get whatsNew4 =>
      'Một màn hình cho giao diện: độ sáng, màu nhấn, đen tuyền cho OLED và Material You.';

  @override
  String get whatsNew5 =>
      'Thành tích có huy chương, ba thẻ, và tiến độ có thể chia sẻ dưới dạng hình ảnh.';

  @override
  String get achievementsTitle => 'Thành tích';

  @override
  String achievementsProgress(int done, int total) {
    return '$done trên $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Chỉ đếm trên thiết bị này. Không có gì được tải lên đâu cả.';

  @override
  String get achFirstConversionTitle => 'Bước đầu tiên';

  @override
  String get achFirstConversionBody => 'Chuyển đổi tệp đầu tiên của bạn.';

  @override
  String get achTenConversionsTitle => 'Đã khởi động';

  @override
  String get achTenConversionsBody => 'Chuyển đổi 10 tệp.';

  @override
  String get achFiftyConversionsTitle => 'Khách quen';

  @override
  String get achFiftyConversionsBody => 'Chuyển đổi 50 tệp.';

  @override
  String get achTwoHundredConversionsTitle => 'Ngựa thồ';

  @override
  String get achTwoHundredConversionsBody => 'Chuyển đổi 200 tệp.';

  @override
  String get achThousandConversionsTitle => 'Băng chuyền';

  @override
  String get achThousandConversionsBody => 'Chuyển đổi 1000 tệp.';

  @override
  String get achSaved100MbTitle => 'Người tiết kiệm';

  @override
  String get achSaved100MbBody => 'Giải phóng tổng cộng 100 MB.';

  @override
  String get achSaved1GbTitle => 'Thợ săn gigabyte';

  @override
  String get achSaved1GbBody => 'Giải phóng tổng cộng 1 GB.';

  @override
  String get achSaved10GbTitle => 'Anh hùng bộ nhớ';

  @override
  String get achSaved10GbBody => 'Giải phóng tổng cộng 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Thợ hàng loạt';

  @override
  String get achBatchOfFiveBody => 'Hoàn tất một lô từ 5 tệp trở lên.';

  @override
  String get achBatchOfTwentyTitle => 'Dây chuyền';

  @override
  String get achBatchOfTwentyBody => 'Hoàn tất một lô từ 20 tệp trở lên.';

  @override
  String get achSniperTitle => 'Xạ thủ';

  @override
  String get achSniperBody => 'Đạt đúng dung lượng bằng chế độ vừa dung lượng.';

  @override
  String get achMemeSmithTitle => 'Thợ rèn meme';

  @override
  String get achMemeSmithBody => 'Biến một video thành GIF.';

  @override
  String get achSoundHunterTitle => 'Thợ săn âm thanh';

  @override
  String get achSoundHunterBody => 'Tách âm thanh từ một video.';

  @override
  String get achSubtitleKeeperTitle => 'Người giữ phụ đề';

  @override
  String get achSubtitleKeeperBody => 'Chuyển đổi một video mà vẫn giữ phụ đề.';

  @override
  String get achDirectorTitle => 'Đạo diễn';

  @override
  String get achDirectorBody =>
      'Áp dụng một biến đổi — xoay, cắt, tốc độ hoặc âm lượng.';

  @override
  String get achAllRounderTitle => 'Toàn diện';

  @override
  String get achAllRounderBody => 'Chuyển đổi cả video, âm thanh và hình ảnh.';

  @override
  String get achNightOwlTitle => 'Cú đêm';

  @override
  String get achNightOwlBody =>
      'Hoàn tất một lần chuyển đổi trong khoảng nửa đêm đến 5 giờ sáng.';

  @override
  String get achPlatinumTitle => 'Bạch kim';

  @override
  String get achPlatinumBody => 'Giành được mọi thành tích khác.';

  @override
  String get storageTitle => 'Bộ nhớ';

  @override
  String get storageBody =>
      'Tệp đã chuyển đổi ở lại trong ứng dụng cho đến khi bạn lưu hoặc chia sẻ, nơi không trình quản lý tệp nào với tới được.';

  @override
  String get storageEmpty => 'Chưa lưu gì';

  @override
  String storageUsage(String size) {
    return 'Đang chiếm: $size';
  }

  @override
  String get storageClearTitle => 'Xoá các tệp đã lưu?';

  @override
  String get storageClearBody =>
      'Xoá mọi kết quả hoàn tất mà ứng dụng còn giữ. Những tệp bạn đã lưu hoặc chia sẻ vẫn nguyên vẹn.';

  @override
  String get storageClearAction => 'Xoá';

  @override
  String storageCleared(String size) {
    return 'Đã giải phóng $size';
  }

  @override
  String get autoSaveLabel => 'Tự động lưu kết quả';

  @override
  String get autoSaveHint =>
      'Đưa mỗi tệp hoàn tất vào thư viện — âm thanh vào Tải xuống — ngay khi sẵn sàng.';

  @override
  String get lowSpaceTitle => 'Còn ít dung lượng';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Lô này cần khoảng $needed mà chỉ còn trống $free. Quá trình chuyển đổi có thể dừng giữa chừng.';
  }

  @override
  String saveAll(int count) {
    return 'Lưu tất cả ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Đã lưu: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Đã lưu $saved trên $total';
  }

  @override
  String get presetFitPhotoTitle => 'Ảnh vừa dung lượng';

  @override
  String get presetFitPhotoBody =>
      'Ép một tấm ảnh xuống dưới giới hạn chính xác — biểu mẫu tải lên, hồ sơ.';

  @override
  String get photoFitHint =>
      'Ứng dụng thử lần lượt các mức chất lượng cho đến khi vừa. Nếu ngân sách quá nhỏ so với tấm ảnh, nó cũng thu nhỏ kích thước khung hình.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Dung lượng mục tiêu tính bằng KB';

  @override
  String get compareAction => 'So sánh';

  @override
  String get compareBefore => 'Trước';

  @override
  String get compareAfter => 'Sau';

  @override
  String get compareHint => 'Nhấn giữ để xem ảnh gốc.';

  @override
  String get trimStart => 'Bắt đầu';

  @override
  String get trimEnd => 'Kết thúc';

  @override
  String trimTimeHelp(String duration) {
    return 'p:gg, tối đa $duration';
  }

  @override
  String get imageScaleLabel => 'Tỷ lệ';

  @override
  String get audioChannelsLabel => 'Kênh';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Tần số lấy mẫu';

  @override
  String get voiceAudioHint =>
      'Mono ở 22,05 kHz thu nhỏ một bản ghi giọng nói còn khoảng một phần tư mà không nghe ra khác biệt. Với nhạc, hãy để cả hai ở mức gốc.';

  @override
  String get moveUp => 'Lên trên';

  @override
  String get moveDown => 'Xuống dưới';

  @override
  String get renameOutput => 'Đổi tên kết quả';

  @override
  String get renameOutputHint => 'Tên mới';

  @override
  String get renameOutputHelp =>
      'Phần mở rộng lấy theo định dạng đầu ra. Để trống thì kết quả sẽ mang tên tệp nguồn.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Xoá bản gốc ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Xoá bản gốc sau khi chuyển đổi';

  @override
  String get deleteOriginalsHint =>
      'Yêu cầu hệ thống xoá các tệp nguồn sau khi kết quả đã được lưu. Hệ thống luôn hiện những gì sắp mất và chờ bạn xác nhận.';

  @override
  String originalsDeleted(String size) {
    return 'Đã xoá bản gốc — giải phóng $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Không có gì bị xoá. Chỉ tìm được những tệp mà thư viện còn giữ đúng tên gốc.';

  @override
  String reclaimedTotal(String size) {
    return 'Đã giải phóng bằng ứng dụng này: $size';
  }

  @override
  String get deleteAllData => 'Xoá toàn bộ dữ liệu';

  @override
  String get deleteAllDataHint =>
      'Xoá mọi thứ ứng dụng giữ trên thiết bị này: hàng đợi, tệp đã chuyển đổi, ảnh xem trước, thành tích và cài đặt. Những tệp bạn đã lưu vào thư viện vẫn được giữ nguyên.';

  @override
  String get codecCopy => 'Sao chép';

  @override
  String get codecCopyRemux => 'Sao chép (đóng gói lại)';

  @override
  String get codecNoVideo => 'Không video';

  @override
  String get codecNoAudio => 'Không âm thanh';

  @override
  String codecLossless(String codec) {
    return '$codec (không mất dữ liệu)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (động)';
  }

  @override
  String get sizeTargetEmail => 'Email';

  @override
  String get trimTimeHint => 'p:gg';
}
