import 'package:flutter/material.dart';

import '../theme.dart';

/// The app-wide canvas: a soft vertical gradient plus two large, low-alpha
/// brand glows. Every Scaffold is transparent and sits on top of this, which
/// is what stops the app looking like a stack of grey Material cards.
///
/// Painted per screen rather than once behind the navigator, so page
/// transitions never ghost one screen's canvas through another's.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child, this.emphasized = false});

  final Widget child;

  /// Stronger glows for the hero screens (Convert); ordinary content screens
  /// keep the default so the wash stays quiet behind dense controls.
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final base = isDark
        ? const [Color(0xFF15121F), Color(0xFF0D0F17), Color(0xFF090B11)]
        : const [Color(0xFFF4EDFF), Color(0xFFEDEEFB), Color(0xFFE6ECF8)];

    final k = emphasized ? 1.0 : 0.7;
    final glowViolet = AppTheme.primary.withValues(alpha: (isDark ? 0.20 : 0.16) * k);
    final glowBlue = AppTheme.info.withValues(alpha: (isDark ? 0.14 : 0.12) * k);
    final glowLower = AppTheme.secondary.withValues(alpha: (isDark ? 0.10 : 0.09) * k);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: base,
          stops: const [0.0, 0.45, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: -140, right: -110, child: _Glow(color: glowViolet, size: 380)),
          Positioned(top: 40, left: -130, child: _Glow(color: glowBlue, size: 320)),
          if (emphasized)
            Positioned(bottom: -180, left: -90, child: _Glow(color: glowLower, size: 460)),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
        ),
      ),
    );
  }
}
