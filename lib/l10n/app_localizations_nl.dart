// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class L10nNl extends L10n {
  L10nNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Converteren';

  @override
  String get tabQueue => 'Wachtrij';

  @override
  String get addFiles => 'Bestanden toevoegen';

  @override
  String get emptySelectionTitle => 'Nog geen bestanden';

  @override
  String get emptySelectionBody =>
      'Voeg foto\'s, video\'s of audio toe. Alles wordt op dit apparaat verwerkt.';

  @override
  String get sectionOutput => 'Uitvoer';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Afbeelding';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get outputFormat => 'Formaat';

  @override
  String get videoCodec => 'Videocodec';

  @override
  String get audioCodec => 'Audiocodec';

  @override
  String get rateControl => 'Bitrateregeling';

  @override
  String get rateControlQuality => 'Constante kwaliteit (CRF)';

  @override
  String get rateControlBitrate => 'Doelbitrate';

  @override
  String crfLabel(int value) {
    return 'Kwaliteit (CRF $value)';
  }

  @override
  String get crfHint =>
      'Lager betekent betere kwaliteit en een groter bestand.';

  @override
  String videoBitrate(int value) {
    return 'Videobitrate: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Audiobitrate: $value kbps';
  }

  @override
  String get encodingPreset => 'Encoder-preset';

  @override
  String get encodingPresetHint =>
      'Tragere presets comprimeren beter, maar verwarmen het apparaat meer.';

  @override
  String get presetOriginal => 'Origineel';

  @override
  String get resolution => 'Resolutie';

  @override
  String get frameRate => 'Beeldsnelheid';

  @override
  String imageQuality(int value) {
    return 'Kwaliteit: $value';
  }

  @override
  String get lossless => 'Verliesvrij';

  @override
  String get losslessHint => 'Grotere bestanden, pixelperfecte uitvoer.';

  @override
  String get sectionEnhance => 'Verbetering';

  @override
  String get sharpenLabel => 'Scherpte';

  @override
  String get sharpenHint =>
      'Maakt randen strakker. Het kan een onscherpe opname niet herstellen — die details staan niet in het bestand.';

  @override
  String get sharpenStrongHint =>
      'Sterk verscherpen kan lichte randen achterlaten. Probeer eerst gemiddeld.';

  @override
  String get denoiseLabel => 'Ruisonderdrukking';

  @override
  String get denoiseHint =>
      'Ruimt korrel op in donkere en nachtfoto\'s. Te veel maakt fijne details glad.';

  @override
  String get autoColorLabel => 'Automatische kleur en niveaus';

  @override
  String get autoColorHint =>
      'Rekt het contrast op en tilt vlakke kleuren iets op.';

  @override
  String get upscaleLabel => '2× vergroten';

  @override
  String get upscaleHint =>
      'Verdubbelt breedte en hoogte. Het voegt geen details toe — het helpt bij afdrukken of bijsnijden.';

  @override
  String get upscaleConflictHint =>
      'Zet Resolutie terug op Origineel om te vergroten.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Uit';

  @override
  String get enhanceLight => 'Licht';

  @override
  String get enhanceMedium => 'Gemiddeld';

  @override
  String get enhanceStrong => 'Sterk';

  @override
  String get stripMetadata => 'Metadata verwijderen';

  @override
  String get stripMetadataHint =>
      'Verwijdert EXIF, GPS en tijdstempels uit de uitvoer.';

  @override
  String startConversion(int count) {
    return '$count bestanden converteren';
  }

  @override
  String get batchResumed => 'De onderbroken conversie is hervat.';

  @override
  String get converting => 'Bezig met converteren…';

  @override
  String get cancelBatch => 'Stoppen';

  @override
  String get cancelJob => 'Annuleren';

  @override
  String get clearFinished => 'Voltooide wissen';

  @override
  String get removeJob => 'Verwijderen';

  @override
  String get shareFile => 'Delen';

  @override
  String get retryJob => 'Opnieuw';

  @override
  String get queueEmptyTitle => 'De wachtrij is leeg';

  @override
  String get queueEmptyBody =>
      'Bestanden die je toevoegt op het tabblad Converteren verschijnen hier.';

  @override
  String queueActiveTab(int count) {
    return 'Actief · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Voltooid · $count';
  }

  @override
  String get queueNoActiveTitle => 'Niets bezig';

  @override
  String get queueNoActiveBody =>
      'Bestanden die wachten of converteren verschijnen hier.';

  @override
  String get queueNoFinishedTitle => 'Nog niets voltooid';

  @override
  String get queueNoFinishedBody =>
      'Geconverteerde bestanden komen hier, klaar om te openen, op te slaan of te delen.';

  @override
  String get statusQueued => 'In wachtrij';

  @override
  String get statusRunning => 'Converteren';

  @override
  String get statusCompleted => 'Klaar';

  @override
  String get statusFailed => 'Mislukt';

  @override
  String get statusCancelled => 'Geannuleerd';

  @override
  String batchSummary(int done, int total) {
    return '$done van $total klaar';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done bestanden geconverteerd',
      one: '1 bestand geconverteerd',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done geconverteerd, $failed mislukt.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% kleiner';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% groter';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Weergave';

  @override
  String get themeSystem => 'Systeem';

  @override
  String get language => 'Taal';

  @override
  String get languageSystem => 'Systeem';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyBody =>
      'Eluna Media converteert je bestanden volledig op dit apparaat met een meegeleverde kopie van FFmpeg. Je bestanden verlaten het apparaat nooit, er is geen account nodig en er is geen telemetrie. Niets in de app gebruikt het netwerk — de app heeft niet eens de internettoestemming.\n\nMetadata verwijderen staat standaard aan, dus EXIF, GPS-coördinaten en tijdstempels worden uit je geëxporteerde bestanden gehaald.';

  @override
  String get licenseTitle => 'Licenties';

  @override
  String get licenseBody =>
      'Deze app bevat FFmpeg gebouwd met x264, x265 en andere GPL-componenten, dus de applicatie als geheel wordt verspreid onder de GNU GPL v3.';

  @override
  String get sourceMissing => 'Het bronbestand is niet meer beschikbaar.';

  @override
  String get tabSettings => 'Instellingen';

  @override
  String get introTitle => 'Privé van opzet';

  @override
  String get introOfflineTitle => 'Converteert op dit apparaat';

  @override
  String get introOfflineBody =>
      'Een meegeleverde kopie van FFmpeg doet al het werk. Je bestanden verlaten de telefoon nooit — converteren werkt in vliegtuigmodus.';

  @override
  String get introTelemetryTitle => 'Nul telemetrie';

  @override
  String get introTelemetryBody =>
      'Geen account, geen analytics, geen crashrapportage. De app weet niet wie je bent.';

  @override
  String get introMetadataTitle => 'Metadata onder controle';

  @override
  String get introMetadataBody =>
      'EXIF, GPS en tijdstempels worden standaard uit elke uitvoer verwijderd. Je kunt dat uitzetten.';

  @override
  String get introFreeNote =>
      'Gratis, zonder advertenties en zonder abonnementen. Elke functie, batchconversie inbegrepen, is vanaf het begin van jou — het enige wat je kunt kopen is een fooi, en die ontgrendelt niets.';

  @override
  String get introContinue => 'Aan de slag';

  @override
  String get modeSimple => 'Eenvoudig';

  @override
  String get modeAdvanced => 'Geavanceerd';

  @override
  String get modeAdvancedHint =>
      'Toon elke codec, bitrate en transformatie in plaats van de presetkaarten.';

  @override
  String get presetCompressVideoTitle => 'Video comprimeren';

  @override
  String get presetCompressVideoBody =>
      'Veel kleinere MP4, kwaliteit blijft goed';

  @override
  String get presetFitToSizeTitle => 'Passend maken';

  @override
  String get presetFitToSizeBody =>
      'Haal een exacte limiet — Discord, e-mail, chats';

  @override
  String get presetCompatibleMp4Title => 'Compatibele MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Speelt overal af';

  @override
  String get presetExtractAudioTitle => 'Audio extraheren';

  @override
  String get presetExtractAudioBody => 'MP3 uit elke video';

  @override
  String get presetVideoToGifTitle => 'Video naar GIF';

  @override
  String get presetVideoToGifBody => 'Korte clip naar een geanimeerde GIF';

  @override
  String get presetMergeTitle => 'Video\'s samenvoegen';

  @override
  String get presetMergeBody => 'Clips aan elkaar tot één MP4, op volgorde';

  @override
  String get mergeNeedsTwo =>
      'Selecteer minstens twee video\'s om samen te voegen.';

  @override
  String mergedVideoName(int count) {
    return 'Samengevoegde video ($count clips).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Foto comprimeren';

  @override
  String get presetCompressImageBody =>
      'Kleinere JPEG, nauwelijks zichtbaar verlies';

  @override
  String get presetEnhancePhotoTitle => 'Foto verbeteren';

  @override
  String get presetEnhancePhotoBody => 'Schoner, scherper, betere kleur';

  @override
  String get presetImageToWebpTitle => 'Foto naar WebP';

  @override
  String get presetImageToWebpBody => 'Modern formaat, kleiner dan JPEG';

  @override
  String get sizeTargetTitle => 'Doelgrootte';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Aangepast…';

  @override
  String get sizeTargetDialogTitle => 'Doelgrootte in MB';

  @override
  String get sizeTargetTooSmall =>
      'Het doel is te klein voor deze duur; de dichtstbijzijnde mogelijke kwaliteit wordt gebruikt.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per bestand';
  }

  @override
  String estimateTotal(String size) {
    return 'Geschatte uitvoer: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden geselecteerd',
      one: '1 bestand geselecteerd',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% offline converteren';

  @override
  String get promiseBatchFree => 'Batch is gratis';

  @override
  String get promiseNoWatermark => 'Geen watermerk';

  @override
  String get sectionTransform => 'Transformeren';

  @override
  String get rotateLabel => 'Draaien';

  @override
  String get flipLabel => 'Horizontaal spiegelen';

  @override
  String get speedLabel => 'Snelheid';

  @override
  String get cropLabel => 'Bijsnijden';

  @override
  String get cropHint =>
      'Bijsnijden vanuit het midden naar de gekozen verhouding — vierkant voor feeds, 9:16 voor stories.';

  @override
  String volumeLabel(int percent) {
    return 'Volume: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio en andere bestanden';

  @override
  String get hwEncoderLabel => 'Hardwarecodering';

  @override
  String get hwEncoderHint =>
      'Gebruikt de videochip van het apparaat in bitrate- en passend-maken-modus — veel sneller en koeler. De kwaliteitsmodus (CRF) gebruikt altijd de precieze software-encoder, en een mislukte hardwaretaak probeert het automatisch opnieuw in software.';

  @override
  String get transformNeedsReencode =>
      'Draaien, spiegelen en snelheid vereisen hercodering en zijn daarom uit tijdens een stream-kopie.';

  @override
  String get capBitrateLabel => 'Maak het bestand nooit groter';

  @override
  String get capBitrateHint =>
      'Begrenst de codering op de bitrate van de bron. Constante kwaliteit heeft geen eigen plafond, dus een al gecomprimeerde video kan anders groter uitvallen.';

  @override
  String get keepSubtitles => 'Ondertitels behouden';

  @override
  String get keepSubtitlesHint =>
      'Neemt ondertitelsporen mee naar de uitvoer. Alleen tekstondertitels.';

  @override
  String get sectionTrim => 'Inkorten';

  @override
  String get trimEnable => 'De bron inkorten';

  @override
  String get trimHint =>
      'Beschikbaar wanneer precies één bestand met bekende duur in de wachtrij staat.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Doelgrootte';

  @override
  String get lowBatteryTitle => 'Batterij is bijna leeg';

  @override
  String get lowBatteryBody =>
      'Converteren belast de processor zwaar. Je kunt eerst de lader aansluiten, of toch doorgaan.';

  @override
  String get lowBatteryContinue => 'Toch converteren';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden ontvangen',
      one: '1 bestand ontvangen',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Opslaan';

  @override
  String get savedToGallery => 'Opgeslagen in de galerij, album “Eluna Media”.';

  @override
  String get savedToDownloads => 'Opgeslagen in Downloads.';

  @override
  String get saveFailed => 'Kon het bestand niet opslaan.';

  @override
  String get jobRemovedUndo => 'Taak verwijderd.';

  @override
  String get finishedClearedUndo => 'Voltooide taken gewist.';

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get errorDetailsTitle => 'Foutdetails';

  @override
  String get sectionConversionPrefs => 'Conversie';

  @override
  String get powerModeLabel => 'Energiemodus';

  @override
  String get powerEfficiency => 'Koel en snel';

  @override
  String get powerBalanced => 'Gebalanceerd';

  @override
  String get powerQuality => 'Maximale compressie';

  @override
  String get powerModeHint =>
      'Hoe hard de video-encoder werkt. Koeler en sneller betekent iets grotere bestanden. Verder wordt niets ooit afgeknepen.';

  @override
  String get hapticsLabel => 'Trilfeedback';

  @override
  String get networkPrivacyTitle => 'Netwerk en privacy';

  @override
  String get netAuditIntro =>
      'Een volledige lijst van alles in deze app dat het netwerk kan raken.';

  @override
  String get netAuditNoneTitle => 'Helemaal geen netwerktoegang';

  @override
  String get netAuditNoneBody =>
      'De app vraagt de internettoestemming niet aan en kan het netwerk dus niet bereiken, ook al zou hij het proberen — je kunt dat nakijken in de app-info van het systeem. Geen advertenties, geen analytics, geen updatecontroles. “App beoordelen” geeft het door aan de store-app, die zelf praat.';

  @override
  String get netAuditConversionTitle => 'Conversie';

  @override
  String get netAuditConversionBody =>
      'Draait volledig op dit apparaat via een meegeleverde FFmpeg. Zet vliegtuigmodus aan en converteer — het werkt.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrie';

  @override
  String get netAuditTelemetryBody =>
      'Die is er niet. De app verzamelt geen analytics, geen crashrapporten, geen identifiers, en heeft geen accountsysteem.';

  @override
  String get netAuditTipsTitle => 'Fooien';

  @override
  String get netAuditTipsBody =>
      'Een fooi wordt afgehandeld door de Play Store-app, niet door deze — die nog steeds geen internettoestemming heeft. Billing voegt wel twee regels toe aan de toestemmingenlijst: “in-app-aankopen” en “netwerkverbindingen bekijken”, wat alleen leest of er een verbinding is en er geen kan gebruiken. Er wordt nooit automatisch iets gekocht, en een fooi ontgrendelt niets: alles hier is gratis.';

  @override
  String get sectionSupport => 'Ondersteuning';

  @override
  String get rateApp => 'App beoordelen';

  @override
  String get openLicenses => 'Opensourcelicenties';

  @override
  String get presetAudioToMp3Title => 'Audio converteren';

  @override
  String get presetAudioToMp3Body => 'Naar MP3 — speelt op alles af';

  @override
  String get presetCompressAudioTitle => 'Audio comprimeren';

  @override
  String get presetCompressAudioBody =>
      'Zuinigere AAC — spraaknotities, podcasts';

  @override
  String get convertTo => 'Converteren naar';

  @override
  String get formatSectionHint =>
      'Alleen formaten die je bestanden echt kunnen worden, staan in de lijst.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Bestand';

  @override
  String get mixedSelectionTitle => 'Verschillende bestandstypen geselecteerd';

  @override
  String get mixedSelectionBody =>
      'Elk bestand wordt geconverteerd met de beste preset voor zijn eigen type. Voeg één soort tegelijk toe voor volledige controle.';

  @override
  String get filesTitle => 'Bestanden';

  @override
  String get removeFile => 'Verwijderen';

  @override
  String timeLeft(String time) {
    return '≈ nog $time';
  }

  @override
  String get jobSettingsTitle => 'Conversie-instellingen';

  @override
  String get jobDetails => 'Details';

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
  String get summaryEnhanced => 'Verbeterd';

  @override
  String get summaryMetadataStripped => 'Metadata verwijderd';

  @override
  String summaryMerge(int count) {
    return '$count clips samengevoegd';
  }

  @override
  String get shareApp => 'App delen';

  @override
  String get shareAppText =>
      'Eluna Media — een gratis, volledig offline foto-, video- en audioconverter. Geen abonnementen, geen watermerken, geen accounts.';

  @override
  String appVersionLabel(String version) {
    return 'Versie $version';
  }

  @override
  String get openFile => 'Openen';

  @override
  String get openFolder => 'Map tonen';

  @override
  String get noAppToOpen => 'Geen app op dit apparaat kan dat bestand openen.';

  @override
  String get openFailed => 'Kon het bestand niet openen.';

  @override
  String get twoPassLabel => 'Twee doorgangen voor exacte grootte';

  @override
  String get twoPassHint =>
      'Passend-maken-taken coderen twee keer en halen de bytelimiet merkbaar nauwkeuriger — tegen ongeveer het dubbele aan tijd en batterij.';

  @override
  String get whatsNewTitle => 'Wat is er nieuw';

  @override
  String get whatsNew1 =>
      'Video kan nu AV1 zijn: merkbaar kleinere bestanden, als je erop kunt wachten.';

  @override
  String get whatsNew2 =>
      'Nieuw voor afbeeldingen: AVIF, ongeveer half een JPEG, en geanimeerde WebP in plaats van een GIF.';

  @override
  String get whatsNew3 => 'M4A kan verliesvrij zijn — ALAC staat nu naast AAC.';

  @override
  String get whatsNew4 =>
      'Eén scherm voor de weergave: helderheid, accentkleur, pikzwart OLED en Material You.';

  @override
  String get whatsNew5 =>
      'Prestaties hebben medailles, drie tabbladen en voortgang die je als afbeelding kunt delen.';

  @override
  String get achievementsTitle => 'Prestaties';

  @override
  String achievementsProgress(int done, int total) {
    return '$done van $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Alleen op dit apparaat geteld. Er wordt niets geüpload.';

  @override
  String get achFirstConversionTitle => 'Eerste stappen';

  @override
  String get achFirstConversionBody => 'Converteer je eerste bestand.';

  @override
  String get achTenConversionsTitle => 'Opgewarmd';

  @override
  String get achTenConversionsBody => 'Converteer 10 bestanden.';

  @override
  String get achFiftyConversionsTitle => 'Vaste klant';

  @override
  String get achFiftyConversionsBody => 'Converteer 50 bestanden.';

  @override
  String get achTwoHundredConversionsTitle => 'Werkpaard';

  @override
  String get achTwoHundredConversionsBody => 'Converteer 200 bestanden.';

  @override
  String get achThousandConversionsTitle => 'Lopende band';

  @override
  String get achThousandConversionsBody => 'Converteer 1000 bestanden.';

  @override
  String get achSaved100MbTitle => 'Ruimtebespaarder';

  @override
  String get achSaved100MbBody => 'Maak in totaal 100 MB vrij.';

  @override
  String get achSaved1GbTitle => 'Gigabytejager';

  @override
  String get achSaved1GbBody => 'Maak in totaal 1 GB vrij.';

  @override
  String get achSaved10GbTitle => 'Opslagheld';

  @override
  String get achSaved10GbBody => 'Maak in totaal 10 GB vrij.';

  @override
  String get achBatchOfFiveTitle => 'Batchwerker';

  @override
  String get achBatchOfFiveBody => 'Rond een batch van 5 bestanden of meer af.';

  @override
  String get achBatchOfTwentyTitle => 'Productielijn';

  @override
  String get achBatchOfTwentyBody =>
      'Rond een batch van 20 bestanden of meer af.';

  @override
  String get achSniperTitle => 'Scherpschutter';

  @override
  String get achSniperBody => 'Haal een exacte grootte met passend maken.';

  @override
  String get achMemeSmithTitle => 'Memesmid';

  @override
  String get achMemeSmithBody => 'Maak van een video een GIF.';

  @override
  String get achSoundHunterTitle => 'Geluidsjager';

  @override
  String get achSoundHunterBody => 'Haal audio uit een video.';

  @override
  String get achSubtitleKeeperTitle => 'Ondertitelbewaarder';

  @override
  String get achSubtitleKeeperBody =>
      'Converteer een video met behoud van de ondertitels.';

  @override
  String get achDirectorTitle => 'Regisseur';

  @override
  String get achDirectorBody =>
      'Pas een transformatie toe — draaien, bijsnijden, snelheid of volume.';

  @override
  String get achAllRounderTitle => 'Allrounder';

  @override
  String get achAllRounderBody => 'Converteer video, audio en een afbeelding.';

  @override
  String get achNightOwlTitle => 'Nachtbraker';

  @override
  String get achNightOwlBody =>
      'Rond een conversie af tussen middernacht en 5 uur in de ochtend.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Verdien elke andere prestatie.';

  @override
  String get storageTitle => 'Opslag';

  @override
  String get storageBody =>
      'Geconverteerde bestanden blijven in de app tot je ze opslaat of deelt, waar geen bestandsbeheerder ze kan bereiken.';

  @override
  String get storageEmpty => 'Niets opgeslagen';

  @override
  String storageUsage(String size) {
    return 'Opgeslagen: $size';
  }

  @override
  String get storageClearTitle => 'Opgeslagen bestanden wissen?';

  @override
  String get storageClearBody =>
      'Verwijdert elk voltooid resultaat dat de app nog vasthoudt. Bestanden die je al hebt opgeslagen of gedeeld blijven onaangeroerd.';

  @override
  String get storageClearAction => 'Wissen';

  @override
  String storageCleared(String size) {
    return '$size vrijgemaakt';
  }

  @override
  String get autoSaveLabel => 'Resultaten automatisch opslaan';

  @override
  String get autoSaveHint =>
      'Zet elk voltooid bestand in de galerij — audio in Downloads — zodra het klaar is.';

  @override
  String get lowSpaceTitle => 'Weinig ruimte over';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Deze batch heeft ongeveer $needed nodig en er is maar $free vrij. De conversie kan halverwege stoppen.';
  }

  @override
  String saveAll(int count) {
    return 'Alles opslaan ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Opgeslagen: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved van $total opgeslagen';
  }

  @override
  String get presetFitPhotoTitle => 'Foto passend maken';

  @override
  String get presetFitPhotoBody =>
      'Pers een foto onder een exacte limiet — uploadformulieren, aanvragen.';

  @override
  String get photoFitHint =>
      'De app probeert kwaliteiten tot er één past. Is het budget te klein voor de foto, dan verkleint hij ook het beeldformaat.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Doelgrootte in KB';

  @override
  String get compareAction => 'Vergelijken';

  @override
  String get compareBefore => 'Voor';

  @override
  String get compareAfter => 'Na';

  @override
  String get compareHint => 'Houd ingedrukt om het origineel te zien.';

  @override
  String get trimStart => 'Begin';

  @override
  String get trimEnd => 'Einde';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, tot $duration';
  }

  @override
  String get imageScaleLabel => 'Schaal';

  @override
  String get audioChannelsLabel => 'Kanalen';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Samplefrequentie';

  @override
  String get voiceAudioHint =>
      'Mono op 22,05 kHz maakt een spraakopname ruwweg vier keer kleiner zonder hoorbaar verlies. Laat beide op origineel voor muziek.';

  @override
  String get moveUp => 'Omhoog';

  @override
  String get moveDown => 'Omlaag';

  @override
  String get renameOutput => 'Resultaat hernoemen';

  @override
  String get renameOutputHint => 'Nieuwe naam';

  @override
  String get renameOutputHelp =>
      'De extensie komt van het uitvoerformaat. Laat leeg om het resultaat naar de bron te noemen.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Originelen verwijderen ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Originelen verwijderen na converteren';

  @override
  String get deleteOriginalsHint =>
      'Vraagt het systeem de bronbestanden te verwijderen zodra het resultaat is opgeslagen. Het systeem toont altijd wat weggaat en wacht op je bevestiging.';

  @override
  String originalsDeleted(String size) {
    return 'Originelen verwijderd — $size vrijgemaakt';
  }

  @override
  String get originalsNoneDeleted =>
      'Er is niets verwijderd. Alleen bestanden die de galerij nog onder hun oorspronkelijke naam bewaart, kunnen worden gevonden.';

  @override
  String reclaimedTotal(String size) {
    return 'Vrijgemaakt met deze app: $size';
  }

  @override
  String get deleteAllData => 'Alle gegevens verwijderen';

  @override
  String get deleteAllDataHint =>
      'Wist alles wat de app op dit apparaat bewaart: de wachtrij, geconverteerde bestanden, voorbeelden, prestaties en instellingen. Bestanden die je al in je galerij hebt opgeslagen blijven met rust.';

  @override
  String get codecCopy => 'Kopiëren';

  @override
  String get codecCopyRemux => 'Kopiëren (remux)';

  @override
  String get codecNoVideo => 'Geen video';

  @override
  String get codecNoAudio => 'Geen audio';

  @override
  String codecLossless(String codec) {
    return '$codec (verliesvrij)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (geanimeerd)';
  }

  @override
  String get sizeTargetEmail => 'E-mail';

  @override
  String get trimTimeHint => 'm:ss';
}
