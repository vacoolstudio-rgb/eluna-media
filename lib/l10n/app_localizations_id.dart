// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class L10nId extends L10n {
  L10nId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konversi';

  @override
  String get tabQueue => 'Antrean';

  @override
  String get tabAbout => 'Tentang';

  @override
  String get addFiles => 'Tambah file';

  @override
  String get emptySelectionTitle => 'Belum ada file';

  @override
  String get emptySelectionBody =>
      'Tambahkan foto, video, atau audio. Semuanya diproses di perangkat ini.';

  @override
  String get sectionOutput => 'Output';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Gambar';

  @override
  String get sectionPrivacy => 'Privasi';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Codec video';

  @override
  String get audioCodec => 'Codec audio';

  @override
  String get rateControl => 'Kontrol bitrate';

  @override
  String get rateControlQuality => 'Kualitas konstan (CRF)';

  @override
  String get rateControlBitrate => 'Bitrate target';

  @override
  String crfLabel(int value) {
    return 'Kualitas (CRF $value)';
  }

  @override
  String get crfHint =>
      'Makin rendah, makin bagus kualitasnya dan makin besar filenya.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Preset encoder';

  @override
  String get encodingPresetHint =>
      'Preset yang lebih lambat mengompresi lebih baik, tapi perangkat jadi lebih panas.';

  @override
  String get presetOriginal => 'Asli';

  @override
  String get resolution => 'Resolusi';

  @override
  String get frameRate => 'Frame rate';

  @override
  String imageQuality(int value) {
    return 'Kualitas: $value';
  }

  @override
  String get lossless => 'Lossless';

  @override
  String get losslessHint => 'File lebih besar, hasil pixel-perfect.';

  @override
  String get sectionEnhance => 'Peningkatan';

  @override
  String get sharpenLabel => 'Ketajaman';

  @override
  String get sharpenHint =>
      'Membuat tepi lebih tegas. Foto yang buram atau tidak fokus tidak bisa diselamatkan — detail itu memang tidak ada di file.';

  @override
  String get sharpenStrongHint =>
      'Penajaman kuat bisa meninggalkan halo terang di sepanjang tepi. Coba tingkat sedang dulu.';

  @override
  String get denoiseLabel => 'Reduksi noise';

  @override
  String get denoiseHint =>
      'Membersihkan bintik pada foto gelap dan foto malam. Terlalu kuat justru menghapus detail halus.';

  @override
  String get autoColorLabel => 'Warna dan level otomatis';

  @override
  String get autoColorHint =>
      'Melebarkan kontras dan sedikit menghidupkan warna yang pudar.';

  @override
  String get upscaleLabel => 'Perbesar 2×';

  @override
  String get upscaleHint =>
      'Menggandakan lebar dan tinggi. Detailnya tidak bertambah — berguna untuk mencetak atau memotong gambar.';

  @override
  String get upscaleConflictHint =>
      'Untuk memperbesar, kembalikan Resolusi ke Asli.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Nonaktif';

  @override
  String get enhanceLight => 'Ringan';

  @override
  String get enhanceMedium => 'Sedang';

  @override
  String get enhanceStrong => 'Kuat';

  @override
  String get stripMetadata => 'Hapus metadata';

  @override
  String get stripMetadataHint =>
      'Menghapus EXIF, GPS, dan stempel waktu dari output.';

  @override
  String startConversion(int count) {
    return 'Konversi $count file';
  }

  @override
  String get batchResumed => 'Konversi yang terputus dilanjutkan.';

  @override
  String get converting => 'Mengonversi…';

  @override
  String get cancelBatch => 'Hentikan';

  @override
  String get cancelJob => 'Batal';

  @override
  String get clearFinished => 'Bersihkan yang selesai';

  @override
  String get removeJob => 'Hapus';

  @override
  String get shareFile => 'Bagikan';

  @override
  String get retryJob => 'Coba lagi';

  @override
  String get queueEmptyTitle => 'Antrean kosong';

  @override
  String get queueEmptyBody =>
      'File yang ditambahkan di tab Konversi akan muncul di sini.';

  @override
  String queueActiveTab(int count) {
    return 'Aktif · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Selesai · $count';
  }

  @override
  String get queueNoActiveTitle => 'Tidak ada yang sedang berjalan';

  @override
  String get queueNoActiveBody =>
      'File yang menunggu atau sedang dikonversi muncul di sini.';

  @override
  String get queueNoFinishedTitle => 'Belum ada yang selesai';

  @override
  String get queueNoFinishedBody =>
      'File hasil konversi mendarat di sini, siap dibuka, disimpan, atau dibagikan.';

  @override
  String get statusQueued => 'Dalam antrean';

  @override
  String get statusRunning => 'Mengonversi';

  @override
  String get statusCompleted => 'Selesai';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get statusCancelled => 'Dibatalkan';

  @override
  String batchSummary(int done, int total) {
    return '$done dari $total selesai';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done file dikonversi',
      one: '1 file dikonversi',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done dikonversi, $failed gagal.';
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
  String get appearance => 'Tampilan';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get privacyTitle => 'Privasi';

  @override
  String get privacyBody =>
      'Eluna Media mengonversi file sepenuhnya di perangkat ini menggunakan FFmpeg bawaan. File tidak pernah meninggalkan perangkat, tidak perlu akun, dan tidak ada telemetri. Tidak ada bagian aplikasi yang memakai jaringan — izin internet pun tidak diminta.\n\nPenghapusan metadata aktif secara default, jadi EXIF, koordinat GPS, dan stempel waktu dibuang dari file yang kamu ekspor.';

  @override
  String get licenseTitle => 'Lisensi';

  @override
  String get licenseBody =>
      'Aplikasi ini menyertakan FFmpeg yang dibangun dengan x264, x265, dan komponen GPL lainnya, sehingga aplikasi secara keseluruhan didistribusikan di bawah GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Format ini tidak mendukung codec yang dipilih.';

  @override
  String get sourceMissing => 'File sumber sudah tidak tersedia.';

  @override
  String get errorTitle => 'Konversi gagal';

  @override
  String get tabSettings => 'Setelan';

  @override
  String get introTitle => 'Privat sejak dirancang';

  @override
  String get introOfflineTitle => 'Konversi di perangkat ini';

  @override
  String get introOfflineBody =>
      'Semua pekerjaan dilakukan FFmpeg bawaan. File tidak pernah meninggalkan ponsel — konversi tetap jalan di mode pesawat.';

  @override
  String get introTelemetryTitle => 'Nol telemetri';

  @override
  String get introTelemetryBody =>
      'Tanpa akun, tanpa analitik, tanpa laporan crash. Aplikasi tidak tahu siapa kamu.';

  @override
  String get introMetadataTitle => 'Metadata terkendali';

  @override
  String get introMetadataBody =>
      'EXIF, GPS, dan stempel waktu dihapus dari setiap output secara default. Kamu bisa mematikannya.';

  @override
  String get introFreeNote =>
      'Gratis: tanpa iklan, tanpa langganan, tanpa pembelian dalam aplikasi. Semua fitur, termasuk konversi massal, sudah termasuk.';

  @override
  String get introContinue => 'Mulai';

  @override
  String get modeSimple => 'Sederhana';

  @override
  String get modeAdvanced => 'Lanjutan';

  @override
  String get modeAdvancedHint =>
      'Tampilkan semua kontrol codec, bitrate, dan transformasi alih-alih kartu preset.';

  @override
  String get presetCompressVideoTitle => 'Kompres video';

  @override
  String get presetCompressVideoBody =>
      'MP4 jauh lebih kecil, kualitas tetap bagus';

  @override
  String get presetFitToSizeTitle => 'Sesuaikan ukuran';

  @override
  String get presetFitToSizeBody => 'Tepat di batas — Discord, email, chat';

  @override
  String get presetCompatibleMp4Title => 'MP4 kompatibel';

  @override
  String get presetCompatibleMp4Body =>
      'H.264 + AAC. Bisa diputar di mana saja';

  @override
  String get presetExtractAudioTitle => 'Ekstrak audio';

  @override
  String get presetExtractAudioBody => 'MP3 dari video apa pun';

  @override
  String get presetVideoToGifTitle => 'Video ke GIF';

  @override
  String get presetVideoToGifBody => 'Klip pendek jadi GIF animasi';

  @override
  String get presetMergeTitle => 'Gabung video';

  @override
  String get presetMergeBody => 'Satukan klip jadi satu MP4, berurutan';

  @override
  String get mergeNeedsTwo => 'Pilih minimal dua video untuk digabung.';

  @override
  String mergedVideoName(int count) {
    return 'Video gabungan ($count klip).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Kompres foto';

  @override
  String get presetCompressImageBody =>
      'JPEG lebih kecil, penurunan hampir tak terlihat';

  @override
  String get presetEnhancePhotoTitle => 'Tingkatkan foto';

  @override
  String get presetEnhancePhotoBody =>
      'Lebih bersih, lebih tajam, warna lebih hidup';

  @override
  String get presetImageToWebpTitle => 'Foto ke WebP';

  @override
  String get presetImageToWebpBody => 'Format modern, lebih kecil dari JPEG';

  @override
  String get sizeTargetTitle => 'Ukuran target';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Kustom…';

  @override
  String get sizeTargetDialogTitle => 'Ukuran target dalam MB';

  @override
  String get sizeTargetTooSmall =>
      'Target terlalu kecil untuk durasi ini; kualitas terdekat yang memungkinkan akan digunakan.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per file';
  }

  @override
  String estimateTotal(String size) {
    return 'Perkiraan output: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file dipilih',
      one: '1 file dipilih',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Bersihkan';

  @override
  String get presetExpectsVideo => 'Preset ini untuk file video.';

  @override
  String get presetExpectsImage => 'Preset ini untuk gambar.';

  @override
  String get promiseOffline => 'Konversi 100% offline';

  @override
  String get promiseBatchFree => 'Batch gratis';

  @override
  String get promiseNoWatermark => 'Tanpa watermark';

  @override
  String get sectionTransform => 'Transformasi';

  @override
  String get rotateLabel => 'Putar';

  @override
  String get flipLabel => 'Cermin horizontal';

  @override
  String get speedLabel => 'Kecepatan';

  @override
  String get cropLabel => 'Pangkas';

  @override
  String get cropHint =>
      'Pangkas dari tengah ke rasio aspek yang dipilih — persegi untuk feed, 9:16 untuk story.';

  @override
  String volumeLabel(int percent) {
    return 'Volume: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio & file lainnya';

  @override
  String get hwEncoderLabel => 'Encoding hardware';

  @override
  String get hwEncoderHint =>
      'Memakai chip video perangkat pada mode bitrate dan sesuaikan ukuran — jauh lebih cepat dan adem. Mode kualitas (CRF) selalu memakai encoder software yang presisi, dan tugas hardware yang gagal otomatis diulang lewat software.';

  @override
  String get transformNeedsReencode =>
      'Putar, cermin, dan kecepatan butuh re-encoding, jadi nonaktif saat stream copy.';

  @override
  String get capBitrateLabel => 'Jangan pernah membuat file jadi lebih besar';

  @override
  String get capBitrateHint =>
      'Membatasi enkode pada bitrate file sumbernya sendiri. Kualitas konstan tidak punya batas atas, jadi video yang sudah terkompresi bisa saja malah keluar lebih besar.';

  @override
  String get keepSubtitles => 'Pertahankan subtitle';

  @override
  String get keepSubtitlesHint =>
      'Membawa trek subtitle ke output. Hanya subtitle teks.';

  @override
  String get sectionTrim => 'Trim';

  @override
  String get trimEnable => 'Trim sumber';

  @override
  String get trimHint =>
      'Tersedia saat antrean berisi tepat satu file dengan durasi yang diketahui.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Ukuran target';

  @override
  String get lowBatteryTitle => 'Baterai lemah';

  @override
  String get lowBatteryBody =>
      'Konversi membuat prosesor bekerja keras. Kamu bisa mengisi daya dulu, atau lanjut saja.';

  @override
  String get lowBatteryContinue => 'Tetap konversi';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file diterima',
      one: '1 file diterima',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Simpan';

  @override
  String get savedToGallery => 'Disimpan ke galeri, album “Eluna Media”.';

  @override
  String get savedToDownloads => 'Disimpan ke Unduhan.';

  @override
  String get saveFailed => 'File tidak dapat disimpan.';

  @override
  String get jobRemovedUndo => 'Tugas dihapus.';

  @override
  String get finishedClearedUndo => 'Tugas yang selesai dibersihkan.';

  @override
  String get undo => 'Urungkan';

  @override
  String get errorDetailsTitle => 'Detail error';

  @override
  String get oledDark => 'Tema gelap hitam pekat';

  @override
  String get oledDarkHint => 'Hitam murni menghemat daya di layar OLED.';

  @override
  String get dynamicColorLabel => 'Warna sistem (Material You)';

  @override
  String get dynamicColorHint =>
      'Mengikuti palet wallpaper perangkat bila didukung.';

  @override
  String get sectionConversionPrefs => 'Konversi';

  @override
  String get powerModeLabel => 'Mode daya';

  @override
  String get powerEfficiency => 'Adem & cepat';

  @override
  String get powerBalanced => 'Seimbang';

  @override
  String get powerQuality => 'Kompresi maksimal';

  @override
  String get powerModeHint =>
      'Seberapa keras encoder video bekerja. Lebih adem dan cepat berarti file sedikit lebih besar. Tidak ada hal lain yang diperlambat — sama sekali.';

  @override
  String get hapticsLabel => 'Umpan balik getaran';

  @override
  String get networkPrivacyTitle => 'Jaringan & privasi';

  @override
  String get netAuditIntro =>
      'Daftar lengkap semua hal di aplikasi ini yang bisa mengakses jaringan.';

  @override
  String get netAuditNoneTitle => 'Tidak ada akses jaringan sama sekali';

  @override
  String get netAuditNoneBody =>
      'Aplikasi tidak meminta izin internet, jadi tidak bisa menjangkau jaringan sekalipun ingin — kamu bisa memeriksanya di info aplikasi pada sistem. Tanpa iklan, tanpa analitik, tanpa pengecekan pembaruan. “Beri rating” menyerahkannya ke aplikasi toko, dan toko itulah yang terhubung.';

  @override
  String get netAuditConversionTitle => 'Konversi';

  @override
  String get netAuditConversionBody =>
      'Berjalan sepenuhnya di perangkat ini lewat FFmpeg bawaan. Nyalakan mode pesawat lalu konversi — tetap jalan.';

  @override
  String get netAuditTelemetryTitle => 'Telemetri';

  @override
  String get netAuditTelemetryBody =>
      'Tidak ada. Aplikasi tidak mengumpulkan analitik, laporan crash, maupun identifier, dan tidak punya sistem akun.';

  @override
  String get sectionSupport => 'Dukungan';

  @override
  String get rateApp => 'Beri nilai aplikasi';

  @override
  String get openLicenses => 'Lisensi open source';

  @override
  String get errorFallbackTitle => 'Terjadi kesalahan';

  @override
  String get errorFallbackBody =>
      'Aplikasi mengalami error tak terduga. Antrean dan setelanmu aman — kembali dan coba lagi.';

  @override
  String get presetAudioToMp3Title => 'Konversi audio';

  @override
  String get presetAudioToMp3Body => 'Ke MP3 — bisa diputar di mana saja';

  @override
  String get presetCompressAudioTitle => 'Kompres audio';

  @override
  String get presetCompressAudioBody =>
      'AAC lebih ringan — voice note, podcast';

  @override
  String get convertTo => 'Konversi ke';

  @override
  String get formatRecommended => 'Disarankan';

  @override
  String get formatSectionHint =>
      'Yang ditampilkan hanya format yang benar-benar bisa dihasilkan dari file kamu.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'File';

  @override
  String get mixedSelectionTitle => 'Tipe file yang dipilih berbeda-beda';

  @override
  String get mixedSelectionBody =>
      'Setiap file dikonversi dengan preset terbaik untuk tipenya sendiri. Tambahkan satu jenis dalam satu waktu kalau kamu mau kontrol penuh.';

  @override
  String get filesTitle => 'File';

  @override
  String get removeFile => 'Hapus';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time lagi';
  }

  @override
  String get jobSettingsTitle => 'Pengaturan konversi';

  @override
  String get jobDetails => 'Detail';

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
  String get summaryTwoPass => 'Two-pass';

  @override
  String get summaryEnhanced => 'Ditingkatkan';

  @override
  String get summaryMetadataStripped => 'Metadata dihapus';

  @override
  String summaryMerge(int count) {
    return '$count klip digabung';
  }

  @override
  String get rateDialogTitle => 'Suka dengan Eluna Media?';

  @override
  String get rateDialogBody =>
      'Ketuk salah satu bintang. Penilaianmu hanya antara kamu dan toko aplikasi.';

  @override
  String get rateDialogLater => 'Nanti saja';

  @override
  String get rateFeedbackTitle => 'Apa yang bisa dibuat lebih baik?';

  @override
  String get rateFeedbackBody =>
      'Ceritakan apa yang salah dan akan kami perbaiki. Tanpa akun, tanpa pelacakan — cuma email yang kamu tulis sendiri.';

  @override
  String get rateSendFeedback => 'Tulis masukan';

  @override
  String get rateThanks => 'Terima kasih!';

  @override
  String feedbackSubject(int stars) {
    return 'Masukan Eluna Media ($stars/5)';
  }

  @override
  String get noEmailApp =>
      'Tidak ada aplikasi email yang tersiapkan di perangkat ini.';

  @override
  String get shareApp => 'Bagikan aplikasi';

  @override
  String get shareAppText =>
      'Eluna Media — konverter foto, video, dan audio gratis yang sepenuhnya offline. Tanpa langganan, tanpa watermark, tanpa akun.';

  @override
  String appVersionLabel(String version) {
    return 'Versi $version';
  }

  @override
  String get openFile => 'Buka';

  @override
  String get openFolder => 'Tampilkan folder';

  @override
  String get noAppToOpen =>
      'Tidak ada aplikasi di perangkat ini yang bisa membuka file itu.';

  @override
  String get openFailed => 'Tidak bisa membuka file.';

  @override
  String get twoPassLabel => 'Two-pass untuk ukuran presisi';

  @override
  String get twoPassHint =>
      'Tugas sesuaikan ukuran di-encode dua kali dan jauh lebih tepat mengenai anggaran byte — dengan waktu dan baterai kira-kira dua kali lipat.';

  @override
  String get whatsNewTitle => 'Yang baru';

  @override
  String get whatsNew1 =>
      'File yang selesai kini langsung masuk ke galeri, dan “Simpan semua” mengambil seluruh kumpulan sekaligus.';

  @override
  String get whatsNew2 =>
      'Sesuaikan foto ke ukuran tepat — 100 KB hingga 2 MB, atau angka yang Anda tulis.';

  @override
  String get whatsNew3 =>
      'Aplikasi tak lagi menimbun gigabyte: setelan menampilkan ruang terpakai dan membersihkannya.';

  @override
  String get whatsNew4 =>
      'Hentikan konversi dari notifikasi, dan dapat peringatan sebelum ruang habis.';

  @override
  String get whatsNew5 =>
      'Gambar mini, perbandingan sebelum/sesudah, GIF → MP4, waktu potong yang tepat — dan foto kini diproses beberapa sekaligus.';

  @override
  String get achievementsTitle => 'Pencapaian';

  @override
  String achievementsProgress(int done, int total) {
    return '$done dari $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Pencapaian terbuka: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Dihitung hanya di perangkat ini. Tidak ada yang diunggah ke mana pun.';

  @override
  String get achFirstConversionTitle => 'Langkah pertama';

  @override
  String get achFirstConversionBody => 'Konversi file pertamamu.';

  @override
  String get achTenConversionsTitle => 'Pemanasan';

  @override
  String get achTenConversionsBody => 'Konversi 10 file.';

  @override
  String get achFiftyConversionsTitle => 'Pelanggan tetap';

  @override
  String get achFiftyConversionsBody => 'Konversi 50 file.';

  @override
  String get achTwoHundredConversionsTitle => 'Pekerja keras';

  @override
  String get achTwoHundredConversionsBody => 'Konversi 200 file.';

  @override
  String get achThousandConversionsTitle => 'Konveyor';

  @override
  String get achThousandConversionsBody => 'Konversi 1000 file.';

  @override
  String get achSaved100MbTitle => 'Penghemat ruang';

  @override
  String get achSaved100MbBody => 'Bebaskan total 100 MB.';

  @override
  String get achSaved1GbTitle => 'Pemburu gigabyte';

  @override
  String get achSaved1GbBody => 'Bebaskan total 1 GB.';

  @override
  String get achSaved10GbTitle => 'Pahlawan penyimpanan';

  @override
  String get achSaved10GbBody => 'Bebaskan total 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Pekerja batch';

  @override
  String get achBatchOfFiveBody => 'Selesaikan batch berisi 5 file atau lebih.';

  @override
  String get achBatchOfTwentyTitle => 'Lini perakitan';

  @override
  String get achBatchOfTwentyBody =>
      'Selesaikan batch berisi 20 file atau lebih.';

  @override
  String get achSniperTitle => 'Sniper';

  @override
  String get achSniperBody => 'Kenai ukuran persis dengan sesuaikan ukuran.';

  @override
  String get achMemeSmithTitle => 'Pandai meme';

  @override
  String get achMemeSmithBody => 'Ubah video jadi GIF.';

  @override
  String get achSoundHunterTitle => 'Pemburu suara';

  @override
  String get achSoundHunterBody => 'Ekstrak audio dari video.';

  @override
  String get achSubtitleKeeperTitle => 'Penjaga subtitle';

  @override
  String get achSubtitleKeeperBody =>
      'Konversi video dengan subtitle tetap dibawa.';

  @override
  String get achDirectorTitle => 'Sutradara';

  @override
  String get achDirectorBody =>
      'Terapkan transformasi — putar, pangkas, kecepatan, atau volume.';

  @override
  String get achAllRounderTitle => 'Serba bisa';

  @override
  String get achAllRounderBody => 'Konversi video, audio, dan gambar.';

  @override
  String get achNightOwlTitle => 'Burung hantu';

  @override
  String get achNightOwlBody =>
      'Selesaikan konversi antara tengah malam dan jam 5 pagi.';

  @override
  String get achPlatinumTitle => 'Platinum';

  @override
  String get achPlatinumBody => 'Raih semua pencapaian lainnya.';

  @override
  String get storageTitle => 'Penyimpanan';

  @override
  String get storageBody =>
      'File hasil konversi tetap di dalam aplikasi sampai Anda menyimpan atau membagikannya; tidak ada pengelola file yang bisa menjangkaunya.';

  @override
  String get storageEmpty => 'Tidak ada yang tersimpan';

  @override
  String storageUsage(String size) {
    return 'Terpakai: $size';
  }

  @override
  String get storageClearTitle => 'Hapus file tersimpan?';

  @override
  String get storageClearBody =>
      'Menghapus semua hasil selesai yang masih disimpan aplikasi. File yang sudah Anda simpan atau bagikan tidak terpengaruh.';

  @override
  String get storageClearAction => 'Hapus';

  @override
  String storageCleared(String size) {
    return '$size dibebaskan';
  }

  @override
  String get autoSaveLabel => 'Simpan hasil otomatis';

  @override
  String get autoSaveHint =>
      'Menaruh setiap file selesai di galeri — audio di Unduhan — begitu siap.';

  @override
  String get lowSpaceTitle => 'Ruang tersisa sedikit';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Kumpulan ini butuh sekitar $needed, sedangkan hanya $free yang bebas. Konversi bisa berhenti di tengah jalan.';
  }

  @override
  String saveAll(int count) {
    return 'Simpan semua ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Tersimpan: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved dari $total tersimpan';
  }

  @override
  String get presetFitPhotoTitle => 'Sesuaikan ukuran foto';

  @override
  String get presetFitPhotoBody =>
      'Memampatkan gambar di bawah batas tepat — formulir unggah, lamaran.';

  @override
  String get photoFitHint =>
      'Aplikasi mencoba beberapa tingkat kualitas sampai muat. Jika batasnya terlalu kecil, ukuran gambarnya juga dikecilkan.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Ukuran target dalam KB';

  @override
  String get compareAction => 'Bandingkan';

  @override
  String get compareBefore => 'Sebelum';

  @override
  String get compareAfter => 'Sesudah';

  @override
  String get compareHint => 'Tekan dan tahan untuk melihat aslinya.';

  @override
  String get trimStart => 'Mulai';

  @override
  String get trimEnd => 'Akhir';

  @override
  String trimTimeHelp(String duration) {
    return 'm:dd, maksimal $duration';
  }

  @override
  String get imageScaleLabel => 'Skala';

  @override
  String get audioChannelsLabel => 'Kanal';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Laju sampel';

  @override
  String get voiceAudioHint =>
      'Mono 22,05 kHz memperkecil rekaman suara sekitar seperempat tanpa kehilangan yang terdengar. Untuk musik, biarkan keduanya asli.';

  @override
  String get moveUp => 'Naikkan';

  @override
  String get moveDown => 'Turunkan';

  @override
  String get renameOutput => 'Ganti nama hasil';

  @override
  String get renameOutputHint => 'Nama baru';

  @override
  String get renameOutputHelp =>
      'Ekstensi ditentukan oleh format keluaran. Kosongkan agar hasil memakai nama file sumber.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Hapus file asli ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Hapus file asli setelah konversi';

  @override
  String get deleteOriginalsHint =>
      'Meminta sistem menghapus file sumber setelah hasilnya tersimpan. Sistem selalu menampilkan apa yang akan hilang dan menunggu konfirmasimu.';

  @override
  String originalsDeleted(String size) {
    return 'File asli dihapus — $size dibebaskan';
  }

  @override
  String get originalsNoneDeleted =>
      'Tidak ada yang dihapus. Hanya file yang masih tersimpan di galeri dengan nama aslinya yang bisa ditemukan.';

  @override
  String reclaimedTotal(String size) {
    return 'Dibebaskan lewat aplikasi ini: $size';
  }
}
