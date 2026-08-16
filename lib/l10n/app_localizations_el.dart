// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class L10nEl extends L10n {
  L10nEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Μετατροπή';

  @override
  String get tabQueue => 'Ουρά';

  @override
  String get addFiles => 'Προσθήκη αρχείων';

  @override
  String get emptySelectionTitle => 'Δεν υπάρχουν ακόμη αρχεία';

  @override
  String get emptySelectionBody =>
      'Προσθέστε φωτογραφίες, βίντεο ή ήχο. Όλα επεξεργάζονται σε αυτή τη συσκευή.';

  @override
  String get sectionOutput => 'Έξοδος';

  @override
  String get sectionVideo => 'Βίντεο';

  @override
  String get sectionAudio => 'Ήχος';

  @override
  String get sectionImage => 'Εικόνα';

  @override
  String get sectionPrivacy => 'Απόρρητο';

  @override
  String get outputFormat => 'Μορφή';

  @override
  String get videoCodec => 'Κωδικοποιητής βίντεο';

  @override
  String get audioCodec => 'Κωδικοποιητής ήχου';

  @override
  String get rateControl => 'Έλεγχος ρυθμού';

  @override
  String get rateControlQuality => 'Σταθερή ποιότητα (CRF)';

  @override
  String get rateControlBitrate => 'Στόχος ρυθμού μετάδοσης';

  @override
  String crfLabel(int value) {
    return 'Ποιότητα (CRF $value)';
  }

  @override
  String get crfHint =>
      'Χαμηλότερη τιμή σημαίνει καλύτερη ποιότητα και μεγαλύτερο αρχείο.';

  @override
  String videoBitrate(int value) {
    return 'Ρυθμός βίντεο: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Ρυθμός ήχου: $value kbps';
  }

  @override
  String get encodingPreset => 'Προρύθμιση κωδικοποιητή';

  @override
  String get encodingPresetHint =>
      'Οι πιο αργές προρυθμίσεις συμπιέζουν καλύτερα, αλλά ζεσταίνουν περισσότερο τη συσκευή.';

  @override
  String get presetOriginal => 'Αρχικό';

  @override
  String get resolution => 'Ανάλυση';

  @override
  String get frameRate => 'Ρυθμός καρέ';

  @override
  String imageQuality(int value) {
    return 'Ποιότητα: $value';
  }

  @override
  String get lossless => 'Χωρίς απώλειες';

  @override
  String get losslessHint => 'Μεγαλύτερα αρχεία, αποτέλεσμα πιστό στο pixel.';

  @override
  String get sectionEnhance => 'Βελτίωση';

  @override
  String get sharpenLabel => 'Ευκρίνεια';

  @override
  String get sharpenHint =>
      'Κάνει τα περιγράμματα πιο καθαρά. Δεν μπορεί να επαναφέρει μια θολή ή εκτός εστίασης λήψη — αυτή η λεπτομέρεια δεν υπάρχει μέσα στο αρχείο.';

  @override
  String get sharpenStrongHint =>
      'Η έντονη όξυνση μπορεί να αφήσει φωτεινές άλως κατά μήκος των ακμών. Δοκιμάστε πρώτα τη μεσαία.';

  @override
  String get denoiseLabel => 'Μείωση θορύβου';

  @override
  String get denoiseHint =>
      'Καθαρίζει τον κόκκο σε σκοτεινές και νυχτερινές φωτογραφίες. Η υπερβολική χρήση εξαλείφει τις λεπτές λεπτομέρειες.';

  @override
  String get autoColorLabel => 'Αυτόματο χρώμα και επίπεδα';

  @override
  String get autoColorHint =>
      'Τεντώνει την αντίθεση και ζωντανεύει λίγο τα επίπεδα χρώματα.';

  @override
  String get upscaleLabel => 'Μεγέθυνση 2×';

  @override
  String get upscaleHint =>
      'Διπλασιάζει το πλάτος και το ύψος. Δεν προσθέτει λεπτομέρεια — βοηθά όταν εκτυπώνετε ή περικόπτετε.';

  @override
  String get upscaleConflictHint =>
      'Επαναφέρετε την Ανάλυση στο Αρχικό για να γίνει μεγέθυνση.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Ανενεργό';

  @override
  String get enhanceLight => 'Ελαφριά';

  @override
  String get enhanceMedium => 'Μεσαία';

  @override
  String get enhanceStrong => 'Έντονη';

  @override
  String get stripMetadata => 'Αφαίρεση μεταδεδομένων';

  @override
  String get stripMetadataHint =>
      'Αφαιρεί EXIF, GPS και χρονικές σημάνσεις από το αποτέλεσμα.';

  @override
  String startConversion(int count) {
    return 'Μετατροπή αρχείων ($count)';
  }

  @override
  String get batchResumed => 'Η μετατροπή που είχε διακοπεί συνεχίστηκε.';

  @override
  String get converting => 'Μετατροπή…';

  @override
  String get cancelBatch => 'Διακοπή';

  @override
  String get cancelJob => 'Ακύρωση';

  @override
  String get clearFinished => 'Εκκαθάριση ολοκληρωμένων';

  @override
  String get removeJob => 'Αφαίρεση';

  @override
  String get shareFile => 'Κοινή χρήση';

  @override
  String get retryJob => 'Επανάληψη';

  @override
  String get queueEmptyTitle => 'Η ουρά είναι άδεια';

  @override
  String get queueEmptyBody =>
      'Τα αρχεία που προσθέτετε στην καρτέλα Μετατροπή εμφανίζονται εδώ.';

  @override
  String queueActiveTab(int count) {
    return 'Ενεργά · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Ολοκληρωμένα · $count';
  }

  @override
  String get queueNoActiveTitle => 'Τίποτα σε εξέλιξη';

  @override
  String get queueNoActiveBody =>
      'Εδώ εμφανίζονται τα αρχεία που περιμένουν ή μετατρέπονται.';

  @override
  String get queueNoFinishedTitle => 'Τίποτα ολοκληρωμένο ακόμη';

  @override
  String get queueNoFinishedBody =>
      'Τα μετατραπέντα αρχεία καταλήγουν εδώ, έτοιμα να ανοιχτούν, να αποθηκευτούν ή να μοιραστούν.';

  @override
  String get statusQueued => 'Σε αναμονή';

  @override
  String get statusRunning => 'Μετατρέπεται';

  @override
  String get statusCompleted => 'Έτοιμο';

  @override
  String get statusFailed => 'Απέτυχε';

  @override
  String get statusCancelled => 'Ακυρώθηκε';

  @override
  String batchSummary(int done, int total) {
    return '$done από $total ολοκληρώθηκαν';
  }

  @override
  String batchCompleted(int done) {
    return 'Αρχεία που μετατράπηκαν: $done';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Μετατράπηκαν $done, απέτυχαν $failed.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% μικρότερο';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% μεγαλύτερο';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Εμφάνιση';

  @override
  String get themeSystem => 'Συστήματος';

  @override
  String get language => 'Γλώσσα';

  @override
  String get languageSystem => 'Συστήματος';

  @override
  String get privacyTitle => 'Απόρρητο';

  @override
  String get privacyBody =>
      'Το Eluna Media μετατρέπει τα αρχεία σας εξ ολοκλήρου σε αυτή τη συσκευή, με ένα ενσωματωμένο αντίγραφο του FFmpeg. Τα αρχεία σας δεν φεύγουν ποτέ από τη συσκευή, δεν απαιτείται λογαριασμός και δεν υπάρχει τηλεμετρία. Τίποτα μέσα στην εφαρμογή δεν χρησιμοποιεί το δίκτυο — δεν κατέχει καν την άδεια πρόσβασης στο διαδίκτυο.\n\nΗ αφαίρεση μεταδεδομένων είναι ενεργή από προεπιλογή, οπότε τα EXIF, οι συντεταγμένες GPS και οι χρονικές σημάνσεις αφαιρούνται από τα αρχεία που εξάγετε.';

  @override
  String get licenseTitle => 'Αδειοδότηση';

  @override
  String get licenseBody =>
      'Η εφαρμογή περιλαμβάνει το FFmpeg χτισμένο με x264, x265 και άλλα στοιχεία GPL, οπότε η εφαρμογή στο σύνολό της διανέμεται υπό την GNU GPL v3.';

  @override
  String get sourceMissing => 'Το αρχείο προέλευσης δεν είναι πλέον διαθέσιμο.';

  @override
  String get tabSettings => 'Ρυθμίσεις';

  @override
  String get introTitle => 'Ιδιωτικό εκ σχεδιασμού';

  @override
  String get introOfflineTitle => 'Μετατρέπει σε αυτή τη συσκευή';

  @override
  String get introOfflineBody =>
      'Όλη τη δουλειά την κάνει ένα ενσωματωμένο αντίγραφο του FFmpeg. Τα αρχεία σας δεν φεύγουν ποτέ από το τηλέφωνο — η μετατροπή λειτουργεί ακόμη και σε λειτουργία πτήσης.';

  @override
  String get introTelemetryTitle => 'Μηδενική τηλεμετρία';

  @override
  String get introTelemetryBody =>
      'Χωρίς λογαριασμό, χωρίς αναλυτικά στοιχεία, χωρίς αναφορές σφαλμάτων. Η εφαρμογή δεν γνωρίζει ποιοι είστε.';

  @override
  String get introMetadataTitle => 'Τα μεταδεδομένα υπό έλεγχο';

  @override
  String get introMetadataBody =>
      'Τα EXIF, τα GPS και οι χρονικές σημάνσεις αφαιρούνται από κάθε αποτέλεσμα από προεπιλογή. Μπορείτε να το απενεργοποιήσετε.';

  @override
  String get introFreeNote =>
      'Δωρεάν, χωρίς διαφημίσεις και χωρίς συνδρομές. Κάθε λειτουργία, μαζί με τη μαζική μετατροπή, είναι δική σας από την αρχή — το μόνο που μπορεί να αγοραστεί είναι ένα φιλοδώρημα, και δεν ξεκλειδώνει τίποτα.';

  @override
  String get introContinue => 'Ας ξεκινήσουμε';

  @override
  String get modeSimple => 'Απλή';

  @override
  String get modeAdvanced => 'Για προχωρημένους';

  @override
  String get modeAdvancedHint =>
      'Εμφανίζει κάθε ρύθμιση κωδικοποιητή, ρυθμού μετάδοσης και μετασχηματισμού αντί για τις κάρτες των προρυθμίσεων.';

  @override
  String get presetCompressVideoTitle => 'Συμπίεση βίντεο';

  @override
  String get presetCompressVideoBody =>
      'Πολύ μικρότερο MP4, η ποιότητα παραμένει καλή';

  @override
  String get presetFitToSizeTitle => 'Προσαρμογή σε μέγεθος';

  @override
  String get presetFitToSizeBody =>
      'Πιάστε ακριβές όριο — Discord, email, συνομιλίες';

  @override
  String get presetCompatibleMp4Title => 'Συμβατό MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Παίζει παντού';

  @override
  String get presetExtractAudioTitle => 'Εξαγωγή ήχου';

  @override
  String get presetExtractAudioBody => 'MP3 από οποιοδήποτε βίντεο';

  @override
  String get presetVideoToGifTitle => 'Βίντεο σε GIF';

  @override
  String get presetVideoToGifBody => 'Σύντομο κλιπ σε κινούμενο GIF';

  @override
  String get presetMergeTitle => 'Συνένωση βίντεο';

  @override
  String get presetMergeBody => 'Ενώνει κλιπ σε ένα MP4, με τη σειρά';

  @override
  String get mergeNeedsTwo => 'Επιλέξτε τουλάχιστον δύο βίντεο για συνένωση.';

  @override
  String mergedVideoName(int count) {
    return 'Ενωμένο βίντεο ($count).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Συμπίεση φωτογραφίας';

  @override
  String get presetCompressImageBody =>
      'Μικρότερο JPEG, με μόλις ορατή απώλεια';

  @override
  String get presetEnhancePhotoTitle => 'Βελτίωση φωτογραφίας';

  @override
  String get presetEnhancePhotoBody =>
      'Πιο καθαρή, πιο ευκρινής, με καλύτερο χρώμα';

  @override
  String get presetImageToWebpTitle => 'Φωτογραφία σε WebP';

  @override
  String get presetImageToWebpBody => 'Σύγχρονη μορφή, μικρότερη από JPEG';

  @override
  String get sizeTargetTitle => 'Μέγεθος στόχος';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Προσαρμοσμένο…';

  @override
  String get sizeTargetDialogTitle => 'Μέγεθος στόχος σε MB';

  @override
  String get sizeTargetTooSmall =>
      'Ο στόχος είναι πολύ μικρός για αυτή τη διάρκεια· θα χρησιμοποιηθεί η πλησιέστερη δυνατή ποιότητα.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size ανά αρχείο';
  }

  @override
  String estimateTotal(String size) {
    return 'Εκτιμώμενο αποτέλεσμα: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    return 'Επιλεγμένα αρχεία: $count';
  }

  @override
  String get promiseOffline => '100% μετατροπή εκτός σύνδεσης';

  @override
  String get promiseBatchFree => 'Η μαζική μετατροπή είναι δωρεάν';

  @override
  String get promiseNoWatermark => 'Χωρίς υδατογράφημα';

  @override
  String get sectionTransform => 'Μετασχηματισμός';

  @override
  String get rotateLabel => 'Περιστροφή';

  @override
  String get flipLabel => 'Οριζόντιος καθρεφτισμός';

  @override
  String get speedLabel => 'Ταχύτητα';

  @override
  String get cropLabel => 'Περικοπή';

  @override
  String get cropHint =>
      'Περικοπή από το κέντρο στην επιλεγμένη αναλογία — τετράγωνο για τις ροές, 9:16 για τις ιστορίες.';

  @override
  String volumeLabel(int percent) {
    return 'Ένταση: $percent%';
  }

  @override
  String get addAudioFiles => 'Ήχος και άλλα αρχεία';

  @override
  String get hwEncoderLabel => 'Κωδικοποίηση από το υλικό';

  @override
  String get hwEncoderHint =>
      'Χρησιμοποιεί το τσιπ βίντεο της συσκευής στις λειτουργίες ρυθμού μετάδοσης και προσαρμογής σε μέγεθος — πολύ πιο γρήγορα και με λιγότερη θερμότητα. Η λειτουργία σταθερής ποιότητας (CRF) χρησιμοποιεί πάντα τον ακριβή κωδικοποιητή λογισμικού, και μια εργασία που αποτυγχάνει στο υλικό επαναλαμβάνεται αυτόματα με λογισμικό.';

  @override
  String get transformNeedsReencode =>
      'Η περιστροφή, ο καθρεφτισμός και η ταχύτητα απαιτούν εκ νέου κωδικοποίηση, και έτσι είναι ανενεργά κατά την αντιγραφή ροής.';

  @override
  String get capBitrateLabel => 'Να μη γίνεται ποτέ μεγαλύτερο το αρχείο';

  @override
  String get capBitrateHint =>
      'Περιορίζει την κωδικοποίηση στον ρυθμό μετάδοσης της ίδιας της πηγής. Η σταθερή ποιότητα δεν έχει δικό της ανώτατο όριο, οπότε ένα ήδη συμπιεσμένο βίντεο μπορεί διαφορετικά να βγει μεγαλύτερο.';

  @override
  String get keepSubtitles => 'Διατήρηση υποτίτλων';

  @override
  String get keepSubtitlesHint =>
      'Μεταφέρει τα κομμάτια υποτίτλων στο αποτέλεσμα. Μόνο υπότιτλοι κειμένου.';

  @override
  String get sectionTrim => 'Αποκοπή';

  @override
  String get trimEnable => 'Αποκοπή της πηγής';

  @override
  String get trimHint =>
      'Διαθέσιμο όταν στην ουρά βρίσκεται ακριβώς ένα αρχείο με γνωστή διάρκεια.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Μέγεθος στόχος';

  @override
  String get lowBatteryTitle => 'Η μπαταρία είναι χαμηλή';

  @override
  String get lowBatteryBody =>
      'Η μετατροπή καταπονεί τον επεξεργαστή. Μπορείτε να βάλετε πρώτα τη συσκευή στη φόρτιση ή να συνεχίσετε έτσι.';

  @override
  String get lowBatteryContinue => 'Μετατροπή ούτως ή άλλως';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    return 'Αρχεία που ελήφθησαν: $count';
  }

  @override
  String get saveFile => 'Αποθήκευση';

  @override
  String get savedToGallery =>
      'Αποθηκεύτηκε στη συλλογή, στο άλμπουμ «Eluna Media».';

  @override
  String get savedToDownloads => 'Αποθηκεύτηκε στις Λήψεις.';

  @override
  String get saveFailed => 'Δεν ήταν δυνατή η αποθήκευση του αρχείου.';

  @override
  String get jobRemovedUndo => 'Η εργασία αφαιρέθηκε.';

  @override
  String get finishedClearedUndo => 'Οι ολοκληρωμένες εργασίες εκκαθαρίστηκαν.';

  @override
  String get undo => 'Αναίρεση';

  @override
  String get errorDetailsTitle => 'Λεπτομέρειες σφάλματος';

  @override
  String get sectionConversionPrefs => 'Μετατροπή';

  @override
  String get powerModeLabel => 'Λειτουργία ισχύος';

  @override
  String get powerEfficiency => 'Δροσερά και γρήγορα';

  @override
  String get powerBalanced => 'Ισορροπημένα';

  @override
  String get powerQuality => 'Μέγιστη συμπίεση';

  @override
  String get powerModeHint =>
      'Πόσο σκληρά δουλεύει ο κωδικοποιητής βίντεο. Πιο δροσερά και πιο γρήγορα σημαίνει κάπως μεγαλύτερα αρχεία. Τίποτα άλλο δεν περιορίζεται — ποτέ.';

  @override
  String get hapticsLabel => 'Απόκριση με δόνηση';

  @override
  String get networkPrivacyTitle => 'Δίκτυο και απόρρητο';

  @override
  String get netAuditIntro =>
      'Πλήρης κατάλογος με καθετί σε αυτή την εφαρμογή που θα μπορούσε να αγγίξει το δίκτυο.';

  @override
  String get netAuditNoneTitle => 'Καμία απολύτως πρόσβαση στο δίκτυο';

  @override
  String get netAuditNoneBody =>
      'Η εφαρμογή δεν ζητά την άδεια πρόσβασης στο διαδίκτυο, οπότε δεν μπορεί να φτάσει στο δίκτυο ούτε αν το επιχειρούσε — μπορείτε να το επαληθεύσετε στις πληροφορίες εφαρμογής του συστήματος. Χωρίς διαφημίσεις, χωρίς αναλυτικά στοιχεία, χωρίς ελέγχους ενημερώσεων. Η «Βαθμολόγηση της εφαρμογής» παραδίδει τη σκυτάλη στην εφαρμογή του καταστήματος, η οποία κάνει τη δική της επικοινωνία.';

  @override
  String get netAuditConversionTitle => 'Μετατροπή';

  @override
  String get netAuditConversionBody =>
      'Εκτελείται εξ ολοκλήρου σε αυτή τη συσκευή μέσω ενός ενσωματωμένου FFmpeg. Ενεργοποιήστε τη λειτουργία πτήσης και μετατρέψτε — λειτουργεί.';

  @override
  String get netAuditTelemetryTitle => 'Τηλεμετρία';

  @override
  String get netAuditTelemetryBody =>
      'Δεν υπάρχει καθόλου. Η εφαρμογή δεν συλλέγει αναλυτικά στοιχεία, ούτε αναφορές σφαλμάτων, ούτε αναγνωριστικά, και δεν διαθέτει σύστημα λογαριασμών.';

  @override
  String get netAuditTipsTitle => 'Φιλοδωρήματα';

  @override
  String get netAuditTipsBody =>
      'Το φιλοδώρημα το διεκπεραιώνει η εφαρμογή του Play Store, όχι αυτή εδώ — η οποία εξακολουθεί να μην έχει άδεια πρόσβασης στο διαδίκτυο. Οι χρεώσεις προσθέτουν δύο γραμμές στον κατάλογο των αδειών: «αγορές εντός εφαρμογής» και «προβολή συνδέσεων δικτύου», που μόνο διαβάζει αν υπάρχει σύνδεση και δεν μπορεί να τη χρησιμοποιήσει. Τίποτα δεν αγοράζεται ποτέ αυτόματα, και το φιλοδώρημα δεν ξεκλειδώνει τίποτα: κάθε λειτουργία εδώ είναι δωρεάν.';

  @override
  String get sectionSupport => 'Υποστήριξη';

  @override
  String get rateApp => 'Βαθμολόγηση της εφαρμογής';

  @override
  String get openLicenses => 'Άδειες ανοικτού κώδικα';

  @override
  String get presetAudioToMp3Title => 'Μετατροπή ήχου';

  @override
  String get presetAudioToMp3Body => 'Σε MP3 — παίζει στα πάντα';

  @override
  String get presetCompressAudioTitle => 'Συμπίεση ήχου';

  @override
  String get presetCompressAudioBody =>
      'Πιο ελαφρύ AAC — φωνητικά μηνύματα, podcast';

  @override
  String get convertTo => 'Μετατροπή σε';

  @override
  String get formatSectionHint =>
      'Εμφανίζονται μόνο οι μορφές στις οποίες μπορούν πραγματικά να μετατραπούν τα αρχεία σας.';

  @override
  String get sourceVideo => 'Βίντεο';

  @override
  String get sourceImage => 'Φωτογραφία';

  @override
  String get sourceAudio => 'Ήχος';

  @override
  String get sourceUnknown => 'Αρχείο';

  @override
  String get mixedSelectionTitle => 'Επιλέχθηκαν διαφορετικοί τύποι αρχείων';

  @override
  String get mixedSelectionBody =>
      'Κάθε αρχείο μετατρέπεται με την καταλληλότερη προρύθμιση για τον δικό του τύπο. Προσθέστε έναν τύπο τη φορά για πλήρη έλεγχο.';

  @override
  String get filesTitle => 'Αρχεία';

  @override
  String get removeFile => 'Αφαίρεση';

  @override
  String timeLeft(String time) {
    return 'απομένουν ≈ $time';
  }

  @override
  String get jobSettingsTitle => 'Ρυθμίσεις μετατροπής';

  @override
  String get jobDetails => 'Λεπτομέρειες';

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
  String get summaryEnhanced => 'Βελτιωμένο';

  @override
  String get summaryMetadataStripped => 'Τα μεταδεδομένα αφαιρέθηκαν';

  @override
  String summaryMerge(int count) {
    return 'Κλιπ που ενώθηκαν: $count';
  }

  @override
  String get shareApp => 'Κοινή χρήση της εφαρμογής';

  @override
  String get shareAppText =>
      'Eluna Media — δωρεάν μετατροπέας φωτογραφιών, βίντεο και ήχου που δουλεύει εξ ολοκλήρου εκτός σύνδεσης. Χωρίς συνδρομές, χωρίς υδατογραφήματα, χωρίς λογαριασμούς.';

  @override
  String appVersionLabel(String version) {
    return 'Έκδοση $version';
  }

  @override
  String get openFile => 'Άνοιγμα';

  @override
  String get openFolder => 'Εμφάνιση φακέλου';

  @override
  String get noAppToOpen =>
      'Καμία εφαρμογή σε αυτή τη συσκευή δεν μπορεί να ανοίξει αυτό το αρχείο.';

  @override
  String get openFailed => 'Δεν ήταν δυνατό το άνοιγμα του αρχείου.';

  @override
  String get twoPassLabel => 'Δύο περάσματα για ακριβές μέγεθος';

  @override
  String get twoPassHint =>
      'Οι εργασίες προσαρμογής σε μέγεθος κωδικοποιούνται δύο φορές και πετυχαίνουν τον στόχο σε bytes αισθητά πιο εύστοχα — με περίπου διπλάσιο χρόνο και διπλάσια κατανάλωση μπαταρίας.';

  @override
  String get whatsNewTitle => 'Τι νέο υπάρχει';

  @override
  String get whatsNew1 =>
      'Το βίντεο μπορεί πλέον να είναι AV1: αισθητά μικρότερα αρχεία, αν έχετε την υπομονή να τα περιμένετε.';

  @override
  String get whatsNew2 =>
      'Νέα για τις εικόνες: AVIF, περίπου το μισό ενός JPEG, και κινούμενο WebP στη θέση ενός GIF.';

  @override
  String get whatsNew3 =>
      'Το M4A μπορεί να είναι χωρίς απώλειες — ο ALAC στέκεται πλέον δίπλα στον AAC.';

  @override
  String get whatsNew4 =>
      'Μία οθόνη για την εμφάνιση: φωτεινότητα, χρώμα τονισμού, καθαρό μαύρο για OLED και Material You.';

  @override
  String get whatsNew5 =>
      'Τα επιτεύγματα απέκτησαν μετάλλια, τρεις καρτέλες και πρόοδο που μπορείτε να μοιραστείτε ως εικόνα.';

  @override
  String get achievementsTitle => 'Επιτεύγματα';

  @override
  String achievementsProgress(int done, int total) {
    return '$done από $total';
  }

  @override
  String get achievementsPrivacyNote =>
      'Μετρώνται μόνο σε αυτή τη συσκευή. Τίποτα δεν αποστέλλεται πουθενά.';

  @override
  String get achFirstConversionTitle => 'Πρώτα βήματα';

  @override
  String get achFirstConversionBody => 'Μετατρέψτε το πρώτο σας αρχείο.';

  @override
  String get achTenConversionsTitle => 'Ζεσταθήκατε';

  @override
  String get achTenConversionsBody => 'Μετατρέψτε 10 αρχεία.';

  @override
  String get achFiftyConversionsTitle => 'Τακτικός';

  @override
  String get achFiftyConversionsBody => 'Μετατρέψτε 50 αρχεία.';

  @override
  String get achTwoHundredConversionsTitle => 'Εργάτης';

  @override
  String get achTwoHundredConversionsBody => 'Μετατρέψτε 200 αρχεία.';

  @override
  String get achThousandConversionsTitle => 'Ιμάντας παραγωγής';

  @override
  String get achThousandConversionsBody => 'Μετατρέψτε 1000 αρχεία.';

  @override
  String get achSaved100MbTitle => 'Οικονόμος χώρου';

  @override
  String get achSaved100MbBody => 'Ελευθερώστε συνολικά 100 MB.';

  @override
  String get achSaved1GbTitle => 'Κυνηγός gigabyte';

  @override
  String get achSaved1GbBody => 'Ελευθερώστε συνολικά 1 GB.';

  @override
  String get achSaved10GbTitle => 'Ήρωας του αποθηκευτικού χώρου';

  @override
  String get achSaved10GbBody => 'Ελευθερώστε συνολικά 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Μαζικός εργάτης';

  @override
  String get achBatchOfFiveBody =>
      'Ολοκληρώστε μια παρτίδα 5 αρχείων ή περισσότερων.';

  @override
  String get achBatchOfTwentyTitle => 'Γραμμή συναρμολόγησης';

  @override
  String get achBatchOfTwentyBody =>
      'Ολοκληρώστε μια παρτίδα 20 αρχείων ή περισσότερων.';

  @override
  String get achSniperTitle => 'Σκοπευτής';

  @override
  String get achSniperBody =>
      'Πετύχετε ακριβές μέγεθος με την προσαρμογή σε μέγεθος.';

  @override
  String get achMemeSmithTitle => 'Τεχνίτης του meme';

  @override
  String get achMemeSmithBody => 'Μετατρέψτε ένα βίντεο σε GIF.';

  @override
  String get achSoundHunterTitle => 'Κυνηγός ήχου';

  @override
  String get achSoundHunterBody => 'Εξαγάγετε τον ήχο από ένα βίντεο.';

  @override
  String get achSubtitleKeeperTitle => 'Φύλακας υποτίτλων';

  @override
  String get achSubtitleKeeperBody =>
      'Μετατρέψτε ένα βίντεο κρατώντας τους υποτίτλους του.';

  @override
  String get achDirectorTitle => 'Σκηνοθέτης';

  @override
  String get achDirectorBody =>
      'Εφαρμόστε έναν μετασχηματισμό — περιστροφή, περικοπή, ταχύτητα ή ένταση.';

  @override
  String get achAllRounderTitle => 'Πολυτεχνίτης';

  @override
  String get achAllRounderBody => 'Μετατρέψτε βίντεο, ήχο και μια εικόνα.';

  @override
  String get achNightOwlTitle => 'Νυχτοπούλι';

  @override
  String get achNightOwlBody =>
      'Ολοκληρώστε μια μετατροπή μεταξύ μεσάνυχτων και 5 το πρωί.';

  @override
  String get achPlatinumTitle => 'Πλατίνα';

  @override
  String get achPlatinumBody => 'Κερδίστε όλα τα υπόλοιπα επιτεύγματα.';

  @override
  String get storageTitle => 'Αποθηκευτικός χώρος';

  @override
  String get storageBody =>
      'Τα μετατραπέντα αρχεία παραμένουν μέσα στην εφαρμογή μέχρι να τα αποθηκεύσετε ή να τα μοιραστείτε, εκεί όπου κανένας διαχειριστής αρχείων δεν φτάνει.';

  @override
  String get storageEmpty => 'Τίποτα αποθηκευμένο';

  @override
  String storageUsage(String size) {
    return 'Αποθηκευμένα: $size';
  }

  @override
  String get storageClearTitle => 'Εκκαθάριση των αποθηκευμένων αρχείων;';

  @override
  String get storageClearBody =>
      'Διαγράφει κάθε ολοκληρωμένο αποτέλεσμα που κρατά ακόμη η εφαρμογή. Τα αρχεία που έχετε ήδη αποθηκεύσει ή μοιραστεί δεν θίγονται.';

  @override
  String get storageClearAction => 'Εκκαθάριση';

  @override
  String storageCleared(String size) {
    return 'Ελευθερώθηκαν $size';
  }

  @override
  String get autoSaveLabel => 'Αυτόματη αποθήκευση των αποτελεσμάτων';

  @override
  String get autoSaveHint =>
      'Τοποθετεί κάθε ολοκληρωμένο αρχείο στη συλλογή — τον ήχο στις Λήψεις — μόλις είναι έτοιμο.';

  @override
  String get lowSpaceTitle => 'Δεν έχει μείνει πολύς χώρος';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Αυτή η παρτίδα χρειάζεται περίπου $needed και είναι ελεύθερα μόνο $free. Η μετατροπή μπορεί να σταματήσει στη μέση.';
  }

  @override
  String saveAll(int count) {
    return 'Αποθήκευση όλων ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Αποθηκεύτηκαν: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Αποθηκεύτηκαν $saved από $total';
  }

  @override
  String get presetFitPhotoTitle => 'Φωτογραφία σε μέγεθος';

  @override
  String get presetFitPhotoBody =>
      'Χωρέστε μια εικόνα κάτω από ακριβές όριο — φόρμες μεταφόρτωσης, αιτήσεις.';

  @override
  String get photoFitHint =>
      'Η εφαρμογή δοκιμάζει ποιότητες μέχρι να χωρέσει μία. Αν ο στόχος είναι πολύ μικρός για την εικόνα, μειώνει και τις διαστάσεις του καρέ.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Μέγεθος στόχος σε KB';

  @override
  String get compareAction => 'Σύγκριση';

  @override
  String get compareBefore => 'Πριν';

  @override
  String get compareAfter => 'Μετά';

  @override
  String get compareHint => 'Πατήστε παρατεταμένα για να δείτε το πρωτότυπο.';

  @override
  String get trimStart => 'Αρχή';

  @override
  String get trimEnd => 'Τέλος';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, έως $duration';
  }

  @override
  String get imageScaleLabel => 'Κλίμακα';

  @override
  String get audioChannelsLabel => 'Κανάλια';

  @override
  String get audioMono => 'Μονοφωνικό';

  @override
  String get audioStereo => 'Στερεοφωνικό';

  @override
  String get sampleRateLabel => 'Ρυθμός δειγματοληψίας';

  @override
  String get voiceAudioHint =>
      'Το μονοφωνικό στα 22,05 kHz μειώνει μια ηχογράφηση ομιλίας περίπου στο ένα τέταρτο, χωρίς ακουστή απώλεια. Για μουσική αφήστε και τα δύο στο αρχικό.';

  @override
  String get moveUp => 'Μετακίνηση πάνω';

  @override
  String get moveDown => 'Μετακίνηση κάτω';

  @override
  String get renameOutput => 'Μετονομασία αποτελέσματος';

  @override
  String get renameOutputHint => 'Νέο όνομα';

  @override
  String get renameOutputHelp =>
      'Η επέκταση προκύπτει από τη μορφή εξόδου. Αφήστε το κενό για να πάρει το αποτέλεσμα το όνομα της πηγής.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Διαγραφή πρωτοτύπων ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Διαγραφή των πρωτοτύπων μετά τη μετατροπή';

  @override
  String get deleteOriginalsHint =>
      'Ζητά από το σύστημα να αφαιρέσει τα αρχεία προέλευσης μόλις αποθηκευτεί το αποτέλεσμα. Το σύστημα δείχνει πάντα τι πρόκειται να φύγει και περιμένει την επιβεβαίωσή σας.';

  @override
  String get mediaAccessRequired =>
      'Απαιτείται πρόσβαση στη βιβλιοθήκη πολυμέσων για τη διαγραφή των πρωτοτύπων.';

  @override
  String originalsDeleted(String size) {
    return 'Τα πρωτότυπα διαγράφηκαν — ελευθερώθηκαν $size';
  }

  @override
  String get originalsNoneDeleted =>
      'Δεν διαγράφηκε τίποτα. Εντοπίζονται μόνο τα αρχεία που η συλλογή κρατά ακόμη με το αρχικό τους όνομα.';

  @override
  String reclaimedTotal(String size) {
    return 'Ελευθερώθηκαν με αυτή την εφαρμογή: $size';
  }

  @override
  String get deleteAllData => 'Διαγραφή όλων των δεδομένων';

  @override
  String get deleteAllDataHint =>
      'Σβήνει καθετί που κρατά η εφαρμογή σε αυτή τη συσκευή: την ουρά, τα μετατραπέντα αρχεία, τις προεπισκοπήσεις, τα επιτεύγματα και τις ρυθμίσεις. Τα αρχεία που έχετε ήδη αποθηκεύσει στη συλλογή σας δεν θίγονται.';

  @override
  String get codecCopy => 'Αντιγραφή';

  @override
  String get codecCopyRemux => 'Αντιγραφή (remux)';

  @override
  String get codecNoVideo => 'Χωρίς βίντεο';

  @override
  String get codecNoAudio => 'Χωρίς ήχο';

  @override
  String codecLossless(String codec) {
    return '$codec (χωρίς απώλειες)';
  }

  @override
  String formatAnimated(String format) {
    return '$format (κινούμενο)';
  }

  @override
  String get sizeTargetEmail => 'Email';

  @override
  String get trimTimeHint => 'm:ss';
}
