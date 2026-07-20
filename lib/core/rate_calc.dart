/// Bitrate arithmetic for the "fit to size" mode and for output-size
/// estimates. Pure Dart, host-testable.
abstract final class RateCalc {
  /// Fraction of the target budget handed to the encoders. The rest absorbs
  /// container overhead and ABR overshoot, so "10 MB" reliably lands *under*
  /// 10 MB — an estimate that overshoots a messenger's limit is worse than
  /// useless.
  static const double safetyFactor = 0.93;

  /// Below this the picture degrades into an unusable smear; refusing the job
  /// beats delivering it.
  static const int minVideoKbps = 100;

  /// Video bitrate (kbps) that fits [targetBytes] over [durationMs] next to an
  /// audio track of [audioKbps]. Returns null when the target is impossible —
  /// the budget is eaten by audio alone, or the leftover is below
  /// [minVideoKbps].
  static int? videoKbpsForTarget({
    required int targetBytes,
    required int durationMs,
    required int audioKbps,
  }) {
    if (targetBytes <= 0 || durationMs <= 0) return null;
    final seconds = durationMs / 1000;
    final totalKbps = targetBytes * 8 * safetyFactor / seconds / 1000;
    final videoKbps = (totalKbps - audioKbps).floor();
    if (videoKbps < minVideoKbps) return null;
    return videoKbps;
  }

  /// Expected output size in bytes for a plain bitrate encode. This is the
  /// same arithmetic FFmpeg's ABR aims for, so it is honest for bitrate/size
  /// modes; CRF output is content-dependent and deliberately not estimated.
  static int estimatedBytes({
    required int videoKbps,
    required int audioKbps,
    required int durationMs,
  }) {
    final seconds = durationMs / 1000;
    return ((videoKbps + audioKbps) * 1000 / 8 * seconds).round();
  }
}
