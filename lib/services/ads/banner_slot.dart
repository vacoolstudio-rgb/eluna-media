import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_config.dart';
import 'ad_gate.dart';
import 'ads_consent.dart';

/// The app's single ad surface: one anchored adaptive banner, non-personalized
/// requests only, docked above the navigation bar.
///
/// Behavioural contract (mirrors the Reader/Cycle apps):
///  * nothing is rendered — zero height — until an ad actually loads;
///  * a failed load collapses the slot and does NOT retry until the next
///    app-foreground or gate change, and never more than once per
///    [AdConfig.minRefreshInterval] — an offline user (this app's core
///    audience) must not generate an endless request loop;
///  * when [bannerAllowedProvider] turns false (Pro, grace period, or a batch
///    starts converting) the ad is disposed outright, not just hidden;
///  * the SDK is not initialized until [AdsConsent] says it may be. It used to
///    be started here, unconditionally, on the first allowed load — which in the
///    EEA is an ad request with no consent signal, and Google answers those with
///    no ad. The banner was not illegal there, it was **empty**.
class BannerSlot extends ConsumerStatefulWidget {
  const BannerSlot({super.key});

  @override
  ConsumerState<BannerSlot> createState() => _BannerSlotState();
}

class _BannerSlotState extends ConsumerState<BannerSlot> with WidgetsBindingObserver {
  BannerAd? _ad;
  bool _loaded = false;
  bool _loading = false;
  DateTime? _lastLoadAt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _ad?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    // The gate captured "now" when it last computed; a session crossing the
    // grace-period boundary would otherwise never notice.
    ref.invalidate(bannerAllowedProvider);
    if (ref.read(bannerAllowedProvider)) _load();
  }

  /// Loads (or refreshes) the banner. Self-throttling: concurrent calls and
  /// calls inside the refresh interval are no-ops, so it is safe to invoke
  /// from build, lifecycle, and failure paths alike.
  Future<void> _load() async {
    if (_loading) return;
    final last = _lastLoadAt;
    if (last != null && DateTime.now().difference(last) < AdConfig.minRefreshInterval) {
      return;
    }
    _loading = true;
    _lastLoadAt = DateTime.now();

    try {
      // Consent first, SDK second — and both lazily, on the first *allowed*
      // load, so a Pro user or one inside the grace period never starts either.
      //
      // Outside the EEA this resolves without showing anything: Google reports
      // that no form is required and the SDK comes up immediately. Nobody in
      // Russia, Ukraine or the US sees a dialog. Inside the EEA the user answers
      // once, and if they say no, `MobileAds.initialize` is never called.
      if (!await AdsConsent.start()) return;
      if (!mounted) return;

      final width = MediaQuery.of(context).size.width.truncate();
      final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(width);
      if (!mounted || size == null) return;

      // Take the old ad out of the tree *before* disposing it: AdWidget
      // resolves its ad once in initState, and a platform view whose ad died
      // under it never recovers.
      final old = _ad;
      if (old != null) {
        setState(() {
          _ad = null;
          _loaded = false;
        });
        old.dispose();
      }

      late final BannerAd ad;
      ad = BannerAd(
        adUnitId: AdConfig.bannerUnitId,
        size: size,
        request: const AdRequest(nonPersonalizedAds: true),
        listener: BannerAdListener(
          // Both callbacks can arrive after a refresh replaced this ad;
          // anything that is no longer `_ad` is somebody else's history.
          onAdLoaded: (_) {
            if (!mounted || ad != _ad) {
              ad.dispose();
              return;
            }
            setState(() => _loaded = true);
          },
          onAdFailedToLoad: (a, _) {
            a.dispose();
            if (!mounted || ad != _ad) return;
            // Collapse; `_lastLoadAt` already blocks an immediate retry, so
            // the next attempt happens on foreground/gate change at the
            // earliest.
            setState(() {
              _ad = null;
              _loaded = false;
            });
          },
        ),
      );
      _ad = ad;
      await ad.load();
    } finally {
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final allowed = ref.watch(bannerAllowedProvider);

    if (!allowed) {
      if (_ad != null) {
        // Dispose outside of build's synchronous path.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || _ad == null) return;
          setState(() {
            _ad?.dispose();
            _ad = null;
            _loaded = false;
          });
        });
      }
      return const SizedBox.shrink();
    }

    if (_ad == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _ad == null) _load();
      });
      return const SizedBox.shrink();
    }

    if (!_loaded) return const SizedBox.shrink();

    final ad = _ad!;
    return SafeArea(
      top: false,
      child: SizedBox(
        width: ad.size.width.toDouble(),
        height: ad.size.height.toDouble(),
        child: AdWidget(ad: ad),
      ),
    );
  }
}
