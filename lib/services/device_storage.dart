import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// How much room is left on the volume the app writes its output to.
///
/// There is no Dart API for this, so it goes over the same method channel the
/// share intake uses. Every failure path returns null, and every caller treats
/// null as "go ahead": a storage check that cannot answer must never be the
/// reason a conversion does not start.
class DeviceStorage {
  const DeviceStorage({MethodChannel? channel})
      : _channel = channel ?? const MethodChannel('eluna/share_intake');

  final MethodChannel _channel;

  Future<int?> freeBytes() async {
    try {
      final value = await _channel.invokeMethod<Object?>('freeSpace');
      if (value is int) return value;
      if (value is double) return value.round();
      return null;
    } on PlatformException {
      return null;
    } on MissingPluginException {
      // Desktop, tests, an older host build: not knowing is not an error.
      return null;
    }
  }
}

/// The arithmetic behind "will this batch fit", kept pure so it can be tested
/// without a device.
abstract final class SpaceCheck {
  /// Conversions usually shrink their input, but "usually" is not a guarantee
  /// worth betting a half-finished batch on: a remux copies every byte, a
  /// lossless target or a 2× upscale grows, and the two-pass path writes its
  /// analysis log alongside. Budgeting slightly *more* than the sources costs
  /// a warning nobody needed; budgeting less costs a batch that dies at 98%
  /// with `No space left on device`.
  static const double _headroom = 1.15;

  /// Bytes the batch should have available before it starts.
  static int requiredBytes(int totalInputBytes) =>
      totalInputBytes <= 0 ? 0 : (totalInputBytes * _headroom).round();

  /// False only when the platform gave a figure *and* that figure is too small.
  static bool fits({required int totalInputBytes, required int? freeBytes}) {
    if (freeBytes == null || totalInputBytes <= 0) return true;
    return freeBytes >= requiredBytes(totalInputBytes);
  }
}

final deviceStorageProvider = Provider<DeviceStorage>((ref) => const DeviceStorage());
