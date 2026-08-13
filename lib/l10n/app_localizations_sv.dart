// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class L10nSv extends L10n {
  L10nSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konvertera';

  @override
  String get tabQueue => 'Kö';

  @override
  String get addFiles => 'Lägg till filer';

  @override
  String get emptySelectionTitle => 'Inga filer än';

  @override
  String get emptySelectionBody =>
      'Lägg till foton, videor eller ljud. Allt bearbetas på den här enheten.';

  @override
  String get sectionOutput => 'Utdata';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Ljud';

  @override
  String get sectionImage => 'Bild';

  @override
  String get sectionPrivacy => 'Integritet';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Ljudkodek';

  @override
  String get rateControl => 'Bithastighetsstyrning';

  @override
  String get rateControlQuality => 'Konstant kvalitet (CRF)';

  @override
  String get rateControlBitrate => 'Målbithastighet';

  @override
  String crfLabel(int value) {
    return 'Kvalitet (CRF $value)';
  }

  @override
  String get crfHint => 'Lägre ger bättre kvalitet och en större fil.';

  @override
  String videoBitrate(int value) {
    return 'Videobithastighet: $value kbit/s';
  }

  @override
  String audioBitrate(int value) {
    return 'Ljudbithastighet: $value kbit/s';
  }

  @override
  String get encodingPreset => 'Kodarförval';

  @override
  String get encodingPresetHint =>
      'Långsammare förval komprimerar bättre men värmer enheten mer.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Upplösning';

  @override
  String get frameRate => 'Bildfrekvens';

  @override
  String imageQuality(int value) {
    return 'Kvalitet: $value';
  }

  @override
  String get lossless => 'Förlustfri';

  @override
  String get losslessHint => 'Större filer, pixelperfekt resultat.';

  @override
  String get sectionEnhance => 'Förbättring';

  @override
  String get sharpenLabel => 'Skärpa';

  @override
  String get sharpenHint =>
      'Gör kanterna tydligare. Det kan inte rädda en suddig eller oskarp bild — de detaljerna finns inte i filen.';

  @override
  String get sharpenStrongHint =>
      'Kraftig skärpa kan lämna ljusa kanter. Prova medel först.';

  @override
  String get denoiseLabel => 'Brusreducering';

  @override
  String get denoiseHint =>
      'Städar bort brus i mörka bilder och nattbilder. För mycket suddar ut fina detaljer.';

  @override
  String get autoColorLabel => 'Automatisk färg och nivåer';

  @override
  String get autoColorHint =>
      'Sträcker ut kontrasten och lyfter platta färger något.';

  @override
  String get upscaleLabel => 'Förstora 2×';

  @override
  String get upscaleHint =>
      'Dubblar bredd och höjd. Det tillför inga detaljer — men hjälper vid utskrift eller beskärning.';

  @override
  String get upscaleConflictHint =>
      'Ställ tillbaka Upplösning på Original för att kunna förstora.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Av';

  @override
  String get enhanceLight => 'Lätt';

  @override
  String get enhanceMedium => 'Medel';

  @override
  String get enhanceStrong => 'Kraftig';

  @override
  String get stripMetadata => 'Ta bort metadata';

  @override
  String get stripMetadataHint =>
      'Rensar EXIF, GPS och tidsstämplar från resultatet.';

  @override
  String startConversion(int count) {
    return 'Konvertera $count filer';
  }

  @override
  String get batchResumed => 'Den avbrutna konverteringen återupptogs.';

  @override
  String get converting => 'Konverterar…';

  @override
  String get cancelBatch => 'Stoppa';

  @override
  String get cancelJob => 'Avbryt';

  @override
  String get clearFinished => 'Rensa klara';

  @override
  String get removeJob => 'Ta bort';

  @override
  String get shareFile => 'Dela';

  @override
  String get retryJob => 'Försök igen';

  @override
  String get queueEmptyTitle => 'Kön är tom';

  @override
  String get queueEmptyBody =>
      'Filer du lägger till under Konvertera dyker upp här.';

  @override
  String queueActiveTab(int count) {
    return 'Aktiva · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Klara · $count';
  }

  @override
  String get queueNoActiveTitle => 'Inget pågår';

  @override
  String get queueNoActiveBody =>
      'Filer som väntar eller konverteras visas här.';

  @override
  String get queueNoFinishedTitle => 'Inget klart än';

  @override
  String get queueNoFinishedBody =>
      'Konverterade filer hamnar här, redo att öppnas, sparas eller delas.';

  @override
  String get statusQueued => 'I kö';

  @override
  String get statusRunning => 'Konverterar';

  @override
  String get statusCompleted => 'Klar';

  @override
  String get statusFailed => 'Misslyckades';

  @override
  String get statusCancelled => 'Avbruten';

  @override
  String batchSummary(int done, int total) {
    return '$done av $total klara';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done filer konverterade',
      one: '1 fil konverterad',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done konverterade, $failed misslyckades.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% mindre';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% större';
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
  String get privacyTitle => 'Integritet';

  @override
  String get privacyBody =>
      'Eluna Media konverterar dina filer helt på den här enheten med en medföljande kopia av FFmpeg. Dina filer lämnar aldrig enheten, inget konto krävs och det finns ingen telemetri. Ingenting i appen använder nätverket över huvud taget — den har inte ens internetbehörigheten.\n\nBorttagning av metadata är på som standard, så EXIF, GPS-koordinater och tidsstämplar tas bort från filerna du exporterar.';

  @override
  String get licenseTitle => 'Licenser';

  @override
  String get licenseBody =>
      'Appen innehåller FFmpeg byggt med x264, x265 och andra GPL-komponenter, så programmet som helhet distribueras under GNU GPL v3.';

  @override
  String get sourceMissing => 'Källfilen finns inte längre.';

  @override
  String get tabSettings => 'Inställningar';

  @override
  String get introTitle => 'Privat från grunden';

  @override
  String get introOfflineTitle => 'Konverterar på den här enheten';

  @override
  String get introOfflineBody =>
      'En medföljande kopia av FFmpeg gör hela jobbet. Dina filer lämnar aldrig telefonen — konvertering fungerar i flygplansläge.';

  @override
  String get introTelemetryTitle => 'Noll telemetri';

  @override
  String get introTelemetryBody =>
      'Inget konto, ingen analys, ingen kraschrapportering. Appen vet inte vem du är.';

  @override
  String get introMetadataTitle => 'Metadata under kontroll';

  @override
  String get introMetadataBody =>
      'EXIF, GPS och tidsstämplar tas bort från allt som skapas, som standard. Du kan stänga av det.';

  @override
  String get introFreeNote =>
      'Gratis, utan reklam och utan prenumerationer. Varje funktion, batchkonvertering inräknad, är din från början — det enda som går att köpa är en dricks, och den låser inte upp någonting.';

  @override
  String get introContinue => 'Kom igång';

  @override
  String get modeSimple => 'Enkelt';

  @override
  String get modeAdvanced => 'Avancerat';

  @override
  String get modeAdvancedHint =>
      'Visa alla kodekar, bithastigheter och transformationer i stället för förvalskorten.';

  @override
  String get presetCompressVideoTitle => 'Komprimera video';

  @override
  String get presetCompressVideoBody => 'Mycket mindre MP4, kvaliteten håller';

  @override
  String get presetFitToSizeTitle => 'Anpassa till storlek';

  @override
  String get presetFitToSizeBody =>
      'Träffa en exakt gräns — Discord, e-post, chattar';

  @override
  String get presetCompatibleMp4Title => 'Kompatibel MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Spelas överallt';

  @override
  String get presetExtractAudioTitle => 'Extrahera ljud';

  @override
  String get presetExtractAudioBody => 'MP3 ur vilken video som helst';

  @override
  String get presetVideoToGifTitle => 'Video till GIF';

  @override
  String get presetVideoToGifBody => 'Kort klipp till animerad GIF';

  @override
  String get presetMergeTitle => 'Slå ihop videor';

  @override
  String get presetMergeBody => 'Foga ihop klipp till en MP4, i ordning';

  @override
  String get mergeNeedsTwo => 'Välj minst två videor för att slå ihop.';

  @override
  String mergedVideoName(int count) {
    return 'Sammanfogad video ($count klipp).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Komprimera foto';

  @override
  String get presetCompressImageBody => 'Mindre JPEG, knappt synlig förlust';

  @override
  String get presetEnhancePhotoTitle => 'Förbättra foto';

  @override
  String get presetEnhancePhotoBody => 'Renare, skarpare, bättre färg';

  @override
  String get presetImageToWebpTitle => 'Foto till WebP';

  @override
  String get presetImageToWebpBody => 'Modernt format, mindre än JPEG';

  @override
  String get sizeTargetTitle => 'Målstorlek';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Anpassad…';

  @override
  String get sizeTargetDialogTitle => 'Målstorlek i MB';

  @override
  String get sizeTargetTooSmall =>
      'Målet är för litet för den här längden; närmast möjliga kvalitet används.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per fil';
  }

  @override
  String estimateTotal(String size) {
    return 'Uppskattat resultat: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer valda',
      one: '1 fil vald',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100 % offlinekonvertering';

  @override
  String get promiseBatchFree => 'Batch är gratis';

  @override
  String get promiseNoWatermark => 'Ingen vattenstämpel';

  @override
  String get sectionTransform => 'Transformera';

  @override
  String get rotateLabel => 'Rotera';

  @override
  String get flipLabel => 'Spegla vågrätt';

  @override
  String get speedLabel => 'Hastighet';

  @override
  String get cropLabel => 'Beskär';

  @override
  String get cropHint =>
      'Beskär från mitten till valt bildförhållande — kvadrat för flöden, 9:16 för stories.';

  @override
  String volumeLabel(int percent) {
    return 'Volym: $percent%';
  }

  @override
  String get addAudioFiles => 'Ljud och andra filer';

  @override
  String get hwEncoderLabel => 'Hårdvarukodning';

  @override
  String get hwEncoderHint =>
      'Använder enhetens videochip i lägena bithastighet och anpassa till storlek — mycket snabbare och svalare. Kvalitetsläget (CRF) använder alltid den exakta mjukvarukodaren, och ett misslyckat hårdvarujobb görs automatiskt om i mjukvara.';

  @override
  String get transformNeedsReencode =>
      'Rotation, spegling och hastighet kräver omkodning och är därför av vid strömkopiering.';

  @override
  String get capBitrateLabel => 'Gör aldrig filen större';

  @override
  String get capBitrateHint =>
      'Begränsar kodningen till källans egen bithastighet. Konstant kvalitet har inget eget tak, så en redan komprimerad video kan annars bli större.';

  @override
  String get keepSubtitles => 'Behåll undertexter';

  @override
  String get keepSubtitlesHint =>
      'Tar med undertextspår till resultatet. Endast textbaserade undertexter.';

  @override
  String get sectionTrim => 'Klipp';

  @override
  String get trimEnable => 'Klipp källan';

  @override
  String get trimHint =>
      'Tillgängligt när exakt en fil med känd längd ligger i kön.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Målstorlek';

  @override
  String get lowBatteryTitle => 'Låg batterinivå';

  @override
  String get lowBatteryBody =>
      'Konvertering belastar processorn hårt. Du kan ladda först, eller fortsätta ändå.';

  @override
  String get lowBatteryContinue => 'Konvertera ändå';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer mottagna',
      one: '1 fil mottagen',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Spara';

  @override
  String get savedToGallery => 'Sparad i galleriet, albumet ”Eluna Media”.';

  @override
  String get savedToDownloads => 'Sparad i Nedladdningar.';

  @override
  String get saveFailed => 'Kunde inte spara filen.';

  @override
  String get jobRemovedUndo => 'Jobbet togs bort.';

  @override
  String get finishedClearedUndo => 'Klara jobb rensades.';

  @override
  String get undo => 'Ångra';

  @override
  String get errorDetailsTitle => 'Felinformation';

  @override
  String get sectionConversionPrefs => 'Konvertering';

  @override
  String get powerModeLabel => 'Energiläge';

  @override
  String get powerEfficiency => 'Svalt och snabbt';

  @override
  String get powerBalanced => 'Balanserat';

  @override
  String get powerQuality => 'Maximal komprimering';

  @override
  String get powerModeHint =>
      'Hur hårt videokodaren jobbar. Svalare och snabbare betyder något större filer. Inget annat stryps — någonsin.';

  @override
  String get hapticsLabel => 'Vibrationsåterkoppling';

  @override
  String get networkPrivacyTitle => 'Nätverk och integritet';

  @override
  String get netAuditIntro =>
      'En fullständig lista över allt i den här appen som kan röra nätverket.';

  @override
  String get netAuditNoneTitle => 'Ingen nätverksåtkomst alls';

  @override
  String get netAuditNoneBody =>
      'Appen begär inte internetbehörigheten och kan därför inte nå nätverket ens om den försökte — det kan du kontrollera i systemets appinformation. Ingen reklam, ingen analys, inga uppdateringskontroller. ”Betygsätt appen” lämnar över till butiksappen, som sköter pratet själv.';

  @override
  String get netAuditConversionTitle => 'Konvertering';

  @override
  String get netAuditConversionBody =>
      'Körs helt på den här enheten via ett medföljande FFmpeg. Slå på flygplansläge och konvertera — det fungerar.';

  @override
  String get netAuditTelemetryTitle => 'Telemetri';

  @override
  String get netAuditTelemetryBody =>
      'Den finns inte. Appen samlar ingen analysdata, inga kraschrapporter, inga identifierare, och har inget kontosystem.';

  @override
  String get netAuditTipsTitle => 'Dricks';

  @override
  String get netAuditTipsBody =>
      'En dricks hanteras av Play Butik-appen, inte av den här — som fortfarande saknar internetbehörighet. Betalningen lägger dock till två rader i behörighetslistan: ”köp i appen” och ”se nätverksanslutningar”, som bara läser om det finns en anslutning och inte kan använda den. Ingenting köps automatiskt, och en dricks låser inte upp något: allt här är gratis.';

  @override
  String get sectionSupport => 'Support';

  @override
  String get rateApp => 'Betygsätt appen';

  @override
  String get openLicenses => 'Licenser för öppen källkod';

  @override
  String get presetAudioToMp3Title => 'Konvertera ljud';

  @override
  String get presetAudioToMp3Body => 'Till MP3 — spelas på allt';

  @override
  String get presetCompressAudioTitle => 'Komprimera ljud';

  @override
  String get presetCompressAudioBody =>
      'Snålare AAC — röstanteckningar, poddar';

  @override
  String get convertTo => 'Konvertera till';

  @override
  String get formatSectionHint =>
      'Bara format som dina filer faktiskt kan bli listas.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Ljud';

  @override
  String get sourceUnknown => 'Fil';

  @override
  String get mixedSelectionTitle => 'Olika filtyper valda';

  @override
  String get mixedSelectionBody =>
      'Varje fil konverteras med det bästa förvalet för sin egen typ. Lägg till en sort i taget för full kontroll.';

  @override
  String get filesTitle => 'Filer';

  @override
  String get removeFile => 'Ta bort';

  @override
  String timeLeft(String time) {
    return '≈ $time kvar';
  }

  @override
  String get jobSettingsTitle => 'Konverteringsinställningar';

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
  String get summaryEnhanced => 'Förbättrad';

  @override
  String get summaryMetadataStripped => 'Metadata borttagen';

  @override
  String summaryMerge(int count) {
    return '$count klipp sammanfogade';
  }

  @override
  String get shareApp => 'Dela appen';

  @override
  String get shareAppText =>
      'Eluna Media — en gratis, helt offline foto-, video- och ljudkonverterare. Inga prenumerationer, inga vattenstämplar, inga konton.';

  @override
  String appVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get openFile => 'Öppna';

  @override
  String get openFolder => 'Visa mapp';

  @override
  String get noAppToOpen => 'Ingen app på enheten kan öppna den filen.';

  @override
  String get openFailed => 'Kunde inte öppna filen.';

  @override
  String get twoPassLabel => 'Två pass för exakt storlek';

  @override
  String get twoPassHint =>
      'Jobb med anpassa till storlek kodas två gånger och träffar bytebudgeten märkbart mer exakt — till ungefär dubbla tiden och batteriet.';

  @override
  String get whatsNewTitle => 'Nyheter';

  @override
  String get whatsNew1 =>
      'Video kan nu vara AV1: märkbart mindre filer, om du kan vänta på dem.';

  @override
  String get whatsNew2 =>
      'Nytt för bilder: AVIF, ungefär halva en JPEG, och animerad WebP i stället för GIF.';

  @override
  String get whatsNew3 => 'M4A kan vara förlustfri — ALAC står nu bredvid AAC.';

  @override
  String get whatsNew4 =>
      'En skärm för utseendet: ljusstyrka, accentfärg, helsvart OLED och Material You.';

  @override
  String get whatsNew5 =>
      'Prestationer har medaljer, tre flikar och framsteg du kan dela som bild.';

  @override
  String get achievementsTitle => 'Prestationer';

  @override
  String achievementsProgress(int done, int total) {
    return '$done av $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Räknas bara på den här enheten. Ingenting laddas upp någonstans.';

  @override
  String get achFirstConversionTitle => 'Första stegen';

  @override
  String get achFirstConversionBody => 'Konvertera din första fil.';

  @override
  String get achTenConversionsTitle => 'Uppvärmd';

  @override
  String get achTenConversionsBody => 'Konvertera 10 filer.';

  @override
  String get achFiftyConversionsTitle => 'Stammis';

  @override
  String get achFiftyConversionsBody => 'Konvertera 50 filer.';

  @override
  String get achTwoHundredConversionsTitle => 'Arbetshäst';

  @override
  String get achTwoHundredConversionsBody => 'Konvertera 200 filer.';

  @override
  String get achThousandConversionsTitle => 'Löpande band';

  @override
  String get achThousandConversionsBody => 'Konvertera 1000 filer.';

  @override
  String get achSaved100MbTitle => 'Utrymmessparare';

  @override
  String get achSaved100MbBody => 'Frigör 100 MB totalt.';

  @override
  String get achSaved1GbTitle => 'Gigabytejägare';

  @override
  String get achSaved1GbBody => 'Frigör 1 GB totalt.';

  @override
  String get achSaved10GbTitle => 'Lagringshjälte';

  @override
  String get achSaved10GbBody => 'Frigör 10 GB totalt.';

  @override
  String get achBatchOfFiveTitle => 'Batcharbetare';

  @override
  String get achBatchOfFiveBody => 'Slutför en batch med 5 filer eller fler.';

  @override
  String get achBatchOfTwentyTitle => 'Löpande bandet';

  @override
  String get achBatchOfTwentyBody =>
      'Slutför en batch med 20 filer eller fler.';

  @override
  String get achSniperTitle => 'Prickskytt';

  @override
  String get achSniperBody =>
      'Träffa en exakt storlek med anpassa till storlek.';

  @override
  String get achMemeSmithTitle => 'Memesmed';

  @override
  String get achMemeSmithBody => 'Gör en GIF av en video.';

  @override
  String get achSoundHunterTitle => 'Ljudjägare';

  @override
  String get achSoundHunterBody => 'Extrahera ljudet ur en video.';

  @override
  String get achSubtitleKeeperTitle => 'Undertextvårdare';

  @override
  String get achSubtitleKeeperBody =>
      'Konvertera en video med undertexterna kvar.';

  @override
  String get achDirectorTitle => 'Regissör';

  @override
  String get achDirectorBody =>
      'Använd en transformation — rotera, beskär, hastighet eller volym.';

  @override
  String get achAllRounderTitle => 'Allkonstnär';

  @override
  String get achAllRounderBody => 'Konvertera video, ljud och en bild.';

  @override
  String get achNightOwlTitle => 'Nattuggla';

  @override
  String get achNightOwlBody =>
      'Slutför en konvertering mellan midnatt och klockan fem.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Ta alla andra prestationer.';

  @override
  String get storageTitle => 'Lagring';

  @override
  String get storageBody =>
      'Konverterade filer stannar i appen tills du sparar eller delar dem, där ingen filhanterare når dem.';

  @override
  String get storageEmpty => 'Inget lagrat';

  @override
  String storageUsage(String size) {
    return 'Lagrat: $size';
  }

  @override
  String get storageClearTitle => 'Rensa lagrade filer?';

  @override
  String get storageClearBody =>
      'Tar bort alla färdiga resultat som appen fortfarande håller. Filer du redan sparat eller delat rörs inte.';

  @override
  String get storageClearAction => 'Rensa';

  @override
  String storageCleared(String size) {
    return 'Frigjorde $size';
  }

  @override
  String get autoSaveLabel => 'Spara resultat automatiskt';

  @override
  String get autoSaveHint =>
      'Lägger varje färdig fil i galleriet — ljud i Nedladdningar — så snart den är klar.';

  @override
  String get lowSpaceTitle => 'Inte mycket plats kvar';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Den här batchen behöver ungefär $needed och bara $free är ledigt. Konverteringen kan avbrytas på vägen.';
  }

  @override
  String saveAll(int count) {
    return 'Spara alla ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Sparade: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Sparade $saved av $total';
  }

  @override
  String get presetFitPhotoTitle => 'Anpassa foto till storlek';

  @override
  String get presetFitPhotoBody =>
      'Pressa en bild under en exakt gräns — uppladdningsformulär, ansökningar.';

  @override
  String get photoFitHint =>
      'Appen provar kvaliteter tills en får plats. Om budgeten är för liten för bilden minskar den även bildstorleken.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Målstorlek i KB';

  @override
  String get compareAction => 'Jämför';

  @override
  String get compareBefore => 'Före';

  @override
  String get compareAfter => 'Efter';

  @override
  String get compareHint => 'Håll in för att se originalet.';

  @override
  String get trimStart => 'Start';

  @override
  String get trimEnd => 'Slut';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, upp till $duration';
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
      'Mono vid 22,05 kHz gör en röstinspelning ungefär en fjärdedel så stor utan hörbar förlust. Låt båda stå på original för musik.';

  @override
  String get moveUp => 'Flytta upp';

  @override
  String get moveDown => 'Flytta ner';

  @override
  String get renameOutput => 'Byt namn på resultatet';

  @override
  String get renameOutputHint => 'Nytt namn';

  @override
  String get renameOutputHelp =>
      'Filändelsen kommer från utdataformatet. Lämna tomt för att döpa resultatet efter källan.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Ta bort originalen ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Ta bort originalen efter konvertering';

  @override
  String get deleteOriginalsHint =>
      'Ber systemet ta bort källfilerna när resultatet har sparats. Systemet visar alltid vad som försvinner och väntar på din bekräftelse.';

  @override
  String originalsDeleted(String size) {
    return 'Originalen togs bort — $size frigjordes';
  }

  @override
  String get originalsNoneDeleted =>
      'Ingenting togs bort. Bara filer som galleriet fortfarande har kvar under sitt ursprungliga namn går att hitta.';

  @override
  String reclaimedTotal(String size) {
    return 'Frigjort med den här appen: $size';
  }

  @override
  String get deleteAllData => 'Ta bort alla data';

  @override
  String get deleteAllDataHint =>
      'Raderar allt appen sparar på enheten: kön, konverterade filer, förhandsvisningar, prestationer och inställningar. Filer du redan sparat i galleriet lämnas i fred.';

  @override
  String get codecCopy => 'Kopiera';

  @override
  String get codecCopyRemux => 'Kopiera (remux)';

  @override
  String get codecNoVideo => 'Ingen video';

  @override
  String get codecNoAudio => 'Inget ljud';

  @override
  String codecLossless(String codec) {
    return '$codec (förlustfri)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animerad)';
  }

  @override
  String get sizeTargetEmail => 'E-post';

  @override
  String get trimTimeHint => 'm:ss';
}
