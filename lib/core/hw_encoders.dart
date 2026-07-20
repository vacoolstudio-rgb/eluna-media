import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/media_format.dart';

/// Discovers which hardware video encoders the bundled FFmpeg actually has,
/// by asking it once (`ffmpeg -encoders`) and caching the answer.
///
/// Runtime discovery instead of a compile-time assumption: whether
/// `h264_mediacodec` / `h264_videotoolbox` exist depends on how the bundled
/// FFmpeg was configured, and shipping a toggle for an encoder that is not
/// there would fail every job it touches.
class HwEncoderCatalog {
  Future<Set<String>>? _probe;

  static const _candidates = [
    'h264_mediacodec',
    'hevc_mediacodec',
    'h264_videotoolbox',
    'hevc_videotoolbox',
  ];

  Future<Set<String>> _available() {
    return _probe ??= () async {
      try {
        final session = await FFmpegKit.executeWithArguments(['-hide_banner', '-encoders']);
        final output = await session.getOutput() ?? '';
        return _candidates.where(output.contains).toSet();
      } catch (_) {
        return const <String>{}; // No FFmpeg on this host — software only.
      }
    }();
  }

  /// The hardware encoder for [codec], or null when the build has none.
  Future<String?> encoderFor(VideoCodec codec) async {
    final wanted = switch (codec) {
      VideoCodec.h264 => const ['h264_mediacodec', 'h264_videotoolbox'],
      VideoCodec.h265 => const ['hevc_mediacodec', 'hevc_videotoolbox'],
      _ => const <String>[],
    };
    if (wanted.isEmpty) return null;
    final have = await _available();
    for (final name in wanted) {
      if (have.contains(name)) return name;
    }
    return null;
  }
}

final hwEncoderCatalogProvider = Provider<HwEncoderCatalog>((ref) => HwEncoderCatalog());
