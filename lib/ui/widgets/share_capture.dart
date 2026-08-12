import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Opaque backdrop for anything that gets captured to a shareable PNG.
///
/// Rounded cards leave transparent corners, and `toImage` keeps that alpha: the
/// exported PNG then picks up whatever the messenger paints behind it, which on
/// a dark chat background haloes the card. Painting the theme's surface under it
/// makes the export self-contained. The padding keeps the card's own rounding
/// and shadow inside the frame instead of flush against the edge.
class ShareBackdrop extends StatelessWidget {
  const ShareBackdrop({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    // `surface` is fully opaque in both Eluna themes; the ambient canvas that
    // the app paints behind its screens is not, and capturing that would export
    // a card with the wallpaper showing through it.
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(padding: padding, child: child),
    );
  }
}

/// Renders the [RepaintBoundary] behind [boundaryKey] to a PNG and shares it,
/// falling back to plain [message] text when the capture or the platform's
/// image sharing is unavailable (some Android OEMs, headless tests).
///
/// The caller owns the boundary. [fileName] should be stable per artefact, so
/// the temp directory collects one file per thing shared rather than one per
/// tap.
Future<void> shareBoundaryAsImage({
  required GlobalKey boundaryKey,
  required String message,
  required Rect? origin,
  required String fileName,
}) async {
  try {
    // Let the ring's animation settle into a painted frame before capturing —
    // otherwise the exported image shows a half-swept dial.
    await WidgetsBinding.instance.endOfFrame;
    final boundary =
        boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) throw StateError('no boundary');

    final image = await boundary.toImage(pixelRatio: 3);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    if (bytes == null) throw StateError('no bytes');

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$fileName.png');
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    await SharePlus.instance.share(ShareParams(
      files: [XFile(file.path)],
      text: message,
      sharePositionOrigin: origin,
    ));
  } catch (_) {
    // The text alone still says the thing. A failed screenshot must not turn
    // "share" into "nothing happened".
    await SharePlus.instance.share(
      ShareParams(text: message, sharePositionOrigin: origin),
    );
  }
}

/// Source rect for the iOS/iPad share popover: `share_plus` throws on iPad
/// without one. Derived from the widget that was tapped, with a screen-centre
/// fallback for the cases where it has no box yet.
Rect shareOrigin(BuildContext context) {
  final box = context.findRenderObject() as RenderBox?;
  if (box != null && box.hasSize) {
    return box.localToGlobal(Offset.zero) & box.size;
  }
  final size = MediaQuery.sizeOf(context);
  return Rect.fromCenter(
    center: Offset(size.width / 2, size.height / 2),
    width: 1,
    height: 1,
  );
}
