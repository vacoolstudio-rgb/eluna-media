import 'dart:async';
import 'dart:ui' show Color;

import 'package:dynamic_color/dynamic_color.dart';
import 'package:eluna_shared/core.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// Что общий код не может знать про это приложение — плагины, чей API меняется
/// от версии к версии. Контракты живут в eluna_shared, реализации здесь: пакет
/// не тянет плагин в свой pubspec, и его версия остаётся делом приложения.
/// См. docs/CONTRACT.md §5.

/// Material You: отдаём общей теме ЦВЕТ обоев, а не готовую `ColorScheme`.
///
/// Раньше Media передавала схему целиком из `DynamicColorBuilder`. Пакет так не
/// умеет намеренно: его схемы расписаны вручную ровно затем, чтобы гармонизатор
/// Material в них ничего не пересчитывал, и принять готовую схему значило бы
/// вернуть то, от чего уходили. `ElunaPalette.fromAccent` разворачивает один
/// цвет в ту же форму, что и любой пресет, поэтому обои перекрашивают тему, а
/// её характер остаётся общим для семьи.
///
/// Видимое следствие: у кого переключатель включён, цвета изменятся.
class MediaDynamicColorAdapter implements ElunaDynamicColorAdapter {
  const MediaDynamicColorAdapter();

  @override
  Future<Color?> wallpaperAccent() async {
    try {
      final palette = await DynamicColorPlugin.getCorePalette();
      // primary.get(40) — тон, который Material берёт за основной акцент;
      // палитра отдаёт целую лестницу, а нам нужен один seed.
      if (palette != null) return Color(palette.primary.get(40));
      // Android до 12 и iOS не отдают ничего; десктопы — отдельным каналом.
      // Null здесь не ошибка, а «остаётся выбранный пресет».
      return await DynamicColorPlugin.getAccentColor();
    } catch (e) {
      AppLogger.instance.w('theme', 'wallpaper accent unavailable', e);
      return null;
    }
  }
}

/// Отправка письма в поддержку — только через почтовый клиент пользователя.
///
/// `false` здесь означает «своего способа отправить нет», и это правда: у
/// Subs на этом месте нативный интент со вложениями, а у Media нет ни канала,
/// ни вложений (экран поддержки открывается без выбора файлов). Общий экран,
/// получив отказ, сам открывает `mailto:` через url_launcher — плагин у Media
/// уже есть, — а если и он не открылся, предлагает скопировать письмо в буфер.
///
/// Именно поэтому адаптер выглядит пустым и должен таким остаться: релизная
/// сборка Media идёт БЕЗ разрешения INTERNET и обещает, что ничего не уходит с
/// устройства. Любой плагин отправки — это сетевой плагин в манифесте и
/// нарушенное обещание; письмо, которое пользователь сам видит и сам
/// отправляет своим почтовым клиентом, — нет.
class MediaMailAdapter implements ElunaMailAdapter {
  const MediaMailAdapter();

  @override
  Future<bool> compose({
    required String to,
    required String subject,
    required String body,
    List<String> attachmentPaths = const [],
  }) async =>
      false;
}

/// Магазинная половина банки для чаевых.
///
/// Про обещание «ничего не уходит с устройства» здесь стоит сказать прямо, а не
/// надеяться, что это очевидно: **разрешения INTERNET у приложения по-прежнему
/// нет и не появляется**. Play Billing работает не по сети из нашего процесса,
/// а через приложение Play Store — межпроцессным вызовом; в сеть ходит оно.
/// Проверяется это не рассуждением, а собранным манифестом релиза: если
/// INTERNET в нём когда-нибудь появится, чаевые надо убирать, а не обещание.
///
/// `in_app_purchase` сообщает о покупке потоком, а не результатом вызова,
/// который её начал, — поэтому [buy] мостит одно к другому: запускает поток
/// покупки и завершается, когда придёт нужное событие. Всё, что выше этой черты — ожидание
/// на кнопке, благодарность, разница между «платёж ещё идёт» и «не удался», —
/// живёт в общем `TipsController`.
class MediaPurchaseAdapter implements ElunaPurchaseAdapter {
  const MediaPurchaseAdapter();

  InAppPurchase get _iap => InAppPurchase.instance;

  @override
  Future<bool> isAvailable() => _iap.isAvailable();

  @override
  Future<List<ElunaTipProduct>> queryProducts(Set<String> ids) async {
    final response = await _iap.queryProductDetails(ids);
    return [
      for (final p in response.productDetails)
        ElunaTipProduct(
          id: p.id,
          title: p.title,
          description: p.description,
          // Цена, которую отформатировал магазин, в валюте пользователя.
          // Никогда не та, что придумало приложение: неверная цена на кнопке
          // покупки — это возврат и одна звезда.
          price: p.price,
        ),
    ];
  }

  @override
  Future<ElunaPurchaseResult> buy(String productId) async {
    final response = await _iap.queryProductDetails({productId});
    if (response.productDetails.isEmpty) {
      return ElunaPurchaseResult.unavailable;
    }
    final product = response.productDetails.first;

    final once = _Once();
    late final StreamSubscription<List<PurchaseDetails>> sub;
    sub = _iap.purchaseStream.listen((purchases) async {
      for (final p in purchases) {
        if (p.productID != productId) continue;
        // Транзакцию надо закрыть всегда, иначе магазин будет выдавать её
        // заново на каждом запуске.
        if (p.pendingCompletePurchase) {
          try {
            await _iap.completePurchase(p);
          } catch (e) {
            AppLogger.instance.w('iap', 'completePurchase failed', e);
          }
        }
        switch (p.status) {
          case PurchaseStatus.pending:
            // Не зависание и не отказ: медленный способ оплаты принял заказ.
            once.complete(ElunaPurchaseResult.pending);
          case PurchaseStatus.purchased:
          case PurchaseStatus.restored:
            once.complete(ElunaPurchaseResult.purchased);
          case PurchaseStatus.canceled:
            once.complete(ElunaPurchaseResult.cancelled);
          case PurchaseStatus.error:
            AppLogger.instance.w('iap', 'purchase error', p.error);
            once.complete(ElunaPurchaseResult.failed);
        }
      }
    }, onError: (Object e) {
      AppLogger.instance.w('iap', 'purchaseStream error', e);
      once.complete(ElunaPurchaseResult.failed);
    });

    try {
      // Именно расходуемая покупка: чаевые дают сколько угодно раз, а
      // неразходуемую магазин отказался бы продать второй раз.
      final launched = await _iap.buyConsumable(
        purchaseParam: PurchaseParam(productDetails: product),
      );
      // На Android отказ запустить поток возвращает false без исключения и без
      // события — больше это ожидание не разрешит ничто.
      if (!launched) once.complete(ElunaPurchaseResult.failed);
    } catch (e) {
      AppLogger.instance.w('iap', 'buyConsumable threw', e);
      once.complete(ElunaPurchaseResult.failed);
    }

    final result = await once.future;
    await sub.cancel();
    return result;
  }
}

/// Ожидание, которое переживает повторную доставку события — а она бывает,
/// когда покупка сначала уходит в pending и потом завершается.
class _Once {
  final _c = Completer<ElunaPurchaseResult>();
  Future<ElunaPurchaseResult> get future => _c.future;
  void complete(ElunaPurchaseResult r) {
    if (!_c.isCompleted) _c.complete(r);
  }
}
