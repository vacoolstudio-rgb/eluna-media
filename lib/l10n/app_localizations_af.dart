// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class L10nAf extends L10n {
  L10nAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Omskakel';

  @override
  String get tabQueue => 'Wagry';

  @override
  String get addFiles => 'Voeg lêers by';

  @override
  String get emptySelectionTitle => 'Nog geen lêers nie';

  @override
  String get emptySelectionBody =>
      'Voeg foto\'s, video\'s of klank by. Alles word op hierdie toestel verwerk.';

  @override
  String get sectionOutput => 'Afvoer';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Klank';

  @override
  String get sectionImage => 'Beeld';

  @override
  String get sectionPrivacy => 'Privaatheid';

  @override
  String get outputFormat => 'Formaat';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Klankkodek';

  @override
  String get rateControl => 'Spoedbeheer';

  @override
  String get rateControlQuality => 'Konstante kwaliteit (CRF)';

  @override
  String get rateControlBitrate => 'Teikenbitspoed';

  @override
  String crfLabel(int value) {
    return 'Kwaliteit (CRF $value)';
  }

  @override
  String get crfHint => 'Laer is beter kwaliteit en \'n groter lêer.';

  @override
  String videoBitrate(int value) {
    return 'Videobitspoed: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Klankbitspoed: $value kbps';
  }

  @override
  String get encodingPreset => 'Enkodeerder-voorinstelling';

  @override
  String get encodingPresetHint =>
      'Stadiger voorinstellings pak beter saam, maar maak die toestel warmer.';

  @override
  String get presetOriginal => 'Oorspronklik';

  @override
  String get resolution => 'Resolusie';

  @override
  String get frameRate => 'Raamtempo';

  @override
  String imageQuality(int value) {
    return 'Kwaliteit: $value';
  }

  @override
  String get lossless => 'Verliesloos';

  @override
  String get losslessHint => 'Groter lêers, piksel-perfekte afvoer.';

  @override
  String get sectionEnhance => 'Verbetering';

  @override
  String get sharpenLabel => 'Skerpte';

  @override
  String get sharpenHint =>
      'Maak rande skerper. Dit kan nie \'n wasige of onskerp foto herstel nie — daardie detail is nie in die lêer nie.';

  @override
  String get sharpenStrongHint =>
      'Sterk verskerping kan helder ligkringe langs rande laat. Probeer eers medium.';

  @override
  String get denoiseLabel => 'Ruisvermindering';

  @override
  String get denoiseHint =>
      'Maak korrel in donker en nagfoto\'s skoon. Te veel stryk fyn detail glad weg.';

  @override
  String get autoColorLabel => 'Outokleur en -vlakke';

  @override
  String get autoColorHint =>
      'Rek die kontras uit en lig dowwe kleure \'n bietjie op.';

  @override
  String get upscaleLabel => 'Vergroot 2×';

  @override
  String get upscaleHint =>
      'Verdubbel die breedte en hoogte. Dit voeg nie detail by nie — dit help met druk of uitsny.';

  @override
  String get upscaleConflictHint =>
      'Stel Resolusie terug na Oorspronklik om te vergroot.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Af';

  @override
  String get enhanceLight => 'Lig';

  @override
  String get enhanceMedium => 'Medium';

  @override
  String get enhanceStrong => 'Sterk';

  @override
  String get stripMetadata => 'Verwyder metadata';

  @override
  String get stripMetadataHint =>
      'Verwyder EXIF, GPS en tydstempels uit die afvoer.';

  @override
  String startConversion(int count) {
    return 'Skakel $count lêers om';
  }

  @override
  String get batchResumed => 'Die onderbroke omskakeling is hervat.';

  @override
  String get converting => 'Besig om om te skakel…';

  @override
  String get cancelBatch => 'Stop';

  @override
  String get cancelJob => 'Kanselleer';

  @override
  String get clearFinished => 'Maak voltooides skoon';

  @override
  String get removeJob => 'Verwyder';

  @override
  String get shareFile => 'Deel';

  @override
  String get retryJob => 'Probeer weer';

  @override
  String get queueEmptyTitle => 'Die wagry is leeg';

  @override
  String get queueEmptyBody =>
      'Lêers wat jy op die Omskakel-oortjie byvoeg, verskyn hier.';

  @override
  String queueActiveTab(int count) {
    return 'Aktief · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Voltooi · $count';
  }

  @override
  String get queueNoActiveTitle => 'Niks aan die gang nie';

  @override
  String get queueNoActiveBody => 'Lêers wat wag of omgeskakel word, wys hier.';

  @override
  String get queueNoFinishedTitle => 'Nog niks voltooi nie';

  @override
  String get queueNoFinishedBody =>
      'Omgeskakelde lêers beland hier, gereed om oop te maak, te stoor of te deel.';

  @override
  String get statusQueued => 'In die wagry';

  @override
  String get statusRunning => 'Besig om om te skakel';

  @override
  String get statusCompleted => 'Klaar';

  @override
  String get statusFailed => 'Misluk';

  @override
  String get statusCancelled => 'Gekanselleer';

  @override
  String batchSummary(int done, int total) {
    return '$done van $total klaar';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done lêers omgeskakel',
      one: '1 lêer omgeskakel',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done omgeskakel, $failed misluk.';
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
  String get appearance => 'Voorkoms';

  @override
  String get themeSystem => 'Stelsel';

  @override
  String get language => 'Taal';

  @override
  String get languageSystem => 'Stelsel';

  @override
  String get privacyTitle => 'Privaatheid';

  @override
  String get privacyBody =>
      'Eluna Media skakel jou lêers heeltemal op hierdie toestel om met \'n ingeboude kopie van FFmpeg. Jou lêers verlaat nooit die toestel nie, geen rekening word vereis nie, en daar is geen telemetrie nie. Niks in die program gebruik die netwerk hoegenaamd nie — dit hou nie eens die internettoestemming nie.\n\nMetadataverwydering is by verstek aan, sodat EXIF, GPS-koördinate en tydstempels uit die lêers wat jy uitvoer, verwyder word.';

  @override
  String get licenseTitle => 'Lisensiëring';

  @override
  String get licenseBody =>
      'Hierdie program sluit FFmpeg in wat met x264, x265 en ander GPL-komponente gebou is, dus word die program as geheel onder die GNU GPL v3 versprei.';

  @override
  String get sourceMissing => 'Die bronlêer is nie meer beskikbaar nie.';

  @override
  String get tabSettings => 'Instellings';

  @override
  String get introTitle => 'Privaat van ontwerp af';

  @override
  String get introOfflineTitle => 'Skakel om op hierdie toestel';

  @override
  String get introOfflineBody =>
      '\'n Ingeboude kopie van FFmpeg doen al die werk. Jou lêers verlaat nooit die foon nie — omskakeling werk in vliegtuigmodus.';

  @override
  String get introTelemetryTitle => 'Geen telemetrie';

  @override
  String get introTelemetryBody =>
      'Geen rekening, geen ontleding, geen foutverslae nie. Die program weet nie wie jy is nie.';

  @override
  String get introMetadataTitle => 'Metadata onder beheer';

  @override
  String get introMetadataBody =>
      'EXIF, GPS en tydstempels word by verstek uit elke afvoer verwyder. Jy kan dit afskakel.';

  @override
  String get introFreeNote =>
      'Gratis, sonder advertensies en sonder intekeninge. Elke funksie, groepomskakeling ingesluit, is van die begin af joune — die enigste ding wat gekoop kan word, is \'n fooitjie, en dit ontsluit niks.';

  @override
  String get introContinue => 'Kom ons begin';

  @override
  String get modeSimple => 'Eenvoudig';

  @override
  String get modeAdvanced => 'Gevorderd';

  @override
  String get modeAdvancedHint =>
      'Wys elke kodek-, bitspoed- en transformasiebeheer in plaas van die voorinstellingkaarte.';

  @override
  String get presetCompressVideoTitle => 'Verklein video';

  @override
  String get presetCompressVideoBody => 'Veel kleiner MP4, kwaliteit bly goed';

  @override
  String get presetFitToSizeTitle => 'Pas by grootte';

  @override
  String get presetFitToSizeBody =>
      'Tref \'n presiese limiet — Discord, e-pos, geselsies';

  @override
  String get presetCompatibleMp4Title => 'Versoenbare MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Speel oral';

  @override
  String get presetExtractAudioTitle => 'Onttrek klank';

  @override
  String get presetExtractAudioBody => 'MP3 uit enige video';

  @override
  String get presetVideoToGifTitle => 'Video na GIF';

  @override
  String get presetVideoToGifBody => 'Kort greep in \'n geanimeerde GIF';

  @override
  String get presetMergeTitle => 'Voeg video\'s saam';

  @override
  String get presetMergeBody => 'Werk grepe in volgorde saam tot een MP4';

  @override
  String get mergeNeedsTwo => 'Kies ten minste twee video\'s om saam te voeg.';

  @override
  String mergedVideoName(int count) {
    return 'Saamgevoegde video ($count grepe).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Verklein foto';

  @override
  String get presetCompressImageBody => 'Kleiner JPEG, skaars sigbare verlies';

  @override
  String get presetEnhancePhotoTitle => 'Verbeter foto';

  @override
  String get presetEnhancePhotoBody => 'Skoner, skerper, beter kleur';

  @override
  String get presetImageToWebpTitle => 'Foto na WebP';

  @override
  String get presetImageToWebpBody => 'Moderne formaat, kleiner as JPEG';

  @override
  String get sizeTargetTitle => 'Teikengrootte';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Pasgemaak…';

  @override
  String get sizeTargetDialogTitle => 'Teikengrootte in MB';

  @override
  String get sizeTargetTooSmall =>
      'Die teiken is te klein vir hierdie duur; die naaste moontlike kwaliteit sal gebruik word.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per lêer';
  }

  @override
  String estimateTotal(String size) {
    return 'Geskatte afvoer: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lêers gekies',
      one: '1 lêer gekies',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100% aflyn omskakeling';

  @override
  String get promiseBatchFree => 'Groepverwerking is gratis';

  @override
  String get promiseNoWatermark => 'Geen watermerk';

  @override
  String get sectionTransform => 'Transformeer';

  @override
  String get rotateLabel => 'Draai';

  @override
  String get flipLabel => 'Spieël horisontaal';

  @override
  String get speedLabel => 'Spoed';

  @override
  String get cropLabel => 'Sny uit';

  @override
  String get cropHint =>
      'Sny vanaf die middel na die gekose beeldverhouding — vierkantig vir strome, 9:16 vir stories.';

  @override
  String volumeLabel(int percent) {
    return 'Volume: $percent%';
  }

  @override
  String get addAudioFiles => 'Klank en ander lêers';

  @override
  String get hwEncoderLabel => 'Hardeware-enkodering';

  @override
  String get hwEncoderHint =>
      'Gebruik die toestel se videochip in bitspoed- en pas-by-grootte-modusse — baie vinniger en koeler. Kwaliteitmodus (CRF) gebruik altyd die presiese sagteware-enkodeerder, en \'n mislukte hardewaretaak probeer outomaties weer met sagteware.';

  @override
  String get transformNeedsReencode =>
      'Draai, spieël en spoed vereis herenkodering, dus is hulle af tydens \'n stroomkopie.';

  @override
  String get capBitrateLabel => 'Maak die lêer nooit groter nie';

  @override
  String get capBitrateHint =>
      'Beperk die enkodering tot die bron se eie bitspoed. Konstante kwaliteit het geen eie plafon nie, dus kan \'n reeds saamgeperste video andersins groter uitkom.';

  @override
  String get keepSubtitles => 'Behou onderskrifte';

  @override
  String get keepSubtitlesHint =>
      'Dra onderskrifsnitte oor na die afvoer. Slegs teksonderskrifte.';

  @override
  String get sectionTrim => 'Snoei';

  @override
  String get trimEnable => 'Snoei die bron';

  @override
  String get trimHint =>
      'Beskikbaar wanneer presies een lêer met \'n bekende duur in die wagry staan.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Teikengrootte';

  @override
  String get lowBatteryTitle => 'Battery is laag';

  @override
  String get lowBatteryBody =>
      'Omskakeling laat die verwerker hard werk. Jy kan eers inprop, of tog voortgaan.';

  @override
  String get lowBatteryContinue => 'Skakel tog om';

  @override
  String get commonCancel => 'Kanselleer';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lêers ontvang',
      one: '1 lêer ontvang',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Stoor';

  @override
  String get savedToGallery => 'Gestoor in die galery, album “Eluna Media”.';

  @override
  String get savedToDownloads => 'Gestoor in Aflaaie.';

  @override
  String get saveFailed => 'Kon nie die lêer stoor nie.';

  @override
  String get jobRemovedUndo => 'Taak verwyder.';

  @override
  String get finishedClearedUndo => 'Voltooide take skoongemaak.';

  @override
  String get undo => 'Ontdoen';

  @override
  String get errorDetailsTitle => 'Foutbesonderhede';

  @override
  String get sectionConversionPrefs => 'Omskakeling';

  @override
  String get powerModeLabel => 'Kragmodus';

  @override
  String get powerEfficiency => 'Koel en vinnig';

  @override
  String get powerBalanced => 'Gebalanseerd';

  @override
  String get powerQuality => 'Maksimum saampersing';

  @override
  String get powerModeHint =>
      'Hoe hard die video-enkodeerder werk. Koeler en vinniger beteken effens groter lêers. Niks anders word ooit vertraag nie.';

  @override
  String get hapticsLabel => 'Vibrasieterugvoer';

  @override
  String get networkPrivacyTitle => 'Netwerk en privaatheid';

  @override
  String get netAuditIntro =>
      '\'n Volledige lys van alles in hierdie program wat aan die netwerk kan raak.';

  @override
  String get netAuditNoneTitle => 'Geen netwerktoegang hoegenaamd';

  @override
  String get netAuditNoneBody =>
      'Die program vra nie die internettoestemming aan nie, dus kan dit nie die netwerk bereik nie, selfs al sou dit probeer — jy kan dit in die stelsel se programinligting nagaan. Geen advertensies, geen ontleding, geen opdateringkontroles nie. “Beoordeel die program” gee oor aan die winkelprogram, wat sy eie gesprek voer.';

  @override
  String get netAuditConversionTitle => 'Omskakeling';

  @override
  String get netAuditConversionBody =>
      'Loop heeltemal op hierdie toestel deur \'n ingeboude FFmpeg. Skakel vliegtuigmodus aan en skakel om — dit werk.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrie';

  @override
  String get netAuditTelemetryBody =>
      'Daar is geen. Die program versamel geen ontleding, geen foutverslae, geen identifiseerders nie, en het geen rekeningstelsel nie.';

  @override
  String get netAuditTipsTitle => 'Fooitjies';

  @override
  String get netAuditTipsBody =>
      '\'n Fooitjie word deur die Play Store-program uitgevoer, nie deur hierdie een nie — wat steeds geen internettoestemming hou nie. Betaling voeg wel twee reëls by die toestemmingslys: “in-program-aankope”, en “bekyk netwerkverbindings”, wat slegs lees of \'n verbinding bestaan en nie een kan gebruik nie. Niks word ooit outomaties gekoop nie, en \'n fooitjie ontsluit niks: elke funksie hier is gratis.';

  @override
  String get sectionSupport => 'Ondersteuning';

  @override
  String get rateApp => 'Beoordeel die program';

  @override
  String get openLicenses => 'Oopbronlisensies';

  @override
  String get presetAudioToMp3Title => 'Skakel klank om';

  @override
  String get presetAudioToMp3Body => 'Na MP3 — speel op enigiets';

  @override
  String get presetCompressAudioTitle => 'Verklein klank';

  @override
  String get presetCompressAudioBody => 'Ligter AAC — stemnotas, potgooie';

  @override
  String get convertTo => 'Skakel om na';

  @override
  String get formatSectionHint =>
      'Slegs formate wat jou lêers werklik kan word, word gelys.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Klank';

  @override
  String get sourceUnknown => 'Lêer';

  @override
  String get mixedSelectionTitle => 'Verskillende lêertipes gekies';

  @override
  String get mixedSelectionBody =>
      'Elke lêer word met die beste voorinstelling vir sy eie tipe omgeskakel. Voeg een soort op \'n slag by vir volle beheer.';

  @override
  String get filesTitle => 'Lêers';

  @override
  String get removeFile => 'Verwyder';

  @override
  String timeLeft(String time) {
    return '≈ $time oor';
  }

  @override
  String get jobSettingsTitle => 'Omskakelinstellings';

  @override
  String get jobDetails => 'Besonderhede';

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
  String get summaryEnhanced => 'Verbeter';

  @override
  String get summaryMetadataStripped => 'Metadata verwyder';

  @override
  String summaryMerge(int count) {
    return '$count grepe saamgevoeg';
  }

  @override
  String get shareApp => 'Deel die program';

  @override
  String get shareAppText =>
      'Eluna Media — \'n gratis, heeltemal aflyn foto-, video- en klankomskakelaar. Geen intekeninge, geen watermerke, geen rekeninge nie.';

  @override
  String appVersionLabel(String version) {
    return 'Weergawe $version';
  }

  @override
  String get openFile => 'Maak oop';

  @override
  String get openFolder => 'Wys vouer';

  @override
  String get noAppToOpen =>
      'Geen program op hierdie toestel kan daardie lêer oopmaak nie.';

  @override
  String get openFailed => 'Kon nie die lêer oopmaak nie.';

  @override
  String get twoPassLabel => 'Twee deurgange vir presiese grootte';

  @override
  String get twoPassHint =>
      'Pas-by-grootte-take enkodeer twee keer en tref die grepebegroting merkbaar presieser — teen ongeveer dubbel die tyd en batterygebruik.';

  @override
  String get whatsNewTitle => 'Wat is nuut';

  @override
  String get whatsNew1 =>
      'Video kan nou AV1 wees: merkbaar kleiner lêers, as jy daarvoor kan wag.';

  @override
  String get whatsNew2 =>
      'Nuut vir prente: AVIF, omtrent die helfte van \'n JPEG, en geanimeerde WebP in plaas van \'n GIF.';

  @override
  String get whatsNew3 => 'M4A kan verliesloos wees — ALAC sit nou langs AAC.';

  @override
  String get whatsNew4 =>
      'Een skerm vir die voorkoms: helderheid, aksentkleur, pikswart OLED en Material You.';

  @override
  String get whatsNew5 =>
      'Prestasies het medaljes, drie oortjies, en vordering wat jy as \'n prent kan deel.';

  @override
  String get achievementsTitle => 'Prestasies';

  @override
  String achievementsProgress(int done, int total) {
    return '$done van $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Slegs op hierdie toestel getel. Niks word enige plek opgelaai nie.';

  @override
  String get achFirstConversionTitle => 'Eerste treë';

  @override
  String get achFirstConversionBody => 'Skakel jou eerste lêer om.';

  @override
  String get achTenConversionsTitle => 'Opgewarm';

  @override
  String get achTenConversionsBody => 'Skakel 10 lêers om.';

  @override
  String get achFiftyConversionsTitle => 'Gereeld';

  @override
  String get achFiftyConversionsBody => 'Skakel 50 lêers om.';

  @override
  String get achTwoHundredConversionsTitle => 'Werkperd';

  @override
  String get achTwoHundredConversionsBody => 'Skakel 200 lêers om.';

  @override
  String get achThousandConversionsTitle => 'Lopende band';

  @override
  String get achThousandConversionsBody => 'Skakel 1000 lêers om.';

  @override
  String get achSaved100MbTitle => 'Ruimtespaarder';

  @override
  String get achSaved100MbBody => 'Maak altesaam 100 MB vry.';

  @override
  String get achSaved1GbTitle => 'Gigagreepjagter';

  @override
  String get achSaved1GbBody => 'Maak altesaam 1 GB vry.';

  @override
  String get achSaved10GbTitle => 'Bergingsheld';

  @override
  String get achSaved10GbBody => 'Maak altesaam 10 GB vry.';

  @override
  String get achBatchOfFiveTitle => 'Groepwerker';

  @override
  String get achBatchOfFiveBody => 'Voltooi \'n groep van 5 lêers of meer.';

  @override
  String get achBatchOfTwentyTitle => 'Monteerlyn';

  @override
  String get achBatchOfTwentyBody => 'Voltooi \'n groep van 20 lêers of meer.';

  @override
  String get achSniperTitle => 'Skerpskutter';

  @override
  String get achSniperBody => 'Tref \'n presiese grootte met pas-by-grootte.';

  @override
  String get achMemeSmithTitle => 'Meme-smid';

  @override
  String get achMemeSmithBody => 'Verander \'n video in \'n GIF.';

  @override
  String get achSoundHunterTitle => 'Klankjagter';

  @override
  String get achSoundHunterBody => 'Onttrek klank uit \'n video.';

  @override
  String get achSubtitleKeeperTitle => 'Onderskrifbewaarder';

  @override
  String get achSubtitleKeeperBody =>
      'Skakel \'n video om met sy onderskrifte behou.';

  @override
  String get achDirectorTitle => 'Regisseur';

  @override
  String get achDirectorBody =>
      'Pas \'n transformasie toe — draai, uitsny, spoed of volume.';

  @override
  String get achAllRounderTitle => 'Alrounder';

  @override
  String get achAllRounderBody => 'Skakel video, klank en \'n beeld om.';

  @override
  String get achNightOwlTitle => 'Naguil';

  @override
  String get achNightOwlBody =>
      'Voltooi \'n omskakeling tussen middernag en 5 vm.';

  @override
  String get achPlatinumTitle => 'Platinum';

  @override
  String get achPlatinumBody => 'Verdien elke ander prestasie.';

  @override
  String get storageTitle => 'Berging';

  @override
  String get storageBody =>
      'Omgeskakelde lêers bly binne die program totdat jy hulle stoor of deel, waar geen lêerbestuurder hulle kan bereik nie.';

  @override
  String get storageEmpty => 'Niks gestoor nie';

  @override
  String storageUsage(String size) {
    return 'Gestoor: $size';
  }

  @override
  String get storageClearTitle => 'Gestoorde lêers uitvee?';

  @override
  String get storageClearBody =>
      'Vee elke voltooide resultaat uit wat die program steeds hou. Lêers wat jy reeds gestoor of gedeel het, bly onaangeraak.';

  @override
  String get storageClearAction => 'Maak skoon';

  @override
  String storageCleared(String size) {
    return '$size vrygemaak';
  }

  @override
  String get autoSaveLabel => 'Stoor resultate outomaties';

  @override
  String get autoSaveHint =>
      'Plaas elke voltooide lêer in die galery — klank in Aflaaie — sodra dit gereed is.';

  @override
  String get lowSpaceTitle => 'Nie veel ruimte oor nie';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Hierdie groep benodig ongeveer $needed en net $free is vry. Die omskakeling kan halfpad stop.';
  }

  @override
  String saveAll(int count) {
    return 'Stoor almal ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Gestoor: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved van $total gestoor';
  }

  @override
  String get presetFitPhotoTitle => 'Pas foto by grootte';

  @override
  String get presetFitPhotoBody =>
      'Pers \'n prent onder \'n presiese limiet in — oplaaivorms, aansoeke.';

  @override
  String get photoFitHint =>
      'Die program probeer kwaliteite totdat een pas. As die begroting te klein is vir die prent, verklein dit ook die raamgrootte.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Teikengrootte in KB';

  @override
  String get compareAction => 'Vergelyk';

  @override
  String get compareBefore => 'Voor';

  @override
  String get compareAfter => 'Na';

  @override
  String get compareHint => 'Druk en hou om die oorspronklike te sien.';

  @override
  String get trimStart => 'Begin';

  @override
  String get trimEnd => 'Einde';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, tot $duration';
  }

  @override
  String get imageScaleLabel => 'Skaal';

  @override
  String get audioChannelsLabel => 'Kanale';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Monstertempo';

  @override
  String get voiceAudioHint =>
      'Mono teen 22,05 kHz maak \'n stemopname ongeveer \'n kwart so groot sonder hoorbare verlies. Laat albei op oorspronklik vir musiek.';

  @override
  String get moveUp => 'Skuif op';

  @override
  String get moveDown => 'Skuif af';

  @override
  String get renameOutput => 'Hernoem resultaat';

  @override
  String get renameOutputHint => 'Nuwe naam';

  @override
  String get renameOutputHelp =>
      'Die uitbreiding kom van die afvoerformaat. Laat dit leeg om die resultaat na die bron te vernoem.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Vee oorspronklikes uit ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Vee oorspronklikes uit na omskakeling';

  @override
  String get deleteOriginalsHint =>
      'Vra die stelsel om die bronlêers te verwyder sodra die resultaat gestoor is. Die stelsel wys altyd wat sal verdwyn en wag vir jou bevestiging.';

  @override
  String originalsDeleted(String size) {
    return 'Oorspronklikes uitgevee — $size vrygemaak';
  }

  @override
  String get originalsNoneDeleted =>
      'Niks is uitgevee nie. Slegs lêers wat die galery steeds onder hul oorspronklike naam hou, kan gevind word.';

  @override
  String reclaimedTotal(String size) {
    return 'Met hierdie program vrygemaak: $size';
  }

  @override
  String get deleteAllData => 'Vee alle data uit';

  @override
  String get deleteAllDataHint =>
      'Wis alles uit wat die program op hierdie toestel hou: die wagry, omgeskakelde lêers, voorskoue, prestasies en instellings. Lêers wat jy reeds na jou galery gestoor het, bly onaangeraak.';

  @override
  String get codecCopy => 'Kopieer';

  @override
  String get codecCopyRemux => 'Kopieer (remuks)';

  @override
  String get codecNoVideo => 'Geen video';

  @override
  String get codecNoAudio => 'Geen klank';

  @override
  String codecLossless(String codec) {
    return '$codec (verliesloos)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (geanimeer)';
  }

  @override
  String get sizeTargetEmail => 'E-pos';

  @override
  String get trimTimeHint => 'm:ss';
}
