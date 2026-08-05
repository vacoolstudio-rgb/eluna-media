// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class L10nPl extends L10n {
  L10nPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Konwersja';

  @override
  String get tabQueue => 'Kolejka';

  @override
  String get tabAbout => 'O aplikacji';

  @override
  String get addFiles => 'Dodaj pliki';

  @override
  String get emptySelectionTitle => 'Brak plików';

  @override
  String get emptySelectionBody =>
      'Dodaj zdjęcia, filmy lub audio. Wszystko jest przetwarzane na tym urządzeniu.';

  @override
  String get sectionOutput => 'Wynik';

  @override
  String get sectionVideo => 'Wideo';

  @override
  String get sectionAudio => 'Audio';

  @override
  String get sectionImage => 'Obraz';

  @override
  String get sectionPrivacy => 'Prywatność';

  @override
  String get outputFormat => 'Format';

  @override
  String get videoCodec => 'Kodek wideo';

  @override
  String get audioCodec => 'Kodek audio';

  @override
  String get rateControl => 'Kontrola przepływności';

  @override
  String get rateControlQuality => 'Stała jakość (CRF)';

  @override
  String get rateControlBitrate => 'Docelowy bitrate';

  @override
  String crfLabel(int value) {
    return 'Jakość (CRF $value)';
  }

  @override
  String get crfHint => 'Niższa wartość to lepsza jakość i większy plik.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate wideo: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate audio: $value kbps';
  }

  @override
  String get encodingPreset => 'Preset kodera';

  @override
  String get encodingPresetHint =>
      'Wolniejsze presety lepiej kompresują, ale bardziej grzeją urządzenie.';

  @override
  String get presetOriginal => 'Oryginał';

  @override
  String get resolution => 'Rozdzielczość';

  @override
  String get frameRate => 'Liczba klatek';

  @override
  String imageQuality(int value) {
    return 'Jakość: $value';
  }

  @override
  String get lossless => 'Bezstratnie';

  @override
  String get losslessHint => 'Większe pliki, wynik idealny co do piksela.';

  @override
  String get sectionEnhance => 'Ulepszanie';

  @override
  String get sharpenLabel => 'Ostrość';

  @override
  String get sharpenHint =>
      'Wyostrza krawędzie. Nie uratuje zdjęcia poruszonego ani nieostrego — tych szczegółów po prostu nie ma w pliku.';

  @override
  String get sharpenStrongHint =>
      'Mocne wyostrzanie może zostawić jasne obwódki wzdłuż krawędzi. Zacznij od poziomu średniego.';

  @override
  String get denoiseLabel => 'Redukcja szumów';

  @override
  String get denoiseHint =>
      'Usuwa ziarno z ciemnych i nocnych zdjęć. Zbyt mocna zaciera drobne detale.';

  @override
  String get autoColorLabel => 'Autokorekta koloru i poziomów';

  @override
  String get autoColorHint =>
      'Rozciąga kontrast i lekko ożywia wyblakłe kolory.';

  @override
  String get upscaleLabel => 'Powiększ 2×';

  @override
  String get upscaleHint =>
      'Podwaja szerokość i wysokość. Nie doda szczegółów — przyda się przy druku lub kadrowaniu.';

  @override
  String get upscaleConflictHint =>
      'Aby powiększyć, ustaw Rozdzielczość z powrotem na Oryginał.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Wył.';

  @override
  String get enhanceLight => 'Słabe';

  @override
  String get enhanceMedium => 'Średnie';

  @override
  String get enhanceStrong => 'Mocne';

  @override
  String get stripMetadata => 'Usuwaj metadane';

  @override
  String get stripMetadataHint => 'Usuwa z wyniku EXIF, GPS i znaczniki czasu.';

  @override
  String startConversion(int count) {
    return 'Konwertuj: $count';
  }

  @override
  String get batchResumed => 'Wznowiono przerwaną konwersję.';

  @override
  String get converting => 'Konwertowanie…';

  @override
  String get cancelBatch => 'Zatrzymaj';

  @override
  String get cancelJob => 'Anuluj';

  @override
  String get clearFinished => 'Wyczyść ukończone';

  @override
  String get removeJob => 'Usuń';

  @override
  String get shareFile => 'Udostępnij';

  @override
  String get retryJob => 'Ponów';

  @override
  String get queueEmptyTitle => 'Kolejka jest pusta';

  @override
  String get queueEmptyBody =>
      'Pliki dodane na karcie Konwersja pojawią się tutaj.';

  @override
  String queueActiveTab(int count) {
    return 'Aktywne · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Zakończone · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nic w toku';

  @override
  String get queueNoActiveBody =>
      'Pliki oczekujące i konwertowane pojawią się tutaj.';

  @override
  String get queueNoFinishedTitle => 'Nic jeszcze nie ukończone';

  @override
  String get queueNoFinishedBody =>
      'Gotowe pliki trafiają tutaj — możesz je otworzyć, zapisać lub udostępnić.';

  @override
  String get statusQueued => 'W kolejce';

  @override
  String get statusRunning => 'Konwertowanie';

  @override
  String get statusCompleted => 'Gotowe';

  @override
  String get statusFailed => 'Błąd';

  @override
  String get statusCancelled => 'Anulowano';

  @override
  String batchSummary(int done, int total) {
    return 'Gotowe $done z $total';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: 'Skonwertowano $done pliku',
      many: 'Skonwertowano $done plików',
      few: 'Skonwertowano $done pliki',
      one: 'Skonwertowano 1 plik',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return 'Gotowe: $done, błędy: $failed.';
  }

  @override
  String savedPercent(int percent) {
    return 'o $percent% mniej';
  }

  @override
  String grewPercent(int percent) {
    return 'o $percent% więcej';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Wygląd';

  @override
  String get theme => 'Motyw';

  @override
  String get themeSystem => 'Systemowy';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get language => 'Język';

  @override
  String get languageSystem => 'Systemowy';

  @override
  String get privacyTitle => 'Prywatność';

  @override
  String get privacyBody =>
      'Eluna Media konwertuje pliki w całości na tym urządzeniu, korzystając z wbudowanej kopii FFmpeg. Pliki nigdy nie opuszczają urządzenia, konto nie jest potrzebne, a telemetrii nie ma. Nic w aplikacji nie korzysta z sieci — nie ma ona nawet uprawnienia do internetu.\n\nUsuwanie metadanych jest domyślnie włączone, więc EXIF, współrzędne GPS i znaczniki czasu nie trafiają do eksportowanych plików.';

  @override
  String get licenseTitle => 'Licencja';

  @override
  String get licenseBody =>
      'Aplikacja zawiera FFmpeg zbudowany z x264, x265 i innymi komponentami GPL, dlatego jako całość jest rozpowszechniana na licencji GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Ten format nie obsługuje wybranego kodeka.';

  @override
  String get sourceMissing => 'Plik źródłowy nie jest już dostępny.';

  @override
  String get errorTitle => 'Konwersja nie powiodła się';

  @override
  String get tabSettings => 'Ustawienia';

  @override
  String get introTitle => 'Prywatność w standardzie';

  @override
  String get introOfflineTitle => 'Konwersja na urządzeniu';

  @override
  String get introOfflineBody =>
      'Całą pracę wykonuje wbudowany FFmpeg. Pliki nie opuszczają telefonu — konwersja działa nawet w trybie samolotowym.';

  @override
  String get introTelemetryTitle => 'Zero telemetrii';

  @override
  String get introTelemetryBody =>
      'Bez konta, bez analityki, bez raportów o awariach. Aplikacja nie wie, kim jesteś.';

  @override
  String get introMetadataTitle => 'Metadane pod kontrolą';

  @override
  String get introMetadataBody =>
      'EXIF, GPS i znaczniki czasu są domyślnie usuwane z każdego wyniku. Można to wyłączyć.';

  @override
  String get introFreeNote =>
      'Bezpłatnie: bez reklam, bez subskrypcji i bez zakupów w aplikacji. Wszystkie funkcje, łącznie z konwersją wsadową, są w komplecie.';

  @override
  String get introContinue => 'Zaczynamy';

  @override
  String get modeSimple => 'Prosty';

  @override
  String get modeAdvanced => 'Zaawansowany';

  @override
  String get modeAdvancedHint =>
      'Pokazuje wszystkie ustawienia kodeków, bitrate\'u i transformacji zamiast kart z presetami.';

  @override
  String get presetCompressVideoTitle => 'Kompresuj wideo';

  @override
  String get presetCompressVideoBody =>
      'Znacznie mniejszy MP4, jakość zostaje dobra';

  @override
  String get presetFitToSizeTitle => 'Zmieść w rozmiarze';

  @override
  String get presetFitToSizeBody => 'Dokładny limit — Discord, e-mail, czaty';

  @override
  String get presetCompatibleMp4Title => 'Zgodny MP4';

  @override
  String get presetCompatibleMp4Body => 'H.264 + AAC. Odtwarza się wszędzie';

  @override
  String get presetExtractAudioTitle => 'Wyodrębnij dźwięk';

  @override
  String get presetExtractAudioBody => 'MP3 z dowolnego wideo';

  @override
  String get presetVideoToGifTitle => 'Wideo na GIF';

  @override
  String get presetVideoToGifBody => 'Krótki klip jako animowany GIF';

  @override
  String get presetMergeTitle => 'Sklej filmy';

  @override
  String get presetMergeBody => 'Połącz klipy w jeden MP4, po kolei';

  @override
  String get mergeNeedsTwo => 'Wybierz co najmniej dwa filmy do sklejenia.';

  @override
  String mergedVideoName(int count) {
    return 'Sklejone wideo ($count klipów).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Kompresuj zdjęcie';

  @override
  String get presetCompressImageBody =>
      'Mniejszy JPEG, strata prawie niewidoczna';

  @override
  String get presetEnhancePhotoTitle => 'Popraw zdjęcie';

  @override
  String get presetEnhancePhotoBody => 'Czyściej, ostrzej, żywsze kolory';

  @override
  String get presetImageToWebpTitle => 'Zdjęcie na WebP';

  @override
  String get presetImageToWebpBody => 'Nowoczesny format, mniejszy niż JPEG';

  @override
  String get sizeTargetTitle => 'Rozmiar docelowy';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Własny…';

  @override
  String get sizeTargetDialogTitle => 'Rozmiar docelowy w MB';

  @override
  String get sizeTargetTooSmall =>
      'Cel jest za mały dla tej długości; zostanie użyta najbliższa możliwa jakość.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size na plik';
  }

  @override
  String estimateTotal(String size) {
    return 'Szacowany wynik: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wybrano $count pliku',
      many: 'Wybrano $count plików',
      few: 'Wybrano $count pliki',
      one: 'Wybrano 1 plik',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Wyczyść';

  @override
  String get presetExpectsVideo =>
      'Ten preset jest przeznaczony dla plików wideo.';

  @override
  String get presetExpectsImage => 'Ten preset jest przeznaczony dla obrazów.';

  @override
  String get promiseOffline => 'Konwersja w 100% offline';

  @override
  String get promiseBatchFree => 'Przetwarzanie wsadowe za darmo';

  @override
  String get promiseNoWatermark => 'Bez znaku wodnego';

  @override
  String get sectionTransform => 'Przekształcenia';

  @override
  String get rotateLabel => 'Obrót';

  @override
  String get flipLabel => 'Odbij w poziomie';

  @override
  String get speedLabel => 'Prędkość';

  @override
  String get cropLabel => 'Kadrowanie';

  @override
  String get cropHint =>
      'Kadrowanie od środka do wybranych proporcji — kwadrat do feedu, 9:16 do relacji.';

  @override
  String volumeLabel(int percent) {
    return 'Głośność: $percent%';
  }

  @override
  String get addAudioFiles => 'Audio i inne pliki';

  @override
  String get hwEncoderLabel => 'Kodowanie sprzętowe';

  @override
  String get hwEncoderHint =>
      'Używa układu wideo urządzenia w trybach bitrate\'u i dopasowania do rozmiaru — znacznie szybciej i chłodniej. Tryb jakości (CRF) zawsze korzysta z precyzyjnego kodera programowego, a nieudane zadanie sprzętowe jest automatycznie ponawiane programowo.';

  @override
  String get transformNeedsReencode =>
      'Obrót, odbicie i prędkość wymagają ponownego kodowania, więc przy kopiowaniu strumienia są wyłączone.';

  @override
  String get capBitrateLabel => 'Nigdy nie powiększaj pliku';

  @override
  String get capBitrateHint =>
      'Ogranicza kodowanie do bitrate\'u oryginalnego pliku. Stała jakość nie ma własnego górnego limitu, więc już skompresowane wideo może inaczej wyjść większe.';

  @override
  String get keepSubtitles => 'Zachowaj napisy';

  @override
  String get keepSubtitlesHint =>
      'Przenosi ścieżki napisów do wyniku. Tylko napisy tekstowe.';

  @override
  String get sectionTrim => 'Przycinanie';

  @override
  String get trimEnable => 'Przytnij w czasie';

  @override
  String get trimHint =>
      'Dostępne, gdy w kolejce jest dokładnie jeden plik o znanej długości.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Rozmiar docelowy';

  @override
  String get lowBatteryTitle => 'Niski poziom baterii';

  @override
  String get lowBatteryBody =>
      'Konwersja mocno obciąża procesor. Możesz najpierw podłączyć ładowarkę albo kontynuować mimo to.';

  @override
  String get lowBatteryContinue => 'Konwertuj mimo to';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odebrano $count pliku',
      many: 'Odebrano $count plików',
      few: 'Odebrano $count pliki',
      one: 'Odebrano 1 plik',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Zapisz';

  @override
  String get savedToGallery => 'Zapisano w galerii, w albumie „Eluna Media”.';

  @override
  String get savedToDownloads => 'Zapisano w Pobranych.';

  @override
  String get saveFailed => 'Nie udało się zapisać pliku.';

  @override
  String get jobRemovedUndo => 'Zadanie usunięte.';

  @override
  String get finishedClearedUndo => 'Ukończone zadania wyczyszczone.';

  @override
  String get undo => 'Cofnij';

  @override
  String get errorDetailsTitle => 'Szczegóły błędu';

  @override
  String get oledDark => 'Czysto czarny ciemny motyw';

  @override
  String get oledDarkHint =>
      'Prawdziwa czerń oszczędza energię na ekranach OLED.';

  @override
  String get dynamicColorLabel => 'Kolory systemowe (Material You)';

  @override
  String get dynamicColorHint =>
      'Paleta z tapety urządzenia tam, gdzie jest to obsługiwane.';

  @override
  String get sectionConversionPrefs => 'Konwersja';

  @override
  String get powerModeLabel => 'Tryb zasilania';

  @override
  String get powerEfficiency => 'Chłodno i szybko';

  @override
  String get powerBalanced => 'Zrównoważony';

  @override
  String get powerQuality => 'Maksymalna kompresja';

  @override
  String get powerModeHint =>
      'Jak mocno pracuje koder wideo. Chłodniej i szybciej oznacza nieco większe pliki. Nic innego nie jest spowalniane — nigdy.';

  @override
  String get hapticsLabel => 'Wibracje';

  @override
  String get networkPrivacyTitle => 'Sieć i prywatność';

  @override
  String get netAuditIntro =>
      'Pełna lista wszystkiego w tej aplikacji, co może korzystać z sieci.';

  @override
  String get netAuditNoneTitle => 'Zero dostępu do sieci';

  @override
  String get netAuditNoneBody =>
      'Aplikacja nie prosi o uprawnienie do internetu, więc nie wyjdzie do sieci, nawet gdyby chciała — sprawdzisz to w systemowych informacjach o aplikacji. Bez reklam, bez analityki, bez sprawdzania aktualizacji. „Oceń aplikację” przekazuje sprawę sklepowi, to on się łączy.';

  @override
  String get netAuditConversionTitle => 'Konwersja';

  @override
  String get netAuditConversionBody =>
      'Działa w całości na tym urządzeniu przez wbudowany FFmpeg. Włącz tryb samolotowy i konwertuj — działa.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Nie ma jej. Aplikacja nie zbiera analityki, raportów o awariach ani identyfikatorów i nie ma systemu kont.';

  @override
  String get sectionSupport => 'Wsparcie';

  @override
  String get rateApp => 'Oceń aplikację';

  @override
  String get openLicenses => 'Licencje open source';

  @override
  String get errorFallbackTitle => 'Coś poszło nie tak';

  @override
  String get errorFallbackBody =>
      'Aplikacja napotkała nieoczekiwany błąd. Kolejka i ustawienia są bezpieczne — wróć i spróbuj ponownie.';

  @override
  String get presetAudioToMp3Title => 'Konwertuj audio';

  @override
  String get presetAudioToMp3Body => 'Do MP3 — zagra wszędzie';

  @override
  String get presetCompressAudioTitle => 'Kompresuj audio';

  @override
  String get presetCompressAudioBody =>
      'Lżejszy AAC — notatki głosowe, podcasty';

  @override
  String get convertTo => 'Konwertuj na';

  @override
  String get formatRecommended => 'Zalecany';

  @override
  String get formatSectionHint =>
      'Na liście są tylko formaty, na które te pliki naprawdę da się przekonwertować.';

  @override
  String get sourceVideo => 'Wideo';

  @override
  String get sourceImage => 'Zdjęcie';

  @override
  String get sourceAudio => 'Audio';

  @override
  String get sourceUnknown => 'Plik';

  @override
  String get mixedSelectionTitle => 'Wybrano różne typy plików';

  @override
  String get mixedSelectionBody =>
      'Każdy plik zostanie przekonwertowany ustawieniem najlepszym dla swojego typu. Dodawaj jeden rodzaj naraz, jeśli chcesz mieć pełną kontrolę.';

  @override
  String get filesTitle => 'Pliki';

  @override
  String get removeFile => 'Usuń';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time do końca';
  }

  @override
  String get jobSettingsTitle => 'Ustawienia konwersji';

  @override
  String get jobDetails => 'Szczegóły';

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
  String get summaryTwoPass => 'Dwa przebiegi';

  @override
  String get summaryEnhanced => 'Poprawione';

  @override
  String get summaryMetadataStripped => 'Metadane usunięte';

  @override
  String summaryMerge(int count) {
    return 'Sklejono $count klipów';
  }

  @override
  String get rateDialogTitle => 'Podoba Ci się Eluna Media?';

  @override
  String get rateDialogBody =>
      'Dotknij gwiazdki. Ocena zostaje między Tobą a sklepem.';

  @override
  String get rateDialogLater => 'Nie teraz';

  @override
  String get rateFeedbackTitle => 'Co możemy poprawić?';

  @override
  String get rateFeedbackBody =>
      'Napisz, co poszło nie tak, a naprawimy. Bez konta, bez śledzenia — po prostu e-mail, który piszesz sam.';

  @override
  String get rateSendFeedback => 'Napisz opinię';

  @override
  String get rateThanks => 'Dziękujemy!';

  @override
  String feedbackSubject(int stars) {
    return 'Opinia o Eluna Media ($stars/5)';
  }

  @override
  String get noEmailApp =>
      'Na tym urządzeniu nie skonfigurowano aplikacji pocztowej.';

  @override
  String get shareApp => 'Udostępnij aplikację';

  @override
  String get shareAppText =>
      'Eluna Media — darmowy konwerter zdjęć, wideo i audio działający w pełni offline. Bez subskrypcji, bez znaków wodnych, bez kont.';

  @override
  String appVersionLabel(String version) {
    return 'Wersja $version';
  }

  @override
  String get openFile => 'Otwórz';

  @override
  String get openFolder => 'Pokaż folder';

  @override
  String get noAppToOpen =>
      'Żadna aplikacja na tym urządzeniu nie otworzy tego pliku.';

  @override
  String get openFailed => 'Nie udało się otworzyć pliku.';

  @override
  String get twoPassLabel => 'Dwa przebiegi dla dokładnego rozmiaru';

  @override
  String get twoPassHint =>
      'Zadania dopasowania do rozmiaru kodują dwa razy i trafiają w budżet bajtów wyraźnie precyzyjniej — kosztem mniej więcej dwukrotnego czasu i baterii.';

  @override
  String get whatsNewTitle => 'Co nowego';

  @override
  String get whatsNew1 =>
      'Gotowe pliki trafiają teraz prosto do galerii, a „Zapisz wszystko” zabiera całą partię naraz.';

  @override
  String get whatsNew2 =>
      'Dopasuj zdjęcie do dokładnego rozmiaru — od 100 KB do 2 MB albo własna wartość.';

  @override
  String get whatsNew3 =>
      'Aplikacja nie gromadzi już gigabajtów: ustawienia pokazują zajęte miejsce i pozwalają je zwolnić.';

  @override
  String get whatsNew4 =>
      'Zatrzymaj konwersję prosto z powiadomienia i dostań ostrzeżenie, zanim zabraknie miejsca.';

  @override
  String get whatsNew5 =>
      'Miniatury, porównanie przed/po, GIF → MP4, dokładne czasy przycięcia — a zdjęcia przetwarzane są po kilka naraz.';

  @override
  String get achievementsTitle => 'Osiągnięcia';

  @override
  String achievementsProgress(int done, int total) {
    return '$done z $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Odblokowano osiągnięcie: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Liczone tylko na tym urządzeniu. Nic nie jest nigdzie wysyłane.';

  @override
  String get achFirstConversionTitle => 'Pierwsze kroki';

  @override
  String get achFirstConversionBody => 'Skonwertuj pierwszy plik.';

  @override
  String get achTenConversionsTitle => 'Rozgrzewka';

  @override
  String get achTenConversionsBody => 'Skonwertuj 10 plików.';

  @override
  String get achFiftyConversionsTitle => 'Stały bywalec';

  @override
  String get achFiftyConversionsBody => 'Skonwertuj 50 plików.';

  @override
  String get achTwoHundredConversionsTitle => 'Koń roboczy';

  @override
  String get achTwoHundredConversionsBody => 'Skonwertuj 200 plików.';

  @override
  String get achThousandConversionsTitle => 'Taśmociąg';

  @override
  String get achThousandConversionsBody => 'Skonwertuj 1000 plików.';

  @override
  String get achSaved100MbTitle => 'Oszczędzacz miejsca';

  @override
  String get achSaved100MbBody => 'Zwolnij łącznie 100 MB.';

  @override
  String get achSaved1GbTitle => 'Łowca gigabajtów';

  @override
  String get achSaved1GbBody => 'Zwolnij łącznie 1 GB.';

  @override
  String get achSaved10GbTitle => 'Bohater pamięci';

  @override
  String get achSaved10GbBody => 'Zwolnij łącznie 10 GB.';

  @override
  String get achBatchOfFiveTitle => 'Wsadowiec';

  @override
  String get achBatchOfFiveBody => 'Ukończ partię co najmniej 5 plików.';

  @override
  String get achBatchOfTwentyTitle => 'Linia montażowa';

  @override
  String get achBatchOfTwentyBody => 'Ukończ partię co najmniej 20 plików.';

  @override
  String get achSniperTitle => 'Snajper';

  @override
  String get achSniperBody =>
      'Traf w dokładny rozmiar dzięki dopasowaniu do rozmiaru.';

  @override
  String get achMemeSmithTitle => 'Memiarz';

  @override
  String get achMemeSmithBody => 'Zamień wideo w GIF.';

  @override
  String get achSoundHunterTitle => 'Łowca dźwięku';

  @override
  String get achSoundHunterBody => 'Wyodrębnij dźwięk z wideo.';

  @override
  String get achSubtitleKeeperTitle => 'Strażnik napisów';

  @override
  String get achSubtitleKeeperBody => 'Skonwertuj wideo z zachowaniem napisów.';

  @override
  String get achDirectorTitle => 'Reżyser';

  @override
  String get achDirectorBody =>
      'Zastosuj przekształcenie — obrót, kadrowanie, prędkość lub głośność.';

  @override
  String get achAllRounderTitle => 'Wszechstronny';

  @override
  String get achAllRounderBody => 'Skonwertuj wideo, audio i obraz.';

  @override
  String get achNightOwlTitle => 'Nocny marek';

  @override
  String get achNightOwlBody => 'Ukończ konwersję między północą a 5 rano.';

  @override
  String get achPlatinumTitle => 'Platyna';

  @override
  String get achPlatinumBody => 'Zdobądź wszystkie pozostałe osiągnięcia.';

  @override
  String get storageTitle => 'Pamięć';

  @override
  String get storageBody =>
      'Przekonwertowane pliki pozostają w aplikacji, dopóki ich nie zapiszesz lub nie udostępnisz — żaden menedżer plików ich nie zobaczy.';

  @override
  String get storageEmpty => 'Nic nie przechowywane';

  @override
  String storageUsage(String size) {
    return 'Zajęte: $size';
  }

  @override
  String get storageClearTitle => 'Wyczyścić przechowywane pliki?';

  @override
  String get storageClearBody =>
      'Usuwa wszystkie ukończone wyniki, które aplikacja wciąż przechowuje. Zapisane lub udostępnione pliki pozostają nietknięte.';

  @override
  String get storageClearAction => 'Wyczyść';

  @override
  String storageCleared(String size) {
    return 'Zwolniono $size';
  }

  @override
  String get autoSaveLabel => 'Zapisuj wyniki automatycznie';

  @override
  String get autoSaveHint =>
      'Umieszcza każdy gotowy plik w galerii — dźwięk w Pobranych — gdy tylko będzie gotowy.';

  @override
  String get lowSpaceTitle => 'Mało wolnego miejsca';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Ta partia potrzebuje około $needed, a wolne jest tylko $free. Konwersja może przerwać się w połowie.';
  }

  @override
  String saveAll(int count) {
    return 'Zapisz wszystko ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Zapisano: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return 'Zapisano $saved z $total';
  }

  @override
  String get presetFitPhotoTitle => 'Zdjęcie do rozmiaru';

  @override
  String get presetFitPhotoBody =>
      'Ściska zdjęcie poniżej dokładnego limitu — formularze, wnioski.';

  @override
  String get photoFitHint =>
      'Aplikacja próbuje kolejnych jakości, aż plik się zmieści. Jeśli limit jest za mały, zmniejsza też wymiary zdjęcia.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Docelowy rozmiar w KB';

  @override
  String get compareAction => 'Porównaj';

  @override
  String get compareBefore => 'Przed';

  @override
  String get compareAfter => 'Po';

  @override
  String get compareHint => 'Przytrzymaj, aby zobaczyć oryginał.';

  @override
  String get trimStart => 'Początek';

  @override
  String get trimEnd => 'Koniec';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, maksymalnie $duration';
  }

  @override
  String get imageScaleLabel => 'Skala';

  @override
  String get audioChannelsLabel => 'Kanały';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Stereo';

  @override
  String get sampleRateLabel => 'Częstotliwość próbkowania';

  @override
  String get voiceAudioHint =>
      'Mono 22,05 kHz zmniejsza nagranie głosu mniej więcej czterokrotnie bez słyszalnej straty. Przy muzyce zostaw oba oryginalne.';

  @override
  String get moveUp => 'W górę';

  @override
  String get moveDown => 'W dół';
}
