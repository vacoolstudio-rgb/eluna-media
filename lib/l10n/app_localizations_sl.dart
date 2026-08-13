// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class L10nSl extends L10n {
  L10nSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Pretvorba';

  @override
  String get tabQueue => 'Čakalna vrsta';

  @override
  String get addFiles => 'Dodaj datoteke';

  @override
  String get emptySelectionTitle => 'Datotek še ni';

  @override
  String get emptySelectionBody =>
      'Dodajte fotografije, videoposnetke ali zvok. Vse se obdela na tej napravi.';

  @override
  String get sectionOutput => 'Izhod';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Zvok';

  @override
  String get sectionImage => 'Slika';

  @override
  String get sectionPrivacy => 'Zasebnost';

  @override
  String get outputFormat => 'Zapis';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Zvočni kodek';

  @override
  String get rateControl => 'Nadzor bitne hitrosti';

  @override
  String get rateControlQuality => 'Stalna kakovost (CRF)';

  @override
  String get rateControlBitrate => 'Ciljna bitna hitrost';

  @override
  String crfLabel(int value) {
    return 'Kakovost (CRF $value)';
  }

  @override
  String get crfHint =>
      'Nižja vrednost pomeni boljšo kakovost in večjo datoteko.';

  @override
  String videoBitrate(int value) {
    return 'Bitna hitrost videa: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitna hitrost zvoka: $value kbps';
  }

  @override
  String get encodingPreset => 'Prednastavitev kodirnika';

  @override
  String get encodingPresetHint =>
      'Počasnejše prednastavitve bolje stisnejo, a napravo bolj segrejejo.';

  @override
  String get presetOriginal => 'Izvirno';

  @override
  String get resolution => 'Ločljivost';

  @override
  String get frameRate => 'Hitrost sličic';

  @override
  String imageQuality(int value) {
    return 'Kakovost: $value';
  }

  @override
  String get lossless => 'Brez izgub';

  @override
  String get losslessHint =>
      'Večje datoteke, izhod je natančen do slikovne pike.';

  @override
  String get sectionEnhance => 'Izboljšava';

  @override
  String get sharpenLabel => 'Ostrina';

  @override
  String get sharpenHint =>
      'Robove naredi izrazitejše. Zamegljenega ali neizostrenega posnetka ne more popraviti — te podrobnosti v datoteki ni.';

  @override
  String get sharpenStrongHint =>
      'Močno ostrenje lahko ob robovih pusti svetle obrobe. Najprej poskusite srednjo stopnjo.';

  @override
  String get denoiseLabel => 'Odpravljanje šuma';

  @override
  String get denoiseHint =>
      'Očisti zrnatost na temnih in nočnih fotografijah. Prevelika vrednost zgladi tudi drobne podrobnosti.';

  @override
  String get autoColorLabel => 'Samodejne barve in ravni';

  @override
  String get autoColorHint =>
      'Nekoliko raztegne kontrast in poživi plehke barve.';

  @override
  String get upscaleLabel => 'Povečava 2×';

  @override
  String get upscaleHint =>
      'Podvoji širino in višino. Podrobnosti ne doda — pomaga pri tiskanju ali obrezovanju.';

  @override
  String get upscaleConflictHint =>
      'Za povečavo nastavite Ločljivost nazaj na Izvirno.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Izklopljeno';

  @override
  String get enhanceLight => 'Rahlo';

  @override
  String get enhanceMedium => 'Srednje';

  @override
  String get enhanceStrong => 'Močno';

  @override
  String get stripMetadata => 'Odstrani metapodatke';

  @override
  String get stripMetadataHint =>
      'Iz izhodne datoteke odstrani EXIF, GPS in časovne oznake.';

  @override
  String startConversion(int count) {
    return 'Pretvori $count datotek';
  }

  @override
  String get batchResumed => 'Prekinjena pretvorba se je nadaljevala.';

  @override
  String get converting => 'Pretvarjanje…';

  @override
  String get cancelBatch => 'Ustavi';

  @override
  String get cancelJob => 'Prekliči';

  @override
  String get clearFinished => 'Počisti končane';

  @override
  String get removeJob => 'Odstrani';

  @override
  String get shareFile => 'Deli';

  @override
  String get retryJob => 'Poskusi znova';

  @override
  String get queueEmptyTitle => 'Čakalna vrsta je prazna';

  @override
  String get queueEmptyBody =>
      'Datoteke, ki jih dodate na zavihku Pretvorba, se pokažejo tukaj.';

  @override
  String queueActiveTab(int count) {
    return 'Aktivne · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Končane · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nič ni v teku';

  @override
  String get queueNoActiveBody =>
      'Tukaj se pokažejo datoteke, ki čakajo ali se pretvarjajo.';

  @override
  String get queueNoFinishedTitle => 'Nič še ni končano';

  @override
  String get queueNoFinishedBody =>
      'Pretvorjene datoteke pristanejo tukaj, pripravljene za odpiranje, shranjevanje ali deljenje.';

  @override
  String get statusQueued => 'V čakalni vrsti';

  @override
  String get statusRunning => 'Pretvarjanje';

  @override
  String get statusCompleted => 'Končano';

  @override
  String get statusFailed => 'Neuspešno';

  @override
  String get statusCancelled => 'Preklicano';

  @override
  String batchSummary(int done, int total) {
    return '$done od $total končanih';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Pretvorjenih $done datotek',
      few: 'Pretvorjene $done datoteke',
      two: 'Pretvorjeni $done datoteki',
      one: 'Pretvorjena $done datoteka',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Pretvorjenih $done, neuspešnih $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent % manjša';
  }

  @override
  String grewPercent(int percent) {
    return '$percent % večja';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Videz';

  @override
  String get themeSystem => 'Sistemsko';

  @override
  String get language => 'Jezik';

  @override
  String get languageSystem => 'Sistemski';

  @override
  String get privacyTitle => 'Zasebnost';

  @override
  String get privacyBody =>
      'Eluna Media vaše datoteke pretvarja v celoti na tej napravi, s priloženo kopijo FFmpeg. Vaše datoteke naprave nikoli ne zapustijo, računa ni treba ustvariti, telemetrije ni. Nič v aplikaciji ne uporablja omrežja — nima niti dovoljenja za dostop do interneta.\n\nOdstranjevanje metapodatkov je privzeto vklopljeno, zato se EXIF, koordinate GPS in časovne oznake iz izvoženih datotek odstranijo.';

  @override
  String get licenseTitle => 'Licenciranje';

  @override
  String get licenseBody =>
      'Aplikacija vsebuje FFmpeg, zgrajen z x264, x265 in drugimi komponentami GPL, zato se aplikacija kot celota distribuira pod GNU GPL v3.';

  @override
  String get sourceMissing => 'Izvorna datoteka ni več na voljo.';

  @override
  String get tabSettings => 'Nastavitve';

  @override
  String get introTitle => 'Zasebno po zasnovi';

  @override
  String get introOfflineTitle => 'Pretvarja na tej napravi';

  @override
  String get introOfflineBody =>
      'Vse delo opravi priložena kopija FFmpeg. Vaše datoteke telefona nikoli ne zapustijo — pretvorba deluje tudi v načinu za letalo.';

  @override
  String get introTelemetryTitle => 'Nič telemetrije';

  @override
  String get introTelemetryBody =>
      'Brez računa, brez analitike, brez poročanja o sesutjih. Aplikacija ne ve, kdo ste.';

  @override
  String get introMetadataTitle => 'Metapodatki pod nadzorom';

  @override
  String get introMetadataBody =>
      'EXIF, GPS in časovne oznake so privzeto odstranjeni iz vsakega izhoda. To lahko izklopite.';

  @override
  String get introFreeNote =>
      'Brezplačno, brez oglasov in brez naročnin. Vse funkcije, tudi paketna pretvorba, so vaše že od začetka — kupiti je mogoče le napitnino, ki ne odklene ničesar.';

  @override
  String get introContinue => 'Začnimo';

  @override
  String get modeSimple => 'Preprosto';

  @override
  String get modeAdvanced => 'Napredno';

  @override
  String get modeAdvancedHint =>
      'Namesto kartic s prednastavitvami pokaže vse kodeke, bitne hitrosti in preoblikovanja.';

  @override
  String get presetCompressVideoTitle => 'Stisni video';

  @override
  String get presetCompressVideoBody =>
      'Precej manjši MP4, kakovost ostane dobra';

  @override
  String get presetFitToSizeTitle => 'Prilagodi velikosti';

  @override
  String get presetFitToSizeBody =>
      'Zadeni točno omejitev — Discord, e-pošta, klepeti';

  @override
  String get presetCompatibleMp4Title => 'Združljiv MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Predvaja se povsod';

  @override
  String get presetExtractAudioTitle => 'Izloči zvok';

  @override
  String get presetExtractAudioBody => 'MP3 iz katerega koli videa';

  @override
  String get presetVideoToGifTitle => 'Video v GIF';

  @override
  String get presetVideoToGifBody => 'Kratek posnetek v animiran GIF';

  @override
  String get presetMergeTitle => 'Združi videe';

  @override
  String get presetMergeBody => 'Posnetke po vrsti zlepi v en MP4';

  @override
  String get mergeNeedsTwo => 'Za združevanje izberite vsaj dva videa.';

  @override
  String mergedVideoName(int count) {
    return 'Združen video ($count posnetkov).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Stisni fotografijo';

  @override
  String get presetCompressImageBody => 'Manjši JPEG, izguba je komaj vidna';

  @override
  String get presetEnhancePhotoTitle => 'Izboljšaj fotografijo';

  @override
  String get presetEnhancePhotoBody => 'Čistejša, ostrejša, boljše barve';

  @override
  String get presetImageToWebpTitle => 'Fotografija v WebP';

  @override
  String get presetImageToWebpBody => 'Sodoben zapis, manjši od JPEG';

  @override
  String get sizeTargetTitle => 'Ciljna velikost';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Po meri…';

  @override
  String get sizeTargetDialogTitle => 'Ciljna velikost v MB';

  @override
  String get sizeTargetTooSmall =>
      'Cilj je za to trajanje premajhen; uporabljena bo najbližja mogoča kakovost.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size na datoteko';
  }

  @override
  String estimateTotal(String size) {
    return 'Ocenjen izhod: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbranih $count datotek',
      few: 'Izbrane $count datoteke',
      two: 'Izbrani $count datoteki',
      one: 'Izbrana $count datoteka',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => 'Pretvorba 100 % brez povezave';

  @override
  String get promiseBatchFree => 'Paketna pretvorba je brezplačna';

  @override
  String get promiseNoWatermark => 'Brez vodnega žiga';

  @override
  String get sectionTransform => 'Preoblikovanje';

  @override
  String get rotateLabel => 'Zasuk';

  @override
  String get flipLabel => 'Vodoravno zrcaljenje';

  @override
  String get speedLabel => 'Hitrost';

  @override
  String get cropLabel => 'Obrez';

  @override
  String get cropHint =>
      'Obrez na sredini v izbrano razmerje stranic — kvadrat za objave, 9:16 za zgodbe.';

  @override
  String volumeLabel(int percent) {
    return 'Glasnost: $percent %';
  }

  @override
  String get addAudioFiles => 'Zvok in druge datoteke';

  @override
  String get hwEncoderLabel => 'Strojno kodiranje';

  @override
  String get hwEncoderHint =>
      'V načinu bitne hitrosti in v načinu prilagajanja velikosti uporabi videočip naprave — precej hitreje in hladneje. Način stalne kakovosti (CRF) vedno uporabi natančen programski kodirnik, neuspelo strojno opravilo pa se samodejno ponovi programsko.';

  @override
  String get transformNeedsReencode =>
      'Zasuk, zrcaljenje in hitrost zahtevajo ponovno kodiranje, zato so med kopiranjem toka izklopljeni.';

  @override
  String get capBitrateLabel => 'Datoteke nikoli ne povečaj';

  @override
  String get capBitrateHint =>
      'Kodiranje omeji na bitno hitrost izvirnika. Stalna kakovost svoje zgornje meje nima, zato lahko že stisnjen video sicer nastane večji.';

  @override
  String get keepSubtitles => 'Ohrani podnapise';

  @override
  String get keepSubtitlesHint =>
      'Sledi podnapisov prenese v izhod. Samo besedilni podnapisi.';

  @override
  String get sectionTrim => 'Skrajšanje';

  @override
  String get trimEnable => 'Skrajšaj izvirnik';

  @override
  String get trimHint =>
      'Na voljo, ko je v vrsti natanko ena datoteka z znanim trajanjem.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Ciljna velikost';

  @override
  String get lowBatteryTitle => 'Baterija je skoraj prazna';

  @override
  String get lowBatteryBody =>
      'Pretvarjanje močno obremeni procesor. Napravo lahko najprej priklopite ali pa vseeno nadaljujete.';

  @override
  String get lowBatteryContinue => 'Vseeno pretvori';

  @override
  String get commonCancel => 'Prekliči';

  @override
  String get commonOk => 'V redu';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prejetih $count datotek',
      few: 'Prejete $count datoteke',
      two: 'Prejeti $count datoteki',
      one: 'Prejeta $count datoteka',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Shrani';

  @override
  String get savedToGallery => 'Shranjeno v galerijo, album »Eluna Media«.';

  @override
  String get savedToDownloads => 'Shranjeno med prenose.';

  @override
  String get saveFailed => 'Datoteke ni bilo mogoče shraniti.';

  @override
  String get jobRemovedUndo => 'Opravilo je odstranjeno.';

  @override
  String get finishedClearedUndo => 'Končana opravila so počiščena.';

  @override
  String get undo => 'Razveljavi';

  @override
  String get errorDetailsTitle => 'Podrobnosti napake';

  @override
  String get sectionConversionPrefs => 'Pretvorba';

  @override
  String get powerModeLabel => 'Način moči';

  @override
  String get powerEfficiency => 'Hladno in hitro';

  @override
  String get powerBalanced => 'Uravnoteženo';

  @override
  String get powerQuality => 'Največje stiskanje';

  @override
  String get powerModeHint =>
      'Kako močno dela videokodirnik. Hladneje in hitreje pomeni nekoliko večje datoteke. Nič drugega ni nikoli omejeno.';

  @override
  String get hapticsLabel => 'Odziv z vibriranjem';

  @override
  String get networkPrivacyTitle => 'Omrežje in zasebnost';

  @override
  String get netAuditIntro =>
      'Popoln seznam vsega v tej aplikaciji, kar se lahko dotakne omrežja.';

  @override
  String get netAuditNoneTitle => 'Nobenega dostopa do omrežja';

  @override
  String get netAuditNoneBody =>
      'Aplikacija ne zahteva dovoljenja za internet, zato omrežja ne more doseči, tudi če bi ga poskusila — to lahko preverite v sistemskih podatkih o aplikaciji. Brez oglasov, brez analitike, brez preverjanja posodobitev. »Oceni aplikacijo« delo preda aplikaciji trgovine, ki se pogovarja sama zase.';

  @override
  String get netAuditConversionTitle => 'Pretvorba';

  @override
  String get netAuditConversionBody =>
      'Poteka v celoti na tej napravi prek priloženega FFmpeg. Vklopite način za letalo in pretvorite — deluje.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrija';

  @override
  String get netAuditTelemetryBody =>
      'Je ni. Aplikacija ne zbira analitike, poročil o sesutjih ne identifikatorjev in nima sistema računov.';

  @override
  String get netAuditTipsTitle => 'Napitnine';

  @override
  String get netAuditTipsBody =>
      'Napitnino izvede aplikacija Play Store, ne ta — ta še vedno nima dovoljenja za internet. Zaračunavanje res doda na seznam dovoljenj dve vrstici: »nakupi v aplikaciji« in »ogled omrežnih povezav«, ki samo prebere, ali povezava obstaja, uporabiti pa je ne more. Nič se ne kupi samodejno, napitnina pa ne odklene ničesar: vse tukaj je brezplačno.';

  @override
  String get sectionSupport => 'Podpora';

  @override
  String get rateApp => 'Oceni aplikacijo';

  @override
  String get openLicenses => 'Licence odprte kode';

  @override
  String get presetAudioToMp3Title => 'Pretvori zvok';

  @override
  String get presetAudioToMp3Body => 'V MP3 — predvaja se povsod';

  @override
  String get presetCompressAudioTitle => 'Stisni zvok';

  @override
  String get presetCompressAudioBody =>
      'Vitkejši AAC — glasovna sporočila, podkasti';

  @override
  String get convertTo => 'Pretvori v';

  @override
  String get formatSectionHint =>
      'Navedeni so samo zapisi, v katere je vaše datoteke res mogoče pretvoriti.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Fotografija';

  @override
  String get sourceAudio => 'Zvok';

  @override
  String get sourceUnknown => 'Datoteka';

  @override
  String get mixedSelectionTitle => 'Izbrane so različne vrste datotek';

  @override
  String get mixedSelectionBody =>
      'Vsaka datoteka se pretvori z najboljšo prednastavitvijo za svojo vrsto. Za popoln nadzor dodajajte po eno vrsto naenkrat.';

  @override
  String get filesTitle => 'Datoteke';

  @override
  String get removeFile => 'Odstrani';

  @override
  String timeLeft(String time) {
    return '≈ $time do konca';
  }

  @override
  String get jobSettingsTitle => 'Nastavitve pretvorbe';

  @override
  String get jobDetails => 'Podrobnosti';

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
  String get summaryEnhanced => 'Izboljšano';

  @override
  String get summaryMetadataStripped => 'Metapodatki odstranjeni';

  @override
  String summaryMerge(int count) {
    return 'Združenih posnetkov: $count';
  }

  @override
  String get shareApp => 'Deli aplikacijo';

  @override
  String get shareAppText =>
      'Eluna Media — brezplačen pretvornik fotografij, videa in zvoka, ki deluje povsem brez povezave. Brez naročnin, brez vodnih žigov, brez računov.';

  @override
  String appVersionLabel(String version) {
    return 'Različica $version';
  }

  @override
  String get openFile => 'Odpri';

  @override
  String get openFolder => 'Pokaži mapo';

  @override
  String get noAppToOpen =>
      'Te datoteke ne more odpreti nobena aplikacija na tej napravi.';

  @override
  String get openFailed => 'Datoteke ni bilo mogoče odpreti.';

  @override
  String get twoPassLabel => 'Dvoprehodno za natančno velikost';

  @override
  String get twoPassHint =>
      'Opravila s prilagajanjem velikosti se kodirajo dvakrat in v bajtni proračun zadenejo opazno natančneje — za približno dvakratni čas in porabo baterije.';

  @override
  String get whatsNewTitle => 'Kaj je novega';

  @override
  String get whatsNew1 =>
      'Video je zdaj lahko AV1: občutno manjše datoteke, če jih zmorete počakati.';

  @override
  String get whatsNew2 =>
      'Novo za slike: AVIF, približno pol JPEG, in animiran WebP namesto GIF.';

  @override
  String get whatsNew3 => 'M4A je lahko brez izgub — ALAC zdaj stoji ob AAC.';

  @override
  String get whatsNew4 =>
      'En zaslon za videz: svetlost, poudarna barva, čisto črna za OLED in Material You.';

  @override
  String get whatsNew5 =>
      'Dosežki imajo medalje, tri zavihke in napredek, ki ga lahko delite kot sliko.';

  @override
  String get achievementsTitle => 'Dosežki';

  @override
  String achievementsProgress(int done, int total) {
    return '$done od $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Šteje se samo na tej napravi. Nič se nikamor ne naloži.';

  @override
  String get achFirstConversionTitle => 'Prvi koraki';

  @override
  String get achFirstConversionBody => 'Pretvorite svojo prvo datoteko.';

  @override
  String get achTenConversionsTitle => 'Ogreti ste se';

  @override
  String get achTenConversionsBody => 'Pretvorite 10 datotek.';

  @override
  String get achFiftyConversionsTitle => 'Redni gost';

  @override
  String get achFiftyConversionsBody => 'Pretvorite 50 datotek.';

  @override
  String get achTwoHundredConversionsTitle => 'Delovni konj';

  @override
  String get achTwoHundredConversionsBody => 'Pretvorite 200 datotek.';

  @override
  String get achThousandConversionsTitle => 'Tekoči trak';

  @override
  String get achThousandConversionsBody => 'Pretvorite 1000 datotek.';

  @override
  String get achSaved100MbTitle => 'Varčevalec prostora';

  @override
  String get achSaved100MbBody => 'Skupno sprostite 100 MB.';

  @override
  String get achSaved1GbTitle => 'Lovec na gigabajte';

  @override
  String get achSaved1GbBody => 'Skupno sprostite 1 GB.';

  @override
  String get achSaved10GbTitle => 'Junak shrambe';

  @override
  String get achSaved10GbBody => 'Skupno sprostite 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Paketni delavec';

  @override
  String get achBatchOfFiveBody => 'Dokončajte paket s 5 datotekami ali več.';

  @override
  String get achBatchOfTwentyTitle => 'Proizvodna linija';

  @override
  String get achBatchOfTwentyBody =>
      'Dokončajte paket z 20 datotekami ali več.';

  @override
  String get achSniperTitle => 'Ostrostrelec';

  @override
  String get achSniperBody =>
      'S prilagajanjem velikosti zadenite točno velikost.';

  @override
  String get achMemeSmithTitle => 'Kovač memov';

  @override
  String get achMemeSmithBody => 'Spremenite video v GIF.';

  @override
  String get achSoundHunterTitle => 'Lovec na zvok';

  @override
  String get achSoundHunterBody => 'Izločite zvok iz videa.';

  @override
  String get achSubtitleKeeperTitle => 'Varuh podnapisov';

  @override
  String get achSubtitleKeeperBody =>
      'Pretvorite video z ohranjenimi podnapisi.';

  @override
  String get achDirectorTitle => 'Režiser';

  @override
  String get achDirectorBody =>
      'Uporabite preoblikovanje — zasuk, obrez, hitrost ali glasnost.';

  @override
  String get achAllRounderTitle => 'Vsestranski';

  @override
  String get achAllRounderBody => 'Pretvorite video, zvok in sliko.';

  @override
  String get achNightOwlTitle => 'Nočna ptica';

  @override
  String get achNightOwlBody =>
      'Dokončajte pretvorbo med polnočjo in peto uro zjutraj.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Prislužite si vse druge dosežke.';

  @override
  String get storageTitle => 'Shramba';

  @override
  String get storageBody =>
      'Pretvorjene datoteke ostanejo znotraj aplikacije, dokler jih ne shranite ali delite; tam jih noben upravitelj datotek ne doseže.';

  @override
  String get storageEmpty => 'Nič ni shranjeno';

  @override
  String storageUsage(String size) {
    return 'Shranjeno: $size';
  }

  @override
  String get storageClearTitle => 'Počistim shranjene datoteke?';

  @override
  String get storageClearBody =>
      'Izbriše vse končane rezultate, ki jih aplikacija še hrani. Datoteke, ki ste jih že shranili ali delili, ostanejo nedotaknjene.';

  @override
  String get storageClearAction => 'Počisti';

  @override
  String storageCleared(String size) {
    return 'Sproščeno: $size';
  }

  @override
  String get autoSaveLabel => 'Samodejno shrani rezultate';

  @override
  String get autoSaveHint =>
      'Vsako končano datoteko takoj, ko je pripravljena, shrani v galerijo — zvok med prenose.';

  @override
  String get lowSpaceTitle => 'Prostora je malo';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Ta paket potrebuje približno $needed, prostega pa je le $free. Pretvorba se lahko ustavi na pol poti.';
  }

  @override
  String saveAll(int count) {
    return 'Shrani vse ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Shranjeno: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Shranjeno $saved od $total';
  }

  @override
  String get presetFitPhotoTitle => 'Fotografijo prilagodi velikosti';

  @override
  String get presetFitPhotoBody =>
      'Stisnite sliko pod točno omejitev — obrazci za nalaganje, vloge.';

  @override
  String get photoFitHint =>
      'Aplikacija preizkuša kakovosti, dokler ena ne ustreza. Če je proračun za sliko premajhen, zmanjša tudi velikost okvirja.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Ciljna velikost v KB';

  @override
  String get compareAction => 'Primerjaj';

  @override
  String get compareBefore => 'Prej';

  @override
  String get compareAfter => 'Potem';

  @override
  String get compareHint => 'Pritisnite in držite, da vidite izvirnik.';

  @override
  String get trimStart => 'Začetek';

  @override
  String get trimEnd => 'Konec';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, do $duration';
  }

  @override
  String get imageScaleLabel => 'Merilo';

  @override
  String get audioChannelsLabel => 'Kanali';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Vzorčna frekvenca';

  @override
  String get voiceAudioHint =>
      'Mono pri 22,05 kHz zmanjša glasovni posnetek približno na četrtino brez slišne izgube. Za glasbo pustite oboje izvirno.';

  @override
  String get moveUp => 'Premakni navzgor';

  @override
  String get moveDown => 'Premakni navzdol';

  @override
  String get renameOutput => 'Preimenuj rezultat';

  @override
  String get renameOutputHint => 'Novo ime';

  @override
  String get renameOutputHelp =>
      'Končnica pride iz izhodnega zapisa. Pustite prazno, da se rezultat imenuje po izvirniku.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Izbriši izvirnike ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Po pretvorbi izbriši izvirnike';

  @override
  String get deleteOriginalsHint =>
      'Sistem zaprosi, naj izvorne datoteke odstrani, ko je rezultat shranjen. Sistem vedno pokaže, kaj bo izbrisano, in počaka na vašo potrditev.';

  @override
  String originalsDeleted(String size) {
    return 'Izvirniki izbrisani — sproščeno $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Nič ni bilo izbrisano. Najti je mogoče le datoteke, ki jih galerija še hrani pod izvirnim imenom.';

  @override
  String reclaimedTotal(String size) {
    return 'S to aplikacijo sproščeno: $size';
  }

  @override
  String get deleteAllData => 'Izbriši vse podatke';

  @override
  String get deleteAllDataHint =>
      'Izbriše vse, kar aplikacija hrani na tej napravi: čakalno vrsto, pretvorjene datoteke, predoglede, dosežke in nastavitve. Datoteke, ki ste jih že shranili v galerijo, ostanejo nedotaknjene.';

  @override
  String get codecCopy => 'Kopiraj';

  @override
  String get codecCopyRemux => 'Kopiraj (remux)';

  @override
  String get codecNoVideo => 'Brez videa';

  @override
  String get codecNoAudio => 'Brez zvoka';

  @override
  String codecLossless(String codec) {
    return '$codec (brez izgub)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animirano)';
  }

  @override
  String get sizeTargetEmail => 'E-pošta';

  @override
  String get trimTimeHint => 'm:ss';
}
