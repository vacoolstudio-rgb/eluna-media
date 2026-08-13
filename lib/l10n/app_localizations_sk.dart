// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class L10nSk extends L10n {
  L10nSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Prevod';

  @override
  String get tabQueue => 'Rad';

  @override
  String get addFiles => 'Pridať súbory';

  @override
  String get emptySelectionTitle => 'Zatiaľ žiadne súbory';

  @override
  String get emptySelectionBody =>
      'Pridajte fotky, videá alebo zvuk. Všetko sa spracuje v tomto zariadení.';

  @override
  String get sectionOutput => 'Výstup';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Zvuk';

  @override
  String get sectionImage => 'Obrázok';

  @override
  String get sectionPrivacy => 'Súkromie';

  @override
  String get outputFormat => 'Formát';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Zvukový kodek';

  @override
  String get rateControl => 'Riadenie dátového toku';

  @override
  String get rateControlQuality => 'Konštantná kvalita (CRF)';

  @override
  String get rateControlBitrate => 'Cieľový dátový tok';

  @override
  String crfLabel(int value) {
    return 'Kvalita (CRF $value)';
  }

  @override
  String get crfHint => 'Nižšia hodnota znamená lepšiu kvalitu a väčší súbor.';

  @override
  String videoBitrate(int value) {
    return 'Dátový tok videa: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Dátový tok zvuku: $value kbps';
  }

  @override
  String get encodingPreset => 'Predvoľba kodéra';

  @override
  String get encodingPresetHint =>
      'Pomalšie predvoľby komprimujú lepšie, ale zariadenie sa viac zahrieva.';

  @override
  String get presetOriginal => 'Pôvodné';

  @override
  String get resolution => 'Rozlíšenie';

  @override
  String get frameRate => 'Snímková frekvencia';

  @override
  String imageQuality(int value) {
    return 'Kvalita: $value';
  }

  @override
  String get lossless => 'Bezstratovo';

  @override
  String get losslessHint => 'Väčšie súbory, výstup zhodný pixel po pixeli.';

  @override
  String get sectionEnhance => 'Vylepšenie';

  @override
  String get sharpenLabel => 'Ostrosť';

  @override
  String get sharpenHint =>
      'Zvýrazní hrany. Rozmazanú alebo nezaostrenú snímku nezachráni — tá informácia v súbore nie je.';

  @override
  String get sharpenStrongHint =>
      'Silné doostrenie môže okolo hrán zanechať svetlé svätožiary. Skúste najprv strednú.';

  @override
  String get denoiseLabel => 'Potlačenie šumu';

  @override
  String get denoiseHint =>
      'Vyčistí zrno v tmavých a nočných fotkách. Príliš silné potlačenie zotrie jemné detaily.';

  @override
  String get autoColorLabel => 'Automatické farby a úrovne';

  @override
  String get autoColorHint => 'Roztiahne kontrast a trochu oživí ploché farby.';

  @override
  String get upscaleLabel => 'Zväčšiť 2×';

  @override
  String get upscaleHint =>
      'Zdvojnásobí šírku aj výšku. Detaily nepridá — pomôže pri tlači alebo oreze.';

  @override
  String get upscaleConflictHint =>
      'Na zväčšenie vráťte Rozlíšenie na Pôvodné.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Vypnuté';

  @override
  String get enhanceLight => 'Slabé';

  @override
  String get enhanceMedium => 'Stredné';

  @override
  String get enhanceStrong => 'Silné';

  @override
  String get stripMetadata => 'Odstrániť metadáta';

  @override
  String get stripMetadataHint =>
      'Z výstupu odstráni EXIF, GPS a časové značky.';

  @override
  String startConversion(int count) {
    return 'Previesť súbory ($count)';
  }

  @override
  String get batchResumed => 'Prerušený prevod pokračuje.';

  @override
  String get converting => 'Prevádza sa…';

  @override
  String get cancelBatch => 'Zastaviť';

  @override
  String get cancelJob => 'Zrušiť';

  @override
  String get clearFinished => 'Vymazať dokončené';

  @override
  String get removeJob => 'Odstrániť';

  @override
  String get shareFile => 'Zdieľať';

  @override
  String get retryJob => 'Skúsiť znova';

  @override
  String get queueEmptyTitle => 'Rad je prázdny';

  @override
  String get queueEmptyBody => 'Súbory pridané na karte Prevod sa objavia tu.';

  @override
  String queueActiveTab(int count) {
    return 'Aktívne · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Dokončené · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nič neprebieha';

  @override
  String get queueNoActiveBody =>
      'Čakajúce a práve prevádzané súbory sa ukážu tu.';

  @override
  String get queueNoFinishedTitle => 'Zatiaľ nič hotové';

  @override
  String get queueNoFinishedBody =>
      'Prevedené súbory pristanú tu, pripravené na otvorenie, uloženie alebo zdieľanie.';

  @override
  String get statusQueued => 'V rade';

  @override
  String get statusRunning => 'Prevádza sa';

  @override
  String get statusCompleted => 'Hotovo';

  @override
  String get statusFailed => 'Zlyhalo';

  @override
  String get statusCancelled => 'Zrušené';

  @override
  String batchSummary(int done, int total) {
    return 'Hotovo $done z $total';
  }

  @override
  String batchCompleted(int done) {
    return 'Prevedené súbory: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Prevedené $done, zlyhalo $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'o $percent % menší';
  }

  @override
  String grewPercent(int percent) {
    return 'o $percent % väčší';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Vzhľad';

  @override
  String get themeSystem => 'Systémový';

  @override
  String get language => 'Jazyk';

  @override
  String get languageSystem => 'Systémový';

  @override
  String get privacyTitle => 'Súkromie';

  @override
  String get privacyBody =>
      'Eluna Media prevádza vaše súbory celé v tomto zariadení pomocou pribalenej kópie FFmpeg. Súbory zariadenie nikdy neopustia, nepotrebujete žiadny účet a žiadna telemetria tu nie je. Nič v aplikácii nepoužíva sieť — nemá ani povolenie na internet.\n\nOdstraňovanie metadát je predvolene zapnuté, takže EXIF, súradnice GPS a časové značky sa z exportovaných súborov odstránia.';

  @override
  String get licenseTitle => 'Licencie';

  @override
  String get licenseBody =>
      'Aplikácia obsahuje FFmpeg zostavený s x264, x265 a ďalšími komponentmi pod GPL, preto sa ako celok šíri pod licenciou GNU GPL v3.';

  @override
  String get sourceMissing => 'Zdrojový súbor už nie je k dispozícii.';

  @override
  String get tabSettings => 'Nastavenia';

  @override
  String get introTitle => 'Súkromie už v základe';

  @override
  String get introOfflineTitle => 'Prevádza v tomto zariadení';

  @override
  String get introOfflineBody =>
      'Všetku prácu odvedie pribalená kópia FFmpeg. Vaše súbory telefón nikdy neopustia — prevod funguje aj v režime lietadlo.';

  @override
  String get introTelemetryTitle => 'Nulová telemetria';

  @override
  String get introTelemetryBody =>
      'Žiadny účet, žiadna analytika, žiadne hlásenia o páde. Aplikácia nevie, kto ste.';

  @override
  String get introMetadataTitle => 'Metadáta pod kontrolou';

  @override
  String get introMetadataBody =>
      'EXIF, GPS a časové značky sa z každého výstupu predvolene odstránia. Môžete to vypnúť.';

  @override
  String get introFreeNote =>
      'Zadarmo, bez reklám a bez predplatného. Všetky funkcie vrátane dávkového prevodu máte od začiatku — kúpiť sa dá jedine prepitné a neodomyká vôbec nič.';

  @override
  String get introContinue => 'Začať';

  @override
  String get modeSimple => 'Jednoduchý';

  @override
  String get modeAdvanced => 'Pokročilý';

  @override
  String get modeAdvancedHint =>
      'Namiesto kariet s predvoľbami zobrazí všetky kodeky, dátové toky a úpravy.';

  @override
  String get presetCompressVideoTitle => 'Zmenšiť video';

  @override
  String get presetCompressVideoBody =>
      'Oveľa menšie MP4, kvalita zostane dobrá';

  @override
  String get presetFitToSizeTitle => 'Zmestiť do veľkosti';

  @override
  String get presetFitToSizeBody =>
      'Trafiť presný limit — Discord, e-mail, chaty';

  @override
  String get presetCompatibleMp4Title => 'Kompatibilné MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Prehrá sa všade';

  @override
  String get presetExtractAudioTitle => 'Vytiahnuť zvuk';

  @override
  String get presetExtractAudioBody => 'MP3 z ľubovoľného videa';

  @override
  String get presetVideoToGifTitle => 'Video na GIF';

  @override
  String get presetVideoToGifBody => 'Krátky klip na animovaný GIF';

  @override
  String get presetMergeTitle => 'Spojiť videá';

  @override
  String get presetMergeBody => 'Zošije klipy do jedného MP4, v poradí';

  @override
  String get mergeNeedsTwo => 'Na spojenie vyberte aspoň dve videá.';

  @override
  String mergedVideoName(int count) {
    return 'Spojené video ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Zmenšiť fotku';

  @override
  String get presetCompressImageBody => 'Menší JPEG, strata sotva viditeľná';

  @override
  String get presetEnhancePhotoTitle => 'Vylepšiť fotku';

  @override
  String get presetEnhancePhotoBody => 'Čistejšia, ostrejšia, lepšie farby';

  @override
  String get presetImageToWebpTitle => 'Fotka na WebP';

  @override
  String get presetImageToWebpBody => 'Moderný formát, menší než JPEG';

  @override
  String get sizeTargetTitle => 'Cieľová veľkosť';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Vlastná…';

  @override
  String get sizeTargetDialogTitle => 'Cieľová veľkosť v MB';

  @override
  String get sizeTargetTooSmall =>
      'Cieľ je na túto dĺžku príliš malý; použije sa najbližšia dosiahnuteľná kvalita.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size na súbor';
  }

  @override
  String estimateTotal(String size) {
    return 'Odhadovaný výstup: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Vybrané súbory: $count';
  }

  @override
  String get promiseOffline => 'Prevod 100% offline';

  @override
  String get promiseBatchFree => 'Dávka je zadarmo';

  @override
  String get promiseNoWatermark => 'Bez vodoznaku';

  @override
  String get sectionTransform => 'Úpravy';

  @override
  String get rotateLabel => 'Otočiť';

  @override
  String get flipLabel => 'Preklopiť vodorovne';

  @override
  String get speedLabel => 'Rýchlosť';

  @override
  String get cropLabel => 'Orez';

  @override
  String get cropHint =>
      'Orez zo stredu na zvolený pomer strán — štvorec pre feedy, 9:16 pre stories.';

  @override
  String volumeLabel(int percent) {
    return 'Hlasitosť: $percent %';
  }

  @override
  String get addAudioFiles => 'Zvuk a ďalšie súbory';

  @override
  String get hwEncoderLabel => 'Hardvérové kódovanie';

  @override
  String get hwEncoderHint =>
      'V režimoch dátového toku a cieľovej veľkosti využíva videočip zariadenia — je to oveľa rýchlejšie a chladnejšie. Režim kvality (CRF) vždy použije presný softvérový kodér a neúspešná hardvérová úloha sa automaticky zopakuje softvérovo.';

  @override
  String get transformNeedsReencode =>
      'Otočenie, preklopenie a rýchlosť vyžadujú nové zakódovanie, takže pri kopírovaní streamu nie sú dostupné.';

  @override
  String get capBitrateLabel => 'Nikdy súbor nezväčšovať';

  @override
  String get capBitrateHint =>
      'Obmedzí kódovanie dátovým tokom samotného zdroja. Konštantná kvalita vlastný strop nemá, takže už raz komprimované video môže inak vyjsť väčšie.';

  @override
  String get keepSubtitles => 'Zachovať titulky';

  @override
  String get keepSubtitlesHint =>
      'Prenesie stopy s titulkami do výstupu. Len textové titulky.';

  @override
  String get sectionTrim => 'Skrátenie';

  @override
  String get trimEnable => 'Skrátiť zdroj';

  @override
  String get trimHint =>
      'Dostupné, keď je v rade práve jeden súbor so známou dĺžkou.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Cieľová veľkosť';

  @override
  String get lowBatteryTitle => 'Batéria je slabá';

  @override
  String get lowBatteryBody =>
      'Prevod poriadne zaťažuje procesor. Môžete najprv pripojiť nabíjačku, alebo napriek tomu pokračovať.';

  @override
  String get lowBatteryContinue => 'Previesť napriek tomu';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Prijaté súbory: $count';
  }

  @override
  String get saveFile => 'Uložiť';

  @override
  String get savedToGallery => 'Uložené do galérie, album „Eluna Media“.';

  @override
  String get savedToDownloads => 'Uložené do priečinka Stiahnuté.';

  @override
  String get saveFailed => 'Súbor sa nepodarilo uložiť.';

  @override
  String get jobRemovedUndo => 'Úloha odstránená.';

  @override
  String get finishedClearedUndo => 'Dokončené úlohy vymazané.';

  @override
  String get undo => 'Späť';

  @override
  String get errorDetailsTitle => 'Podrobnosti chyby';

  @override
  String get sectionConversionPrefs => 'Prevod';

  @override
  String get powerModeLabel => 'Režim výkonu';

  @override
  String get powerEfficiency => 'Chladne a rýchlo';

  @override
  String get powerBalanced => 'Vyvážený';

  @override
  String get powerQuality => 'Maximálna kompresia';

  @override
  String get powerModeHint =>
      'Ako tvrdo pracuje video kodér. Chladnejšie a rýchlejšie znamená o niečo väčšie súbory. Nič iné sa neobmedzuje — nikdy.';

  @override
  String get hapticsLabel => 'Odozva vibrovaním';

  @override
  String get networkPrivacyTitle => 'Sieť a súkromie';

  @override
  String get netAuditIntro =>
      'Úplný zoznam všetkého, čo sa v tejto aplikácii môže dotknúť siete.';

  @override
  String get netAuditNoneTitle => 'Žiadny prístup k sieti';

  @override
  String get netAuditNoneBody =>
      'Aplikácia nežiada povolenie na internet, takže sa na sieť nedostane, ani keby chcela — overíte si to v systémových informáciách o aplikácii. Žiadne reklamy, žiadna analytika, žiadne kontroly aktualizácií. „Ohodnotiť aplikáciu“ odovzdá riadenie aplikácii obchodu, ktorá si komunikáciu obstará sama.';

  @override
  String get netAuditConversionTitle => 'Prevod';

  @override
  String get netAuditConversionBody =>
      'Prebieha celý v tomto zariadení cez pribalený FFmpeg. Zapnite režim lietadlo a preveďte — funguje to.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Žiadna nie je. Aplikácia nezbiera analytiku, hlásenia o páde ani identifikátory a nemá žiadny systém účtov.';

  @override
  String get netAuditTipsTitle => 'Prepitné';

  @override
  String get netAuditTipsBody =>
      'Prepitné vybavuje aplikácia Play Store, nie táto — tá stále nemá povolenie na internet. Platby však pridajú do zoznamu povolení dve položky: „nákupy v aplikácii“ a „zobrazenie sieťových pripojení“, čo len zisťuje, či pripojenie existuje, a použiť ho nedokáže. Nič sa nikdy nekupuje automaticky a prepitné neodomyká nič: všetky funkcie sú tu zadarmo.';

  @override
  String get sectionSupport => 'Podpora';

  @override
  String get rateApp => 'Ohodnotiť aplikáciu';

  @override
  String get openLicenses => 'Licencie otvoreného softvéru';

  @override
  String get presetAudioToMp3Title => 'Previesť zvuk';

  @override
  String get presetAudioToMp3Body => 'Do MP3 — prehrá sa na čomkoľvek';

  @override
  String get presetCompressAudioTitle => 'Zmenšiť zvuk';

  @override
  String get presetCompressAudioBody => 'Úspornejšie AAC — hlasovky, podcasty';

  @override
  String get convertTo => 'Previesť na';

  @override
  String get formatSectionHint =>
      'Ponúkame len formáty, na ktoré sa vaše súbory naozaj dajú previesť.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Fotka';

  @override
  String get sourceAudio => 'Zvuk';

  @override
  String get sourceUnknown => 'Súbor';

  @override
  String get mixedSelectionTitle => 'Vybrané rôzne typy súborov';

  @override
  String get mixedSelectionBody =>
      'Každý súbor sa prevedie s najlepšou predvoľbou pre svoj typ. Pre plnú kontrolu pridávajte vždy len jeden druh.';

  @override
  String get filesTitle => 'Súbory';

  @override
  String get removeFile => 'Odstrániť';

  @override
  String timeLeft(String time) {
    return 'zostáva ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Nastavenia prevodu';

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
  String get summaryEnhanced => 'Vylepšené';

  @override
  String get summaryMetadataStripped => 'Metadáta odstránené';

  @override
  String summaryMerge(int count) {
    return 'Spojené klipy: $count';
  }

  @override
  String get shareApp => 'Zdieľať aplikáciu';

  @override
  String get shareAppText =>
      'Eluna Media — bezplatný, úplne offline prevodník fotiek, videa a zvuku. Bez predplatného, bez vodoznakov, bez účtov.';

  @override
  String appVersionLabel(String version) {
    return 'Verzia $version';
  }

  @override
  String get openFile => 'Otvoriť';

  @override
  String get openFolder => 'Zobraziť priečinok';

  @override
  String get noAppToOpen =>
      'Tento súbor neotvorí žiadna aplikácia v zariadení.';

  @override
  String get openFailed => 'Súbor sa nepodarilo otvoriť.';

  @override
  String get twoPassLabel => 'Dvojprechodovo pre presnú veľkosť';

  @override
  String get twoPassHint =>
      'Úlohy s cieľovou veľkosťou sa kódujú dvakrát a do bajtového rozpočtu sa trafia citeľne presnejšie — za zhruba dvojnásobok času a batérie.';

  @override
  String get whatsNewTitle => 'Novinky';

  @override
  String get whatsNew1 =>
      'Video môže byť po novom AV1: výrazne menšie súbory, ak si na ne počkáte.';

  @override
  String get whatsNew2 =>
      'Nové pre obrázky: AVIF, zhruba polovica JPEG, a animovaný WebP namiesto GIF.';

  @override
  String get whatsNew3 =>
      'M4A vie byť bezstratové — vedľa AAC teraz stojí ALAC.';

  @override
  String get whatsNew4 =>
      'Jedna obrazovka pre vzhľad: jas, farba zvýraznenia, čisto čierna pre OLED a Material You.';

  @override
  String get whatsNew5 =>
      'Úspechy majú medaily, tri karty a postup, ktorý sa dá zdieľať ako obrázok.';

  @override
  String get achievementsTitle => 'Úspechy';

  @override
  String achievementsProgress(int done, int total) {
    return '$done z $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Počíta sa len v tomto zariadení. Nikam sa nič neodosiela.';

  @override
  String get achFirstConversionTitle => 'Prvé kroky';

  @override
  String get achFirstConversionBody => 'Preveďte svoj prvý súbor.';

  @override
  String get achTenConversionsTitle => 'Rozohriate';

  @override
  String get achTenConversionsBody => 'Preveďte 10 súborov.';

  @override
  String get achFiftyConversionsTitle => 'Stály hosť';

  @override
  String get achFiftyConversionsBody => 'Preveďte 50 súborov.';

  @override
  String get achTwoHundredConversionsTitle => 'Ťahúň';

  @override
  String get achTwoHundredConversionsBody => 'Preveďte 200 súborov.';

  @override
  String get achThousandConversionsTitle => 'Pásová výroba';

  @override
  String get achThousandConversionsBody => 'Preveďte 1000 súborov.';

  @override
  String get achSaved100MbTitle => 'Šetrič miesta';

  @override
  String get achSaved100MbBody => 'Uvoľnite celkovo 100 MB.';

  @override
  String get achSaved1GbTitle => 'Lovec gigabajtov';

  @override
  String get achSaved1GbBody => 'Uvoľnite celkovo 1 GB.';

  @override
  String get achSaved10GbTitle => 'Hrdina úložiska';

  @override
  String get achSaved10GbBody => 'Uvoľnite celkovo 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Dávkar';

  @override
  String get achBatchOfFiveBody => 'Dokončite dávku 5 a viac súborov.';

  @override
  String get achBatchOfTwentyTitle => 'Výrobná linka';

  @override
  String get achBatchOfTwentyBody => 'Dokončite dávku 20 a viac súborov.';

  @override
  String get achSniperTitle => 'Odstreľovač';

  @override
  String get achSniperBody =>
      'Trafte presnú veľkosť režimom cieľovej veľkosti.';

  @override
  String get achMemeSmithTitle => 'Kováč mémov';

  @override
  String get achMemeSmithBody => 'Urobte z videa GIF.';

  @override
  String get achSoundHunterTitle => 'Lovec zvuku';

  @override
  String get achSoundHunterBody => 'Vytiahnite z videa zvuk.';

  @override
  String get achSubtitleKeeperTitle => 'Strážca titulkov';

  @override
  String get achSubtitleKeeperBody =>
      'Preveďte video so zachovanými titulkami.';

  @override
  String get achDirectorTitle => 'Režisér';

  @override
  String get achDirectorBody =>
      'Použite úpravu — otočenie, orez, rýchlosť alebo hlasitosť.';

  @override
  String get achAllRounderTitle => 'Všestranný';

  @override
  String get achAllRounderBody => 'Preveďte video, zvuk aj obrázok.';

  @override
  String get achNightOwlTitle => 'Nočná sova';

  @override
  String get achNightOwlBody =>
      'Dokončite prevod medzi polnocou a piatou hodinou rannou.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Získajte všetky ostatné úspechy.';

  @override
  String get storageTitle => 'Úložisko';

  @override
  String get storageBody =>
      'Prevedené súbory zostávajú vnútri aplikácie, kam žiadny správca súborov nedosiahne, kým ich neuložíte alebo nezdieľate.';

  @override
  String get storageEmpty => 'Nič uložené';

  @override
  String storageUsage(String size) {
    return 'Uložené: $size';
  }

  @override
  String get storageClearTitle => 'Vymazať uložené súbory?';

  @override
  String get storageClearBody =>
      'Zmaže všetky dokončené výsledky, ktoré aplikácia ešte drží. Súborov, ktoré ste už uložili alebo zdieľali, sa to netýka.';

  @override
  String get storageClearAction => 'Vymazať';

  @override
  String storageCleared(String size) {
    return 'Uvoľnené $size';
  }

  @override
  String get autoSaveLabel => 'Ukladať výsledky automaticky';

  @override
  String get autoSaveHint =>
      'Každý hotový súbor uloží do galérie — zvuk do priečinka Stiahnuté — hneď ako je pripravený.';

  @override
  String get lowSpaceTitle => 'Zostáva málo miesta';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Táto dávka potrebuje asi $needed a voľných je len $free. Prevod sa môže v polovici zastaviť.';
  }

  @override
  String saveAll(int count) {
    return 'Uložiť všetko ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Uložené: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Uložené $saved z $total';
  }

  @override
  String get presetFitPhotoTitle => 'Zmestiť fotku do veľkosti';

  @override
  String get presetFitPhotoBody =>
      'Stlačte obrázok pod presný limit — formuláre na nahrávanie, žiadosti.';

  @override
  String get photoFitHint =>
      'Aplikácia skúša kvality, kým sa jedna nezmestí. Ak je rozpočet na obrázok príliš malý, zmenší aj rozmery snímky.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Cieľová veľkosť v KB';

  @override
  String get compareAction => 'Porovnať';

  @override
  String get compareBefore => 'Pred';

  @override
  String get compareAfter => 'Po';

  @override
  String get compareHint => 'Podržaním zobrazíte originál.';

  @override
  String get trimStart => 'Začiatok';

  @override
  String get trimEnd => 'Koniec';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, najviac do $duration';
  }

  @override
  String get imageScaleLabel => 'Mierka';

  @override
  String get audioChannelsLabel => 'Kanály';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Vzorkovacia frekvencia';

  @override
  String get voiceAudioHint =>
      'Mono na 22,05 kHz zmenší hlasovú nahrávku zhruba na štvrtinu bez počuteľnej straty. Pri hudbe nechajte oboje pôvodné.';

  @override
  String get moveUp => 'Posunúť nahor';

  @override
  String get moveDown => 'Posunúť nadol';

  @override
  String get renameOutput => 'Premenovať výsledok';

  @override
  String get renameOutputHint => 'Nový názov';

  @override
  String get renameOutputHelp =>
      'Príponu určuje výstupný formát. Ak pole necháte prázdne, výsledok sa pomenuje podľa zdroja.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Zmazať originály ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Mazať originály po prevode';

  @override
  String get deleteOriginalsHint =>
      'Požiada systém o odstránenie zdrojových súborov, hneď ako sa výsledok uloží. Systém vždy ukáže, čo zmizne, a počká na vaše potvrdenie.';

  @override
  String originalsDeleted(String size) {
    return 'Originály zmazané — uvoľnené $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Nič sa nezmazalo. Nájsť sa dajú len súbory, ktoré galéria stále vedie pod pôvodným názvom.';

  @override
  String reclaimedTotal(String size) {
    return 'Uvoľnené touto aplikáciou: $size';
  }

  @override
  String get deleteAllData => 'Zmazať všetky údaje';

  @override
  String get deleteAllDataHint =>
      'Vymaže všetko, čo si aplikácia v tomto zariadení drží: rad, prevedené súbory, náhľady, úspechy a nastavenia. Súborov, ktoré ste už uložili do galérie, sa to netýka.';

  @override
  String get codecCopy => 'Kopírovať';

  @override
  String get codecCopyRemux => 'Kopírovať (remux)';

  @override
  String get codecNoVideo => 'Bez videa';

  @override
  String get codecNoAudio => 'Bez zvuku';

  @override
  String codecLossless(String codec) {
    return '$codec (bezstratovo)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animovaný)';
  }

  @override
  String get sizeTargetEmail => 'E-mail';

  @override
  String get trimTimeHint => 'm:ss';
}
