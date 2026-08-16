// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class L10nTh extends L10n {
  L10nTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'แปลงไฟล์';

  @override
  String get tabQueue => 'คิว';

  @override
  String get addFiles => 'เพิ่มไฟล์';

  @override
  String get emptySelectionTitle => 'ยังไม่มีไฟล์';

  @override
  String get emptySelectionBody =>
      'เพิ่มรูปภาพ วิดีโอ หรือเสียง ทุกอย่างประมวลผลบนเครื่องนี้';

  @override
  String get sectionOutput => 'ผลลัพธ์';

  @override
  String get sectionVideo => 'วิดีโอ';

  @override
  String get sectionAudio => 'เสียง';

  @override
  String get sectionImage => 'รูปภาพ';

  @override
  String get sectionPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get outputFormat => 'รูปแบบ';

  @override
  String get videoCodec => 'ตัวเข้ารหัสวิดีโอ';

  @override
  String get audioCodec => 'ตัวเข้ารหัสเสียง';

  @override
  String get rateControl => 'การควบคุมบิตเรต';

  @override
  String get rateControlQuality => 'คุณภาพคงที่ (CRF)';

  @override
  String get rateControlBitrate => 'บิตเรตเป้าหมาย';

  @override
  String crfLabel(int value) {
    return 'คุณภาพ (CRF $value)';
  }

  @override
  String get crfHint => 'ค่าน้อยกว่าให้คุณภาพดีกว่าและไฟล์ใหญ่กว่า';

  @override
  String videoBitrate(int value) {
    return 'บิตเรตวิดีโอ: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'บิตเรตเสียง: $value kbps';
  }

  @override
  String get encodingPreset => 'พรีเซ็ตตัวเข้ารหัส';

  @override
  String get encodingPresetHint =>
      'พรีเซ็ตที่ช้ากว่าบีบอัดได้ดีกว่า แต่ทำให้เครื่องร้อนกว่า';

  @override
  String get presetOriginal => 'ต้นฉบับ';

  @override
  String get resolution => 'ความละเอียด';

  @override
  String get frameRate => 'อัตราเฟรม';

  @override
  String imageQuality(int value) {
    return 'คุณภาพ: $value';
  }

  @override
  String get lossless => 'ไม่สูญเสียคุณภาพ';

  @override
  String get losslessHint => 'ไฟล์ใหญ่ขึ้น ผลลัพธ์ตรงทุกพิกเซล';

  @override
  String get sectionEnhance => 'การปรับแต่ง';

  @override
  String get sharpenLabel => 'ความคมชัด';

  @override
  String get sharpenHint =>
      'ทำให้ขอบคมขึ้น แต่กู้ภาพเบลอหรือหลุดโฟกัสไม่ได้ — รายละเอียดนั้นไม่มีอยู่ในไฟล์ตั้งแต่แรก';

  @override
  String get sharpenStrongHint =>
      'การเพิ่มความคมชัดแบบแรงอาจทิ้งขอบเรืองแสงไว้ ลองระดับปานกลางก่อน';

  @override
  String get denoiseLabel => 'ลดสัญญาณรบกวน';

  @override
  String get denoiseHint =>
      'ลดเกรนในภาพมืดและภาพกลางคืน หากมากเกินไปจะลบรายละเอียดเล็ก ๆ ทิ้ง';

  @override
  String get autoColorLabel => 'ปรับสีและระดับอัตโนมัติ';

  @override
  String get autoColorHint => 'ขยายคอนทราสต์และดึงสีที่จืดให้สดขึ้นเล็กน้อย';

  @override
  String get upscaleLabel => 'ขยาย 2×';

  @override
  String get upscaleHint =>
      'เพิ่มความกว้างและความสูงเป็นสองเท่า ไม่ได้เพิ่มรายละเอียด — แต่ช่วยตอนพิมพ์หรือครอป';

  @override
  String get upscaleConflictHint =>
      'ตั้งความละเอียดกลับเป็นต้นฉบับจึงจะขยายได้';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'ปิด';

  @override
  String get enhanceLight => 'เบา';

  @override
  String get enhanceMedium => 'ปานกลาง';

  @override
  String get enhanceStrong => 'แรง';

  @override
  String get stripMetadata => 'ลบข้อมูลเมทาดาทา';

  @override
  String get stripMetadataHint => 'ลบ EXIF, GPS และเวลาประทับออกจากไฟล์ผลลัพธ์';

  @override
  String startConversion(int count) {
    return 'แปลงไฟล์ ($count)';
  }

  @override
  String get batchResumed => 'ทำการแปลงที่ค้างไว้ต่อแล้ว';

  @override
  String get converting => 'กำลังแปลง…';

  @override
  String get cancelBatch => 'หยุด';

  @override
  String get cancelJob => 'ยกเลิก';

  @override
  String get clearFinished => 'ล้างรายการที่เสร็จแล้ว';

  @override
  String get removeJob => 'เอาออก';

  @override
  String get shareFile => 'แชร์';

  @override
  String get retryJob => 'ลองใหม่';

  @override
  String get queueEmptyTitle => 'คิวว่างเปล่า';

  @override
  String get queueEmptyBody => 'ไฟล์ที่คุณเพิ่มในแท็บแปลงไฟล์จะปรากฏที่นี่';

  @override
  String queueActiveTab(int count) {
    return 'กำลังทำ · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'เสร็จแล้ว · $count';
  }

  @override
  String get queueNoActiveTitle => 'ไม่มีอะไรกำลังทำ';

  @override
  String get queueNoActiveBody => 'ไฟล์ที่รออยู่หรือกำลังแปลงจะปรากฏที่นี่';

  @override
  String get queueNoFinishedTitle => 'ยังไม่มีอะไรเสร็จ';

  @override
  String get queueNoFinishedBody =>
      'ไฟล์ที่แปลงแล้วจะมาอยู่ที่นี่ พร้อมให้เปิด บันทึก หรือแชร์';

  @override
  String get statusQueued => 'อยู่ในคิว';

  @override
  String get statusRunning => 'กำลังแปลง';

  @override
  String get statusCompleted => 'เสร็จ';

  @override
  String get statusFailed => 'ล้มเหลว';

  @override
  String get statusCancelled => 'ยกเลิกแล้ว';

  @override
  String batchSummary(int done, int total) {
    return 'เสร็จ $done จาก $total';
  }

  @override
  String batchCompleted(int done) {
    return 'ไฟล์ที่แปลงแล้ว: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'แปลงสำเร็จ $done ล้มเหลว $failed';
  }

  @override
  String savedPercent(int percent) {
    return 'เล็กลง $percent%';
  }

  @override
  String grewPercent(int percent) {
    return 'ใหญ่ขึ้น $percent%';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'รูปลักษณ์';

  @override
  String get themeSystem => 'ตามระบบ';

  @override
  String get language => 'ภาษา';

  @override
  String get languageSystem => 'ตามระบบ';

  @override
  String get privacyTitle => 'ความเป็นส่วนตัว';

  @override
  String get privacyBody =>
      'Eluna Media แปลงไฟล์ของคุณบนเครื่องนี้ทั้งหมดด้วย FFmpeg ที่มาพร้อมแอป ไฟล์ของคุณไม่เคยออกจากเครื่อง ไม่ต้องมีบัญชี และไม่มีการเก็บข้อมูลการใช้งาน ไม่มีส่วนใดของแอปใช้เครือข่ายเลย — แอปไม่มีแม้แต่สิทธิ์เข้าถึงอินเทอร์เน็ต\n\nการลบเมทาดาทาเปิดไว้ตั้งแต่แรก ดังนั้น EXIF พิกัด GPS และเวลาประทับจะถูกลบออกจากไฟล์ที่คุณส่งออก';

  @override
  String get licenseTitle => 'สัญญาอนุญาต';

  @override
  String get licenseBody =>
      'แอปนี้มาพร้อม FFmpeg ที่สร้างด้วย x264, x265 และส่วนประกอบ GPL อื่น ๆ ดังนั้นแอปทั้งหมดจึงเผยแพร่ภายใต้ GNU GPL v3';

  @override
  String get sourceMissing => 'ไม่พบไฟล์ต้นฉบับแล้ว';

  @override
  String get tabSettings => 'การตั้งค่า';

  @override
  String get introTitle => 'เป็นส่วนตัวตั้งแต่การออกแบบ';

  @override
  String get introOfflineTitle => 'แปลงบนเครื่องนี้';

  @override
  String get introOfflineBody =>
      'FFmpeg ที่มาพร้อมแอปทำงานทั้งหมด ไฟล์ของคุณไม่ออกจากเครื่อง — เปิดโหมดเครื่องบินก็แปลงได้';

  @override
  String get introTelemetryTitle => 'ไม่มีการเก็บข้อมูลใด ๆ';

  @override
  String get introTelemetryBody =>
      'ไม่มีบัญชี ไม่มีการวิเคราะห์ ไม่มีรายงานข้อขัดข้อง แอปไม่รู้ว่าคุณเป็นใคร';

  @override
  String get introMetadataTitle => 'เมทาดาทาอยู่ในการควบคุม';

  @override
  String get introMetadataBody =>
      'EXIF, GPS และเวลาประทับถูกลบออกจากทุกไฟล์ผลลัพธ์โดยค่าเริ่มต้น คุณปิดได้';

  @override
  String get introFreeNote =>
      'ฟรี ไม่มีโฆษณาและไม่มีการสมัครสมาชิก ทุกฟีเจอร์รวมถึงการแปลงหลายไฟล์เป็นของคุณตั้งแต่แรก — สิ่งเดียวที่ซื้อได้คือทิป และมันไม่ปลดล็อกอะไรเลย';

  @override
  String get introContinue => 'เริ่มใช้งาน';

  @override
  String get modeSimple => 'อย่างง่าย';

  @override
  String get modeAdvanced => 'ขั้นสูง';

  @override
  String get modeAdvancedHint =>
      'แสดงตัวเข้ารหัส บิตเรต และการแปลงทุกอย่างแทนการ์ดพรีเซ็ต';

  @override
  String get presetCompressVideoTitle => 'บีบอัดวิดีโอ';

  @override
  String get presetCompressVideoBody => 'MP4 เล็กลงมาก คุณภาพยังดีอยู่';

  @override
  String get presetFitToSizeTitle => 'ให้พอดีขนาด';

  @override
  String get presetFitToSizeBody => 'ให้ตรงขีดจำกัด — Discord อีเมล แชต';

  @override
  String get presetCompatibleMp4Title => 'MP4 ที่เข้ากันได้';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC เล่นได้ทุกที่';

  @override
  String get presetExtractAudioTitle => 'ดึงเสียงออกมา';

  @override
  String get presetExtractAudioBody => 'MP3 จากวิดีโอใดก็ได้';

  @override
  String get presetVideoToGifTitle => 'วิดีโอเป็น GIF';

  @override
  String get presetVideoToGifBody => 'คลิปสั้นเป็น GIF เคลื่อนไหว';

  @override
  String get presetMergeTitle => 'รวมวิดีโอ';

  @override
  String get presetMergeBody => 'ต่อคลิปเป็น MP4 เดียวตามลำดับ';

  @override
  String get mergeNeedsTwo => 'เลือกวิดีโออย่างน้อยสองไฟล์เพื่อรวมกัน';

  @override
  String mergedVideoName(int count) {
    return 'วิดีโอที่รวมแล้ว ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'บีบอัดรูปภาพ';

  @override
  String get presetCompressImageBody => 'JPEG เล็กลง แทบไม่เห็นความต่าง';

  @override
  String get presetEnhancePhotoTitle => 'ปรับแต่งรูปภาพ';

  @override
  String get presetEnhancePhotoBody => 'สะอาดขึ้น คมขึ้น สีดีขึ้น';

  @override
  String get presetImageToWebpTitle => 'รูปภาพเป็น WebP';

  @override
  String get presetImageToWebpBody => 'รูปแบบสมัยใหม่ เล็กกว่า JPEG';

  @override
  String get sizeTargetTitle => 'ขนาดเป้าหมาย';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'กำหนดเอง…';

  @override
  String get sizeTargetDialogTitle => 'ขนาดเป้าหมายเป็น MB';

  @override
  String get sizeTargetTooSmall =>
      'เป้าหมายเล็กเกินไปสำหรับความยาวนี้ จะใช้คุณภาพที่ใกล้เคียงที่สุดแทน';

  @override
  String estimatePerFile(String size) {
    return '≈ $size ต่อไฟล์';
  }

  @override
  String estimateTotal(String size) {
    return 'ผลลัพธ์โดยประมาณ: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'ไฟล์ที่เลือก: $count';
  }

  @override
  String get promiseOffline => 'แปลงออฟไลน์ 100%';

  @override
  String get promiseBatchFree => 'แปลงหลายไฟล์ฟรี';

  @override
  String get promiseNoWatermark => 'ไม่มีลายน้ำ';

  @override
  String get sectionTransform => 'การแปลงภาพ';

  @override
  String get rotateLabel => 'หมุน';

  @override
  String get flipLabel => 'กลับด้านแนวนอน';

  @override
  String get speedLabel => 'ความเร็ว';

  @override
  String get cropLabel => 'ครอป';

  @override
  String get cropHint =>
      'ครอปจากกึ่งกลางตามอัตราส่วนที่เลือก — สี่เหลี่ยมจัตุรัสสำหรับฟีด 9:16 สำหรับสตอรี่';

  @override
  String volumeLabel(int percent) {
    return 'ระดับเสียง: $percent%';
  }

  @override
  String get addAudioFiles => 'เสียงและไฟล์อื่น ๆ';

  @override
  String get hwEncoderLabel => 'เข้ารหัสด้วยฮาร์ดแวร์';

  @override
  String get hwEncoderHint =>
      'ใช้ชิปวิดีโอของเครื่องในโหมดบิตเรตและโหมดพอดีขนาด — เร็วกว่ามากและเย็นกว่า โหมดคุณภาพ (CRF) ใช้ตัวเข้ารหัสซอฟต์แวร์ที่แม่นยำเสมอ และงานที่ฮาร์ดแวร์ทำไม่สำเร็จจะลองใหม่ด้วยซอฟต์แวร์โดยอัตโนมัติ';

  @override
  String get transformNeedsReencode =>
      'การหมุน กลับด้าน และความเร็วต้องเข้ารหัสใหม่ จึงถูกปิดไว้ระหว่างการคัดลอกสตรีม';

  @override
  String get capBitrateLabel => 'อย่าทำให้ไฟล์ใหญ่ขึ้นเด็ดขาด';

  @override
  String get capBitrateHint =>
      'จำกัดการเข้ารหัสไว้ที่บิตเรตของต้นฉบับเอง คุณภาพคงที่ไม่มีเพดานในตัว ดังนั้นวิดีโอที่บีบอัดมาแล้วอาจออกมาใหญ่กว่าเดิมได้';

  @override
  String get keepSubtitles => 'เก็บคำบรรยาย';

  @override
  String get keepSubtitlesHint =>
      'นำแทร็กคำบรรยายไปยังไฟล์ผลลัพธ์ เฉพาะคำบรรยายแบบข้อความ';

  @override
  String get sectionTrim => 'ตัดช่วง';

  @override
  String get trimEnable => 'ตัดไฟล์ต้นฉบับ';

  @override
  String get trimHint => 'ใช้ได้เมื่อในคิวมีไฟล์เดียวที่ทราบความยาว';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'ขนาดเป้าหมาย';

  @override
  String get lowBatteryTitle => 'แบตเตอรี่เหลือน้อย';

  @override
  String get lowBatteryBody =>
      'การแปลงไฟล์ใช้งานหน่วยประมวลผลหนัก คุณจะเสียบสายชาร์จก่อน หรือจะทำต่อเลยก็ได้';

  @override
  String get lowBatteryContinue => 'แปลงต่อไป';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get commonOk => 'ตกลง';

  @override
  String filesReceived(int count) {
    return 'ไฟล์ที่ได้รับ: $count';
  }

  @override
  String get saveFile => 'บันทึก';

  @override
  String get savedToGallery => 'บันทึกลงแกลเลอรีแล้ว อัลบั้ม “Eluna Media”';

  @override
  String get savedToDownloads => 'บันทึกลงในดาวน์โหลดแล้ว';

  @override
  String get saveFailed => 'บันทึกไฟล์ไม่สำเร็จ';

  @override
  String get jobRemovedUndo => 'เอางานออกแล้ว';

  @override
  String get finishedClearedUndo => 'ล้างงานที่เสร็จแล้ว';

  @override
  String get undo => 'เลิกทำ';

  @override
  String get errorDetailsTitle => 'รายละเอียดข้อผิดพลาด';

  @override
  String get sectionConversionPrefs => 'การแปลงไฟล์';

  @override
  String get powerModeLabel => 'โหมดพลังงาน';

  @override
  String get powerEfficiency => 'เย็นและเร็ว';

  @override
  String get powerBalanced => 'สมดุล';

  @override
  String get powerQuality => 'บีบอัดสูงสุด';

  @override
  String get powerModeHint =>
      'ตัวเข้ารหัสวิดีโอทำงานหนักแค่ไหน เย็นกว่าและเร็วกว่าหมายถึงไฟล์ใหญ่ขึ้นเล็กน้อย ส่วนอื่นไม่ถูกลดทอนเลย ไม่ว่าเมื่อใด';

  @override
  String get hapticsLabel => 'การตอบสนองด้วยการสั่น';

  @override
  String get networkPrivacyTitle => 'เครือข่ายและความเป็นส่วนตัว';

  @override
  String get netAuditIntro =>
      'รายการทั้งหมดของทุกสิ่งในแอปนี้ที่อาจแตะต้องเครือข่ายได้';

  @override
  String get netAuditNoneTitle => 'ไม่มีการเข้าถึงเครือข่ายเลย';

  @override
  String get netAuditNoneBody =>
      'แอปไม่ได้ขอสิทธิ์อินเทอร์เน็ต จึงเข้าถึงเครือข่ายไม่ได้แม้จะพยายาม — คุณตรวจสอบได้ในข้อมูลแอปของระบบ ไม่มีโฆษณา ไม่มีการวิเคราะห์ ไม่มีการตรวจหาอัปเดต ส่วน “ให้คะแนนแอป” จะส่งต่อให้แอปสโตร์ ซึ่งเป็นฝ่ายติดต่อเอง';

  @override
  String get netAuditConversionTitle => 'การแปลงไฟล์';

  @override
  String get netAuditConversionBody =>
      'ทำงานบนเครื่องนี้ทั้งหมดผ่าน FFmpeg ที่มาพร้อมแอป ลองเปิดโหมดเครื่องบินแล้วแปลงดู — ใช้ได้';

  @override
  String get netAuditTelemetryTitle => 'การเก็บข้อมูลการใช้งาน';

  @override
  String get netAuditTelemetryBody =>
      'ไม่มีเลย แอปไม่เก็บข้อมูลวิเคราะห์ ไม่เก็บรายงานข้อขัดข้อง ไม่เก็บตัวระบุตัวตน และไม่มีระบบบัญชี';

  @override
  String get netAuditTipsTitle => 'ทิป';

  @override
  String get netAuditTipsBody =>
      'ทิปดำเนินการโดยแอป Play Store ไม่ใช่แอปนี้ — ซึ่งยังคงไม่มีสิทธิ์อินเทอร์เน็ต แต่ระบบชำระเงินเพิ่มสองบรรทัดในรายการสิทธิ์: “การซื้อในแอป” และ “ดูการเชื่อมต่อเครือข่าย” ซึ่งอ่านได้เพียงว่ามีการเชื่อมต่ออยู่หรือไม่ และใช้การเชื่อมต่อนั้นไม่ได้ ไม่มีการซื้ออัตโนมัติเด็ดขาด และทิปไม่ปลดล็อกอะไรเลย ทุกอย่างที่นี่ฟรีทั้งหมด';

  @override
  String get sectionSupport => 'การสนับสนุน';

  @override
  String get rateApp => 'ให้คะแนนแอป';

  @override
  String get openLicenses => 'สัญญาอนุญาตโอเพนซอร์ส';

  @override
  String get presetAudioToMp3Title => 'แปลงไฟล์เสียง';

  @override
  String get presetAudioToMp3Body => 'เป็น MP3 — เล่นได้กับทุกอย่าง';

  @override
  String get presetCompressAudioTitle => 'บีบอัดเสียง';

  @override
  String get presetCompressAudioBody => 'AAC ที่เบากว่า — บันทึกเสียง พอดแคสต์';

  @override
  String get convertTo => 'แปลงเป็น';

  @override
  String get formatSectionHint =>
      'แสดงเฉพาะรูปแบบที่ไฟล์ของคุณกลายเป็นได้จริงเท่านั้น';

  @override
  String get sourceVideo => 'วิดีโอ';

  @override
  String get sourceImage => 'รูปภาพ';

  @override
  String get sourceAudio => 'เสียง';

  @override
  String get sourceUnknown => 'ไฟล์';

  @override
  String get mixedSelectionTitle => 'เลือกไฟล์ต่างชนิดกัน';

  @override
  String get mixedSelectionBody =>
      'แต่ละไฟล์จะถูกแปลงด้วยพรีเซ็ตที่เหมาะกับชนิดของมันเอง หากต้องการควบคุมทั้งหมด ให้เพิ่มทีละชนิด';

  @override
  String get filesTitle => 'ไฟล์';

  @override
  String get removeFile => 'เอาออก';

  @override
  String timeLeft(String time) {
    return 'เหลืออีก ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'การตั้งค่าการแปลง';

  @override
  String get jobDetails => 'รายละเอียด';

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
  String get summaryEnhanced => 'ปรับแต่งแล้ว';

  @override
  String get summaryMetadataStripped => 'ลบเมทาดาทาแล้ว';

  @override
  String summaryMerge(int count) {
    return 'คลิปที่รวมแล้ว: $count';
  }

  @override
  String get shareApp => 'แชร์แอป';

  @override
  String get shareAppText =>
      'Eluna Media — ตัวแปลงรูปภาพ วิดีโอ และเสียง ฟรีและทำงานออฟไลน์เต็มรูปแบบ ไม่มีการสมัครสมาชิก ไม่มีลายน้ำ ไม่มีบัญชี';

  @override
  String appVersionLabel(String version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get openFile => 'เปิด';

  @override
  String get openFolder => 'แสดงโฟลเดอร์';

  @override
  String get noAppToOpen => 'ไม่มีแอปในเครื่องนี้ที่เปิดไฟล์นั้นได้';

  @override
  String get openFailed => 'เปิดไฟล์ไม่สำเร็จ';

  @override
  String get twoPassLabel => 'สองรอบเพื่อขนาดที่แม่นยำ';

  @override
  String get twoPassHint =>
      'งานแบบพอดีขนาดจะเข้ารหัสสองครั้งและเข้าใกล้ขีดจำกัดไบต์ได้แม่นยำกว่าอย่างเห็นได้ชัด — แลกกับเวลาและแบตเตอรี่ราวสองเท่า';

  @override
  String get whatsNewTitle => 'มีอะไรใหม่';

  @override
  String get whatsNew1 => 'วิดีโอใช้ AV1 ได้แล้ว ไฟล์เล็กลงชัดเจน ถ้าคุณรอไหว';

  @override
  String get whatsNew2 =>
      'ใหม่สำหรับรูปภาพ: AVIF ที่เล็กราวครึ่งหนึ่งของ JPEG และ WebP เคลื่อนไหวแทน GIF';

  @override
  String get whatsNew3 =>
      'M4A ไม่สูญเสียคุณภาพได้แล้ว — ALAC มาอยู่เคียงข้าง AAC';

  @override
  String get whatsNew4 =>
      'หน้าจอเดียวสำหรับรูปลักษณ์: ความสว่าง สีเน้น ดำสนิทสำหรับ OLED และ Material You';

  @override
  String get whatsNew5 =>
      'ความสำเร็จมีเหรียญรางวัล สามแท็บ และความคืบหน้าที่แชร์เป็นรูปภาพได้';

  @override
  String get achievementsTitle => 'ความสำเร็จ';

  @override
  String achievementsProgress(int done, int total) {
    return '$done จาก $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'นับบนเครื่องนี้เท่านั้น ไม่มีการอัปโหลดไปที่ใด';

  @override
  String get achFirstConversionTitle => 'ก้าวแรก';

  @override
  String get achFirstConversionBody => 'แปลงไฟล์แรกของคุณ';

  @override
  String get achTenConversionsTitle => 'อุ่นเครื่องแล้ว';

  @override
  String get achTenConversionsBody => 'แปลง 10 ไฟล์';

  @override
  String get achFiftyConversionsTitle => 'ขาประจำ';

  @override
  String get achFiftyConversionsBody => 'แปลง 50 ไฟล์';

  @override
  String get achTwoHundredConversionsTitle => 'ตัวหลัก';

  @override
  String get achTwoHundredConversionsBody => 'แปลง 200 ไฟล์';

  @override
  String get achThousandConversionsTitle => 'สายพานลำเลียง';

  @override
  String get achThousandConversionsBody => 'แปลง 1000 ไฟล์';

  @override
  String get achSaved100MbTitle => 'นักประหยัดพื้นที่';

  @override
  String get achSaved100MbBody => 'เพิ่มพื้นที่ว่างรวม 100 MB';

  @override
  String get achSaved1GbTitle => 'นักล่ากิกะไบต์';

  @override
  String get achSaved1GbBody => 'เพิ่มพื้นที่ว่างรวม 1 GB';

  @override
  String get achSaved10GbTitle => 'ฮีโร่พื้นที่เก็บข้อมูล';

  @override
  String get achSaved10GbBody => 'เพิ่มพื้นที่ว่างรวม 10 GB';

  @override
  String get achBatchOfFiveTitle => 'คนงานชุดใหญ่';

  @override
  String get achBatchOfFiveBody => 'ทำชุดที่มี 5 ไฟล์ขึ้นไปให้เสร็จ';

  @override
  String get achBatchOfTwentyTitle => 'สายการผลิต';

  @override
  String get achBatchOfTwentyBody => 'ทำชุดที่มี 20 ไฟล์ขึ้นไปให้เสร็จ';

  @override
  String get achSniperTitle => 'มือแม่นปืน';

  @override
  String get achSniperBody => 'ทำขนาดให้ตรงเป๊ะด้วยโหมดพอดีขนาด';

  @override
  String get achMemeSmithTitle => 'ช่างตีมีม';

  @override
  String get achMemeSmithBody => 'เปลี่ยนวิดีโอเป็น GIF';

  @override
  String get achSoundHunterTitle => 'นักล่าเสียง';

  @override
  String get achSoundHunterBody => 'ดึงเสียงออกจากวิดีโอ';

  @override
  String get achSubtitleKeeperTitle => 'ผู้รักษาคำบรรยาย';

  @override
  String get achSubtitleKeeperBody => 'แปลงวิดีโอโดยเก็บคำบรรยายไว้';

  @override
  String get achDirectorTitle => 'ผู้กำกับ';

  @override
  String get achDirectorBody =>
      'ใช้การแปลงภาพสักอย่าง — หมุน ครอป ความเร็ว หรือระดับเสียง';

  @override
  String get achAllRounderTitle => 'ครบเครื่อง';

  @override
  String get achAllRounderBody => 'แปลงทั้งวิดีโอ เสียง และรูปภาพ';

  @override
  String get achNightOwlTitle => 'นกฮูกกลางคืน';

  @override
  String get achNightOwlBody => 'แปลงไฟล์ให้เสร็จระหว่างเที่ยงคืนถึงตีห้า';

  @override
  String get achPlatinumTitle => 'แพลทินัม';

  @override
  String get achPlatinumBody => 'ได้รับความสำเร็จอื่นทั้งหมด';

  @override
  String get storageTitle => 'พื้นที่เก็บข้อมูล';

  @override
  String get storageBody =>
      'ไฟล์ที่แปลงแล้วจะอยู่ในแอปจนกว่าคุณจะบันทึกหรือแชร์ ซึ่งเป็นที่ที่ตัวจัดการไฟล์เข้าไม่ถึง';

  @override
  String get storageEmpty => 'ไม่มีอะไรเก็บอยู่';

  @override
  String storageUsage(String size) {
    return 'เก็บอยู่: $size';
  }

  @override
  String get storageClearTitle => 'ล้างไฟล์ที่เก็บไว้ไหม';

  @override
  String get storageClearBody =>
      'ลบผลลัพธ์ที่เสร็จแล้วทั้งหมดที่แอปยังเก็บไว้ ไฟล์ที่คุณบันทึกหรือแชร์ไปแล้วจะไม่ถูกแตะต้อง';

  @override
  String get storageClearAction => 'ล้าง';

  @override
  String storageCleared(String size) {
    return 'เพิ่มพื้นที่ว่าง $size';
  }

  @override
  String get autoSaveLabel => 'บันทึกผลลัพธ์อัตโนมัติ';

  @override
  String get autoSaveHint =>
      'ใส่ไฟล์ที่เสร็จแต่ละไฟล์ลงแกลเลอรี — เสียงลงในดาวน์โหลด — ทันทีที่พร้อม';

  @override
  String get lowSpaceTitle => 'พื้นที่เหลือไม่มาก';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'ชุดนี้ต้องใช้ราว $needed แต่เหลือว่างเพียง $free การแปลงอาจหยุดกลางคัน';
  }

  @override
  String saveAll(int count) {
    return 'บันทึกทั้งหมด ($count)';
  }

  @override
  String savedAll(int count) {
    return 'บันทึกแล้ว: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'บันทึกแล้ว $saved จาก $total';
  }

  @override
  String get presetFitPhotoTitle => 'รูปภาพให้พอดีขนาด';

  @override
  String get presetFitPhotoBody =>
      'บีบรูปให้ต่ำกว่าขีดจำกัดที่แน่นอน — แบบฟอร์มอัปโหลด ใบสมัคร';

  @override
  String get photoFitHint =>
      'แอปจะลองคุณภาพไปเรื่อย ๆ จนกว่าจะพอดี หากขีดจำกัดเล็กเกินไปสำหรับรูปนี้ ก็จะลดขนาดภาพลงด้วย';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'ขนาดเป้าหมายเป็น KB';

  @override
  String get compareAction => 'เปรียบเทียบ';

  @override
  String get compareBefore => 'ก่อน';

  @override
  String get compareAfter => 'หลัง';

  @override
  String get compareHint => 'กดค้างเพื่อดูภาพต้นฉบับ';

  @override
  String get trimStart => 'เริ่ม';

  @override
  String get trimEnd => 'สิ้นสุด';

  @override
  String trimTimeHelp(String duration) {
    return 'น:วว สูงสุด $duration';
  }

  @override
  String get imageScaleLabel => 'สัดส่วน';

  @override
  String get audioChannelsLabel => 'ช่องสัญญาณ';

  @override
  String get audioMono => 'โมโน';

  @override
  String get audioStereo => 'สเตอริโอ';

  @override
  String get sampleRateLabel => 'อัตราสุ่มตัวอย่าง';

  @override
  String get voiceAudioHint =>
      'โมโนที่ 22.05 kHz ลดขนาดไฟล์บันทึกเสียงพูดเหลือราวหนึ่งในสี่โดยไม่ได้ยินความต่าง สำหรับเพลงให้คงไว้ที่ต้นฉบับทั้งสองอย่าง';

  @override
  String get moveUp => 'เลื่อนขึ้น';

  @override
  String get moveDown => 'เลื่อนลง';

  @override
  String get renameOutput => 'เปลี่ยนชื่อผลลัพธ์';

  @override
  String get renameOutputHint => 'ชื่อใหม่';

  @override
  String get renameOutputHelp =>
      'นามสกุลไฟล์มาจากรูปแบบผลลัพธ์ เว้นว่างไว้เพื่อใช้ชื่อเดียวกับไฟล์ต้นฉบับ';

  @override
  String deleteOriginalsAction(int count) {
    return 'ลบไฟล์ต้นฉบับ ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'ลบไฟล์ต้นฉบับหลังแปลงเสร็จ';

  @override
  String get deleteOriginalsHint =>
      'ขอให้ระบบลบไฟล์ต้นฉบับเมื่อบันทึกผลลัพธ์แล้ว ระบบจะแสดงสิ่งที่กำลังจะถูกลบและรอการยืนยันจากคุณเสมอ';

  @override
  String get mediaAccessRequired =>
      'ต้องมีสิทธิ์เข้าถึงคลังสื่อจึงจะลบไฟล์ต้นฉบับได้';

  @override
  String originalsDeleted(String size) {
    return 'ลบไฟล์ต้นฉบับแล้ว — เพิ่มพื้นที่ว่าง $size';
  }

  @override
  String get originalsNoneDeleted =>
      'ไม่มีอะไรถูกลบ ค้นหาได้เฉพาะไฟล์ที่แกลเลอรียังเก็บไว้ภายใต้ชื่อเดิมเท่านั้น';

  @override
  String reclaimedTotal(String size) {
    return 'เพิ่มพื้นที่ว่างด้วยแอปนี้: $size';
  }

  @override
  String get deleteAllData => 'ลบข้อมูลทั้งหมด';

  @override
  String get deleteAllDataHint =>
      'ลบทุกอย่างที่แอปเก็บไว้บนเครื่องนี้: คิว ไฟล์ที่แปลงแล้ว ภาพตัวอย่าง ความสำเร็จ และการตั้งค่า ไฟล์ที่คุณบันทึกลงแกลเลอรีไปแล้วจะไม่ถูกแตะต้อง';

  @override
  String get codecCopy => 'คัดลอก';

  @override
  String get codecCopyRemux => 'คัดลอก (เปลี่ยนภาชนะ)';

  @override
  String get codecNoVideo => 'ไม่มีวิดีโอ';

  @override
  String get codecNoAudio => 'ไม่มีเสียง';

  @override
  String codecLossless(String codec) {
    return '$codec (ไม่สูญเสียคุณภาพ)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (เคลื่อนไหว)';
  }

  @override
  String get sizeTargetEmail => 'อีเมล';

  @override
  String get trimTimeHint => 'น:วว';
}
