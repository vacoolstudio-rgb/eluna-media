import 'dart:math' as math;

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';

/// A circular progress dial with the percentage in the middle, sweeping the
/// chosen theme's accent gradient and turning green when the job is done.
///
/// Used on the queue's running job, where a plain bar answered "is it moving?"
/// but not "how far along is it?".
class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.value,
    this.size = 56,
    this.stroke = 5,
    this.done = false,
    this.indeterminate = false,
    this.label,
    this.center,
  });

  /// 0..1. Ignored when [indeterminate].
  final double value;
  final double size;
  final double stroke;
  final bool done;

  /// Stills report no timeline, so there is no honest percentage to show.
  final bool indeterminate;

  /// Centre text. Defaults to the rounded percentage.
  final String? label;

  /// Anything richer than a line of text in the middle — the achievements
  /// screen puts a medal and a count there. Wins over [label] when both are
  /// given, and is what makes this a dial rather than a percentage badge.
  final Widget? center;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = context.elunaColors;

    if (indeterminate) {
      return SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: stroke,
          strokeCap: StrokeCap.round,
          color: scheme.primary,
          backgroundColor: scheme.surfaceContainerHighest,
        ),
      );
    }

    final fraction = value.clamp(0.0, 1.0);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: fraction),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      builder: (context, animated, _) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _RingPainter(
            fraction: animated,
            stroke: stroke,
            track: scheme.surfaceContainerHighest,
            colors: done
                ? const [Color(0xFF16A34A), Color(0xFF4ADE80)]
                : [colors.primary, colors.secondary],
          ),
          child: Center(
            child: center ??
                Text(
                  label ?? '${(animated * 100).round()}%',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: done ? colors.success : scheme.onSurface,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.fraction,
    required this.stroke,
    required this.track,
    required this.colors,
  });

  final double fraction;
  final double stroke;
  final Color track;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final centre = rect.center;
    final radius = (math.min(size.width, size.height) - stroke) / 2;

    final trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = track;
    canvas.drawCircle(centre, radius, trackPaint);

    if (fraction <= 0) return;

    // Starts at twelve o'clock rather than three, which is where people
    // expect a dial to begin.
    const start = -math.pi / 2;
    final sweep = 2 * math.pi * fraction;
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: start,
        endAngle: start + 2 * math.pi,
        colors: colors,
      ).createShader(Rect.fromCircle(center: centre, radius: radius));

    canvas.drawArc(
      Rect.fromCircle(center: centre, radius: radius),
      start,
      sweep,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.fraction != fraction || old.colors != colors || old.track != track;
}
