/// The achievements catalogue: local, private gamification in the Reader-app
/// tradition. Everything is computed from on-device counters; nothing about
/// them ever leaves the phone.
library;

enum AchievementTier { bronze, silver, gold, platinum }

/// Lifetime, monotonically-growing usage counters. Only ever incremented —
/// an achievement once earned can never be silently lost.
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

/// The catalogue. Order is display order; [Achievement.platinum] must stay
/// last — it unlocks when everything above it has.
enum Achievement {
  firstConversion(AchievementTier.bronze),
  tenConversions(AchievementTier.bronze),
  fiftyConversions(AchievementTier.silver),
  twoHundredConversions(AchievementTier.gold),
  thousandConversions(AchievementTier.gold),
  saved100Mb(AchievementTier.bronze),
  saved1Gb(AchievementTier.silver),
  saved10Gb(AchievementTier.gold),
  batchOfFive(AchievementTier.bronze),
  batchOfTwenty(AchievementTier.silver),
  sniper(AchievementTier.bronze),
  memeSmith(AchievementTier.bronze),
  soundHunter(AchievementTier.bronze),
  subtitleKeeper(AchievementTier.silver),
  director(AchievementTier.bronze),
  allRounder(AchievementTier.silver),
  nightOwl(AchievementTier.bronze),
  platinum(AchievementTier.platinum);

  const Achievement(this.tier);

  final AchievementTier tier;

  /// Whether [stats] earn this achievement. Platinum is special-cased by the
  /// evaluator because it depends on the rest of the catalogue, not on stats.
  bool earnedBy(ConversionStats stats) => switch (this) {
        firstConversion => stats.conversions >= 1,
        tenConversions => stats.conversions >= 10,
        fiftyConversions => stats.conversions >= 50,
        twoHundredConversions => stats.conversions >= 200,
        thousandConversions => stats.conversions >= 1000,
        saved100Mb => stats.bytesSaved >= 100 * _mb,
        saved1Gb => stats.bytesSaved >= 1 * _gb,
        saved10Gb => stats.bytesSaved >= 10 * _gb,
        batchOfFive => stats.maxBatch >= 5,
        batchOfTwenty => stats.maxBatch >= 20,
        sniper => stats.usedFitToSize,
        memeSmith => stats.madeGif,
        soundHunter => stats.extractedAudio,
        subtitleKeeper => stats.keptSubtitles,
        director => stats.usedTransform,
        allRounder => stats.convertedVideo && stats.convertedAudio && stats.convertedImage,
        nightOwl => stats.nightConversion,
        platinum => false,
      };

  /// The full set earned by [stats], platinum included when everything else
  /// is there.
  static Set<Achievement> evaluate(ConversionStats stats) {
    final earned = <Achievement>{
      for (final a in Achievement.values)
        if (a != Achievement.platinum && a.earnedBy(stats)) a,
    };
    if (earned.length == Achievement.values.length - 1) {
      earned.add(Achievement.platinum);
    }
    return earned;
  }
}
