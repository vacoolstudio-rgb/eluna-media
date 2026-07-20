import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../services/purchases/purchase_service.dart';
import '../state/app_meta_controller.dart';
import 'theme.dart';
import 'widgets/gradient_button.dart';

/// The whole "paywall": a bottom sheet for the one thing the app sells.
/// Deliberately modest — no countdown timers, no fake discounts, and the
/// sheet itself repeats that every feature is free without it.
Future<void> showRemoveAdsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => const _RemoveAdsSheet(),
  );
}

class _RemoveAdsSheet extends ConsumerStatefulWidget {
  const _RemoveAdsSheet();

  @override
  ConsumerState<_RemoveAdsSheet> createState() => _RemoveAdsSheetState();
}

class _RemoveAdsSheetState extends ConsumerState<_RemoveAdsSheet> {
  bool _busy = false;
  String? _price;

  @override
  void initState() {
    super.initState();
    ref.read(purchaseServiceProvider).price().then((p) {
      if (mounted) setState(() => _price = p);
    });
  }

  Future<void> _run(Future<PurchaseOutcome> Function() action) async {
    setState(() => _busy = true);
    final outcome = await action();
    if (!mounted) return;
    setState(() => _busy = false);

    final l10n = L10n.of(context);
    switch (outcome) {
      case PurchaseOutcome.success:
        ref.read(appMetaProvider.notifier).setPro(true);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.purchaseSuccess)),
        );
      case PurchaseOutcome.unavailable:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.purchaseUnavailable)),
        );
      case PurchaseOutcome.cancelled:
        break;
      case PurchaseOutcome.failed:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.purchaseFailed)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final service = ref.read(purchaseServiceProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppTheme.brandGradient,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.4),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(Icons.workspace_premium_rounded,
                    size: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.removeAdsTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 18),
            for (final bullet in [
              l10n.removeAdsBullet1,
              l10n.removeAdsBullet2,
              l10n.removeAdsBullet3,
            ])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_rounded, size: 18, color: AppTheme.success),
                    const SizedBox(width: 10),
                    Expanded(child: Text(bullet, style: theme.textTheme.bodyMedium)),
                  ],
                ),
              ),
            const SizedBox(height: 22),
            SizedBox(
              height: 52,
              child: _busy
                  ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                  : GradientButton(
                      label: l10n.buyFor(_price ?? '…'),
                      icon: Icons.lock_open_rounded,
                      onPressed: _price == null ? null : () => _run(service.buyRemoveAds),
                    ),
            ),
            TextButton(
              onPressed: _busy ? null : () => _run(service.restore),
              child: Text(l10n.restorePurchase),
            ),
          ],
        ),
      ),
    );
  }
}
