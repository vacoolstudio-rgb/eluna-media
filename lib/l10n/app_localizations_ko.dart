// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class L10nKo extends L10n {
  L10nKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => '변환';

  @override
  String get tabQueue => '대기열';

  @override
  String get addFiles => '파일 추가';

  @override
  String get emptySelectionTitle => '아직 파일이 없어요';

  @override
  String get emptySelectionBody => '사진, 동영상, 오디오를 추가하세요. 모든 처리는 이 기기에서 이루어져요.';

  @override
  String get sectionOutput => '출력';

  @override
  String get sectionVideo => '동영상';

  @override
  String get sectionAudio => '오디오';

  @override
  String get sectionImage => '이미지';

  @override
  String get sectionPrivacy => '개인정보 보호';

  @override
  String get outputFormat => '형식';

  @override
  String get videoCodec => '비디오 코덱';

  @override
  String get audioCodec => '오디오 코덱';

  @override
  String get rateControl => '레이트 제어';

  @override
  String get rateControlQuality => '고정 품질 (CRF)';

  @override
  String get rateControlBitrate => '목표 비트레이트';

  @override
  String crfLabel(int value) {
    return '품질 (CRF $value)';
  }

  @override
  String get crfHint => '값이 낮을수록 품질이 좋아지고 파일은 커져요.';

  @override
  String videoBitrate(int value) {
    return '비디오 비트레이트: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return '오디오 비트레이트: $value kbps';
  }

  @override
  String get encodingPreset => '인코더 프리셋';

  @override
  String get encodingPresetHint => '느린 프리셋일수록 압축은 잘 되지만 기기가 더 뜨거워져요.';

  @override
  String get presetOriginal => '원본';

  @override
  String get resolution => '해상도';

  @override
  String get frameRate => '프레임 레이트';

  @override
  String imageQuality(int value) {
    return '품질: $value';
  }

  @override
  String get lossless => '무손실';

  @override
  String get losslessHint => '파일은 커지지만 픽셀 그대로 보존돼요.';

  @override
  String get sectionEnhance => '보정';

  @override
  String get sharpenLabel => '선명도';

  @override
  String get sharpenHint =>
      '가장자리를 또렷하게 만들어요. 흔들리거나 초점이 나간 사진은 되살릴 수 없어요 — 그 디테일은 파일에 아예 없거든요.';

  @override
  String get sharpenStrongHint =>
      '선명도를 너무 세게 주면 가장자리에 밝은 테두리가 생길 수 있어요. 먼저 \'중간\'으로 해 보세요.';

  @override
  String get denoiseLabel => '노이즈 감소';

  @override
  String get denoiseHint => '어둡거나 밤에 찍은 사진의 노이즈를 정리해요. 너무 세면 세밀한 디테일까지 뭉개져요.';

  @override
  String get autoColorLabel => '자동 색상·레벨 보정';

  @override
  String get autoColorHint => '대비를 넓히고 밋밋한 색을 조금 살려 줘요.';

  @override
  String get upscaleLabel => '2× 업스케일';

  @override
  String get upscaleHint =>
      '가로와 세로를 두 배로 키워요. 디테일이 늘어나지는 않아요 — 인쇄하거나 잘라낼 때 쓸모가 있어요.';

  @override
  String get upscaleConflictHint => '업스케일하려면 \'해상도\'를 \'원본\'으로 되돌려 주세요.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => '끔';

  @override
  String get enhanceLight => '약하게';

  @override
  String get enhanceMedium => '중간';

  @override
  String get enhanceStrong => '강하게';

  @override
  String get stripMetadata => '메타데이터 제거';

  @override
  String get stripMetadataHint => '출력에서 EXIF, GPS, 타임스탬프를 지워요.';

  @override
  String startConversion(int count) {
    return '파일 $count개 변환';
  }

  @override
  String get batchResumed => '중단된 변환을 다시 시작했어요.';

  @override
  String get converting => '변환 중…';

  @override
  String get cancelBatch => '중지';

  @override
  String get cancelJob => '취소';

  @override
  String get clearFinished => '완료 항목 지우기';

  @override
  String get removeJob => '삭제';

  @override
  String get shareFile => '공유';

  @override
  String get retryJob => '다시 시도';

  @override
  String get queueEmptyTitle => '대기열이 비어 있어요';

  @override
  String get queueEmptyBody => '변환 탭에서 추가한 파일이 여기에 표시돼요.';

  @override
  String queueActiveTab(int count) {
    return '진행 중 · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return '완료 · $count';
  }

  @override
  String get queueNoActiveTitle => '진행 중인 작업이 없어요';

  @override
  String get queueNoActiveBody => '대기 중이거나 변환 중인 파일이 여기에 표시돼요.';

  @override
  String get queueNoFinishedTitle => '아직 완료된 작업이 없어요';

  @override
  String get queueNoFinishedBody => '변환한 파일이 여기에 모여요. 바로 열거나 저장하거나 공유할 수 있어요.';

  @override
  String get statusQueued => '대기 중';

  @override
  String get statusRunning => '변환 중';

  @override
  String get statusCompleted => '완료';

  @override
  String get statusFailed => '실패';

  @override
  String get statusCancelled => '취소됨';

  @override
  String batchSummary(int done, int total) {
    return '$total개 중 $done개 완료';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '파일 $done개를 변환했어요',
      one: '파일 1개를 변환했어요',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done개 변환, $failed개 실패.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% 작아짐';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% 커짐';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => '화면';

  @override
  String get themeSystem => '시스템';

  @override
  String get language => '언어';

  @override
  String get languageSystem => '시스템';

  @override
  String get privacyTitle => '개인정보 보호';

  @override
  String get privacyBody =>
      'Eluna Media는 내장된 FFmpeg로 파일을 전부 이 기기에서 변환해요. 파일이 기기를 벗어나는 일은 없고, 계정도 필요 없고, 텔레메트리도 없어요. 네트워크를 쓰는 기능은 하나도 없어요 — 인터넷 권한조차 없거든요.\n\n메타데이터 제거가 기본으로 켜져 있어서 내보내는 파일에서 EXIF, GPS 좌표, 타임스탬프가 삭제돼요.';

  @override
  String get licenseTitle => '라이선스';

  @override
  String get licenseBody =>
      '이 앱에는 x264, x265 등 GPL 구성 요소로 빌드된 FFmpeg가 포함되어 있어서, 앱 전체가 GNU GPL v3에 따라 배포돼요.';

  @override
  String get sourceMissing => '원본 파일을 더 이상 찾을 수 없어요.';

  @override
  String get tabSettings => '설정';

  @override
  String get introTitle => '설계부터 프라이빗하게';

  @override
  String get introOfflineTitle => '이 기기에서 변환';

  @override
  String get introOfflineBody =>
      '모든 작업은 내장된 FFmpeg가 해요. 파일이 폰을 벗어나지 않아서 비행기 모드에서도 변환할 수 있어요.';

  @override
  String get introTelemetryTitle => '텔레메트리 제로';

  @override
  String get introTelemetryBody => '계정도, 분석도, 오류 보고도 없어요. 앱은 당신이 누구인지 몰라요.';

  @override
  String get introMetadataTitle => '메타데이터도 내 마음대로';

  @override
  String get introMetadataBody =>
      'EXIF, GPS, 타임스탬프는 기본적으로 모든 출력에서 제거돼요. 원하면 끌 수 있어요.';

  @override
  String get introFreeNote =>
      '무료예요. 광고도, 구독도, 인앱 결제도 없어요. 일괄 변환을 포함한 모든 기능을 그대로 쓸 수 있어요.';

  @override
  String get introContinue => '시작하기';

  @override
  String get modeSimple => '간단';

  @override
  String get modeAdvanced => '고급';

  @override
  String get modeAdvancedHint => '프리셋 카드 대신 코덱, 비트레이트, 변형 설정을 전부 보여줘요.';

  @override
  String get presetCompressVideoTitle => '동영상 압축';

  @override
  String get presetCompressVideoBody => 'MP4를 훨씬 작게, 품질은 그대로';

  @override
  String get presetFitToSizeTitle => '크기 맞추기';

  @override
  String get presetFitToSizeBody => '정확한 용량 제한에 맞춰요 — Discord, 이메일, 채팅';

  @override
  String get presetCompatibleMp4Title => '호환용 MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. 어디서든 재생돼요';

  @override
  String get presetExtractAudioTitle => '오디오 추출';

  @override
  String get presetExtractAudioBody => '어떤 동영상에서든 MP3로';

  @override
  String get presetVideoToGifTitle => '동영상을 GIF로';

  @override
  String get presetVideoToGifBody => '짧은 클립을 움직이는 GIF로';

  @override
  String get presetMergeTitle => '동영상 이어 붙이기';

  @override
  String get presetMergeBody => '클립을 순서대로 하나의 MP4로';

  @override
  String get mergeNeedsTwo => '이어 붙이려면 동영상을 2개 이상 선택하세요.';

  @override
  String mergedVideoName(int count) {
    return '이어 붙인 동영상 ($count개 클립).mp4';
  }

  @override
  String get presetCompressImageTitle => '사진 압축';

  @override
  String get presetCompressImageBody => 'JPEG를 더 작게, 차이는 거의 안 보여요';

  @override
  String get presetEnhancePhotoTitle => '사진 보정';

  @override
  String get presetEnhancePhotoBody => '더 깨끗하고 선명하게, 색도 살아나요';

  @override
  String get presetImageToWebpTitle => '사진을 WebP로';

  @override
  String get presetImageToWebpBody => 'JPEG보다 작은 최신 형식';

  @override
  String get sizeTargetTitle => '목표 크기';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => '직접 입력…';

  @override
  String get sizeTargetDialogTitle => '목표 크기 (MB)';

  @override
  String get sizeTargetTooSmall =>
      '이 길이에 비해 목표가 너무 작아요. 가능한 한 가장 가까운 품질을 사용할게요.';

  @override
  String estimatePerFile(String size) {
    return '파일당 ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return '예상 출력: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '파일 $count개 선택됨',
      one: '파일 1개 선택됨',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% 오프라인 변환';

  @override
  String get promiseBatchFree => '일괄 변환도 무료';

  @override
  String get promiseNoWatermark => '워터마크 없음';

  @override
  String get sectionTransform => '변형';

  @override
  String get rotateLabel => '회전';

  @override
  String get flipLabel => '좌우 반전';

  @override
  String get speedLabel => '속도';

  @override
  String get cropLabel => '자르기';

  @override
  String get cropHint => '선택한 비율로 가운데를 기준으로 잘라요. 피드용 정사각형, 스토리용 9:16.';

  @override
  String volumeLabel(int percent) {
    return '볼륨: $percent%';
  }

  @override
  String get addAudioFiles => '오디오 및 기타 파일';

  @override
  String get hwEncoderLabel => '하드웨어 인코딩';

  @override
  String get hwEncoderHint =>
      '비트레이트와 크기 맞추기 모드에서 기기의 비디오 칩을 사용해요. 훨씬 빠르고 발열도 적어요. 품질 (CRF) 모드는 항상 정밀한 소프트웨어 인코더를 쓰고, 실패한 하드웨어 작업은 자동으로 소프트웨어로 다시 시도돼요.';

  @override
  String get transformNeedsReencode =>
      '회전, 반전, 속도는 재인코딩이 필요해서 스트림 복사 중에는 사용할 수 없어요.';

  @override
  String get capBitrateLabel => '파일을 절대 키우지 않기';

  @override
  String get capBitrateHint =>
      '인코딩을 원본의 비트레이트로 제한해요. 고정 품질은 자체 상한이 없어서, 이미 압축된 영상은 이 설정이 없으면 원본보다 커질 수 있어요.';

  @override
  String get keepSubtitles => '자막 유지';

  @override
  String get keepSubtitlesHint => '자막 트랙을 출력으로 가져가요. 텍스트 자막만 지원해요.';

  @override
  String get sectionTrim => '구간 자르기';

  @override
  String get trimEnable => '원본 구간 자르기';

  @override
  String get trimHint => '길이를 알 수 있는 파일이 대기열에 딱 하나 있을 때 사용할 수 있어요.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => '목표 크기';

  @override
  String get lowBatteryTitle => '배터리가 부족해요';

  @override
  String get lowBatteryBody =>
      '변환은 프로세서를 많이 사용해요. 먼저 충전기를 연결하거나, 그냥 계속할 수도 있어요.';

  @override
  String get lowBatteryContinue => '그래도 변환';

  @override
  String get commonCancel => '취소';

  @override
  String get commonOk => '확인';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '파일 $count개를 받았어요',
      one: '파일 1개를 받았어요',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => '저장';

  @override
  String get savedToGallery => '갤러리의 \'Eluna Media\' 앨범에 저장했어요.';

  @override
  String get savedToDownloads => '다운로드 폴더에 저장했어요.';

  @override
  String get saveFailed => '파일을 저장하지 못했어요.';

  @override
  String get jobRemovedUndo => '작업을 삭제했어요.';

  @override
  String get finishedClearedUndo => '완료된 작업을 지웠어요.';

  @override
  String get undo => '실행 취소';

  @override
  String get errorDetailsTitle => '오류 상세 정보';

  @override
  String get sectionConversionPrefs => '변환';

  @override
  String get powerModeLabel => '전력 모드';

  @override
  String get powerEfficiency => '시원하고 빠르게';

  @override
  String get powerBalanced => '균형';

  @override
  String get powerQuality => '최대 압축';

  @override
  String get powerModeHint =>
      '비디오 인코더가 얼마나 열심히 일할지 정해요. 시원하고 빠를수록 파일이 조금 커져요. 그 외에는 아무것도 제한하지 않아요 — 절대로.';

  @override
  String get hapticsLabel => '진동 피드백';

  @override
  String get networkPrivacyTitle => '네트워크 및 개인정보 보호';

  @override
  String get netAuditIntro => '이 앱에서 네트워크에 접근할 수 있는 모든 것의 전체 목록이에요.';

  @override
  String get netAuditNoneTitle => '네트워크에 아예 접속하지 않아요';

  @override
  String get netAuditNoneBody =>
      '앱이 인터넷 권한을 요청하지 않아서 접속하려 해도 할 수 없어요. 시스템 앱 정보에서 직접 확인해 보세요. 광고도, 분석도, 업데이트 확인도 없어요. \'앱 평가하기\'는 스토어 앱으로 넘길 뿐이고, 통신은 스토어가 해요.';

  @override
  String get netAuditConversionTitle => '변환';

  @override
  String get netAuditConversionBody =>
      '내장된 FFmpeg로 전부 이 기기에서 실행돼요. 비행기 모드를 켜고 변환해 보세요 — 잘 돼요.';

  @override
  String get netAuditTelemetryTitle => '텔레메트리';

  @override
  String get netAuditTelemetryBody =>
      '없어요. 앱은 분석도, 오류 보고도, 식별자도 수집하지 않고, 계정 시스템도 없어요.';

  @override
  String get netAuditTipsTitle => '후원';

  @override
  String get netAuditTipsBody =>
      '후원 결제는 이 앱이 아니라 Play 스토어 앱이 처리합니다. 이 앱에는 여전히 인터넷 권한이 없습니다. 결제 기능 때문에 권한 목록에 두 줄이 추가됩니다. ‘인앱 구매’와 ‘네트워크 연결 보기’인데, 뒤엣것은 연결이 있는지만 확인할 뿐 사용할 수는 없습니다. 자동으로 결제되는 일은 없고, 후원해도 잠금이 풀리는 기능은 없습니다. 여기 있는 모든 것은 무료입니다.';

  @override
  String get sectionSupport => '후원';

  @override
  String get rateApp => '앱 평가하기';

  @override
  String get openLicenses => '오픈 소스 라이선스';

  @override
  String get presetAudioToMp3Title => '오디오 변환';

  @override
  String get presetAudioToMp3Body => 'MP3로 — 어디서나 재생돼요';

  @override
  String get presetCompressAudioTitle => '오디오 압축';

  @override
  String get presetCompressAudioBody => '더 가벼운 AAC — 음성 메모, 팟캐스트';

  @override
  String get convertTo => '변환 형식';

  @override
  String get formatSectionHint => '고른 파일이 실제로 바뀔 수 있는 형식만 보여줘요.';

  @override
  String get sourceVideo => '동영상';

  @override
  String get sourceImage => '사진';

  @override
  String get sourceAudio => '오디오';

  @override
  String get sourceUnknown => '파일';

  @override
  String get mixedSelectionTitle => '서로 다른 파일 형식이 선택됐어요';

  @override
  String get mixedSelectionBody =>
      '각 파일은 자기 형식에 가장 잘 맞는 프리셋으로 변환돼요. 세밀하게 조절하려면 한 번에 한 종류씩 추가하세요.';

  @override
  String get filesTitle => '파일';

  @override
  String get removeFile => '제거';

  @override
  String timeLeft(String time) {
    return '≈ $time 남음';
  }

  @override
  String get jobSettingsTitle => '변환 설정';

  @override
  String get jobDetails => '상세 정보';

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
  String get summaryEnhanced => '보정됨';

  @override
  String get summaryMetadataStripped => '메타데이터 제거됨';

  @override
  String summaryMerge(int count) {
    return '클립 $count개 병합';
  }

  @override
  String get shareApp => '앱 공유하기';

  @override
  String get shareAppText =>
      'Eluna Media — 완전히 오프라인으로 동작하는 무료 사진, 동영상, 오디오 변환기. 구독도, 워터마크도, 계정도 없어요.';

  @override
  String appVersionLabel(String version) {
    return '버전 $version';
  }

  @override
  String get openFile => '열기';

  @override
  String get openFolder => '폴더 보기';

  @override
  String get noAppToOpen => '이 기기에는 그 파일을 열 수 있는 앱이 없어요.';

  @override
  String get openFailed => '파일을 열지 못했어요.';

  @override
  String get twoPassLabel => '정확한 크기를 위한 2패스';

  @override
  String get twoPassHint =>
      '크기 맞추기 작업을 두 번 인코딩해서 목표 용량에 훨씬 정확하게 맞춰요. 대신 시간과 배터리가 대략 두 배 들어요.';

  @override
  String get whatsNewTitle => '새로운 기능';

  @override
  String get whatsNew1 => '이제 동영상을 AV1으로 만들 수 있습니다. 기다릴 수 있다면 파일이 훨씬 작아집니다.';

  @override
  String get whatsNew2 =>
      '이미지에 새 형식이 생겼습니다. JPEG의 약 절반인 AVIF, 그리고 GIF 대신 쓰는 움직이는 WebP.';

  @override
  String get whatsNew3 => 'M4A를 무손실로 저장할 수 있습니다. AAC 옆에 ALAC이 생겼습니다.';

  @override
  String get whatsNew4 =>
      '테마가 한 화면에 모였습니다. 밝기, 강조 색, 완전한 검정 OLED, Material You.';

  @override
  String get whatsNew5 => '업적에 메달과 세 개의 탭이 생기고, 진행 상황을 이미지로 공유할 수 있습니다.';

  @override
  String get achievementsTitle => '업적';

  @override
  String achievementsProgress(int done, int total) {
    return '$total개 중 $done개';
  }

  @override
  String get achievementsPrivacyNote => '이 기기에서만 집계돼요. 어디에도 업로드되지 않아요.';

  @override
  String get achFirstConversionTitle => '첫걸음';

  @override
  String get achFirstConversionBody => '첫 파일을 변환해 보세요.';

  @override
  String get achTenConversionsTitle => '몸풀기';

  @override
  String get achTenConversionsBody => '파일 10개를 변환하세요.';

  @override
  String get achFiftyConversionsTitle => '단골';

  @override
  String get achFiftyConversionsBody => '파일 50개를 변환하세요.';

  @override
  String get achTwoHundredConversionsTitle => '일꾼';

  @override
  String get achTwoHundredConversionsBody => '파일 200개를 변환하세요.';

  @override
  String get achThousandConversionsTitle => '컨베이어';

  @override
  String get achThousandConversionsBody => '파일 1000개를 변환하세요.';

  @override
  String get achSaved100MbTitle => '공간 절약러';

  @override
  String get achSaved100MbBody => '총 100 MB를 확보하세요.';

  @override
  String get achSaved1GbTitle => '기가바이트 사냥꾼';

  @override
  String get achSaved1GbBody => '총 1 GB를 확보하세요.';

  @override
  String get achSaved10GbTitle => '저장 공간 영웅';

  @override
  String get achSaved10GbBody => '총 10 GB를 확보하세요.';

  @override
  String get achBatchOfFiveTitle => '배치 워커';

  @override
  String get achBatchOfFiveBody => '파일 5개 이상 배치를 완료하세요.';

  @override
  String get achBatchOfTwentyTitle => '조립 라인';

  @override
  String get achBatchOfTwentyBody => '파일 20개 이상 배치를 완료하세요.';

  @override
  String get achSniperTitle => '스나이퍼';

  @override
  String get achSniperBody => '크기 맞추기로 정확한 크기를 맞히세요.';

  @override
  String get achMemeSmithTitle => '밈 장인';

  @override
  String get achMemeSmithBody => '동영상을 GIF로 만들어 보세요.';

  @override
  String get achSoundHunterTitle => '소리 사냥꾼';

  @override
  String get achSoundHunterBody => '동영상에서 오디오를 추출하세요.';

  @override
  String get achSubtitleKeeperTitle => '자막 지킴이';

  @override
  String get achSubtitleKeeperBody => '자막을 유지한 채 동영상을 변환하세요.';

  @override
  String get achDirectorTitle => '감독';

  @override
  String get achDirectorBody => '변형을 적용해 보세요 — 회전, 자르기, 속도, 볼륨 중 하나.';

  @override
  String get achAllRounderTitle => '올라운더';

  @override
  String get achAllRounderBody => '동영상, 오디오, 이미지를 모두 변환하세요.';

  @override
  String get achNightOwlTitle => '올빼미';

  @override
  String get achNightOwlBody => '자정부터 새벽 5시 사이에 변환을 완료하세요.';

  @override
  String get achPlatinumTitle => '플래티넘';

  @override
  String get achPlatinumBody => '다른 모든 업적을 달성하세요.';

  @override
  String get storageTitle => '저장 공간';

  @override
  String get storageBody =>
      '변환된 파일은 저장하거나 공유하기 전까지 앱 안에 남아 있으며, 파일 관리자에서는 보이지 않습니다.';

  @override
  String get storageEmpty => '저장된 파일 없음';

  @override
  String storageUsage(String size) {
    return '사용 중: $size';
  }

  @override
  String get storageClearTitle => '저장된 파일을 지울까요?';

  @override
  String get storageClearBody =>
      '앱이 아직 갖고 있는 완료된 결과를 모두 삭제합니다. 이미 저장하거나 공유한 파일은 그대로입니다.';

  @override
  String get storageClearAction => '지우기';

  @override
  String storageCleared(String size) {
    return '$size 확보함';
  }

  @override
  String get autoSaveLabel => '결과 자동 저장';

  @override
  String get autoSaveHint => '완료된 파일을 바로 갤러리에(오디오는 다운로드에) 저장합니다.';

  @override
  String get lowSpaceTitle => '저장 공간이 부족합니다';

  @override
  String lowSpaceBody(String needed, String free) {
    return '이 묶음에는 약 $needed가 필요하지만 남은 공간은 $free뿐입니다. 변환이 도중에 멈출 수 있습니다.';
  }

  @override
  String saveAll(int count) {
    return '모두 저장 ($count)';
  }

  @override
  String savedAll(int count) {
    return '저장됨: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total개 중 $saved개 저장됨';
  }

  @override
  String get presetFitPhotoTitle => '사진을 지정 용량에 맞추기';

  @override
  String get presetFitPhotoBody => '정확한 용량 제한 아래로 사진을 압축합니다 — 업로드 양식, 지원서.';

  @override
  String get photoFitHint => '맞을 때까지 품질을 조정합니다. 지정 용량이 너무 작으면 이미지 크기도 줄입니다.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => '목표 크기 (KB)';

  @override
  String get compareAction => '비교';

  @override
  String get compareBefore => '변환 전';

  @override
  String get compareAfter => '변환 후';

  @override
  String get compareHint => '길게 누르면 원본이 보입니다.';

  @override
  String get trimStart => '시작';

  @override
  String get trimEnd => '끝';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss 형식, 최대 $duration';
  }

  @override
  String get imageScaleLabel => '크기 비율';

  @override
  String get audioChannelsLabel => '채널';

  @override
  String get audioMono => '모노';

  @override
  String get audioStereo => '스테레오';

  @override
  String get sampleRateLabel => '샘플링 레이트';

  @override
  String get voiceAudioHint =>
      '22.05 kHz 모노는 음성 녹음을 들리는 손실 없이 약 1/4로 줄입니다. 음악은 둘 다 원본으로 두세요.';

  @override
  String get moveUp => '위로';

  @override
  String get moveDown => '아래로';

  @override
  String get renameOutput => '결과 이름 바꾸기';

  @override
  String get renameOutputHint => '새 이름';

  @override
  String get renameOutputHelp => '확장자는 출력 형식이 정해요. 비워 두면 원본 파일 이름을 그대로 써요.';

  @override
  String deleteOriginalsAction(int count) {
    return '원본 삭제 ($count)';
  }

  @override
  String get deleteOriginalsAuto => '변환 후 원본 삭제';

  @override
  String get deleteOriginalsHint =>
      '결과를 저장한 뒤 원본 파일을 지워 달라고 시스템에 요청해요. 무엇이 사라지는지는 항상 시스템이 보여 주고 확인을 기다려요.';

  @override
  String originalsDeleted(String size) {
    return '원본을 삭제했어요 — $size 확보';
  }

  @override
  String get originalsNoneDeleted =>
      '아무것도 삭제하지 않았어요. 갤러리에 원래 이름으로 남아 있는 파일만 찾을 수 있어요.';

  @override
  String reclaimedTotal(String size) {
    return '이 앱으로 확보한 용량: $size';
  }

  @override
  String get deleteAllData => '모든 데이터 삭제';

  @override
  String get deleteAllDataHint =>
      '앱이 이 기기에 저장한 모든 것을 지웁니다. 대기열, 변환된 파일, 미리보기, 업적, 설정이 대상입니다. 이미 갤러리에 저장한 파일은 그대로 남습니다.';
}
