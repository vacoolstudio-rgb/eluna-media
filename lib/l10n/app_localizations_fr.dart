// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class L10nFr extends L10n {
  L10nFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Convertir';

  @override
  String get tabQueue => 'File';

  @override
  String get tabAbout => 'À propos';

  @override
  String get addFiles => 'Ajouter des fichiers';

  @override
  String get emptySelectionTitle => 'Aucun fichier pour l\'instant';

  @override
  String get emptySelectionBody =>
      'Ajoutez des photos, vidéos ou fichiers audio. Tout est traité sur cet appareil.';

  @override
  String get sectionOutput => 'Sortie';

  @override
  String get sectionVideo => 'Vidéo';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Image';

  @override
  String get sectionPrivacy => 'Confidentialité';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Codec vidéo';

  @override
  String get audioCodec => 'Codec audio';

  @override
  String get rateControl => 'Contrôle du débit';

  @override
  String get rateControlQuality => 'Qualité constante (CRF)';

  @override
  String get rateControlBitrate => 'Débit cible';

  @override
  String crfLabel(int value) {
    return 'Qualité (CRF $value)';
  }

  @override
  String get crfHint =>
      'Plus la valeur est basse, meilleure est la qualité et plus le fichier est gros.';

  @override
  String videoBitrate(int value) {
    return 'Débit vidéo : $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Débit audio : $value kbps';
  }

  @override
  String get encodingPreset => 'Preset d\'encodage';

  @override
  String get encodingPresetHint =>
      'Les presets plus lents compressent mieux mais chauffent davantage l\'appareil.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Résolution';

  @override
  String get frameRate => 'Fréquence d\'images';

  @override
  String imageQuality(int value) {
    return 'Qualité : $value';
  }

  @override
  String get lossless => 'Sans perte';

  @override
  String get losslessHint =>
      'Fichiers plus gros, résultat fidèle au pixel près.';

  @override
  String get sectionEnhance => 'Amélioration';

  @override
  String get sharpenLabel => 'Netteté';

  @override
  String get sharpenHint =>
      'Rend les contours plus nets. Une photo floue ou mal mise au point ne sera pas sauvée — ces détails ne sont pas dans le fichier.';

  @override
  String get sharpenStrongHint =>
      'Une accentuation forte peut laisser des halos clairs le long des contours. Commencez par « Moyen ».';

  @override
  String get denoiseLabel => 'Réduction du bruit';

  @override
  String get denoiseHint =>
      'Nettoie le grain des photos sombres et nocturnes. Trop de réduction lisse les détails fins.';

  @override
  String get autoColorLabel => 'Couleurs et niveaux auto';

  @override
  String get autoColorHint =>
      'Étire le contraste et ravive un peu les couleurs ternes.';

  @override
  String get upscaleLabel => 'Agrandir 2×';

  @override
  String get upscaleHint =>
      'Double la largeur et la hauteur. Cela n\'ajoute aucun détail — c\'est utile pour l\'impression ou le recadrage.';

  @override
  String get upscaleConflictHint =>
      'Pour agrandir, remettez « Résolution » sur « Original ».';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Désactivé';

  @override
  String get enhanceLight => 'Léger';

  @override
  String get enhanceMedium => 'Moyen';

  @override
  String get enhanceStrong => 'Fort';

  @override
  String get stripMetadata => 'Supprimer les métadonnées';

  @override
  String get stripMetadataHint =>
      'Retire les EXIF, le GPS et les horodatages du résultat.';

  @override
  String startConversion(int count) {
    return 'Convertir $count fichiers';
  }

  @override
  String get batchResumed => 'La conversion interrompue a repris.';

  @override
  String get converting => 'Conversion…';

  @override
  String get cancelBatch => 'Arrêter';

  @override
  String get cancelJob => 'Annuler';

  @override
  String get clearFinished => 'Effacer les terminés';

  @override
  String get removeJob => 'Supprimer';

  @override
  String get shareFile => 'Partager';

  @override
  String get retryJob => 'Réessayer';

  @override
  String get queueEmptyTitle => 'La file est vide';

  @override
  String get queueEmptyBody =>
      'Les fichiers ajoutés dans l\'onglet Convertir apparaissent ici.';

  @override
  String queueActiveTab(int count) {
    return 'En cours · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Terminés · $count';
  }

  @override
  String get queueNoActiveTitle => 'Rien en cours';

  @override
  String get queueNoActiveBody =>
      'Les fichiers en attente ou en cours de conversion apparaissent ici.';

  @override
  String get queueNoFinishedTitle => 'Rien de terminé pour l\'instant';

  @override
  String get queueNoFinishedBody =>
      'Les fichiers convertis arrivent ici, prêts à être ouverts, enregistrés ou partagés.';

  @override
  String get statusQueued => 'En file';

  @override
  String get statusRunning => 'Conversion';

  @override
  String get statusCompleted => 'Terminé';

  @override
  String get statusFailed => 'Échec';

  @override
  String get statusCancelled => 'Annulé';

  @override
  String batchSummary(int done, int total) {
    return '$done sur $total terminés';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done fichiers convertis',
      one: '1 fichier converti',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done convertis, $failed en échec.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent % plus léger';
  }

  @override
  String grewPercent(int percent) {
    return '$percent % plus lourd';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Apparence';

  @override
  String get theme => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get language => 'Langue';

  @override
  String get languageSystem => 'Système';

  @override
  String get privacyTitle => 'Confidentialité';

  @override
  String get privacyBody =>
      'Eluna Media convertit vos fichiers entièrement sur cet appareil grâce à une copie intégrée de FFmpeg. Vos fichiers ne quittent jamais l\'appareil, aucun compte n\'est requis et il n\'y a aucune télémétrie. Rien dans l\'application n\'utilise le réseau : elle ne possède même pas l\'autorisation d\'accès à Internet.\n\nLa suppression des métadonnées est activée par défaut : les EXIF, coordonnées GPS et horodatages sont retirés des fichiers que vous exportez.';

  @override
  String get licenseTitle => 'Licence';

  @override
  String get licenseBody =>
      'Cette application intègre FFmpeg compilé avec x264, x265 et d\'autres composants GPL ; l\'application dans son ensemble est donc distribuée sous licence GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Ce format ne prend pas en charge le codec sélectionné.';

  @override
  String get sourceMissing => 'Le fichier source n\'est plus disponible.';

  @override
  String get errorTitle => 'Échec de la conversion';

  @override
  String get tabSettings => 'Réglages';

  @override
  String get introTitle => 'Privé par conception';

  @override
  String get introOfflineTitle => 'Convertit sur cet appareil';

  @override
  String get introOfflineBody =>
      'Tout le travail est fait par un FFmpeg intégré. Vos fichiers ne quittent jamais le téléphone — la conversion fonctionne même en mode avion.';

  @override
  String get introTelemetryTitle => 'Zéro télémétrie';

  @override
  String get introTelemetryBody =>
      'Pas de compte, pas d\'analytique, pas de rapports de plantage. L\'application ne sait pas qui vous êtes.';

  @override
  String get introMetadataTitle => 'Métadonnées sous contrôle';

  @override
  String get introMetadataBody =>
      'Les EXIF, le GPS et les horodatages sont retirés de chaque sortie par défaut. Vous pouvez désactiver cela.';

  @override
  String get introFreeNote =>
      'Gratuit : sans publicité, sans abonnement et sans achat intégré. Toutes les fonctions, y compris la conversion par lots, sont incluses.';

  @override
  String get introContinue => 'Commencer';

  @override
  String get modeSimple => 'Simple';

  @override
  String get modeAdvanced => 'Avancé';

  @override
  String get modeAdvancedHint =>
      'Affiche tous les réglages de codec, de débit et de transformation au lieu des cartes de presets.';

  @override
  String get presetCompressVideoTitle => 'Compresser une vidéo';

  @override
  String get presetCompressVideoBody =>
      'MP4 bien plus léger, la qualité reste bonne';

  @override
  String get presetFitToSizeTitle => 'Ajuster à une taille';

  @override
  String get presetFitToSizeBody =>
      'Viser une limite exacte — Discord, e-mail, messageries';

  @override
  String get presetCompatibleMp4Title => 'MP4 compatible';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Se lit partout';

  @override
  String get presetExtractAudioTitle => 'Extraire l\'audio';

  @override
  String get presetExtractAudioBody =>
      'Un MP3 à partir de n\'importe quelle vidéo';

  @override
  String get presetVideoToGifTitle => 'Vidéo en GIF';

  @override
  String get presetVideoToGifBody => 'Un clip court en GIF animé';

  @override
  String get presetMergeTitle => 'Fusionner des vidéos';

  @override
  String get presetMergeBody =>
      'Assemble les clips en un seul MP4, dans l\'ordre';

  @override
  String get mergeNeedsTwo => 'Sélectionnez au moins deux vidéos à fusionner.';

  @override
  String mergedVideoName(int count) {
    return 'Vidéo fusionnée ($count clips).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Compresser une photo';

  @override
  String get presetCompressImageBody =>
      'JPEG plus léger, perte quasi invisible';

  @override
  String get presetEnhancePhotoTitle => 'Améliorer une photo';

  @override
  String get presetEnhancePhotoBody =>
      'Plus propre, plus nette, meilleures couleurs';

  @override
  String get presetImageToWebpTitle => 'Photo en WebP';

  @override
  String get presetImageToWebpBody => 'Format moderne, plus léger que le JPEG';

  @override
  String get sizeTargetTitle => 'Taille cible';

  @override
  String sizeTargetMb(int mb) {
    return '$mb Mo';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb Mo';
  }

  @override
  String get sizeTargetCustom => 'Personnalisée…';

  @override
  String get sizeTargetDialogTitle => 'Taille cible en Mo';

  @override
  String get sizeTargetTooSmall =>
      'La cible est trop petite pour cette durée ; la qualité la plus proche possible sera utilisée.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size par fichier';
  }

  @override
  String estimateTotal(String size) {
    return 'Taille estimée : ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers sélectionnés',
      one: '1 fichier sélectionné',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Effacer';

  @override
  String get presetExpectsVideo => 'Ce preset attend des fichiers vidéo.';

  @override
  String get presetExpectsImage => 'Ce preset attend des images.';

  @override
  String get promiseOffline => 'Conversion 100 % hors ligne';

  @override
  String get promiseBatchFree => 'Le traitement par lots est gratuit';

  @override
  String get promiseNoWatermark => 'Pas de filigrane';

  @override
  String get sectionTransform => 'Transformer';

  @override
  String get rotateLabel => 'Rotation';

  @override
  String get flipLabel => 'Miroir horizontal';

  @override
  String get speedLabel => 'Vitesse';

  @override
  String get cropLabel => 'Recadrage';

  @override
  String get cropHint =>
      'Recadrage centré au ratio choisi — carré pour les fils, 9:16 pour les stories.';

  @override
  String volumeLabel(int percent) {
    return 'Volume : $percent %';
  }

  @override
  String get addAudioFiles => 'Audio et autres fichiers';

  @override
  String get hwEncoderLabel => 'Encodage matériel';

  @override
  String get hwEncoderHint =>
      'Utilise la puce vidéo de l\'appareil dans les modes débit et taille cible — bien plus rapide et moins de chauffe. Le mode qualité (CRF) utilise toujours l\'encodeur logiciel, plus précis, et une tâche matérielle échouée est automatiquement relancée en logiciel.';

  @override
  String get transformNeedsReencode =>
      'La rotation, le miroir et la vitesse exigent un réencodage : ils sont donc désactivés pendant une copie de flux.';

  @override
  String get capBitrateLabel => 'Ne jamais agrandir le fichier';

  @override
  String get capBitrateHint =>
      'Limite l\'encodage au débit du fichier source. La qualité constante n\'a pas de plafond propre : sans cela, une vidéo déjà compressée peut ressortir plus lourde.';

  @override
  String get keepSubtitles => 'Conserver les sous-titres';

  @override
  String get keepSubtitlesHint =>
      'Reporte les pistes de sous-titres dans le résultat. Sous-titres texte uniquement.';

  @override
  String get sectionTrim => 'Découpe';

  @override
  String get trimEnable => 'Découper la source';

  @override
  String get trimHint =>
      'Disponible quand exactement un fichier de durée connue est dans la file.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Taille cible';

  @override
  String get lowBatteryTitle => 'Batterie faible';

  @override
  String get lowBatteryBody =>
      'La conversion sollicite fortement le processeur. Vous pouvez brancher le chargeur d\'abord, ou continuer quand même.';

  @override
  String get lowBatteryContinue => 'Convertir quand même';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers reçus',
      one: '1 fichier reçu',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Enregistrer';

  @override
  String get savedToGallery =>
      'Enregistré dans la galerie, album « Eluna Media ».';

  @override
  String get savedToDownloads => 'Enregistré dans Téléchargements.';

  @override
  String get saveFailed => 'Impossible d\'enregistrer le fichier.';

  @override
  String get jobRemovedUndo => 'Tâche supprimée.';

  @override
  String get finishedClearedUndo => 'Tâches terminées effacées.';

  @override
  String get undo => 'Annuler';

  @override
  String get errorDetailsTitle => 'Détails de l\'erreur';

  @override
  String get oledDark => 'Thème sombre noir pur';

  @override
  String get oledDarkHint =>
      'Le vrai noir économise la batterie sur les écrans OLED.';

  @override
  String get dynamicColorLabel => 'Couleurs du système (Material You)';

  @override
  String get dynamicColorHint =>
      'Suit la palette du fond d\'écran là où c\'est pris en charge.';

  @override
  String get sectionConversionPrefs => 'Conversion';

  @override
  String get powerModeLabel => 'Mode d\'énergie';

  @override
  String get powerEfficiency => 'Frais et rapide';

  @override
  String get powerBalanced => 'Équilibré';

  @override
  String get powerQuality => 'Compression maximale';

  @override
  String get powerModeHint =>
      'L\'intensité de travail de l\'encodeur vidéo. Plus frais et rapide signifie des fichiers un peu plus gros. Rien d\'autre n\'est bridé — jamais.';

  @override
  String get hapticsLabel => 'Retour haptique';

  @override
  String get networkPrivacyTitle => 'Réseau et confidentialité';

  @override
  String get netAuditIntro =>
      'La liste complète de tout ce qui, dans cette application, peut toucher au réseau.';

  @override
  String get netAuditNoneTitle => 'Aucun accès au réseau';

  @override
  String get netAuditNoneBody =>
      'L\'application ne demande pas l\'autorisation d\'accès à Internet : elle ne peut donc pas atteindre le réseau, même si elle le voulait — vérifiable dans les informations système de l\'app. Aucune publicité, aucune analyse, aucune vérification de mise à jour. « Noter l\'application » passe la main au store, qui se connecte à notre place.';

  @override
  String get netAuditConversionTitle => 'Conversion';

  @override
  String get netAuditConversionBody =>
      'S\'exécute entièrement sur cet appareil via un FFmpeg intégré. Activez le mode avion et convertissez — ça marche.';

  @override
  String get netAuditTelemetryTitle => 'Télémétrie';

  @override
  String get netAuditTelemetryBody =>
      'Il n\'y en a pas. L\'application ne collecte aucune analytique, aucun rapport de plantage, aucun identifiant, et n\'a aucun système de compte.';

  @override
  String get sectionSupport => 'Soutien';

  @override
  String get rateApp => 'Noter l\'application';

  @override
  String get openLicenses => 'Licences open source';

  @override
  String get errorFallbackTitle => 'Un problème est survenu';

  @override
  String get errorFallbackBody =>
      'L\'application a rencontré une erreur inattendue. Votre file et vos réglages sont intacts — revenez en arrière et réessayez.';

  @override
  String get presetAudioToMp3Title => 'Convertir l\'audio';

  @override
  String get presetAudioToMp3Body => 'En MP3 — se lit partout';

  @override
  String get presetCompressAudioTitle => 'Compresser l\'audio';

  @override
  String get presetCompressAudioBody =>
      'AAC plus léger — notes vocales, podcasts';

  @override
  String get convertTo => 'Convertir en';

  @override
  String get formatRecommended => 'Recommandé';

  @override
  String get formatSectionHint =>
      'Seuls les formats que vos fichiers peuvent réellement devenir sont listés.';

  @override
  String get sourceVideo => 'Vidéo';

  @override
  String get sourceImage => 'Photo';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Fichier';

  @override
  String get mixedSelectionTitle => 'Types de fichiers différents sélectionnés';

  @override
  String get mixedSelectionBody =>
      'Chaque fichier est converti avec le préréglage le plus adapté à son propre type. Ajoutez un seul type à la fois pour garder le contrôle complet.';

  @override
  String get filesTitle => 'Fichiers';

  @override
  String get removeFile => 'Retirer';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent %';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time restant';
  }

  @override
  String get jobSettingsTitle => 'Réglages de conversion';

  @override
  String get jobDetails => 'Détails';

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
  String get summaryTwoPass => 'Deux passes';

  @override
  String get summaryEnhanced => 'Améliorée';

  @override
  String get summaryMetadataStripped => 'Métadonnées supprimées';

  @override
  String summaryMerge(int count) {
    return '$count clips fusionnés';
  }

  @override
  String get shareApp => 'Partager l\'application';

  @override
  String get shareAppText =>
      'Eluna Media — un convertisseur photo, vidéo et audio gratuit et entièrement hors ligne. Pas d\'abonnement, pas de filigrane, pas de compte.';

  @override
  String appVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get openFile => 'Ouvrir';

  @override
  String get openFolder => 'Afficher le dossier';

  @override
  String get noAppToOpen =>
      'Aucune application de cet appareil ne peut ouvrir ce fichier.';

  @override
  String get openFailed => 'Impossible d\'ouvrir le fichier.';

  @override
  String get twoPassLabel => 'Deux passes pour une taille exacte';

  @override
  String get twoPassHint =>
      'Les tâches à taille cible encodent deux fois et respectent le budget d\'octets nettement plus précisément — pour environ le double de temps et de batterie.';

  @override
  String get whatsNewTitle => 'Nouveautés';

  @override
  String get whatsNew1 =>
      'Les fichiers terminés vont directement dans la galerie, et « Tout enregistrer » prend le lot entier d’un coup.';

  @override
  String get whatsNew2 =>
      'Ajustez une photo à une taille exacte : de 100 Ko à 2 Mo, ou la valeur de votre choix.';

  @override
  String get whatsNew3 =>
      'L’application n’accumule plus des gigaoctets : les réglages affichent l’espace occupé et le libèrent.';

  @override
  String get whatsNew4 =>
      'Arrêtez une conversion depuis la notification, et soyez prévenu avant de manquer d’espace.';

  @override
  String get whatsNew5 =>
      'Vignettes, comparaison avant/après, GIF → MP4, temps de coupe exacts — et les photos se traitent plusieurs à la fois.';

  @override
  String get achievementsTitle => 'Succès';

  @override
  String achievementsProgress(int done, int total) {
    return '$done sur $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Succès débloqué : $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Comptés uniquement sur cet appareil. Rien n\'est envoyé nulle part.';

  @override
  String get achFirstConversionTitle => 'Premiers pas';

  @override
  String get achFirstConversionBody => 'Convertissez votre premier fichier.';

  @override
  String get achTenConversionsTitle => 'Échauffement';

  @override
  String get achTenConversionsBody => 'Convertissez 10 fichiers.';

  @override
  String get achFiftyConversionsTitle => 'Habitué';

  @override
  String get achFiftyConversionsBody => 'Convertissez 50 fichiers.';

  @override
  String get achTwoHundredConversionsTitle => 'Bête de somme';

  @override
  String get achTwoHundredConversionsBody => 'Convertissez 200 fichiers.';

  @override
  String get achThousandConversionsTitle => 'Chaîne de production';

  @override
  String get achThousandConversionsBody => 'Convertissez 1000 fichiers.';

  @override
  String get achSaved100MbTitle => 'Économe en espace';

  @override
  String get achSaved100MbBody => 'Libérez 100 Mo au total.';

  @override
  String get achSaved1GbTitle => 'Chasseur de gigaoctets';

  @override
  String get achSaved1GbBody => 'Libérez 1 Go au total.';

  @override
  String get achSaved10GbTitle => 'Héros du stockage';

  @override
  String get achSaved10GbBody => 'Libérez 10 Go au total.';

  @override
  String get achBatchOfFiveTitle => 'Travail par lots';

  @override
  String get achBatchOfFiveBody => 'Terminez un lot de 5 fichiers ou plus.';

  @override
  String get achBatchOfTwentyTitle => 'Chaîne de montage';

  @override
  String get achBatchOfTwentyBody => 'Terminez un lot de 20 fichiers ou plus.';

  @override
  String get achSniperTitle => 'Sniper';

  @override
  String get achSniperBody =>
      'Atteignez une taille exacte avec « Ajuster à une taille ».';

  @override
  String get achMemeSmithTitle => 'Forgeur de mèmes';

  @override
  String get achMemeSmithBody => 'Transformez une vidéo en GIF.';

  @override
  String get achSoundHunterTitle => 'Chasseur de son';

  @override
  String get achSoundHunterBody => 'Extrayez l\'audio d\'une vidéo.';

  @override
  String get achSubtitleKeeperTitle => 'Gardien des sous-titres';

  @override
  String get achSubtitleKeeperBody =>
      'Convertissez une vidéo en conservant ses sous-titres.';

  @override
  String get achDirectorTitle => 'Réalisateur';

  @override
  String get achDirectorBody =>
      'Appliquez une transformation — rotation, recadrage, vitesse ou volume.';

  @override
  String get achAllRounderTitle => 'Polyvalent';

  @override
  String get achAllRounderBody =>
      'Convertissez une vidéo, un fichier audio et une image.';

  @override
  String get achNightOwlTitle => 'Oiseau de nuit';

  @override
  String get achNightOwlBody =>
      'Terminez une conversion entre minuit et 5 h du matin.';

  @override
  String get achPlatinumTitle => 'Platine';

  @override
  String get achPlatinumBody => 'Débloquez tous les autres succès.';

  @override
  String get storageTitle => 'Stockage';

  @override
  String get storageBody =>
      'Les fichiers convertis restent dans l\'application tant que vous ne les enregistrez pas ou ne les partagez pas ; aucun gestionnaire de fichiers n\'y accède.';

  @override
  String get storageEmpty => 'Rien de stocké';

  @override
  String storageUsage(String size) {
    return 'Occupé : $size';
  }

  @override
  String get storageClearTitle => 'Effacer les fichiers stockés ?';

  @override
  String get storageClearBody =>
      'Supprime tous les résultats terminés encore conservés par l\'application. Les fichiers déjà enregistrés ou partagés ne sont pas touchés.';

  @override
  String get storageClearAction => 'Effacer';

  @override
  String storageCleared(String size) {
    return '$size libérés';
  }

  @override
  String get autoSaveLabel => 'Enregistrer les résultats automatiquement';

  @override
  String get autoSaveHint =>
      'Place chaque fichier terminé dans la galerie — l\'audio dans Téléchargements — dès qu\'il est prêt.';

  @override
  String get lowSpaceTitle => 'Peu d\'espace disponible';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Ce lot demande environ $needed et il ne reste que $free. La conversion peut s\'arrêter en cours de route.';
  }

  @override
  String saveAll(int count) {
    return 'Tout enregistrer ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Enregistrés : $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved sur $total enregistrés';
  }

  @override
  String get presetFitPhotoTitle => 'Photo à la taille voulue';

  @override
  String get presetFitPhotoBody =>
      'Comprimer une image sous une limite exacte : formulaires d\'envoi, dossiers.';

  @override
  String get photoFitHint =>
      'L\'application essaie plusieurs qualités jusqu\'à ce que le fichier tienne. Si la limite est trop basse, elle réduit aussi la taille de l\'image.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb Ko';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Taille cible en Ko';

  @override
  String get compareAction => 'Comparer';

  @override
  String get compareBefore => 'Avant';

  @override
  String get compareAfter => 'Après';

  @override
  String get compareHint => 'Appuyez longuement pour voir l\'original.';

  @override
  String get trimStart => 'Début';

  @override
  String get trimEnd => 'Fin';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, jusqu\'à $duration';
  }

  @override
  String get imageScaleLabel => 'Échelle';

  @override
  String get audioChannelsLabel => 'Canaux';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stéréo';

  @override
  String get sampleRateLabel => 'Fréquence d\'échantillonnage';

  @override
  String get voiceAudioHint =>
      'Mono à 22,05 kHz divise environ par quatre un enregistrement vocal sans perte audible. Pour la musique, laissez les deux sur l\'original.';

  @override
  String get moveUp => 'Monter';

  @override
  String get moveDown => 'Descendre';

  @override
  String get renameOutput => 'Renommer le résultat';

  @override
  String get renameOutputHint => 'Nouveau nom';

  @override
  String get renameOutputHelp =>
      'L\'extension vient du format de sortie. Laissez vide pour reprendre le nom du fichier source.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Supprimer les originaux ($count)';
  }

  @override
  String get deleteOriginalsAuto =>
      'Supprimer les originaux après la conversion';

  @override
  String get deleteOriginalsHint =>
      'Demande au système de supprimer les fichiers source une fois le résultat enregistré. Le système montre toujours ce qui va disparaître et attend votre confirmation.';

  @override
  String originalsDeleted(String size) {
    return 'Originaux supprimés — $size libérés';
  }

  @override
  String get originalsNoneDeleted =>
      'Rien n\'a été supprimé. Seuls les fichiers que la galerie conserve sous leur nom d\'origine peuvent être retrouvés.';

  @override
  String reclaimedTotal(String size) {
    return 'Libéré avec cette application : $size';
  }
}
