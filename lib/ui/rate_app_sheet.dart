import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_version.dart';
import '../l10n/app_localizations.dart';
import '../state/app_meta_controller.dart';
import 'theme.dart';
import 'widgets/pressable.dart';

/// Where a low rating goes instead of the store.
const _feedbackEmail = 'support@eluna.app';

/// The rating flow, and it is deliberately different per platform.
///
/// **iOS** never sees this sheet: App Store guideline 5.6.1 forbids gating or
/// filtering reviews, so the caller fires Apple's native prompt directly.
///
/// **Android** may pre-screen, which Google permits: five stars opens the Play
/// review sheet; anything less opens an e-mail the user writes themselves, so
/// a complaint reaches the developer instead of the public listing. Nothing is
/// transmitted by the app either way — the mail app is the user's.
Future<void> showRateAppSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => const _RateAppSheet(),
  );
}

class _RateAppSheet extends ConsumerStatefulWidget {
  const _RateAppSheet();

  @override
  ConsumerState<_RateAppSheet> createState() => _RateAppSheetState();
}

class _RateAppSheetState extends ConsumerState<_RateAppSheet> {
  int _stars = 0;

  Future<void> _submit() async {
    final l10n = L10n.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final meta = ref.read(appMetaProvider.notifier);

    // Whatever the user chose, they went through the flow: never ask again.
    meta.markRated();

    if (_stars >= 5) {
      final review = InAppReview.instance;
      if (await review.isAvailable()) await review.requestReview();
      navigator.pop();
      return;
    }

    final uri = Uri(
      scheme: 'mailto',
      path: _feedbackEmail,
      queryParameters: {
        'subject': l10n.feedbackSubject(_stars),
        'body': '\n\n---\nEluna Media $kAppVersion · ${Platform.operatingSystem}',
      },
    );
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication)
        .catchError((_) => false);

    navigator.pop();
    if (!launched) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.noEmailApp)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final lowRating = _stars > 0 && _stars < 5;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppTheme.brandGradient,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.star_rounded, size: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              lowRating ? l10n.rateFeedbackTitle : l10n.rateDialogTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              lowRating ? l10n.rateFeedbackBody : l10n.rateDialogBody,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 1; i <= 5; i++)
                  PressableScale(
                    onTap: () => setState(() => _stars = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 180),
                        scale: i <= _stars ? 1.15 : 1,
                        child: Icon(
                          i <= _stars ? Icons.star_rounded : Icons.star_outline_rounded,
                          size: 40,
                          color: i <= _stars
                              ? const Color(0xFFD4A017)
                              : theme.colorScheme.outlineVariant,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 22),
            FilledButton(
              onPressed: _stars == 0 ? null : _submit,
              child: Text(lowRating ? l10n.rateSendFeedback : l10n.rateThanks),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.rateDialogLater),
            ),
          ],
        ),
      ),
    );
  }
}
