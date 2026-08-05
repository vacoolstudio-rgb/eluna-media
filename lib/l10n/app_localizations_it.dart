// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class L10nIt extends L10n {
  L10nIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Converti';

  @override
  String get tabQueue => 'Coda';

  @override
  String get tabAbout => 'Info';

  @override
  String get addFiles => 'Aggiungi file';

  @override
  String get emptySelectionTitle => 'Ancora nessun file';

  @override
  String get emptySelectionBody =>
      'Aggiungi foto, video o audio. Tutto viene elaborato su questo dispositivo.';

  @override
  String get sectionOutput => 'Output';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Immagine';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get outputFormat => 'Formato';

  @override
  String get videoCodec => 'Codec video';

  @override
  String get audioCodec => 'Codec audio';

  @override
  String get rateControl => 'Controllo del bitrate';

  @override
  String get rateControlQuality => 'Qualità costante (CRF)';

  @override
  String get rateControlBitrate => 'Bitrate target';

  @override
  String crfLabel(int value) {
    return 'Qualità (CRF $value)';
  }

  @override
  String get crfHint =>
      'Più basso significa qualità migliore e file più grande.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate video: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Preset dell\'encoder';

  @override
  String get encodingPresetHint =>
      'I preset più lenti comprimono meglio ma scaldano di più il dispositivo.';

  @override
  String get presetOriginal => 'Originale';

  @override
  String get resolution => 'Risoluzione';

  @override
  String get frameRate => 'Frequenza fotogrammi';

  @override
  String imageQuality(int value) {
    return 'Qualità: $value';
  }

  @override
  String get lossless => 'Senza perdita';

  @override
  String get losslessHint => 'File più grandi, risultato perfetto al pixel.';

  @override
  String get sectionEnhance => 'Miglioramento';

  @override
  String get sharpenLabel => 'Nitidezza';

  @override
  String get sharpenHint =>
      'Rende i bordi più definiti. Non può salvare uno scatto mosso o sfocato — quei dettagli nel file non ci sono.';

  @override
  String get sharpenStrongHint =>
      'Una nitidezza forte può lasciare aloni chiari lungo i bordi. Parti da «Medio».';

  @override
  String get denoiseLabel => 'Riduzione del rumore';

  @override
  String get denoiseHint =>
      'Ripulisce la grana nelle foto scure e notturne. Se esageri, si perdono i dettagli fini.';

  @override
  String get autoColorLabel => 'Colore e livelli automatici';

  @override
  String get autoColorHint =>
      'Allarga il contrasto e ravviva un po\' i colori spenti.';

  @override
  String get upscaleLabel => 'Ingrandisci 2×';

  @override
  String get upscaleHint =>
      'Raddoppia larghezza e altezza. Non aggiunge dettaglio — torna utile per la stampa o per ritagliare.';

  @override
  String get upscaleConflictHint =>
      'Per ingrandire, riporta «Risoluzione» su «Originale».';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Disattivato';

  @override
  String get enhanceLight => 'Leggero';

  @override
  String get enhanceMedium => 'Medio';

  @override
  String get enhanceStrong => 'Forte';

  @override
  String get stripMetadata => 'Rimuovi metadati';

  @override
  String get stripMetadataHint =>
      'Elimina EXIF, GPS e timestamp dal risultato.';

  @override
  String startConversion(int count) {
    return 'Converti $count file';
  }

  @override
  String get batchResumed => 'Conversione interrotta ripresa.';

  @override
  String get converting => 'Conversione in corso…';

  @override
  String get cancelBatch => 'Ferma';

  @override
  String get cancelJob => 'Annulla';

  @override
  String get clearFinished => 'Rimuovi completati';

  @override
  String get removeJob => 'Rimuovi';

  @override
  String get shareFile => 'Condividi';

  @override
  String get retryJob => 'Riprova';

  @override
  String get queueEmptyTitle => 'La coda è vuota';

  @override
  String get queueEmptyBody =>
      'I file aggiunti nella scheda Converti compaiono qui.';

  @override
  String queueActiveTab(int count) {
    return 'Attivi · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Completati · $count';
  }

  @override
  String get queueNoActiveTitle => 'Niente in corso';

  @override
  String get queueNoActiveBody =>
      'I file in attesa o in conversione compaiono qui.';

  @override
  String get queueNoFinishedTitle => 'Ancora niente di completato';

  @override
  String get queueNoFinishedBody =>
      'I file convertiti finiscono qui, pronti da aprire, salvare o condividere.';

  @override
  String get statusQueued => 'In coda';

  @override
  String get statusRunning => 'In conversione';

  @override
  String get statusCompleted => 'Fatto';

  @override
  String get statusFailed => 'Errore';

  @override
  String get statusCancelled => 'Annullato';

  @override
  String batchSummary(int done, int total) {
    return '$done di $total completati';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done file convertiti',
      one: '1 file convertito',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Convertiti: $done, falliti: $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% più piccolo';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% più grande';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Aspetto';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get language => 'Lingua';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyBody =>
      'Eluna Media converte i tuoi file interamente su questo dispositivo con una copia integrata di FFmpeg. I file non lasciano mai il dispositivo, non serve alcun account e non c\'è telemetria. Nulla nell\'app usa la rete: non ha nemmeno il permesso di accesso a Internet.\n\nLa rimozione dei metadati è attiva per impostazione predefinita, quindi EXIF, coordinate GPS e timestamp vengono eliminati dai file esportati.';

  @override
  String get licenseTitle => 'Licenza';

  @override
  String get licenseBody =>
      'Questa app include FFmpeg compilato con x264, x265 e altri componenti GPL, perciò l\'applicazione nel suo insieme è distribuita sotto licenza GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Questo formato non supporta il codec selezionato.';

  @override
  String get sourceMissing => 'Il file di origine non è più disponibile.';

  @override
  String get errorTitle => 'Conversione non riuscita';

  @override
  String get tabSettings => 'Impostazioni';

  @override
  String get introTitle => 'Privato per design';

  @override
  String get introOfflineTitle => 'Converte su questo dispositivo';

  @override
  String get introOfflineBody =>
      'Tutto il lavoro lo fa una copia integrata di FFmpeg. I file non lasciano mai il telefono — la conversione funziona anche in modalità aereo.';

  @override
  String get introTelemetryTitle => 'Zero telemetria';

  @override
  String get introTelemetryBody =>
      'Nessun account, nessuna analisi, nessun report dei crash. L\'app non sa chi sei.';

  @override
  String get introMetadataTitle => 'Metadati sotto controllo';

  @override
  String get introMetadataBody =>
      'EXIF, GPS e timestamp vengono rimossi da ogni output per impostazione predefinita. Puoi disattivarlo.';

  @override
  String get introFreeNote =>
      'Gratis: nessuna pubblicità, nessun abbonamento, nessun acquisto in-app. Tutte le funzioni, conversione in blocco inclusa, sono già tue.';

  @override
  String get introContinue => 'Inizia';

  @override
  String get modeSimple => 'Semplice';

  @override
  String get modeAdvanced => 'Avanzato';

  @override
  String get modeAdvancedHint =>
      'Mostra tutti i controlli di codec, bitrate e trasformazione al posto delle schede dei preset.';

  @override
  String get presetCompressVideoTitle => 'Comprimi video';

  @override
  String get presetCompressVideoBody =>
      'MP4 molto più piccolo, la qualità resta buona';

  @override
  String get presetFitToSizeTitle => 'Adatta alla dimensione';

  @override
  String get presetFitToSizeBody =>
      'Centra un limite esatto — Discord, email, chat';

  @override
  String get presetCompatibleMp4Title => 'MP4 compatibile';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Si riproduce ovunque';

  @override
  String get presetExtractAudioTitle => 'Estrai audio';

  @override
  String get presetExtractAudioBody => 'MP3 da qualsiasi video';

  @override
  String get presetVideoToGifTitle => 'Video in GIF';

  @override
  String get presetVideoToGifBody => 'Una clip breve in una GIF animata';

  @override
  String get presetMergeTitle => 'Unisci video';

  @override
  String get presetMergeBody => 'Unisce le clip in un unico MP4, in ordine';

  @override
  String get mergeNeedsTwo => 'Seleziona almeno due video da unire.';

  @override
  String mergedVideoName(int count) {
    return 'Video unito ($count clip).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Comprimi foto';

  @override
  String get presetCompressImageBody =>
      'JPEG più piccolo, perdita quasi invisibile';

  @override
  String get presetEnhancePhotoTitle => 'Migliora foto';

  @override
  String get presetEnhancePhotoBody =>
      'Più pulita, più nitida, colori migliori';

  @override
  String get presetImageToWebpTitle => 'Foto in WebP';

  @override
  String get presetImageToWebpBody => 'Formato moderno, più piccolo del JPEG';

  @override
  String get sizeTargetTitle => 'Dimensione target';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Personalizzata…';

  @override
  String get sizeTargetDialogTitle => 'Dimensione target in MB';

  @override
  String get sizeTargetTooSmall =>
      'Il target è troppo piccolo per questa durata; verrà usata la qualità più vicina possibile.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size per file';
  }

  @override
  String estimateTotal(String size) {
    return 'Dimensione stimata: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file selezionati',
      one: '1 file selezionato',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Svuota';

  @override
  String get presetExpectsVideo => 'Questo preset richiede file video.';

  @override
  String get presetExpectsImage => 'Questo preset richiede immagini.';

  @override
  String get promiseOffline => 'Conversione 100% offline';

  @override
  String get promiseBatchFree => 'L\'elaborazione in serie è gratis';

  @override
  String get promiseNoWatermark => 'Nessun watermark';

  @override
  String get sectionTransform => 'Trasforma';

  @override
  String get rotateLabel => 'Ruota';

  @override
  String get flipLabel => 'Specchia orizzontalmente';

  @override
  String get speedLabel => 'Velocità';

  @override
  String get cropLabel => 'Ritaglia';

  @override
  String get cropHint =>
      'Ritaglio centrato al rapporto scelto — quadrato per i feed, 9:16 per le storie.';

  @override
  String volumeLabel(int percent) {
    return 'Volume: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio e altri file';

  @override
  String get hwEncoderLabel => 'Codifica hardware';

  @override
  String get hwEncoderHint =>
      'Usa il chip video del dispositivo nelle modalità bitrate e dimensione target — molto più veloce e con meno calore. La modalità qualità (CRF) usa sempre il preciso encoder software, e un lavoro hardware fallito viene ritentato automaticamente via software.';

  @override
  String get transformNeedsReencode =>
      'Rotazione, specchio e velocità richiedono la ricodifica, quindi sono disattivati durante la copia dello stream.';

  @override
  String get capBitrateLabel => 'Non ingrandire mai il file';

  @override
  String get capBitrateHint =>
      'Limita la codifica al bitrate del file originale. La qualità costante non ha un tetto proprio, quindi un video già compresso potrebbe altrimenti risultare più grande.';

  @override
  String get keepSubtitles => 'Mantieni i sottotitoli';

  @override
  String get keepSubtitlesHint =>
      'Trasferisce le tracce dei sottotitoli nel risultato. Solo sottotitoli di testo.';

  @override
  String get sectionTrim => 'Taglio';

  @override
  String get trimEnable => 'Taglia l\'originale';

  @override
  String get trimHint =>
      'Disponibile quando in coda c\'è esattamente un file con durata nota.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Dimensione target';

  @override
  String get lowBatteryTitle => 'Batteria quasi scarica';

  @override
  String get lowBatteryBody =>
      'La conversione mette sotto sforzo il processore. Puoi prima collegare il caricabatterie, oppure continuare comunque.';

  @override
  String get lowBatteryContinue => 'Converti comunque';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ricevuti $count file',
      one: 'Ricevuto 1 file',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Salva';

  @override
  String get savedToGallery => 'Salvato nella galleria, album «Eluna Media».';

  @override
  String get savedToDownloads => 'Salvato in Download.';

  @override
  String get saveFailed => 'Impossibile salvare il file.';

  @override
  String get jobRemovedUndo => 'Attività rimossa.';

  @override
  String get finishedClearedUndo => 'Attività completate rimosse.';

  @override
  String get undo => 'Annulla';

  @override
  String get errorDetailsTitle => 'Dettagli dell\'errore';

  @override
  String get oledDark => 'Tema scuro nero assoluto';

  @override
  String get oledDarkHint =>
      'Il nero vero risparmia energia sugli schermi OLED.';

  @override
  String get dynamicColorLabel => 'Colori di sistema (Material You)';

  @override
  String get dynamicColorHint =>
      'Segue la palette dello sfondo del dispositivo, dove supportato.';

  @override
  String get sectionConversionPrefs => 'Conversione';

  @override
  String get powerModeLabel => 'Modalità energetica';

  @override
  String get powerEfficiency => 'Fresco e veloce';

  @override
  String get powerBalanced => 'Bilanciato';

  @override
  String get powerQuality => 'Compressione massima';

  @override
  String get powerModeHint =>
      'Quanto intensamente lavora l\'encoder video. Più fresco e veloce significa file un po\' più grandi. Nient\'altro viene limitato — mai.';

  @override
  String get hapticsLabel => 'Feedback aptico';

  @override
  String get networkPrivacyTitle => 'Rete e privacy';

  @override
  String get netAuditIntro =>
      'L\'elenco completo di tutto ciò che in questa app può toccare la rete.';

  @override
  String get netAuditNoneTitle => 'Nessun accesso alla rete';

  @override
  String get netAuditNoneBody =>
      'L\'app non chiede il permesso di accesso a Internet, quindi non può raggiungere la rete nemmeno volendo — puoi verificarlo nelle informazioni di sistema dell\'app. Niente pubblicità, niente analisi, nessun controllo aggiornamenti. «Valuta l\'app» passa la parola allo store, che si collega per conto suo.';

  @override
  String get netAuditConversionTitle => 'Conversione';

  @override
  String get netAuditConversionBody =>
      'Avviene interamente su questo dispositivo tramite un FFmpeg integrato. Attiva la modalità aereo e converti — funziona.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Non c\'è. L\'app non raccoglie analisi, né report dei crash, né identificatori, e non ha alcun sistema di account.';

  @override
  String get sectionSupport => 'Sostegno';

  @override
  String get rateApp => 'Valuta l\'app';

  @override
  String get openLicenses => 'Licenze open source';

  @override
  String get errorFallbackTitle => 'Qualcosa è andato storto';

  @override
  String get errorFallbackBody =>
      'L\'app ha incontrato un errore imprevisto. La coda e le impostazioni sono al sicuro — torna indietro e riprova.';

  @override
  String get presetAudioToMp3Title => 'Converti audio';

  @override
  String get presetAudioToMp3Body => 'In MP3 — si sente ovunque';

  @override
  String get presetCompressAudioTitle => 'Comprimi audio';

  @override
  String get presetCompressAudioBody =>
      'AAC più leggero — note vocali, podcast';

  @override
  String get convertTo => 'Converti in';

  @override
  String get formatRecommended => 'Consigliato';

  @override
  String get formatSectionHint =>
      'Sono elencati solo i formati in cui i tuoi file possono davvero diventare.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'File';

  @override
  String get mixedSelectionTitle => 'Hai selezionato tipi di file diversi';

  @override
  String get mixedSelectionBody =>
      'Ogni file viene convertito con il preset migliore per il suo tipo. Aggiungi un tipo alla volta se vuoi il controllo completo.';

  @override
  String get filesTitle => 'File';

  @override
  String get removeFile => 'Rimuovi';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time rimanenti';
  }

  @override
  String get jobSettingsTitle => 'Impostazioni di conversione';

  @override
  String get jobDetails => 'Dettagli';

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
  String get summaryTwoPass => 'Due passaggi';

  @override
  String get summaryEnhanced => 'Migliorata';

  @override
  String get summaryMetadataStripped => 'Metadati rimossi';

  @override
  String summaryMerge(int count) {
    return '$count clip unite';
  }

  @override
  String get rateDialogTitle => 'Ti piace Eluna Media?';

  @override
  String get rateDialogBody =>
      'Tocca una stella. La tua valutazione resta tra te e lo store.';

  @override
  String get rateDialogLater => 'Non ora';

  @override
  String get rateFeedbackTitle => 'Cosa possiamo migliorare?';

  @override
  String get rateFeedbackBody =>
      'Raccontaci cosa non ha funzionato e lo sistemiamo. Nessun account, nessun tracciamento: solo un\'email che scrivi tu.';

  @override
  String get rateSendFeedback => 'Scrivi un feedback';

  @override
  String get rateThanks => 'Grazie!';

  @override
  String feedbackSubject(int stars) {
    return 'Feedback su Eluna Media ($stars/5)';
  }

  @override
  String get noEmailApp =>
      'Su questo dispositivo non è configurata nessuna app di posta.';

  @override
  String get shareApp => 'Condividi l\'app';

  @override
  String get shareAppText =>
      'Eluna Media — un convertitore gratuito di foto, video e audio, completamente offline. Nessun abbonamento, nessuna filigrana, nessun account.';

  @override
  String appVersionLabel(String version) {
    return 'Versione $version';
  }

  @override
  String get openFile => 'Apri';

  @override
  String get openFolder => 'Mostra cartella';

  @override
  String get noAppToOpen =>
      'Nessuna app su questo dispositivo può aprire quel file.';

  @override
  String get openFailed => 'Impossibile aprire il file.';

  @override
  String get twoPassLabel => 'Due passaggi per la dimensione esatta';

  @override
  String get twoPassHint =>
      'I lavori a dimensione target codificano due volte e centrano il budget di byte con precisione nettamente maggiore — al costo di circa il doppio di tempo e batteria.';

  @override
  String get whatsNewTitle => 'Novità';

  @override
  String get whatsNew1 =>
      'I file completati finiscono subito nella galleria e «Salva tutto» prende l’intero lotto in una volta.';

  @override
  String get whatsNew2 =>
      'Porta una foto a una dimensione esatta: da 100 KB a 2 MB, o il valore che scrivi.';

  @override
  String get whatsNew3 =>
      'L’app non accumula più gigabyte: le impostazioni mostrano lo spazio occupato e lo liberano.';

  @override
  String get whatsNew4 =>
      'Ferma una conversione dalla notifica e ricevi un avviso prima che lo spazio finisca.';

  @override
  String get whatsNew5 =>
      'Miniature, confronto prima/dopo, GIF → MP4, tempi di taglio esatti — e le foto vengono elaborate più di una alla volta.';

  @override
  String get achievementsTitle => 'Obiettivi';

  @override
  String achievementsProgress(int done, int total) {
    return '$done di $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Obiettivo sbloccato: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Contati solo su questo dispositivo. Nulla viene caricato da nessuna parte.';

  @override
  String get achFirstConversionTitle => 'Primi passi';

  @override
  String get achFirstConversionBody => 'Converti il tuo primo file.';

  @override
  String get achTenConversionsTitle => 'Riscaldamento';

  @override
  String get achTenConversionsBody => 'Converti 10 file.';

  @override
  String get achFiftyConversionsTitle => 'Habitué';

  @override
  String get achFiftyConversionsBody => 'Converti 50 file.';

  @override
  String get achTwoHundredConversionsTitle => 'Stakanovista';

  @override
  String get achTwoHundredConversionsBody => 'Converti 200 file.';

  @override
  String get achThousandConversionsTitle => 'Catena di montaggio';

  @override
  String get achThousandConversionsBody => 'Converti 1000 file.';

  @override
  String get achSaved100MbTitle => 'Salvaspazio';

  @override
  String get achSaved100MbBody => 'Libera 100 MB in totale.';

  @override
  String get achSaved1GbTitle => 'Cacciatore di gigabyte';

  @override
  String get achSaved1GbBody => 'Libera 1 GB in totale.';

  @override
  String get achSaved10GbTitle => 'Eroe dell\'archiviazione';

  @override
  String get achSaved10GbBody => 'Libera 10 GB in totale.';

  @override
  String get achBatchOfFiveTitle => 'Lavoro in serie';

  @override
  String get achBatchOfFiveBody => 'Completa un lotto di 5 o più file.';

  @override
  String get achBatchOfTwentyTitle => 'Linea di produzione';

  @override
  String get achBatchOfTwentyBody => 'Completa un lotto di 20 o più file.';

  @override
  String get achSniperTitle => 'Cecchino';

  @override
  String get achSniperBody =>
      'Centra una dimensione esatta con «Adatta alla dimensione».';

  @override
  String get achMemeSmithTitle => 'Fabbro di meme';

  @override
  String get achMemeSmithBody => 'Trasforma un video in una GIF.';

  @override
  String get achSoundHunterTitle => 'Cacciatore di suoni';

  @override
  String get achSoundHunterBody => 'Estrai l\'audio da un video.';

  @override
  String get achSubtitleKeeperTitle => 'Custode dei sottotitoli';

  @override
  String get achSubtitleKeeperBody =>
      'Converti un video mantenendo i sottotitoli.';

  @override
  String get achDirectorTitle => 'Regista';

  @override
  String get achDirectorBody =>
      'Applica una trasformazione — rotazione, ritaglio, velocità o volume.';

  @override
  String get achAllRounderTitle => 'Tuttofare';

  @override
  String get achAllRounderBody => 'Converti un video, un audio e un\'immagine.';

  @override
  String get achNightOwlTitle => 'Gufo notturno';

  @override
  String get achNightOwlBody =>
      'Completa una conversione tra mezzanotte e le 5 del mattino.';

  @override
  String get achPlatinumTitle => 'Platino';

  @override
  String get achPlatinumBody => 'Sblocca tutti gli altri obiettivi.';

  @override
  String get storageTitle => 'Archiviazione';

  @override
  String get storageBody =>
      'I file convertiti restano nell\'app finché non li salvi o condividi: nessun gestore file può raggiungerli.';

  @override
  String get storageEmpty => 'Niente in archivio';

  @override
  String storageUsage(String size) {
    return 'Occupati: $size';
  }

  @override
  String get storageClearTitle => 'Cancellare i file archiviati?';

  @override
  String get storageClearBody =>
      'Elimina tutti i risultati completati ancora conservati dall\'app. I file già salvati o condivisi non vengono toccati.';

  @override
  String get storageClearAction => 'Cancella';

  @override
  String storageCleared(String size) {
    return 'Liberati $size';
  }

  @override
  String get autoSaveLabel => 'Salva i risultati automaticamente';

  @override
  String get autoSaveHint =>
      'Mette ogni file completato nella galleria — l\'audio in Download — appena è pronto.';

  @override
  String get lowSpaceTitle => 'Spazio quasi esaurito';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Questo lotto richiede circa $needed e sono liberi solo $free. La conversione potrebbe interrompersi a metà.';
  }

  @override
  String saveAll(int count) {
    return 'Salva tutto ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Salvati: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Salvati $saved su $total';
  }

  @override
  String get presetFitPhotoTitle => 'Foto entro una dimensione';

  @override
  String get presetFitPhotoBody =>
      'Comprimi un\'immagine sotto un limite preciso: moduli di caricamento, domande.';

  @override
  String get photoFitHint =>
      'L\'app prova varie qualità finché una ci sta. Se il limite è troppo basso, riduce anche le dimensioni dell\'immagine.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Dimensione target in KB';

  @override
  String get compareAction => 'Confronta';

  @override
  String get compareBefore => 'Prima';

  @override
  String get compareAfter => 'Dopo';

  @override
  String get compareHint => 'Tieni premuto per vedere l\'originale.';

  @override
  String get trimStart => 'Inizio';

  @override
  String get trimEnd => 'Fine';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, fino a $duration';
  }

  @override
  String get imageScaleLabel => 'Scala';

  @override
  String get audioChannelsLabel => 'Canali';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Frequenza di campionamento';

  @override
  String get voiceAudioHint =>
      'Mono a 22,05 kHz riduce di circa quattro volte una registrazione vocale senza perdite udibili. Per la musica lascia entrambi come l\'originale.';

  @override
  String get moveUp => 'Sposta su';

  @override
  String get moveDown => 'Sposta giù';

  @override
  String get renameOutput => 'Rinomina risultato';

  @override
  String get renameOutputHint => 'Nuovo nome';

  @override
  String get renameOutputHelp =>
      'L\'estensione dipende dal formato di uscita. Lascia vuoto per dare al risultato il nome dell\'originale.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Elimina originali ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Elimina gli originali dopo la conversione';

  @override
  String get deleteOriginalsHint =>
      'Chiede al sistema di rimuovere i file di origine una volta salvato il risultato. Il sistema mostra sempre cosa sparirà e attende la tua conferma.';

  @override
  String originalsDeleted(String size) {
    return 'Originali eliminati — $size liberati';
  }

  @override
  String get originalsNoneDeleted =>
      'Non è stato eliminato nulla. Si trovano solo i file che la galleria conserva con il nome originale.';

  @override
  String reclaimedTotal(String size) {
    return 'Liberato con questa app: $size';
  }
}
