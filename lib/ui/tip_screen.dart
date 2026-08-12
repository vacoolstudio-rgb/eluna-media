import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/tips_controller.dart';

/// «Купите мне кофе». Экран и вся его логика — в `eluna_shared`; здесь только
/// шов с riverpod и эмодзи для уровней, единственное, что у Media своё.
class TipScreen extends ConsumerWidget {
  const TipScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElunaTipsScreen(
      controller: ref.watch(tipsControllerProvider),
      emoji: const {
        kTipCoffee: '☕',
        kTipSnack: '🍿',
        kTipGenerous: '❤️',
      },
    );
  }
}
