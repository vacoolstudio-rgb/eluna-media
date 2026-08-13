// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class L10nCa extends L10n {
  L10nCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Converteix';

  @override
  String get tabQueue => 'Cua';

  @override
  String get addFiles => 'Afegeix fitxers';

  @override
  String get emptySelectionTitle => 'Encara no hi ha fitxers';

  @override
  String get emptySelectionBody =>
      'Afegeix fotos, vídeos o àudio. Tot es processa en aquest dispositiu.';

  @override
  String get sectionOutput => 'Sortida';

  @override
  String get sectionVideo => 'Vídeo';

  @override
  String get sectionAudio => 'Àudio';

  @override
  String get sectionImage => 'Imatge';

  @override
  String get sectionPrivacy => 'Privadesa';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Còdec de vídeo';

  @override
  String get audioCodec => 'Còdec d\'àudio';

  @override
  String get rateControl => 'Control de taxa';

  @override
  String get rateControlQuality => 'Qualitat constant (CRF)';

  @override
  String get rateControlBitrate => 'Taxa de bits objectiu';

  @override
  String crfLabel(int value) {
    return 'Qualitat (CRF $value)';
  }

  @override
  String get crfHint => 'Com més baix, millor qualitat i fitxer més gran.';

  @override
  String videoBitrate(int value) {
    return 'Taxa de bits del vídeo: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Taxa de bits de l\'àudio: $value kbps';
  }

  @override
  String get encodingPreset => 'Predefinit del codificador';

  @override
  String get encodingPresetHint =>
      'Els predefinits més lents comprimeixen millor, però escalfen més el dispositiu.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Resolució';

  @override
  String get frameRate => 'Imatges per segon';

  @override
  String imageQuality(int value) {
    return 'Qualitat: $value';
  }

  @override
  String get lossless => 'Sense pèrdua';

  @override
  String get losslessHint =>
      'Fitxers més grans, resultat idèntic píxel a píxel.';

  @override
  String get sectionEnhance => 'Millora';

  @override
  String get sharpenLabel => 'Nitidesa';

  @override
  String get sharpenHint =>
      'Fa les vores més marcades. No pot recuperar una fotografia moguda o desenfocada: aquest detall no és al fitxer.';

  @override
  String get sharpenStrongHint =>
      'Un enfocament fort pot deixar halos clars a les vores. Prova primer el nivell mitjà.';

  @override
  String get denoiseLabel => 'Reducció de soroll';

  @override
  String get denoiseHint =>
      'Neteja el gra de les fotos fosques i nocturnes. Massa reducció esborra el detall fi.';

  @override
  String get autoColorLabel => 'Color i nivells automàtics';

  @override
  String get autoColorHint =>
      'Estira una mica el contrast i aixeca els colors plans.';

  @override
  String get upscaleLabel => 'Ampliació 2×';

  @override
  String get upscaleHint =>
      'Duplica l\'amplada i l\'alçada. No afegeix detall: ajuda a imprimir o a retallar.';

  @override
  String get upscaleConflictHint =>
      'Torna a posar la Resolució a Original per poder ampliar.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Desactivat';

  @override
  String get enhanceLight => 'Suau';

  @override
  String get enhanceMedium => 'Mitjà';

  @override
  String get enhanceStrong => 'Fort';

  @override
  String get stripMetadata => 'Elimina les metadades';

  @override
  String get stripMetadataHint =>
      'Treu l\'EXIF, el GPS i les marques de temps del resultat.';

  @override
  String startConversion(int count) {
    return 'Converteix fitxers ($count)';
  }

  @override
  String get batchResumed => 'S\'ha reprès la conversió interrompuda.';

  @override
  String get converting => 'S\'està convertint…';

  @override
  String get cancelBatch => 'Atura';

  @override
  String get cancelJob => 'Cancel·la';

  @override
  String get clearFinished => 'Neteja els acabats';

  @override
  String get removeJob => 'Suprimeix';

  @override
  String get shareFile => 'Comparteix';

  @override
  String get retryJob => 'Torna-ho a provar';

  @override
  String get queueEmptyTitle => 'La cua és buida';

  @override
  String get queueEmptyBody =>
      'Els fitxers que afegeixes a la pestanya Converteix apareixen aquí.';

  @override
  String queueActiveTab(int count) {
    return 'Actius · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Acabats · $count';
  }

  @override
  String get queueNoActiveTitle => 'No hi ha res en curs';

  @override
  String get queueNoActiveBody =>
      'Aquí apareixen els fitxers que esperen o s\'estan convertint.';

  @override
  String get queueNoFinishedTitle => 'Encara no hi ha res acabat';

  @override
  String get queueNoFinishedBody =>
      'Els fitxers convertits arriben aquí, a punt per obrir, desar o compartir.';

  @override
  String get statusQueued => 'A la cua';

  @override
  String get statusRunning => 'S\'està convertint';

  @override
  String get statusCompleted => 'Fet';

  @override
  String get statusFailed => 'Ha fallat';

  @override
  String get statusCancelled => 'Cancel·lat';

  @override
  String batchSummary(int done, int total) {
    return '$done de $total fets';
  }

  @override
  String batchCompleted(int done) {
    return 'Fitxers convertits: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Convertits $done, fallits $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent % més petit';
  }

  @override
  String grewPercent(int percent) {
    return '$percent % més gran';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Aparença';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get privacyTitle => 'Privadesa';

  @override
  String get privacyBody =>
      'Eluna Media converteix els teus fitxers íntegrament en aquest dispositiu amb una còpia integrada de FFmpeg. Els teus fitxers no surten mai del dispositiu, no cal cap compte i no hi ha telemetria. Res de l\'aplicació no fa servir la xarxa: ni tan sols té el permís d\'internet.\n\nL\'eliminació de metadades està activada per defecte, de manera que l\'EXIF, les coordenades GPS i les marques de temps es descarten dels fitxers que exportes.';

  @override
  String get licenseTitle => 'Llicències';

  @override
  String get licenseBody =>
      'Aquesta aplicació inclou FFmpeg compilat amb x264, x265 i altres components GPL, de manera que l\'aplicació sencera es distribueix sota la GNU GPL v3.';

  @override
  String get sourceMissing => 'El fitxer d\'origen ja no està disponible.';

  @override
  String get tabSettings => 'Configuració';

  @override
  String get introTitle => 'Privada per disseny';

  @override
  String get introOfflineTitle => 'Converteix en aquest dispositiu';

  @override
  String get introOfflineBody =>
      'Una còpia integrada de FFmpeg fa tota la feina. Els teus fitxers no surten mai del telèfon: la conversió funciona en mode d\'avió.';

  @override
  String get introTelemetryTitle => 'Zero telemetria';

  @override
  String get introTelemetryBody =>
      'Sense compte, sense analítiques, sense informes d\'error. L\'aplicació no sap qui ets.';

  @override
  String get introMetadataTitle => 'Metadades sota control';

  @override
  String get introMetadataBody =>
      'L\'EXIF, el GPS i les marques de temps s\'eliminen de cada resultat per defecte. Ho pots desactivar.';

  @override
  String get introFreeNote =>
      'Gratuïta, sense anuncis ni subscripcions. Totes les funcions, inclosa la conversió per lots, són teves des del primer moment: l\'única cosa que es pot comprar és una propina, i no desbloqueja res.';

  @override
  String get introContinue => 'Comença';

  @override
  String get modeSimple => 'Simple';

  @override
  String get modeAdvanced => 'Avançat';

  @override
  String get modeAdvancedHint =>
      'Mostra tots els controls de còdec, taxa de bits i transformació en lloc de les targetes de predefinits.';

  @override
  String get presetCompressVideoTitle => 'Comprimeix el vídeo';

  @override
  String get presetCompressVideoBody =>
      'MP4 molt més petit, la qualitat es manté bona';

  @override
  String get presetFitToSizeTitle => 'Ajusta a la mida';

  @override
  String get presetFitToSizeBody =>
      'Encerta un límit exacte: Discord, correu, xats';

  @override
  String get presetCompatibleMp4Title => 'MP4 compatible';

  @override
  String get presetCompatibleMp4Body =>
      'H.264 + AAC. Es reprodueix a tot arreu';

  @override
  String get presetExtractAudioTitle => 'Extreu l\'àudio';

  @override
  String get presetExtractAudioBody => 'MP3 a partir de qualsevol vídeo';

  @override
  String get presetVideoToGifTitle => 'Vídeo a GIF';

  @override
  String get presetVideoToGifBody => 'Un clip curt convertit en GIF animat';

  @override
  String get presetMergeTitle => 'Uneix vídeos';

  @override
  String get presetMergeBody => 'Enllaça els clips en un sol MP4, en ordre';

  @override
  String get mergeNeedsTwo => 'Selecciona com a mínim dos vídeos per unir-los.';

  @override
  String mergedVideoName(int count) {
    return 'Vídeo unit ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Comprimeix la foto';

  @override
  String get presetCompressImageBody =>
      'JPEG més petit, pèrdua gairebé invisible';

  @override
  String get presetEnhancePhotoTitle => 'Millora la foto';

  @override
  String get presetEnhancePhotoBody => 'Més neta, més nítida, millor color';

  @override
  String get presetImageToWebpTitle => 'Foto a WebP';

  @override
  String get presetImageToWebpBody => 'Format modern, més petit que el JPEG';

  @override
  String get sizeTargetTitle => 'Mida objectiu';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Personalitzada…';

  @override
  String get sizeTargetDialogTitle => 'Mida objectiu en MB';

  @override
  String get sizeTargetTooSmall =>
      'L\'objectiu és massa petit per a aquesta durada; es farà servir la qualitat més propera possible.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per fitxer';
  }

  @override
  String estimateTotal(String size) {
    return 'Sortida estimada: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Fitxers seleccionats: $count';
  }

  @override
  String get promiseOffline => 'Conversió 100 % fora de línia';

  @override
  String get promiseBatchFree => 'Els lots són gratuïts';

  @override
  String get promiseNoWatermark => 'Sense marca d\'aigua';

  @override
  String get sectionTransform => 'Transformació';

  @override
  String get rotateLabel => 'Gira';

  @override
  String get flipLabel => 'Reflecteix horitzontalment';

  @override
  String get speedLabel => 'Velocitat';

  @override
  String get cropLabel => 'Retalla';

  @override
  String get cropHint =>
      'Retall centrat a la relació d\'aspecte triada: quadrat per als murs, 9:16 per a les històries.';

  @override
  String volumeLabel(int percent) {
    return 'Volum: $percent %';
  }

  @override
  String get addAudioFiles => 'Àudio i altres fitxers';

  @override
  String get hwEncoderLabel => 'Codificació per maquinari';

  @override
  String get hwEncoderHint =>
      'Fa servir el xip de vídeo del dispositiu en els modes de taxa de bits i d\'ajust a la mida: molt més ràpid i més fred. El mode de qualitat constant (CRF) sempre fa servir el codificador de programari precís, i una tasca de maquinari que falla es torna a provar automàticament per programari.';

  @override
  String get transformNeedsReencode =>
      'El gir, el reflex i la velocitat requereixen recodificar, de manera que estan desactivats durant una còpia directa del flux.';

  @override
  String get capBitrateLabel => 'No facis mai el fitxer més gran';

  @override
  String get capBitrateHint =>
      'Limita la codificació a la taxa de bits del mateix origen. La qualitat constant no té sostre propi, de manera que un vídeo ja comprimit podria sortir més gran.';

  @override
  String get keepSubtitles => 'Conserva els subtítols';

  @override
  String get keepSubtitlesHint =>
      'Passa les pistes de subtítols al resultat. Només subtítols de text.';

  @override
  String get sectionTrim => 'Tall';

  @override
  String get trimEnable => 'Talla l\'origen';

  @override
  String get trimHint =>
      'Disponible quan a la cua hi ha exactament un fitxer amb una durada coneguda.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Mida objectiu';

  @override
  String get lowBatteryTitle => 'La bateria és baixa';

  @override
  String get lowBatteryBody =>
      'Convertir fa treballar molt el processador. Pots endollar el dispositiu primer o continuar igualment.';

  @override
  String get lowBatteryContinue => 'Converteix igualment';

  @override
  String get commonCancel => 'Cancel·la';

  @override
  String get commonOk => 'D\'acord';

  @override
  String filesReceived(int count) {
    return 'Fitxers rebuts: $count';
  }

  @override
  String get saveFile => 'Desa';

  @override
  String get savedToGallery => 'Desat a la galeria, àlbum «Eluna Media».';

  @override
  String get savedToDownloads => 'Desat a Baixades.';

  @override
  String get saveFailed => 'No s\'ha pogut desar el fitxer.';

  @override
  String get jobRemovedUndo => 'Tasca suprimida.';

  @override
  String get finishedClearedUndo => 'S\'han netejat les tasques acabades.';

  @override
  String get undo => 'Desfés';

  @override
  String get errorDetailsTitle => 'Detalls de l\'error';

  @override
  String get sectionConversionPrefs => 'Conversió';

  @override
  String get powerModeLabel => 'Mode d\'energia';

  @override
  String get powerEfficiency => 'Fred i ràpid';

  @override
  String get powerBalanced => 'Equilibrat';

  @override
  String get powerQuality => 'Compressió màxima';

  @override
  String get powerModeHint =>
      'Com de fort treballa el codificador de vídeo. Més fred i més ràpid vol dir fitxers una mica més grans. No es limita res més, mai.';

  @override
  String get hapticsLabel => 'Resposta vibratòria';

  @override
  String get networkPrivacyTitle => 'Xarxa i privadesa';

  @override
  String get netAuditIntro =>
      'Una llista completa de tot allò de l\'aplicació que pot tocar la xarxa.';

  @override
  String get netAuditNoneTitle => 'Cap accés a la xarxa';

  @override
  String get netAuditNoneBody =>
      'L\'aplicació no demana el permís d\'internet, de manera que no pot arribar a la xarxa ni que ho intentés: ho pots comprovar a la informació de l\'aplicació del sistema. Sense anuncis, sense analítiques, sense comprovacions d\'actualitzacions. «Valora l\'aplicació» ho deixa en mans de l\'aplicació de la botiga, que parla pel seu compte.';

  @override
  String get netAuditConversionTitle => 'Conversió';

  @override
  String get netAuditConversionBody =>
      'S\'executa íntegrament en aquest dispositiu amb un FFmpeg integrat. Activa el mode d\'avió i converteix: funciona.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'No n\'hi ha. L\'aplicació no recull analítiques, ni informes d\'error, ni identificadors, i no té sistema de comptes.';

  @override
  String get netAuditTipsTitle => 'Propines';

  @override
  String get netAuditTipsBody =>
      'Una propina la gestiona l\'aplicació de Play Store, no pas aquesta, que continua sense tenir el permís d\'internet. La facturació sí que afegeix dues línies a la llista de permisos: «compres dins de l\'aplicació» i «veure les connexions de xarxa», que només llegeix si hi ha connexió i no en pot fer servir cap. No es compra res automàticament, i una propina no desbloqueja res: aquí totes les funcions són gratuïtes.';

  @override
  String get sectionSupport => 'Suport';

  @override
  String get rateApp => 'Valora l\'aplicació';

  @override
  String get openLicenses => 'Llicències de codi obert';

  @override
  String get presetAudioToMp3Title => 'Converteix l\'àudio';

  @override
  String get presetAudioToMp3Body => 'A MP3: es reprodueix a tot arreu';

  @override
  String get presetCompressAudioTitle => 'Comprimeix l\'àudio';

  @override
  String get presetCompressAudioBody =>
      'AAC més lleuger: notes de veu, podcasts';

  @override
  String get convertTo => 'Converteix a';

  @override
  String get formatSectionHint =>
      'Només es llisten els formats en què els teus fitxers es poden convertir realment.';

  @override
  String get sourceVideo => 'Vídeo';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Àudio';

  @override
  String get sourceUnknown => 'Fitxer';

  @override
  String get mixedSelectionTitle =>
      'S\'han seleccionat tipus de fitxer diferents';

  @override
  String get mixedSelectionBody =>
      'Cada fitxer es converteix amb el millor predefinit per al seu tipus. Afegeix un sol tipus cada vegada per tenir-ne el control complet.';

  @override
  String get filesTitle => 'Fitxers';

  @override
  String get removeFile => 'Suprimeix';

  @override
  String timeLeft(String time) {
    return '≈ $time restants';
  }

  @override
  String get jobSettingsTitle => 'Configuració de la conversió';

  @override
  String get jobDetails => 'Detalls';

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
  String get summaryEnhanced => 'Millorat';

  @override
  String get summaryMetadataStripped => 'Metadades eliminades';

  @override
  String summaryMerge(int count) {
    return 'Clips units: $count';
  }

  @override
  String get shareApp => 'Comparteix l\'aplicació';

  @override
  String get shareAppText =>
      'Eluna Media: un convertidor de fotos, vídeo i àudio gratuït i totalment fora de línia. Sense subscripcions, sense marques d\'aigua, sense comptes.';

  @override
  String appVersionLabel(String version) {
    return 'Versió $version';
  }

  @override
  String get openFile => 'Obre';

  @override
  String get openFolder => 'Mostra la carpeta';

  @override
  String get noAppToOpen =>
      'Cap aplicació d\'aquest dispositiu no pot obrir aquest fitxer.';

  @override
  String get openFailed => 'No s\'ha pogut obrir el fitxer.';

  @override
  String get twoPassLabel => 'Doble passada per a una mida exacta';

  @override
  String get twoPassHint =>
      'Les tasques d\'ajust a la mida es codifiquen dues vegades i encerten el pressupost de bytes força més bé, a canvi d\'aproximadament el doble de temps i de bateria.';

  @override
  String get whatsNewTitle => 'Novetats';

  @override
  String get whatsNew1 =>
      'El vídeo ja pot ser AV1: fitxers clarament més petits, si els pots esperar.';

  @override
  String get whatsNew2 =>
      'Nou per a les imatges: AVIF, més o menys la meitat d\'un JPEG, i WebP animat en lloc d\'un GIF.';

  @override
  String get whatsNew3 =>
      'L\'M4A pot ser sense pèrdua: ALAC ara acompanya AAC.';

  @override
  String get whatsNew4 =>
      'Una sola pantalla per a l\'aspecte: brillantor, color d\'accent, negre pur per a OLED i Material You.';

  @override
  String get whatsNew5 =>
      'Els assoliments tenen medalles, tres pestanyes i un progrés que pots compartir com a imatge.';

  @override
  String get achievementsTitle => 'Assoliments';

  @override
  String achievementsProgress(int done, int total) {
    return '$done de $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Es compten només en aquest dispositiu. No es puja res enlloc.';

  @override
  String get achFirstConversionTitle => 'Primers passos';

  @override
  String get achFirstConversionBody => 'Converteix el teu primer fitxer.';

  @override
  String get achTenConversionsTitle => 'Escalfant motors';

  @override
  String get achTenConversionsBody => 'Converteix 10 fitxers.';

  @override
  String get achFiftyConversionsTitle => 'Habitual';

  @override
  String get achFiftyConversionsBody => 'Converteix 50 fitxers.';

  @override
  String get achTwoHundredConversionsTitle => 'Cavall de batalla';

  @override
  String get achTwoHundredConversionsBody => 'Converteix 200 fitxers.';

  @override
  String get achThousandConversionsTitle => 'Cinta transportadora';

  @override
  String get achThousandConversionsBody => 'Converteix 1000 fitxers.';

  @override
  String get achSaved100MbTitle => 'Estalvi d\'espai';

  @override
  String get achSaved100MbBody => 'Allibera 100 MB en total.';

  @override
  String get achSaved1GbTitle => 'Caçador de gigabytes';

  @override
  String get achSaved1GbBody => 'Allibera 1 GB en total.';

  @override
  String get achSaved10GbTitle => 'Heroi de l\'emmagatzematge';

  @override
  String get achSaved10GbBody => 'Allibera 10 GB en total.';

  @override
  String get achBatchOfFiveTitle => 'Treballador per lots';

  @override
  String get achBatchOfFiveBody => 'Acaba un lot de 5 fitxers o més.';

  @override
  String get achBatchOfTwentyTitle => 'Línia de muntatge';

  @override
  String get achBatchOfTwentyBody => 'Acaba un lot de 20 fitxers o més.';

  @override
  String get achSniperTitle => 'Franctirador';

  @override
  String get achSniperBody => 'Encerta una mida exacta amb l\'ajust a la mida.';

  @override
  String get achMemeSmithTitle => 'Ferrer de memes';

  @override
  String get achMemeSmithBody => 'Converteix un vídeo en un GIF.';

  @override
  String get achSoundHunterTitle => 'Caçador de sons';

  @override
  String get achSoundHunterBody => 'Extreu l\'àudio d\'un vídeo.';

  @override
  String get achSubtitleKeeperTitle => 'Guardià dels subtítols';

  @override
  String get achSubtitleKeeperBody =>
      'Converteix un vídeo conservant-ne els subtítols.';

  @override
  String get achDirectorTitle => 'Director';

  @override
  String get achDirectorBody =>
      'Aplica una transformació: gir, retall, velocitat o volum.';

  @override
  String get achAllRounderTitle => 'Polivalent';

  @override
  String get achAllRounderBody => 'Converteix vídeo, àudio i una imatge.';

  @override
  String get achNightOwlTitle => 'Ocell nocturn';

  @override
  String get achNightOwlBody =>
      'Acaba una conversió entre la mitjanit i les 5 del matí.';

  @override
  String get achPlatinumTitle => 'Platí';

  @override
  String get achPlatinumBody => 'Aconsegueix tots els altres assoliments.';

  @override
  String get storageTitle => 'Emmagatzematge';

  @override
  String get storageBody =>
      'Els fitxers convertits es queden dins de l\'aplicació fins que els deses o els comparteixes, on cap gestor de fitxers no hi pot arribar.';

  @override
  String get storageEmpty => 'No hi ha res desat';

  @override
  String storageUsage(String size) {
    return 'Desat: $size';
  }

  @override
  String get storageClearTitle => 'Vols netejar els fitxers desats?';

  @override
  String get storageClearBody =>
      'Suprimeix tots els resultats acabats que l\'aplicació encara conserva. Els fitxers que ja has desat o compartit no es toquen.';

  @override
  String get storageClearAction => 'Neteja';

  @override
  String storageCleared(String size) {
    return 'S\'han alliberat $size';
  }

  @override
  String get autoSaveLabel => 'Desa els resultats automàticament';

  @override
  String get autoSaveHint =>
      'Posa cada fitxer acabat a la galeria —l\'àudio, a Baixades— tan bon punt està a punt.';

  @override
  String get lowSpaceTitle => 'Queda poc espai';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Aquest lot necessita uns $needed i només hi ha $free lliures. La conversió es pot aturar a mig camí.';
  }

  @override
  String saveAll(int count) {
    return 'Desa-ho tot ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Desats: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'S\'han desat $saved de $total';
  }

  @override
  String get presetFitPhotoTitle => 'Ajusta la foto a la mida';

  @override
  String get presetFitPhotoBody =>
      'Encabeix una imatge sota un límit exacte: formularis de pujada, sol·licituds.';

  @override
  String get photoFitHint =>
      'L\'aplicació prova qualitats fins que una hi cap. Si el pressupost és massa petit per a la imatge, també redueix la mida del marc.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Mida objectiu en KB';

  @override
  String get compareAction => 'Compara';

  @override
  String get compareBefore => 'Abans';

  @override
  String get compareAfter => 'Després';

  @override
  String get compareHint => 'Mantén premut per veure l\'original.';

  @override
  String get trimStart => 'Inici';

  @override
  String get trimEnd => 'Final';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, fins a $duration';
  }

  @override
  String get imageScaleLabel => 'Escala';

  @override
  String get audioChannelsLabel => 'Canals';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Estèreo';

  @override
  String get sampleRateLabel => 'Freqüència de mostreig';

  @override
  String get voiceAudioHint =>
      'Mono a 22,05 kHz redueix un enregistrament de veu aproximadament a una quarta part sense pèrdua audible. Per a música, deixa tots dos valors en original.';

  @override
  String get moveUp => 'Mou amunt';

  @override
  String get moveDown => 'Mou avall';

  @override
  String get renameOutput => 'Canvia el nom del resultat';

  @override
  String get renameOutputHint => 'Nom nou';

  @override
  String get renameOutputHelp =>
      'L\'extensió ve del format de sortida. Deixa-ho buit perquè el resultat prengui el nom de l\'origen.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Suprimeix els originals ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'Suprimeix els originals després de convertir';

  @override
  String get deleteOriginalsHint =>
      'Demana al sistema que elimini els fitxers d\'origen un cop desat el resultat. El sistema sempre mostra què s\'esborrarà i espera la teva confirmació.';

  @override
  String originalsDeleted(String size) {
    return 'Originals suprimits: s\'han alliberat $size';
  }

  @override
  String get originalsNoneDeleted =>
      'No s\'ha suprimit res. Només es poden trobar els fitxers que la galeria encara conserva amb el nom original.';

  @override
  String reclaimedTotal(String size) {
    return 'Alliberat amb aquesta aplicació: $size';
  }

  @override
  String get deleteAllData => 'Suprimeix totes les dades';

  @override
  String get deleteAllDataHint =>
      'Esborra tot el que l\'aplicació guarda en aquest dispositiu: la cua, els fitxers convertits, les previsualitzacions, els assoliments i la configuració. Els fitxers que ja has desat a la galeria no es toquen.';

  @override
  String get codecCopy => 'Còpia';

  @override
  String get codecCopyRemux => 'Còpia (remux)';

  @override
  String get codecNoVideo => 'Sense vídeo';

  @override
  String get codecNoAudio => 'Sense àudio';

  @override
  String codecLossless(String codec) {
    return '$codec (sense pèrdua)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (animat)';
  }

  @override
  String get sizeTargetEmail => 'Correu';

  @override
  String get trimTimeHint => 'm:ss';
}
