import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

import '../state/app_meta_controller.dart';
import '../ui/rate_app_sheet.dart';

/// Decides — purely, host-testably — whether today is the day to ask for a
/// review.
///
/// The rules, lifted from the Reader/Cycle apps and store policy:
///  * only on day 7 or later after first launch (day 14 is the second window);
///  * only after at least two successful conversions — never ask a user the
///    app has not yet helped;
///  * at most one prompt per calendar day, and never after the user rated.
///
/// Aggressive rating nag-screens are a top-12 complaint against competitor
/// converters, which is why this errs quiet.
bool shouldPromptReview({
  required bool hasRated,
  required DateTime firstLaunchAt,
  required DateTime now,
  required int successfulConversions,
  required int lastPromptEpochDay,
}) {
  if (hasRated) return false;
  if (successfulConversions < 2) return false;

  final daysSinceInstall = now.difference(firstLaunchAt).inDays;
  if (daysSinceInstall < 7) return false;

  final today = now.millisecondsSinceEpoch ~/ Duration.millisecondsPerDay;
  if (today == lastPromptEpochDay) return false;

  return true;
}

/// Fires the platform's native in-app review sheet when [shouldPromptReview]
/// allows it. iOS policy (guideline 5.6.1) forbids gating, so the native
/// prompt is always the thing shown; the OS itself rate-limits how often it
/// actually appears.
class ReviewService {
  ReviewService(this._ref);

  final Ref _ref;

  /// The user explicitly tapped "Rate the app" — no milestone rules apply.
  Future<void> promptNow(BuildContext context) => _prompt(context);

  /// Fires only when the milestones allow it, right after a successful batch.
  Future<void> maybePrompt(BuildContext context) async {
    final meta = _ref.read(appMetaProvider);
    final now = DateTime.now();

    if (!shouldPromptReview(
      hasRated: meta.hasRated,
      firstLaunchAt: DateTime.fromMillisecondsSinceEpoch(meta.firstLaunchAtMs),
      now: now,
      successfulConversions: meta.successfulConversions,
      lastPromptEpochDay: meta.lastRatePromptEpochDay,
    )) {
      return;
    }

    _ref
        .read(appMetaProvider.notifier)
        .markRatePromptShown(now.millisecondsSinceEpoch ~/ Duration.millisecondsPerDay);

    if (context.mounted) await _prompt(context);
  }

  /// iOS gets Apple's native prompt and nothing else — guideline 5.6.1 forbids
  /// pre-screening. Android may pre-screen, so it gets the star sheet, which
  /// routes 5★ to Play and anything lower to an e-mail the user writes.
  Future<void> _prompt(BuildContext context) async {
    if (Platform.isIOS) {
      final review = InAppReview.instance;
      if (await review.isAvailable()) {
        await review.requestReview();
        _ref.read(appMetaProvider.notifier).markRated();
      }
      return;
    }
    if (context.mounted) await showRateAppSheet(context);
  }
}

final reviewServiceProvider = Provider<ReviewService>(ReviewService.new);
