// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class L10nRo extends L10n {
  L10nRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Conversie';

  @override
  String get tabQueue => 'Coadă';

  @override
  String get addFiles => 'Adaugă fișiere';

  @override
  String get emptySelectionTitle => 'Niciun fișier deocamdată';

  @override
  String get emptySelectionBody =>
      'Adaugă fotografii, videoclipuri sau fișiere audio. Totul este prelucrat pe acest dispozitiv.';

  @override
  String get sectionOutput => 'Ieșire';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Imagine';

  @override
  String get sectionPrivacy => 'Confidențialitate';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Codec video';

  @override
  String get audioCodec => 'Codec audio';

  @override
  String get rateControl => 'Controlul ratei';

  @override
  String get rateControlQuality => 'Calitate constantă (CRF)';

  @override
  String get rateControlBitrate => 'Rată de biți țintă';

  @override
  String crfLabel(int value) {
    return 'Calitate (CRF $value)';
  }

  @override
  String get crfHint =>
      'O valoare mai mică înseamnă calitate mai bună și un fișier mai mare.';

  @override
  String videoBitrate(int value) {
    return 'Rata de biți video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Rata de biți audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Presetarea codorului';

  @override
  String get encodingPresetHint =>
      'Presetările mai lente comprimă mai bine, dar încălzesc mai tare dispozitivul.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Rezoluție';

  @override
  String get frameRate => 'Rată de cadre';

  @override
  String imageQuality(int value) {
    return 'Calitate: $value';
  }

  @override
  String get lossless => 'Fără pierderi';

  @override
  String get losslessHint =>
      'Fișiere mai mari, rezultat identic la nivel de pixel.';

  @override
  String get sectionEnhance => 'Îmbunătățire';

  @override
  String get sharpenLabel => 'Claritate';

  @override
  String get sharpenHint =>
      'Face marginile mai nete. Nu poate recupera o fotografie mișcată sau neclară — detaliul acela nu se află în fișier.';

  @override
  String get sharpenStrongHint =>
      'Accentuarea puternică poate lăsa halouri luminoase de-a lungul marginilor. Încearcă întâi nivelul mediu.';

  @override
  String get denoiseLabel => 'Reducerea zgomotului';

  @override
  String get denoiseHint =>
      'Curăță granulația din fotografiile întunecate și de noapte. Prea multă netezește și detaliile fine.';

  @override
  String get autoColorLabel => 'Culoare și niveluri automate';

  @override
  String get autoColorHint =>
      'Întinde puțin contrastul și înviorează culorile terne.';

  @override
  String get upscaleLabel => 'Mărire 2×';

  @override
  String get upscaleHint =>
      'Dublează lățimea și înălțimea. Nu adaugă detaliu — ajută la tipărire sau la decupare.';

  @override
  String get upscaleConflictHint =>
      'Pune Rezoluția înapoi pe Original pentru a mări.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Oprit';

  @override
  String get enhanceLight => 'Ușoară';

  @override
  String get enhanceMedium => 'Medie';

  @override
  String get enhanceStrong => 'Puternică';

  @override
  String get stripMetadata => 'Elimină metadatele';

  @override
  String get stripMetadataHint =>
      'Șterge datele EXIF, GPS și marcajele de timp din rezultat.';

  @override
  String startConversion(int count) {
    return 'Convertește fișiere ($count)';
  }

  @override
  String get batchResumed => 'Conversia întreruptă a fost reluată.';

  @override
  String get converting => 'Se convertește…';

  @override
  String get cancelBatch => 'Oprește';

  @override
  String get cancelJob => 'Anulează';

  @override
  String get clearFinished => 'Șterge cele finalizate';

  @override
  String get removeJob => 'Elimină';

  @override
  String get shareFile => 'Partajează';

  @override
  String get retryJob => 'Reîncearcă';

  @override
  String get queueEmptyTitle => 'Coada este goală';

  @override
  String get queueEmptyBody =>
      'Fișierele adăugate în fila Conversie apar aici.';

  @override
  String queueActiveTab(int count) {
    return 'Active · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Finalizate · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nimic în curs';

  @override
  String get queueNoActiveBody =>
      'Fișierele care așteaptă sau se convertesc apar aici.';

  @override
  String get queueNoFinishedTitle => 'Nimic finalizat deocamdată';

  @override
  String get queueNoFinishedBody =>
      'Fișierele convertite ajung aici, gata de deschis, de salvat sau de partajat.';

  @override
  String get statusQueued => 'În așteptare';

  @override
  String get statusRunning => 'Se convertește';

  @override
  String get statusCompleted => 'Gata';

  @override
  String get statusFailed => 'Eșuat';

  @override
  String get statusCancelled => 'Anulat';

  @override
  String batchSummary(int done, int total) {
    return '$done din $total gata';
  }

  @override
  String batchCompleted(int done) {
    return 'Fișiere convertite: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done convertite, $failed eșuate.';
  }

  @override
  String savedPercent(int percent) {
    return 'Cu $percent% mai mic';
  }

  @override
  String grewPercent(int percent) {
    return 'Cu $percent% mai mare';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Aspect';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get language => 'Limbă';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get privacyTitle => 'Confidențialitate';

  @override
  String get privacyBody =>
      'Eluna Media îți convertește fișierele în întregime pe acest dispozitiv, folosind o copie inclusă a FFmpeg. Fișierele tale nu părăsesc niciodată dispozitivul, nu este nevoie de cont și nu există telemetrie. Nimic din aplicație nu folosește rețeaua — nici măcar nu deține permisiunea de internet.\n\nEliminarea metadatelor este activată implicit, așa că datele EXIF, coordonatele GPS și marcajele de timp sunt scoase din fișierele pe care le exporți.';

  @override
  String get licenseTitle => 'Licențiere';

  @override
  String get licenseBody =>
      'Această aplicație include FFmpeg compilat cu x264, x265 și alte componente GPL, prin urmare aplicația în ansamblu este distribuită sub GNU GPL v3.';

  @override
  String get sourceMissing => 'Fișierul sursă nu mai este disponibil.';

  @override
  String get tabSettings => 'Setări';

  @override
  String get introTitle => 'Privat prin concepție';

  @override
  String get introOfflineTitle => 'Convertește pe acest dispozitiv';

  @override
  String get introOfflineBody =>
      'O copie inclusă a FFmpeg face toată treaba. Fișierele tale nu părăsesc niciodată telefonul — conversia funcționează și în modul avion.';

  @override
  String get introTelemetryTitle => 'Zero telemetrie';

  @override
  String get introTelemetryBody =>
      'Fără cont, fără analiză, fără rapoarte de eroare. Aplicația nu știe cine ești.';

  @override
  String get introMetadataTitle => 'Metadatele sub control';

  @override
  String get introMetadataBody =>
      'Datele EXIF, GPS și marcajele de timp sunt eliminate implicit din fiecare rezultat. Poți dezactiva asta.';

  @override
  String get introFreeNote =>
      'Gratuită, fără reclame și fără abonamente. Fiecare funcție, inclusiv conversia în lot, îți aparține de la bun început — singurul lucru care poate fi cumpărat este un bacșiș, iar el nu deblochează nimic.';

  @override
  String get introContinue => 'Să începem';

  @override
  String get modeSimple => 'Simplu';

  @override
  String get modeAdvanced => 'Avansat';

  @override
  String get modeAdvancedHint =>
      'Arată toate controalele de codec, rată de biți și transformare, în locul cardurilor cu presetări.';

  @override
  String get presetCompressVideoTitle => 'Comprimă videoclipul';

  @override
  String get presetCompressVideoBody =>
      'MP4 mult mai mic, calitatea rămâne bună';

  @override
  String get presetFitToSizeTitle => 'Încadrează în dimensiune';

  @override
  String get presetFitToSizeBody =>
      'Atinge o limită exactă — Discord, e-mail, conversații';

  @override
  String get presetCompatibleMp4Title => 'MP4 compatibil';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Se redă peste tot';

  @override
  String get presetExtractAudioTitle => 'Extrage sunetul';

  @override
  String get presetExtractAudioBody => 'MP3 din orice videoclip';

  @override
  String get presetVideoToGifTitle => 'Video în GIF';

  @override
  String get presetVideoToGifBody => 'Un clip scurt devine un GIF animat';

  @override
  String get presetMergeTitle => 'Unește videoclipuri';

  @override
  String get presetMergeBody => 'Leagă clipurile într-un singur MP4, în ordine';

  @override
  String get mergeNeedsTwo =>
      'Selectează cel puțin două videoclipuri pentru a le uni.';

  @override
  String mergedVideoName(int count) {
    return 'Videoclip unit ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Comprimă fotografia';

  @override
  String get presetCompressImageBody =>
      'JPEG mai mic, cu pierderi abia vizibile';

  @override
  String get presetEnhancePhotoTitle => 'Îmbunătățește fotografia';

  @override
  String get presetEnhancePhotoBody =>
      'Mai curată, mai clară, cu culori mai bune';

  @override
  String get presetImageToWebpTitle => 'Fotografie în WebP';

  @override
  String get presetImageToWebpBody => 'Format modern, mai mic decât JPEG';

  @override
  String get sizeTargetTitle => 'Dimensiune-țintă';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Personalizată…';

  @override
  String get sizeTargetDialogTitle => 'Dimensiunea-țintă în MB';

  @override
  String get sizeTargetTooSmall =>
      'Ținta este prea mică pentru această durată; se va folosi cea mai apropiată calitate posibilă.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size pe fișier';
  }

  @override
  String estimateTotal(String size) {
    return 'Rezultat estimat: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Fișiere selectate: $count';
  }

  @override
  String get promiseOffline => 'Conversie 100% offline';

  @override
  String get promiseBatchFree => 'Lotul este gratuit';

  @override
  String get promiseNoWatermark => 'Fără filigran';

  @override
  String get sectionTransform => 'Transformare';

  @override
  String get rotateLabel => 'Rotire';

  @override
  String get flipLabel => 'Oglindire pe orizontală';

  @override
  String get speedLabel => 'Viteză';

  @override
  String get cropLabel => 'Decupare';

  @override
  String get cropHint =>
      'Decupare centrată la raportul de aspect ales — pătrat pentru fluxuri, 9:16 pentru povești.';

  @override
  String volumeLabel(int percent) {
    return 'Volum: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio și alte fișiere';

  @override
  String get hwEncoderLabel => 'Codare hardware';

  @override
  String get hwEncoderHint =>
      'Folosește cipul video al dispozitivului în modurile rată de biți și încadrare în dimensiune — mult mai rapid și mai răcoros. Modul calitate (CRF) folosește întotdeauna codorul software precis, iar o sarcină hardware eșuată se reia automat pe software.';

  @override
  String get transformNeedsReencode =>
      'Rotirea, oglindirea și viteza cer o recodare, așa că sunt dezactivate în timpul copierii fluxului.';

  @override
  String get capBitrateLabel => 'Nu mări niciodată fișierul';

  @override
  String get capBitrateHint =>
      'Limitează codarea la rata de biți a sursei. Calitatea constantă nu are un plafon propriu, așa că un videoclip deja comprimat poate ieși altfel mai mare.';

  @override
  String get keepSubtitles => 'Păstrează subtitrările';

  @override
  String get keepSubtitlesHint =>
      'Duce pistele de subtitrare în rezultat. Doar subtitrări text.';

  @override
  String get sectionTrim => 'Tăiere';

  @override
  String get trimEnable => 'Taie sursa';

  @override
  String get trimHint =>
      'Disponibilă când în coadă se află exact un fișier cu durată cunoscută.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Dimensiune-țintă';

  @override
  String get lowBatteryTitle => 'Bateria este scăzută';

  @override
  String get lowBatteryBody =>
      'Conversia solicită puternic procesorul. Poți pune întâi telefonul la încărcat sau poți continua oricum.';

  @override
  String get lowBatteryContinue => 'Convertește oricum';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Fișiere primite: $count';
  }

  @override
  String get saveFile => 'Salvează';

  @override
  String get savedToGallery => 'Salvat în galerie, în albumul „Eluna Media”.';

  @override
  String get savedToDownloads => 'Salvat în Descărcări.';

  @override
  String get saveFailed => 'Fișierul nu a putut fi salvat.';

  @override
  String get jobRemovedUndo => 'Sarcină eliminată.';

  @override
  String get finishedClearedUndo => 'Sarcinile finalizate au fost șterse.';

  @override
  String get undo => 'Anulează';

  @override
  String get errorDetailsTitle => 'Detaliile erorii';

  @override
  String get sectionConversionPrefs => 'Conversie';

  @override
  String get powerModeLabel => 'Mod de consum';

  @override
  String get powerEfficiency => 'Răcoros și rapid';

  @override
  String get powerBalanced => 'Echilibrat';

  @override
  String get powerQuality => 'Compresie maximă';

  @override
  String get powerModeHint =>
      'Cât de tare lucrează codorul video. Mai răcoros și mai rapid înseamnă fișiere ceva mai mari. Nimic altceva nu este limitat — niciodată.';

  @override
  String get hapticsLabel => 'Răspuns prin vibrații';

  @override
  String get networkPrivacyTitle => 'Rețea și confidențialitate';

  @override
  String get netAuditIntro =>
      'O listă completă a tot ce, în această aplicație, ar putea atinge rețeaua.';

  @override
  String get netAuditNoneTitle => 'Niciun acces la rețea';

  @override
  String get netAuditNoneBody =>
      'Aplicația nu cere permisiunea de internet, așa că nu ar putea ajunge la rețea nici dacă ar încerca — poți verifica asta în informațiile despre aplicație din sistem. Fără reclame, fără analiză, fără verificări de actualizări. „Evaluează aplicația” predă sarcina aplicației magazinului, care vorbește în numele ei.';

  @override
  String get netAuditConversionTitle => 'Conversie';

  @override
  String get netAuditConversionBody =>
      'Rulează în întregime pe acest dispozitiv, printr-un FFmpeg inclus. Pornește modul avion și convertește — funcționează.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrie';

  @override
  String get netAuditTelemetryBody =>
      'Nu există. Aplicația nu colectează date de analiză, rapoarte de eroare sau identificatori și nu are un sistem de conturi.';

  @override
  String get netAuditTipsTitle => 'Bacșiș';

  @override
  String get netAuditTipsBody =>
      'Bacșișul este gestionat de aplicația Play Store, nu de aceasta — care tot nu deține permisiunea de internet. Facturarea adaugă totuși două rânduri în lista de permisiuni: „achiziții în aplicație” și „vizualizarea conexiunilor de rețea”, care doar citește dacă există o conexiune și nu o poate folosi. Nimic nu se cumpără automat, iar un bacșiș nu deblochează nimic: aici fiecare funcție este gratuită.';

  @override
  String get sectionSupport => 'Sprijin';

  @override
  String get rateApp => 'Evaluează aplicația';

  @override
  String get openLicenses => 'Licențe open source';

  @override
  String get presetAudioToMp3Title => 'Convertește sunetul';

  @override
  String get presetAudioToMp3Body => 'În MP3 — se redă pe orice';

  @override
  String get presetCompressAudioTitle => 'Comprimă sunetul';

  @override
  String get presetCompressAudioBody =>
      'AAC mai suplu — notițe vocale, podcasturi';

  @override
  String get convertTo => 'Convertește în';

  @override
  String get formatSectionHint =>
      'Sunt listate doar formatele în care fișierele tale pot deveni cu adevărat.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Fotografie';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Fișier';

  @override
  String get mixedSelectionTitle => 'Sunt selectate tipuri diferite de fișiere';

  @override
  String get mixedSelectionBody =>
      'Fiecare fișier este convertit cu presetarea potrivită tipului său. Adaugă câte un singur tip odată pentru control deplin.';

  @override
  String get filesTitle => 'Fișiere';

  @override
  String get removeFile => 'Elimină';

  @override
  String timeLeft(String time) {
    return '≈ $time rămase';
  }

  @override
  String get jobSettingsTitle => 'Setările conversiei';

  @override
  String get jobDetails => 'Detalii';

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
  String get summaryEnhanced => 'Îmbunătățit';

  @override
  String get summaryMetadataStripped => 'Metadate eliminate';

  @override
  String summaryMerge(int count) {
    return 'Clipuri unite: $count';
  }

  @override
  String get shareApp => 'Partajează aplicația';

  @override
  String get shareAppText =>
      'Eluna Media — un convertor de fotografii, videoclipuri și sunet gratuit și complet offline. Fără abonamente, fără filigrane, fără conturi.';

  @override
  String appVersionLabel(String version) {
    return 'Versiunea $version';
  }

  @override
  String get openFile => 'Deschide';

  @override
  String get openFolder => 'Arată folderul';

  @override
  String get noAppToOpen =>
      'Nicio aplicație de pe acest dispozitiv nu poate deschide acel fișier.';

  @override
  String get openFailed => 'Fișierul nu a putut fi deschis.';

  @override
  String get twoPassLabel => 'Două treceri pentru dimensiune exactă';

  @override
  String get twoPassHint =>
      'Sarcinile de încadrare în dimensiune codează de două ori și respectă bugetul de octeți vizibil mai precis — cu aproximativ dublul timpului și al consumului de baterie.';

  @override
  String get whatsNewTitle => 'Noutăți';

  @override
  String get whatsNew1 =>
      'Videoclipurile pot fi acum AV1: fișiere considerabil mai mici, dacă ai răbdare să le aștepți.';

  @override
  String get whatsNew2 =>
      'Noutăți pentru imagini: AVIF, cam jumătate dintr-un JPEG, și WebP animat în locul unui GIF.';

  @override
  String get whatsNew3 =>
      'M4A poate fi fără pierderi — ALAC stă acum alături de AAC.';

  @override
  String get whatsNew4 =>
      'Un singur ecran pentru înfățișare: luminozitate, culoare de accent, negru pur pentru OLED și Material You.';

  @override
  String get whatsNew5 =>
      'Realizările au medalii, trei file și un progres pe care îl poți partaja ca imagine.';

  @override
  String get achievementsTitle => 'Realizări';

  @override
  String achievementsProgress(int done, int total) {
    return '$done din $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Numărate doar pe acest dispozitiv. Nimic nu este încărcat nicăieri.';

  @override
  String get achFirstConversionTitle => 'Primii pași';

  @override
  String get achFirstConversionBody => 'Convertește primul tău fișier.';

  @override
  String get achTenConversionsTitle => 'Încălzit';

  @override
  String get achTenConversionsBody => 'Convertește 10 fișiere.';

  @override
  String get achFiftyConversionsTitle => 'Obișnuit al casei';

  @override
  String get achFiftyConversionsBody => 'Convertește 50 de fișiere.';

  @override
  String get achTwoHundredConversionsTitle => 'Cal de povară';

  @override
  String get achTwoHundredConversionsBody => 'Convertește 200 de fișiere.';

  @override
  String get achThousandConversionsTitle => 'Bandă rulantă';

  @override
  String get achThousandConversionsBody => 'Convertește 1000 de fișiere.';

  @override
  String get achSaved100MbTitle => 'Econom de spațiu';

  @override
  String get achSaved100MbBody => 'Eliberează 100 MB în total.';

  @override
  String get achSaved1GbTitle => 'Vânător de gigaocteți';

  @override
  String get achSaved1GbBody => 'Eliberează 1 GB în total.';

  @override
  String get achSaved10GbTitle => 'Eroul stocării';

  @override
  String get achSaved10GbBody => 'Eliberează 10 GB în total.';

  @override
  String get achBatchOfFiveTitle => 'Lucrător în lot';

  @override
  String get achBatchOfFiveBody => 'Termină un lot de cel puțin 5 fișiere.';

  @override
  String get achBatchOfTwentyTitle => 'Linie de asamblare';

  @override
  String get achBatchOfTwentyBody =>
      'Termină un lot de cel puțin 20 de fișiere.';

  @override
  String get achSniperTitle => 'Lunetist';

  @override
  String get achSniperBody =>
      'Nimerește o dimensiune exactă cu încadrarea în dimensiune.';

  @override
  String get achMemeSmithTitle => 'Făurar de meme';

  @override
  String get achMemeSmithBody => 'Transformă un videoclip într-un GIF.';

  @override
  String get achSoundHunterTitle => 'Vânător de sunete';

  @override
  String get achSoundHunterBody => 'Extrage sunetul dintr-un videoclip.';

  @override
  String get achSubtitleKeeperTitle => 'Păstrător de subtitrări';

  @override
  String get achSubtitleKeeperBody =>
      'Convertește un videoclip păstrându-i subtitrările.';

  @override
  String get achDirectorTitle => 'Regizor';

  @override
  String get achDirectorBody =>
      'Aplică o transformare — rotire, decupare, viteză sau volum.';

  @override
  String get achAllRounderTitle => 'Om bun la toate';

  @override
  String get achAllRounderBody =>
      'Convertește un videoclip, un fișier audio și o imagine.';

  @override
  String get achNightOwlTitle => 'Pasăre de noapte';

  @override
  String get achNightOwlBody =>
      'Termină o conversie între miezul nopții și ora 5 dimineața.';

  @override
  String get achPlatinumTitle => 'Platină';

  @override
  String get achPlatinumBody => 'Obține toate celelalte realizări.';

  @override
  String get storageTitle => 'Stocare';

  @override
  String get storageBody =>
      'Fișierele convertite rămân în interiorul aplicației până le salvezi sau le partajezi, acolo unde niciun manager de fișiere nu ajunge.';

  @override
  String get storageEmpty => 'Nimic stocat';

  @override
  String storageUsage(String size) {
    return 'Stocat: $size';
  }

  @override
  String get storageClearTitle => 'Ștergi fișierele stocate?';

  @override
  String get storageClearBody =>
      'Șterge toate rezultatele finalizate pe care aplicația le mai păstrează. Fișierele deja salvate sau partajate rămân neatinse.';

  @override
  String get storageClearAction => 'Șterge';

  @override
  String storageCleared(String size) {
    return 'S-au eliberat $size';
  }

  @override
  String get autoSaveLabel => 'Salvează rezultatele automat';

  @override
  String get autoSaveHint =>
      'Pune fiecare fișier finalizat în galerie — sunetul în Descărcări — imediat ce este gata.';

  @override
  String get lowSpaceTitle => 'A mai rămas puțin loc';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Acest lot are nevoie de aproximativ $needed, iar liber este doar $free. Conversia s-ar putea opri la jumătate.';
  }

  @override
  String saveAll(int count) {
    return 'Salvează tot ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Salvate: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'S-au salvat $saved din $total';
  }

  @override
  String get presetFitPhotoTitle => 'Încadrează fotografia în dimensiune';

  @override
  String get presetFitPhotoBody =>
      'Strânge o imagine sub o limită exactă — formulare de încărcare, dosare.';

  @override
  String get photoFitHint =>
      'Aplicația încearcă diferite calități până când una se încadrează. Dacă bugetul este prea mic pentru imagine, reduce și dimensiunea cadrului.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Dimensiunea-țintă în KB';

  @override
  String get compareAction => 'Compară';

  @override
  String get compareBefore => 'Înainte';

  @override
  String get compareAfter => 'După';

  @override
  String get compareHint => 'Apasă lung pentru a vedea originalul.';

  @override
  String get trimStart => 'Început';

  @override
  String get trimEnd => 'Sfârșit';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, până la $duration';
  }

  @override
  String get imageScaleLabel => 'Scalare';

  @override
  String get audioChannelsLabel => 'Canale';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Frecvență de eșantionare';

  @override
  String get voiceAudioHint =>
      'Mono la 22,05 kHz reduce o înregistrare vocală cam la un sfert, fără pierderi audibile. Pentru muzică lasă ambele pe original.';

  @override
  String get moveUp => 'Mută mai sus';

  @override
  String get moveDown => 'Mută mai jos';

  @override
  String get renameOutput => 'Redenumește rezultatul';

  @override
  String get renameOutputHint => 'Nume nou';

  @override
  String get renameOutputHelp =>
      'Extensia vine din formatul de ieșire. Lasă gol pentru ca rezultatul să poarte numele sursei.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Șterge originalele ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Șterge originalele după conversie';

  @override
  String get deleteOriginalsHint =>
      'Cere sistemului să elimine fișierele sursă după ce rezultatul a fost salvat. Sistemul arată întotdeauna ce urmează să dispară și așteaptă confirmarea ta.';

  @override
  String get mediaAccessRequired =>
      'Pentru a șterge originalele este nevoie de acces la biblioteca media.';

  @override
  String originalsDeleted(String size) {
    return 'Originalele au fost șterse — $size eliberați';
  }

  @override
  String get originalsNoneDeleted =>
      'Nu s-a șters nimic. Pot fi găsite doar fișierele pe care galeria le mai păstrează sub numele lor original.';

  @override
  String reclaimedTotal(String size) {
    return 'Eliberat cu această aplicație: $size';
  }

  @override
  String get deleteAllData => 'Șterge toate datele';

  @override
  String get deleteAllDataHint =>
      'Șterge tot ce păstrează aplicația pe acest dispozitiv: coada, fișierele convertite, previzualizările, realizările și setările. Fișierele salvate deja în galerie rămân neatinse.';

  @override
  String get codecCopy => 'Copiere';

  @override
  String get codecCopyRemux => 'Copiere (reîmpachetare)';

  @override
  String get codecNoVideo => 'Fără video';

  @override
  String get codecNoAudio => 'Fără audio';

  @override
  String codecLossless(String codec) {
    return '$codec (fără pierderi)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animat)';
  }

  @override
  String get sizeTargetEmail => 'E-mail';

  @override
  String get trimTimeHint => 'm:ss';
}
