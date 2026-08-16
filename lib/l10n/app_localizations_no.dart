// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class L10nNo extends L10n {
  L10nNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konverter';

  @override
  String get tabQueue => 'Kø';

  @override
  String get addFiles => 'Legg til filer';

  @override
  String get emptySelectionTitle => 'Ingen filer ennå';

  @override
  String get emptySelectionBody =>
      'Legg til bilder, videoer eller lyd. Alt behandles på denne enheten.';

  @override
  String get sectionOutput => 'Utdata';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Lyd';

  @override
  String get sectionImage => 'Bilde';

  @override
  String get sectionPrivacy => 'Personvern';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Lydkodek';

  @override
  String get rateControl => 'Bitratestyring';

  @override
  String get rateControlQuality => 'Konstant kvalitet (CRF)';

  @override
  String get rateControlBitrate => 'Målbitrate';

  @override
  String crfLabel(int value) {
    return 'Kvalitet (CRF $value)';
  }

  @override
  String get crfHint => 'Lavere gir bedre kvalitet og en større fil.';

  @override
  String videoBitrate(int value) {
    return 'Videobitrate: $value kbit/s';
  }

  @override
  String audioBitrate(int value) {
    return 'Lydbitrate: $value kbit/s';
  }

  @override
  String get encodingPreset => 'Koderforvalg';

  @override
  String get encodingPresetHint =>
      'Tregere forvalg komprimerer bedre, men varmer enheten mer.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Oppløsning';

  @override
  String get frameRate => 'Bildefrekvens';

  @override
  String imageQuality(int value) {
    return 'Kvalitet: $value';
  }

  @override
  String get lossless => 'Tapsfri';

  @override
  String get losslessHint => 'Større filer, pikselperfekt resultat.';

  @override
  String get sectionEnhance => 'Forbedring';

  @override
  String get sharpenLabel => 'Skarphet';

  @override
  String get sharpenHint =>
      'Gjør kantene tydeligere. Det kan ikke redde et uskarpt bilde — de detaljene finnes ikke i filen.';

  @override
  String get sharpenStrongHint =>
      'Kraftig skarphet kan gi lyse kanter. Prøv middels først.';

  @override
  String get denoiseLabel => 'Støyreduksjon';

  @override
  String get denoiseHint =>
      'Rydder opp i korn på mørke bilder og nattbilder. For mye visker ut fine detaljer.';

  @override
  String get autoColorLabel => 'Automatisk farge og nivåer';

  @override
  String get autoColorHint =>
      'Strekker kontrasten og løfter flate farger litt.';

  @override
  String get upscaleLabel => 'Forstørr 2×';

  @override
  String get upscaleHint =>
      'Dobler bredde og høyde. Det gir ingen nye detaljer — men hjelper ved utskrift eller beskjæring.';

  @override
  String get upscaleConflictHint =>
      'Sett Oppløsning tilbake til Original for å forstørre.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Av';

  @override
  String get enhanceLight => 'Lett';

  @override
  String get enhanceMedium => 'Middels';

  @override
  String get enhanceStrong => 'Kraftig';

  @override
  String get stripMetadata => 'Fjern metadata';

  @override
  String get stripMetadataHint =>
      'Fjerner EXIF, GPS og tidsstempler fra resultatet.';

  @override
  String startConversion(int count) {
    return 'Konverter filer ($count)';
  }

  @override
  String get batchResumed => 'Den avbrutte konverteringen ble gjenopptatt.';

  @override
  String get converting => 'Konverterer…';

  @override
  String get cancelBatch => 'Stopp';

  @override
  String get cancelJob => 'Avbryt';

  @override
  String get clearFinished => 'Tøm ferdige';

  @override
  String get removeJob => 'Fjern';

  @override
  String get shareFile => 'Del';

  @override
  String get retryJob => 'Prøv igjen';

  @override
  String get queueEmptyTitle => 'Køen er tom';

  @override
  String get queueEmptyBody =>
      'Filer du legger til under Konverter, dukker opp her.';

  @override
  String queueActiveTab(int count) {
    return 'Aktive · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Ferdige · $count';
  }

  @override
  String get queueNoActiveTitle => 'Ingenting pågår';

  @override
  String get queueNoActiveBody =>
      'Filer som venter eller konverteres, vises her.';

  @override
  String get queueNoFinishedTitle => 'Ingenting ferdig ennå';

  @override
  String get queueNoFinishedBody =>
      'Konverterte filer havner her, klare til å åpnes, lagres eller deles.';

  @override
  String get statusQueued => 'I kø';

  @override
  String get statusRunning => 'Konverterer';

  @override
  String get statusCompleted => 'Ferdig';

  @override
  String get statusFailed => 'Mislyktes';

  @override
  String get statusCancelled => 'Avbrutt';

  @override
  String batchSummary(int done, int total) {
    return '$done av $total ferdig';
  }

  @override
  String batchCompleted(int done) {
    return 'Konverterte filer: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done konvertert, $failed mislyktes.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% mindre';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% større';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Utseende';

  @override
  String get themeSystem => 'System';

  @override
  String get language => 'Språk';

  @override
  String get languageSystem => 'System';

  @override
  String get privacyTitle => 'Personvern';

  @override
  String get privacyBody =>
      'Eluna Media konverterer filene dine helt på denne enheten med en medfølgende kopi av FFmpeg. Filene dine forlater aldri enheten, ingen konto kreves, og det finnes ingen telemetri. Ingenting i appen bruker nettverket i det hele tatt — den har ikke engang internettillatelsen.\n\nFjerning av metadata er på som standard, så EXIF, GPS-koordinater og tidsstempler fjernes fra filene du eksporterer.';

  @override
  String get licenseTitle => 'Lisenser';

  @override
  String get licenseBody =>
      'Denne appen inneholder FFmpeg bygget med x264, x265 og andre GPL-komponenter, så programmet som helhet distribueres under GNU GPL v3.';

  @override
  String get sourceMissing => 'Kildefilen finnes ikke lenger.';

  @override
  String get tabSettings => 'Innstillinger';

  @override
  String get introTitle => 'Privat fra grunnen av';

  @override
  String get introOfflineTitle => 'Konverterer på denne enheten';

  @override
  String get introOfflineBody =>
      'En medfølgende kopi av FFmpeg gjør hele jobben. Filene dine forlater aldri telefonen — konvertering virker i flymodus.';

  @override
  String get introTelemetryTitle => 'Null telemetri';

  @override
  String get introTelemetryBody =>
      'Ingen konto, ingen analyse, ingen krasjrapportering. Appen vet ikke hvem du er.';

  @override
  String get introMetadataTitle => 'Metadata under kontroll';

  @override
  String get introMetadataBody =>
      'EXIF, GPS og tidsstempler fjernes fra alt som lages, som standard. Du kan slå det av.';

  @override
  String get introFreeNote =>
      'Gratis, uten reklame og uten abonnementer. Alle funksjoner, batchkonvertering inkludert, er dine fra starten — det eneste som kan kjøpes, er en tips, og den låser ikke opp noe.';

  @override
  String get introContinue => 'Kom i gang';

  @override
  String get modeSimple => 'Enkel';

  @override
  String get modeAdvanced => 'Avansert';

  @override
  String get modeAdvancedHint =>
      'Vis alle kodeker, bitrater og transformasjoner i stedet for forvalgskortene.';

  @override
  String get presetCompressVideoTitle => 'Komprimer video';

  @override
  String get presetCompressVideoBody => 'Mye mindre MP4, kvaliteten holder';

  @override
  String get presetFitToSizeTitle => 'Tilpass til størrelse';

  @override
  String get presetFitToSizeBody =>
      'Treff en eksakt grense — Discord, e-post, chatter';

  @override
  String get presetCompatibleMp4Title => 'Kompatibel MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Spilles av overalt';

  @override
  String get presetExtractAudioTitle => 'Hent ut lyd';

  @override
  String get presetExtractAudioBody => 'MP3 fra hvilken som helst video';

  @override
  String get presetVideoToGifTitle => 'Video til GIF';

  @override
  String get presetVideoToGifBody => 'Kort klipp til en animert GIF';

  @override
  String get presetMergeTitle => 'Slå sammen videoer';

  @override
  String get presetMergeBody => 'Skjøt klipp til én MP4, i rekkefølge';

  @override
  String get mergeNeedsTwo => 'Velg minst to videoer for å slå sammen.';

  @override
  String mergedVideoName(int count) {
    return 'Sammenslått video ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Komprimer bilde';

  @override
  String get presetCompressImageBody => 'Mindre JPEG, knapt synlig tap';

  @override
  String get presetEnhancePhotoTitle => 'Forbedre bilde';

  @override
  String get presetEnhancePhotoBody => 'Renere, skarpere, bedre farger';

  @override
  String get presetImageToWebpTitle => 'Bilde til WebP';

  @override
  String get presetImageToWebpBody => 'Moderne format, mindre enn JPEG';

  @override
  String get sizeTargetTitle => 'Målstørrelse';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Egendefinert…';

  @override
  String get sizeTargetDialogTitle => 'Målstørrelse i MB';

  @override
  String get sizeTargetTooSmall =>
      'Målet er for lite for denne lengden; nærmest mulige kvalitet brukes.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per fil';
  }

  @override
  String estimateTotal(String size) {
    return 'Anslått resultat: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Valgte filer: $count';
  }

  @override
  String get promiseOffline => '100 % frakoblet konvertering';

  @override
  String get promiseBatchFree => 'Batch er gratis';

  @override
  String get promiseNoWatermark => 'Ingen vannmerke';

  @override
  String get sectionTransform => 'Transformer';

  @override
  String get rotateLabel => 'Roter';

  @override
  String get flipLabel => 'Speil vannrett';

  @override
  String get speedLabel => 'Hastighet';

  @override
  String get cropLabel => 'Beskjær';

  @override
  String get cropHint =>
      'Beskjær fra midten til valgt bildeforhold — kvadrat for feeder, 9:16 for historier.';

  @override
  String volumeLabel(int percent) {
    return 'Volum: $percent%';
  }

  @override
  String get addAudioFiles => 'Lyd og andre filer';

  @override
  String get hwEncoderLabel => 'Maskinvarekoding';

  @override
  String get hwEncoderHint =>
      'Bruker videobrikken i enheten i bitrate- og tilpass-til-størrelse-modus — mye raskere og kjøligere. Kvalitetsmodus (CRF) bruker alltid den nøyaktige programvarekoderen, og en mislykket maskinvarejobb prøves automatisk på nytt i programvare.';

  @override
  String get transformNeedsReencode =>
      'Rotasjon, speiling og hastighet krever omkoding, og er derfor av under strømkopiering.';

  @override
  String get capBitrateLabel => 'Gjør aldri filen større';

  @override
  String get capBitrateHint =>
      'Begrenser kodingen til kildens egen bitrate. Konstant kvalitet har ikke noe tak selv, så en allerede komprimert video kan ellers bli større.';

  @override
  String get keepSubtitles => 'Behold undertekster';

  @override
  String get keepSubtitlesHint =>
      'Tar undertekstspor med videre til resultatet. Kun tekstbaserte undertekster.';

  @override
  String get sectionTrim => 'Klipp';

  @override
  String get trimEnable => 'Klipp kilden';

  @override
  String get trimHint =>
      'Tilgjengelig når nøyaktig én fil med kjent lengde ligger i køen.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Målstørrelse';

  @override
  String get lowBatteryTitle => 'Lite batteri';

  @override
  String get lowBatteryBody =>
      'Konvertering belaster prosessoren hardt. Du kan koble til lader først, eller fortsette likevel.';

  @override
  String get lowBatteryContinue => 'Konverter likevel';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Mottatte filer: $count';
  }

  @override
  String get saveFile => 'Lagre';

  @override
  String get savedToGallery => 'Lagret i galleriet, albumet «Eluna Media».';

  @override
  String get savedToDownloads => 'Lagret i Nedlastinger.';

  @override
  String get saveFailed => 'Kunne ikke lagre filen.';

  @override
  String get jobRemovedUndo => 'Jobben ble fjernet.';

  @override
  String get finishedClearedUndo => 'Ferdige jobber ble tømt.';

  @override
  String get undo => 'Angre';

  @override
  String get errorDetailsTitle => 'Feildetaljer';

  @override
  String get sectionConversionPrefs => 'Konvertering';

  @override
  String get powerModeLabel => 'Strømmodus';

  @override
  String get powerEfficiency => 'Kjølig og rask';

  @override
  String get powerBalanced => 'Balansert';

  @override
  String get powerQuality => 'Maksimal komprimering';

  @override
  String get powerModeHint =>
      'Hvor hardt videokoderen jobber. Kjøligere og raskere betyr litt større filer. Ingenting annet strupes — noensinne.';

  @override
  String get hapticsLabel => 'Vibrasjonsrespons';

  @override
  String get networkPrivacyTitle => 'Nettverk og personvern';

  @override
  String get netAuditIntro =>
      'En fullstendig liste over alt i denne appen som kan røre nettverket.';

  @override
  String get netAuditNoneTitle => 'Ingen nettverkstilgang i det hele tatt';

  @override
  String get netAuditNoneBody =>
      'Appen ber ikke om internettillatelsen og når derfor ikke nettverket selv om den prøvde — det kan du kontrollere i systemets appinformasjon. Ingen reklame, ingen analyse, ingen oppdateringssjekk. «Vurder appen» overlater det til butikkappen, som selv står for kontakten.';

  @override
  String get netAuditConversionTitle => 'Konvertering';

  @override
  String get netAuditConversionBody =>
      'Kjører helt på denne enheten via et medfølgende FFmpeg. Slå på flymodus og konverter — det virker.';

  @override
  String get netAuditTelemetryTitle => 'Telemetri';

  @override
  String get netAuditTelemetryBody =>
      'Den finnes ikke. Appen samler ingen analysedata, ingen krasjrapporter, ingen identifikatorer, og har ikke noe kontosystem.';

  @override
  String get netAuditTipsTitle => 'Tips';

  @override
  String get netAuditTipsBody =>
      'Et tips utføres av Play Butikk-appen, ikke av denne — som fortsatt ikke har internettillatelse. Betalingen legger imidlertid til to linjer i tillatelseslisten: «kjøp i appen» og «se nettverkstilkoblinger», som bare leser om det finnes en tilkobling og ikke kan bruke den. Ingenting kjøpes automatisk, og et tips låser ikke opp noe: alt her er gratis.';

  @override
  String get sectionSupport => 'Støtte';

  @override
  String get rateApp => 'Vurder appen';

  @override
  String get openLicenses => 'Åpen kildekode-lisenser';

  @override
  String get presetAudioToMp3Title => 'Konverter lyd';

  @override
  String get presetAudioToMp3Body => 'Til MP3 — spilles av på alt';

  @override
  String get presetCompressAudioTitle => 'Komprimer lyd';

  @override
  String get presetCompressAudioBody => 'Slankere AAC — talenotater, podkaster';

  @override
  String get convertTo => 'Konverter til';

  @override
  String get formatSectionHint =>
      'Bare formater filene dine faktisk kan bli, står på listen.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Bilde';

  @override
  String get sourceAudio => 'Lyd';

  @override
  String get sourceUnknown => 'Fil';

  @override
  String get mixedSelectionTitle => 'Ulike filtyper valgt';

  @override
  String get mixedSelectionBody =>
      'Hver fil konverteres med det beste forvalget for sin egen type. Legg til én type om gangen for full kontroll.';

  @override
  String get filesTitle => 'Filer';

  @override
  String get removeFile => 'Fjern';

  @override
  String timeLeft(String time) {
    return '≈ $time igjen';
  }

  @override
  String get jobSettingsTitle => 'Konverteringsinnstillinger';

  @override
  String get jobDetails => 'Detaljer';

  @override
  String summaryQuality(int value) {
    return 'CRF $value';
  }

  @override
  String summaryBitrate(int value) {
    return '$value kbit/s';
  }

  @override
  String summaryTargetSize(String size) {
    return '≤ $size';
  }

  @override
  String get summaryEnhanced => 'Forbedret';

  @override
  String get summaryMetadataStripped => 'Metadata fjernet';

  @override
  String summaryMerge(int count) {
    return 'Sammenslåtte klipp: $count';
  }

  @override
  String get shareApp => 'Del appen';

  @override
  String get shareAppText =>
      'Eluna Media — en gratis, helt frakoblet bilde-, video- og lydkonverterer. Ingen abonnementer, ingen vannmerker, ingen kontoer.';

  @override
  String appVersionLabel(String version) {
    return 'Versjon $version';
  }

  @override
  String get openFile => 'Åpne';

  @override
  String get openFolder => 'Vis mappe';

  @override
  String get noAppToOpen => 'Ingen app på denne enheten kan åpne den filen.';

  @override
  String get openFailed => 'Kunne ikke åpne filen.';

  @override
  String get twoPassLabel => 'To gjennomkjøringer for eksakt størrelse';

  @override
  String get twoPassHint =>
      'Jobber med tilpass til størrelse kodes to ganger og treffer bytebudsjettet merkbart mer nøyaktig — mot omtrent dobbelt så mye tid og batteri.';

  @override
  String get whatsNewTitle => 'Nyheter';

  @override
  String get whatsNew1 =>
      'Video kan nå være AV1: merkbart mindre filer, hvis du kan vente på dem.';

  @override
  String get whatsNew2 =>
      'Nytt for bilder: AVIF, omtrent halvparten av en JPEG, og animert WebP i stedet for en GIF.';

  @override
  String get whatsNew3 =>
      'M4A kan være tapsfri — ALAC står nå ved siden av AAC.';

  @override
  String get whatsNew4 =>
      'Én skjerm for utseendet: lysstyrke, aksentfarge, helsvart OLED og Material You.';

  @override
  String get whatsNew5 =>
      'Prestasjoner har medaljer, tre faner og fremgang du kan dele som et bilde.';

  @override
  String get achievementsTitle => 'Prestasjoner';

  @override
  String achievementsProgress(int done, int total) {
    return '$done av $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Telles bare på denne enheten. Ingenting lastes opp noe sted.';

  @override
  String get achFirstConversionTitle => 'Første steg';

  @override
  String get achFirstConversionBody => 'Konverter din første fil.';

  @override
  String get achTenConversionsTitle => 'Oppvarmet';

  @override
  String get achTenConversionsBody => 'Konverter 10 filer.';

  @override
  String get achFiftyConversionsTitle => 'Stamgjest';

  @override
  String get achFiftyConversionsBody => 'Konverter 50 filer.';

  @override
  String get achTwoHundredConversionsTitle => 'Arbeidshest';

  @override
  String get achTwoHundredConversionsBody => 'Konverter 200 filer.';

  @override
  String get achThousandConversionsTitle => 'Samlebånd';

  @override
  String get achThousandConversionsBody => 'Konverter 1000 filer.';

  @override
  String get achSaved100MbTitle => 'Plassparer';

  @override
  String get achSaved100MbBody => 'Frigjør 100 MB totalt.';

  @override
  String get achSaved1GbTitle => 'Gigabytejeger';

  @override
  String get achSaved1GbBody => 'Frigjør 1 GB totalt.';

  @override
  String get achSaved10GbTitle => 'Lagringshelt';

  @override
  String get achSaved10GbBody => 'Frigjør 10 GB totalt.';

  @override
  String get achBatchOfFiveTitle => 'Batcharbeider';

  @override
  String get achBatchOfFiveBody => 'Fullfør en batch på 5 filer eller flere.';

  @override
  String get achBatchOfTwentyTitle => 'Produksjonslinje';

  @override
  String get achBatchOfTwentyBody =>
      'Fullfør en batch på 20 filer eller flere.';

  @override
  String get achSniperTitle => 'Skarpskytter';

  @override
  String get achSniperBody =>
      'Treff en eksakt størrelse med tilpass til størrelse.';

  @override
  String get achMemeSmithTitle => 'Memesmed';

  @override
  String get achMemeSmithBody => 'Gjør en video om til en GIF.';

  @override
  String get achSoundHunterTitle => 'Lydjeger';

  @override
  String get achSoundHunterBody => 'Hent ut lyden fra en video.';

  @override
  String get achSubtitleKeeperTitle => 'Undertekstvokter';

  @override
  String get achSubtitleKeeperBody =>
      'Konverter en video med undertekstene i behold.';

  @override
  String get achDirectorTitle => 'Regissør';

  @override
  String get achDirectorBody =>
      'Bruk en transformasjon — roter, beskjær, hastighet eller volum.';

  @override
  String get achAllRounderTitle => 'Altmuligmann';

  @override
  String get achAllRounderBody => 'Konverter video, lyd og et bilde.';

  @override
  String get achNightOwlTitle => 'Nattugle';

  @override
  String get achNightOwlBody =>
      'Fullfør en konvertering mellom midnatt og klokken fem.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Skaff deg alle de andre prestasjonene.';

  @override
  String get storageTitle => 'Lagring';

  @override
  String get storageBody =>
      'Konverterte filer blir liggende i appen til du lagrer eller deler dem, der ingen filbehandler når dem.';

  @override
  String get storageEmpty => 'Ingenting lagret';

  @override
  String storageUsage(String size) {
    return 'Lagret: $size';
  }

  @override
  String get storageClearTitle => 'Tømme lagrede filer?';

  @override
  String get storageClearBody =>
      'Sletter alle ferdige resultater appen fortsatt holder på. Filer du allerede har lagret eller delt, røres ikke.';

  @override
  String get storageClearAction => 'Tøm';

  @override
  String storageCleared(String size) {
    return 'Frigjorde $size';
  }

  @override
  String get autoSaveLabel => 'Lagre resultater automatisk';

  @override
  String get autoSaveHint =>
      'Legger hver ferdige fil i galleriet — lyd i Nedlastinger — så snart den er klar.';

  @override
  String get lowSpaceTitle => 'Lite plass igjen';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Denne batchen trenger omtrent $needed, og bare $free er ledig. Konverteringen kan stoppe underveis.';
  }

  @override
  String saveAll(int count) {
    return 'Lagre alle ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Lagret: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Lagret $saved av $total';
  }

  @override
  String get presetFitPhotoTitle => 'Tilpass bilde til størrelse';

  @override
  String get presetFitPhotoBody =>
      'Press et bilde under en eksakt grense — opplastingsskjemaer, søknader.';

  @override
  String get photoFitHint =>
      'Appen prøver kvaliteter til én passer. Er budsjettet for lite for bildet, reduserer den også bildestørrelsen.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Målstørrelse i KB';

  @override
  String get compareAction => 'Sammenlign';

  @override
  String get compareBefore => 'Før';

  @override
  String get compareAfter => 'Etter';

  @override
  String get compareHint => 'Hold inne for å se originalen.';

  @override
  String get trimStart => 'Start';

  @override
  String get trimEnd => 'Slutt';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, opptil $duration';
  }

  @override
  String get imageScaleLabel => 'Skala';

  @override
  String get audioChannelsLabel => 'Kanaler';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Samplingsfrekvens';

  @override
  String get voiceAudioHint =>
      'Mono på 22,05 kHz gjør et taleopptak omtrent en fjerdedel så stort uten hørbart tap. La begge stå på original for musikk.';

  @override
  String get moveUp => 'Flytt opp';

  @override
  String get moveDown => 'Flytt ned';

  @override
  String get renameOutput => 'Gi resultatet nytt navn';

  @override
  String get renameOutputHint => 'Nytt navn';

  @override
  String get renameOutputHelp =>
      'Filendelsen kommer fra utdataformatet. La feltet stå tomt for å kalle resultatet opp etter kilden.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Slett originalene ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Slett originalene etter konvertering';

  @override
  String get deleteOriginalsHint =>
      'Ber systemet fjerne kildefilene når resultatet er lagret. Systemet viser alltid hva som forsvinner, og venter på bekreftelsen din.';

  @override
  String get mediaAccessRequired =>
      'Tilgang til mediebiblioteket kreves for å slette originalene.';

  @override
  String originalsDeleted(String size) {
    return 'Originalene ble slettet — $size frigjort';
  }

  @override
  String get originalsNoneDeleted =>
      'Ingenting ble slettet. Bare filer galleriet fortsatt har under sitt opprinnelige navn, lar seg finne.';

  @override
  String reclaimedTotal(String size) {
    return 'Frigjort med denne appen: $size';
  }

  @override
  String get deleteAllData => 'Slett alle data';

  @override
  String get deleteAllDataHint =>
      'Sletter alt appen tar vare på denne enheten: køen, konverterte filer, forhåndsvisninger, prestasjoner og innstillinger. Filer du allerede har lagret i galleriet, blir liggende.';

  @override
  String get codecCopy => 'Kopier';

  @override
  String get codecCopyRemux => 'Kopier (remux)';

  @override
  String get codecNoVideo => 'Ingen video';

  @override
  String get codecNoAudio => 'Ingen lyd';

  @override
  String codecLossless(String codec) {
    return '$codec (tapsfri)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animert)';
  }

  @override
  String get sizeTargetEmail => 'E-post';

  @override
  String get trimTimeHint => 'm:ss';
}
