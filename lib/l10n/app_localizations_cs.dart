// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class L10nCs extends L10n {
  L10nCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Převod';

  @override
  String get tabQueue => 'Fronta';

  @override
  String get addFiles => 'Přidat soubory';

  @override
  String get emptySelectionTitle => 'Zatím žádné soubory';

  @override
  String get emptySelectionBody =>
      'Přidejte fotky, videa nebo zvuk. Vše se zpracuje v tomto zařízení.';

  @override
  String get sectionOutput => 'Výstup';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Zvuk';

  @override
  String get sectionImage => 'Obrázek';

  @override
  String get sectionPrivacy => 'Soukromí';

  @override
  String get outputFormat => 'Formát';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Zvukový kodek';

  @override
  String get rateControl => 'Řízení datového toku';

  @override
  String get rateControlQuality => 'Konstantní kvalita (CRF)';

  @override
  String get rateControlBitrate => 'Cílový datový tok';

  @override
  String crfLabel(int value) {
    return 'Kvalita (CRF $value)';
  }

  @override
  String get crfHint => 'Nižší hodnota znamená lepší kvalitu a větší soubor.';

  @override
  String videoBitrate(int value) {
    return 'Datový tok videa: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Datový tok zvuku: $value kbps';
  }

  @override
  String get encodingPreset => 'Předvolba kodéru';

  @override
  String get encodingPresetHint =>
      'Pomalejší předvolby komprimují lépe, ale zařízení se víc zahřívá.';

  @override
  String get presetOriginal => 'Původní';

  @override
  String get resolution => 'Rozlišení';

  @override
  String get frameRate => 'Snímková frekvence';

  @override
  String imageQuality(int value) {
    return 'Kvalita: $value';
  }

  @override
  String get lossless => 'Bezztrátově';

  @override
  String get losslessHint => 'Větší soubory, výstup shodný pixel po pixelu.';

  @override
  String get sectionEnhance => 'Vylepšení';

  @override
  String get sharpenLabel => 'Ostrost';

  @override
  String get sharpenHint =>
      'Zvýrazní hrany. Rozmazaný nebo neostrý snímek nezachrání — ta informace v souboru není.';

  @override
  String get sharpenStrongHint =>
      'Silné doostření může kolem hran zanechat světlé svatozáře. Zkuste nejdřív střední.';

  @override
  String get denoiseLabel => 'Potlačení šumu';

  @override
  String get denoiseHint =>
      'Vyčistí zrno v tmavých a nočních fotkách. Příliš silné potlačení setře jemné detaily.';

  @override
  String get autoColorLabel => 'Automatické barvy a úrovně';

  @override
  String get autoColorHint => 'Roztáhne kontrast a trochu oživí ploché barvy.';

  @override
  String get upscaleLabel => 'Zvětšit 2×';

  @override
  String get upscaleHint =>
      'Zdvojnásobí šířku i výšku. Detaily nepřidá — pomůže při tisku nebo ořezu.';

  @override
  String get upscaleConflictHint => 'Pro zvětšení vraťte Rozlišení na Původní.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Vypnuto';

  @override
  String get enhanceLight => 'Slabé';

  @override
  String get enhanceMedium => 'Střední';

  @override
  String get enhanceStrong => 'Silné';

  @override
  String get stripMetadata => 'Odstranit metadata';

  @override
  String get stripMetadataHint =>
      'Z výstupu odstraní EXIF, GPS a časová razítka.';

  @override
  String startConversion(int count) {
    return 'Převést $count souborů';
  }

  @override
  String get batchResumed => 'Přerušený převod pokračuje.';

  @override
  String get converting => 'Převádí se…';

  @override
  String get cancelBatch => 'Zastavit';

  @override
  String get cancelJob => 'Zrušit';

  @override
  String get clearFinished => 'Vymazat dokončené';

  @override
  String get removeJob => 'Odebrat';

  @override
  String get shareFile => 'Sdílet';

  @override
  String get retryJob => 'Zkusit znovu';

  @override
  String get queueEmptyTitle => 'Fronta je prázdná';

  @override
  String get queueEmptyBody =>
      'Soubory přidané na kartě Převod se objeví tady.';

  @override
  String queueActiveTab(int count) {
    return 'Aktivní · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Dokončené · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nic neprobíhá';

  @override
  String get queueNoActiveBody =>
      'Čekající a právě převáděné soubory se ukážou tady.';

  @override
  String get queueNoFinishedTitle => 'Zatím nic hotového';

  @override
  String get queueNoFinishedBody =>
      'Převedené soubory přistanou tady, připravené k otevření, uložení nebo sdílení.';

  @override
  String get statusQueued => 'Ve frontě';

  @override
  String get statusRunning => 'Převádí se';

  @override
  String get statusCompleted => 'Hotovo';

  @override
  String get statusFailed => 'Selhalo';

  @override
  String get statusCancelled => 'Zrušeno';

  @override
  String batchSummary(int done, int total) {
    return 'Hotovo $done z $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Převedeno $done souborů',
      few: 'Převedeny $done soubory',
      one: 'Převeden 1 soubor',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Převedeno $done, selhalo $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'o $percent % menší';
  }

  @override
  String grewPercent(int percent) {
    return 'o $percent % větší';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Vzhled';

  @override
  String get themeSystem => 'Systémový';

  @override
  String get language => 'Jazyk';

  @override
  String get languageSystem => 'Systémový';

  @override
  String get privacyTitle => 'Soukromí';

  @override
  String get privacyBody =>
      'Eluna Media převádí vaše soubory celé v tomto zařízení pomocí přibalené kopie FFmpeg. Soubory zařízení nikdy neopustí, není potřeba žádný účet a žádná telemetrie tu není. Nic v aplikaci nepoužívá síť — nemá ani oprávnění k internetu.\n\nOdstranění metadat je ve výchozím nastavení zapnuté, takže EXIF, souřadnice GPS a časová razítka se z exportovaných souborů odstraní.';

  @override
  String get licenseTitle => 'Licence';

  @override
  String get licenseBody =>
      'Aplikace obsahuje FFmpeg sestavený s x264, x265 a dalšími komponentami pod GPL, proto se jako celek šíří pod licencí GNU GPL v3.';

  @override
  String get sourceMissing => 'Zdrojový soubor už není k dispozici.';

  @override
  String get tabSettings => 'Nastavení';

  @override
  String get introTitle => 'Soukromí už v základu';

  @override
  String get introOfflineTitle => 'Převádí v tomto zařízení';

  @override
  String get introOfflineBody =>
      'Veškerou práci odvede přibalená kopie FFmpeg. Vaše soubory telefon nikdy neopustí — převod funguje i v režimu letadlo.';

  @override
  String get introTelemetryTitle => 'Nulová telemetrie';

  @override
  String get introTelemetryBody =>
      'Žádný účet, žádná analytika, žádná hlášení o pádech. Aplikace neví, kdo jste.';

  @override
  String get introMetadataTitle => 'Metadata pod kontrolou';

  @override
  String get introMetadataBody =>
      'EXIF, GPS a časová razítka se z každého výstupu ve výchozím nastavení odstraní. Můžete to vypnout.';

  @override
  String get introFreeNote =>
      'Zdarma, bez reklam a bez předplatného. Všechny funkce včetně dávkového převodu máte od začátku — koupit se dá jedině spropitné a neodemyká vůbec nic.';

  @override
  String get introContinue => 'Začít';

  @override
  String get modeSimple => 'Jednoduchý';

  @override
  String get modeAdvanced => 'Pokročilý';

  @override
  String get modeAdvancedHint =>
      'Místo karet s předvolbami zobrazí všechny kodeky, datové toky a úpravy.';

  @override
  String get presetCompressVideoTitle => 'Zmenšit video';

  @override
  String get presetCompressVideoBody =>
      'Mnohem menší MP4, kvalita zůstane dobrá';

  @override
  String get presetFitToSizeTitle => 'Vejít se do velikosti';

  @override
  String get presetFitToSizeBody =>
      'Trefit přesný limit — Discord, e-mail, chaty';

  @override
  String get presetCompatibleMp4Title => 'Kompatibilní MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Přehraje se všude';

  @override
  String get presetExtractAudioTitle => 'Vytáhnout zvuk';

  @override
  String get presetExtractAudioBody => 'MP3 z libovolného videa';

  @override
  String get presetVideoToGifTitle => 'Video na GIF';

  @override
  String get presetVideoToGifBody => 'Krátký klip na animovaný GIF';

  @override
  String get presetMergeTitle => 'Spojit videa';

  @override
  String get presetMergeBody => 'Sešije klipy do jednoho MP4, v pořadí';

  @override
  String get mergeNeedsTwo => 'Ke spojení vyberte aspoň dvě videa.';

  @override
  String mergedVideoName(int count) {
    return 'Spojené video ($count klipů).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Zmenšit fotku';

  @override
  String get presetCompressImageBody => 'Menší JPEG, ztráta sotva viditelná';

  @override
  String get presetEnhancePhotoTitle => 'Vylepšit fotku';

  @override
  String get presetEnhancePhotoBody => 'Čistější, ostřejší, lepší barvy';

  @override
  String get presetImageToWebpTitle => 'Fotka na WebP';

  @override
  String get presetImageToWebpBody => 'Moderní formát, menší než JPEG';

  @override
  String get sizeTargetTitle => 'Cílová velikost';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Vlastní…';

  @override
  String get sizeTargetDialogTitle => 'Cílová velikost v MB';

  @override
  String get sizeTargetTooSmall =>
      'Cíl je na tuto délku příliš malý; použije se nejbližší dosažitelná kvalita.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size na soubor';
  }

  @override
  String estimateTotal(String size) {
    return 'Odhadovaný výstup: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vybráno $count souborů',
      few: 'Vybrány $count soubory',
      one: 'Vybrán 1 soubor',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => 'Převod 100% offline';

  @override
  String get promiseBatchFree => 'Dávka je zdarma';

  @override
  String get promiseNoWatermark => 'Bez vodoznaku';

  @override
  String get sectionTransform => 'Úpravy';

  @override
  String get rotateLabel => 'Otočit';

  @override
  String get flipLabel => 'Překlopit vodorovně';

  @override
  String get speedLabel => 'Rychlost';

  @override
  String get cropLabel => 'Ořez';

  @override
  String get cropHint =>
      'Ořez ze středu na zvolený poměr stran — čtverec pro feedy, 9:16 pro stories.';

  @override
  String volumeLabel(int percent) {
    return 'Hlasitost: $percent %';
  }

  @override
  String get addAudioFiles => 'Zvuk a další soubory';

  @override
  String get hwEncoderLabel => 'Hardwarové kódování';

  @override
  String get hwEncoderHint =>
      'V režimech datového toku a cílové velikosti využívá videočip zařízení — je to mnohem rychlejší a chladnější. Režim kvality (CRF) vždy použije přesný softwarový kodér a neúspěšná hardwarová úloha se automaticky zopakuje softwarově.';

  @override
  String get transformNeedsReencode =>
      'Otočení, překlopení a rychlost vyžadují nové zakódování, takže při kopírování streamu nejsou dostupné.';

  @override
  String get capBitrateLabel => 'Nikdy soubor nezvětšovat';

  @override
  String get capBitrateHint =>
      'Omezí kódování datovým tokem samotného zdroje. Konstantní kvalita žádný vlastní strop nemá, takže už jednou komprimované video může jinak vyjít větší.';

  @override
  String get keepSubtitles => 'Zachovat titulky';

  @override
  String get keepSubtitlesHint =>
      'Přenese stopy s titulky do výstupu. Pouze textové titulky.';

  @override
  String get sectionTrim => 'Zkrácení';

  @override
  String get trimEnable => 'Zkrátit zdroj';

  @override
  String get trimHint =>
      'Dostupné, když je ve frontě právě jeden soubor se známou délkou.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Cílová velikost';

  @override
  String get lowBatteryTitle => 'Baterie je slabá';

  @override
  String get lowBatteryBody =>
      'Převod pořádně zatěžuje procesor. Můžete nejdřív připojit nabíječku, nebo přesto pokračovat.';

  @override
  String get lowBatteryContinue => 'Přesto převést';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Přijato $count souborů',
      few: 'Přijaty $count soubory',
      one: 'Přijat 1 soubor',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Uložit';

  @override
  String get savedToGallery => 'Uloženo do galerie, album „Eluna Media“.';

  @override
  String get savedToDownloads => 'Uloženo do složky Stažené.';

  @override
  String get saveFailed => 'Soubor se nepodařilo uložit.';

  @override
  String get jobRemovedUndo => 'Úloha odebrána.';

  @override
  String get finishedClearedUndo => 'Dokončené úlohy vymazány.';

  @override
  String get undo => 'Zpět';

  @override
  String get errorDetailsTitle => 'Podrobnosti chyby';

  @override
  String get sectionConversionPrefs => 'Převod';

  @override
  String get powerModeLabel => 'Režim výkonu';

  @override
  String get powerEfficiency => 'Chladně a rychle';

  @override
  String get powerBalanced => 'Vyvážený';

  @override
  String get powerQuality => 'Maximální komprese';

  @override
  String get powerModeHint =>
      'Jak tvrdě pracuje video kodér. Chladněji a rychleji znamená o něco větší soubory. Nic dalšího se neomezuje — nikdy.';

  @override
  String get hapticsLabel => 'Odezva vibracemi';

  @override
  String get networkPrivacyTitle => 'Síť a soukromí';

  @override
  String get netAuditIntro =>
      'Úplný seznam všeho, co se v této aplikaci může dotknout sítě.';

  @override
  String get netAuditNoneTitle => 'Žádný přístup k síti';

  @override
  String get netAuditNoneBody =>
      'Aplikace nežádá o oprávnění k internetu, takže se na síť nedostane, ani kdyby chtěla — ověříte si to v systémových informacích o aplikaci. Žádné reklamy, žádná analytika, žádné kontroly aktualizací. „Ohodnotit aplikaci“ předá řízení aplikaci obchodu, která si komunikaci obstará sama.';

  @override
  String get netAuditConversionTitle => 'Převod';

  @override
  String get netAuditConversionBody =>
      'Probíhá celý v tomto zařízení přes přibalený FFmpeg. Zapněte režim letadlo a převeďte — funguje to.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrie';

  @override
  String get netAuditTelemetryBody =>
      'Žádná není. Aplikace nesbírá analytiku, hlášení o pádech ani identifikátory a nemá žádný systém účtů.';

  @override
  String get netAuditTipsTitle => 'Spropitné';

  @override
  String get netAuditTipsBody =>
      'Spropitné vyřizuje aplikace Play Store, ne tato — ta stále nemá oprávnění k internetu. Platby ovšem přidají do seznamu oprávnění dvě položky: „nákupy v aplikaci“ a „zobrazení síťových připojení“, což jen zjišťuje, zda připojení existuje, a použít ho neumí. Nic se nikdy nekupuje automaticky a spropitné neodemyká nic: všechny funkce jsou tu zdarma.';

  @override
  String get sectionSupport => 'Podpora';

  @override
  String get rateApp => 'Ohodnotit aplikaci';

  @override
  String get openLicenses => 'Licence otevřeného softwaru';

  @override
  String get presetAudioToMp3Title => 'Převést zvuk';

  @override
  String get presetAudioToMp3Body => 'Do MP3 — přehraje se na čemkoli';

  @override
  String get presetCompressAudioTitle => 'Zmenšit zvuk';

  @override
  String get presetCompressAudioBody => 'Úspornější AAC — hlasovky, podcasty';

  @override
  String get convertTo => 'Převést na';

  @override
  String get formatSectionHint =>
      'Nabízíme jen formáty, na které se vaše soubory opravdu dají převést.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Fotka';

  @override
  String get sourceAudio => 'Zvuk';

  @override
  String get sourceUnknown => 'Soubor';

  @override
  String get mixedSelectionTitle => 'Vybrány různé typy souborů';

  @override
  String get mixedSelectionBody =>
      'Každý soubor se převede s nejlepší předvolbou pro svůj typ. Pro plnou kontrolu přidávejte vždy jen jeden druh.';

  @override
  String get filesTitle => 'Soubory';

  @override
  String get removeFile => 'Odebrat';

  @override
  String timeLeft(String time) {
    return 'zbývá ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Nastavení převodu';

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
  String get summaryEnhanced => 'Vylepšeno';

  @override
  String get summaryMetadataStripped => 'Metadata odstraněna';

  @override
  String summaryMerge(int count) {
    return 'Spojeno $count klipů';
  }

  @override
  String get shareApp => 'Sdílet aplikaci';

  @override
  String get shareAppText =>
      'Eluna Media — bezplatný, plně offline převodník fotek, videa a zvuku. Bez předplatného, bez vodoznaků, bez účtů.';

  @override
  String appVersionLabel(String version) {
    return 'Verze $version';
  }

  @override
  String get openFile => 'Otevřít';

  @override
  String get openFolder => 'Zobrazit složku';

  @override
  String get noAppToOpen => 'Tento soubor neotevře žádná aplikace v zařízení.';

  @override
  String get openFailed => 'Soubor se nepodařilo otevřít.';

  @override
  String get twoPassLabel => 'Dvouprůchodové pro přesnou velikost';

  @override
  String get twoPassHint =>
      'Úlohy s cílovou velikostí se kódují dvakrát a do bajtového rozpočtu se trefí znatelně přesněji — za zhruba dvojnásobek času a baterie.';

  @override
  String get whatsNewTitle => 'Novinky';

  @override
  String get whatsNew1 =>
      'Video může být nově AV1: výrazně menší soubory, pokud si na ně počkáte.';

  @override
  String get whatsNew2 =>
      'Nové pro obrázky: AVIF, zhruba poloviční proti JPEG, a animovaný WebP místo GIF.';

  @override
  String get whatsNew3 => 'M4A umí být bezztrátové — vedle AAC teď stojí ALAC.';

  @override
  String get whatsNew4 =>
      'Jedna obrazovka pro vzhled: jas, barva zvýraznění, čistě černá pro OLED a Material You.';

  @override
  String get whatsNew5 =>
      'Úspěchy mají medaile, tři karty a postup, který jde sdílet jako obrázek.';

  @override
  String get achievementsTitle => 'Úspěchy';

  @override
  String achievementsProgress(int done, int total) {
    return '$done z $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Počítá se jen v tomto zařízení. Nikam se nic neodesílá.';

  @override
  String get achFirstConversionTitle => 'První kroky';

  @override
  String get achFirstConversionBody => 'Převeďte svůj první soubor.';

  @override
  String get achTenConversionsTitle => 'Rozehřáto';

  @override
  String get achTenConversionsBody => 'Převeďte 10 souborů.';

  @override
  String get achFiftyConversionsTitle => 'Stálý host';

  @override
  String get achFiftyConversionsBody => 'Převeďte 50 souborů.';

  @override
  String get achTwoHundredConversionsTitle => 'Tahoun';

  @override
  String get achTwoHundredConversionsBody => 'Převeďte 200 souborů.';

  @override
  String get achThousandConversionsTitle => 'Pásová výroba';

  @override
  String get achThousandConversionsBody => 'Převeďte 1000 souborů.';

  @override
  String get achSaved100MbTitle => 'Šetřič místa';

  @override
  String get achSaved100MbBody => 'Uvolněte celkem 100 MB.';

  @override
  String get achSaved1GbTitle => 'Lovec gigabajtů';

  @override
  String get achSaved1GbBody => 'Uvolněte celkem 1 GB.';

  @override
  String get achSaved10GbTitle => 'Hrdina úložiště';

  @override
  String get achSaved10GbBody => 'Uvolněte celkem 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Dávkař';

  @override
  String get achBatchOfFiveBody => 'Dokončete dávku 5 a více souborů.';

  @override
  String get achBatchOfTwentyTitle => 'Výrobní linka';

  @override
  String get achBatchOfTwentyBody => 'Dokončete dávku 20 a více souborů.';

  @override
  String get achSniperTitle => 'Odstřelovač';

  @override
  String get achSniperBody =>
      'Trefte přesnou velikost režimem cílové velikosti.';

  @override
  String get achMemeSmithTitle => 'Kovář memů';

  @override
  String get achMemeSmithBody => 'Udělejte z videa GIF.';

  @override
  String get achSoundHunterTitle => 'Lovec zvuku';

  @override
  String get achSoundHunterBody => 'Vytáhněte z videa zvuk.';

  @override
  String get achSubtitleKeeperTitle => 'Strážce titulků';

  @override
  String get achSubtitleKeeperBody => 'Převeďte video se zachovanými titulky.';

  @override
  String get achDirectorTitle => 'Režisér';

  @override
  String get achDirectorBody =>
      'Použijte úpravu — otočení, ořez, rychlost nebo hlasitost.';

  @override
  String get achAllRounderTitle => 'Všestranný';

  @override
  String get achAllRounderBody => 'Převeďte video, zvuk i obrázek.';

  @override
  String get achNightOwlTitle => 'Noční sova';

  @override
  String get achNightOwlBody =>
      'Dokončete převod mezi půlnocí a pátou hodinou ranní.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Získejte všechny ostatní úspěchy.';

  @override
  String get storageTitle => 'Úložiště';

  @override
  String get storageBody =>
      'Převedené soubory zůstávají uvnitř aplikace, kam žádný správce souborů nedosáhne, dokud je neuložíte nebo nesdílíte.';

  @override
  String get storageEmpty => 'Nic uloženo';

  @override
  String storageUsage(String size) {
    return 'Uloženo: $size';
  }

  @override
  String get storageClearTitle => 'Vymazat uložené soubory?';

  @override
  String get storageClearBody =>
      'Smaže všechny dokončené výsledky, které aplikace ještě drží. Souborů, které jste už uložili nebo sdíleli, se to netýká.';

  @override
  String get storageClearAction => 'Vymazat';

  @override
  String storageCleared(String size) {
    return 'Uvolněno $size';
  }

  @override
  String get autoSaveLabel => 'Ukládat výsledky automaticky';

  @override
  String get autoSaveHint =>
      'Každý hotový soubor uloží do galerie — zvuk do složky Stažené — hned jak je připravený.';

  @override
  String get lowSpaceTitle => 'Zbývá málo místa';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Tato dávka potřebuje asi $needed a volných je jen $free. Převod se může v půlce zastavit.';
  }

  @override
  String saveAll(int count) {
    return 'Uložit vše ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Uloženo: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Uloženo $saved z $total';
  }

  @override
  String get presetFitPhotoTitle => 'Vejít se s fotkou do velikosti';

  @override
  String get presetFitPhotoBody =>
      'Stlačte obrázek pod přesný limit — nahrávací formuláře, žádosti.';

  @override
  String get photoFitHint =>
      'Aplikace zkouší kvality, dokud se jedna nevejde. Pokud je rozpočet na obrázek příliš malý, zmenší i rozměry snímku.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Cílová velikost v KB';

  @override
  String get compareAction => 'Porovnat';

  @override
  String get compareBefore => 'Před';

  @override
  String get compareAfter => 'Po';

  @override
  String get compareHint => 'Podržením zobrazíte originál.';

  @override
  String get trimStart => 'Začátek';

  @override
  String get trimEnd => 'Konec';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, nejvýše do $duration';
  }

  @override
  String get imageScaleLabel => 'Měřítko';

  @override
  String get audioChannelsLabel => 'Kanály';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Vzorkovací frekvence';

  @override
  String get voiceAudioHint =>
      'Mono na 22,05 kHz zmenší hlasovou nahrávku zhruba na čtvrtinu bez slyšitelné ztráty. U hudby nechte obojí původní.';

  @override
  String get moveUp => 'Posunout nahoru';

  @override
  String get moveDown => 'Posunout dolů';

  @override
  String get renameOutput => 'Přejmenovat výsledek';

  @override
  String get renameOutputHint => 'Nový název';

  @override
  String get renameOutputHelp =>
      'Příponu určuje výstupní formát. Necháte-li pole prázdné, výsledek se pojmenuje podle zdroje.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Smazat originály ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Mazat originály po převodu';

  @override
  String get deleteOriginalsHint =>
      'Požádá systém o odstranění zdrojových souborů, jakmile je výsledek uložený. Systém vždy ukáže, co zmizí, a počká na vaše potvrzení.';

  @override
  String originalsDeleted(String size) {
    return 'Originály smazány — uvolněno $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Nic se nesmazalo. Najít lze jen soubory, které galerie stále vede pod původním názvem.';

  @override
  String reclaimedTotal(String size) {
    return 'Uvolněno touto aplikací: $size';
  }

  @override
  String get deleteAllData => 'Smazat všechna data';

  @override
  String get deleteAllDataHint =>
      'Vymaže vše, co si aplikace v tomto zařízení drží: frontu, převedené soubory, náhledy, úspěchy a nastavení. Souborů, které jste už uložili do galerie, se to netýká.';

  @override
  String get codecCopy => 'Kopírovat';

  @override
  String get codecCopyRemux => 'Kopírovat (remux)';

  @override
  String get codecNoVideo => 'Bez videa';

  @override
  String get codecNoAudio => 'Bez zvuku';

  @override
  String codecLossless(String codec) {
    return '$codec (bezztrátově)';
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
