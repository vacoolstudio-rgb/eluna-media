// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class L10nMs extends L10n {
  L10nMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Tukar';

  @override
  String get tabQueue => 'Baris gilir';

  @override
  String get addFiles => 'Tambah fail';

  @override
  String get emptySelectionTitle => 'Belum ada fail';

  @override
  String get emptySelectionBody =>
      'Tambah foto, video atau audio. Semuanya diproses pada peranti ini.';

  @override
  String get sectionOutput => 'Output';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Imej';

  @override
  String get sectionPrivacy => 'Privasi';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Kodek video';

  @override
  String get audioCodec => 'Kodek audio';

  @override
  String get rateControl => 'Kawalan kadar';

  @override
  String get rateControlQuality => 'Kualiti malar (CRF)';

  @override
  String get rateControlBitrate => 'Kadar bit sasaran';

  @override
  String crfLabel(int value) {
    return 'Kualiti (CRF $value)';
  }

  @override
  String get crfHint =>
      'Semakin rendah, semakin baik kualitinya dan semakin besar failnya.';

  @override
  String videoBitrate(int value) {
    return 'Kadar bit video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Kadar bit audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Praset pengekod';

  @override
  String get encodingPresetHint =>
      'Praset yang lebih perlahan memampatkan dengan lebih baik tetapi memanaskan peranti dengan lebih ketara.';

  @override
  String get presetOriginal => 'Asal';

  @override
  String get resolution => 'Resolusi';

  @override
  String get frameRate => 'Kadar bingkai';

  @override
  String imageQuality(int value) {
    return 'Kualiti: $value';
  }

  @override
  String get lossless => 'Lossless';

  @override
  String get losslessHint =>
      'Fail lebih besar, output tepat piksel demi piksel.';

  @override
  String get sectionEnhance => 'Penambahbaikan';

  @override
  String get sharpenLabel => 'Ketajaman';

  @override
  String get sharpenHint =>
      'Menjadikan tepi lebih jelas. Ia tidak dapat memulihkan gambar yang kabur atau tidak fokus — perincian itu memang tiada dalam fail.';

  @override
  String get sharpenStrongHint =>
      'Penajaman yang kuat boleh meninggalkan halo terang di sepanjang tepi. Cuba tahap sederhana dahulu.';

  @override
  String get denoiseLabel => 'Pengurangan hingar';

  @override
  String get denoiseHint =>
      'Membersihkan bintik pada foto gelap dan foto malam. Terlalu banyak akan melicinkan perincian halus sehingga hilang.';

  @override
  String get autoColorLabel => 'Warna dan aras automatik';

  @override
  String get autoColorHint =>
      'Meregangkan kontras dan mengangkat sedikit warna yang pudar.';

  @override
  String get upscaleLabel => 'Besarkan 2×';

  @override
  String get upscaleHint =>
      'Menggandakan lebar dan tinggi. Ia tidak menambah perincian — ia membantu semasa mencetak atau memangkas.';

  @override
  String get upscaleConflictHint =>
      'Tetapkan Resolusi kembali kepada Asal untuk membesarkan.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Mati';

  @override
  String get enhanceLight => 'Ringan';

  @override
  String get enhanceMedium => 'Sederhana';

  @override
  String get enhanceStrong => 'Kuat';

  @override
  String get stripMetadata => 'Buang metadata';

  @override
  String get stripMetadataHint =>
      'Membuang EXIF, GPS dan cap masa daripada output.';

  @override
  String startConversion(int count) {
    return 'Tukar fail ($count)';
  }

  @override
  String get batchResumed => 'Penukaran yang terganggu disambung semula.';

  @override
  String get converting => 'Menukar…';

  @override
  String get cancelBatch => 'Henti';

  @override
  String get cancelJob => 'Batal';

  @override
  String get clearFinished => 'Kosongkan yang selesai';

  @override
  String get removeJob => 'Buang';

  @override
  String get shareFile => 'Kongsi';

  @override
  String get retryJob => 'Cuba lagi';

  @override
  String get queueEmptyTitle => 'Baris gilir kosong';

  @override
  String get queueEmptyBody =>
      'Fail yang anda tambah pada tab Tukar akan muncul di sini.';

  @override
  String queueActiveTab(int count) {
    return 'Aktif · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Selesai · $count';
  }

  @override
  String get queueNoActiveTitle => 'Tiada apa-apa sedang berjalan';

  @override
  String get queueNoActiveBody =>
      'Fail yang menunggu atau sedang ditukar akan muncul di sini.';

  @override
  String get queueNoFinishedTitle => 'Belum ada yang selesai';

  @override
  String get queueNoFinishedBody =>
      'Fail yang telah ditukar akan berada di sini, sedia untuk dibuka, disimpan atau dikongsi.';

  @override
  String get statusQueued => 'Dalam baris gilir';

  @override
  String get statusRunning => 'Menukar';

  @override
  String get statusCompleted => 'Selesai';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get statusCancelled => 'Dibatalkan';

  @override
  String batchSummary(int done, int total) {
    return '$done daripada $total selesai';
  }

  @override
  String batchCompleted(int done) {
    return 'Fail ditukar: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done ditukar, $failed gagal.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% lebih kecil';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% lebih besar';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Penampilan';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get privacyTitle => 'Privasi';

  @override
  String get privacyBody =>
      'Eluna Media menukar fail anda sepenuhnya pada peranti ini menggunakan salinan FFmpeg yang disertakan. Fail anda tidak pernah meninggalkan peranti, tiada akaun diperlukan, dan tiada telemetri. Tiada apa-apa dalam aplikasi ini yang menggunakan rangkaian — ia tidak memiliki kebenaran internet pun.\n\nPembuangan metadata dihidupkan secara lalai, jadi EXIF, koordinat GPS dan cap masa digugurkan daripada fail yang anda eksport.';

  @override
  String get licenseTitle => 'Pelesenan';

  @override
  String get licenseBody =>
      'Aplikasi ini menyertakan FFmpeg yang dibina dengan x264, x265 dan komponen GPL yang lain, jadi aplikasi ini secara keseluruhan diedarkan di bawah GNU GPL v3.';

  @override
  String get sourceMissing => 'Fail sumber sudah tidak tersedia lagi.';

  @override
  String get tabSettings => 'Tetapan';

  @override
  String get introTitle => 'Peribadi secara reka bentuk';

  @override
  String get introOfflineTitle => 'Menukar pada peranti ini';

  @override
  String get introOfflineBody =>
      'Salinan FFmpeg yang disertakan melakukan semua kerja. Fail anda tidak pernah meninggalkan telefon — penukaran berfungsi dalam mod pesawat.';

  @override
  String get introTelemetryTitle => 'Sifar telemetri';

  @override
  String get introTelemetryBody =>
      'Tiada akaun, tiada analitik, tiada laporan ranap. Aplikasi ini tidak tahu siapa anda.';

  @override
  String get introMetadataTitle => 'Metadata dalam kawalan';

  @override
  String get introMetadataBody =>
      'EXIF, GPS dan cap masa dibuang daripada setiap output secara lalai. Anda boleh mematikannya.';

  @override
  String get introFreeNote =>
      'Percuma, tanpa iklan dan tanpa langganan. Setiap ciri, termasuk penukaran berkelompok, milik anda sejak mula — satu-satunya yang boleh dibeli ialah tip, dan ia tidak membuka apa-apa.';

  @override
  String get introContinue => 'Mula';

  @override
  String get modeSimple => 'Ringkas';

  @override
  String get modeAdvanced => 'Lanjutan';

  @override
  String get modeAdvancedHint =>
      'Tunjukkan setiap kawalan kodek, kadar bit dan transformasi menggantikan kad praset.';

  @override
  String get presetCompressVideoTitle => 'Mampatkan video';

  @override
  String get presetCompressVideoBody =>
      'MP4 jauh lebih kecil, kualiti kekal baik';

  @override
  String get presetFitToSizeTitle => 'Muat ikut saiz';

  @override
  String get presetFitToSizeBody =>
      'Kena had yang tepat — Discord, e-mel, sembang';

  @override
  String get presetCompatibleMp4Title => 'MP4 serasi';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Main di mana-mana';

  @override
  String get presetExtractAudioTitle => 'Ekstrak audio';

  @override
  String get presetExtractAudioBody => 'MP3 daripada mana-mana video';

  @override
  String get presetVideoToGifTitle => 'Video kepada GIF';

  @override
  String get presetVideoToGifBody => 'Klip pendek menjadi GIF beranimasi';

  @override
  String get presetMergeTitle => 'Gabungkan video';

  @override
  String get presetMergeBody =>
      'Cantumkan klip menjadi satu MP4, mengikut susunan';

  @override
  String get mergeNeedsTwo =>
      'Pilih sekurang-kurangnya dua video untuk digabungkan.';

  @override
  String mergedVideoName(int count) {
    return 'Video gabungan ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Mampatkan foto';

  @override
  String get presetCompressImageBody =>
      'JPEG lebih kecil, kehilangan hampir tidak kelihatan';

  @override
  String get presetEnhancePhotoTitle => 'Tingkatkan foto';

  @override
  String get presetEnhancePhotoBody =>
      'Lebih bersih, lebih tajam, warna lebih baik';

  @override
  String get presetImageToWebpTitle => 'Foto kepada WebP';

  @override
  String get presetImageToWebpBody => 'Format moden, lebih kecil daripada JPEG';

  @override
  String get sizeTargetTitle => 'Saiz sasaran';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Tersuai…';

  @override
  String get sizeTargetDialogTitle => 'Saiz sasaran dalam MB';

  @override
  String get sizeTargetTooSmall =>
      'Sasaran terlalu kecil untuk tempoh ini; kualiti terdekat yang mungkin akan digunakan.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size setiap fail';
  }

  @override
  String estimateTotal(String size) {
    return 'Anggaran output: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Fail dipilih: $count';
  }

  @override
  String get promiseOffline => 'Penukaran 100% luar talian';

  @override
  String get promiseBatchFree => 'Kelompok percuma';

  @override
  String get promiseNoWatermark => 'Tiada tera air';

  @override
  String get sectionTransform => 'Transformasi';

  @override
  String get rotateLabel => 'Putar';

  @override
  String get flipLabel => 'Cermin mendatar';

  @override
  String get speedLabel => 'Kelajuan';

  @override
  String get cropLabel => 'Pangkas';

  @override
  String get cropHint =>
      'Pangkas dari tengah kepada nisbah aspek yang dipilih — segi empat sama untuk suapan, 9:16 untuk cerita.';

  @override
  String volumeLabel(int percent) {
    return 'Kelantangan: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio & fail lain';

  @override
  String get hwEncoderLabel => 'Pengekodan perkakasan';

  @override
  String get hwEncoderHint =>
      'Menggunakan cip video peranti dalam mod kadar bit dan muat ikut saiz — jauh lebih pantas dan lebih sejuk. Mod kualiti (CRF) sentiasa menggunakan pengekod perisian yang tepat, dan kerja perkakasan yang gagal akan dicuba semula dengan perisian secara automatik.';

  @override
  String get transformNeedsReencode =>
      'Putaran, cermin dan kelajuan memerlukan pengekodan semula, jadi ia dimatikan semasa salinan strim.';

  @override
  String get capBitrateLabel => 'Jangan sesekali jadikan fail lebih besar';

  @override
  String get capBitrateHint =>
      'Mengehadkan pengekodan pada kadar bit sumber itu sendiri. Kualiti malar tidak mempunyai had atas tersendiri, jadi video yang sudah dimampatkan boleh keluar lebih besar.';

  @override
  String get keepSubtitles => 'Kekalkan sari kata';

  @override
  String get keepSubtitlesHint =>
      'Membawa trek sari kata ke dalam output. Sari kata teks sahaja.';

  @override
  String get sectionTrim => 'Potong';

  @override
  String get trimEnable => 'Potong sumber';

  @override
  String get trimHint =>
      'Tersedia apabila tepat satu fail dengan tempoh yang diketahui berada dalam baris gilir.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Saiz sasaran';

  @override
  String get lowBatteryTitle => 'Bateri lemah';

  @override
  String get lowBatteryBody =>
      'Penukaran menjadikan pemproses bekerja keras. Anda boleh mengecas dahulu, atau teruskan juga.';

  @override
  String get lowBatteryContinue => 'Tukar juga';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Fail diterima: $count';
  }

  @override
  String get saveFile => 'Simpan';

  @override
  String get savedToGallery => 'Disimpan ke galeri, album “Eluna Media”.';

  @override
  String get savedToDownloads => 'Disimpan ke Muat Turun.';

  @override
  String get saveFailed => 'Fail tidak dapat disimpan.';

  @override
  String get jobRemovedUndo => 'Kerja dibuang.';

  @override
  String get finishedClearedUndo => 'Kerja yang selesai dikosongkan.';

  @override
  String get undo => 'Buat asal';

  @override
  String get errorDetailsTitle => 'Butiran ralat';

  @override
  String get sectionConversionPrefs => 'Penukaran';

  @override
  String get powerModeLabel => 'Mod kuasa';

  @override
  String get powerEfficiency => 'Sejuk & pantas';

  @override
  String get powerBalanced => 'Seimbang';

  @override
  String get powerQuality => 'Mampatan maksimum';

  @override
  String get powerModeHint =>
      'Sekuat mana pengekod video bekerja. Lebih sejuk dan lebih pantas bermakna fail agak lebih besar. Tiada apa-apa lagi yang diperlahankan — sama sekali.';

  @override
  String get hapticsLabel => 'Maklum balas getaran';

  @override
  String get networkPrivacyTitle => 'Rangkaian & privasi';

  @override
  String get netAuditIntro =>
      'Senarai lengkap segala yang ada dalam aplikasi ini yang boleh menyentuh rangkaian.';

  @override
  String get netAuditNoneTitle => 'Tiada akses rangkaian langsung';

  @override
  String get netAuditNoneBody =>
      'Aplikasi ini tidak meminta kebenaran internet, jadi ia tidak dapat mencapai rangkaian walaupun ia cuba — anda boleh mengesahkannya dalam maklumat aplikasi pada sistem. Tiada iklan, tiada analitik, tiada semakan kemas kini. “Nilai aplikasi” menyerahkannya kepada aplikasi gedung, dan gedung itulah yang berhubung.';

  @override
  String get netAuditConversionTitle => 'Penukaran';

  @override
  String get netAuditConversionBody =>
      'Berjalan sepenuhnya pada peranti ini melalui FFmpeg yang disertakan. Hidupkan mod pesawat dan tukar — ia berfungsi.';

  @override
  String get netAuditTelemetryTitle => 'Telemetri';

  @override
  String get netAuditTelemetryBody =>
      'Tiada langsung. Aplikasi ini tidak mengumpul analitik, laporan ranap mahupun pengecam, dan tidak mempunyai sistem akaun.';

  @override
  String get netAuditTipsTitle => 'Tip';

  @override
  String get netAuditTipsBody =>
      'Tip dilaksanakan oleh aplikasi Play Store, bukan oleh aplikasi ini — yang masih tidak mempunyai kebenaran internet. Pengebilan memang menambah dua baris pada senarai kebenaran: “pembelian dalam aplikasi”, dan “lihat sambungan rangkaian”, yang hanya membaca sama ada sambungan wujud dan tidak boleh menggunakannya. Tiada apa-apa yang dibeli secara automatik, dan tip tidak membuka apa-apa: setiap ciri di sini percuma.';

  @override
  String get sectionSupport => 'Sokongan';

  @override
  String get rateApp => 'Nilai aplikasi';

  @override
  String get openLicenses => 'Lesen sumber terbuka';

  @override
  String get presetAudioToMp3Title => 'Tukar audio';

  @override
  String get presetAudioToMp3Body => 'Kepada MP3 — main pada apa-apa sahaja';

  @override
  String get presetCompressAudioTitle => 'Mampatkan audio';

  @override
  String get presetCompressAudioBody =>
      'AAC lebih ringan — nota suara, podcast';

  @override
  String get convertTo => 'Tukar kepada';

  @override
  String get formatSectionHint =>
      'Hanya format yang benar-benar boleh dihasilkan daripada fail anda disenaraikan.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Fail';

  @override
  String get mixedSelectionTitle => 'Jenis fail berbeza dipilih';

  @override
  String get mixedSelectionBody =>
      'Setiap fail ditukar dengan praset terbaik untuk jenisnya sendiri. Tambah satu jenis pada satu masa untuk kawalan penuh.';

  @override
  String get filesTitle => 'Fail';

  @override
  String get removeFile => 'Buang';

  @override
  String timeLeft(String time) {
    return '≈ $time lagi';
  }

  @override
  String get jobSettingsTitle => 'Tetapan penukaran';

  @override
  String get jobDetails => 'Butiran';

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
  String get summaryEnhanced => 'Ditingkatkan';

  @override
  String get summaryMetadataStripped => 'Metadata dibuang';

  @override
  String summaryMerge(int count) {
    return 'Klip digabungkan: $count';
  }

  @override
  String get shareApp => 'Kongsi aplikasi';

  @override
  String get shareAppText =>
      'Eluna Media — penukar foto, video dan audio yang percuma dan sepenuhnya luar talian. Tiada langganan, tiada tera air, tiada akaun.';

  @override
  String appVersionLabel(String version) {
    return 'Versi $version';
  }

  @override
  String get openFile => 'Buka';

  @override
  String get openFolder => 'Tunjukkan folder';

  @override
  String get noAppToOpen =>
      'Tiada aplikasi pada peranti ini yang boleh membuka fail itu.';

  @override
  String get openFailed => 'Fail tidak dapat dibuka.';

  @override
  String get twoPassLabel => 'Dua laluan untuk saiz tepat';

  @override
  String get twoPassHint =>
      'Kerja muat ikut saiz dikodkan dua kali dan mengenai bajet bait dengan jauh lebih tepat — dengan masa dan bateri kira-kira dua kali ganda.';

  @override
  String get whatsNewTitle => 'Apa yang baharu';

  @override
  String get whatsNew1 =>
      'Video kini boleh menjadi AV1: fail yang jauh lebih kecil, jika anda sanggup menunggunya.';

  @override
  String get whatsNew2 =>
      'Baharu untuk gambar: AVIF, kira-kira separuh saiz JPEG, dan WebP beranimasi menggantikan GIF.';

  @override
  String get whatsNew3 =>
      'M4A boleh lossless — ALAC kini berada di sebelah AAC.';

  @override
  String get whatsNew4 =>
      'Satu skrin untuk penampilan: kecerahan, warna aksen, hitam pekat OLED dan Material You.';

  @override
  String get whatsNew5 =>
      'Pencapaian mempunyai pingat, tiga tab, dan kemajuan yang boleh anda kongsi sebagai gambar.';

  @override
  String get achievementsTitle => 'Pencapaian';

  @override
  String achievementsProgress(int done, int total) {
    return '$done daripada $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Dikira pada peranti ini sahaja. Tiada apa-apa dimuat naik ke mana-mana.';

  @override
  String get achFirstConversionTitle => 'Langkah pertama';

  @override
  String get achFirstConversionBody => 'Tukar fail pertama anda.';

  @override
  String get achTenConversionsTitle => 'Sudah panas';

  @override
  String get achTenConversionsBody => 'Tukar 10 fail.';

  @override
  String get achFiftyConversionsTitle => 'Pelanggan tetap';

  @override
  String get achFiftyConversionsBody => 'Tukar 50 fail.';

  @override
  String get achTwoHundredConversionsTitle => 'Kuda kerja';

  @override
  String get achTwoHundredConversionsBody => 'Tukar 200 fail.';

  @override
  String get achThousandConversionsTitle => 'Ban berjalan';

  @override
  String get achThousandConversionsBody => 'Tukar 1000 fail.';

  @override
  String get achSaved100MbTitle => 'Penjimat ruang';

  @override
  String get achSaved100MbBody => 'Bebaskan 100 MB secara keseluruhan.';

  @override
  String get achSaved1GbTitle => 'Pemburu gigabait';

  @override
  String get achSaved1GbBody => 'Bebaskan 1 GB secara keseluruhan.';

  @override
  String get achSaved10GbTitle => 'Wira storan';

  @override
  String get achSaved10GbBody => 'Bebaskan 10 GB secara keseluruhan.';

  @override
  String get achBatchOfFiveTitle => 'Pekerja kelompok';

  @override
  String get achBatchOfFiveBody =>
      'Selesaikan satu kelompok 5 fail atau lebih.';

  @override
  String get achBatchOfTwentyTitle => 'Barisan pemasangan';

  @override
  String get achBatchOfTwentyBody =>
      'Selesaikan satu kelompok 20 fail atau lebih.';

  @override
  String get achSniperTitle => 'Penembak tepat';

  @override
  String get achSniperBody => 'Kena saiz yang tepat dengan muat ikut saiz.';

  @override
  String get achMemeSmithTitle => 'Tukang meme';

  @override
  String get achMemeSmithBody => 'Tukar video menjadi GIF.';

  @override
  String get achSoundHunterTitle => 'Pemburu bunyi';

  @override
  String get achSoundHunterBody => 'Ekstrak audio daripada video.';

  @override
  String get achSubtitleKeeperTitle => 'Penjaga sari kata';

  @override
  String get achSubtitleKeeperBody =>
      'Tukar video dengan sari katanya dikekalkan.';

  @override
  String get achDirectorTitle => 'Pengarah';

  @override
  String get achDirectorBody =>
      'Gunakan satu transformasi — putar, pangkas, kelajuan atau kelantangan.';

  @override
  String get achAllRounderTitle => 'Serba boleh';

  @override
  String get achAllRounderBody => 'Tukar video, audio dan satu imej.';

  @override
  String get achNightOwlTitle => 'Burung hantu';

  @override
  String get achNightOwlBody =>
      'Selesaikan satu penukaran antara tengah malam dan 5 pagi.';

  @override
  String get achPlatinumTitle => 'Platinum';

  @override
  String get achPlatinumBody => 'Perolehi setiap pencapaian yang lain.';

  @override
  String get storageTitle => 'Storan';

  @override
  String get storageBody =>
      'Fail yang telah ditukar kekal di dalam aplikasi sehingga anda menyimpan atau mengongsinya, di tempat yang tidak dapat dicapai oleh mana-mana pengurus fail.';

  @override
  String get storageEmpty => 'Tiada apa-apa disimpan';

  @override
  String storageUsage(String size) {
    return 'Disimpan: $size';
  }

  @override
  String get storageClearTitle => 'Kosongkan fail yang disimpan?';

  @override
  String get storageClearBody =>
      'Memadamkan setiap hasil selesai yang masih dipegang oleh aplikasi. Fail yang sudah anda simpan atau kongsi tidak disentuh.';

  @override
  String get storageClearAction => 'Kosongkan';

  @override
  String storageCleared(String size) {
    return '$size dibebaskan';
  }

  @override
  String get autoSaveLabel => 'Simpan hasil secara automatik';

  @override
  String get autoSaveHint =>
      'Meletakkan setiap fail yang selesai ke dalam galeri — audio ke dalam Muat Turun — sebaik sahaja ia sedia.';

  @override
  String get lowSpaceTitle => 'Ruang tinggal sedikit';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Kelompok ini memerlukan kira-kira $needed sedangkan hanya $free yang kosong. Penukaran mungkin berhenti di pertengahan.';
  }

  @override
  String saveAll(int count) {
    return 'Simpan semua ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Disimpan: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved daripada $total disimpan';
  }

  @override
  String get presetFitPhotoTitle => 'Muatkan foto ikut saiz';

  @override
  String get presetFitPhotoBody =>
      'Mampatkan gambar di bawah had yang tepat — borang muat naik, permohonan.';

  @override
  String get photoFitHint =>
      'Aplikasi mencuba beberapa tahap kualiti sehingga ada yang muat. Jika bajetnya terlalu kecil untuk gambar itu, saiz bingkainya turut dikecilkan.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Saiz sasaran dalam KB';

  @override
  String get compareAction => 'Banding';

  @override
  String get compareBefore => 'Sebelum';

  @override
  String get compareAfter => 'Selepas';

  @override
  String get compareHint => 'Tekan dan tahan untuk melihat yang asal.';

  @override
  String get trimStart => 'Mula';

  @override
  String get trimEnd => 'Tamat';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, sehingga $duration';
  }

  @override
  String get imageScaleLabel => 'Skala';

  @override
  String get audioChannelsLabel => 'Saluran';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Kadar sampel';

  @override
  String get voiceAudioHint =>
      'Mono pada 22.05 kHz mengecilkan rakaman suara kepada kira-kira suku saiznya tanpa kehilangan yang boleh didengar. Biarkan kedua-duanya asal untuk muzik.';

  @override
  String get moveUp => 'Alih ke atas';

  @override
  String get moveDown => 'Alih ke bawah';

  @override
  String get renameOutput => 'Namakan semula hasil';

  @override
  String get renameOutputHint => 'Nama baharu';

  @override
  String get renameOutputHelp =>
      'Sambungan fail datang daripada format output. Biarkan kosong untuk menamakan hasil mengikut fail sumber.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Padam fail asal ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Padam fail asal selepas menukar';

  @override
  String get deleteOriginalsHint =>
      'Meminta sistem membuang fail sumber setelah hasilnya disimpan. Sistem sentiasa menunjukkan apa yang akan hilang dan menunggu pengesahan anda.';

  @override
  String get mediaAccessRequired =>
      'Akses kepada pustaka media diperlukan untuk memadam fail asal.';

  @override
  String originalsDeleted(String size) {
    return 'Fail asal dipadam — $size dibebaskan';
  }

  @override
  String get originalsNoneDeleted =>
      'Tiada apa-apa yang dipadam. Hanya fail yang masih dipegang oleh galeri di bawah nama asalnya boleh ditemui.';

  @override
  String reclaimedTotal(String size) {
    return 'Dibebaskan dengan aplikasi ini: $size';
  }

  @override
  String get deleteAllData => 'Padam semua data';

  @override
  String get deleteAllDataHint =>
      'Memadamkan segala yang disimpan aplikasi pada peranti ini: baris gilir, fail yang ditukar, pratonton, pencapaian dan tetapan. Fail yang sudah anda simpan ke galeri dibiarkan sahaja.';

  @override
  String get codecCopy => 'Salin';

  @override
  String get codecCopyRemux => 'Salin (remux)';

  @override
  String get codecNoVideo => 'Tiada video';

  @override
  String get codecNoAudio => 'Tiada audio';

  @override
  String codecLossless(String codec) {
    return '$codec (lossless)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (beranimasi)';
  }

  @override
  String get sizeTargetEmail => 'E-mel';

  @override
  String get trimTimeHint => 'm:ss';
}
