// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class L10nDa extends L10n {
  L10nDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konvertér';

  @override
  String get tabQueue => 'Kø';

  @override
  String get addFiles => 'Tilføj filer';

  @override
  String get emptySelectionTitle => 'Ingen filer endnu';

  @override
  String get emptySelectionBody =>
      'Tilføj fotos, videoer eller lyd. Alt behandles på denne enhed.';

  @override
  String get sectionOutput => 'Output';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Lyd';

  @override
  String get sectionImage => 'Billede';

  @override
  String get sectionPrivacy => 'Privatliv';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Videocodec';

  @override
  String get audioCodec => 'Lydcodec';

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
  String get crfHint => 'Lavere giver bedre kvalitet og en større fil.';

  @override
  String videoBitrate(int value) {
    return 'Videobitrate: $value kbit/s';
  }

  @override
  String audioBitrate(int value) {
    return 'Lydbitrate: $value kbit/s';
  }

  @override
  String get encodingPreset => 'Kodningsforvalg';

  @override
  String get encodingPresetHint =>
      'Langsommere forvalg komprimerer bedre, men varmer enheden mere.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Opløsning';

  @override
  String get frameRate => 'Billedhastighed';

  @override
  String imageQuality(int value) {
    return 'Kvalitet: $value';
  }

  @override
  String get lossless => 'Tabsfri';

  @override
  String get losslessHint => 'Større filer, pixelperfekt resultat.';

  @override
  String get sectionEnhance => 'Forbedring';

  @override
  String get sharpenLabel => 'Skarphed';

  @override
  String get sharpenHint =>
      'Gør kanterne tydeligere. Det kan ikke redde et sløret eller ufokuseret billede — de detaljer findes ikke i filen.';

  @override
  String get sharpenStrongHint =>
      'Kraftig skarphed kan efterlade lyse kanter. Prøv middel først.';

  @override
  String get denoiseLabel => 'Støjreduktion';

  @override
  String get denoiseHint =>
      'Rydder op i korn på mørke billeder og nattefotos. For meget udvisker fine detaljer.';

  @override
  String get autoColorLabel => 'Automatisk farve og niveauer';

  @override
  String get autoColorHint =>
      'Strækker kontrasten og løfter flade farver en smule.';

  @override
  String get upscaleLabel => 'Forstør 2×';

  @override
  String get upscaleHint =>
      'Fordobler bredde og højde. Det tilføjer ingen detaljer — men hjælper ved print eller beskæring.';

  @override
  String get upscaleConflictHint =>
      'Sæt Opløsning tilbage til Original for at kunne forstørre.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Fra';

  @override
  String get enhanceLight => 'Let';

  @override
  String get enhanceMedium => 'Middel';

  @override
  String get enhanceStrong => 'Kraftig';

  @override
  String get stripMetadata => 'Fjern metadata';

  @override
  String get stripMetadataHint =>
      'Fjerner EXIF, GPS og tidsstempler fra resultatet.';

  @override
  String startConversion(int count) {
    return 'Konvertér filer ($count)';
  }

  @override
  String get batchResumed => 'Den afbrudte konvertering blev genoptaget.';

  @override
  String get converting => 'Konverterer…';

  @override
  String get cancelBatch => 'Stop';

  @override
  String get cancelJob => 'Annullér';

  @override
  String get clearFinished => 'Ryd færdige';

  @override
  String get removeJob => 'Fjern';

  @override
  String get shareFile => 'Del';

  @override
  String get retryJob => 'Prøv igen';

  @override
  String get queueEmptyTitle => 'Køen er tom';

  @override
  String get queueEmptyBody =>
      'Filer, du tilføjer under Konvertér, dukker op her.';

  @override
  String queueActiveTab(int count) {
    return 'Aktive · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Færdige · $count';
  }

  @override
  String get queueNoActiveTitle => 'Intet i gang';

  @override
  String get queueNoActiveBody =>
      'Filer, der venter eller konverteres, vises her.';

  @override
  String get queueNoFinishedTitle => 'Intet færdigt endnu';

  @override
  String get queueNoFinishedBody =>
      'Konverterede filer havner her, klar til at åbne, gemme eller dele.';

  @override
  String get statusQueued => 'I kø';

  @override
  String get statusRunning => 'Konverterer';

  @override
  String get statusCompleted => 'Færdig';

  @override
  String get statusFailed => 'Mislykkedes';

  @override
  String get statusCancelled => 'Annulleret';

  @override
  String batchSummary(int done, int total) {
    return '$done af $total færdige';
  }

  @override
  String batchCompleted(int done) {
    return 'Konverterede filer: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done konverteret, $failed mislykkedes.';
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
  String get appearance => 'Udseende';

  @override
  String get themeSystem => 'System';

  @override
  String get language => 'Sprog';

  @override
  String get languageSystem => 'System';

  @override
  String get privacyTitle => 'Privatliv';

  @override
  String get privacyBody =>
      'Eluna Media konverterer dine filer udelukkende på denne enhed med en medfølgende kopi af FFmpeg. Dine filer forlader aldrig enheden, der kræves ingen konto, og der er ingen telemetri. Intet i appen bruger netværket overhovedet — den har ikke engang internettilladelsen.\n\nFjernelse af metadata er slået til som standard, så EXIF, GPS-koordinater og tidsstempler fjernes fra de filer, du eksporterer.';

  @override
  String get licenseTitle => 'Licenser';

  @override
  String get licenseBody =>
      'Denne app indeholder FFmpeg bygget med x264, x265 og andre GPL-komponenter, så programmet som helhed distribueres under GNU GPL v3.';

  @override
  String get sourceMissing => 'Kildefilen findes ikke længere.';

  @override
  String get tabSettings => 'Indstillinger';

  @override
  String get introTitle => 'Privat fra bunden';

  @override
  String get introOfflineTitle => 'Konverterer på denne enhed';

  @override
  String get introOfflineBody =>
      'En medfølgende kopi af FFmpeg klarer hele arbejdet. Dine filer forlader aldrig telefonen — konvertering virker i flytilstand.';

  @override
  String get introTelemetryTitle => 'Nul telemetri';

  @override
  String get introTelemetryBody =>
      'Ingen konto, ingen analyse, ingen nedbrudsrapportering. Appen ved ikke, hvem du er.';

  @override
  String get introMetadataTitle => 'Metadata under kontrol';

  @override
  String get introMetadataBody =>
      'EXIF, GPS og tidsstempler fjernes fra alt output som standard. Du kan slå det fra.';

  @override
  String get introFreeNote =>
      'Gratis, uden reklamer og uden abonnementer. Alle funktioner, batchkonvertering inklusive, er dine fra starten — det eneste, der kan købes, er en drikkepenge, og den låser intet op.';

  @override
  String get introContinue => 'Kom i gang';

  @override
  String get modeSimple => 'Enkel';

  @override
  String get modeAdvanced => 'Avanceret';

  @override
  String get modeAdvancedHint =>
      'Vis alle codecs, bitrater og transformationer i stedet for forvalgskortene.';

  @override
  String get presetCompressVideoTitle => 'Komprimér video';

  @override
  String get presetCompressVideoBody => 'Meget mindre MP4, kvaliteten holder';

  @override
  String get presetFitToSizeTitle => 'Tilpas til størrelse';

  @override
  String get presetFitToSizeBody =>
      'Ram en præcis grænse — Discord, e-mail, chats';

  @override
  String get presetCompatibleMp4Title => 'Kompatibel MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Afspilles overalt';

  @override
  String get presetExtractAudioTitle => 'Udtræk lyd';

  @override
  String get presetExtractAudioBody => 'MP3 fra enhver video';

  @override
  String get presetVideoToGifTitle => 'Video til GIF';

  @override
  String get presetVideoToGifBody => 'Kort klip til en animeret GIF';

  @override
  String get presetMergeTitle => 'Sammenføj videoer';

  @override
  String get presetMergeBody => 'Sy klip sammen til én MP4, i rækkefølge';

  @override
  String get mergeNeedsTwo => 'Vælg mindst to videoer for at sammenføje.';

  @override
  String mergedVideoName(int count) {
    return 'Sammenføjet video ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Komprimér foto';

  @override
  String get presetCompressImageBody => 'Mindre JPEG, næsten usynligt tab';

  @override
  String get presetEnhancePhotoTitle => 'Forbedr foto';

  @override
  String get presetEnhancePhotoBody => 'Renere, skarpere, bedre farver';

  @override
  String get presetImageToWebpTitle => 'Foto til WebP';

  @override
  String get presetImageToWebpBody => 'Moderne format, mindre end JPEG';

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
  String get sizeTargetCustom => 'Tilpasset…';

  @override
  String get sizeTargetDialogTitle => 'Målstørrelse i MB';

  @override
  String get sizeTargetTooSmall =>
      'Målet er for lille til denne varighed; den nærmest mulige kvalitet bruges.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size pr. fil';
  }

  @override
  String estimateTotal(String size) {
    return 'Anslået output: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Valgte filer: $count';
  }

  @override
  String get promiseOffline => '100 % offline konvertering';

  @override
  String get promiseBatchFree => 'Batch er gratis';

  @override
  String get promiseNoWatermark => 'Intet vandmærke';

  @override
  String get sectionTransform => 'Transformér';

  @override
  String get rotateLabel => 'Rotér';

  @override
  String get flipLabel => 'Spejlvend vandret';

  @override
  String get speedLabel => 'Hastighed';

  @override
  String get cropLabel => 'Beskær';

  @override
  String get cropHint =>
      'Beskær fra midten til det valgte format — kvadrat til feeds, 9:16 til stories.';

  @override
  String volumeLabel(int percent) {
    return 'Lydstyrke: $percent%';
  }

  @override
  String get addAudioFiles => 'Lyd og andre filer';

  @override
  String get hwEncoderLabel => 'Hardwarekodning';

  @override
  String get hwEncoderHint =>
      'Bruger enhedens videochip i bitrate- og tilpas-til-størrelse-tilstand — meget hurtigere og køligere. Kvalitetstilstand (CRF) bruger altid den præcise softwarekoder, og et mislykket hardwarejob prøves automatisk igen i software.';

  @override
  String get transformNeedsReencode =>
      'Rotation, spejling og hastighed kræver genkodning og er derfor slået fra under streamkopiering.';

  @override
  String get capBitrateLabel => 'Gør aldrig filen større';

  @override
  String get capBitrateHint =>
      'Begrænser kodningen til kildens egen bitrate. Konstant kvalitet har intet loft i sig selv, så en allerede komprimeret video kan ellers blive større.';

  @override
  String get keepSubtitles => 'Behold undertekster';

  @override
  String get keepSubtitlesHint =>
      'Tager undertekstspor med over i resultatet. Kun tekstbaserede undertekster.';

  @override
  String get sectionTrim => 'Beskær tid';

  @override
  String get trimEnable => 'Beskær kilden';

  @override
  String get trimHint =>
      'Tilgængelig, når præcis én fil med kendt varighed er i køen.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Målstørrelse';

  @override
  String get lowBatteryTitle => 'Lavt batteri';

  @override
  String get lowBatteryBody =>
      'Konvertering belaster processoren hårdt. Du kan sætte til strøm først eller fortsætte alligevel.';

  @override
  String get lowBatteryContinue => 'Konvertér alligevel';

  @override
  String get commonCancel => 'Annullér';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Modtagne filer: $count';
  }

  @override
  String get saveFile => 'Gem';

  @override
  String get savedToGallery => 'Gemt i galleriet, albummet “Eluna Media”.';

  @override
  String get savedToDownloads => 'Gemt i Downloads.';

  @override
  String get saveFailed => 'Kunne ikke gemme filen.';

  @override
  String get jobRemovedUndo => 'Job fjernet.';

  @override
  String get finishedClearedUndo => 'Færdige job ryddet.';

  @override
  String get undo => 'Fortryd';

  @override
  String get errorDetailsTitle => 'Fejldetaljer';

  @override
  String get sectionConversionPrefs => 'Konvertering';

  @override
  String get powerModeLabel => 'Strømtilstand';

  @override
  String get powerEfficiency => 'Køligt og hurtigt';

  @override
  String get powerBalanced => 'Balanceret';

  @override
  String get powerQuality => 'Maksimal komprimering';

  @override
  String get powerModeHint =>
      'Hvor hårdt videokoderen arbejder. Køligere og hurtigere betyder lidt større filer. Intet andet bliver nogensinde begrænset.';

  @override
  String get hapticsLabel => 'Vibrationsfeedback';

  @override
  String get networkPrivacyTitle => 'Netværk og privatliv';

  @override
  String get netAuditIntro =>
      'En komplet liste over alt i denne app, der kan røre netværket.';

  @override
  String get netAuditNoneTitle => 'Ingen netværksadgang overhovedet';

  @override
  String get netAuditNoneBody =>
      'Appen beder ikke om internettilladelsen og kan derfor ikke nå netværket, selv hvis den prøvede — det kan du efterprøve i systemets appoplysninger. Ingen reklamer, ingen analyse, ingen opdateringstjek. “Bedøm appen” giver opgaven videre til butiksappen, som selv står for kontakten.';

  @override
  String get netAuditConversionTitle => 'Konvertering';

  @override
  String get netAuditConversionBody =>
      'Kører udelukkende på denne enhed via et medfølgende FFmpeg. Slå flytilstand til og konvertér — det virker.';

  @override
  String get netAuditTelemetryTitle => 'Telemetri';

  @override
  String get netAuditTelemetryBody =>
      'Den findes ikke. Appen indsamler ingen analysedata, ingen nedbrudsrapporter, ingen identifikatorer, og har intet kontosystem.';

  @override
  String get netAuditTipsTitle => 'Drikkepenge';

  @override
  String get netAuditTipsBody =>
      'Drikkepenge håndteres af Play Butik-appen, ikke af denne — som stadig ikke har internettilladelse. Betalingen tilføjer dog to linjer til tilladelseslisten: “køb i appen” og “se netværksforbindelser”, som kun læser, om der er en forbindelse, og ikke kan bruge den. Intet købes automatisk, og drikkepenge låser intet op: alt her er gratis.';

  @override
  String get sectionSupport => 'Support';

  @override
  String get rateApp => 'Bedøm appen';

  @override
  String get openLicenses => 'Open source-licenser';

  @override
  String get presetAudioToMp3Title => 'Konvertér lyd';

  @override
  String get presetAudioToMp3Body => 'Til MP3 — afspilles på alt';

  @override
  String get presetCompressAudioTitle => 'Komprimér lyd';

  @override
  String get presetCompressAudioBody => 'Slankere AAC — talenoter, podcasts';

  @override
  String get convertTo => 'Konvertér til';

  @override
  String get formatSectionHint =>
      'Kun formater, dine filer faktisk kan blive til, står på listen.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Lyd';

  @override
  String get sourceUnknown => 'Fil';

  @override
  String get mixedSelectionTitle => 'Forskellige filtyper valgt';

  @override
  String get mixedSelectionBody =>
      'Hver fil konverteres med det bedste forvalg for sin egen type. Tilføj én slags ad gangen for fuld kontrol.';

  @override
  String get filesTitle => 'Filer';

  @override
  String get removeFile => 'Fjern';

  @override
  String timeLeft(String time) {
    return '≈ $time tilbage';
  }

  @override
  String get jobSettingsTitle => 'Konverteringsindstillinger';

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
    return 'Sammenføjede klip: $count';
  }

  @override
  String get shareApp => 'Del appen';

  @override
  String get shareAppText =>
      'Eluna Media — en gratis, fuldstændig offline foto-, video- og lydkonverter. Ingen abonnementer, ingen vandmærker, ingen konti.';

  @override
  String appVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get openFile => 'Åbn';

  @override
  String get openFolder => 'Vis mappe';

  @override
  String get noAppToOpen => 'Ingen app på denne enhed kan åbne den fil.';

  @override
  String get openFailed => 'Kunne ikke åbne filen.';

  @override
  String get twoPassLabel => 'To gennemløb for præcis størrelse';

  @override
  String get twoPassHint =>
      'Job med tilpas til størrelse kodes to gange og rammer bytebudgettet mærkbart mere præcist — til omtrent dobbelt tid og batteri.';

  @override
  String get whatsNewTitle => 'Nyheder';

  @override
  String get whatsNew1 =>
      'Video kan nu være AV1: mærkbart mindre filer, hvis du kan vente på dem.';

  @override
  String get whatsNew2 =>
      'Nyt til billeder: AVIF, cirka halvdelen af en JPEG, og animeret WebP i stedet for en GIF.';

  @override
  String get whatsNew3 =>
      'M4A kan være tabsfri — ALAC står nu ved siden af AAC.';

  @override
  String get whatsNew4 =>
      'Én skærm til udseendet: lysstyrke, accentfarve, helsort OLED og Material You.';

  @override
  String get whatsNew5 =>
      'Præstationer har medaljer, tre faneblade og fremgang, du kan dele som et billede.';

  @override
  String get achievementsTitle => 'Præstationer';

  @override
  String achievementsProgress(int done, int total) {
    return '$done af $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Tælles kun på denne enhed. Intet uploades nogen steder.';

  @override
  String get achFirstConversionTitle => 'Første skridt';

  @override
  String get achFirstConversionBody => 'Konvertér din første fil.';

  @override
  String get achTenConversionsTitle => 'Varmet op';

  @override
  String get achTenConversionsBody => 'Konvertér 10 filer.';

  @override
  String get achFiftyConversionsTitle => 'Fast kunde';

  @override
  String get achFiftyConversionsBody => 'Konvertér 50 filer.';

  @override
  String get achTwoHundredConversionsTitle => 'Arbejdshest';

  @override
  String get achTwoHundredConversionsBody => 'Konvertér 200 filer.';

  @override
  String get achThousandConversionsTitle => 'Samlebånd';

  @override
  String get achThousandConversionsBody => 'Konvertér 1000 filer.';

  @override
  String get achSaved100MbTitle => 'Pladsbesparer';

  @override
  String get achSaved100MbBody => 'Frigør 100 MB i alt.';

  @override
  String get achSaved1GbTitle => 'Gigabytejæger';

  @override
  String get achSaved1GbBody => 'Frigør 1 GB i alt.';

  @override
  String get achSaved10GbTitle => 'Lagerhelt';

  @override
  String get achSaved10GbBody => 'Frigør 10 GB i alt.';

  @override
  String get achBatchOfFiveTitle => 'Batcharbejder';

  @override
  String get achBatchOfFiveBody => 'Fuldfør en batch på 5 filer eller flere.';

  @override
  String get achBatchOfTwentyTitle => 'Produktionslinje';

  @override
  String get achBatchOfTwentyBody =>
      'Fuldfør en batch på 20 filer eller flere.';

  @override
  String get achSniperTitle => 'Skarpskytte';

  @override
  String get achSniperBody =>
      'Ram en præcis størrelse med tilpas til størrelse.';

  @override
  String get achMemeSmithTitle => 'Memesmed';

  @override
  String get achMemeSmithBody => 'Lav en GIF ud af en video.';

  @override
  String get achSoundHunterTitle => 'Lydjæger';

  @override
  String get achSoundHunterBody => 'Udtræk lyden fra en video.';

  @override
  String get achSubtitleKeeperTitle => 'Undertekstvogter';

  @override
  String get achSubtitleKeeperBody =>
      'Konvertér en video med underteksterne bevaret.';

  @override
  String get achDirectorTitle => 'Instruktør';

  @override
  String get achDirectorBody =>
      'Anvend en transformation — rotér, beskær, hastighed eller lydstyrke.';

  @override
  String get achAllRounderTitle => 'Alsidig';

  @override
  String get achAllRounderBody => 'Konvertér video, lyd og et billede.';

  @override
  String get achNightOwlTitle => 'Natteravn';

  @override
  String get achNightOwlBody =>
      'Fuldfør en konvertering mellem midnat og klokken fem.';

  @override
  String get achPlatinumTitle => 'Platin';

  @override
  String get achPlatinumBody => 'Optjen alle andre præstationer.';

  @override
  String get storageTitle => 'Lagring';

  @override
  String get storageBody =>
      'Konverterede filer bliver i appen, indtil du gemmer eller deler dem, hvor ingen filhåndtering kan nå dem.';

  @override
  String get storageEmpty => 'Intet gemt';

  @override
  String storageUsage(String size) {
    return 'Gemt: $size';
  }

  @override
  String get storageClearTitle => 'Ryd gemte filer?';

  @override
  String get storageClearBody =>
      'Sletter alle færdige resultater, appen stadig holder på. Filer, du allerede har gemt eller delt, røres ikke.';

  @override
  String get storageClearAction => 'Ryd';

  @override
  String storageCleared(String size) {
    return 'Frigjorde $size';
  }

  @override
  String get autoSaveLabel => 'Gem resultater automatisk';

  @override
  String get autoSaveHint =>
      'Lægger hver færdig fil i galleriet — lyd i Downloads — så snart den er klar.';

  @override
  String get lowSpaceTitle => 'Ikke meget plads tilbage';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Denne batch skal bruge omkring $needed, og der er kun $free ledigt. Konverteringen kan stoppe undervejs.';
  }

  @override
  String saveAll(int count) {
    return 'Gem alle ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Gemt: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Gemte $saved af $total';
  }

  @override
  String get presetFitPhotoTitle => 'Tilpas foto til størrelse';

  @override
  String get presetFitPhotoBody =>
      'Pres et billede under en præcis grænse — uploadformularer, ansøgninger.';

  @override
  String get photoFitHint =>
      'Appen prøver kvaliteter, indtil én passer. Er budgettet for lille til billedet, reducerer den også billedstørrelsen.';

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
  String get compareAfter => 'Efter';

  @override
  String get compareHint => 'Hold nede for at se originalen.';

  @override
  String get trimStart => 'Start';

  @override
  String get trimEnd => 'Slut';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, op til $duration';
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
      'Mono ved 22,05 kHz gør en taleoptagelse cirka en fjerdedel så stor uden hørbart tab. Lad begge stå på original til musik.';

  @override
  String get moveUp => 'Flyt op';

  @override
  String get moveDown => 'Flyt ned';

  @override
  String get renameOutput => 'Omdøb resultatet';

  @override
  String get renameOutputHint => 'Nyt navn';

  @override
  String get renameOutputHelp =>
      'Filendelsen kommer fra outputformatet. Lad feltet stå tomt for at opkalde resultatet efter kilden.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Slet originalerne ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Slet originalerne efter konvertering';

  @override
  String get deleteOriginalsHint =>
      'Beder systemet fjerne kildefilerne, når resultatet er gemt. Systemet viser altid, hvad der forsvinder, og venter på din bekræftelse.';

  @override
  String originalsDeleted(String size) {
    return 'Originalerne blev slettet — $size frigjort';
  }

  @override
  String get originalsNoneDeleted =>
      'Intet blev slettet. Kun filer, galleriet stadig har under deres oprindelige navn, kan findes.';

  @override
  String reclaimedTotal(String size) {
    return 'Frigjort med denne app: $size';
  }

  @override
  String get deleteAllData => 'Slet alle data';

  @override
  String get deleteAllDataHint =>
      'Sletter alt, appen gemmer på denne enhed: køen, konverterede filer, forhåndsvisninger, præstationer og indstillinger. Filer, du allerede har gemt i dit galleri, lades i fred.';

  @override
  String get codecCopy => 'Kopiér';

  @override
  String get codecCopyRemux => 'Kopiér (remux)';

  @override
  String get codecNoVideo => 'Ingen video';

  @override
  String get codecNoAudio => 'Ingen lyd';

  @override
  String codecLossless(String codec) {
    return '$codec (tabsfri)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animeret)';
  }

  @override
  String get sizeTargetEmail => 'E-mail';

  @override
  String get trimTimeHint => 'm:ss';
}
