import 'package:flutter/material.dart';

// SectionCard и SectionIcon отсюда удалены: их математика тонировки была
// побайтово той же, что в eluna_shared, — теперь используется общая пара
// SectionCard + SectionHeader из пакета. Здесь остались только два контрола,
// которых в пакете нет и которые принадлежат конвертеру.

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
      // The renamed `value`. It still tracks external changes: the state's
      // didUpdateWidget calls setValue whenever this differs from the last
      // build, which is what a Riverpod-driven dropdown depends on.
      initialValue: value,
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
            padding: const EdgeInsetsDirectional.only(start: 4),
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
