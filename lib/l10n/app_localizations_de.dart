// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class L10nDe extends L10n {
  L10nDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konvertieren';

  @override
  String get tabQueue => 'Warteschlange';

  @override
  String get tabAbout => 'Info';

  @override
  String get addFiles => 'Dateien hinzufügen';

  @override
  String get emptySelectionTitle => 'Noch keine Dateien';

  @override
  String get emptySelectionBody =>
      'Füge Fotos, Videos oder Audio hinzu. Alles wird auf diesem Gerät verarbeitet.';

  @override
  String get sectionOutput => 'Ausgabe';

  @override
  String get sectionVideo => 'Video';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Bild';

  @override
  String get sectionPrivacy => 'Privatsphäre';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Video-Codec';

  @override
  String get audioCodec => 'Audio-Codec';

  @override
  String get rateControl => 'Bitraten-Steuerung';

  @override
  String get rateControlQuality => 'Konstante Qualität (CRF)';

  @override
  String get rateControlBitrate => 'Ziel-Bitrate';

  @override
  String crfLabel(int value) {
    return 'Qualität (CRF $value)';
  }

  @override
  String get crfHint => 'Niedriger heißt bessere Qualität und größere Datei.';

  @override
  String videoBitrate(int value) {
    return 'Video-Bitrate: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Audio-Bitrate: $value kbps';
  }

  @override
  String get encodingPreset => 'Encoder-Preset';

  @override
  String get encodingPresetHint =>
      'Langsamere Presets komprimieren besser, erwärmen das Gerät aber stärker.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Auflösung';

  @override
  String get frameRate => 'Bildrate';

  @override
  String imageQuality(int value) {
    return 'Qualität: $value';
  }

  @override
  String get lossless => 'Verlustfrei';

  @override
  String get losslessHint => 'Größere Dateien, pixelgenaues Ergebnis.';

  @override
  String get sectionEnhance => 'Verbesserung';

  @override
  String get sharpenLabel => 'Schärfe';

  @override
  String get sharpenHint =>
      'Macht Kanten klarer. Eine verwackelte oder unscharfe Aufnahme rettet das nicht — diese Details stecken nicht in der Datei.';

  @override
  String get sharpenStrongHint =>
      'Starkes Schärfen kann helle Säume an Kanten hinterlassen. Fang lieber mit „Mittel“ an.';

  @override
  String get denoiseLabel => 'Rauschunterdrückung';

  @override
  String get denoiseHint =>
      'Entfernt Körnung in dunklen und nächtlichen Aufnahmen. Zu viel davon bügelt feine Details weg.';

  @override
  String get autoColorLabel => 'Autofarbe und Tonwerte';

  @override
  String get autoColorHint =>
      'Zieht den Kontrast auseinander und frischt blasse Farben etwas auf.';

  @override
  String get upscaleLabel => '2× hochskalieren';

  @override
  String get upscaleHint =>
      'Verdoppelt Breite und Höhe. Details kommen dabei nicht dazu — praktisch zum Drucken oder Zuschneiden.';

  @override
  String get upscaleConflictHint =>
      'Stell „Auflösung“ wieder auf „Original“, um hochzuskalieren.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Aus';

  @override
  String get enhanceLight => 'Leicht';

  @override
  String get enhanceMedium => 'Mittel';

  @override
  String get enhanceStrong => 'Stark';

  @override
  String get stripMetadata => 'Metadaten entfernen';

  @override
  String get stripMetadataHint =>
      'Entfernt EXIF, GPS und Zeitstempel aus der Ausgabe.';

  @override
  String startConversion(int count) {
    return '$count Dateien konvertieren';
  }

  @override
  String get batchResumed => 'Unterbrochene Konvertierung fortgesetzt.';

  @override
  String get converting => 'Wird konvertiert…';

  @override
  String get cancelBatch => 'Stoppen';

  @override
  String get cancelJob => 'Abbrechen';

  @override
  String get clearFinished => 'Fertige entfernen';

  @override
  String get removeJob => 'Entfernen';

  @override
  String get shareFile => 'Teilen';

  @override
  String get retryJob => 'Wiederholen';

  @override
  String get queueEmptyTitle => 'Die Warteschlange ist leer';

  @override
  String get queueEmptyBody =>
      'Dateien vom Tab „Konvertieren“ erscheinen hier.';

  @override
  String queueActiveTab(int count) {
    return 'Aktiv · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Fertig · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nichts in Arbeit';

  @override
  String get queueNoActiveBody =>
      'Dateien, die warten oder konvertiert werden, erscheinen hier.';

  @override
  String get queueNoFinishedTitle => 'Noch nichts fertig';

  @override
  String get queueNoFinishedBody =>
      'Fertige Dateien landen hier — bereit zum Öffnen, Speichern oder Teilen.';

  @override
  String get statusQueued => 'In der Warteschlange';

  @override
  String get statusRunning => 'Wird konvertiert';

  @override
  String get statusCompleted => 'Fertig';

  @override
  String get statusFailed => 'Fehlgeschlagen';

  @override
  String get statusCancelled => 'Abgebrochen';

  @override
  String batchSummary(int done, int total) {
    return '$done von $total fertig';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done Dateien konvertiert',
      one: '1 Datei konvertiert',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done konvertiert, $failed fehlgeschlagen.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent % kleiner';
  }

  @override
  String grewPercent(int percent) {
    return '$percent % größer';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Darstellung';

  @override
  String get theme => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'System';

  @override
  String get privacyTitle => 'Privatsphäre';

  @override
  String get privacyBody =>
      'Eluna Media konvertiert deine Dateien vollständig auf diesem Gerät mit einer mitgelieferten FFmpeg-Version. Deine Dateien verlassen das Gerät nie, ein Konto ist nicht nötig, und es gibt keine Telemetrie. Nichts in der App nutzt das Netz — sie besitzt nicht einmal die Internet-Berechtigung.\n\nDas Entfernen von Metadaten ist standardmäßig aktiv, sodass EXIF, GPS-Koordinaten und Zeitstempel aus exportierten Dateien entfernt werden.';

  @override
  String get licenseTitle => 'Lizenz';

  @override
  String get licenseBody =>
      'Diese App enthält FFmpeg mit x264, x265 und weiteren GPL-Komponenten, daher wird die Anwendung als Ganzes unter der GNU GPL v3 vertrieben.';

  @override
  String get formatUnsupportedForSource =>
      'Dieses Format unterstützt den gewählten Codec nicht.';

  @override
  String get sourceMissing => 'Die Quelldatei ist nicht mehr verfügbar.';

  @override
  String get errorTitle => 'Konvertierung fehlgeschlagen';

  @override
  String get tabSettings => 'Einstellungen';

  @override
  String get introTitle => 'Privat von Grund auf';

  @override
  String get introOfflineTitle => 'Konvertiert auf diesem Gerät';

  @override
  String get introOfflineBody =>
      'Die gesamte Arbeit erledigt ein mitgeliefertes FFmpeg. Deine Dateien verlassen das Handy nie — Konvertieren funktioniert auch im Flugmodus.';

  @override
  String get introTelemetryTitle => 'Null Telemetrie';

  @override
  String get introTelemetryBody =>
      'Kein Konto, keine Analytics, keine Absturzberichte. Die App weiß nicht, wer du bist.';

  @override
  String get introMetadataTitle => 'Metadaten unter Kontrolle';

  @override
  String get introMetadataBody =>
      'EXIF, GPS und Zeitstempel werden standardmäßig aus jeder Ausgabe entfernt. Das lässt sich abschalten.';

  @override
  String get introFreeNote =>
      'Kostenlos — ohne Werbung, ohne Abo, ohne In-App-Käufe. Alle Funktionen inklusive Stapelverarbeitung sind dabei.';

  @override
  String get introContinue => 'Los geht\'s';

  @override
  String get modeSimple => 'Einfach';

  @override
  String get modeAdvanced => 'Erweitert';

  @override
  String get modeAdvancedHint =>
      'Zeigt alle Codec-, Bitraten- und Transformationsregler statt der Preset-Karten.';

  @override
  String get presetCompressVideoTitle => 'Video komprimieren';

  @override
  String get presetCompressVideoBody =>
      'Deutlich kleineres MP4, Qualität bleibt gut';

  @override
  String get presetFitToSizeTitle => 'Auf Größe bringen';

  @override
  String get presetFitToSizeBody =>
      'Exaktes Limit treffen — Discord, E-Mail, Chats';

  @override
  String get presetCompatibleMp4Title => 'Kompatibles MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Läuft überall';

  @override
  String get presetExtractAudioTitle => 'Audio extrahieren';

  @override
  String get presetExtractAudioBody => 'MP3 aus jedem Video';

  @override
  String get presetVideoToGifTitle => 'Video zu GIF';

  @override
  String get presetVideoToGifBody => 'Kurzer Clip als animiertes GIF';

  @override
  String get presetMergeTitle => 'Videos zusammenfügen';

  @override
  String get presetMergeBody => 'Clips der Reihe nach zu einem MP4 verbinden';

  @override
  String get mergeNeedsTwo => 'Wähle mindestens zwei Videos zum Zusammenfügen.';

  @override
  String mergedVideoName(int count) {
    return 'Zusammengefügtes Video ($count Clips).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Foto komprimieren';

  @override
  String get presetCompressImageBody => 'Kleineres JPEG, Verlust kaum sichtbar';

  @override
  String get presetEnhancePhotoTitle => 'Foto verbessern';

  @override
  String get presetEnhancePhotoBody => 'Sauberer, schärfer, bessere Farben';

  @override
  String get presetImageToWebpTitle => 'Foto zu WebP';

  @override
  String get presetImageToWebpBody => 'Modernes Format, kleiner als JPEG';

  @override
  String get sizeTargetTitle => 'Zielgröße';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Eigene…';

  @override
  String get sizeTargetDialogTitle => 'Zielgröße in MB';

  @override
  String get sizeTargetTooSmall =>
      'Das Ziel ist für diese Länge zu klein; es wird die bestmögliche Qualität verwendet.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size pro Datei';
  }

  @override
  String estimateTotal(String size) {
    return 'Voraussichtliche Größe: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien ausgewählt',
      one: '1 Datei ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Leeren';

  @override
  String get presetExpectsVideo => 'Dieses Preset erwartet Videodateien.';

  @override
  String get presetExpectsImage => 'Dieses Preset erwartet Bilder.';

  @override
  String get promiseOffline => '100 % Offline-Konvertierung';

  @override
  String get promiseBatchFree => 'Stapelverarbeitung gratis';

  @override
  String get promiseNoWatermark => 'Kein Wasserzeichen';

  @override
  String get sectionTransform => 'Transformieren';

  @override
  String get rotateLabel => 'Drehen';

  @override
  String get flipLabel => 'Horizontal spiegeln';

  @override
  String get speedLabel => 'Geschwindigkeit';

  @override
  String get cropLabel => 'Zuschneiden';

  @override
  String get cropHint =>
      'Mittiger Zuschnitt auf das gewählte Seitenverhältnis — quadratisch für Feeds, 9:16 für Stories.';

  @override
  String volumeLabel(int percent) {
    return 'Lautstärke: $percent %';
  }

  @override
  String get addAudioFiles => 'Audio & andere Dateien';

  @override
  String get hwEncoderLabel => 'Hardware-Encoding';

  @override
  String get hwEncoderHint =>
      'Nutzt den Videochip des Geräts in den Modi Bitrate und Zielgröße — deutlich schneller und kühler. Der Qualitätsmodus (CRF) verwendet immer den präzisen Software-Encoder, und ein fehlgeschlagener Hardware-Job wird automatisch per Software wiederholt.';

  @override
  String get transformNeedsReencode =>
      'Drehen, Spiegeln und Geschwindigkeit erfordern eine Neucodierung und sind beim Stream-Copy deshalb deaktiviert.';

  @override
  String get capBitrateLabel => 'Datei nie größer machen';

  @override
  String get capBitrateHint =>
      'Begrenzt die Kodierung auf die Bitrate des Originals. Konstante Qualität hat keine eigene Obergrenze, deshalb kann ein bereits komprimiertes Video sonst größer werden.';

  @override
  String get keepSubtitles => 'Untertitel behalten';

  @override
  String get keepSubtitlesHint =>
      'Übernimmt Untertitelspuren in die Ausgabe. Nur Text-Untertitel.';

  @override
  String get sectionTrim => 'Schneiden';

  @override
  String get trimEnable => 'Quelle schneiden';

  @override
  String get trimHint =>
      'Verfügbar, wenn genau eine Datei mit bekannter Länge in der Warteschlange ist.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Zielgröße';

  @override
  String get lowBatteryTitle => 'Akku ist fast leer';

  @override
  String get lowBatteryBody =>
      'Konvertieren fordert den Prozessor stark. Du kannst erst das Ladegerät anschließen — oder trotzdem weitermachen.';

  @override
  String get lowBatteryContinue => 'Trotzdem konvertieren';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien erhalten',
      one: '1 Datei erhalten',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Speichern';

  @override
  String get savedToGallery =>
      'In der Galerie gespeichert, Album „Eluna Media“.';

  @override
  String get savedToDownloads => 'In „Downloads“ gespeichert.';

  @override
  String get saveFailed => 'Die Datei konnte nicht gespeichert werden.';

  @override
  String get jobRemovedUndo => 'Auftrag entfernt.';

  @override
  String get finishedClearedUndo => 'Fertige Aufträge entfernt.';

  @override
  String get undo => 'Rückgängig';

  @override
  String get errorDetailsTitle => 'Fehlerdetails';

  @override
  String get oledDark => 'Tiefschwarzes dunkles Design';

  @override
  String get oledDarkHint => 'Echtes Schwarz spart Energie auf OLED-Displays.';

  @override
  String get dynamicColorLabel => 'Systemfarben (Material You)';

  @override
  String get dynamicColorHint =>
      'Folgt der Hintergrundbild-Palette des Geräts, wo unterstützt.';

  @override
  String get sectionConversionPrefs => 'Konvertierung';

  @override
  String get powerModeLabel => 'Leistungsmodus';

  @override
  String get powerEfficiency => 'Kühl & schnell';

  @override
  String get powerBalanced => 'Ausgewogen';

  @override
  String get powerQuality => 'Maximale Kompression';

  @override
  String get powerModeHint =>
      'Wie hart der Video-Encoder arbeitet. Kühler und schneller bedeutet etwas größere Dateien. Sonst wird nichts gedrosselt — niemals.';

  @override
  String get hapticsLabel => 'Vibrations-Feedback';

  @override
  String get networkPrivacyTitle => 'Netzwerk & Privatsphäre';

  @override
  String get netAuditIntro =>
      'Eine vollständige Liste von allem in dieser App, das aufs Netz zugreifen kann.';

  @override
  String get netAuditNoneTitle => 'Überhaupt kein Netzzugriff';

  @override
  String get netAuditNoneBody =>
      'Die App fordert die Internet-Berechtigung nicht an und kommt damit gar nicht erst ins Netz — nachzusehen in den System-Infos zur App. Keine Werbung, keine Analyse, keine Update-Prüfung. „App bewerten“ übergibt an die Store-App, die das selbst erledigt.';

  @override
  String get netAuditConversionTitle => 'Konvertierung';

  @override
  String get netAuditConversionBody =>
      'Läuft vollständig auf diesem Gerät über ein mitgeliefertes FFmpeg. Schalte den Flugmodus ein und konvertiere — es funktioniert.';

  @override
  String get netAuditTelemetryTitle => 'Telemetrie';

  @override
  String get netAuditTelemetryBody =>
      'Gibt es nicht. Die App sammelt keine Analytics, keine Absturzberichte, keine Kennungen und hat kein Kontosystem.';

  @override
  String get sectionSupport => 'Unterstützung';

  @override
  String get rateApp => 'App bewerten';

  @override
  String get openLicenses => 'Open-Source-Lizenzen';

  @override
  String get errorFallbackTitle => 'Etwas ist schiefgelaufen';

  @override
  String get errorFallbackBody =>
      'Die App ist auf einen unerwarteten Fehler gestoßen. Warteschlange und Einstellungen sind sicher — geh zurück und versuch es noch einmal.';

  @override
  String get presetAudioToMp3Title => 'Audio konvertieren';

  @override
  String get presetAudioToMp3Body => 'Zu MP3 — läuft überall';

  @override
  String get presetCompressAudioTitle => 'Audio komprimieren';

  @override
  String get presetCompressAudioBody =>
      'Schlankeres AAC — Sprachnotizen, Podcasts';

  @override
  String get convertTo => 'Umwandeln in';

  @override
  String get formatRecommended => 'Empfohlen';

  @override
  String get formatSectionHint =>
      'Aufgelistet sind nur Formate, in die deine Dateien wirklich umgewandelt werden können.';

  @override
  String get sourceVideo => 'Video';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Datei';

  @override
  String get mixedSelectionTitle => 'Verschiedene Dateitypen ausgewählt';

  @override
  String get mixedSelectionBody =>
      'Jede Datei wird mit der besten Voreinstellung für ihren eigenen Typ konvertiert. Füge eine Sorte nach der anderen hinzu, wenn du volle Kontrolle willst.';

  @override
  String get filesTitle => 'Dateien';

  @override
  String get removeFile => 'Entfernen';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent %';
  }

  @override
  String timeLeft(String time) {
    return 'noch ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Konvertierungseinstellungen';

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
  String get summaryTwoPass => 'Zwei Durchgänge';

  @override
  String get summaryEnhanced => 'Verbessert';

  @override
  String get summaryMetadataStripped => 'Metadaten entfernt';

  @override
  String summaryMerge(int count) {
    return '$count Clips zusammengefügt';
  }

  @override
  String get shareApp => 'App teilen';

  @override
  String get shareAppText =>
      'Eluna Media — ein kostenloser Foto-, Video- und Audio-Konverter, der komplett offline arbeitet. Keine Abos, keine Wasserzeichen, keine Konten.';

  @override
  String appVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get openFile => 'Öffnen';

  @override
  String get openFolder => 'Ordner anzeigen';

  @override
  String get noAppToOpen =>
      'Keine App auf diesem Gerät kann diese Datei öffnen.';

  @override
  String get openFailed => 'Die Datei konnte nicht geöffnet werden.';

  @override
  String get twoPassLabel => 'Zwei Durchgänge für exakte Größe';

  @override
  String get twoPassHint =>
      'Zielgrößen-Jobs codieren zweimal und treffen das Byte-Budget spürbar genauer — bei etwa doppelter Zeit und doppeltem Akkuverbrauch.';

  @override
  String get whatsNewTitle => 'Neuigkeiten';

  @override
  String get whatsNew1 =>
      'Fertige Dateien landen jetzt direkt in der Galerie — und „Alle speichern“ nimmt den ganzen Stapel auf einmal.';

  @override
  String get whatsNew2 =>
      'Ein Foto auf eine exakte Größe bringen — 100 KB bis 2 MB oder ein eigener Wert.';

  @override
  String get whatsNew3 =>
      'Die App hortet keine Gigabyte mehr: Die Einstellungen zeigen den belegten Platz und geben ihn frei.';

  @override
  String get whatsNew4 =>
      'Eine Konvertierung lässt sich direkt aus der Benachrichtigung stoppen, und vor knappem Speicher wird gewarnt.';

  @override
  String get whatsNew5 =>
      'Miniaturbilder, Vorher/Nachher-Vergleich, GIF → MP4, exakte Schnittzeiten — und Fotostapel laufen mehrfach parallel.';

  @override
  String get achievementsTitle => 'Erfolge';

  @override
  String achievementsProgress(int done, int total) {
    return '$done von $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Erfolg freigeschaltet: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Wird nur auf diesem Gerät gezählt. Nichts wird irgendwohin hochgeladen.';

  @override
  String get achFirstConversionTitle => 'Erste Schritte';

  @override
  String get achFirstConversionBody => 'Konvertiere deine erste Datei.';

  @override
  String get achTenConversionsTitle => 'Aufgewärmt';

  @override
  String get achTenConversionsBody => 'Konvertiere 10 Dateien.';

  @override
  String get achFiftyConversionsTitle => 'Stammgast';

  @override
  String get achFiftyConversionsBody => 'Konvertiere 50 Dateien.';

  @override
  String get achTwoHundredConversionsTitle => 'Arbeitstier';

  @override
  String get achTwoHundredConversionsBody => 'Konvertiere 200 Dateien.';

  @override
  String get achThousandConversionsTitle => 'Fließband';

  @override
  String get achThousandConversionsBody => 'Konvertiere 1000 Dateien.';

  @override
  String get achSaved100MbTitle => 'Platzsparer';

  @override
  String get achSaved100MbBody => 'Gib insgesamt 100 MB frei.';

  @override
  String get achSaved1GbTitle => 'Gigabyte-Jäger';

  @override
  String get achSaved1GbBody => 'Gib insgesamt 1 GB frei.';

  @override
  String get achSaved10GbTitle => 'Speicherheld';

  @override
  String get achSaved10GbBody => 'Gib insgesamt 10 GB frei.';

  @override
  String get achBatchOfFiveTitle => 'Stapelarbeiter';

  @override
  String get achBatchOfFiveBody =>
      'Schließe einen Stapel mit 5 oder mehr Dateien ab.';

  @override
  String get achBatchOfTwentyTitle => 'Fertigungsstraße';

  @override
  String get achBatchOfTwentyBody =>
      'Schließe einen Stapel mit 20 oder mehr Dateien ab.';

  @override
  String get achSniperTitle => 'Scharfschütze';

  @override
  String get achSniperBody =>
      'Triff mit „Auf Größe bringen“ eine exakte Größe.';

  @override
  String get achMemeSmithTitle => 'Meme-Schmied';

  @override
  String get achMemeSmithBody => 'Verwandle ein Video in ein GIF.';

  @override
  String get achSoundHunterTitle => 'Klangjäger';

  @override
  String get achSoundHunterBody => 'Extrahiere Audio aus einem Video.';

  @override
  String get achSubtitleKeeperTitle => 'Untertitel-Hüter';

  @override
  String get achSubtitleKeeperBody =>
      'Konvertiere ein Video mit erhaltenen Untertiteln.';

  @override
  String get achDirectorTitle => 'Regisseur';

  @override
  String get achDirectorBody =>
      'Wende eine Transformation an — Drehen, Zuschneiden, Geschwindigkeit oder Lautstärke.';

  @override
  String get achAllRounderTitle => 'Allrounder';

  @override
  String get achAllRounderBody => 'Konvertiere Video, Audio und ein Bild.';

  @override
  String get achNightOwlTitle => 'Nachteule';

  @override
  String get achNightOwlBody =>
      'Schließe eine Konvertierung zwischen Mitternacht und 5 Uhr ab.';

  @override
  String get achPlatinumTitle => 'Platin';

  @override
  String get achPlatinumBody => 'Schalte alle anderen Erfolge frei.';

  @override
  String get storageTitle => 'Speicher';

  @override
  String get storageBody =>
      'Konvertierte Dateien bleiben in der App, bis Sie sie speichern oder teilen; kein Dateimanager kommt an sie heran.';

  @override
  String get storageEmpty => 'Nichts gespeichert';

  @override
  String storageUsage(String size) {
    return 'Belegt: $size';
  }

  @override
  String get storageClearTitle => 'Gespeicherte Dateien löschen?';

  @override
  String get storageClearBody =>
      'Löscht alle fertigen Ergebnisse, die die App noch hält. Bereits gespeicherte oder geteilte Dateien bleiben unberührt.';

  @override
  String get storageClearAction => 'Löschen';

  @override
  String storageCleared(String size) {
    return '$size freigegeben';
  }

  @override
  String get autoSaveLabel => 'Ergebnisse automatisch speichern';

  @override
  String get autoSaveHint =>
      'Legt jede fertige Datei sofort in der Galerie ab — Audio in „Downloads“.';

  @override
  String get lowSpaceTitle => 'Wenig Speicher frei';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Dieser Stapel braucht etwa $needed, frei sind nur $free. Die Konvertierung kann mittendrin abbrechen.';
  }

  @override
  String saveAll(int count) {
    return 'Alle speichern ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Gespeichert: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved von $total gespeichert';
  }

  @override
  String get presetFitPhotoTitle => 'Foto auf Größe bringen';

  @override
  String get presetFitPhotoBody =>
      'Ein Bild unter ein exaktes Limit drücken — Upload-Formulare, Bewerbungen.';

  @override
  String get photoFitHint =>
      'Die App probiert Qualitätsstufen, bis eine passt. Ist das Budget zu klein, verkleinert sie zusätzlich das Bild.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Zielgröße in KB';

  @override
  String get compareAction => 'Vergleichen';

  @override
  String get compareBefore => 'Vorher';

  @override
  String get compareAfter => 'Nachher';

  @override
  String get compareHint => 'Gedrückt halten, um das Original zu sehen.';

  @override
  String get trimStart => 'Start';

  @override
  String get trimEnd => 'Ende';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, höchstens $duration';
  }

  @override
  String get imageScaleLabel => 'Skalierung';

  @override
  String get audioChannelsLabel => 'Kanäle';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Abtastrate';

  @override
  String get voiceAudioHint =>
      'Mono mit 22,05 kHz viertelt eine Sprachaufnahme etwa, ohne hörbaren Verlust. Für Musik beides im Original lassen.';

  @override
  String get moveUp => 'Nach oben';

  @override
  String get moveDown => 'Nach unten';

  @override
  String get renameOutput => 'Ergebnis umbenennen';

  @override
  String get renameOutputHint => 'Neuer Name';

  @override
  String get renameOutputHelp =>
      'Die Endung ergibt sich aus dem Ausgabeformat. Leer lassen, dann heißt das Ergebnis wie die Quelle.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Originale löschen ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Originale nach dem Konvertieren löschen';

  @override
  String get deleteOriginalsHint =>
      'Bittet das System, die Quelldateien zu entfernen, sobald das Ergebnis gesichert ist. Das System zeigt immer, was verschwindet, und wartet auf deine Bestätigung.';

  @override
  String originalsDeleted(String size) {
    return 'Originale gelöscht — $size frei geworden';
  }

  @override
  String get originalsNoneDeleted =>
      'Es wurde nichts gelöscht. Gefunden werden nur Dateien, die die Galerie noch unter ihrem ursprünglichen Namen führt.';

  @override
  String reclaimedTotal(String size) {
    return 'Mit dieser App frei geworden: $size';
  }
}
