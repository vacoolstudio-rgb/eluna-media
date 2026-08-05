// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Convertir';

  @override
  String get tabQueue => 'Cola';

  @override
  String get tabAbout => 'Acerca de';

  @override
  String get addFiles => 'Añadir archivos';

  @override
  String get emptySelectionTitle => 'Aún no hay archivos';

  @override
  String get emptySelectionBody =>
      'Añade fotos, vídeos o audio. Todo se procesa en este dispositivo.';

  @override
  String get sectionOutput => 'Salida';

  @override
  String get sectionVideo => 'Vídeo';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Imagen';

  @override
  String get sectionPrivacy => 'Privacidad';

  @override
  String get outputFormat => 'Formato';

  @override
  String get videoCodec => 'Códec de vídeo';

  @override
  String get audioCodec => 'Códec de audio';

  @override
  String get rateControl => 'Control de bitrate';

  @override
  String get rateControlQuality => 'Calidad constante (CRF)';

  @override
  String get rateControlBitrate => 'Bitrate objetivo';

  @override
  String crfLabel(int value) {
    return 'Calidad (CRF $value)';
  }

  @override
  String get crfHint => 'Cuanto más bajo, mejor calidad y archivo más grande.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate de vídeo: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate de audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Preset del codificador';

  @override
  String get encodingPresetHint =>
      'Los presets más lentos comprimen mejor, pero calientan más el dispositivo.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Resolución';

  @override
  String get frameRate => 'Fotogramas por segundo';

  @override
  String imageQuality(int value) {
    return 'Calidad: $value';
  }

  @override
  String get lossless => 'Sin pérdida';

  @override
  String get losslessHint =>
      'Archivos más grandes, resultado perfecto píxel a píxel.';

  @override
  String get sectionEnhance => 'Mejora';

  @override
  String get sharpenLabel => 'Nitidez';

  @override
  String get sharpenHint =>
      'Define mejor los bordes. No puede recuperar una foto movida o desenfocada — ese detalle ya no está en el archivo.';

  @override
  String get sharpenStrongHint =>
      'Una nitidez alta puede dejar halos claros en los bordes. Empieza por «Medio».';

  @override
  String get denoiseLabel => 'Reducción de ruido';

  @override
  String get denoiseHint =>
      'Limpia el grano de las fotos oscuras y nocturnas. Si te pasas, se pierde el detalle fino.';

  @override
  String get autoColorLabel => 'Color y niveles automáticos';

  @override
  String get autoColorHint =>
      'Estira el contraste y aviva un poco los colores apagados.';

  @override
  String get upscaleLabel => 'Ampliar 2×';

  @override
  String get upscaleHint =>
      'Duplica el ancho y el alto. No añade detalle — viene bien para imprimir o recortar.';

  @override
  String get upscaleConflictHint =>
      'Para ampliar, vuelve a poner «Resolución» en «Original».';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Desactivado';

  @override
  String get enhanceLight => 'Bajo';

  @override
  String get enhanceMedium => 'Medio';

  @override
  String get enhanceStrong => 'Alto';

  @override
  String get stripMetadata => 'Eliminar metadatos';

  @override
  String get stripMetadataHint =>
      'Quita EXIF, GPS y marcas de tiempo del resultado.';

  @override
  String startConversion(int count) {
    return 'Convertir $count archivos';
  }

  @override
  String get batchResumed => 'Se reanudó la conversión interrumpida.';

  @override
  String get converting => 'Convirtiendo…';

  @override
  String get cancelBatch => 'Detener';

  @override
  String get cancelJob => 'Cancelar';

  @override
  String get clearFinished => 'Limpiar terminados';

  @override
  String get removeJob => 'Eliminar';

  @override
  String get shareFile => 'Compartir';

  @override
  String get retryJob => 'Reintentar';

  @override
  String get queueEmptyTitle => 'La cola está vacía';

  @override
  String get queueEmptyBody =>
      'Los archivos que añadas en la pestaña Convertir aparecerán aquí.';

  @override
  String queueActiveTab(int count) {
    return 'Activos · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Terminados · $count';
  }

  @override
  String get queueNoActiveTitle => 'No hay nada en curso';

  @override
  String get queueNoActiveBody =>
      'Los archivos en espera o en conversión aparecen aquí.';

  @override
  String get queueNoFinishedTitle => 'Todavía no hay nada terminado';

  @override
  String get queueNoFinishedBody =>
      'Los archivos convertidos aparecen aquí, listos para abrir, guardar o compartir.';

  @override
  String get statusQueued => 'En cola';

  @override
  String get statusRunning => 'Convirtiendo';

  @override
  String get statusCompleted => 'Listo';

  @override
  String get statusFailed => 'Error';

  @override
  String get statusCancelled => 'Cancelado';

  @override
  String batchSummary(int done, int total) {
    return '$done de $total listos';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done archivos convertidos',
      one: '1 archivo convertido',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Convertidos: $done, con error: $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% más pequeño';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% más grande';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get privacyTitle => 'Privacidad';

  @override
  String get privacyBody =>
      'Eluna Media convierte tus archivos por completo en este dispositivo con una copia integrada de FFmpeg. Tus archivos nunca salen del dispositivo, no hace falta cuenta y no hay telemetría. Nada en la app usa la red: ni siquiera tiene el permiso de internet.\n\nLa eliminación de metadatos está activada por defecto, así que EXIF, coordenadas GPS y marcas de tiempo se quitan de los archivos que exportas.';

  @override
  String get licenseTitle => 'Licencia';

  @override
  String get licenseBody =>
      'Esta app incluye FFmpeg compilado con x264, x265 y otros componentes GPL, por lo que la aplicación en su conjunto se distribuye bajo la GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Este formato no admite el códec seleccionado.';

  @override
  String get sourceMissing => 'El archivo de origen ya no está disponible.';

  @override
  String get errorTitle => 'Error en la conversión';

  @override
  String get tabSettings => 'Ajustes';

  @override
  String get introTitle => 'Privado por diseño';

  @override
  String get introOfflineTitle => 'Convierte en este dispositivo';

  @override
  String get introOfflineBody =>
      'Todo el trabajo lo hace una copia integrada de FFmpeg. Tus archivos nunca salen del teléfono — la conversión funciona en modo avión.';

  @override
  String get introTelemetryTitle => 'Cero telemetría';

  @override
  String get introTelemetryBody =>
      'Sin cuenta, sin analíticas, sin informes de fallos. La app no sabe quién eres.';

  @override
  String get introMetadataTitle => 'Metadatos bajo control';

  @override
  String get introMetadataBody =>
      'EXIF, GPS y marcas de tiempo se eliminan de cada resultado por defecto. Puedes desactivarlo.';

  @override
  String get introFreeNote =>
      'Gratis: sin anuncios, sin suscripciones y sin compras dentro de la app. Todas las funciones, incluida la conversión por lotes, están incluidas.';

  @override
  String get introContinue => 'Empezar';

  @override
  String get modeSimple => 'Simple';

  @override
  String get modeAdvanced => 'Avanzado';

  @override
  String get modeAdvancedHint =>
      'Muestra todos los controles de códec, bitrate y transformación en lugar de las tarjetas de preset.';

  @override
  String get presetCompressVideoTitle => 'Comprimir vídeo';

  @override
  String get presetCompressVideoBody =>
      'MP4 mucho más pequeño, la calidad se mantiene';

  @override
  String get presetFitToSizeTitle => 'Ajustar al tamaño';

  @override
  String get presetFitToSizeBody =>
      'Clava un límite exacto — Discord, correo, chats';

  @override
  String get presetCompatibleMp4Title => 'MP4 compatible';

  @override
  String get presetCompatibleMp4Body =>
      'H.264 + AAC. Se reproduce en todas partes';

  @override
  String get presetExtractAudioTitle => 'Extraer audio';

  @override
  String get presetExtractAudioBody => 'MP3 de cualquier vídeo';

  @override
  String get presetVideoToGifTitle => 'Vídeo a GIF';

  @override
  String get presetVideoToGifBody => 'Un clip corto en un GIF animado';

  @override
  String get presetMergeTitle => 'Unir vídeos';

  @override
  String get presetMergeBody => 'Une clips en un solo MP4, en orden';

  @override
  String get mergeNeedsTwo => 'Selecciona al menos dos vídeos para unirlos.';

  @override
  String mergedVideoName(int count) {
    return 'Vídeo unido ($count clips).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Comprimir foto';

  @override
  String get presetCompressImageBody =>
      'JPEG más pequeño, pérdida casi invisible';

  @override
  String get presetEnhancePhotoTitle => 'Mejorar foto';

  @override
  String get presetEnhancePhotoBody => 'Más limpia, más nítida, mejor color';

  @override
  String get presetImageToWebpTitle => 'Foto a WebP';

  @override
  String get presetImageToWebpBody => 'Formato moderno, más pequeño que JPEG';

  @override
  String get sizeTargetTitle => 'Tamaño objetivo';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Personalizado…';

  @override
  String get sizeTargetDialogTitle => 'Tamaño objetivo en MB';

  @override
  String get sizeTargetTooSmall =>
      'El objetivo es demasiado pequeño para esta duración; se usará la calidad más cercana posible.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size por archivo';
  }

  @override
  String estimateTotal(String size) {
    return 'Tamaño estimado: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos seleccionados',
      one: '1 archivo seleccionado',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Limpiar';

  @override
  String get presetExpectsVideo => 'Este preset espera archivos de vídeo.';

  @override
  String get presetExpectsImage => 'Este preset espera imágenes.';

  @override
  String get promiseOffline => 'Conversión 100% sin conexión';

  @override
  String get promiseBatchFree => 'El procesamiento por lotes es gratis';

  @override
  String get promiseNoWatermark => 'Sin marca de agua';

  @override
  String get sectionTransform => 'Transformar';

  @override
  String get rotateLabel => 'Rotar';

  @override
  String get flipLabel => 'Voltear horizontalmente';

  @override
  String get speedLabel => 'Velocidad';

  @override
  String get cropLabel => 'Recortar';

  @override
  String get cropHint =>
      'Recorte centrado a la proporción elegida — cuadrado para el feed, 9:16 para historias.';

  @override
  String volumeLabel(int percent) {
    return 'Volumen: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio y otros archivos';

  @override
  String get hwEncoderLabel => 'Codificación por hardware';

  @override
  String get hwEncoderHint =>
      'Usa el chip de vídeo del dispositivo en los modos de bitrate y tamaño objetivo — mucho más rápido y sin calentar tanto. El modo de calidad (CRF) usa siempre el codificador por software, más preciso, y si un trabajo por hardware falla se reintenta automáticamente por software.';

  @override
  String get transformNeedsReencode =>
      'Rotar, voltear y cambiar la velocidad requieren recodificar, así que están desactivados durante una copia de stream.';

  @override
  String get capBitrateLabel => 'Nunca agrandar el archivo';

  @override
  String get capBitrateHint =>
      'Limita la codificación al bitrate del original. La calidad constante no tiene un techo propio, así que un vídeo ya comprimido podría salir más grande.';

  @override
  String get keepSubtitles => 'Mantener subtítulos';

  @override
  String get keepSubtitlesHint =>
      'Traslada las pistas de subtítulos al resultado. Solo subtítulos de texto.';

  @override
  String get sectionTrim => 'Recortar duración';

  @override
  String get trimEnable => 'Recortar el original';

  @override
  String get trimHint =>
      'Disponible cuando hay exactamente un archivo con duración conocida en la cola.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Tamaño objetivo';

  @override
  String get lowBatteryTitle => 'Batería baja';

  @override
  String get lowBatteryBody =>
      'Convertir exige mucho al procesador. Puedes enchufar el cargador primero, o continuar de todos modos.';

  @override
  String get lowBatteryContinue => 'Convertir igualmente';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos recibidos',
      one: '1 archivo recibido',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Guardar';

  @override
  String get savedToGallery => 'Guardado en la galería, álbum «Eluna Media».';

  @override
  String get savedToDownloads => 'Guardado en Descargas.';

  @override
  String get saveFailed => 'No se pudo guardar el archivo.';

  @override
  String get jobRemovedUndo => 'Tarea eliminada.';

  @override
  String get finishedClearedUndo => 'Tareas terminadas eliminadas.';

  @override
  String get undo => 'Deshacer';

  @override
  String get errorDetailsTitle => 'Detalles del error';

  @override
  String get oledDark => 'Tema oscuro negro puro';

  @override
  String get oledDarkHint => 'El negro real ahorra energía en pantallas OLED.';

  @override
  String get dynamicColorLabel => 'Colores del sistema (Material You)';

  @override
  String get dynamicColorHint =>
      'Sigue la paleta del fondo de pantalla donde sea compatible.';

  @override
  String get sectionConversionPrefs => 'Conversión';

  @override
  String get powerModeLabel => 'Modo de energía';

  @override
  String get powerEfficiency => 'Frío y rápido';

  @override
  String get powerBalanced => 'Equilibrado';

  @override
  String get powerQuality => 'Compresión máxima';

  @override
  String get powerModeHint =>
      'Cuánto se esfuerza el codificador de vídeo. Más frío y rápido significa archivos algo más grandes. Nada más se limita — nunca.';

  @override
  String get hapticsLabel => 'Respuesta háptica';

  @override
  String get networkPrivacyTitle => 'Red y privacidad';

  @override
  String get netAuditIntro =>
      'La lista completa de todo lo que en esta app puede tocar la red.';

  @override
  String get netAuditNoneTitle => 'Sin acceso a la red, en absoluto';

  @override
  String get netAuditNoneBody =>
      'La app no pide el permiso de internet, así que no puede salir a la red aunque quisiera — puedes comprobarlo en la información del sistema. Sin anuncios, sin analíticas, sin comprobación de actualizaciones. «Valorar la app» cede el paso a la tienda, que es quien se conecta.';

  @override
  String get netAuditConversionTitle => 'Conversión';

  @override
  String get netAuditConversionBody =>
      'Se ejecuta por completo en este dispositivo con un FFmpeg integrado. Activa el modo avión y convierte — funciona.';

  @override
  String get netAuditTelemetryTitle => 'Telemetría';

  @override
  String get netAuditTelemetryBody =>
      'No hay. La app no recopila analíticas, ni informes de fallos, ni identificadores, y no tiene sistema de cuentas.';

  @override
  String get sectionSupport => 'Apoyo';

  @override
  String get rateApp => 'Valorar la app';

  @override
  String get openLicenses => 'Licencias de código abierto';

  @override
  String get errorFallbackTitle => 'Algo salió mal';

  @override
  String get errorFallbackBody =>
      'La app encontró un error inesperado. Tu cola y tus ajustes están a salvo — vuelve atrás e inténtalo de nuevo.';

  @override
  String get presetAudioToMp3Title => 'Convertir audio';

  @override
  String get presetAudioToMp3Body => 'A MP3 — suena en cualquier parte';

  @override
  String get presetCompressAudioTitle => 'Comprimir audio';

  @override
  String get presetCompressAudioBody =>
      'AAC más ligero — notas de voz, pódcasts';

  @override
  String get convertTo => 'Convertir a';

  @override
  String get formatRecommended => 'Recomendado';

  @override
  String get formatSectionHint =>
      'Solo se listan los formatos a los que tus archivos pueden convertirse de verdad.';

  @override
  String get sourceVideo => 'Vídeo';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Archivo';

  @override
  String get mixedSelectionTitle =>
      'Has seleccionado tipos de archivo distintos';

  @override
  String get mixedSelectionBody =>
      'Cada archivo se convierte con el ajuste que mejor le va a su propio tipo. Añade un tipo cada vez si quieres control total.';

  @override
  String get filesTitle => 'Archivos';

  @override
  String get removeFile => 'Quitar';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time restantes';
  }

  @override
  String get jobSettingsTitle => 'Ajustes de conversión';

  @override
  String get jobDetails => 'Detalles';

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
  String get summaryTwoPass => 'Dos pasadas';

  @override
  String get summaryEnhanced => 'Mejorada';

  @override
  String get summaryMetadataStripped => 'Metadatos eliminados';

  @override
  String summaryMerge(int count) {
    return '$count clips unidos';
  }

  @override
  String get shareApp => 'Compartir la app';

  @override
  String get shareAppText =>
      'Eluna Media — un conversor gratuito de fotos, vídeo y audio, totalmente sin conexión. Sin suscripciones, sin marcas de agua, sin cuentas.';

  @override
  String appVersionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String get openFile => 'Abrir';

  @override
  String get openFolder => 'Mostrar carpeta';

  @override
  String get noAppToOpen =>
      'Ninguna app de este dispositivo puede abrir ese archivo.';

  @override
  String get openFailed => 'No se pudo abrir el archivo.';

  @override
  String get twoPassLabel => 'Dos pasadas para tamaño exacto';

  @override
  String get twoPassHint =>
      'Las tareas de tamaño objetivo se codifican dos veces y clavan el presupuesto de bytes con mucha más precisión — a cambio de aproximadamente el doble de tiempo y batería.';

  @override
  String get whatsNewTitle => 'Novedades';

  @override
  String get whatsNew1 =>
      'Los archivos terminados van directos a la galería, y «Guardar todo» se lleva el lote entero de una vez.';

  @override
  String get whatsNew2 =>
      'Ajusta una foto a un tamaño exacto: de 100 KB a 2 MB, o el número que escribas.';

  @override
  String get whatsNew3 =>
      'La app ya no acumula gigabytes: los ajustes muestran lo que ocupa y lo liberan.';

  @override
  String get whatsNew4 =>
      'Detén una conversión desde la notificación y recibe un aviso antes de quedarte sin espacio.';

  @override
  String get whatsNew5 =>
      'Miniaturas, comparación antes/después, GIF → MP4, tiempos de corte exactos y lotes de fotos que se procesan de varias en varias.';

  @override
  String get achievementsTitle => 'Logros';

  @override
  String achievementsProgress(int done, int total) {
    return '$done de $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Logro desbloqueado: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Se cuentan solo en este dispositivo. Nada se sube a ninguna parte.';

  @override
  String get achFirstConversionTitle => 'Primeros pasos';

  @override
  String get achFirstConversionBody => 'Convierte tu primer archivo.';

  @override
  String get achTenConversionsTitle => 'Calentando';

  @override
  String get achTenConversionsBody => 'Convierte 10 archivos.';

  @override
  String get achFiftyConversionsTitle => 'Habitual';

  @override
  String get achFiftyConversionsBody => 'Convierte 50 archivos.';

  @override
  String get achTwoHundredConversionsTitle => 'Currante';

  @override
  String get achTwoHundredConversionsBody => 'Convierte 200 archivos.';

  @override
  String get achThousandConversionsTitle => 'Cadena de montaje';

  @override
  String get achThousandConversionsBody => 'Convierte 1000 archivos.';

  @override
  String get achSaved100MbTitle => 'Ahorrador de espacio';

  @override
  String get achSaved100MbBody => 'Libera 100 MB en total.';

  @override
  String get achSaved1GbTitle => 'Cazador de gigabytes';

  @override
  String get achSaved1GbBody => 'Libera 1 GB en total.';

  @override
  String get achSaved10GbTitle => 'Héroe del almacenamiento';

  @override
  String get achSaved10GbBody => 'Libera 10 GB en total.';

  @override
  String get achBatchOfFiveTitle => 'Trabajador por lotes';

  @override
  String get achBatchOfFiveBody => 'Termina un lote de 5 archivos o más.';

  @override
  String get achBatchOfTwentyTitle => 'Línea de producción';

  @override
  String get achBatchOfTwentyBody => 'Termina un lote de 20 archivos o más.';

  @override
  String get achSniperTitle => 'Francotirador';

  @override
  String get achSniperBody => 'Clava un tamaño exacto con «Ajustar al tamaño».';

  @override
  String get achMemeSmithTitle => 'Artesano de memes';

  @override
  String get achMemeSmithBody => 'Convierte un vídeo en un GIF.';

  @override
  String get achSoundHunterTitle => 'Cazador de sonido';

  @override
  String get achSoundHunterBody => 'Extrae el audio de un vídeo.';

  @override
  String get achSubtitleKeeperTitle => 'Guardián de subtítulos';

  @override
  String get achSubtitleKeeperBody =>
      'Convierte un vídeo manteniendo sus subtítulos.';

  @override
  String get achDirectorTitle => 'Director';

  @override
  String get achDirectorBody =>
      'Aplica una transformación — rotar, recortar, velocidad o volumen.';

  @override
  String get achAllRounderTitle => 'Todoterreno';

  @override
  String get achAllRounderBody => 'Convierte vídeo, audio y una imagen.';

  @override
  String get achNightOwlTitle => 'Búho nocturno';

  @override
  String get achNightOwlBody =>
      'Termina una conversión entre medianoche y las 5 de la mañana.';

  @override
  String get achPlatinumTitle => 'Platino';

  @override
  String get achPlatinumBody => 'Consigue todos los demás logros.';

  @override
  String get storageTitle => 'Almacenamiento';

  @override
  String get storageBody =>
      'Los archivos convertidos permanecen dentro de la app hasta que los guardes o compartas; ningún gestor de archivos puede verlos.';

  @override
  String get storageEmpty => 'Nada almacenado';

  @override
  String storageUsage(String size) {
    return 'Ocupado: $size';
  }

  @override
  String get storageClearTitle => '¿Borrar los archivos guardados?';

  @override
  String get storageClearBody =>
      'Elimina todos los resultados terminados que la app aún conserva. Los archivos que ya guardaste o compartiste no se tocan.';

  @override
  String get storageClearAction => 'Borrar';

  @override
  String storageCleared(String size) {
    return 'Se liberaron $size';
  }

  @override
  String get autoSaveLabel => 'Guardar los resultados automáticamente';

  @override
  String get autoSaveHint =>
      'Coloca cada archivo terminado en la galería —el audio en Descargas— en cuanto está listo.';

  @override
  String get lowSpaceTitle => 'Queda poco espacio';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Este lote necesita unos $needed y solo hay $free libres. La conversión puede detenerse a medias.';
  }

  @override
  String saveAll(int count) {
    return 'Guardar todo ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Guardados: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Se guardaron $saved de $total';
  }

  @override
  String get presetFitPhotoTitle => 'Ajustar la foto a un tamaño';

  @override
  String get presetFitPhotoBody =>
      'Comprime una imagen por debajo de un límite exacto: formularios de subida, solicitudes.';

  @override
  String get photoFitHint =>
      'La app prueba calidades hasta que una entre. Si el límite es demasiado pequeño, también reduce el tamaño de la imagen.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Tamaño objetivo en KB';

  @override
  String get compareAction => 'Comparar';

  @override
  String get compareBefore => 'Antes';

  @override
  String get compareAfter => 'Después';

  @override
  String get compareHint => 'Mantén pulsado para ver el original.';

  @override
  String get trimStart => 'Inicio';

  @override
  String get trimEnd => 'Fin';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, hasta $duration';
  }

  @override
  String get imageScaleLabel => 'Escala';

  @override
  String get audioChannelsLabel => 'Canales';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Estéreo';

  @override
  String get sampleRateLabel => 'Frecuencia de muestreo';

  @override
  String get voiceAudioHint =>
      'Mono a 22,05 kHz reduce una grabación de voz a la cuarta parte sin pérdida audible. Para música, deja ambos como el original.';

  @override
  String get moveUp => 'Subir';

  @override
  String get moveDown => 'Bajar';

  @override
  String get renameOutput => 'Renombrar resultado';

  @override
  String get renameOutputHint => 'Nombre nuevo';

  @override
  String get renameOutputHelp =>
      'La extensión la marca el formato de salida. Déjalo vacío y el resultado tomará el nombre del original.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Eliminar originales ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Eliminar los originales tras convertir';

  @override
  String get deleteOriginalsHint =>
      'Pide al sistema que borre los archivos de origen una vez guardado el resultado. El sistema siempre muestra qué se va a borrar y espera tu confirmación.';

  @override
  String originalsDeleted(String size) {
    return 'Originales eliminados: $size liberados';
  }

  @override
  String get originalsNoneDeleted =>
      'No se eliminó nada. Solo se encuentran los archivos que la galería conserva con su nombre original.';

  @override
  String reclaimedTotal(String size) {
    return 'Liberado con esta app: $size';
  }

  @override
  String get deleteAllData => 'Eliminar todos los datos';

  @override
  String get deleteAllDataHint =>
      'Borra todo lo que la aplicación guarda en este dispositivo: la cola, los archivos convertidos, las miniaturas, los logros y los ajustes. Los archivos que ya guardaste en la galería no se tocan.';
}
