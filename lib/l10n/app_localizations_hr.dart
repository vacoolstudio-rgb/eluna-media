// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class L10nHr extends L10n {
  L10nHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Pretvori';

  @override
  String get tabQueue => 'Red čekanja';

  @override
  String get addFiles => 'Dodaj datoteke';

  @override
  String get emptySelectionTitle => 'Još nema datoteka';

  @override
  String get emptySelectionBody =>
      'Dodajte fotografije, videozapise ili zvučne zapise. Sve se obrađuje na ovom uređaju.';

  @override
  String get sectionOutput => 'Izlaz';

  @override
  String get sectionVideo => 'Videozapis';

  @override
  String get sectionAudio => 'Zvuk';

  @override
  String get sectionImage => 'Slika';

  @override
  String get sectionPrivacy => 'Privatnost';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get rateControl => 'Upravljanje protokom';

  @override
  String get rateControlQuality => 'Stalna kvaliteta (CRF)';

  @override
  String get rateControlBitrate => 'Ciljna brzina prijenosa';

  @override
  String crfLabel(int value) {
    return 'Kvaliteta (CRF $value)';
  }

  @override
  String get crfHint =>
      'Niža vrijednost znači bolju kvalitetu i veću datoteku.';

  @override
  String videoBitrate(int value) {
    return 'Brzina videozapisa: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Brzina zvuka: $value kbps';
  }

  @override
  String get encodingPreset => 'Postavka kodera';

  @override
  String get encodingPresetHint =>
      'Sporije postavke bolje sažimaju, ali više griju uređaj.';

  @override
  String get presetOriginal => 'Izvorno';

  @override
  String get resolution => 'Razlučivost';

  @override
  String get frameRate => 'Broj sličica';

  @override
  String imageQuality(int value) {
    return 'Kvaliteta: $value';
  }

  @override
  String get lossless => 'Bez gubitaka';

  @override
  String get losslessHint => 'Veće datoteke, izlaz vjeran svakom pikselu.';

  @override
  String get sectionEnhance => 'Poboljšanje';

  @override
  String get sharpenLabel => 'Oštrina';

  @override
  String get sharpenHint =>
      'Čini rubove izraženijima. Ne može spasiti mutnu ili neizoštrenu snimku — tog detalja nema u datoteci.';

  @override
  String get sharpenStrongHint =>
      'Jako izoštravanje može ostaviti svijetle aureole uz rubove. Najprije isprobajte srednju razinu.';

  @override
  String get denoiseLabel => 'Smanjenje šuma';

  @override
  String get denoiseHint =>
      'Čisti zrnatost na tamnim i noćnim fotografijama. Previše zagladi fine detalje.';

  @override
  String get autoColorLabel => 'Automatska boja i razine';

  @override
  String get autoColorHint => 'Razvlači kontrast i malo podiže ravne boje.';

  @override
  String get upscaleLabel => 'Povećanje 2×';

  @override
  String get upscaleHint =>
      'Udvostručuje širinu i visinu. Ne dodaje detalje — pomaže pri ispisu ili izrezivanju.';

  @override
  String get upscaleConflictHint =>
      'Vratite Razlučivost na Izvorno da biste povećali sliku.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Isključeno';

  @override
  String get enhanceLight => 'Blago';

  @override
  String get enhanceMedium => 'Srednje';

  @override
  String get enhanceStrong => 'Jako';

  @override
  String get stripMetadata => 'Ukloni metapodatke';

  @override
  String get stripMetadataHint =>
      'Uklanja EXIF, GPS i vremenske oznake iz izlazne datoteke.';

  @override
  String startConversion(int count) {
    return 'Pretvori $count datoteka';
  }

  @override
  String get batchResumed => 'Nastavljena je prekinuta pretvorba.';

  @override
  String get converting => 'Pretvaranje…';

  @override
  String get cancelBatch => 'Zaustavi';

  @override
  String get cancelJob => 'Odustani';

  @override
  String get clearFinished => 'Očisti dovršeno';

  @override
  String get removeJob => 'Ukloni';

  @override
  String get shareFile => 'Podijeli';

  @override
  String get retryJob => 'Pokušaj ponovno';

  @override
  String get queueEmptyTitle => 'Red čekanja je prazan';

  @override
  String get queueEmptyBody =>
      'Datoteke koje dodate na kartici Pretvori pojavljuju se ovdje.';

  @override
  String queueActiveTab(int count) {
    return 'Aktivno · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Dovršeno · $count';
  }

  @override
  String get queueNoActiveTitle => 'Ništa nije u tijeku';

  @override
  String get queueNoActiveBody =>
      'Ovdje se prikazuju datoteke koje čekaju ili se pretvaraju.';

  @override
  String get queueNoFinishedTitle => 'Još ništa nije dovršeno';

  @override
  String get queueNoFinishedBody =>
      'Pretvorene datoteke stižu ovdje, spremne za otvaranje, spremanje ili dijeljenje.';

  @override
  String get statusQueued => 'U redu čekanja';

  @override
  String get statusRunning => 'Pretvaranje';

  @override
  String get statusCompleted => 'Gotovo';

  @override
  String get statusFailed => 'Neuspjelo';

  @override
  String get statusCancelled => 'Otkazano';

  @override
  String batchSummary(int done, int total) {
    return '$done od $total gotovo';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Pretvoreno $done datoteka',
      few: 'Pretvorene $done datoteke',
      one: 'Pretvorena $done datoteka',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Pretvoreno $done, neuspjelo $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% manje';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% veće';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Izgled';

  @override
  String get themeSystem => 'Sustav';

  @override
  String get language => 'Jezik';

  @override
  String get languageSystem => 'Sustav';

  @override
  String get privacyTitle => 'Privatnost';

  @override
  String get privacyBody =>
      'Eluna Media pretvara vaše datoteke u cijelosti na ovom uređaju pomoću ugrađene kopije FFmpeg-a. Vaše datoteke nikada ne napuštaju uređaj, račun nije potreban i nema telemetrije. Ništa u aplikaciji uopće ne koristi mrežu — nema čak ni dopuštenje za pristup internetu.\n\nUklanjanje metapodataka uključeno je prema zadanome, pa se EXIF, GPS koordinate i vremenske oznake izostavljaju iz datoteka koje izvezete.';

  @override
  String get licenseTitle => 'Licenciranje';

  @override
  String get licenseBody =>
      'Ova aplikacija sadrži FFmpeg izgrađen s x264, x265 i drugim GPL komponentama, pa se aplikacija u cjelini distribuira pod licencijom GNU GPL v3.';

  @override
  String get sourceMissing => 'Izvorna datoteka više nije dostupna.';

  @override
  String get tabSettings => 'Postavke';

  @override
  String get introTitle => 'Privatno po dizajnu';

  @override
  String get introOfflineTitle => 'Pretvara na ovom uređaju';

  @override
  String get introOfflineBody =>
      'Sav posao obavlja ugrađena kopija FFmpeg-a. Vaše datoteke nikada ne napuštaju telefon — pretvorba radi i u zrakoplovnom načinu rada.';

  @override
  String get introTelemetryTitle => 'Nula telemetrije';

  @override
  String get introTelemetryBody =>
      'Bez računa, bez analitike, bez izvještaja o rušenjima. Aplikacija ne zna tko ste.';

  @override
  String get introMetadataTitle => 'Metapodaci pod nadzorom';

  @override
  String get introMetadataBody =>
      'EXIF, GPS i vremenske oznake prema zadanome se uklanjaju iz svake izlazne datoteke. To možete isključiti.';

  @override
  String get introFreeNote =>
      'Besplatno, bez oglasa i bez pretplata. Svaka značajka, uključujući skupnu pretvorbu, vaša je od početka — jedino što se može kupiti jest napojnica, a ona ne otključava ništa.';

  @override
  String get introContinue => 'Započnite';

  @override
  String get modeSimple => 'Jednostavno';

  @override
  String get modeAdvanced => 'Napredno';

  @override
  String get modeAdvancedHint =>
      'Prikazuje svaki kodek, brzinu prijenosa i kontrolu preoblikovanja umjesto kartica s postavkama.';

  @override
  String get presetCompressVideoTitle => 'Sažmi videozapis';

  @override
  String get presetCompressVideoBody =>
      'Znatno manji MP4, kvaliteta ostaje dobra';

  @override
  String get presetFitToSizeTitle => 'Prilagodi veličini';

  @override
  String get presetFitToSizeBody =>
      'Pogodite točnu granicu — Discord, e-pošta, chat';

  @override
  String get presetCompatibleMp4Title => 'Kompatibilan MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Radi svugdje';

  @override
  String get presetExtractAudioTitle => 'Izdvoji zvuk';

  @override
  String get presetExtractAudioBody => 'MP3 iz bilo kojeg videozapisa';

  @override
  String get presetVideoToGifTitle => 'Videozapis u GIF';

  @override
  String get presetVideoToGifBody => 'Kratka snimka u animirani GIF';

  @override
  String get presetMergeTitle => 'Spoji videozapise';

  @override
  String get presetMergeBody => 'Spaja snimke u jedan MP4, redom';

  @override
  String get mergeNeedsTwo => 'Za spajanje odaberite najmanje dva videozapisa.';

  @override
  String mergedVideoName(int count) {
    return 'Spojeni videozapis ($count snimaka).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Sažmi fotografiju';

  @override
  String get presetCompressImageBody => 'Manji JPEG, gubitak je jedva vidljiv';

  @override
  String get presetEnhancePhotoTitle => 'Poboljšaj fotografiju';

  @override
  String get presetEnhancePhotoBody => 'Čišće, oštrije, bolja boja';

  @override
  String get presetImageToWebpTitle => 'Fotografija u WebP';

  @override
  String get presetImageToWebpBody => 'Moderan format, manji od JPEG-a';

  @override
  String get sizeTargetTitle => 'Ciljna veličina';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Prilagođeno…';

  @override
  String get sizeTargetDialogTitle => 'Ciljna veličina u MB';

  @override
  String get sizeTargetTooSmall =>
      'Cilj je premalen za ovo trajanje; upotrijebit će se najbliža moguća kvaliteta.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size po datoteci';
  }

  @override
  String estimateTotal(String size) {
    return 'Procijenjeni izlaz: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odabrano $count datoteka',
      few: 'Odabrane $count datoteke',
      one: 'Odabrana $count datoteka',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% izvanmrežna pretvorba';

  @override
  String get promiseBatchFree => 'Skupna pretvorba je besplatna';

  @override
  String get promiseNoWatermark => 'Bez vodenog žiga';

  @override
  String get sectionTransform => 'Preoblikovanje';

  @override
  String get rotateLabel => 'Zakreni';

  @override
  String get flipLabel => 'Zrcali vodoravno';

  @override
  String get speedLabel => 'Brzina';

  @override
  String get cropLabel => 'Izreži';

  @override
  String get cropHint =>
      'Središnje izrezivanje na odabrani omjer stranica — kvadrat za objave, 9:16 za priče.';

  @override
  String volumeLabel(int percent) {
    return 'Glasnoća: $percent%';
  }

  @override
  String get addAudioFiles => 'Zvučne i ostale datoteke';

  @override
  String get hwEncoderLabel => 'Hardversko kodiranje';

  @override
  String get hwEncoderHint =>
      'Koristi videočip uređaja u načinima brzine prijenosa i prilagodbe veličini — mnogo brže i hladnije. Način stalne kvalitete (CRF) uvijek koristi precizni programski koder, a neuspjeli hardverski zadatak automatski se ponavlja programski.';

  @override
  String get transformNeedsReencode =>
      'Zakretanje, zrcaljenje i brzina zahtijevaju ponovno kodiranje, pa su isključeni tijekom izravnog kopiranja toka.';

  @override
  String get capBitrateLabel => 'Nikada ne povećavaj datoteku';

  @override
  String get capBitrateHint =>
      'Ograničava kodiranje na brzinu prijenosa samog izvora. Stalna kvaliteta nema vlastitu gornju granicu, pa već sažeti videozapis inače može ispasti veći.';

  @override
  String get keepSubtitles => 'Zadrži podnaslove';

  @override
  String get keepSubtitlesHint =>
      'Prenosi zapise s podnaslovima u izlaznu datoteku. Samo tekstualni podnaslovi.';

  @override
  String get sectionTrim => 'Skraćivanje';

  @override
  String get trimEnable => 'Skrati izvor';

  @override
  String get trimHint =>
      'Dostupno kada je u redu čekanja točno jedna datoteka poznatog trajanja.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Ciljna veličina';

  @override
  String get lowBatteryTitle => 'Baterija je slaba';

  @override
  String get lowBatteryBody =>
      'Pretvorba jako opterećuje procesor. Možete najprije priključiti punjač ili ipak nastaviti.';

  @override
  String get lowBatteryContinue => 'Ipak pretvori';

  @override
  String get commonCancel => 'Odustani';

  @override
  String get commonOk => 'U redu';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Primljeno $count datoteka',
      few: 'Primljene $count datoteke',
      one: 'Primljena $count datoteka',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Spremi';

  @override
  String get savedToGallery => 'Spremljeno u galeriju, album „Eluna Media”.';

  @override
  String get savedToDownloads => 'Spremljeno u Preuzimanja.';

  @override
  String get saveFailed => 'Datoteku nije bilo moguće spremiti.';

  @override
  String get jobRemovedUndo => 'Zadatak je uklonjen.';

  @override
  String get finishedClearedUndo => 'Dovršeni zadaci su očišćeni.';

  @override
  String get undo => 'Poništi';

  @override
  String get errorDetailsTitle => 'Pojedinosti o pogrešci';

  @override
  String get sectionConversionPrefs => 'Pretvorba';

  @override
  String get powerModeLabel => 'Način rada';

  @override
  String get powerEfficiency => 'Hladno i brzo';

  @override
  String get powerBalanced => 'Uravnoteženo';

  @override
  String get powerQuality => 'Najveće sažimanje';

  @override
  String get powerModeHint =>
      'Koliko snažno radi videokoder. Hladnije i brže znači nešto veće datoteke. Ništa se drugo ne usporava — nikada.';

  @override
  String get hapticsLabel => 'Vibracijska povratna informacija';

  @override
  String get networkPrivacyTitle => 'Mreža i privatnost';

  @override
  String get netAuditIntro =>
      'Potpun popis svega u ovoj aplikaciji što može dotaknuti mrežu.';

  @override
  String get netAuditNoneTitle => 'Nikakvog pristupa mreži';

  @override
  String get netAuditNoneBody =>
      'Aplikacija ne traži dopuštenje za internet, pa ne može doprijeti do mreže ni kada bi pokušala — to možete provjeriti u podacima o aplikaciji u sustavu. Bez oglasa, bez analitike, bez provjera ažuriranja. „Ocijenite aplikaciju” predaje posao aplikaciji trgovine, koja sama obavlja svu komunikaciju.';

  @override
  String get netAuditConversionTitle => 'Pretvorba';

  @override
  String get netAuditConversionBody =>
      'Odvija se u cijelosti na ovom uređaju kroz ugrađeni FFmpeg. Uključite zrakoplovni način rada i pretvorite — radi.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrija';

  @override
  String get netAuditTelemetryBody =>
      'Nema je. Aplikacija ne prikuplja analitiku, izvještaje o rušenjima ni identifikatore i nema sustav računa.';

  @override
  String get netAuditTipsTitle => 'Napojnice';

  @override
  String get netAuditTipsBody =>
      'Napojnicu provodi aplikacija Play Store, a ne ova — koja i dalje nema dopuštenje za internet. Naplata ipak dodaje dva retka na popis dopuštenja: „kupnja unutar aplikacije” i „pregled mrežnih veza”, koje samo očitava postoji li veza i ne može je koristiti. Ništa se nikada ne kupuje automatski, a napojnica ne otključava ništa: svaka je značajka ovdje besplatna.';

  @override
  String get sectionSupport => 'Podrška';

  @override
  String get rateApp => 'Ocijenite aplikaciju';

  @override
  String get openLicenses => 'Licencije otvorenog koda';

  @override
  String get presetAudioToMp3Title => 'Pretvori zvuk';

  @override
  String get presetAudioToMp3Body => 'U MP3 — svira na svemu';

  @override
  String get presetCompressAudioTitle => 'Sažmi zvuk';

  @override
  String get presetCompressAudioBody => 'Lakši AAC — glasovne poruke, podcasti';

  @override
  String get convertTo => 'Pretvori u';

  @override
  String get formatSectionHint =>
      'Navedeni su samo formati u koje vaše datoteke doista mogu prijeći.';

  @override
  String get sourceVideo => 'Videozapis';

  @override
  String get sourceImage => 'Fotografija';

  @override
  String get sourceAudio => 'Zvuk';

  @override
  String get sourceUnknown => 'Datoteka';

  @override
  String get mixedSelectionTitle => 'Odabrane su različite vrste datoteka';

  @override
  String get mixedSelectionBody =>
      'Svaka se datoteka pretvara postavkom koja najbolje odgovara njezinoj vrsti. Dodajte jednu vrstu odjednom za potpun nadzor.';

  @override
  String get filesTitle => 'Datoteke';

  @override
  String get removeFile => 'Ukloni';

  @override
  String timeLeft(String time) {
    return 'još ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Postavke pretvorbe';

  @override
  String get jobDetails => 'Pojedinosti';

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
  String get summaryEnhanced => 'Poboljšano';

  @override
  String get summaryMetadataStripped => 'Metapodaci uklonjeni';

  @override
  String summaryMerge(int count) {
    return 'Spojeno $count snimaka';
  }

  @override
  String get shareApp => 'Podijelite aplikaciju';

  @override
  String get shareAppText =>
      'Eluna Media — besplatan pretvarač fotografija, videozapisa i zvuka koji radi potpuno izvan mreže. Bez pretplata, bez vodenih žigova, bez računa.';

  @override
  String appVersionLabel(String version) {
    return 'Verzija $version';
  }

  @override
  String get openFile => 'Otvori';

  @override
  String get openFolder => 'Prikaži mapu';

  @override
  String get noAppToOpen =>
      'Nijedna aplikacija na ovom uređaju ne može otvoriti tu datoteku.';

  @override
  String get openFailed => 'Datoteku nije bilo moguće otvoriti.';

  @override
  String get twoPassLabel => 'Dva prolaza za točnu veličinu';

  @override
  String get twoPassHint =>
      'Zadaci prilagodbe veličini kodiraju se dvaput i osjetno preciznije pogađaju zadani broj bajtova — uz otprilike dvostruko vrijeme i potrošnju baterije.';

  @override
  String get whatsNewTitle => 'Novosti';

  @override
  String get whatsNew1 =>
      'Videozapis sada može biti AV1: osjetno manje datoteke, ako ih možete pričekati.';

  @override
  String get whatsNew2 =>
      'Novo za slike: AVIF, otprilike upola manji od JPEG-a, i animirani WebP umjesto GIF-a.';

  @override
  String get whatsNew3 =>
      'M4A može biti bez gubitaka — ALAC sada stoji uz AAC.';

  @override
  String get whatsNew4 =>
      'Jedan zaslon za izgled: svjetlina, naglasna boja, čisto crna za OLED i Material You.';

  @override
  String get whatsNew5 =>
      'Postignuća imaju medalje, tri kartice i napredak koji možete podijeliti kao sliku.';

  @override
  String get achievementsTitle => 'Postignuća';

  @override
  String achievementsProgress(int done, int total) {
    return '$done od $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Broji se samo na ovom uređaju. Ništa se nikamo ne šalje.';

  @override
  String get achFirstConversionTitle => 'Prvi koraci';

  @override
  String get achFirstConversionBody => 'Pretvorite svoju prvu datoteku.';

  @override
  String get achTenConversionsTitle => 'Zagrijano';

  @override
  String get achTenConversionsBody => 'Pretvorite 10 datoteka.';

  @override
  String get achFiftyConversionsTitle => 'Stalni korisnik';

  @override
  String get achFiftyConversionsBody => 'Pretvorite 50 datoteka.';

  @override
  String get achTwoHundredConversionsTitle => 'Radni konj';

  @override
  String get achTwoHundredConversionsBody => 'Pretvorite 200 datoteka.';

  @override
  String get achThousandConversionsTitle => 'Pokretna traka';

  @override
  String get achThousandConversionsBody => 'Pretvorite 1000 datoteka.';

  @override
  String get achSaved100MbTitle => 'Čuvar prostora';

  @override
  String get achSaved100MbBody => 'Oslobodite ukupno 100 MB.';

  @override
  String get achSaved1GbTitle => 'Lovac na gigabajte';

  @override
  String get achSaved1GbBody => 'Oslobodite ukupno 1 GB.';

  @override
  String get achSaved10GbTitle => 'Junak pohrane';

  @override
  String get achSaved10GbBody => 'Oslobodite ukupno 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Skupni radnik';

  @override
  String get achBatchOfFiveBody => 'Dovršite skup od 5 ili više datoteka.';

  @override
  String get achBatchOfTwentyTitle => 'Proizvodna linija';

  @override
  String get achBatchOfTwentyBody => 'Dovršite skup od 20 ili više datoteka.';

  @override
  String get achSniperTitle => 'Snajperist';

  @override
  String get achSniperBody => 'Pogodite točnu veličinu prilagodbom veličini.';

  @override
  String get achMemeSmithTitle => 'Kovač memeova';

  @override
  String get achMemeSmithBody => 'Pretvorite videozapis u GIF.';

  @override
  String get achSoundHunterTitle => 'Lovac na zvuk';

  @override
  String get achSoundHunterBody => 'Izdvojite zvuk iz videozapisa.';

  @override
  String get achSubtitleKeeperTitle => 'Čuvar podnaslova';

  @override
  String get achSubtitleKeeperBody =>
      'Pretvorite videozapis uz zadržane podnaslove.';

  @override
  String get achDirectorTitle => 'Redatelj';

  @override
  String get achDirectorBody =>
      'Primijenite preoblikovanje — zakretanje, izrezivanje, brzinu ili glasnoću.';

  @override
  String get achAllRounderTitle => 'Svestran';

  @override
  String get achAllRounderBody => 'Pretvorite videozapis, zvuk i sliku.';

  @override
  String get achNightOwlTitle => 'Noćna ptica';

  @override
  String get achNightOwlBody => 'Dovršite pretvorbu između ponoći i 5 ujutro.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Osvojite sva ostala postignuća.';

  @override
  String get storageTitle => 'Pohrana';

  @override
  String get storageBody =>
      'Pretvorene datoteke ostaju unutar aplikacije dok ih ne spremite ili podijelite, ondje gdje im nijedan upravitelj datoteka ne može pristupiti.';

  @override
  String get storageEmpty => 'Ništa nije pohranjeno';

  @override
  String storageUsage(String size) {
    return 'Pohranjeno: $size';
  }

  @override
  String get storageClearTitle => 'Očistiti pohranjene datoteke?';

  @override
  String get storageClearBody =>
      'Briše svaki dovršeni rezultat koji aplikacija još drži. Datoteke koje ste već spremili ili podijelili ostaju netaknute.';

  @override
  String get storageClearAction => 'Očisti';

  @override
  String storageCleared(String size) {
    return 'Oslobođeno $size';
  }

  @override
  String get autoSaveLabel => 'Automatski spremaj rezultate';

  @override
  String get autoSaveHint =>
      'Svaku dovršenu datoteku stavlja u galeriju — zvuk u Preuzimanja — čim bude spremna.';

  @override
  String get lowSpaceTitle => 'Nije ostalo puno mjesta';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Ovaj skup treba oko $needed, a slobodno je samo $free. Pretvorba se može zaustaviti na pola.';
  }

  @override
  String saveAll(int count) {
    return 'Spremi sve ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Spremljeno: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Spremljeno $saved od $total';
  }

  @override
  String get presetFitPhotoTitle => 'Prilagodi fotografiju veličini';

  @override
  String get presetFitPhotoBody =>
      'Stisnite sliku ispod točne granice — obrasci za prijenos, prijave.';

  @override
  String get photoFitHint =>
      'Aplikacija isprobava kvalitete dok jedna ne stane. Ako je proračun premalen za sliku, smanjuje i veličinu okvira.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Ciljna veličina u KB';

  @override
  String get compareAction => 'Usporedi';

  @override
  String get compareBefore => 'Prije';

  @override
  String get compareAfter => 'Poslije';

  @override
  String get compareHint => 'Pritisnite i držite da vidite izvornik.';

  @override
  String get trimStart => 'Početak';

  @override
  String get trimEnd => 'Kraj';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, do $duration';
  }

  @override
  String get imageScaleLabel => 'Mjerilo';

  @override
  String get audioChannelsLabel => 'Kanali';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Frekvencija uzorkovanja';

  @override
  String get voiceAudioHint =>
      'Mono na 22,05 kHz otprilike učetverostruko smanjuje glasovnu snimku bez čujnog gubitka. Za glazbu oboje ostavite izvorno.';

  @override
  String get moveUp => 'Pomakni gore';

  @override
  String get moveDown => 'Pomakni dolje';

  @override
  String get renameOutput => 'Preimenuj rezultat';

  @override
  String get renameOutputHint => 'Novi naziv';

  @override
  String get renameOutputHelp =>
      'Nastavak dolazi iz izlaznog formata. Ostavite prazno da rezultat dobije naziv po izvoru.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Izbriši izvornike ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Izbriši izvornike nakon pretvorbe';

  @override
  String get deleteOriginalsHint =>
      'Traži od sustava da ukloni izvorne datoteke nakon što se rezultat spremi. Sustav uvijek prikazuje što će nestati i čeka vašu potvrdu.';

  @override
  String originalsDeleted(String size) {
    return 'Izvornici izbrisani — oslobođeno $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Ništa nije izbrisano. Mogu se pronaći samo datoteke koje galerija još drži pod njihovim izvornim nazivom.';

  @override
  String reclaimedTotal(String size) {
    return 'Oslobođeno ovom aplikacijom: $size';
  }

  @override
  String get deleteAllData => 'Izbriši sve podatke';

  @override
  String get deleteAllDataHint =>
      'Briše sve što aplikacija čuva na ovom uređaju: red čekanja, pretvorene datoteke, preglede, postignuća i postavke. Datoteke koje ste već spremili u galeriju ostaju netaknute.';

  @override
  String get codecCopy => 'Kopiraj';

  @override
  String get codecCopyRemux => 'Kopiraj (remux)';

  @override
  String get codecNoVideo => 'Bez videozapisa';

  @override
  String get codecNoAudio => 'Bez zvuka';

  @override
  String codecLossless(String codec) {
    return '$codec (bez gubitaka)';
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
