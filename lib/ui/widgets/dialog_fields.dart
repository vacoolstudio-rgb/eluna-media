import 'package:flutter/material.dart';

/// Контроллеры полей, живущие ровно столько, сколько живёт диалог.
///
/// `showDialog` возвращает управление в тот момент, когда маршрут получил
/// `pop`, — но закрывается диалог с анимацией, и ещё несколько кадров его поля
/// остаются в дереве и перестраиваются. `TextField` подписан на пару
/// «контроллер и фокус», поэтому освобождение контроллера сразу после `await`
/// отбирает его у живого поля:
///
///     A TextEditingController was used after being disposed.
///     #4 _AnimatedState.didUpdateWidget
///
/// а следом валится `AnimatedDefaultTextStyle` — это плавающая подпись поля,
/// и в отчёте видно уже её, а не настоящую причину.
///
/// Здесь контроллеры создаёт и освобождает `State` самого диалога, то есть они
/// уходят вместе с маршрутом, а не раньше него.
///
///     showDialog<String>(
///       context: context,
///       builder: (context) => DialogFields(
///         initial: const ['', ''],
///         builder: (context, fields) => AlertDialog(...),
///       ),
///     );
class DialogFields extends StatefulWidget {
  const DialogFields({
    super.key,
    required this.initial,
    required this.builder,
  });

  /// Начальный текст каждого поля; длина списка задаёт число контроллеров.
  final List<String> initial;

  final Widget Function(BuildContext context, List<TextEditingController> fields)
      builder;

  @override
  State<DialogFields> createState() => _DialogFieldsState();
}

class _DialogFieldsState extends State<DialogFields> {
  late final List<TextEditingController> _fields = [
    for (final text in widget.initial) TextEditingController(text: text),
  ];

  @override
  void dispose() {
    for (final field in _fields) {
      field.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _fields);
}
