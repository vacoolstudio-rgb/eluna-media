/// Binary search over an image encoder's quality scale for the *highest*
/// quality whose output still fits a byte budget.
///
/// Stills have no bitrate, so the arithmetic that makes "fit under 10 MB" work
/// for video has nothing to divide: the only way to know what a JPEG costs at
/// quality 70 is to encode it at quality 70 and look. Encoding a phone photo
/// takes tens of milliseconds, so a handful of probes is cheap — and a halving
/// search reaches the answer in six of them where a linear walk would take
/// ninety-five.
///
/// Pure: no FFmpeg, no files, so the strategy is testable on its own.
class QualitySearch {
  QualitySearch({
    this.minQuality = 5,
    this.maxQuality = 100,
    this.maxSteps = 7,
  })  : _low = minQuality,
        _high = maxQuality;

  /// The floor of the search. Below this a photo is blocky enough that nobody
  /// would call the result a photo, and the honest lever becomes fewer pixels
  /// rather than coarser ones — which is the caller's job.
  final int minQuality;
  final int maxQuality;

  /// Probes allowed. Seven halvings close the default 5..100 interval exactly
  /// — six leave it one step short, which quietly costs the top quality step
  /// on any photo that would have fitted at full quality.
  final int maxSteps;

  int _low;
  int _high;
  int _steps = 0;
  int? _bestFitting;

  /// The quality to encode at next, or null when there is nothing left to
  /// learn: the interval has closed or the probe budget is spent.
  int? next() {
    if (_steps >= maxSteps || _low > _high) return null;
    return (_low + _high) ~/ 2;
  }

  /// Feeds back what [quality] actually produced.
  void record({
    required int quality,
    required int bytes,
    required int targetBytes,
  }) {
    _steps++;
    if (bytes <= targetBytes) {
      // It fits, so this is the new floor — and the best answer so far, since
      // the search always wants the *highest* quality that fits.
      if (_bestFitting == null || quality > _bestFitting!) _bestFitting = quality;
      _low = quality + 1;
    } else {
      _high = quality - 1;
    }
  }

  /// The highest quality found to fit, or null when nothing did.
  int? get bestFitting => _bestFitting;

  int get steps => _steps;
}
