import 'dart:math';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_plus/share_plus.dart';

import '../domain/achievements.dart';
import '../l10n/app_localizations.dart';
import '../services/haptics.dart';
import '../state/app_lock_controller.dart';
import 'achievement_texts.dart';

/// Полноэкранное празднование только что взятой награды: залп конфетти,
/// вылетающая медаль и один толчок вибрации.
///
/// Пришло на место снекбара. Снекбар был честен по механике и пуст по смыслу:
/// он сообщал ровно тем же способом, что и «файл сохранён», — а медаль в этой
/// категории ровно одна на несколько дней работы.
Future<void> showAchievementCelebration(
  BuildContext context,
  AchievementState<ConversionStats> state, {
  required Haptics haptics,
  required AppLockGate lock,
}) async {
  haptics.achievementUnlocked();
  await showDialog<void>(
    context: context,
    barrierColor: Colors.black87,
    builder: (_) => _CelebrationDialog(state: state, lock: lock),
  );
}

class _CelebrationDialog extends StatefulWidget {
  const _CelebrationDialog({required this.state, required this.lock});

  final AchievementState<ConversionStats> state;

  /// Лист «Поделиться» — чужая Activity; без предупреждения замок встретил бы
  /// человека кодом сразу после того, как он похвастался медалью.
  final AppLockGate lock;

  @override
  State<_CelebrationDialog> createState() => _CelebrationDialogState();
}

class _CelebrationDialogState extends State<_CelebrationDialog>
    with TickerProviderStateMixin {
  late final AnimationController _confetti = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..forward();
  late final AnimationController _pop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  )..forward();
  late final List<_Particle> _particles = _makeParticles(widget.state.def.id);

  @override
  void dispose() {
    _confetti.dispose();
    _pop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final shared = ElunaL10n.of(context);
    final theme = Theme.of(context);
    final def = widget.state.def;
    final color = rarityColor(def.rarity);
    final (title, body) = achievementTexts(l10n, def);
    final pop = CurvedAnimation(parent: _pop, curve: Curves.elasticOut);

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _confetti,
              builder: (_, _) => CustomPaint(
                painter: _ConfettiPainter(_particles, _confetti.value),
              ),
            ),
          ),
          // Прокручивается, когда окно ниже стопки «медаль + текст» (телефон в
          // ландшафте), вместо того чтобы переполнять само празднование.
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: pop,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Мягкое гало под шестиугольником.
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.5),
                              blurRadius: 40,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      HexMedal(
                        icon: def.icon,
                        rarity: def.rarity,
                        unlocked: true,
                        size: 130,
                        animate: true,
                        trackColor: theme.colorScheme.surfaceContainerHighest,
                        mutedColor: theme.colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  shared.achievementUnlockedToast,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  rarityLabel(def.rarity, shared).toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 22),
                Builder(builder: (context) {
                  return FilledButton.tonalIcon(
                    onPressed: () {
                      // iPad показывает лист поделиться поповером и падает без
                      // исходного прямоугольника — привязываем к самой кнопке.
                      final box = context.findRenderObject() as RenderBox?;
                      awayInSystemUi(
                        widget.lock,
                        () => SharePlus.instance.share(ShareParams(
                          text: shared.achievementShareText(
                              title, Eluna.config.appName),
                          sharePositionOrigin: box == null
                              ? null
                              : box.localToGlobal(Offset.zero) & box.size,
                        )),
                      );
                    },
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedShare08),
                    label: Text(shared.achievementShare),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Particle {
  const _Particle(this.angle, this.speed, this.size, this.color);

  final double angle;
  final double speed;
  final double size;
  final Color color;
}

/// Конфетти детерминированы по id награды: одно и то же достижение празднуется
/// одинаково, и тест не зависит от случайного числа.
List<_Particle> _makeParticles(String seed) {
  final rnd = Random(seed.hashCode);
  const colors = [
    Color(0xFF7C3AED),
    Color(0xFFA855F7),
    Color(0xFF22C55E),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFF42A5F5),
  ];
  return List.generate(80, (_) {
    final angle = rnd.nextDouble() * 2 * pi;
    final speed = 0.5 + rnd.nextDouble();
    final size = 5 + rnd.nextDouble() * 7;
    return _Particle(angle, speed, size, colors[rnd.nextInt(colors.length)]);
  });
}

class _ConfettiPainter extends CustomPainter {
  const _ConfettiPainter(this.particles, this.t);

  final List<_Particle> particles;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final centre = Offset(size.width / 2, size.height * 0.42);
    final reach = size.height * 0.6;
    final paint = Paint();
    for (final p in particles) {
      final dx = cos(p.angle) * p.speed * reach * t;
      // Второе слагаемое — тяжесть: без него залп разлетается ровным кругом и
      // выглядит взрывом, а не конфетти.
      final dy = sin(p.angle) * p.speed * reach * t + 0.7 * reach * t * t;
      final pos = centre + Offset(dx, dy);
      paint.color = p.color.withValues(alpha: (1 - t).clamp(0.0, 1.0));
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(p.angle + t * 6);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset.zero, width: p.size, height: p.size * 0.6),
          const Radius.circular(2),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.t != t;
}
