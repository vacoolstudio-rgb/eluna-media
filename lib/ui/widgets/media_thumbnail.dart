import 'dart:io';

import 'package:eluna_shared/eluna_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/thumbnails.dart';

/// A file's own first frame, in the same rounded square the type icon used to
/// occupy.
///
/// Falls back to that icon whenever there is nothing to show — audio, a source
/// FFmpeg could not decode, a frame still being extracted. The fallback is the
/// point: a list that waits for thumbnails before rendering is a list that
/// stutters, so the icon draws immediately and the picture replaces it when it
/// arrives.
class MediaThumbnail extends ConsumerWidget {
  const MediaThumbnail({
    super.key,
    required this.path,
    required this.bytes,
    required this.icon,
    required this.accent,
    this.size = 46,
  });

  final String path;
  final int bytes;

  /// Иконка из hugeicons, а не Material: запасной квадрат рисует общий
  /// SectionIcon, а он принимает только HugeIconData.
  final HugeIconData icon;
  final Color accent;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fallback = SectionIcon(icon: icon, accent: accent, size: size);
    final thumb = ref.watch(thumbnailProvider((path: path, bytes: bytes))).value;
    if (thumb == null) return fallback;

    final pixels = (size * MediaQuery.devicePixelRatioOf(context)).round();

    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.33),
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Image.file(
        File(thumb),
        fit: BoxFit.cover,
        // Decode at display size; a 96 px JPEG decoded for a 46 px box is
        // still four times the pixels the screen will use.
        cacheWidth: pixels,
        cacheHeight: pixels,
        gaplessPlayback: true,
        errorBuilder: (_, __, ___) => fallback,
      ),
    );
  }
}
