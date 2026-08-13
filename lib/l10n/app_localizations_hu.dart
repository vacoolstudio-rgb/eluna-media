// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Átalakítás';

  @override
  String get tabQueue => 'Sor';

  @override
  String get addFiles => 'Fájlok hozzáadása';

  @override
  String get emptySelectionTitle => 'Még nincs fájl';

  @override
  String get emptySelectionBody =>
      'Adj hozzá fényképeket, videókat vagy hangfájlokat. Minden feldolgozás ezen az eszközön történik.';

  @override
  String get sectionOutput => 'Kimenet';

  @override
  String get sectionVideo => 'Videó';

  @override
  String get sectionAudio => 'Hang';

  @override
  String get sectionImage => 'Kép';

  @override
  String get sectionPrivacy => 'Adatvédelem';

  @override
  String get outputFormat => 'Formátum';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Hangkodek';

  @override
  String get rateControl => 'Bitrátavezérlés';

  @override
  String get rateControlQuality => 'Állandó minőség (CRF)';

  @override
  String get rateControlBitrate => 'Cél-bitráta';

  @override
  String crfLabel(int value) {
    return 'Minőség (CRF $value)';
  }

  @override
  String get crfHint =>
      'Az alacsonyabb érték jobb minőséget és nagyobb fájlt jelent.';

  @override
  String videoBitrate(int value) {
    return 'Videó bitrátája: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Hang bitrátája: $value kbps';
  }

  @override
  String get encodingPreset => 'Kódoló-előbeállítás';

  @override
  String get encodingPresetHint =>
      'A lassabb előbeállítások jobban tömörítenek, de jobban melegítik az eszközt.';

  @override
  String get presetOriginal => 'Eredeti';

  @override
  String get resolution => 'Felbontás';

  @override
  String get frameRate => 'Képkockasebesség';

  @override
  String imageQuality(int value) {
    return 'Minőség: $value';
  }

  @override
  String get lossless => 'Veszteségmentes';

  @override
  String get losslessHint => 'Nagyobb fájlok, pixelpontos eredmény.';

  @override
  String get sectionEnhance => 'Javítás';

  @override
  String get sharpenLabel => 'Élesség';

  @override
  String get sharpenHint =>
      'Élesebbé teszi a kontúrokat. Bemozdult vagy életlen felvételt nem tud helyreállítani — az a részlet nincs benne a fájlban.';

  @override
  String get sharpenStrongHint =>
      'Az erős élesítés világos glóriákat hagyhat a kontúrok mentén. Próbáld először a közepeset.';

  @override
  String get denoiseLabel => 'Zajcsökkentés';

  @override
  String get denoiseHint =>
      'Kitisztítja a szemcsézettséget a sötét és az éjszakai képeken. A túl sok elsimítja a finom részleteket is.';

  @override
  String get autoColorLabel => 'Automatikus szín és szintek';

  @override
  String get autoColorHint =>
      'Kissé megnyújtja a kontrasztot és felhozza a fakó színeket.';

  @override
  String get upscaleLabel => 'Felnagyítás 2×';

  @override
  String get upscaleHint =>
      'Megduplázza a szélességet és a magasságot. Részletet nem ad hozzá — nyomtatásnál vagy vágásnál segít.';

  @override
  String get upscaleConflictHint =>
      'A felnagyításhoz állítsd a Felbontást vissza Eredetire.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Ki';

  @override
  String get enhanceLight => 'Enyhe';

  @override
  String get enhanceMedium => 'Közepes';

  @override
  String get enhanceStrong => 'Erős';

  @override
  String get stripMetadata => 'Metaadatok eltávolítása';

  @override
  String get stripMetadataHint =>
      'Eltávolítja az EXIF-, GPS- és időbélyegadatokat a kimenetből.';

  @override
  String startConversion(int count) {
    return '$count fájl átalakítása';
  }

  @override
  String get batchResumed => 'A megszakadt átalakítás folytatódik.';

  @override
  String get converting => 'Átalakítás…';

  @override
  String get cancelBatch => 'Leállítás';

  @override
  String get cancelJob => 'Megszakítás';

  @override
  String get clearFinished => 'Elkészültek törlése';

  @override
  String get removeJob => 'Eltávolítás';

  @override
  String get shareFile => 'Megosztás';

  @override
  String get retryJob => 'Újra';

  @override
  String get queueEmptyTitle => 'A sor üres';

  @override
  String get queueEmptyBody =>
      'Az Átalakítás lapon hozzáadott fájlok itt jelennek meg.';

  @override
  String queueActiveTab(int count) {
    return 'Aktív · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Kész · $count';
  }

  @override
  String get queueNoActiveTitle => 'Semmi nincs folyamatban';

  @override
  String get queueNoActiveBody =>
      'A várakozó és az éppen átalakuló fájlok itt jelennek meg.';

  @override
  String get queueNoFinishedTitle => 'Még semmi sem készült el';

  @override
  String get queueNoFinishedBody =>
      'Az átalakított fájlok ide kerülnek, készen a megnyitásra, mentésre vagy megosztásra.';

  @override
  String get statusQueued => 'Sorban áll';

  @override
  String get statusRunning => 'Átalakítás';

  @override
  String get statusCompleted => 'Kész';

  @override
  String get statusFailed => 'Sikertelen';

  @override
  String get statusCancelled => 'Megszakítva';

  @override
  String batchSummary(int done, int total) {
    return '$done / $total kész';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done fájl átalakítva',
      one: '1 fájl átalakítva',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done átalakítva, $failed sikertelen.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent%-kal kisebb';
  }

  @override
  String grewPercent(int percent) {
    return '$percent%-kal nagyobb';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Megjelenés';

  @override
  String get themeSystem => 'Rendszer';

  @override
  String get language => 'Nyelv';

  @override
  String get languageSystem => 'Rendszer';

  @override
  String get privacyTitle => 'Adatvédelem';

  @override
  String get privacyBody =>
      'Az Eluna Media a fájljaidat teljes egészében ezen az eszközön alakítja át, a beépített FFmpeg segítségével. A fájljaid soha nem hagyják el az eszközt, fiókra nincs szükség, és telemetria sincs. Az alkalmazásban semmi sem használja a hálózatot — még internetengedélye sincs.\n\nA metaadatok eltávolítása alapból be van kapcsolva, így az EXIF-adatok, a GPS-koordináták és az időbélyegek kikerülnek az exportált fájlokból.';

  @override
  String get licenseTitle => 'Licencelés';

  @override
  String get licenseBody =>
      'Ez az alkalmazás x264, x265 és más GPL-összetevőkkel épített FFmpeg-et tartalmaz, ezért az alkalmazás egésze a GNU GPL v3 alatt kerül terjesztésre.';

  @override
  String get sourceMissing => 'A forrásfájl már nem érhető el.';

  @override
  String get tabSettings => 'Beállítások';

  @override
  String get introTitle => 'Alapból privát';

  @override
  String get introOfflineTitle => 'Ezen az eszközön alakít át';

  @override
  String get introOfflineBody =>
      'A munkát a beépített FFmpeg végzi. A fájljaid soha nem hagyják el a telefont — az átalakítás repülőgép üzemmódban is működik.';

  @override
  String get introTelemetryTitle => 'Nulla telemetria';

  @override
  String get introTelemetryBody =>
      'Nincs fiók, nincs analitika, nincs összeomlás-jelentés. Az alkalmazás nem tudja, ki vagy.';

  @override
  String get introMetadataTitle => 'A metaadatok kézben';

  @override
  String get introMetadataBody =>
      'Az EXIF-adatok, a GPS és az időbélyegek alapból minden kimenetből kikerülnek. Ezt ki is kapcsolhatod.';

  @override
  String get introFreeNote =>
      'Ingyenes, reklámok és előfizetések nélkül. Minden funkció — a kötegelt átalakítással együtt — a kezdettől fogva a tiéd; egyedül borravalót lehet venni, és az semmit nem old fel.';

  @override
  String get introContinue => 'Kezdjük';

  @override
  String get modeSimple => 'Egyszerű';

  @override
  String get modeAdvanced => 'Haladó';

  @override
  String get modeAdvancedHint =>
      'Az előbeállítás-kártyák helyett minden kodek-, bitráta- és átalakításvezérlőt megmutat.';

  @override
  String get presetCompressVideoTitle => 'Videó tömörítése';

  @override
  String get presetCompressVideoBody => 'Sokkal kisebb MP4, a minőség jó marad';

  @override
  String get presetFitToSizeTitle => 'Méretre igazítás';

  @override
  String get presetFitToSizeBody =>
      'Pontos korlát elérése — Discord, e-mail, csevegés';

  @override
  String get presetCompatibleMp4Title => 'Kompatibilis MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Mindenhol lejátszható';

  @override
  String get presetExtractAudioTitle => 'Hang kinyerése';

  @override
  String get presetExtractAudioBody => 'MP3 bármelyik videóból';

  @override
  String get presetVideoToGifTitle => 'Videóból GIF';

  @override
  String get presetVideoToGifBody => 'Rövid klipből animált GIF';

  @override
  String get presetMergeTitle => 'Videók egyesítése';

  @override
  String get presetMergeBody =>
      'Klipek összefűzése egyetlen MP4-be, sorrendben';

  @override
  String get mergeNeedsTwo => 'Az egyesítéshez válassz ki legalább két videót.';

  @override
  String mergedVideoName(int count) {
    return 'Egyesített videó ($count klip).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Fénykép tömörítése';

  @override
  String get presetCompressImageBody =>
      'Kisebb JPEG, alig látható veszteséggel';

  @override
  String get presetEnhancePhotoTitle => 'Fénykép javítása';

  @override
  String get presetEnhancePhotoBody => 'Tisztább, élesebb, jobb színek';

  @override
  String get presetImageToWebpTitle => 'Fényképből WebP';

  @override
  String get presetImageToWebpBody => 'Korszerű formátum, kisebb a JPEG-nél';

  @override
  String get sizeTargetTitle => 'Célméret';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Egyéni…';

  @override
  String get sizeTargetDialogTitle => 'Célméret MB-ban';

  @override
  String get sizeTargetTooSmall =>
      'A cél túl kicsi ehhez a hosszhoz; a lehető legközelebbi minőség kerül alkalmazásra.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size fájlonként';
  }

  @override
  String estimateTotal(String size) {
    return 'Becsült kimenet: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl kiválasztva',
      one: '1 fájl kiválasztva',
    );
    return '$_temp0';
  }

  @override
  String get promiseOffline => '100%-ban offline átalakítás';

  @override
  String get promiseBatchFree => 'A kötegelt mód ingyenes';

  @override
  String get promiseNoWatermark => 'Nincs vízjel';

  @override
  String get sectionTransform => 'Átalakítás';

  @override
  String get rotateLabel => 'Forgatás';

  @override
  String get flipLabel => 'Vízszintes tükrözés';

  @override
  String get speedLabel => 'Sebesség';

  @override
  String get cropLabel => 'Vágás';

  @override
  String get cropHint =>
      'Középre igazított vágás a választott képarányra — négyzetes a hírfolyamokhoz, 9:16 a történetekhez.';

  @override
  String volumeLabel(int percent) {
    return 'Hangerő: $percent%';
  }

  @override
  String get addAudioFiles => 'Hang és egyéb fájlok';

  @override
  String get hwEncoderLabel => 'Hardveres kódolás';

  @override
  String get hwEncoderHint =>
      'Az eszköz videochipjét használja bitráta- és méretre igazítás módban — sokkal gyorsabb és hűvösebb. A minőség (CRF) mód mindig a pontos szoftveres kódolót használja, a sikertelen hardveres feladat pedig magától újraindul szoftveresen.';

  @override
  String get transformNeedsReencode =>
      'A forgatás, a tükrözés és a sebesség újrakódolást igényel, ezért adatfolyam-másolás közben nem érhetők el.';

  @override
  String get capBitrateLabel => 'Soha ne legyen nagyobb a fájl';

  @override
  String get capBitrateHint =>
      'A kódolást a forrás saját bitrátájára korlátozza. Az állandó minőségnek nincs saját felső határa, így egy már tömörített videó egyébként nagyobb is lehet a végén.';

  @override
  String get keepSubtitles => 'Feliratok megtartása';

  @override
  String get keepSubtitlesHint =>
      'Átviszi a feliratsávokat a kimenetbe. Csak szöveges feliratokat.';

  @override
  String get sectionTrim => 'Vágás';

  @override
  String get trimEnable => 'Forrás megvágása';

  @override
  String get trimHint =>
      'Akkor érhető el, ha pontosan egy ismert hosszúságú fájl van a sorban.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Célméret';

  @override
  String get lowBatteryTitle => 'Az akkumulátor gyenge';

  @override
  String get lowBatteryBody =>
      'Az átalakítás erősen megdolgoztatja a processzort. Előbb rádugható a töltő, de folytathatod is így.';

  @override
  String get lowBatteryContinue => 'Átalakítás mégis';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl fogadva',
      one: '1 fájl fogadva',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Mentés';

  @override
  String get savedToGallery => 'Mentve a galériába, az „Eluna Media” albumba.';

  @override
  String get savedToDownloads => 'Mentve a Letöltések közé.';

  @override
  String get saveFailed => 'A fájlt nem sikerült menteni.';

  @override
  String get jobRemovedUndo => 'A feladat eltávolítva.';

  @override
  String get finishedClearedUndo => 'Az elkészült feladatok törölve.';

  @override
  String get undo => 'Visszavonás';

  @override
  String get errorDetailsTitle => 'A hiba részletei';

  @override
  String get sectionConversionPrefs => 'Átalakítás';

  @override
  String get powerModeLabel => 'Energiamód';

  @override
  String get powerEfficiency => 'Hűvös és gyors';

  @override
  String get powerBalanced => 'Kiegyensúlyozott';

  @override
  String get powerQuality => 'Maximális tömörítés';

  @override
  String get powerModeHint =>
      'Mennyire dolgozik keményen a videokódoló. A hűvösebb és gyorsabb mód valamivel nagyobb fájlokat ad. Semmi mást nem korlátozunk — soha.';

  @override
  String get hapticsLabel => 'Rezgő visszajelzés';

  @override
  String get networkPrivacyTitle => 'Hálózat és adatvédelem';

  @override
  String get netAuditIntro =>
      'Teljes lista mindenről, ami ebben az alkalmazásban egyáltalán hozzáérhet a hálózathoz.';

  @override
  String get netAuditNoneTitle => 'Semmilyen hálózati hozzáférés';

  @override
  String get netAuditNoneBody =>
      'Az alkalmazás nem kér internetengedélyt, így akkor sem érné el a hálózatot, ha akarná — ezt a rendszer alkalmazásadatlapján ellenőrizheted. Nincs reklám, nincs analitika, nincs frissítésellenőrzés. Az „Alkalmazás értékelése” átadja a szót az áruház alkalmazásának, amely a saját nevében kommunikál.';

  @override
  String get netAuditConversionTitle => 'Átalakítás';

  @override
  String get netAuditConversionBody =>
      'Teljes egészében ezen az eszközön fut, a beépített FFmpeg segítségével. Kapcsold be a repülőgép üzemmódot és alakíts át — működik.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Nincs ilyen. Az alkalmazás nem gyűjt analitikát, összeomlás-jelentést vagy azonosítókat, és nincs benne fiókrendszer.';

  @override
  String get netAuditTipsTitle => 'Borravaló';

  @override
  String get netAuditTipsBody =>
      'A borravalót a Play Store alkalmazása bonyolítja le, nem ez — amelynek továbbra sincs internetengedélye. A számlázás viszont két sort hozzáad az engedélyek listájához: „alkalmazáson belüli vásárlások”, valamint „hálózati kapcsolatok megtekintése”, amely csak azt olvassa ki, van-e kapcsolat, használni nem tudja. Semmi nem kerül megvásárlásra magától, és a borravaló semmit nem old fel: itt minden funkció ingyenes.';

  @override
  String get sectionSupport => 'Támogatás';

  @override
  String get rateApp => 'Alkalmazás értékelése';

  @override
  String get openLicenses => 'Nyílt forráskódú licencek';

  @override
  String get presetAudioToMp3Title => 'Hang átalakítása';

  @override
  String get presetAudioToMp3Body => 'MP3-ra — mindenen lejátszható';

  @override
  String get presetCompressAudioTitle => 'Hang tömörítése';

  @override
  String get presetCompressAudioBody =>
      'Karcsúbb AAC — hangjegyzetek, podcastok';

  @override
  String get convertTo => 'Átalakítás erre';

  @override
  String get formatSectionHint =>
      'Csak azok a formátumok szerepelnek, amelyekké a fájljaid tényleg átalakíthatók.';

  @override
  String get sourceVideo => 'Videó';

  @override
  String get sourceImage => 'Fénykép';

  @override
  String get sourceAudio => 'Hang';

  @override
  String get sourceUnknown => 'Fájl';

  @override
  String get mixedSelectionTitle =>
      'Különböző típusú fájlok vannak kiválasztva';

  @override
  String get mixedSelectionBody =>
      'Minden fájl a saját típusához illő előbeállítással alakul át. A teljes irányításhoz egyszerre egyféle fájlt adj hozzá.';

  @override
  String get filesTitle => 'Fájlok';

  @override
  String get removeFile => 'Eltávolítás';

  @override
  String timeLeft(String time) {
    return '≈ $time van hátra';
  }

  @override
  String get jobSettingsTitle => 'Átalakítási beállítások';

  @override
  String get jobDetails => 'Részletek';

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
  String get summaryEnhanced => 'Javítva';

  @override
  String get summaryMetadataStripped => 'Metaadatok eltávolítva';

  @override
  String summaryMerge(int count) {
    return '$count klip egyesítve';
  }

  @override
  String get shareApp => 'Alkalmazás megosztása';

  @override
  String get shareAppText =>
      'Eluna Media — ingyenes, teljesen offline fénykép-, videó- és hangátalakító. Nincs előfizetés, nincs vízjel, nincs fiók.';

  @override
  String appVersionLabel(String version) {
    return 'Verzió: $version';
  }

  @override
  String get openFile => 'Megnyitás';

  @override
  String get openFolder => 'Mappa megjelenítése';

  @override
  String get noAppToOpen =>
      'Ezen az eszközön egyetlen alkalmazás sem tudja megnyitni ezt a fájlt.';

  @override
  String get openFailed => 'A fájlt nem sikerült megnyitni.';

  @override
  String get twoPassLabel => 'Két menet a pontos mérethez';

  @override
  String get twoPassHint =>
      'A méretre igazító feladatok kétszer kódolnak, és érezhetően pontosabban tartják a bájtkeretet — nagyjából kétszeres idő és akkumulátorhasználat árán.';

  @override
  String get whatsNewTitle => 'Újdonságok';

  @override
  String get whatsNew1 =>
      'A videó mostantól AV1 is lehet: észrevehetően kisebb fájlok, ha van türelmed megvárni őket.';

  @override
  String get whatsNew2 =>
      'Új a képekhez: AVIF, körülbelül egy JPEG fele, és GIF helyett animált WebP.';

  @override
  String get whatsNew3 =>
      'Az M4A lehet veszteségmentes — az ALAC mostantól az AAC mellett áll.';

  @override
  String get whatsNew4 =>
      'Egyetlen képernyő a külcsínhez: fényerő, kiemelőszín, tiszta fekete OLED és Material You.';

  @override
  String get whatsNew5 =>
      'Az eredményekhez érmek, három lap és képként megosztható haladás jár.';

  @override
  String get achievementsTitle => 'Eredmények';

  @override
  String achievementsProgress(int done, int total) {
    return '$done / $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Csak ezen az eszközön számoljuk. Semmi nem kerül fel sehová.';

  @override
  String get achFirstConversionTitle => 'Első lépések';

  @override
  String get achFirstConversionBody => 'Alakítsd át az első fájlodat.';

  @override
  String get achTenConversionsTitle => 'Bemelegítve';

  @override
  String get achTenConversionsBody => 'Alakíts át 10 fájlt.';

  @override
  String get achFiftyConversionsTitle => 'Törzsvendég';

  @override
  String get achFiftyConversionsBody => 'Alakíts át 50 fájlt.';

  @override
  String get achTwoHundredConversionsTitle => 'Igásló';

  @override
  String get achTwoHundredConversionsBody => 'Alakíts át 200 fájlt.';

  @override
  String get achThousandConversionsTitle => 'Futószalag';

  @override
  String get achThousandConversionsBody => 'Alakíts át 1000 fájlt.';

  @override
  String get achSaved100MbTitle => 'Helytakarékos';

  @override
  String get achSaved100MbBody => 'Szabadíts fel összesen 100 MB-ot.';

  @override
  String get achSaved1GbTitle => 'Gigabájtvadász';

  @override
  String get achSaved1GbBody => 'Szabadíts fel összesen 1 GB-ot.';

  @override
  String get achSaved10GbTitle => 'A tárhely hőse';

  @override
  String get achSaved10GbBody => 'Szabadíts fel összesen 10 GB-ot.';

  @override
  String get achBatchOfFiveTitle => 'Kötegelő';

  @override
  String get achBatchOfFiveBody => 'Fejezz be egy legalább 5 fájlos köteget.';

  @override
  String get achBatchOfTwentyTitle => 'Szerelőszalag';

  @override
  String get achBatchOfTwentyBody =>
      'Fejezz be egy legalább 20 fájlos köteget.';

  @override
  String get achSniperTitle => 'Mesterlövész';

  @override
  String get achSniperBody =>
      'Találd el a pontos méretet a méretre igazítással.';

  @override
  String get achMemeSmithTitle => 'Mémkovács';

  @override
  String get achMemeSmithBody => 'Csinálj GIF-et egy videóból.';

  @override
  String get achSoundHunterTitle => 'Hangvadász';

  @override
  String get achSoundHunterBody => 'Nyerd ki a hangot egy videóból.';

  @override
  String get achSubtitleKeeperTitle => 'Feliratőrző';

  @override
  String get achSubtitleKeeperBody =>
      'Alakíts át egy videót a feliratai megtartásával.';

  @override
  String get achDirectorTitle => 'Rendező';

  @override
  String get achDirectorBody =>
      'Alkalmazz egy átalakítást — forgatást, vágást, sebességet vagy hangerőt.';

  @override
  String get achAllRounderTitle => 'Sokoldalú';

  @override
  String get achAllRounderBody => 'Alakíts át videót, hangot és képet.';

  @override
  String get achNightOwlTitle => 'Éjjeli bagoly';

  @override
  String get achNightOwlBody =>
      'Fejezz be egy átalakítást éjfél és hajnali 5 óra között.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Szerezd meg az összes többi eredményt.';

  @override
  String get storageTitle => 'Tárhely';

  @override
  String get storageBody =>
      'Az átalakított fájlok az alkalmazáson belül maradnak, amíg el nem mented vagy meg nem osztod őket — ide egyetlen fájlkezelő sem lát be.';

  @override
  String get storageEmpty => 'Nincs tárolt fájl';

  @override
  String storageUsage(String size) {
    return 'Tárolva: $size';
  }

  @override
  String get storageClearTitle => 'Törlöd a tárolt fájlokat?';

  @override
  String get storageClearBody =>
      'Törli az összes elkészült eredményt, amelyet az alkalmazás még őriz. A már elmentett vagy megosztott fájlokhoz nem nyúl.';

  @override
  String get storageClearAction => 'Törlés';

  @override
  String storageCleared(String size) {
    return '$size felszabadítva';
  }

  @override
  String get autoSaveLabel => 'Eredmények automatikus mentése';

  @override
  String get autoSaveHint =>
      'Minden elkészült fájlt a galériába tesz — a hangfájlokat a Letöltések közé —, amint kész van.';

  @override
  String get lowSpaceTitle => 'Kevés a szabad hely';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Ehhez a köteghez körülbelül $needed kell, és csak $free szabad. Az átalakítás félbeszakadhat.';
  }

  @override
  String saveAll(int count) {
    return 'Összes mentése ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Mentve: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$total fájlból $saved mentve';
  }

  @override
  String get presetFitPhotoTitle => 'Fénykép méretre igazítása';

  @override
  String get presetFitPhotoBody =>
      'Szoríts egy képet pontos korlát alá — feltöltési űrlapok, pályázatok.';

  @override
  String get photoFitHint =>
      'Az alkalmazás addig próbálgatja a minőségeket, amíg az egyik belefér. Ha a keret túl szűk a képhez, a képméretet is csökkenti.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Célméret KB-ban';

  @override
  String get compareAction => 'Összehasonlítás';

  @override
  String get compareBefore => 'Előtte';

  @override
  String get compareAfter => 'Utána';

  @override
  String get compareHint =>
      'Nyomd meg és tartsd lenyomva az eredeti megtekintéséhez.';

  @override
  String get trimStart => 'Kezdet';

  @override
  String get trimEnd => 'Vége';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, legfeljebb $duration';
  }

  @override
  String get imageScaleLabel => 'Méretezés';

  @override
  String get audioChannelsLabel => 'Csatornák';

  @override
  String get audioMono => 'Monó';

  @override
  String get audioStereo => 'Sztereó';

  @override
  String get sampleRateLabel => 'Mintavételi frekvencia';

  @override
  String get voiceAudioHint =>
      'A monó 22,05 kHz-en nagyjából a negyedére csökkenti egy hangfelvétel méretét, hallható veszteség nélkül. Zenénél hagyd mindkettőt eredetin.';

  @override
  String get moveUp => 'Mozgatás fel';

  @override
  String get moveDown => 'Mozgatás le';

  @override
  String get renameOutput => 'Eredmény átnevezése';

  @override
  String get renameOutputHint => 'Új név';

  @override
  String get renameOutputHelp =>
      'A kiterjesztés a kimeneti formátumból adódik. Hagyd üresen, ha az eredmény a forrás nevét kapja.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Eredetik törlése ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Eredetik törlése átalakítás után';

  @override
  String get deleteOriginalsHint =>
      'Megkéri a rendszert, hogy távolítsa el a forrásfájlokat, miután az eredmény mentésre került. A rendszer mindig megmutatja, mi tűnik el, és megvárja a jóváhagyásodat.';

  @override
  String originalsDeleted(String size) {
    return 'Eredetik törölve — $size felszabadítva';
  }

  @override
  String get originalsNoneDeleted =>
      'Semmi nem lett törölve. Csak azok a fájlok találhatók meg, amelyeket a galéria még az eredeti nevükön őriz.';

  @override
  String reclaimedTotal(String size) {
    return 'Ezzel az alkalmazással felszabadítva: $size';
  }

  @override
  String get deleteAllData => 'Minden adat törlése';

  @override
  String get deleteAllDataHint =>
      'Töröl mindent, amit az alkalmazás ezen az eszközön tart: a sort, az átalakított fájlokat, az előnézeteket, az eredményeket és a beállításokat. A galériába már elmentett fájlokhoz nem nyúl.';

  @override
  String get codecCopy => 'Másolás';

  @override
  String get codecCopyRemux => 'Másolás (újracsomagolás)';

  @override
  String get codecNoVideo => 'Nincs videó';

  @override
  String get codecNoAudio => 'Nincs hang';

  @override
  String codecLossless(String codec) {
    return '$codec (veszteségmentes)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animált)';
  }

  @override
  String get sizeTargetEmail => 'E-mail';

  @override
  String get trimTimeHint => 'm:ss';
}
