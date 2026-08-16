// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class L10nFi extends L10n {
  L10nFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Muunna';

  @override
  String get tabQueue => 'Jono';

  @override
  String get addFiles => 'Lisää tiedostoja';

  @override
  String get emptySelectionTitle => 'Ei vielä tiedostoja';

  @override
  String get emptySelectionBody =>
      'Lisää kuvia, videoita tai ääntä. Kaikki käsitellään tällä laitteella.';

  @override
  String get sectionOutput => 'Tuloste';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Ääni';

  @override
  String get sectionImage => 'Kuva';

  @override
  String get sectionPrivacy => 'Yksityisyys';

  @override
  String get outputFormat => 'Muoto';

  @override
  String get videoCodec => 'Videokoodekki';

  @override
  String get audioCodec => 'Äänikoodekki';

  @override
  String get rateControl => 'Bittinopeuden hallinta';

  @override
  String get rateControlQuality => 'Vakiolaatu (CRF)';

  @override
  String get rateControlBitrate => 'Tavoitebittinopeus';

  @override
  String crfLabel(int value) {
    return 'Laatu (CRF $value)';
  }

  @override
  String get crfHint =>
      'Pienempi arvo tarkoittaa parempaa laatua ja isompaa tiedostoa.';

  @override
  String videoBitrate(int value) {
    return 'Videon bittinopeus: $value kbit/s';
  }

  @override
  String audioBitrate(int value) {
    return 'Äänen bittinopeus: $value kbit/s';
  }

  @override
  String get encodingPreset => 'Pakkaimen esiasetus';

  @override
  String get encodingPresetHint =>
      'Hitaammat esiasetukset pakkaavat paremmin mutta lämmittävät laitetta enemmän.';

  @override
  String get presetOriginal => 'Alkuperäinen';

  @override
  String get resolution => 'Tarkkuus';

  @override
  String get frameRate => 'Kuvataajuus';

  @override
  String imageQuality(int value) {
    return 'Laatu: $value';
  }

  @override
  String get lossless => 'Häviötön';

  @override
  String get losslessHint => 'Isompia tiedostoja, pikselintarkka tulos.';

  @override
  String get sectionEnhance => 'Parannus';

  @override
  String get sharpenLabel => 'Terävyys';

  @override
  String get sharpenHint =>
      'Tekee reunoista selkeämmät. Se ei pelasta epätarkkaa tai sumeaa kuvaa — niitä yksityiskohtia ei ole tiedostossa.';

  @override
  String get sharpenStrongHint =>
      'Voimakas terävöinti voi jättää vaaleat reunaviivat. Kokeile ensin keskitasoa.';

  @override
  String get denoiseLabel => 'Kohinanvaimennus';

  @override
  String get denoiseHint =>
      'Siivoaa rakeisuutta tummista ja yökuvista. Liikaa käytettynä se pyyhkii hienot yksityiskohdat.';

  @override
  String get autoColorLabel => 'Automaattiset värit ja tasot';

  @override
  String get autoColorHint =>
      'Venyttää kontrastia ja nostaa latteita värejä hieman.';

  @override
  String get upscaleLabel => 'Suurenna 2×';

  @override
  String get upscaleHint =>
      'Kaksinkertaistaa leveyden ja korkeuden. Se ei tuo lisää yksityiskohtia — mutta auttaa tulostuksessa tai rajauksessa.';

  @override
  String get upscaleConflictHint =>
      'Palauta Tarkkuus arvoon Alkuperäinen, jotta voit suurentaa.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Pois';

  @override
  String get enhanceLight => 'Kevyt';

  @override
  String get enhanceMedium => 'Keskitaso';

  @override
  String get enhanceStrong => 'Voimakas';

  @override
  String get stripMetadata => 'Poista metatiedot';

  @override
  String get stripMetadataHint =>
      'Poistaa EXIF-, GPS- ja aikaleimatiedot tuloksesta.';

  @override
  String startConversion(int count) {
    return 'Muunna tiedostot ($count)';
  }

  @override
  String get batchResumed => 'Keskeytynyt muunnos jatkui.';

  @override
  String get converting => 'Muunnetaan…';

  @override
  String get cancelBatch => 'Pysäytä';

  @override
  String get cancelJob => 'Peruuta';

  @override
  String get clearFinished => 'Tyhjennä valmiit';

  @override
  String get removeJob => 'Poista';

  @override
  String get shareFile => 'Jaa';

  @override
  String get retryJob => 'Yritä uudelleen';

  @override
  String get queueEmptyTitle => 'Jono on tyhjä';

  @override
  String get queueEmptyBody =>
      'Muunna-välilehdellä lisäämäsi tiedostot näkyvät täällä.';

  @override
  String queueActiveTab(int count) {
    return 'Käynnissä · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Valmiit · $count';
  }

  @override
  String get queueNoActiveTitle => 'Mitään ei ole käynnissä';

  @override
  String get queueNoActiveBody =>
      'Odottavat tai muunnettavat tiedostot näkyvät täällä.';

  @override
  String get queueNoFinishedTitle => 'Mikään ei ole vielä valmis';

  @override
  String get queueNoFinishedBody =>
      'Muunnetut tiedostot päätyvät tänne valmiina avattaviksi, tallennettaviksi tai jaettaviksi.';

  @override
  String get statusQueued => 'Jonossa';

  @override
  String get statusRunning => 'Muunnetaan';

  @override
  String get statusCompleted => 'Valmis';

  @override
  String get statusFailed => 'Epäonnistui';

  @override
  String get statusCancelled => 'Peruutettu';

  @override
  String batchSummary(int done, int total) {
    return '$done/$total valmiina';
  }

  @override
  String batchCompleted(int done) {
    return 'Muunnetut tiedostot: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done muunnettu, $failed epäonnistui.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% pienempi';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% isompi';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Ulkoasu';

  @override
  String get themeSystem => 'Järjestelmä';

  @override
  String get language => 'Kieli';

  @override
  String get languageSystem => 'Järjestelmä';

  @override
  String get privacyTitle => 'Yksityisyys';

  @override
  String get privacyBody =>
      'Eluna Media muuntaa tiedostosi kokonaan tällä laitteella mukana tulevalla FFmpeg-kopiolla. Tiedostosi eivät koskaan poistu laitteelta, tiliä ei tarvita, eikä telemetriaa ole. Mikään sovelluksessa ei käytä verkkoa lainkaan — sillä ei ole edes internet-lupaa.\n\nMetatietojen poisto on oletuksena päällä, joten EXIF, GPS-koordinaatit ja aikaleimat karsitaan viemistäsi tiedostoista.';

  @override
  String get licenseTitle => 'Lisenssit';

  @override
  String get licenseBody =>
      'Sovellus sisältää FFmpegin, joka on käännetty x264-, x265- ja muiden GPL-osien kanssa, joten ohjelma kokonaisuutena jaetaan GNU GPL v3 -lisenssillä.';

  @override
  String get sourceMissing => 'Lähdetiedostoa ei enää ole.';

  @override
  String get tabSettings => 'Asetukset';

  @override
  String get introTitle => 'Yksityinen jo suunnittelultaan';

  @override
  String get introOfflineTitle => 'Muuntaa tällä laitteella';

  @override
  String get introOfflineBody =>
      'Mukana tuleva FFmpeg tekee koko työn. Tiedostosi eivät poistu puhelimesta — muunnos toimii lentotilassa.';

  @override
  String get introTelemetryTitle => 'Nolla telemetriaa';

  @override
  String get introTelemetryBody =>
      'Ei tiliä, ei analytiikkaa, ei kaatumisraportteja. Sovellus ei tiedä kuka olet.';

  @override
  String get introMetadataTitle => 'Metatiedot hallinnassa';

  @override
  String get introMetadataBody =>
      'EXIF, GPS ja aikaleimat karsitaan jokaisesta tuloksesta oletuksena. Voit poistaa sen käytöstä.';

  @override
  String get introFreeNote =>
      'Ilmainen, ilman mainoksia ja tilauksia. Jokainen ominaisuus, erämuunnos mukaan lukien, on sinun heti alusta — ainoa ostettava asia on juomaraha, eikä se avaa mitään.';

  @override
  String get introContinue => 'Aloitetaan';

  @override
  String get modeSimple => 'Yksinkertainen';

  @override
  String get modeAdvanced => 'Lisäasetukset';

  @override
  String get modeAdvancedHint =>
      'Näytä kaikki koodekit, bittinopeudet ja muunnokset esiasetuskorttien sijaan.';

  @override
  String get presetCompressVideoTitle => 'Pakkaa video';

  @override
  String get presetCompressVideoBody =>
      'Paljon pienempi MP4, laatu pysyy hyvänä';

  @override
  String get presetFitToSizeTitle => 'Sovita kokoon';

  @override
  String get presetFitToSizeBody =>
      'Osu tarkkaan rajaan — Discord, sähköposti, chatit';

  @override
  String get presetCompatibleMp4Title => 'Yhteensopiva MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Toistuu kaikkialla';

  @override
  String get presetExtractAudioTitle => 'Pura ääni';

  @override
  String get presetExtractAudioBody => 'MP3 mistä tahansa videosta';

  @override
  String get presetVideoToGifTitle => 'Video GIF-kuvaksi';

  @override
  String get presetVideoToGifBody => 'Lyhyt pätkä animoiduksi GIF-kuvaksi';

  @override
  String get presetMergeTitle => 'Yhdistä videot';

  @override
  String get presetMergeBody => 'Liitä pätkät yhdeksi MP4:ksi järjestyksessä';

  @override
  String get mergeNeedsTwo =>
      'Valitse vähintään kaksi videota yhdistettäväksi.';

  @override
  String mergedVideoName(int count) {
    return 'Yhdistetty video ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Pakkaa kuva';

  @override
  String get presetCompressImageBody => 'Pienempi JPEG, tuskin näkyvä häviö';

  @override
  String get presetEnhancePhotoTitle => 'Paranna kuvaa';

  @override
  String get presetEnhancePhotoBody => 'Puhtaampi, terävämpi, parempi väri';

  @override
  String get presetImageToWebpTitle => 'Kuva WebP-muotoon';

  @override
  String get presetImageToWebpBody => 'Nykyaikainen muoto, pienempi kuin JPEG';

  @override
  String get sizeTargetTitle => 'Tavoitekoko';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Mukautettu…';

  @override
  String get sizeTargetDialogTitle => 'Tavoitekoko megatavuina';

  @override
  String get sizeTargetTooSmall =>
      'Tavoite on liian pieni tälle kestolle; käytetään lähintä mahdollista laatua.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size tiedostoa kohti';
  }

  @override
  String estimateTotal(String size) {
    return 'Arvioitu tulos: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Valitut tiedostot: $count';
  }

  @override
  String get promiseOffline => '100 % offline-muunnos';

  @override
  String get promiseBatchFree => 'Erämuunnos on ilmainen';

  @override
  String get promiseNoWatermark => 'Ei vesileimaa';

  @override
  String get sectionTransform => 'Muunnokset';

  @override
  String get rotateLabel => 'Käännä';

  @override
  String get flipLabel => 'Peilaa vaakasuunnassa';

  @override
  String get speedLabel => 'Nopeus';

  @override
  String get cropLabel => 'Rajaa';

  @override
  String get cropHint =>
      'Rajaa keskeltä valittuun kuvasuhteeseen — neliö syötteisiin, 9:16 tarinoihin.';

  @override
  String volumeLabel(int percent) {
    return 'Äänenvoimakkuus: $percent%';
  }

  @override
  String get addAudioFiles => 'Ääni ja muut tiedostot';

  @override
  String get hwEncoderLabel => 'Laitteistopakkaus';

  @override
  String get hwEncoderHint =>
      'Käyttää laitteen videopiiriä bittinopeus- ja sovita kokoon -tiloissa — paljon nopeampi ja viileämpi. Laatutila (CRF) käyttää aina tarkkaa ohjelmistopakkainta, ja epäonnistunut laitteistotyö yritetään automaattisesti uudelleen ohjelmistolla.';

  @override
  String get transformNeedsReencode =>
      'Kääntö, peilaus ja nopeus vaativat uudelleenpakkauksen, joten ne ovat pois päältä virran kopioinnin aikana.';

  @override
  String get capBitrateLabel => 'Älä koskaan kasvata tiedostoa';

  @override
  String get capBitrateHint =>
      'Rajoittaa pakkauksen lähteen omaan bittinopeuteen. Vakiolaadulla ei ole omaa kattoa, joten jo pakattu video voi muuten tulla ulos isompana.';

  @override
  String get keepSubtitles => 'Säilytä tekstitykset';

  @override
  String get keepSubtitlesHint =>
      'Vie tekstitysraidat tulokseen. Vain tekstipohjaiset tekstitykset.';

  @override
  String get sectionTrim => 'Leikkaus';

  @override
  String get trimEnable => 'Leikkaa lähde';

  @override
  String get trimHint =>
      'Käytettävissä, kun jonossa on täsmälleen yksi tiedosto, jonka kesto tiedetään.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Tavoitekoko';

  @override
  String get lowBatteryTitle => 'Akku on vähissä';

  @override
  String get lowBatteryBody =>
      'Muunnos kuormittaa suoritinta rankasti. Voit liittää laturin ensin tai jatkaa silti.';

  @override
  String get lowBatteryContinue => 'Muunna silti';

  @override
  String get commonCancel => 'Peruuta';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Vastaanotetut tiedostot: $count';
  }

  @override
  String get saveFile => 'Tallenna';

  @override
  String get savedToGallery =>
      'Tallennettu galleriaan, albumiin ”Eluna Media”.';

  @override
  String get savedToDownloads => 'Tallennettu Lataukset-kansioon.';

  @override
  String get saveFailed => 'Tiedostoa ei voitu tallentaa.';

  @override
  String get jobRemovedUndo => 'Työ poistettiin.';

  @override
  String get finishedClearedUndo => 'Valmiit työt tyhjennettiin.';

  @override
  String get undo => 'Kumoa';

  @override
  String get errorDetailsTitle => 'Virheen tiedot';

  @override
  String get sectionConversionPrefs => 'Muunnos';

  @override
  String get powerModeLabel => 'Tehotila';

  @override
  String get powerEfficiency => 'Viileä ja nopea';

  @override
  String get powerBalanced => 'Tasapainoinen';

  @override
  String get powerQuality => 'Suurin pakkaus';

  @override
  String get powerModeHint =>
      'Kuinka kovaa videopakkain tekee töitä. Viileämpi ja nopeampi tarkoittaa hieman isompia tiedostoja. Mitään muuta ei koskaan rajoiteta.';

  @override
  String get hapticsLabel => 'Värinäpalaute';

  @override
  String get networkPrivacyTitle => 'Verkko ja yksityisyys';

  @override
  String get netAuditIntro =>
      'Täydellinen luettelo kaikesta, mikä tässä sovelluksessa voisi koskea verkkoon.';

  @override
  String get netAuditNoneTitle => 'Ei verkkoyhteyttä lainkaan';

  @override
  String get netAuditNoneBody =>
      'Sovellus ei pyydä internet-lupaa, joten se ei pääse verkkoon vaikka yrittäisi — voit tarkistaa sen järjestelmän sovellustiedoista. Ei mainoksia, ei analytiikkaa, ei päivitystarkistuksia. ”Arvioi sovellus” siirtää tehtävän kaupan sovellukselle, joka hoitaa yhteydenpidon itse.';

  @override
  String get netAuditConversionTitle => 'Muunnos';

  @override
  String get netAuditConversionBody =>
      'Toimii kokonaan tällä laitteella mukana tulevalla FFmpegillä. Laita lentotila päälle ja muunna — se toimii.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Sitä ei ole. Sovellus ei kerää analytiikkaa, kaatumisraportteja eikä tunnisteita, eikä siinä ole tilijärjestelmää.';

  @override
  String get netAuditTipsTitle => 'Juomarahat';

  @override
  String get netAuditTipsBody =>
      'Juomarahan hoitaa Play Kauppa -sovellus, ei tämä — jolla ei edelleenkään ole internet-lupaa. Laskutus kuitenkin lisää lupalistaan kaksi riviä: ”sovelluksen sisäiset ostot” ja ”näytä verkkoyhteydet”, joka vain lukee onko yhteys olemassa eikä voi käyttää sitä. Mitään ei osteta automaattisesti, eikä juomaraha avaa mitään: kaikki täällä on ilmaista.';

  @override
  String get sectionSupport => 'Tuki';

  @override
  String get rateApp => 'Arvioi sovellus';

  @override
  String get openLicenses => 'Avoimen lähdekoodin lisenssit';

  @override
  String get presetAudioToMp3Title => 'Muunna ääni';

  @override
  String get presetAudioToMp3Body => 'MP3:ksi — toistuu kaikella';

  @override
  String get presetCompressAudioTitle => 'Pakkaa ääni';

  @override
  String get presetCompressAudioBody =>
      'Kevyempi AAC — puhemuistiot, podcastit';

  @override
  String get convertTo => 'Muunna muotoon';

  @override
  String get formatSectionHint =>
      'Luettelossa ovat vain muodot, joiksi tiedostosi todella voivat muuttua.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Kuva';

  @override
  String get sourceAudio => 'Ääni';

  @override
  String get sourceUnknown => 'Tiedosto';

  @override
  String get mixedSelectionTitle => 'Valittuna eri tiedostotyyppejä';

  @override
  String get mixedSelectionBody =>
      'Jokainen tiedosto muunnetaan omalle tyypilleen parhaalla esiasetuksella. Lisää yksi laji kerrallaan, jos haluat täyden hallinnan.';

  @override
  String get filesTitle => 'Tiedostot';

  @override
  String get removeFile => 'Poista';

  @override
  String timeLeft(String time) {
    return '≈ $time jäljellä';
  }

  @override
  String get jobSettingsTitle => 'Muunnosasetukset';

  @override
  String get jobDetails => 'Tiedot';

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
  String get summaryEnhanced => 'Parannettu';

  @override
  String get summaryMetadataStripped => 'Metatiedot poistettu';

  @override
  String summaryMerge(int count) {
    return 'Yhdistetyt pätkät: $count';
  }

  @override
  String get shareApp => 'Jaa sovellus';

  @override
  String get shareAppText =>
      'Eluna Media — ilmainen, täysin offline-tilassa toimiva kuva-, video- ja äänimuunnin. Ei tilauksia, ei vesileimoja, ei tilejä.';

  @override
  String appVersionLabel(String version) {
    return 'Versio $version';
  }

  @override
  String get openFile => 'Avaa';

  @override
  String get openFolder => 'Näytä kansio';

  @override
  String get noAppToOpen =>
      'Millään tämän laitteen sovelluksella ei voi avata tuota tiedostoa.';

  @override
  String get openFailed => 'Tiedostoa ei voitu avata.';

  @override
  String get twoPassLabel => 'Kaksi ajokertaa tarkkaan kokoon';

  @override
  String get twoPassHint =>
      'Sovita kokoon -työt pakataan kahdesti ja osuvat tavubudjettiin selvästi tarkemmin — noin kaksinkertaisella ajalla ja akulla.';

  @override
  String get whatsNewTitle => 'Mitä uutta';

  @override
  String get whatsNew1 =>
      'Video voi nyt olla AV1: selvästi pienempiä tiedostoja, jos jaksat odottaa.';

  @override
  String get whatsNew2 =>
      'Uutta kuville: AVIF, noin puolet JPEG:stä, ja animoitu WebP GIF:n sijaan.';

  @override
  String get whatsNew3 => 'M4A voi olla häviötön — ALAC on nyt AAC:n rinnalla.';

  @override
  String get whatsNew4 =>
      'Yksi näkymä ulkoasulle: kirkkaus, korostusväri, täysmusta OLED ja Material You.';

  @override
  String get whatsNew5 =>
      'Saavutuksilla on mitalit, kolme välilehteä ja edistyminen, jonka voi jakaa kuvana.';

  @override
  String get achievementsTitle => 'Saavutukset';

  @override
  String achievementsProgress(int done, int total) {
    return '$done/$total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Lasketaan vain tällä laitteella. Mitään ei lähetetä minnekään.';

  @override
  String get achFirstConversionTitle => 'Ensiaskeleet';

  @override
  String get achFirstConversionBody => 'Muunna ensimmäinen tiedostosi.';

  @override
  String get achTenConversionsTitle => 'Lämmitelty';

  @override
  String get achTenConversionsBody => 'Muunna 10 tiedostoa.';

  @override
  String get achFiftyConversionsTitle => 'Vakioasiakas';

  @override
  String get achFiftyConversionsBody => 'Muunna 50 tiedostoa.';

  @override
  String get achTwoHundredConversionsTitle => 'Työjuhta';

  @override
  String get achTwoHundredConversionsBody => 'Muunna 200 tiedostoa.';

  @override
  String get achThousandConversionsTitle => 'Liukuhihna';

  @override
  String get achThousandConversionsBody => 'Muunna 1000 tiedostoa.';

  @override
  String get achSaved100MbTitle => 'Tilansäästäjä';

  @override
  String get achSaved100MbBody => 'Vapauta yhteensä 100 MB.';

  @override
  String get achSaved1GbTitle => 'Gigatavumetsästäjä';

  @override
  String get achSaved1GbBody => 'Vapauta yhteensä 1 GB.';

  @override
  String get achSaved10GbTitle => 'Tallennustilan sankari';

  @override
  String get achSaved10GbBody => 'Vapauta yhteensä 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Eräpuurtaja';

  @override
  String get achBatchOfFiveBody => 'Vie loppuun vähintään 5 tiedoston erä.';

  @override
  String get achBatchOfTwentyTitle => 'Tuotantolinja';

  @override
  String get achBatchOfTwentyBody => 'Vie loppuun vähintään 20 tiedoston erä.';

  @override
  String get achSniperTitle => 'Tarkka-ampuja';

  @override
  String get achSniperBody => 'Osu tarkkaan kokoon sovita kokoon -tilalla.';

  @override
  String get achMemeSmithTitle => 'Meemiseppä';

  @override
  String get achMemeSmithBody => 'Tee videosta GIF.';

  @override
  String get achSoundHunterTitle => 'Äänenmetsästäjä';

  @override
  String get achSoundHunterBody => 'Pura ääni videosta.';

  @override
  String get achSubtitleKeeperTitle => 'Tekstitysten vartija';

  @override
  String get achSubtitleKeeperBody => 'Muunna video tekstitykset säilyttäen.';

  @override
  String get achDirectorTitle => 'Ohjaaja';

  @override
  String get achDirectorBody =>
      'Käytä jotain muunnosta — kääntö, rajaus, nopeus tai äänenvoimakkuus.';

  @override
  String get achAllRounderTitle => 'Monitoimi';

  @override
  String get achAllRounderBody => 'Muunna video, ääni ja kuva.';

  @override
  String get achNightOwlTitle => 'Yökyöpeli';

  @override
  String get achNightOwlBody =>
      'Saata muunnos loppuun keskiyön ja aamuviiden välillä.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Ansaitse kaikki muut saavutukset.';

  @override
  String get storageTitle => 'Tallennustila';

  @override
  String get storageBody =>
      'Muunnetut tiedostot pysyvät sovelluksen sisällä, kunnes tallennat tai jaat ne — siellä mikään tiedostonhallinta ei yllä niihin.';

  @override
  String get storageEmpty => 'Ei mitään tallessa';

  @override
  String storageUsage(String size) {
    return 'Tallessa: $size';
  }

  @override
  String get storageClearTitle => 'Tyhjennetäänkö tallennetut tiedostot?';

  @override
  String get storageClearBody =>
      'Poistaa kaikki valmiit tulokset, joita sovellus vielä pitää. Jo tallentamiisi tai jakamiisi tiedostoihin ei kosketa.';

  @override
  String get storageClearAction => 'Tyhjennä';

  @override
  String storageCleared(String size) {
    return 'Vapautui $size';
  }

  @override
  String get autoSaveLabel => 'Tallenna tulokset automaattisesti';

  @override
  String get autoSaveHint =>
      'Vie jokaisen valmiin tiedoston galleriaan — äänen Lataukset-kansioon — heti kun se on valmis.';

  @override
  String get lowSpaceTitle => 'Tilaa on vähän jäljellä';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Tämä erä tarvitsee noin $needed, ja vapaana on vain $free. Muunnos voi keskeytyä kesken kaiken.';
  }

  @override
  String saveAll(int count) {
    return 'Tallenna kaikki ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Tallennettu: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Tallennettu $saved/$total';
  }

  @override
  String get presetFitPhotoTitle => 'Sovita kuva kokoon';

  @override
  String get presetFitPhotoBody =>
      'Purista kuva tarkan rajan alle — latauslomakkeet, hakemukset.';

  @override
  String get photoFitHint =>
      'Sovellus kokeilee laatuja, kunnes yksi mahtuu. Jos budjetti on kuvalle liian pieni, se pienentää myös kuvan mittoja.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Tavoitekoko kilotavuina';

  @override
  String get compareAction => 'Vertaa';

  @override
  String get compareBefore => 'Ennen';

  @override
  String get compareAfter => 'Jälkeen';

  @override
  String get compareHint => 'Pidä painettuna nähdäksesi alkuperäisen.';

  @override
  String get trimStart => 'Alku';

  @override
  String get trimEnd => 'Loppu';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, enintään $duration';
  }

  @override
  String get imageScaleLabel => 'Skaalaus';

  @override
  String get audioChannelsLabel => 'Kanavat';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Näytteenottotaajuus';

  @override
  String get voiceAudioHint =>
      'Mono 22,05 kHz:llä pienentää puhetallenteen suunnilleen neljäsosaan ilman kuuluvaa häviötä. Jätä molemmat alkuperäisiksi musiikille.';

  @override
  String get moveUp => 'Siirrä ylös';

  @override
  String get moveDown => 'Siirrä alas';

  @override
  String get renameOutput => 'Nimeä tulos uudelleen';

  @override
  String get renameOutputHint => 'Uusi nimi';

  @override
  String get renameOutputHelp =>
      'Tiedostopääte tulee tulostemuodosta. Jätä tyhjäksi, jos haluat nimetä tuloksen lähteen mukaan.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Poista alkuperäiset ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Poista alkuperäiset muunnoksen jälkeen';

  @override
  String get deleteOriginalsHint =>
      'Pyytää järjestelmää poistamaan lähdetiedostot, kun tulos on tallennettu. Järjestelmä näyttää aina, mikä on katoamassa, ja odottaa vahvistustasi.';

  @override
  String get mediaAccessRequired =>
      'Alkuperäisten poistaminen vaatii pääsyn mediakirjastoon.';

  @override
  String originalsDeleted(String size) {
    return 'Alkuperäiset poistettiin — $size vapautui';
  }

  @override
  String get originalsNoneDeleted =>
      'Mitään ei poistettu. Vain tiedostot, jotka galleria yhä pitää alkuperäisellä nimellään, löytyvät.';

  @override
  String reclaimedTotal(String size) {
    return 'Vapautettu tällä sovelluksella: $size';
  }

  @override
  String get deleteAllData => 'Poista kaikki tiedot';

  @override
  String get deleteAllDataHint =>
      'Pyyhkii kaiken, mitä sovellus säilyttää tällä laitteella: jonon, muunnetut tiedostot, esikatselut, saavutukset ja asetukset. Galleriaan jo tallentamiisi tiedostoihin ei kosketa.';

  @override
  String get codecCopy => 'Kopioi';

  @override
  String get codecCopyRemux => 'Kopioi (remux)';

  @override
  String get codecNoVideo => 'Ei videota';

  @override
  String get codecNoAudio => 'Ei ääntä';

  @override
  String codecLossless(String codec) {
    return '$codec (häviötön)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animoitu)';
  }

  @override
  String get sizeTargetEmail => 'Sähköposti';

  @override
  String get trimTimeHint => 'm:ss';
}
