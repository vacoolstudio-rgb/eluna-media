/// The achievements catalogue: local, private gamification in the Reader-app
/// tradition. Everything is computed from on-device counters; nothing about
/// them ever leaves the phone.
///
/// Формы переехали в пакет: редкость, медаль, математика прогресса и правило
/// платины теперь общие (`AchievementDef` / `AchievementCatalog` из
/// `eluna_shared`). Здесь остаётся ровно то, что у Media своё, — какие
/// достижения существуют, из каких счётчиков они считаются и как называются.
library;

import 'package:eluna_shared/core.dart';
import 'package:hugeicons/hugeicons.dart';

/// Lifetime, monotonically-growing usage counters. Only ever incremented —
/// an achievement once earned can never be silently lost.
///
/// Это и есть тип «входов» `I` общего каталога: всё, что Media умеет мерить.
class ConversionStats {
  const ConversionStats({
    this.conversions = 0,
    this.bytesSaved = 0,
    this.maxBatch = 0,
    this.usedFitToSize = false,
    this.madeGif = false,
    this.extractedAudio = false,
    this.keptSubtitles = false,
    this.usedTransform = false,
    this.convertedVideo = false,
    this.convertedAudio = false,
    this.convertedImage = false,
    this.nightConversion = false,
  });

  final int conversions;

  /// Sum of (input − output) over completed jobs where the output was
  /// smaller. Growth is not punished; it simply does not count as saving.
  final int bytesSaved;

  /// Largest number of files completed in one batch.
  final int maxBatch;

  final bool usedFitToSize;
  final bool madeGif;
  final bool extractedAudio;
  final bool keptSubtitles;
  final bool usedTransform;
  final bool convertedVideo;
  final bool convertedAudio;
  final bool convertedImage;

  /// A batch finished between midnight and 05:00 local time.
  final bool nightConversion;

  ConversionStats copyWith({
    int? conversions,
    int? bytesSaved,
    int? maxBatch,
    bool? usedFitToSize,
    bool? madeGif,
    bool? extractedAudio,
    bool? keptSubtitles,
    bool? usedTransform,
    bool? convertedVideo,
    bool? convertedAudio,
    bool? convertedImage,
    bool? nightConversion,
  }) =>
      ConversionStats(
        conversions: conversions ?? this.conversions,
        bytesSaved: bytesSaved ?? this.bytesSaved,
        maxBatch: maxBatch ?? this.maxBatch,
        usedFitToSize: usedFitToSize ?? this.usedFitToSize,
        madeGif: madeGif ?? this.madeGif,
        extractedAudio: extractedAudio ?? this.extractedAudio,
        keptSubtitles: keptSubtitles ?? this.keptSubtitles,
        usedTransform: usedTransform ?? this.usedTransform,
        convertedVideo: convertedVideo ?? this.convertedVideo,
        convertedAudio: convertedAudio ?? this.convertedAudio,
        convertedImage: convertedImage ?? this.convertedImage,
        nightConversion: nightConversion ?? this.nightConversion,
      );
}

const _mb = 1000 * 1000;
const _gb = 1000 * _mb;

/// Стабильные имена каталога. Order is display order; [Achievement.platinum]
/// must stay last — it unlocks when everything above it has.
///
/// Имя значения — это одновременно `AchievementDef.id` и ключ, под которым
/// разблокировка лежит в SharedPreferences. Переименовать его значит отобрать
/// достижение у всех, у кого оно уже открыто; enum держится именно ради того,
/// чтобы такой ключ нельзя было опечатать, а `switch` по каталогу оставался
/// исчерпывающим.
enum Achievement {
  firstConversion,
  tenConversions,
  fiftyConversions,
  twoHundredConversions,
  thousandConversions,
  saved100Mb,
  saved1Gb,
  saved10Gb,
  batchOfFive,
  batchOfTwenty,
  sniper,
  memeSmith,
  soundHunter,
  subtitleKeeper,
  director,
  allRounder,
  nightOwl,
  platinum,
}

int _flag(bool on) => on ? 1 : 0;

/// Форма одного достижения: иконка медали, редкость, цель и то, чем к ней
/// меряется приближение. Порог больше не булев `earnedBy` — общий код сам
/// сравнивает прогресс с целью, и заодно из этого получается «12 из 50» на
/// экране, которого у Media раньше не было.
AchievementDef<ConversionStats> _def(Achievement a) => switch (a) {
      Achievement.firstConversion => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedRocket01,
          AchRarity.common,
          1,
          (s) => s.conversions,
        ),
      Achievement.tenConversions => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedFiles01,
          AchRarity.common,
          10,
          (s) => s.conversions,
        ),
      Achievement.fiftyConversions => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedAward01,
          AchRarity.rare,
          50,
          (s) => s.conversions,
        ),
      Achievement.twoHundredConversions => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedChampion,
          AchRarity.epic,
          200,
          (s) => s.conversions,
        ),
      Achievement.thousandConversions => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedCrown,
          AchRarity.legendary,
          1000,
          (s) => s.conversions,
        ),
      Achievement.saved100Mb => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedSaveEnergy01,
          AchRarity.common,
          100 * _mb,
          (s) => s.bytesSaved,
        ),
      Achievement.saved1Gb => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedHardDrive,
          AchRarity.rare,
          1 * _gb,
          (s) => s.bytesSaved,
        ),
      Achievement.saved10Gb => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedDatabase01,
          AchRarity.legendary,
          10 * _gb,
          (s) => s.bytesSaved,
        ),
      Achievement.batchOfFive => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedLayers01,
          AchRarity.common,
          5,
          (s) => s.maxBatch,
        ),
      Achievement.batchOfTwenty => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedPackage,
          AchRarity.rare,
          20,
          (s) => s.maxBatch,
        ),
      Achievement.sniper => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedTarget01,
          AchRarity.common,
          1,
          (s) => _flag(s.usedFitToSize),
        ),
      Achievement.memeSmith => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedFilm01,
          AchRarity.common,
          1,
          (s) => _flag(s.madeGif),
        ),
      Achievement.soundHunter => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedMusicNote01,
          AchRarity.common,
          1,
          (s) => _flag(s.extractedAudio),
        ),
      Achievement.subtitleKeeper => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedClosedCaption,
          AchRarity.rare,
          1,
          (s) => _flag(s.keptSubtitles),
        ),
      Achievement.director => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedCrop,
          AchRarity.common,
          1,
          (s) => _flag(s.usedTransform),
        ),
      // Единственное составное: три вида медиа, поэтому цель — 3, и кольцо
      // честно показывает, сколько из них уже пройдено.
      Achievement.allRounder => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedSparkles,
          AchRarity.rare,
          3,
          (s) =>
              _flag(s.convertedVideo) +
              _flag(s.convertedAudio) +
              _flag(s.convertedImage),
        ),
      Achievement.nightOwl => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedMoon02,
          AchRarity.common,
          1,
          (s) => _flag(s.nightConversion),
        ),
      // Платину общий каталог считает сам: её прогресс — это «сколько из
      // остальных уже открыто», поэтому цель равна размеру каталога без неё,
      // а функция прогресса не вызывается вообще.
      Achievement.platinum => AchievementDef(
          a.name,
          HugeIcons.strokeRoundedMedal01,
          AchRarity.platinum,
          Achievement.values.length - 1,
          (_) => 0,
        ),
    };

/// Каталог Media.
///
/// `titleFor`/`descriptionFor` общий код зовёт только со своих экранов
/// достижений — в пакете их пока нет, а экран Media берёт строки сам через
/// `achievementTexts`, потому что ARB-таблица приложения читается только через
/// BuildContext, а каталог нужен и контроллеру, у которого контекста нет.
/// Поэтому здесь возвращается id: подставить сюда перевод всё равно нечем.
final mediaAchievements = AchievementCatalog<ConversionStats>(
  defs: [
    for (final a in Achievement.values)
      if (a != Achievement.platinum) _def(a),
  ],
  platinum: _def(Achievement.platinum),
  titleFor: (id) => id,
  descriptionFor: (id) => id,
);
