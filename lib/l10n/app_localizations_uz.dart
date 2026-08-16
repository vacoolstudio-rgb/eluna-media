// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class L10nUz extends L10n {
  L10nUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konvertatsiya';

  @override
  String get tabQueue => 'Navbat';

  @override
  String get addFiles => 'Fayl qoʻshish';

  @override
  String get emptySelectionTitle => 'Hozircha fayl yoʻq';

  @override
  String get emptySelectionBody =>
      'Foto, video yoki audio qoʻshing. Hammasi shu qurilmada qayta ishlanadi.';

  @override
  String get sectionOutput => 'Natija';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Rasm';

  @override
  String get sectionPrivacy => 'Maxfiylik';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get rateControl => 'Bitreyt nazorati';

  @override
  String get rateControlQuality => 'Doimiy sifat (CRF)';

  @override
  String get rateControlBitrate => 'Moʻljaldagi bitreyt';

  @override
  String crfLabel(int value) {
    return 'Sifat (CRF $value)';
  }

  @override
  String get crfHint =>
      'Qiymat qanchalik past boʻlsa, sifat shunchalik yuqori va fayl kattaroq boʻladi.';

  @override
  String videoBitrate(int value) {
    return 'Video bitreyti: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Audio bitreyti: $value kbps';
  }

  @override
  String get encodingPreset => 'Kodlagich profili';

  @override
  String get encodingPresetHint =>
      'Sekin profillar yaxshiroq siqadi, lekin qurilmani koʻproq qizdiradi.';

  @override
  String get presetOriginal => 'Asl holicha';

  @override
  String get resolution => 'Aniqlik';

  @override
  String get frameRate => 'Kadrlar chastotasi';

  @override
  String imageQuality(int value) {
    return 'Sifat: $value';
  }

  @override
  String get lossless => 'Yoʻqotishsiz';

  @override
  String get losslessHint =>
      'Fayllar kattaroq, natija piksellargacha aynan bir xil.';

  @override
  String get sectionEnhance => 'Yaxshilash';

  @override
  String get sharpenLabel => 'Oʻtkirlik';

  @override
  String get sharpenHint =>
      'Chekkalarni aniqroq koʻrsatadi. Xira yoki fokusdan chiqqan kadrni tiklay olmaydi — u tafsilotlar faylda yoʻq.';

  @override
  String get sharpenStrongHint =>
      'Kuchli oʻtkirlash chekkalarda yorugʻ halqalar qoldirishi mumkin. Avval oʻrtachasini sinab koʻring.';

  @override
  String get denoiseLabel => 'Shovqinni kamaytirish';

  @override
  String get denoiseHint =>
      'Qorongʻi va tungi suratlardagi donadorlikni tozalaydi. Ortiqchasi mayda tafsilotlarni ham silliqlab yuboradi.';

  @override
  String get autoColorLabel => 'Avtomatik rang va darajalar';

  @override
  String get autoColorHint =>
      'Kontrastni kengaytiradi va xira ranglarni biroz jonlantiradi.';

  @override
  String get upscaleLabel => '2× kattalashtirish';

  @override
  String get upscaleHint =>
      'Eni va boʻyini ikki barobar oshiradi. Tafsilot qoʻshmaydi — bosib chiqarish yoki qirqishda asqotadi.';

  @override
  String get upscaleConflictHint =>
      'Kattalashtirish uchun Aniqlikni yana Asl holicha qilib qoʻying.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Oʻchiq';

  @override
  String get enhanceLight => 'Yengil';

  @override
  String get enhanceMedium => 'Oʻrtacha';

  @override
  String get enhanceStrong => 'Kuchli';

  @override
  String get stripMetadata => 'Metamaʼlumotlarni olib tashlash';

  @override
  String get stripMetadataHint =>
      'Natijadan EXIF, GPS va vaqt belgilarini oʻchiradi.';

  @override
  String startConversion(int count) {
    return 'Fayllarni konvertatsiya qilish ($count)';
  }

  @override
  String get batchResumed => 'Uzilib qolgan konvertatsiya davom ettirildi.';

  @override
  String get converting => 'Konvertatsiya qilinmoqda…';

  @override
  String get cancelBatch => 'Toʻxtatish';

  @override
  String get cancelJob => 'Bekor qilish';

  @override
  String get clearFinished => 'Tugaganlarni tozalash';

  @override
  String get removeJob => 'Olib tashlash';

  @override
  String get shareFile => 'Ulashish';

  @override
  String get retryJob => 'Qayta urinish';

  @override
  String get queueEmptyTitle => 'Navbat boʻsh';

  @override
  String get queueEmptyBody =>
      'Konvertatsiya boʻlimida qoʻshgan fayllaringiz shu yerda koʻrinadi.';

  @override
  String queueActiveTab(int count) {
    return 'Faol · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Tugagan · $count';
  }

  @override
  String get queueNoActiveTitle => 'Jarayonda hech nima yoʻq';

  @override
  String get queueNoActiveBody =>
      'Navbatda turgan yoki konvertatsiya qilinayotgan fayllar shu yerda koʻrinadi.';

  @override
  String get queueNoFinishedTitle => 'Hali hech nima tugamadi';

  @override
  String get queueNoFinishedBody =>
      'Konvertatsiya qilingan fayllar shu yerga tushadi — ochish, saqlash yoki ulashishga tayyor.';

  @override
  String get statusQueued => 'Navbatda';

  @override
  String get statusRunning => 'Konvertatsiya qilinmoqda';

  @override
  String get statusCompleted => 'Tayyor';

  @override
  String get statusFailed => 'Xato';

  @override
  String get statusCancelled => 'Bekor qilindi';

  @override
  String batchSummary(int done, int total) {
    return '$total tadan $done tasi tayyor';
  }

  @override
  String batchCompleted(int done) {
    return 'Konvertatsiya qilingan fayllar: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done tasi konvertatsiya qilindi, $failed tasi xato bilan tugadi.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% kichikroq';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% kattaroq';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Tashqi koʻrinish';

  @override
  String get themeSystem => 'Tizimdagidek';

  @override
  String get language => 'Til';

  @override
  String get languageSystem => 'Tizimdagidek';

  @override
  String get privacyTitle => 'Maxfiylik';

  @override
  String get privacyBody =>
      'Eluna Media fayllaringizni ilova tarkibidagi FFmpeg nusxasi yordamida butunlay shu qurilmada konvertatsiya qiladi. Fayllaringiz qurilmadan hech qachon chiqmaydi, hisob qaydnomasi kerak emas, telemetriya yoʻq. Ilovada tarmoqdan foydalanadigan hech narsa yoʻq — u hatto internet ruxsatini ham soʻramaydi.\n\nMetamaʼlumotlarni olib tashlash sukut boʻyicha yoqilgan, shuning uchun eksport qiladigan fayllaringizdan EXIF, GPS koordinatalari va vaqt belgilari olib tashlanadi.';

  @override
  String get licenseTitle => 'Litsenziya';

  @override
  String get licenseBody =>
      'Bu ilova tarkibida x264, x265 va boshqa GPL komponentlari bilan yigʻilgan FFmpeg bor, shuning uchun ilova butunligicha GNU GPL v3 asosida tarqatiladi.';

  @override
  String get sourceMissing => 'Manba fayl endi mavjud emas.';

  @override
  String get tabSettings => 'Sozlamalar';

  @override
  String get introTitle => 'Boshidanoq maxfiy';

  @override
  String get introOfflineTitle => 'Shu qurilmada konvertatsiya qiladi';

  @override
  String get introOfflineBody =>
      'Barcha ishni ilova tarkibidagi FFmpeg bajaradi. Fayllaringiz telefondan chiqmaydi — konvertatsiya samolyot rejimida ham ishlaydi.';

  @override
  String get introTelemetryTitle => 'Telemetriya umuman yoʻq';

  @override
  String get introTelemetryBody =>
      'Hisob qaydnomasi yoʻq, analitika yoʻq, nosozlik hisobotlari yoʻq. Ilova sizning kimligingizni bilmaydi.';

  @override
  String get introMetadataTitle => 'Metamaʼlumotlar nazorat ostida';

  @override
  String get introMetadataBody =>
      'EXIF, GPS va vaqt belgilari sukut boʻyicha har bir natijadan olib tashlanadi. Buni oʻchirib qoʻyish mumkin.';

  @override
  String get introFreeNote =>
      'Bepul, reklamasiz va obunasiz. Guruhli konvertatsiya ham, qolgan barcha imkoniyat ham boshidanoq sizniki — sotib olish mumkin boʻlgan yagona narsa bu minnatdorchilik toʻlovi, u esa hech nimani ochmaydi.';

  @override
  String get introContinue => 'Boshlash';

  @override
  String get modeSimple => 'Oddiy';

  @override
  String get modeAdvanced => 'Kengaytirilgan';

  @override
  String get modeAdvancedHint =>
      'Tayyor andoza kartochkalari oʻrniga barcha kodek, bitreyt va oʻzgartirish sozlamalarini koʻrsatadi.';

  @override
  String get presetCompressVideoTitle => 'Videoni siqish';

  @override
  String get presetCompressVideoBody =>
      'Ancha kichik MP4, sifati yaxshi qoladi';

  @override
  String get presetFitToSizeTitle => 'Oʻlchamga sigʻdirish';

  @override
  String get presetFitToSizeBody =>
      'Aniq chegaraga tushirish — Discord, e-pochta, chatlar';

  @override
  String get presetCompatibleMp4Title => 'Mos keluvchi MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Hamma joyda ochiladi';

  @override
  String get presetExtractAudioTitle => 'Audioni ajratib olish';

  @override
  String get presetExtractAudioBody => 'Istalgan videodan MP3';

  @override
  String get presetVideoToGifTitle => 'Videodan GIF';

  @override
  String get presetVideoToGifBody => 'Qisqa lavhadan animatsion GIF';

  @override
  String get presetMergeTitle => 'Videolarni birlashtirish';

  @override
  String get presetMergeBody => 'Lavhalarni navbati bilan bitta MP4 ga ulash';

  @override
  String get mergeNeedsTwo =>
      'Birlashtirish uchun kamida ikkita video tanlang.';

  @override
  String mergedVideoName(int count) {
    return 'Birlashtirilgan video ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Fotoni siqish';

  @override
  String get presetCompressImageBody =>
      'Kichikroq JPEG, yoʻqotish deyarli sezilmaydi';

  @override
  String get presetEnhancePhotoTitle => 'Fotoni yaxshilash';

  @override
  String get presetEnhancePhotoBody => 'Tozaroq, aniqroq, rangi yaxshiroq';

  @override
  String get presetImageToWebpTitle => 'Fotodan WebP';

  @override
  String get presetImageToWebpBody => 'Zamonaviy format, JPEG dan kichikroq';

  @override
  String get sizeTargetTitle => 'Moʻljaldagi hajm';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Boshqa…';

  @override
  String get sizeTargetDialogTitle => 'Moʻljaldagi hajm, MB';

  @override
  String get sizeTargetTooSmall =>
      'Moʻljal bu davomiylik uchun juda kichik; imkon boricha eng yaqin sifat qoʻllanadi.';

  @override
  String estimatePerFile(String size) {
    return 'har bir faylga ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'Taxminiy natija: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Tanlangan fayllar: $count';
  }

  @override
  String get promiseOffline => '100% oflayn konvertatsiya';

  @override
  String get promiseBatchFree => 'Guruhli qayta ishlash bepul';

  @override
  String get promiseNoWatermark => 'Suv belgisi yoʻq';

  @override
  String get sectionTransform => 'Oʻzgartirish';

  @override
  String get rotateLabel => 'Burish';

  @override
  String get flipLabel => 'Gorizontal aks ettirish';

  @override
  String get speedLabel => 'Tezlik';

  @override
  String get cropLabel => 'Kadrlash';

  @override
  String get cropHint =>
      'Tanlangan nisbat boʻyicha markazdan qirqadi — lentalar uchun kvadrat, storilar uchun 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'Ovoz balandligi: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio va boshqa fayllar';

  @override
  String get hwEncoderLabel => 'Apparat kodlash';

  @override
  String get hwEncoderHint =>
      'Bitreyt va oʻlchamga sigʻdirish rejimlarida qurilmaning video chipidan foydalanadi — ancha tez va salqin. Sifat (CRF) rejimi doim aniq dasturiy kodlagichni ishlatadi, xato bilan tugagan apparat vazifasi esa avtomatik ravishda dasturiy yoʻl bilan qayta bajariladi.';

  @override
  String get transformNeedsReencode =>
      'Burish, aks ettirish va tezlik qayta kodlashni talab qiladi, shuning uchun oqim nusxalanayotganda ular oʻchiq turadi.';

  @override
  String get capBitrateLabel => 'Fayl hech qachon kattalashmasin';

  @override
  String get capBitrateHint =>
      'Kodlashni manba faylning oʻz bitreyti bilan cheklaydi. Doimiy sifatning oʻz yuqori chegarasi yoʻq, shuning uchun allaqachon siqilgan video aks holda kattaroq boʻlib chiqishi mumkin.';

  @override
  String get keepSubtitles => 'Subtitrlarni saqlash';

  @override
  String get keepSubtitlesHint =>
      'Subtitr yoʻllarini natijaga koʻchiradi. Faqat matnli subtitrlar.';

  @override
  String get sectionTrim => 'Qisqartirish';

  @override
  String get trimEnable => 'Manbani qisqartirish';

  @override
  String get trimHint =>
      'Navbatda davomiyligi maʼlum boʻlgan roppa-rosa bitta fayl boʻlganda mavjud.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Moʻljaldagi hajm';

  @override
  String get lowBatteryTitle => 'Batareya quvvati kam';

  @override
  String get lowBatteryBody =>
      'Konvertatsiya protsessorga katta yuk beradi. Avval quvvatlashga ulashingiz yoki baribir davom ettirishingiz mumkin.';

  @override
  String get lowBatteryContinue => 'Baribir konvertatsiya qilish';

  @override
  String get commonCancel => 'Bekor qilish';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Qabul qilingan fayllar: $count';
  }

  @override
  String get saveFile => 'Saqlash';

  @override
  String get savedToGallery => 'Galereyaga, “Eluna Media” albomiga saqlandi.';

  @override
  String get savedToDownloads => 'Yuklanmalar papkasiga saqlandi.';

  @override
  String get saveFailed => 'Faylni saqlab boʻlmadi.';

  @override
  String get jobRemovedUndo => 'Vazifa olib tashlandi.';

  @override
  String get finishedClearedUndo => 'Tugagan vazifalar tozalandi.';

  @override
  String get undo => 'Qaytarish';

  @override
  String get errorDetailsTitle => 'Xato tafsilotlari';

  @override
  String get sectionConversionPrefs => 'Konvertatsiya';

  @override
  String get powerModeLabel => 'Quvvat rejimi';

  @override
  String get powerEfficiency => 'Salqin va tez';

  @override
  String get powerBalanced => 'Muvozanatli';

  @override
  String get powerQuality => 'Maksimal siqish';

  @override
  String get powerModeHint =>
      'Video kodlagich qanchalik kuch sarflashi. Salqinroq va tezroq degani fayllar biroz kattaroq boʻladi degani. Boshqa hech narsa cheklanmaydi — hech qachon.';

  @override
  String get hapticsLabel => 'Tebranishli javob';

  @override
  String get networkPrivacyTitle => 'Tarmoq va maxfiylik';

  @override
  String get netAuditIntro =>
      'Bu ilovada tarmoqqa tegishi mumkin boʻlgan hamma narsaning toʻliq roʻyxati.';

  @override
  String get netAuditNoneTitle => 'Tarmoqqa umuman kirmaydi';

  @override
  String get netAuditNoneBody =>
      'Ilova internet ruxsatini soʻramaydi, shuning uchun xohlasa ham tarmoqqa chiqa olmaydi — buni tizimdagi ilova maʼlumotlaridan tekshirishingiz mumkin. Reklama yoʻq, analitika yoʻq, yangilanish tekshiruvi yoʻq. “Ilovani baholash” sizni doʻkon ilovasiga uzatadi, tarmoq bilan oʻsha ilova oʻzi gaplashadi.';

  @override
  String get netAuditConversionTitle => 'Konvertatsiya';

  @override
  String get netAuditConversionBody =>
      'Ilova tarkibidagi FFmpeg orqali butunlay shu qurilmada bajariladi. Samolyot rejimini yoqib koʻring va konvertatsiya qiling — ishlaydi.';

  @override
  String get netAuditTelemetryTitle => 'Telemetriya';

  @override
  String get netAuditTelemetryBody =>
      'U yoʻq. Ilova analitika ham, nosozlik hisobotlari ham, identifikatorlar ham yigʻmaydi va hisob qaydnomasi tizimiga ega emas.';

  @override
  String get netAuditTipsTitle => 'Minnatdorchilik';

  @override
  String get netAuditTipsBody =>
      'Minnatdorchilik toʻlovini bu ilova emas, Play Store ilovasi amalga oshiradi — bu ilovada esa internet ruxsati hamon yoʻq. Toʻlovlar ruxsatlar roʻyxatiga ikki qator qoʻshadi: “ilova ichidagi xaridlar” va “tarmoq ulanishlarini koʻrish”; ikkinchisi faqat ulanish bor-yoʻqligini oʻqiydi, undan foydalana olmaydi. Hech narsa oʻz-oʻzidan sotib olinmaydi va minnatdorchilik hech nimani ochmaydi: bu yerdagi hamma narsa bepul.';

  @override
  String get sectionSupport => 'Qoʻllab-quvvatlash';

  @override
  String get rateApp => 'Ilovani baholash';

  @override
  String get openLicenses => 'Ochiq kod litsenziyalari';

  @override
  String get presetAudioToMp3Title => 'Audioni konvertatsiya qilish';

  @override
  String get presetAudioToMp3Body => 'MP3 ga — hamma joyda ijro etiladi';

  @override
  String get presetCompressAudioTitle => 'Audioni siqish';

  @override
  String get presetCompressAudioBody =>
      'Yengilroq AAC — ovozli xabarlar, podkastlar';

  @override
  String get convertTo => 'Quyidagiga konvertatsiya qilish';

  @override
  String get formatSectionHint =>
      'Faqat fayllaringiz haqiqatan aylana oladigan formatlar koʻrsatilgan.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Fayl';

  @override
  String get mixedSelectionTitle => 'Turli xil fayl turlari tanlandi';

  @override
  String get mixedSelectionBody =>
      'Har bir fayl oʻz turiga eng mos tayyor andoza bilan konvertatsiya qilinadi. Toʻliq nazorat uchun turlarni bittalab qoʻshing.';

  @override
  String get filesTitle => 'Fayllar';

  @override
  String get removeFile => 'Olib tashlash';

  @override
  String timeLeft(String time) {
    return '≈ $time qoldi';
  }

  @override
  String get jobSettingsTitle => 'Konvertatsiya sozlamalari';

  @override
  String get jobDetails => 'Tafsilotlar';

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
  String get summaryEnhanced => 'Yaxshilangan';

  @override
  String get summaryMetadataStripped => 'Metamaʼlumotlar olib tashlandi';

  @override
  String summaryMerge(int count) {
    return 'Birlashtirilgan lavhalar: $count';
  }

  @override
  String get shareApp => 'Ilovani ulashish';

  @override
  String get shareAppText =>
      'Eluna Media — bepul, butunlay oflayn ishlaydigan foto, video va audio konverter. Obunasiz, suv belgisisiz, hisob qaydnomasisiz.';

  @override
  String appVersionLabel(String version) {
    return 'Versiya $version';
  }

  @override
  String get openFile => 'Ochish';

  @override
  String get openFolder => 'Papkani koʻrsatish';

  @override
  String get noAppToOpen =>
      'Bu qurilmada oʻsha faylni ocha oladigan ilova yoʻq.';

  @override
  String get openFailed => 'Faylni ochib boʻlmadi.';

  @override
  String get twoPassLabel => 'Aniq hajm uchun ikki bosqichli kodlash';

  @override
  String get twoPassHint =>
      'Oʻlchamga sigʻdirish vazifalari ikki marta kodlanadi va bayt chegarasiga sezilarli darajada aniqroq tushadi — taxminan ikki baravar koʻp vaqt va batareya evaziga.';

  @override
  String get whatsNewTitle => 'Nima yangilik';

  @override
  String get whatsNew1 =>
      'Videoni endi AV1 bilan kodlash mumkin: kutishga toqatingiz boʻlsa, fayllar sezilarli darajada kichrayadi.';

  @override
  String get whatsNew2 =>
      'Rasmlar uchun yangilik: JPEG ning taxminan yarmicha AVIF va GIF oʻrniga animatsion WebP.';

  @override
  String get whatsNew3 =>
      'M4A yoʻqotishsiz boʻla oladi — AAC yoniga ALAC qoʻshildi.';

  @override
  String get whatsNew4 =>
      'Tashqi koʻrinish bitta ekranda: yorqinlik, urgʻu rangi, sof qora OLED va Material You.';

  @override
  String get whatsNew5 =>
      'Yutuqlarda medallar, uchta boʻlim va rasm sifatida ulashsa boʻladigan progress bor.';

  @override
  String get achievementsTitle => 'Yutuqlar';

  @override
  String achievementsProgress(int done, int total) {
    return '$total tadan $done tasi';
  }

  @override
  String get achievementsPrivacyNote =>
      'Faqat shu qurilmada hisoblanadi. Hech qayerga yuborilmaydi.';

  @override
  String get achFirstConversionTitle => 'Ilk qadam';

  @override
  String get achFirstConversionBody =>
      'Birinchi faylingizni konvertatsiya qiling.';

  @override
  String get achTenConversionsTitle => 'Surʼat oldi';

  @override
  String get achTenConversionsBody => '10 ta faylni konvertatsiya qiling.';

  @override
  String get achFiftyConversionsTitle => 'Doimiy foydalanuvchi';

  @override
  String get achFiftyConversionsBody => '50 ta faylni konvertatsiya qiling.';

  @override
  String get achTwoHundredConversionsTitle => 'Mehnatkash';

  @override
  String get achTwoHundredConversionsBody =>
      '200 ta faylni konvertatsiya qiling.';

  @override
  String get achThousandConversionsTitle => 'Konveyer';

  @override
  String get achThousandConversionsBody =>
      '1000 ta faylni konvertatsiya qiling.';

  @override
  String get achSaved100MbTitle => 'Joy tejovchi';

  @override
  String get achSaved100MbBody => 'Jami 100 MB joy boʻshating.';

  @override
  String get achSaved1GbTitle => 'Gigabayt ovchisi';

  @override
  String get achSaved1GbBody => 'Jami 1 GB joy boʻshating.';

  @override
  String get achSaved10GbTitle => 'Xotira qahramoni';

  @override
  String get achSaved10GbBody => 'Jami 10 GB joy boʻshating.';

  @override
  String get achBatchOfFiveTitle => 'Guruhli ishchi';

  @override
  String get achBatchOfFiveBody =>
      '5 ta yoki undan koʻp fayldan iborat guruhni yakunlang.';

  @override
  String get achBatchOfTwentyTitle => 'Yigʻuv liniyasi';

  @override
  String get achBatchOfTwentyBody =>
      '20 ta yoki undan koʻp fayldan iborat guruhni yakunlang.';

  @override
  String get achSniperTitle => 'Mergan';

  @override
  String get achSniperBody => 'Oʻlchamga sigʻdirish bilan aniq hajmga tushing.';

  @override
  String get achMemeSmithTitle => 'Mem ustasi';

  @override
  String get achMemeSmithBody => 'Videoni GIF ga aylantiring.';

  @override
  String get achSoundHunterTitle => 'Tovush ovchisi';

  @override
  String get achSoundHunterBody => 'Videodan audioni ajratib oling.';

  @override
  String get achSubtitleKeeperTitle => 'Subtitr posboni';

  @override
  String get achSubtitleKeeperBody =>
      'Videoni subtitrlarini saqlagan holda konvertatsiya qiling.';

  @override
  String get achDirectorTitle => 'Rejissyor';

  @override
  String get achDirectorBody =>
      'Biror oʻzgartirish qoʻllang — burish, kadrlash, tezlik yoki ovoz balandligi.';

  @override
  String get achAllRounderTitle => 'Har tomonlama';

  @override
  String get achAllRounderBody =>
      'Video, audio va rasmni konvertatsiya qiling.';

  @override
  String get achNightOwlTitle => 'Tungi qush';

  @override
  String get achNightOwlBody =>
      'Yarim tun bilan ertalabki 5 orasida konvertatsiyani yakunlang.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Qolgan barcha yutuqni qoʻlga kiriting.';

  @override
  String get storageTitle => 'Xotira';

  @override
  String get storageBody =>
      'Konvertatsiya qilingan fayllar siz ularni saqlaguningizcha yoki ulashguningizcha ilova ichida qoladi, ularga hech bir fayl menejeri yeta olmaydi.';

  @override
  String get storageEmpty => 'Saqlangan narsa yoʻq';

  @override
  String storageUsage(String size) {
    return 'Saqlangan: $size';
  }

  @override
  String get storageClearTitle => 'Saqlangan fayllar oʻchirilsinmi?';

  @override
  String get storageClearBody =>
      'Ilova hamon saqlab turgan barcha tugagan natijani oʻchiradi. Siz allaqachon saqlagan yoki ulashgan fayllarga tegilmaydi.';

  @override
  String get storageClearAction => 'Tozalash';

  @override
  String storageCleared(String size) {
    return '$size boʻshatildi';
  }

  @override
  String get autoSaveLabel => 'Natijalarni avtomatik saqlash';

  @override
  String get autoSaveHint =>
      'Tugagan har bir faylni tayyor boʻlishi bilan galereyaga, audioni esa Yuklanmalar papkasiga joylaydi.';

  @override
  String get lowSpaceTitle => 'Boʻsh joy kam qoldi';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Bu guruhga taxminan $needed kerak, boʻsh joy esa atigi $free. Konvertatsiya yarmida toʻxtab qolishi mumkin.';
  }

  @override
  String saveAll(int count) {
    return 'Hammasini saqlash ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Saqlandi: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total tadan $saved tasi saqlandi';
  }

  @override
  String get presetFitPhotoTitle => 'Fotoni oʻlchamga sigʻdirish';

  @override
  String get presetFitPhotoBody =>
      'Rasmni aniq chegaradan pastga siqish — yuklash shakllari, arizalar.';

  @override
  String get photoFitHint =>
      'Ilova sigʻadigan sifat topilguncha bir necha qiymatni sinab koʻradi. Chegara rasm uchun juda kichik boʻlsa, kadr oʻlchamini ham kichraytiradi.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Moʻljaldagi hajm, KB';

  @override
  String get compareAction => 'Solishtirish';

  @override
  String get compareBefore => 'Oldin';

  @override
  String get compareAfter => 'Keyin';

  @override
  String get compareHint => 'Aslini koʻrish uchun bosib turing.';

  @override
  String get trimStart => 'Boshi';

  @override
  String get trimEnd => 'Oxiri';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, $duration gacha';
  }

  @override
  String get imageScaleLabel => 'Masshtab';

  @override
  String get audioChannelsLabel => 'Kanallar';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Diskretlash chastotasi';

  @override
  String get voiceAudioHint =>
      '22,05 kHz mono ovoz yozuvini quloqqa bilinmaydigan yoʻqotish bilan taxminan toʻrt barobar kichraytiradi. Musiqa uchun ikkalasini ham asl holicha qoldiring.';

  @override
  String get moveUp => 'Yuqoriga surish';

  @override
  String get moveDown => 'Pastga surish';

  @override
  String get renameOutput => 'Natija nomini oʻzgartirish';

  @override
  String get renameOutputHint => 'Yangi nom';

  @override
  String get renameOutputHelp =>
      'Kengaytma chiqish formatidan olinadi. Natija manba fayl nomini olishi uchun boʻsh qoldiring.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Asl fayllarni oʻchirish ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'Konvertatsiyadan keyin asl fayllarni oʻchirish';

  @override
  String get deleteOriginalsHint =>
      'Natija saqlangach, manba fayllarni oʻchirishni tizimdan soʻraydi. Tizim doim nima oʻchishini koʻrsatadi va tasdigʻingizni kutadi.';

  @override
  String get mediaAccessRequired =>
      'Asl fayllarni o\'chirish uchun media kutubxonasiga ruxsat kerak.';

  @override
  String originalsDeleted(String size) {
    return 'Asl fayllar oʻchirildi — $size boʻshadi';
  }

  @override
  String get originalsNoneDeleted =>
      'Hech narsa oʻchirilmadi. Faqat galereya asl nomi bilan saqlab turgan fayllarni topish mumkin.';

  @override
  String reclaimedTotal(String size) {
    return 'Shu ilova bilan boʻshatilgani: $size';
  }

  @override
  String get deleteAllData => 'Barcha maʼlumotni oʻchirish';

  @override
  String get deleteAllDataHint =>
      'Ilova shu qurilmada saqlaydigan hamma narsani oʻchiradi: navbat, konvertatsiya qilingan fayllar, oldindan koʻrishlar, yutuqlar va sozlamalar. Galereyaga allaqachon saqlagan fayllaringizga tegilmaydi.';

  @override
  String get codecCopy => 'Nusxalash';

  @override
  String get codecCopyRemux => 'Nusxalash (remux)';

  @override
  String get codecNoVideo => 'Videosiz';

  @override
  String get codecNoAudio => 'Ovozsiz';

  @override
  String codecLossless(String codec) {
    return '$codec (yoʻqotishsiz)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animatsion)';
  }

  @override
  String get sizeTargetEmail => 'E-pochta';

  @override
  String get trimTimeHint => 'm:ss';
}
