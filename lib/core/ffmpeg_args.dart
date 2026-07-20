import '../domain/conversion_settings.dart';
import '../domain/media_format.dart';
import 'rate_calc.dart';

/// Translates [ConversionSettings] into an FFmpeg argument vector.
///
/// The result is a `List<String>` rather than a command line: it is passed to
/// `FFmpegKit.executeWithArgumentsAsync`, which hands the tokens to FFmpeg
/// directly. No shell is involved, so paths containing spaces, quotes or
/// non-ASCII characters need no escaping and cannot be split apart.
abstract final class FFmpegArgs {
  /// Formats a millisecond offset as the `HH:MM:SS.mmm` FFmpeg expects.
  static String formatTimestamp(int milliseconds) {
    final ms = milliseconds.remainder(1000);
    final totalSeconds = milliseconds ~/ 1000;
    final s = totalSeconds.remainder(60);
    final m = (totalSeconds ~/ 60).remainder(60);
    final h = totalSeconds ~/ 3600;
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(h)}:${two(m)}:${two(s)}.${ms.toString().padLeft(3, '0')}';
  }

  /// Maps a 1..100 quality slider onto FFmpeg's inverted `-q:v` scale (2 = best,
  /// 31 = worst) used by the MJPEG/JPEG encoder.
  static int jpegQscale(int quality) {
    final clamped = quality.clamp(1, 100);
    return (31 - ((clamped - 1) * 29 / 99)).round().clamp(2, 31);
  }

  /// Splits a speed factor into `atempo` stages, each inside the filter's
  /// 0.5–2.0 legal range: 0.25 → [0.5, 0.5], 4.0 → [2.0, 2.0].
  static List<double> atempoChain(double factor) {
    final chain = <double>[];
    var f = factor;
    while (f < 0.5) {
      chain.add(0.5);
      f /= 0.5;
    }
    while (f > 2.0) {
      chain.add(2.0);
      f /= 2.0;
    }
    chain.add(f);
    return chain;
  }

  /// Centre crop to `ratioW:ratioH`. Commas inside min() are escaped so the
  /// filtergraph parser does not read them as filter separators, and both
  /// dimensions are forced even — a 9:16 crop of 1080p is 607.5px wide, crop
  /// truncates to an odd 607, and every yuv420p encoder rejects odd sizes
  /// when no scale filter follows to repair them.
  static String cropFilter(int ratioW, int ratioH) =>
      'crop=w=2*floor(min(iw\\,ih*$ratioW/$ratioH)/2)'
      ':h=2*floor(min(ih\\,iw*$ratioH/$ratioW)/2)';

  /// Concatenates 2+ videos into one. Always a full re-encode: sources from a
  /// phone gallery rarely share codec, resolution, frame rate and sample rate,
  /// and the concat *filter* (unlike the demuxer) tolerates that — each input
  /// is normalised onto a common canvas first, letterboxing where the aspect
  /// ratios differ.
  ///
  /// [inputsHaveAudio]/[inputDurationsMs] describe each input in order (probe
  /// results; null = unknown). Screen recordings and muted clips routinely
  /// have no audio stream, and a hard `[i:a]` reference to one fails the
  /// whole filtergraph — silent clips get synthesised silence of the right
  /// length instead. When a silent clip's length is unknown, the merge drops
  /// audio entirely rather than gambling on desync.
  static List<String> buildConcat({
    required List<String> inputPaths,
    required String outputPath,
    required ConversionSettings settings,
    List<bool?> inputsHaveAudio = const [],
    List<int?> inputDurationsMs = const [],
  }) {
    assert(inputPaths.length >= 2, 'concat needs at least two inputs');

    // Only H.264/H.265 are meaningful merge targets here (the preset always
    // sends H.264); anything else — VP9 needs `-b:v 0` with CRF, mpeg4
    // ignores CRF outright, copy cannot re-encode — falls back to H.264.
    final vcodec = (settings.videoCodec == VideoCodec.h264 ||
            settings.videoCodec == VideoCodec.h265)
        ? settings.videoCodec
        : VideoCodec.h264;
    final acodec = settings.audioCodec.supportsBitrate ? settings.audioCodec : AudioCodec.aac;

    bool? audioOf(int i) => i < inputsHaveAudio.length ? inputsHaveAudio[i] : null;
    int? durationOf(int i) => i < inputDurationsMs.length ? inputDurationsMs[i] : null;

    // Audio survives the merge unless an input is *known* silent and its
    // length is unknown — silence of an unknowable duration cannot be
    // synthesised. An unprobed input is optimistically assumed to have audio,
    // which is exactly the pre-probe behaviour.
    var withAudio = true;
    for (var i = 0; i < inputPaths.length; i++) {
      if (audioOf(i) == false && durationOf(i) == null) {
        withAudio = false;
        break;
      }
    }

    final args = <String>['-hide_banner', '-nostdin', '-y'];
    for (final path in inputPaths) {
      args.addAll(['-i', path]);
    }

    final height = settings.resolution.height ?? 720;
    // Every input lands on one 16:9 canvas; decrease+pad letterboxes instead
    // of stretching. Width forced even for yuv420p.
    final width = (height * 16 / 9).round() & ~1;
    final fps = settings.fps.value ?? 30;

    final chains = StringBuffer();
    final labels = StringBuffer();
    for (var i = 0; i < inputPaths.length; i++) {
      chains.write(
        '[$i:v]scale=$width:$height:force_original_aspect_ratio=decrease,'
        'pad=$width:$height:(ow-iw)/2:(oh-ih)/2,setsar=1,fps=$fps[v$i];',
      );
      if (withAudio) {
        if (audioOf(i) != false) {
          // A shared sample rate and layout is a concat precondition, exactly
          // like the shared canvas is for video.
          chains.write(
            '[$i:a]aformat=sample_rates=48000:channel_layouts=stereo[a$i];',
          );
        } else {
          final seconds = (durationOf(i)! / 1000).toStringAsFixed(3);
          chains.write(
            'anullsrc=r=48000:cl=stereo,atrim=duration=$seconds[a$i];',
          );
        }
        labels.write('[v$i][a$i]');
      } else {
        labels.write('[v$i]');
      }
    }
    chains.write(
      '${labels}concat=n=${inputPaths.length}:v=1:a=${withAudio ? 1 : 0}'
      '[v]${withAudio ? '[a]' : ''}',
    );

    args.addAll([
      '-filter_complex', chains.toString(),
      '-map', '[v]',
      if (withAudio) ...['-map', '[a]'],
      '-c:v', vcodec.encoder!,
      '-pix_fmt', 'yuv420p',
      '-crf', settings.crf.clamp(0, vcodec.maxCrf).toString(),
      '-preset', settings.preset.flag,
    ]);
    if (withAudio) {
      args.addAll(['-c:a', acodec.encoder!, '-b:a', '${settings.audioBitrateKbps}k']);
    } else {
      args.add('-an');
    }
    if (settings.stripMetadata) {
      args.addAll(['-map_metadata', '-1']);
    }
    if (settings.container == ContainerFormat.mp4 || settings.container == ContainerFormat.mov) {
      args.addAll(['-movflags', '+faststart']);
    }
    args.add(outputPath);
    return args;
  }

  /// The bitrate a size-mode encode of [settings] would use, or null when it
  /// would fall back to CRF. Public so the queue can decide whether a
  /// two-pass run is even meaningful before spending a whole analysis pass.
  static int? targetKbps(ConversionSettings settings, int? sourceDurationMs) =>
      _targetKbps(settings, sourceDurationMs);

  /// [sourceDurationMs] feeds the target-size bitrate maths; passing null is
  /// always safe and merely makes [RateControl.size] fall back to CRF.
  ///
  /// [hwVideoEncoder] names a hardware encoder (h264_mediacodec,
  /// h264_videotoolbox, ...) to prefer. It is honoured only on the bitrate
  /// path: hardware encoders take a bitrate, not a CRF, so constant-quality
  /// jobs stay on the software encoder no matter what the caller asks.
  ///
  /// [passNumber]/[passLogFile] drive x264/x265 two-pass encoding: pass 1
  /// analyses into the log (video only, null muxer — give it a null-device
  /// output path), pass 2 reads the log and writes the real file.
  /// [sourceVideoKbps]/[sourceAudioKbps] hold a constant-quality encode to
  /// what the source itself spent, so it can never come out *bigger* than the
  /// file it compressed — CRF has no upper bound, and an already-efficient
  /// source (anything that has been through a messenger) otherwise inflates.
  /// Ignored when the rates are unknown or the user turned the cap off.
  static List<String> build({
    required String inputPath,
    required String outputPath,
    required ConversionSettings settings,
    int? sourceDurationMs,
    int? sourceVideoKbps,
    int? sourceAudioKbps,
    String? hwVideoEncoder,
    int? passNumber,
    String? passLogFile,
  }) {
    final args = <String>['-hide_banner', '-nostdin', '-y'];

    // Fast seek: placing -ss ahead of -i lets FFmpeg skip to the nearest
    // keyframe before decoding, then decode-accurately to the exact offset.
    final trim = settings.trim;
    if (trim != null && trim.isValid) {
      args.addAll(['-ss', formatTimestamp(trim.startMs)]);
    }

    args.addAll(['-i', inputPath]);

    if (trim != null && trim.isValid) {
      args.addAll(['-t', formatTimestamp(trim.durationMs)]);
    }

    switch (settings.container.kind) {
      case MediaKind.image:
        _appendImageArgs(args, settings);
      case MediaKind.audio:
        _appendAudioOnlyArgs(args, settings, sourceAudioKbps);
      case MediaKind.video:
        _appendVideoArgs(args, settings, sourceDurationMs, hwVideoEncoder,
            analysisPass: passNumber == 1,
            sourceVideoKbps: sourceVideoKbps,
            sourceAudioKbps: sourceAudioKbps);
    }

    if (passNumber != null && passLogFile != null) {
      args.addAll(['-pass', '$passNumber', '-passlogfile', passLogFile]);
    }

    if (settings.stripMetadata) {
      args.addAll(['-map_metadata', '-1']);
    }

    // The analysis pass produces statistics, not a file; the null muxer makes
    // that explicit no matter what output path the platform hands us.
    if (passNumber == 1) {
      args.addAll(['-f', 'null']);
    }

    args.add(outputPath);
    return args;
  }

  // ---------------------------------------------------------------------------
  // Images
  // ---------------------------------------------------------------------------

  /// The `-vf` chain for a still image: enhancement plus any resize.
  ///
  /// Order is not cosmetic, and getting it wrong is how "enhance" produces a
  /// worse picture than it was given:
  ///
  ///  1. **denoise** first — sharpening grain makes the grain permanent, and
  ///     no later filter can tell noise from detail once it has been enhanced.
  ///  2. **auto colour** on the cleaned pixels, so the levels stretch reads the
  ///     real black and white points rather than a noise spike.
  ///  3. **scale**, because resampling averages neighbouring pixels and softens
  ///     whatever sharpness the image had.
  ///  4. **sharpen** last, on the pixels that will actually be written — this
  ///     is the standard "sharpen for output size" rule, and sharpening before
  ///     a downscale just throws the added acutance away.
  ///
  /// Public so the tests can assert the chain without running FFmpeg.
  static List<String> imageFilters(ConversionSettings s) {
    final filters = <String>[];

    // hqdn3d takes luma_spatial:chroma_spatial (the two temporal parameters
    // that follow do nothing on a single frame). Chroma is denoised slightly
    // less than luma: colour noise is blotchier and over-smoothing it greys
    // out skin tones.
    switch (s.denoise) {
      case EnhanceLevel.none:
        break;
      case EnhanceLevel.light:
        filters.add('hqdn3d=2:1.5');
      case EnhanceLevel.medium:
        filters.add('hqdn3d=4:3');
      case EnhanceLevel.strong:
        filters.add('hqdn3d=8:6');
    }

    if (s.autoColor) {
      // independence=0 stretches all three channels by the same amount, so the
      // picture gains contrast without the colour cast that per-channel
      // normalisation gives a photo shot under warm indoor light. strength is
      // held below 1 so an already well-exposed shot is nudged, not rebuilt.
      filters.add('normalize=smoothing=0:independence=0:strength=0.75');
      filters.add('eq=saturation=1.08:contrast=1.03');
    }

    // Both branches are the same `scale` filter and occupy the same slot in the
    // chain, so they cannot both run: a downscale request wins, because the
    // user picked an explicit target and "shrink to 720p, then double it back"
    // answers no question anyone asked. The UI disables the toggle in that
    // state, but a stored settings object can still carry both.
    final height = s.resolution.height;
    if (height != null) {
      filters.add('scale=-1:$height:flags=lanczos');
    } else if (s.upscale2x) {
      // Lanczos rings slightly on hard edges, which is exactly what makes an
      // upscale read as sharp rather than as a blur — the alternative kernels
      // give a softer, more obviously interpolated result.
      filters.add('scale=iw*2:ih*2:flags=lanczos');
    }

    // Option names are spelled out rather than using unsharp's `lx`/`la`
    // aliases: the aliases are undocumented in the filter's own help text, and
    // a misspelled option here is not a bad picture, it is a failed job.
    //
    // chroma_amount is pinned to 0 (its default, written out deliberately):
    // sharpening chroma is what produces the coloured fringes that give phone
    // "AI enhance" its plastic look.
    String unsharp(int size, double amount) => 'unsharp='
        'luma_msize_x=$size:luma_msize_y=$size:'
        'luma_amount=$amount:chroma_amount=0';

    switch (s.sharpen) {
      case EnhanceLevel.none:
        break;
      case EnhanceLevel.light:
        filters.add(unsharp(5, 0.6));
      case EnhanceLevel.medium:
        filters.add(unsharp(5, 1.0));
      case EnhanceLevel.strong:
        // 7×7 reaches further, so the halo it can leave is wider — this is the
        // level that visibly "over-sharpens", and the UI warns about it.
        filters.add(unsharp(7, 1.5));
    }

    return filters;
  }

  static void _appendImageArgs(List<String> args, ConversionSettings s) {
    if (s.container == ContainerFormat.gif) {
      _appendGifArgs(args, s);
      return;
    }

    final filters = imageFilters(s);
    if (filters.isNotEmpty) args.addAll(['-vf', filters.join(',')]);

    // A still image is one frame; -update tells the image muxer that
    // overwriting a single file is intentional.
    args.addAll(['-frames:v', '1', '-update', '1']);

    switch (s.container) {
      case ContainerFormat.jpg:
        args.addAll(['-q:v', jpegQscale(s.imageQuality).toString()]);
      case ContainerFormat.png:
        // PNG is always lossless; the knob is compression effort, not quality.
        args.addAll(['-compression_level', '6']);
      case ContainerFormat.webp:
        args.addAll(['-c:v', 'libwebp']);
        if (s.lossless) {
          args.addAll(['-lossless', '1', '-compression_level', '6']);
        } else {
          args.addAll(['-quality', s.imageQuality.clamp(1, 100).toString()]);
        }
      case ContainerFormat.tiff:
        args.addAll(['-compression_algo', 'lzw']);
      case ContainerFormat.bmp:
        break;
      default:
        break;
    }
  }

  /// GIF gets the standard two-pass palette pipeline: a naive `-f gif` encode
  /// quantises to a fixed 216-colour web palette and looks awful.
  static void _appendGifArgs(List<String> args, ConversionSettings s) {
    final chain = <String>[];
    final fps = s.fps.value ?? 15;
    chain.add('fps=$fps');
    final height = s.resolution.height;
    if (height != null) chain.add('scale=-1:$height:flags=lanczos');

    final prefix = chain.isEmpty ? '[0:v]' : '[0:v]${chain.join(',')},';
    args.addAll([
      '-filter_complex',
      '${prefix}split[a][b];[a]palettegen=max_colors=256[p];[b][p]paletteuse=dither=bayer',
      '-loop',
      '0',
      '-an',
    ]);
  }

  // ---------------------------------------------------------------------------
  // Audio-only containers
  // ---------------------------------------------------------------------------

  static void _appendAudioOnlyArgs(
    List<String> args,
    ConversionSettings s,
    int? sourceAudioKbps,
  ) {
    // Discard video, including any embedded cover art, which several audio
    // muxers refuse to accept.
    args.add('-vn');
    // Extracting a 96 kbps track at the 192 kbps default would make the MP3
    // bigger than the audio it came from, for no possible gain in quality.
    _appendAudioCodec(args, s, sourceAudioKbps);
  }

  // ---------------------------------------------------------------------------
  // Video containers
  // ---------------------------------------------------------------------------

  static void _appendVideoArgs(
    List<String> args,
    ConversionSettings s,
    int? sourceDurationMs,
    String? hwVideoEncoder, {
    bool analysisPass = false,
    int? sourceVideoKbps,
    int? sourceAudioKbps,
  }) {
    final codec = s.videoCodec;

    // Stream mapping comes before codec choices. Without explicit maps FFmpeg
    // keeps one "best" video and audio stream and silently drops subtitles —
    // the single most complained-about data loss in MKV→MP4 conversions.
    // An analysis pass looks at nothing but the video stream.
    final subtitles = analysisPass ? null : _subtitleCodecFor(s);
    if (subtitles != null) {
      args.addAll(['-map', '0:v:0']);
      if (s.audioCodec != AudioCodec.none) args.addAll(['-map', '0:a:0?']);
      args.addAll(['-map', '0:s?']);
    }

    if (codec == VideoCodec.none) {
      args.add('-vn');
    } else if (codec == VideoCodec.copy) {
      args.addAll(['-c:v', 'copy']);
    } else {
      final filters = <String>[];
      // Orientation first, so the crop ratio and the scale target apply to
      // the frame the viewer will actually see.
      switch (s.rotate) {
        case RotatePreset.none:
          break;
        case RotatePreset.cw90:
          filters.add('transpose=1');
        case RotatePreset.ccw90:
          filters.add('transpose=2');
        case RotatePreset.r180:
          filters.addAll(['hflip', 'vflip']);
      }
      if (s.flipH) filters.add('hflip');
      if (s.crop.isChanged) {
        filters.add(cropFilter(s.crop.ratioW!, s.crop.ratioH!));
      }
      final height = s.resolution.height;
      // -2 keeps the aspect ratio while forcing an even width, which every
      // yuv420p encoder requires.
      if (height != null) filters.add('scale=-2:$height');
      if (speedActive(s)) {
        // PTS division speeds playback up; the fps filter after it re-times
        // the stream so players see a constant frame rate.
        filters.add('setpts=PTS/${s.speed.factor}');
      }
      final fps = s.fps.value;
      if (fps != null) filters.add('fps=$fps');
      if (filters.isNotEmpty) args.addAll(['-vf', filters.join(',')]);

      // Which rate-control branch this job lands on decides the encoder:
      // hardware encoders take a bitrate, not a CRF, so only the bitrate
      // branches may use one.
      final targetKbps =
          s.rateControl == RateControl.size ? _targetKbps(s, sourceDurationMs) : null;
      final usesBitrate = targetKbps != null ||
          s.rateControl == RateControl.bitrate ||
          !codec.supportsCrf;
      final hwCapable = codec == VideoCodec.h264 || codec == VideoCodec.h265;
      final hw = usesBitrate && hwCapable ? hwVideoEncoder : null;

      args.addAll(['-c:v', hw ?? codec.encoder!]);
      if (hw == null) {
        // Hardware encoders negotiate their own surface formats; forcing
        // yuv420p there just inserts a pointless conversion.
        args.addAll(['-pix_fmt', 'yuv420p']);
      }

      if (targetKbps != null) {
        // maxrate/bufsize keep ABR overshoot inside the budget — the whole
        // point of the size mode is landing *under* a hard limit.
        args.addAll([
          '-b:v', '${targetKbps}k',
          '-maxrate', '${(targetKbps * 1.1).round()}k',
          '-bufsize', '${targetKbps * 2}k',
        ]);
      } else if (!usesBitrate) {
        args.addAll(['-crf', s.crf.clamp(0, codec.maxCrf).toString()]);
        // VP9 only honours -crf when the target bitrate is pinned to zero.
        if (codec == VideoCodec.vp9) args.addAll(['-b:v', '0']);

        // CRF has no ceiling, so a source that is already efficiently encoded
        // comes out *larger* — "compress" that inflates the file is the worst
        // possible outcome. Capping the rate at the source's own turns this
        // into constrained quality: the picture is as good as CRF wants, but
        // never costs more bits than the original did.
        final cap = sourceVideoCapKbps(s, sourceVideoKbps);
        if (cap != null) {
          args.addAll([
            '-maxrate', '${cap}k',
            '-bufsize', '${cap * 2}k',
          ]);
        }
      } else {
        args.addAll(['-b:v', '${s.videoBitrateKbps}k']);
      }

      if (hw == null && codec.supportsPreset) {
        args.addAll(['-preset', s.preset.flag]);
      }

      // Apple players will not decode HEVC in MP4/MOV tagged as `hev1`.
      if (codec == VideoCodec.h265 &&
          (s.container == ContainerFormat.mp4 || s.container == ContainerFormat.mov)) {
        args.addAll(['-tag:v', 'hvc1']);
      }
    }

    if (analysisPass) {
      // No audio work on pass 1 — but note the *bitrate maths above* still
      // budgeted for the audio track, so both passes aim at the same number.
      args.add('-an');
    } else {
      _appendAudioCodec(args, s, sourceAudioKbps);
    }

    if (subtitles != null) {
      args.addAll(['-c:s', subtitles]);
    }

    if (!analysisPass &&
        (s.container == ContainerFormat.mp4 || s.container == ContainerFormat.mov)) {
      // Move the index to the head of the file so it starts playing before it
      // is fully downloaded/copied.
      args.addAll(['-movflags', '+faststart']);
    }
  }

  /// Subtitle codec for the target container, or null when subtitles are off
  /// or cannot be carried. MP4/MOV only hold mov_text; MKV can keep whatever
  /// text codec the source used.
  static String? _subtitleCodecFor(ConversionSettings s) {
    if (!s.keepSubtitles || s.videoCodec == VideoCodec.none) return null;
    return switch (s.container) {
      ContainerFormat.mp4 || ContainerFormat.mov => 'mov_text',
      ContainerFormat.mkv => 'copy',
      _ => null,
    };
  }

  /// Speed only takes effect when *both* streams can be retimed together: a
  /// copied stream passes through no filter, so a leftover speed value from
  /// before the user switched either codec to Copy must not desynchronise
  /// the output. (The UI disables the control in that state, but the stale
  /// value survives in settings.) Public because the queue's progress maths
  /// must agree with the argument builder about whether speed applies.
  static bool speedActive(ConversionSettings s) =>
      s.speed.isChanged &&
      s.audioCodec != AudioCodec.copy &&
      s.videoCodec != VideoCodec.copy &&
      s.videoCodec != VideoCodec.none;

  /// Leaves room for container overhead and VBV slack, so "no bigger" holds
  /// for the *file*, not merely for the video stream.
  static const double _capHeadroom = 0.85;

  /// The video-rate ceiling for a constant-quality encode, derived from what
  /// the source itself spent on its picture. Null when it cannot be computed,
  /// or when the user turned the guarantee off to encode *up* deliberately.
  ///
  /// A resolution downscale lowers the ceiling in proportion to the pixels
  /// dropped: a 480p re-encode has no business spending 1080p bits.
  ///
  /// There is deliberately **no floor**. An earlier version clamped the cap up
  /// to a "sane minimum", and a device test caught what that does: a source
  /// whose picture only costs 25 kbps got a 32 kbps ceiling — above its own
  /// rate, so it constrained nothing, and the "compressed" file came out
  /// larger than the original. A cap above the source is not a cap.
  static int? sourceVideoCapKbps(ConversionSettings s, int? sourceVideoKbps) {
    if (!s.capBitrateToSource) return null;
    if (sourceVideoKbps == null || sourceVideoKbps <= 0) return null;

    var cap = sourceVideoKbps * _capHeadroom;

    if (s.resolution.height case final target?) {
      // The source height is unknown here, so assume the common 1080p case; a
      // ceiling is only lowered when the user asked for something smaller.
      const assumedSourceHeight = 1080;
      if (target < assumedSourceHeight) {
        cap *= (target * target) / (assumedSourceHeight * assumedSourceHeight);
      }
    }

    final rounded = cap.round();
    return rounded < 1 ? 1 : rounded;
  }

  /// The audio bitrate to actually use: never more than the source spent.
  /// Re-encoding a 64 kbps voice note at the default 128 kbps doubles the
  /// audio track on its own, which is half of how a "compression" grows.
  static int audioKbpsFor(ConversionSettings s, int? sourceAudioKbps) {
    if (!s.capBitrateToSource) return s.audioBitrateKbps;
    if (sourceAudioKbps == null || sourceAudioKbps <= 0) return s.audioBitrateKbps;
    return sourceAudioKbps < s.audioBitrateKbps ? sourceAudioKbps : s.audioBitrateKbps;
  }

  /// The bitrate that fits the size budget, over the stretch of source that
  /// will actually be encoded: trimming shortens it, speeding up shrinks it.
  static int? _targetKbps(ConversionSettings s, int? sourceDurationMs) {
    final target = s.sizeTargetBytes;
    if (target == null) return null;
    var durationMs = (s.trim != null && s.trim!.isValid) ? s.trim!.durationMs : sourceDurationMs;
    if (durationMs == null || durationMs <= 0) return null;
    if (speedActive(s)) durationMs = (durationMs / s.speed.factor).round();
    // The audio share of the budget must reflect what will actually be
    // written. `-b:a` only exists for the lossy encoders; a copied track's
    // rate is unknowable here (could be 1.5 Mbps PCM), and budgeting 128 kbps
    // for it would overshoot the hard limit this mode exists to respect —
    // better to fall back to CRF than to lie.
    final int? audioKbps = switch (s.audioCodec) {
      AudioCodec.none => 0,
      AudioCodec.copy => null,
      AudioCodec.pcm16 => 1536, // 48 kHz × 16 bit × stereo
      AudioCodec.flac => 900, // conservative upper bound for stereo FLAC
      _ => s.audioBitrateKbps,
    };
    if (audioKbps == null) return null;
    return RateCalc.videoKbpsForTarget(
      targetBytes: target,
      durationMs: durationMs,
      audioKbps: audioKbps,
    );
  }

  static void _appendAudioCodec(
    List<String> args,
    ConversionSettings s, [
    int? sourceAudioKbps,
  ]) {
    final audio = s.audioCodec;
    if (audio == AudioCodec.none) {
      args.add('-an');
      return;
    }
    if (audio == AudioCodec.copy) {
      args.addAll(['-c:a', 'copy']);
      return;
    }
    args.addAll(['-c:a', audio.encoder!]);
    if (audio.supportsBitrate) {
      // Never spend more on the audio than the source did: re-encoding a
      // 64 kbps voice track at the 128 kbps default doubles it, which is half
      // of how a "compression" ends up bigger than what it compressed.
      args.addAll(['-b:a', '${audioKbpsFor(s, sourceAudioKbps)}k']);
    }

    final audioFilters = <String>[];
    // Audio must keep pace with the retimed video. atempo stages are chained
    // for factors outside one filter's 0.5–2.0 range.
    if (speedActive(s) && s.container.kind == MediaKind.video) {
      audioFilters.addAll(atempoChain(s.speed.factor).map((f) => 'atempo=$f'));
    }
    if (s.volumePercent != 100) {
      audioFilters.add('volume=${(s.volumePercent / 100).toStringAsFixed(2)}');
    }
    if (audioFilters.isNotEmpty) {
      args.addAll(['-af', audioFilters.join(',')]);
    }
  }
}
