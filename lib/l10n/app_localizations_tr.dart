// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Dönüştür';

  @override
  String get tabQueue => 'Kuyruk';

  @override
  String get addFiles => 'Dosya ekle';

  @override
  String get emptySelectionTitle => 'Henüz dosya yok';

  @override
  String get emptySelectionBody =>
      'Fotoğraf, video veya ses ekleyin. Her şey bu cihazda işlenir.';

  @override
  String get sectionOutput => 'Çıktı';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Ses';

  @override
  String get sectionImage => 'Görüntü';

  @override
  String get sectionPrivacy => 'Gizlilik';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Video kodeği';

  @override
  String get audioCodec => 'Ses kodeği';

  @override
  String get rateControl => 'Bit hızı kontrolü';

  @override
  String get rateControlQuality => 'Sabit kalite (CRF)';

  @override
  String get rateControlBitrate => 'Hedef bit hızı';

  @override
  String crfLabel(int value) {
    return 'Kalite (CRF $value)';
  }

  @override
  String get crfHint => 'Değer düştükçe kalite artar, dosya büyür.';

  @override
  String videoBitrate(int value) {
    return 'Video bit hızı: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Ses bit hızı: $value kbps';
  }

  @override
  String get encodingPreset => 'Kodlayıcı ön ayarı';

  @override
  String get encodingPresetHint =>
      'Yavaş ön ayarlar daha iyi sıkıştırır ama cihazı daha çok ısıtır.';

  @override
  String get presetOriginal => 'Orijinal';

  @override
  String get resolution => 'Çözünürlük';

  @override
  String get frameRate => 'Kare hızı';

  @override
  String imageQuality(int value) {
    return 'Kalite: $value';
  }

  @override
  String get lossless => 'Kayıpsız';

  @override
  String get losslessHint => 'Dosyalar daha büyük, sonuç piksel piksel aynı.';

  @override
  String get sectionEnhance => 'İyileştirme';

  @override
  String get sharpenLabel => 'Netlik';

  @override
  String get sharpenHint =>
      'Kenarları daha keskin gösterir. Bulanık veya odağı kaçmış bir kareyi kurtaramaz — o ayrıntılar dosyada zaten yok.';

  @override
  String get sharpenStrongHint =>
      'Güçlü netleştirme kenarlarda parlak haleler bırakabilir. Önce orta seviyeyi deneyin.';

  @override
  String get denoiseLabel => 'Gürültü azaltma';

  @override
  String get denoiseHint =>
      'Karanlık ve gece fotoğraflarındaki grenleri temizler. Fazlası ince ayrıntıları da yumuşatır.';

  @override
  String get autoColorLabel => 'Otomatik renk ve seviyeler';

  @override
  String get autoColorHint =>
      'Kontrastı açar ve soluk renkleri biraz canlandırır.';

  @override
  String get upscaleLabel => '2× büyüt';

  @override
  String get upscaleHint =>
      'Genişliği ve yüksekliği iki katına çıkarır. Ayrıntı eklemez — baskı veya kırpma için işe yarar.';

  @override
  String get upscaleConflictHint =>
      'Büyütmek için Çözünürlük ayarını yeniden Orijinal yapın.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Kapalı';

  @override
  String get enhanceLight => 'Hafif';

  @override
  String get enhanceMedium => 'Orta';

  @override
  String get enhanceStrong => 'Güçlü';

  @override
  String get stripMetadata => 'Meta verileri kaldır';

  @override
  String get stripMetadataHint =>
      'Çıktıdan EXIF, GPS ve zaman damgalarını siler.';

  @override
  String startConversion(int count) {
    return '$count dosyayı dönüştür';
  }

  @override
  String get batchResumed => 'Yarıda kalan dönüştürme sürdürüldü.';

  @override
  String get converting => 'Dönüştürülüyor…';

  @override
  String get cancelBatch => 'Durdur';

  @override
  String get cancelJob => 'İptal';

  @override
  String get clearFinished => 'Bitenleri temizle';

  @override
  String get removeJob => 'Kaldır';

  @override
  String get shareFile => 'Paylaş';

  @override
  String get retryJob => 'Yeniden dene';

  @override
  String get queueEmptyTitle => 'Kuyruk boş';

  @override
  String get queueEmptyBody =>
      'Dönüştür sekmesinde eklediğiniz dosyalar burada görünür.';

  @override
  String queueActiveTab(int count) {
    return 'Aktif · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Tamamlanan · $count';
  }

  @override
  String get queueNoActiveTitle => 'Devam eden bir şey yok';

  @override
  String get queueNoActiveBody =>
      'Bekleyen veya dönüştürülen dosyalar burada görünür.';

  @override
  String get queueNoFinishedTitle => 'Henüz tamamlanan yok';

  @override
  String get queueNoFinishedBody =>
      'Dönüştürülen dosyalar burada birikir; açabilir, kaydedebilir veya paylaşabilirsiniz.';

  @override
  String get statusQueued => 'Kuyrukta';

  @override
  String get statusRunning => 'Dönüştürülüyor';

  @override
  String get statusCompleted => 'Tamamlandı';

  @override
  String get statusFailed => 'Başarısız';

  @override
  String get statusCancelled => 'İptal edildi';

  @override
  String batchSummary(int done, int total) {
    return '$done / $total tamamlandı';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done dosya dönüştürüldü',
      one: '1 dosya dönüştürüldü',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done dönüştürüldü, $failed başarısız.';
  }

  @override
  String savedPercent(int percent) {
    return '%$percent daha küçük';
  }

  @override
  String grewPercent(int percent) {
    return '%$percent daha büyük';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Görünüm';

  @override
  String get language => 'Dil';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get privacyTitle => 'Gizlilik';

  @override
  String get privacyBody =>
      'Eluna Media, dosyalarınızı yerleşik FFmpeg kopyasıyla tamamen bu cihazda dönüştürür. Dosyalarınız cihazdan asla çıkmaz, hesap gerekmez, telemetri yoktur. Uygulamada ağı kullanan hiçbir şey yok — internet izni bile istenmiyor.\n\nMeta veri temizleme varsayılan olarak açıktır; dışa aktardığınız dosyalardan EXIF, GPS koordinatları ve zaman damgaları silinir.';

  @override
  String get licenseTitle => 'Lisans';

  @override
  String get licenseBody =>
      'Bu uygulama, x264, x265 ve diğer GPL bileşenleriyle derlenmiş bir FFmpeg içerir; bu nedenle uygulamanın tamamı GNU GPL v3 ile dağıtılır.';

  @override
  String get sourceMissing => 'Kaynak dosya artık mevcut değil.';

  @override
  String get tabSettings => 'Ayarlar';

  @override
  String get introTitle => 'Varsayılan olarak gizli';

  @override
  String get introOfflineTitle => 'Bu cihazda dönüştürür';

  @override
  String get introOfflineBody =>
      'Tüm işi yerleşik FFmpeg yapar. Dosyalarınız telefondan çıkmaz — dönüştürme uçak modunda bile çalışır.';

  @override
  String get introTelemetryTitle => 'Sıfır telemetri';

  @override
  String get introTelemetryBody =>
      'Hesap yok, analitik yok, çökme raporu yok. Uygulama kim olduğunuzu bilmez.';

  @override
  String get introMetadataTitle => 'Meta veriler kontrol altında';

  @override
  String get introMetadataBody =>
      'EXIF, GPS ve zaman damgaları varsayılan olarak her çıktıdan silinir. İsterseniz kapatabilirsiniz.';

  @override
  String get introFreeNote =>
      'Ücretsiz: reklam yok, abonelik yok, uygulama içi satın alma yok. Toplu dönüştürme dahil bütün özellikler içinde.';

  @override
  String get introContinue => 'Başla';

  @override
  String get modeSimple => 'Basit';

  @override
  String get modeAdvanced => 'Gelişmiş';

  @override
  String get modeAdvancedHint =>
      'Ön ayar kartları yerine tüm codec, bit hızı ve dönüştürme denetimlerini gösterir.';

  @override
  String get presetCompressVideoTitle => 'Videoyu sıkıştır';

  @override
  String get presetCompressVideoBody => 'Çok daha küçük MP4, kalite iyi kalır';

  @override
  String get presetFitToSizeTitle => 'Boyuta sığdır';

  @override
  String get presetFitToSizeBody =>
      'Tam limiti tuttur — Discord, e-posta, sohbetler';

  @override
  String get presetCompatibleMp4Title => 'Uyumlu MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Her yerde oynar';

  @override
  String get presetExtractAudioTitle => 'Sesi çıkar';

  @override
  String get presetExtractAudioBody => 'Herhangi bir videodan MP3';

  @override
  String get presetVideoToGifTitle => 'Videodan GIF';

  @override
  String get presetVideoToGifBody => 'Kısa klipten hareketli GIF';

  @override
  String get presetMergeTitle => 'Videoları birleştir';

  @override
  String get presetMergeBody => 'Klipleri sırayla tek bir MP4\'te birleştir';

  @override
  String get mergeNeedsTwo => 'Birleştirmek için en az iki video seçin.';

  @override
  String mergedVideoName(int count) {
    return 'Birleştirilmiş video ($count klip).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Fotoğrafı sıkıştır';

  @override
  String get presetCompressImageBody =>
      'Daha küçük JPEG, kayıp neredeyse görünmez';

  @override
  String get presetEnhancePhotoTitle => 'Fotoğrafı iyileştir';

  @override
  String get presetEnhancePhotoBody => 'Daha temiz, daha net, daha iyi renk';

  @override
  String get presetImageToWebpTitle => 'Fotoğraftan WebP';

  @override
  String get presetImageToWebpBody => 'Modern format, JPEG\'den küçük';

  @override
  String get sizeTargetTitle => 'Hedef boyut';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Özel…';

  @override
  String get sizeTargetDialogTitle => 'MB cinsinden hedef boyut';

  @override
  String get sizeTargetTooSmall =>
      'Hedef bu süre için fazla küçük; mümkün olan en yakın kalite kullanılacak.';

  @override
  String estimatePerFile(String size) {
    return 'Dosya başına ≈ $size';
  }

  @override
  String estimateTotal(String size) {
    return 'Tahmini çıktı: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya seçildi',
      one: '1 dosya seçildi',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '%100 çevrimdışı dönüştürme';

  @override
  String get promiseBatchFree => 'Toplu işlem ücretsiz';

  @override
  String get promiseNoWatermark => 'Filigran yok';

  @override
  String get sectionTransform => 'Dönüşüm';

  @override
  String get rotateLabel => 'Döndür';

  @override
  String get flipLabel => 'Yatay aynala';

  @override
  String get speedLabel => 'Hız';

  @override
  String get cropLabel => 'Kırp';

  @override
  String get cropHint =>
      'Seçilen en-boy oranına ortadan kırpar — akış için kare, hikâyeler için 9:16.';

  @override
  String volumeLabel(int percent) {
    return 'Ses düzeyi: %$percent';
  }

  @override
  String get addAudioFiles => 'Ses ve diğer dosyalar';

  @override
  String get hwEncoderLabel => 'Donanımsal kodlama';

  @override
  String get hwEncoderHint =>
      'Bit hızı ve boyuta sığdırma modlarında cihazın video çipini kullanır — çok daha hızlı ve serin. Kalite (CRF) modu her zaman hassas yazılım kodlayıcısını kullanır; başarısız olan donanım işi otomatik olarak yazılımla yeniden denenir.';

  @override
  String get transformNeedsReencode =>
      'Döndürme, aynalama ve hız yeniden kodlama gerektirir; bu yüzden akış kopyalanırken kapalıdır.';

  @override
  String get capBitrateLabel => 'Dosya asla büyümesin';

  @override
  String get capBitrateHint =>
      'Kodlamayı kaynağın kendi bit hızıyla sınırlar. Sabit kalitenin kendi üst sınırı yoktur; bu yüzden zaten sıkıştırılmış bir video aksi hâlde daha büyük çıkabilir.';

  @override
  String get keepSubtitles => 'Altyazıları koru';

  @override
  String get keepSubtitlesHint =>
      'Altyazı parçalarını çıktıya taşır. Yalnızca metin altyazılar.';

  @override
  String get sectionTrim => 'Kesme';

  @override
  String get trimEnable => 'Dosyayı kes';

  @override
  String get trimHint =>
      'Kuyrukta süresi bilinen tam olarak bir dosya olduğunda kullanılabilir.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Hedef boyut';

  @override
  String get lowBatteryTitle => 'Pil azaldı';

  @override
  String get lowBatteryBody =>
      'Dönüştürme işlemciyi epey yorar. Önce şarja takabilir ya da yine de devam edebilirsiniz.';

  @override
  String get lowBatteryContinue => 'Yine de dönüştür';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonOk => 'Tamam';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya alındı',
      one: '1 dosya alındı',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Kaydet';

  @override
  String get savedToGallery => 'Galeriye, “Eluna Media” albümüne kaydedildi.';

  @override
  String get savedToDownloads => 'İndirilenler\'e kaydedildi.';

  @override
  String get saveFailed => 'Dosya kaydedilemedi.';

  @override
  String get jobRemovedUndo => 'İş kaldırıldı.';

  @override
  String get finishedClearedUndo => 'Biten işler temizlendi.';

  @override
  String get undo => 'Geri al';

  @override
  String get errorDetailsTitle => 'Hata ayrıntıları';

  @override
  String get oledDark => 'Saf siyah koyu tema';

  @override
  String get oledDarkHint =>
      'Gerçek siyah, OLED ekranlarda güç tasarrufu sağlar.';

  @override
  String get dynamicColorLabel => 'Sistem renkleri (Material You)';

  @override
  String get dynamicColorHint =>
      'Destekleniyorsa cihazın duvar kâğıdı paletini izler.';

  @override
  String get sectionConversionPrefs => 'Dönüştürme';

  @override
  String get powerModeLabel => 'Güç modu';

  @override
  String get powerEfficiency => 'Serin ve hızlı';

  @override
  String get powerBalanced => 'Dengeli';

  @override
  String get powerQuality => 'Maksimum sıkıştırma';

  @override
  String get powerModeHint =>
      'Video kodlayıcının ne kadar zorlanacağı. Serin ve hızlı, biraz daha büyük dosya demek. Başka hiçbir şey kısıtlanmaz — asla.';

  @override
  String get hapticsLabel => 'Titreşimli geri bildirim';

  @override
  String get networkPrivacyTitle => 'Ağ ve gizlilik';

  @override
  String get netAuditIntro =>
      'Bu uygulamada ağa dokunabilecek her şeyin tam listesi.';

  @override
  String get netAuditNoneTitle => 'Hiç ağ erişimi yok';

  @override
  String get netAuditNoneBody =>
      'Uygulama internet iznini istemiyor; istese bile ağa çıkamaz — sistemdeki uygulama bilgilerinden doğrulayabilirsiniz. Reklam yok, analitik yok, güncelleme denetimi yok. “Uygulamayı değerlendir” sizi mağaza uygulamasına devreder; bağlantıyı o kurar.';

  @override
  String get netAuditConversionTitle => 'Dönüştürme';

  @override
  String get netAuditConversionBody =>
      'Yerleşik FFmpeg ile tamamen bu cihazda çalışır. Uçak modunu açıp dönüştürün — çalışır.';

  @override
  String get netAuditTelemetryTitle => 'Telemetri';

  @override
  String get netAuditTelemetryBody =>
      'Yok. Uygulama analitik, çökme raporu veya tanımlayıcı toplamaz; hesap sistemi de yoktur.';

  @override
  String get sectionSupport => 'Destek';

  @override
  String get rateApp => 'Uygulamayı değerlendir';

  @override
  String get openLicenses => 'Açık kaynak lisansları';

  @override
  String get presetAudioToMp3Title => 'Sesi dönüştür';

  @override
  String get presetAudioToMp3Body => 'MP3\'e — her yerde çalar';

  @override
  String get presetCompressAudioTitle => 'Sesi sıkıştır';

  @override
  String get presetCompressAudioBody =>
      'Daha hafif AAC — sesli notlar, podcast\'ler';

  @override
  String get convertTo => 'Şuna dönüştür';

  @override
  String get formatSectionHint =>
      'Yalnızca dosyalarınızın gerçekten dönüşebileceği biçimler listelenir.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Fotoğraf';

  @override
  String get sourceAudio => 'Ses';

  @override
  String get sourceUnknown => 'Dosya';

  @override
  String get mixedSelectionTitle => 'Farklı dosya türleri seçildi';

  @override
  String get mixedSelectionBody =>
      'Her dosya kendi türü için en uygun hazır ayarla dönüştürülür. Tam denetim için türleri tek tek ekleyin.';

  @override
  String get filesTitle => 'Dosyalar';

  @override
  String get removeFile => 'Kaldır';

  @override
  String timeLeft(String time) {
    return '≈ $time kaldı';
  }

  @override
  String get jobSettingsTitle => 'Dönüştürme ayarları';

  @override
  String get jobDetails => 'Ayrıntılar';

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
  String get summaryEnhanced => 'İyileştirildi';

  @override
  String get summaryMetadataStripped => 'Meta veriler kaldırıldı';

  @override
  String summaryMerge(int count) {
    return '$count klip birleştirildi';
  }

  @override
  String get shareApp => 'Uygulamayı paylaş';

  @override
  String get shareAppText =>
      'Eluna Media — tamamen çevrimdışı çalışan ücretsiz fotoğraf, video ve ses dönüştürücü. Abonelik yok, filigran yok, hesap yok.';

  @override
  String appVersionLabel(String version) {
    return 'Sürüm $version';
  }

  @override
  String get openFile => 'Aç';

  @override
  String get openFolder => 'Klasörü göster';

  @override
  String get noAppToOpen => 'Bu cihazda o dosyayı açabilecek bir uygulama yok.';

  @override
  String get openFailed => 'Dosya açılamadı.';

  @override
  String get twoPassLabel => 'Tam boyut için iki geçiş';

  @override
  String get twoPassHint =>
      'Boyuta sığdırma işleri iki kez kodlanır ve bayt bütçesini belirgin biçimde daha isabetli tutturur — yaklaşık iki kat süre ve pil karşılığında.';

  @override
  String get whatsNewTitle => 'Yenilikler';

  @override
  String get whatsNew1 =>
      'Biten dosyalar artık doğrudan galeriye gidiyor; “Tümünü kaydet” ise bütün grubu tek seferde alıyor.';

  @override
  String get whatsNew2 =>
      'Bir fotoğrafı tam boyuta sığdırın — 100 KB ile 2 MB arası ya da kendi yazdığınız değer.';

  @override
  String get whatsNew3 =>
      'Uygulama artık gigabaytlarca yer biriktirmiyor: ayarlarda kullanılan alanı görüp temizleyebilirsiniz.';

  @override
  String get whatsNew4 =>
      'Dönüştürmeyi bildirimden durdurun; yer bitmeden önce uyarı alın.';

  @override
  String get whatsNew5 =>
      'Küçük resimler, önce/sonra karşılaştırması, GIF → MP4, tam kesme süreleri — ve fotoğraflar artık birkaçı aynı anda işleniyor.';

  @override
  String get achievementsTitle => 'Başarımlar';

  @override
  String achievementsProgress(int done, int total) {
    return '$done / $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Başarım açıldı: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Yalnızca bu cihazda sayılır. Hiçbir yere gönderilmez.';

  @override
  String get achFirstConversionTitle => 'İlk adımlar';

  @override
  String get achFirstConversionBody => 'İlk dosyanızı dönüştürün.';

  @override
  String get achTenConversionsTitle => 'Isınma turları';

  @override
  String get achTenConversionsBody => '10 dosya dönüştürün.';

  @override
  String get achFiftyConversionsTitle => 'Müdavim';

  @override
  String get achFiftyConversionsBody => '50 dosya dönüştürün.';

  @override
  String get achTwoHundredConversionsTitle => 'İş beygiri';

  @override
  String get achTwoHundredConversionsBody => '200 dosya dönüştürün.';

  @override
  String get achThousandConversionsTitle => 'Konveyör';

  @override
  String get achThousandConversionsBody => '1000 dosya dönüştürün.';

  @override
  String get achSaved100MbTitle => 'Yer açıcı';

  @override
  String get achSaved100MbBody => 'Toplamda 100 MB yer açın.';

  @override
  String get achSaved1GbTitle => 'Gigabayt avcısı';

  @override
  String get achSaved1GbBody => 'Toplamda 1 GB yer açın.';

  @override
  String get achSaved10GbTitle => 'Depolama kahramanı';

  @override
  String get achSaved10GbBody => 'Toplamda 10 GB yer açın.';

  @override
  String get achBatchOfFiveTitle => 'Toplu işçi';

  @override
  String get achBatchOfFiveBody =>
      '5 veya daha fazla dosyalık bir toplu işi bitirin.';

  @override
  String get achBatchOfTwentyTitle => 'Montaj hattı';

  @override
  String get achBatchOfTwentyBody =>
      '20 veya daha fazla dosyalık bir toplu işi bitirin.';

  @override
  String get achSniperTitle => 'Keskin nişancı';

  @override
  String get achSniperBody => 'Boyuta sığdırma ile tam boyutu tutturun.';

  @override
  String get achMemeSmithTitle => 'Caps ustası';

  @override
  String get achMemeSmithBody => 'Bir videoyu GIF\'e çevirin.';

  @override
  String get achSoundHunterTitle => 'Ses avcısı';

  @override
  String get achSoundHunterBody => 'Bir videodan ses çıkarın.';

  @override
  String get achSubtitleKeeperTitle => 'Altyazı bekçisi';

  @override
  String get achSubtitleKeeperBody =>
      'Bir videoyu altyazılarını koruyarak dönüştürün.';

  @override
  String get achDirectorTitle => 'Yönetmen';

  @override
  String get achDirectorBody =>
      'Bir dönüşüm uygulayın — döndürme, kırpma, hız veya ses düzeyi.';

  @override
  String get achAllRounderTitle => 'Çok yönlü';

  @override
  String get achAllRounderBody => 'Video, ses ve görüntü dönüştürün.';

  @override
  String get achNightOwlTitle => 'Gece kuşu';

  @override
  String get achNightOwlBody =>
      'Gece yarısı ile sabah 5 arasında bir dönüştürme bitirin.';

  @override
  String get achPlatinumTitle => 'Platin';

  @override
  String get achPlatinumBody => 'Diğer tüm başarımları kazanın.';

  @override
  String get storageTitle => 'Depolama';

  @override
  String get storageBody =>
      'Dönüştürülen dosyalar siz kaydedene veya paylaşana kadar uygulamanın içinde kalır; hiçbir dosya yöneticisi onlara erişemez.';

  @override
  String get storageEmpty => 'Depoda bir şey yok';

  @override
  String storageUsage(String size) {
    return 'Kullanılan: $size';
  }

  @override
  String get storageClearTitle => 'Saklanan dosyalar silinsin mi?';

  @override
  String get storageClearBody =>
      'Uygulamanın hâlâ tuttuğu tüm tamamlanmış sonuçları siler. Daha önce kaydettiğiniz veya paylaştığınız dosyalara dokunulmaz.';

  @override
  String get storageClearAction => 'Temizle';

  @override
  String storageCleared(String size) {
    return '$size boşaltıldı';
  }

  @override
  String get autoSaveLabel => 'Sonuçları otomatik kaydet';

  @override
  String get autoSaveHint =>
      'Biten her dosyayı hazır olur olmaz galeriye, sesi ise İndirilenler\'e koyar.';

  @override
  String get lowSpaceTitle => 'Yer az kaldı';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Bu grup yaklaşık $needed yer istiyor, boşta yalnızca $free var. Dönüştürme yarıda kesilebilir.';
  }

  @override
  String saveAll(int count) {
    return 'Tümünü kaydet ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Kaydedildi: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total dosyadan $saved tanesi kaydedildi';
  }

  @override
  String get presetFitPhotoTitle => 'Fotoğrafı boyuta sığdır';

  @override
  String get presetFitPhotoBody =>
      'Bir görseli tam bir sınırın altına sıkıştırır — yükleme formları, başvurular.';

  @override
  String get photoFitHint =>
      'Uygulama sığan bir kalite bulana kadar dener. Sınır fotoğraf için fazla küçükse kare boyutunu da küçültür.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'KB cinsinden hedef boyut';

  @override
  String get compareAction => 'Karşılaştır';

  @override
  String get compareBefore => 'Önce';

  @override
  String get compareAfter => 'Sonra';

  @override
  String get compareHint => 'Orijinali görmek için basılı tutun.';

  @override
  String get trimStart => 'Başlangıç';

  @override
  String get trimEnd => 'Bitiş';

  @override
  String trimTimeHelp(String duration) {
    return 'd:ss, en fazla $duration';
  }

  @override
  String get imageScaleLabel => 'Ölçek';

  @override
  String get audioChannelsLabel => 'Kanallar';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Örnekleme hızı';

  @override
  String get voiceAudioHint =>
      '22,05 kHz mono, bir ses kaydını duyulur kayıp olmadan yaklaşık dörtte birine indirir. Müzik için ikisini de orijinal bırakın.';

  @override
  String get moveUp => 'Yukarı taşı';

  @override
  String get moveDown => 'Aşağı taşı';

  @override
  String get renameOutput => 'Sonucu yeniden adlandır';

  @override
  String get renameOutputHint => 'Yeni ad';

  @override
  String get renameOutputHelp =>
      'Uzantıyı çıkış biçimi belirler. Boş bırakırsanız sonuç kaynak dosyanın adını alır.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Orijinalleri sil ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Dönüştürmeden sonra orijinalleri sil';

  @override
  String get deleteOriginalsHint =>
      'Sonuç kaydedildikten sonra kaynak dosyaları kaldırmasını sistemden ister. Sistem neyin gideceğini her zaman gösterir ve onayınızı bekler.';

  @override
  String originalsDeleted(String size) {
    return 'Orijinaller silindi — $size yer açıldı';
  }

  @override
  String get originalsNoneDeleted =>
      'Hiçbir şey silinmedi. Yalnızca galerinin özgün adıyla tuttuğu dosyalar bulunabiliyor.';

  @override
  String reclaimedTotal(String size) {
    return 'Bu uygulamayla açılan yer: $size';
  }

  @override
  String get deleteAllData => 'Tüm verileri sil';

  @override
  String get deleteAllDataHint =>
      'Uygulamanın bu cihazda sakladığı her şeyi siler: kuyruğu, dönüştürülen dosyaları, önizlemeleri, başarımları ve ayarları. Galeriye zaten kaydettiğiniz dosyalara dokunulmaz.';
}
