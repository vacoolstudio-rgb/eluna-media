import 'dart:io';

import 'package:flutter/material.dart';

import '../core/output_paths.dart';
import '../l10n/app_localizations.dart';
import 'theme.dart';

/// The result, and the original underneath it.
///
/// Every "enhance" in this category promises more than a filter can deliver,
/// and this app deliberately refuses to make that promise — which leaves it
/// with the opposite problem: honest processing the user cannot see. A JPEG
/// written into the app's own folder is invisible until it is opened in some
/// other app, by which time nobody is comparing anything.
///
/// Press and hold swaps to the source. One gesture, no slider handle to fight
/// with on a phone, and the two frames are pixel-aligned so the difference is
/// the only thing that moves.
class CompareScreen extends StatefulWidget {
  const CompareScreen({
    super.key,
    required this.title,
    required this.beforePath,
    required this.afterPath,
    required this.beforeBytes,
    required this.afterBytes,
  });

  final String title;
  final String beforePath;
  final String afterPath;
  final int beforeBytes;
  final int afterBytes;

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  bool _showingBefore = false;

  void _setShowing(bool before) {
    if (_showingBefore == before) return;
    setState(() => _showingBefore = before);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final theme = Theme.of(context);
    final path = _showingBefore ? widget.beforePath : widget.afterPath;
    final bytes = _showingBefore ? widget.beforeBytes : widget.afterBytes;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.title, overflow: TextOverflow.ellipsis),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              // Both the long press and a plain touch-and-hold reach this: the
              // gesture people try first is simply holding a finger down.
              onLongPressStart: (_) => _setShowing(true),
              onLongPressEnd: (_) => _setShowing(false),
              onLongPressCancel: () => _setShowing(false),
              onTapDown: (_) => _setShowing(true),
              onTapUp: (_) => _setShowing(false),
              onTapCancel: () => _setShowing(false),
              child: InteractiveViewer(
                maxScale: 6,
                child: Center(
                  child: Image.file(
                    File(path),
                    fit: BoxFit.contain,
                    // Without this the widget blanks for a frame on every
                    // swap, which reads as a flicker rather than a comparison.
                    gaplessPlayback: true,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.broken_image_outlined,
                      size: 64,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: (_showingBefore ? Colors.white24 : AppTheme.success)
                              .withValues(alpha: _showingBefore ? 0.25 : 0.22),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _showingBefore ? l10n.compareBefore : l10n.compareAfter,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        OutputPaths.humanBytes(bytes),
                        style: theme.textTheme.labelMedium?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.compareHint,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.white60),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
