import 'package:eluna_shared/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/platform/eluna_adapters.dart';

/// Идентификаторы чаевых, от меньшего к большему. Это **расходуемые** покупки:
/// чаевые — это спасибо, его можно оставить сколько угодно раз, и оно ничего не
/// открывает. Никакого «куплено», никакого восстановления покупок: восстановить
/// спасибо — несвязная идея, а магазин, которому это поручили, будет выдавать
/// его заново вечно.
///
/// Идентификаторы обязаны совпадать с товарами в Play Console (и в App Store
/// Connect, когда до него дойдёт). **Цену приложение не знает и не пишет** —
/// её называет магазин, потому что только он знает страну и валюту.
const kTipCoffee = 'tip_coffee';
const kTipSnack = 'tip_snack';
const kTipGenerous = 'tip_generous';

/// Порядок показа.
const kTipProductIds = <String>[kTipCoffee, kTipSnack, kTipGenerous];

/// Обычный `Provider`, а не `ChangeNotifierProvider`: в riverpod 3 последнего
/// больше нет, а `TipsController` — это `ChangeNotifier`, и экран пакета сам
/// на него подписывается. Ровно так же здесь живёт тема.
///
/// `init()` запускается при первом чтении провайдера, то есть при открытии
/// экрана чаевых, — а не на старте приложения: спрашивать магазин о товарах у
/// того, кто никогда не зайдёт в этот раздел, незачем.
final tipsControllerProvider = Provider<TipsController>((ref) {
  final controller = TipsController(const MediaPurchaseAdapter())..init();
  ref.onDispose(controller.dispose);
  return controller;
});
