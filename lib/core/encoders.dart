import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/media_format.dart';

/// Discovers which video encoders the bundled FFmpeg actually has, by asking
/// it once (`ffmpeg -encoders`) and caching the answer.
///
/// Runtime discovery instead of a compile-time assumption. Which encoders
/// exist depends on how the bundled FFmpeg was configured, and that
/// configuration is not ours: it is decided by whichever `ffmpeg-kit` variant
/// the plugin resolves, and it has changed under us before. Advertising an
/// encoder that is not there fails every job it touches, so nothing is offered
/// until the binary has confirmed it.
///
/// This covers the hardware encoders and the software AV1 one. AV1 belongs
/// here for a specific reason: the app spent its first year believing the build
/// had no AV1 encoder at all — only the `dav1d` decoder — and shipped a
/// requirements document saying so. `libaom` was in the binary the whole time.
/// A probe cannot make that mistake twice.
class EncoderCatalog {
  Future<Set<String>>? _probe;

  static const _candidates = [
    'h264_mediacodec',
    'hevc_mediacodec',
    'av1_mediacodec',
    // VP9 has had a MediaCodec encoder for years, and a phone that exposes one
    // encodes WebM at a fraction of the battery libvpx spends. Nothing else is
    // needed for it: the probe decides whether it exists, and the argument
    // builder already refuses hardware on constant-quality jobs.
    'vp9_mediacodec',
    'h264_videotoolbox',
    'hevc_videotoolbox',
    // Apple ships no AV1 encoding block today — recent silicon decodes AV1 but
    // does not encode it, and VideoToolbox exposes no such encoder. Asking
    // anyway costs one substring check against output we already fetched, and
    // it means the day Apple adds one, iOS picks it up without a code change
    // instead of quietly staying on libaom forever.
    'av1_videotoolbox',
    'libaom-av1',
    'libwebp_anim',
  ];

  Future<Set<String>> _available() {
    return _probe ??= () async {
      try {
        final session = await FFmpegKit.executeWithArguments(['-hide_banner', '-encoders']);
        final output = await session.getOutput() ?? '';
        return _candidates.where(output.contains).toSet();
      } catch (_) {
        return const <String>{}; // No FFmpeg on this host — nothing to offer.
      }
    }();
  }

  /// Whether `-encoders` lists [name]. A decoder of the same name does not
  /// count, which is exactly the distinction that matters for `av1_mediacodec`:
  /// FFmpeg has shipped an AV1 MediaCodec *decoder* far longer than it has
  /// shipped the encoder.
  ///
  /// What this does **not** establish is that the phone can encode. A
  /// `*_mediacodec` entry is a wrapper the FFmpeg build carries unconditionally;
  /// whether silicon sits behind it is only discovered when MediaCodec is asked
  /// for one. The WP30 Pro advertises `vp9_mediacodec` and answers
  /// NAME_NOT_FOUND. So a hit here means "worth trying", not "will work" — the
  /// guarantee that the user still gets a file comes from the queue's retry on
  /// the software encoder, not from this probe.
  Future<bool> has(String name) async => (await _available()).contains(name);

  /// The hardware encoder for [codec], or null when the build has none.
  Future<String?> hardwareEncoderFor(VideoCodec codec) async {
    final wanted = switch (codec) {
      VideoCodec.h264 => const ['h264_mediacodec', 'h264_videotoolbox'],
      VideoCodec.h265 => const ['hevc_mediacodec', 'hevc_videotoolbox'],
      // The VideoToolbox entry is speculative — see [_candidates]. Today it
      // never matches and iOS falls through to libaom.
      VideoCodec.av1 => const ['av1_mediacodec', 'av1_videotoolbox'],
      // Android only: VideoToolbox has never encoded VP9, and Apple is not
      // going to start.
      VideoCodec.vp9 => const ['vp9_mediacodec'],
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

final encoderCatalogProvider = Provider<EncoderCatalog>((ref) => EncoderCatalog());

/// Whether AV1 can be offered as an output codec at all.
///
/// Reads false until the probe has answered, so a slow or failed probe hides
/// the option rather than offering a job that cannot run. The hardware AV1
/// encoder is not consulted here: it is an accelerator for a codec the software
/// encoder already provides, not a substitute for it.
final av1AvailableProvider = FutureProvider<bool>(
  (ref) => ref.read(encoderCatalogProvider).has(VideoCodec.av1.encoder!),
);

/// Whether `libwebp_anim` — the animated-WebP encoder, distinct from the still
/// `libwebp` one — is present.
final animatedWebpAvailableProvider = FutureProvider<bool>(
  (ref) => ref.read(encoderCatalogProvider).has('libwebp_anim'),
);

/// Output containers this build cannot actually write, so the pickers can drop
/// them. Both entries hang off an encoder rather than a muxer: the muxers are
/// unconditional, the encoders are what the variant decides.
///
/// AVIF rides on the AV1 answer because it is AV1 — one still frame of it.
final unavailableContainersProvider = Provider<Set<ContainerFormat>>((ref) {
  final av1 = ref.watch(av1AvailableProvider).value ?? false;
  final animatedWebp = ref.watch(animatedWebpAvailableProvider).value ?? false;
  return {
    if (!av1) ContainerFormat.avif,
    if (!animatedWebp) ContainerFormat.webpAnimated,
  };
});
