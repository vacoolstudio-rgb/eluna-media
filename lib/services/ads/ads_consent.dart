import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Google's User Messaging Platform, in front of the ad SDK.
///
/// **Why this exists, given that every request here is non-personalized.**
/// Non-personalized is not the same as *no data*. An NPA request still reads and
/// writes storage on the device — frequency capping, fraud prevention — and that
/// is exactly what EEA/UK/Swiss law asks consent for. Google enforces it from its
/// side too: without a consent signal it simply **serves no ads at all** to those
/// users. So the missing form was not a legal abstraction, it was lost revenue.
///
/// **The rule that must never break: the form appears only where it is legally
/// required.** [ConsentForm.loadAndShowConsentFormIfRequired] is the whole point
/// of the API — it asks Google whether this user (by IP-derived region) needs a
/// form, and shows nothing if they do not. A user in Russia, Ukraine or the US
/// sees no dialog, at no point, ever, and their ads start exactly as before.
/// Anything that would put a consent dialog in front of them is a bug that costs
/// the app its income.
///
/// The SDK is not initialized until consent allows it. If the user declines,
/// `MobileAds.initialize` is never called: no requests, no identifiers, no ads.
abstract final class AdsConsent {
  static bool _sdkStarted = false;

  /// Runs consent, then starts the SDK if — and only if — consent allows it.
  /// Returns whether ads may be requested.
  ///
  /// Idempotent and cheap after the first call.
  static Future<bool> start() async {
    if (_sdkStarted) return true;
    if (!await _gather()) return false;

    try {
      await MobileAds.instance.initialize();
      _sdkStarted = true;
    } catch (_) {
      return false;
    }
    return _sdkStarted;
  }

  /// Whether this user must be offered a way to change their mind. True only
  /// where a form was required in the first place — so the settings row that
  /// depends on it stays hidden everywhere else, rather than opening a dialog
  /// that has nothing to say.
  static Future<bool> privacyOptionsRequired() async {
    try {
      final status =
          await ConsentInformation.instance.getPrivacyOptionsRequirementStatus();
      return status == PrivacyOptionsRequirementStatus.required;
    } catch (_) {
      return false;
    }
  }

  /// Re-opens Google's form so the user can withdraw or grant consent.
  static Future<void> showPrivacyOptions() {
    final done = Completer<void>();
    ConsentForm.showPrivacyOptionsForm((_) {
      if (!done.isCompleted) done.complete();
    });
    return done.future;
  }

  static Future<bool> _gather() async {
    final answer = Completer<bool>();
    void settle(bool value) {
      if (!answer.isCompleted) answer.complete(value);
    }

    try {
      ConsentInformation.instance.requestConsentInfoUpdate(
        ConsentRequestParameters(),
        () async {
          try {
            // Shows a form only where one is required. This is the line that
            // keeps the dialog out of the face of every user outside the EEA.
            await ConsentForm.loadAndShowConsentFormIfRequired(
              (_) async => settle(await _canRequestAds()),
            );
          } catch (_) {
            settle(await _canRequestAds());
          }
        },
        // The lookup failed — offline, or Google unreachable. Fall back to the
        // consent state cached from a previous launch rather than inventing an
        // answer in either direction. An offline user is this app's core
        // audience, and they must not lose their ads because a network call for
        // a form they never needed did not go through.
        (_) async => settle(await _canRequestAds()),
      );
    } catch (_) {
      return false;
    }

    return answer.future.timeout(
      const Duration(seconds: 15),
      // A consent SDK that never answers must not leave the app showing ads it
      // has no permission for. Silence is a no.
      onTimeout: () => false,
    );
  }

  static Future<bool> _canRequestAds() async {
    try {
      return await ConsentInformation.instance.canRequestAds();
    } catch (_) {
      return false;
    }
  }
}
