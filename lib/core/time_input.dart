/// Reading and writing the timestamps a person types.
///
/// The trim range used to be a slider and nothing else. On a two-hour video one
/// pixel is roughly ten seconds, so "cut from 12:04" was not a thing anyone
/// could express — the control was fine for lopping off an intro and useless
/// for anything exact.
abstract final class TimeInput {
  /// Parses `12`, `1:23`, `1:02:03`, `1:23.5` into milliseconds.
  ///
  /// Returns null for anything it cannot read, including a negative or an
  /// out-of-range minute/second field: silently accepting `1:75` and calling it
  /// 2:15 would put the cut somewhere the user did not ask for.
  static int? parse(String input) {
    final text = input.trim();
    if (text.isEmpty) return null;

    final parts = text.split(':');
    if (parts.length > 3) return null;

    // Only the leading field may exceed its natural range — "90:00" is a
    // legitimate way to say an hour and a half.
    var total = 0.0;
    for (var i = 0; i < parts.length; i++) {
      final raw = parts[i].trim();
      if (raw.isEmpty) return null;
      final value = double.tryParse(raw);
      if (value == null || value.isNegative || !value.isFinite) return null;
      if (i > 0 && value >= 60) return null;
      total = total * 60 + value;
    }

    final ms = (total * 1000).round();
    return ms < 0 ? null : ms;
  }

  /// `m:ss` under an hour, `h:mm:ss` above it. The inverse of [parse] for every
  /// value it can produce.
  static String format(int milliseconds) {
    final totalSeconds = (milliseconds / 1000).round();
    final s = totalSeconds.remainder(60);
    final m = (totalSeconds ~/ 60).remainder(60);
    final h = totalSeconds ~/ 3600;
    final ss = s.toString().padLeft(2, '0');
    if (h == 0) return '$m:$ss';
    return '$h:${m.toString().padLeft(2, '0')}:$ss';
  }
}
