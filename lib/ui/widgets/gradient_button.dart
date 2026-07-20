import 'package:flutter/material.dart';

import '../theme.dart';
import 'pressable.dart';

/// The primary call to action: brand gradient, violet glow, and a muted
/// surface when disabled. There is exactly one of these on screen at a time.
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.gradient,
    this.expand = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;

  /// Defaults to the brand gradient; the Stop action passes the danger one.
  final Gradient? gradient;
  final bool expand;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final enabled = onPressed != null;
    final fg = enabled ? Colors.white : scheme.onSurfaceVariant;
    final g = gradient ?? AppTheme.brandGradient;
    final glow = (g is LinearGradient && g.colors.isNotEmpty) ? g.colors.first : AppTheme.primary;

    return PressableScale(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: padding,
        decoration: BoxDecoration(
          gradient: enabled ? g : null,
          color: enabled ? null : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: glow.withValues(alpha: 0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: fg),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: fg, fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
