import 'dart:io';

/// Every ad identifier in the app lives in this file, so going live is a
/// one-file edit: replace the unit ids below (and the application ids in
/// AndroidManifest.xml / Info.plist) with the real ones.
abstract final class AdConfig {
  /// Google's published sample *banner* unit ids — safe to load anywhere,
  /// never pay out. TODO(owner): swap for real unit ids before release.
  static const _testBannerAndroid = 'ca-app-pub-3940256099942544/9214589741';
  static const _testBannerIos = 'ca-app-pub-3940256099942544/2435281174';

  static String get bannerUnitId =>
      Platform.isAndroid ? _testBannerAndroid : _testBannerIos;

  /// New installs run ad-free this long. The user should see the app's value
  /// before they see a banner (the Reader/Cycle pattern).
  static const gracePeriod = Duration(days: 14);

  /// Minimum spacing between banner reloads on foreground.
  static const minRefreshInterval = Duration(minutes: 2);
}
