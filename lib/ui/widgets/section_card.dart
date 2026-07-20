import 'package:flutter/material.dart';

import '../theme.dart';

/// A titled group of controls on its own translucent, accent-tinted panel.
///
/// The trick is `alphaBlend(accent, surface)` followed by a partial alpha: the
/// accent is blended *into* the surface and the whole panel then lets the
/// ambient canvas breathe through it. Each section owns a hue, so the settings
/// screen reads as distinct blocks instead of one grey wall.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.children,
    this.accent = AppTheme.primary,
    this.icon,
    this.trailing,
  });

  final String title;
  final List<Widget> children;
  final Color accent;
  final IconData? icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final base = isDark ? theme.colorScheme.surfaceContainer : Colors.white;

    Color tint(double amount, double panelAlpha) =>
        Color.alphaBlend(accent.withValues(alpha: amount), base)
            .withValues(alpha: panelAlpha);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [tint(0.20, 0.62), tint(0.05, 0.44)]
              : [tint(0.16, 0.78), tint(0.03, 0.55)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accent.withValues(alpha: isDark ? 0.32 : 0.22)),
        boxShadow: [
          // On dark the accent shadow only muddies; black carries the lift.
          BoxShadow(
            color: accent.withValues(alpha: isDark ? 0.0 : 0.10),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.30 : 0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  SectionIcon(icon: icon!, accent: accent),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 14),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// The accent-coloured rounded square that anchors a section header.
class SectionIcon extends StatelessWidget {
  const SectionIcon({
    super.key,
    required this.icon,
    required this.accent,
    this.size = 34,
  });

  final IconData icon;
  final Color accent;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: isDark ? 0.24 : 0.14),
        borderRadius: BorderRadius.circular(size * 0.33),
        border: Border.all(color: accent.withValues(alpha: isDark ? 0.30 : 0.18)),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: isDark ? 0.0 : 0.20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, size: size * 0.56, color: accent),
    );
  }
}

/// Label + control laid out as a labelled dropdown.
class LabelledDropdown<T> extends StatelessWidget {
  const LabelledDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.labelOf,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> items;
  final String Function(T) labelOf;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(labelText: label),
      // Without this the button sizes itself to its widest item — "PCM 16-bit
      // (lossless)", "MPEG-4 Part 2" — and overflows a 320dp screen. Expanded,
      // it takes the available width and the label ellipsises instead.
      isExpanded: true,
      borderRadius: BorderRadius.circular(16),
      items: [
        for (final item in items)
          DropdownMenuItem(
            value: item,
            child: Text(labelOf(item), overflow: TextOverflow.ellipsis),
          ),
      ],
      onChanged: onChanged == null ? null : (v) => v == null ? null : onChanged!(v),
    );
  }
}

/// A slider with a caption above it and an explanatory hint below.
class LabelledSlider extends StatelessWidget {
  const LabelledSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.divisions,
    this.hint,
  });

  final String label;
  final int value;
  final int min;
  final int max;
  final int? divisions;
  final String? hint;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        Slider(
          value: value.clamp(min, max).toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: divisions ?? (max - min),
          label: '$value',
          onChanged: (v) => onChanged(v.round()),
        ),
        if (hint != null)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              hint!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}
