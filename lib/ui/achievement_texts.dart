import 'package:eluna_shared/eluna_shared.dart';

import '../domain/achievements.dart';
import '../l10n/app_localizations.dart';

/// Названия достижений — единственное, что осталось у приложения: они живут в
/// ARB Media, а не в общей таблице, потому что «Мемодел» осмысленно только там,
/// где вообще делают гифки.
///
/// Отдельным файлом, а не рядом с экраном: те же строки нужны карточке, окну
/// празднования, шторке с деталями и тексту, который уходит в «Поделиться», —
/// а импортировать ради двух строк весь экран достижений значит связать их всех
/// с ним циклом.
(String, String) achievementTexts(L10n l10n, AchievementDef<ConversionStats> def) =>
    switch (Achievement.values.byName(def.id)) {
      Achievement.firstConversion => (l10n.achFirstConversionTitle, l10n.achFirstConversionBody),
      Achievement.tenConversions => (l10n.achTenConversionsTitle, l10n.achTenConversionsBody),
      Achievement.fiftyConversions => (l10n.achFiftyConversionsTitle, l10n.achFiftyConversionsBody),
      Achievement.twoHundredConversions =>
        (l10n.achTwoHundredConversionsTitle, l10n.achTwoHundredConversionsBody),
      Achievement.thousandConversions =>
        (l10n.achThousandConversionsTitle, l10n.achThousandConversionsBody),
      Achievement.saved100Mb => (l10n.achSaved100MbTitle, l10n.achSaved100MbBody),
      Achievement.saved1Gb => (l10n.achSaved1GbTitle, l10n.achSaved1GbBody),
      Achievement.saved10Gb => (l10n.achSaved10GbTitle, l10n.achSaved10GbBody),
      Achievement.batchOfFive => (l10n.achBatchOfFiveTitle, l10n.achBatchOfFiveBody),
      Achievement.batchOfTwenty => (l10n.achBatchOfTwentyTitle, l10n.achBatchOfTwentyBody),
      Achievement.sniper => (l10n.achSniperTitle, l10n.achSniperBody),
      Achievement.memeSmith => (l10n.achMemeSmithTitle, l10n.achMemeSmithBody),
      Achievement.soundHunter => (l10n.achSoundHunterTitle, l10n.achSoundHunterBody),
      Achievement.subtitleKeeper => (l10n.achSubtitleKeeperTitle, l10n.achSubtitleKeeperBody),
      Achievement.director => (l10n.achDirectorTitle, l10n.achDirectorBody),
      Achievement.allRounder => (l10n.achAllRounderTitle, l10n.achAllRounderBody),
      Achievement.nightOwl => (l10n.achNightOwlTitle, l10n.achNightOwlBody),
      Achievement.platinum => (l10n.achPlatinumTitle, l10n.achPlatinumBody),
    };

/// Прогресс словами.
///
/// Байтовые цели («сохранено 100 МБ») в штуках не читаются — «34000000 из
/// 100000000» это не число, а шум, — поэтому у них остаётся один процент.
/// Счётные получают общую подпись «12 из 50».
String achievementProgressText(
  AchievementState<ConversionStats> entry,
  ElunaL10n shared,
) {
  final target = entry.def.target;
  final pct = (entry.progress * 100).round();
  if (target >= 1000 * 1000) return '$pct%';
  return shared.achievementProgressLabel(entry.current.clamp(0, target), target, pct);
}
