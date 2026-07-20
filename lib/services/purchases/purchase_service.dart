import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The outcome of a purchase or restore attempt.
enum PurchaseOutcome { success, unavailable, cancelled, failed }

/// The only thing this app ever sells: a one-time "remove ads" unlock.
/// No subscriptions, no feature gates — that is a family-wide principle.
///
/// This is deliberately an interface. The store billing plumbing
/// (`in_app_purchase`) is wired up at release time by swapping the provider
/// override; nothing else in the app changes.
abstract class PurchaseService {
  /// Localized price to show on the button, or null when the store has not
  /// been queried yet.
  Future<String?> price();

  Future<PurchaseOutcome> buyRemoveAds();

  Future<PurchaseOutcome> restore();
}

/// Test-mode billing: succeeds in debug builds so the whole flow can be
/// exercised end-to-end, and reports "store unavailable" in release builds
/// until real billing is configured.
class StubPurchaseService implements PurchaseService {
  @override
  Future<String?> price() async => r'$1.99';

  @override
  Future<PurchaseOutcome> buyRemoveAds() async {
    // A believable moment of latency keeps the UI honest about showing its
    // progress state.
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return kDebugMode ? PurchaseOutcome.success : PurchaseOutcome.unavailable;
  }

  @override
  Future<PurchaseOutcome> restore() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return kDebugMode ? PurchaseOutcome.success : PurchaseOutcome.unavailable;
  }
}

final purchaseServiceProvider = Provider<PurchaseService>((ref) => StubPurchaseService());
