import 'media_format.dart';

/// Resolves an enum from its `name`, falling back when the stored value came
/// from an older build that spelled it differently or no longer offers it.
T enumByName<T extends Enum>(List<T> values, Object? name, T fallback) {
  if (name is! String) return fallback;
  for (final v in values) {
    if (v.name == name) return v;
  }
  return fallback;
}

/// Target frame size. `keep` leaves the source untouched.
enum ResolutionPreset {
  keep('Original', null),
  p2160('2160p (4K)', 2160),
  p1440('1440p (2K)', 1440),
  p1080('1080p (Full HD)', 1080),
  p720('720p (HD)', 720),
  p480('480p (SD)', 480),
  p360('360p', 360);

  const ResolutionPreset(this.label, this.height);

  final String label;
  final int? height;
}

enum FpsPreset {
  keep('Original', null),
  fps60('60', 60),
  fps30('30', 30),
  fps24('24', 24),
  fps15('15', 15);

  const FpsPreset(this.label, this.value);

  final String label;
  final int? value;
}

/// x264/x265 speed-vs-size tradeoff.
enum EncodingPreset {
  ultrafast,
  superfast,
  veryfast,
  faster,
  fast,
  medium,
  slow,
  slower,
  veryslow;

  String get flag => name;
}

/// How the video encoder decides its bit allocation.
enum RateControl {
  /// Constant Rate Factor — constant *quality*, variable size. Preferred.
  quality,

  /// Fixed average bitrate — predictable size, variable quality.
  bitrate,

  /// Bitrate computed from a target file size and the source duration —
  /// "make it fit under 10 MB". Falls back to CRF when the duration is
  /// unknown, because the maths needs a denominator.
  size,
}

/// 90-degree rotations. FFmpeg's `transpose` rotates and *re-encodes*; the UI
/// hides this control during a remux.
enum RotatePreset {
  none('0°'),
  cw90('90°'),
  r180('180°'),
  ccw90('270°');

  const RotatePreset(this.label);

  final String label;
}

/// Playback speed. An enum rather than a free double: enum names survive
/// storage round-trips the way raw doubles do not, and the argument builder
/// chains `atempo` stages for the values outside a single filter's 0.5–2.0
/// range (0.25× and 4×).
enum SpeedPreset {
  x025(0.25, '0.25×'),
  x050(0.5, '0.5×'),
  x075(0.75, '0.75×'),
  keep(1.0, '1×'),
  x125(1.25, '1.25×'),
  x150(1.5, '1.5×'),
  x200(2.0, '2×'),
  x400(4.0, '4×');

  const SpeedPreset(this.factor, this.label);

  final double factor;
  final String label;

  bool get isChanged => this != SpeedPreset.keep;
}

/// Aspect-ratio crops, centred on the frame. Ratio-based rather than free-form
/// because there is no visual crop editor: "make it square for the feed" and
/// "make it vertical for stories" are the asks these serve.
enum CropPreset {
  none(null, null, 'Original'),
  square(1, 1, '1:1'),
  vertical(9, 16, '9:16'),
  wide(16, 9, '16:9'),
  classic(4, 3, '4:3');

  const CropPreset(this.ratioW, this.ratioH, this.label);

  final int? ratioW;
  final int? ratioH;
  final String label;

  bool get isChanged => this != CropPreset.none;
}

/// Proportional resize for stills.
///
/// [ResolutionPreset] answers "make it 1080p", which is how video is thought
/// about; a photo is thought about as "half the size". They are not the same
/// question, and the height presets could not express the second one at all.
/// Composes with a resolution target rather than competing for the slot: the
/// percentage is applied to whatever frame the earlier steps produced.
enum ImageScale {
  keep(1.0, '100%'),
  p75(0.75, '75%'),
  p50(0.5, '50%'),
  p25(0.25, '25%');

  const ImageScale(this.factor, this.label);

  final double factor;
  final String label;

  bool get isChanged => this != ImageScale.keep;
}

/// Output channel layout. Halving a voice recording to mono halves the track,
/// which no bitrate setting can match for speech.
enum AudioChannels {
  keep(null, 'Original'),
  mono(1, 'Mono'),
  stereo(2, 'Stereo');

  const AudioChannels(this.count, this.label);

  final int? count;
  final String label;
}

/// Output sample rate. Speech carries nothing above ~8 kHz, so a 44.1 kHz voice
/// note is paying for bandwidth it never uses; music needs every bit of it.
enum SampleRate {
  keep(null, 'Original'),
  hz48000(48000, '48 kHz'),
  hz44100(44100, '44.1 kHz'),
  hz32000(32000, '32 kHz'),
  hz22050(22050, '22.05 kHz'),
  hz16000(16000, '16 kHz');

  const SampleRate(this.hz, this.label);

  final int? hz;
  final String label;
}

/// Strength of a photo-enhancement filter. Four steps rather than a 0–100
/// slider: the useful range of both `unsharp` and `hqdn3d` is narrow, and a
/// slider invites the exact overshoot ("more must be better") that turns a
/// photo into halos and plastic skin.
///
/// Enhancement is a *still-image* control. The filters work on video frames
/// too, but running them over every frame of a clip costs far more CPU than a
/// phone should spend, so the argument builder only reads these on the image
/// path.
enum EnhanceLevel {
  none,
  light,
  medium,
  strong;

  bool get isOn => this != EnhanceLevel.none;
}

/// A closed time range within the source, in milliseconds.
class TrimRange {
  const TrimRange({required this.startMs, required this.endMs});

  final int startMs;
  final int endMs;

  int get durationMs => endMs - startMs;

  bool get isValid => startMs >= 0 && endMs > startMs;

  Map<String, Object?> toJson() => {'startMs': startMs, 'endMs': endMs};

  static TrimRange? fromJson(Object? json) {
    if (json is! Map) return null;
    final start = json['startMs'];
    final end = json['endMs'];
    if (start is! int || end is! int) return null;
    return TrimRange(startMs: start, endMs: end);
  }

  @override
  bool operator ==(Object other) =>
      other is TrimRange && other.startMs == startMs && other.endMs == endMs;

  @override
  int get hashCode => Object.hash(startMs, endMs);
}

/// Everything the user can tune for one conversion.
///
/// A single class covers image/video/audio; irrelevant fields are simply
/// ignored by the argument builder for the chosen container.
class ConversionSettings {
  const ConversionSettings({
    required this.container,
    this.videoCodec = VideoCodec.h264,
    this.audioCodec = AudioCodec.aac,
    this.rateControl = RateControl.quality,
    this.crf = 23,
    this.videoBitrateKbps = 2500,
    this.audioBitrateKbps = 128,
    this.preset = EncodingPreset.medium,
    this.resolution = ResolutionPreset.keep,
    this.fps = FpsPreset.keep,
    this.imageQuality = 90,
    this.lossless = false,
    this.sharpen = EnhanceLevel.none,
    this.denoise = EnhanceLevel.none,
    this.autoColor = false,
    this.upscale2x = false,
    this.stripMetadata = true,
    this.trim,
    this.sizeTargetBytes,
    this.rotate = RotatePreset.none,
    this.flipH = false,
    this.speed = SpeedPreset.keep,
    this.crop = CropPreset.none,
    this.volumePercent = 100,
    this.keepSubtitles = false,
    this.capBitrateToSource = true,
    this.imageScale = ImageScale.keep,
    this.audioChannels = AudioChannels.keep,
    this.sampleRate = SampleRate.keep,
  });

  /// Proportional resize for stills, applied on top of [resolution].
  final ImageScale imageScale;

  /// Output channel layout. Ignored by copied and by already-mono tracks.
  final AudioChannels audioChannels;

  /// Output sample rate. Ignored on a copied track — a remux cannot resample.
  final SampleRate sampleRate;

  final ContainerFormat container;
  final VideoCodec videoCodec;
  final AudioCodec audioCodec;

  final RateControl rateControl;

  /// Constant Rate Factor. Lower is better quality. 0 = lossless for x264.
  final int crf;
  final int videoBitrateKbps;
  final int audioBitrateKbps;

  final EncodingPreset preset;
  final ResolutionPreset resolution;
  final FpsPreset fps;

  /// 1..100 for still images (JPEG/WebP). Higher is better.
  final int imageQuality;

  /// WebP/PNG lossless mode. Ignored by formats that are always lossless.
  final bool lossless;

  /// Edge sharpening for stills. Raises acutance — the picture reads as more
  /// focused — but it cannot *undo* blur: an out-of-focus or motion-smeared
  /// frame no longer contains the detail, and no local-contrast filter can
  /// invent it. The UI says so rather than promising a rescue.
  final EnhanceLevel sharpen;

  /// Spatial noise reduction for stills. Runs *before* [sharpen], which would
  /// otherwise amplify exactly the grain this removes.
  final EnhanceLevel denoise;

  /// Auto levels plus a small saturation lift. Cheap, and on a flat phone
  /// snapshot it does more visible good than sharpening does.
  final bool autoColor;

  /// Doubles both dimensions with a Lanczos kernel. It resamples; it does not
  /// invent detail, so it serves printing and cropping, not rescue. Ignored
  /// when [resolution] asks for a downscale — both are the same `scale` filter,
  /// and "shrink to 720p, then double it" is not a request with an answer.
  final bool upscale2x;

  /// True when [upscale2x] will actually reach the filter chain.
  bool get upscaleActive => upscale2x && resolution.height == null;

  /// True when any still-image enhancement filter is active.
  bool get enhances => sharpen.isOn || denoise.isOn || autoColor || upscaleActive;

  /// Drops EXIF/GPS/XMP from the output. On by default — this is a privacy app.
  final bool stripMetadata;

  final TrimRange? trim;

  /// Target output size for [RateControl.size], in bytes. Null otherwise.
  final int? sizeTargetBytes;

  final RotatePreset rotate;

  /// Mirrors the picture horizontally. Applied after [rotate].
  final bool flipH;

  final SpeedPreset speed;

  final CropPreset crop;

  /// Audio gain, 0–200. 100 leaves the track untouched.
  final int volumePercent;

  /// Carries subtitle tracks through to the output where the container can
  /// hold them (MP4/MOV as mov_text, MKV as-is). Off by default: it is a
  /// power-user option and bitmap subtitles can make a conversion fail.
  final bool keepSubtitles;

  /// Never let a constant-quality encode spend more bits per second than the
  /// source did. On by default: a "compression" that returns a bigger file is
  /// the single most infuriating outcome, and CRF alone cannot promise
  /// otherwise. Power users converting *up* in quality can turn it off.
  final bool capBitrateToSource;

  MediaKind get kind => container.kind;

  /// True when any control that forces a re-encode of both streams is active.
  bool get transforms =>
      rotate != RotatePreset.none ||
      flipH ||
      speed.isChanged ||
      crop.isChanged ||
      volumePercent != 100;

  /// Builds a settings object whose codecs are guaranteed legal for
  /// [container], falling back to that container's defaults when the currently
  /// selected codec is not allowed.
  ConversionSettings withContainer(ContainerFormat next) {
    final v = ContainerRules.allowsVideo(next, videoCodec)
        ? videoCodec
        : ContainerRules.defaultVideoCodec(next);
    final a = ContainerRules.allowsAudio(next, audioCodec)
        ? audioCodec
        : ContainerRules.defaultAudioCodec(next);
    return copyWith(container: next, videoCodec: v, audioCodec: a);
  }

  ConversionSettings copyWith({
    ContainerFormat? container,
    VideoCodec? videoCodec,
    AudioCodec? audioCodec,
    RateControl? rateControl,
    int? crf,
    int? videoBitrateKbps,
    int? audioBitrateKbps,
    EncodingPreset? preset,
    ResolutionPreset? resolution,
    FpsPreset? fps,
    int? imageQuality,
    bool? lossless,
    EnhanceLevel? sharpen,
    EnhanceLevel? denoise,
    bool? autoColor,
    bool? upscale2x,
    bool? stripMetadata,
    TrimRange? trim,
    bool clearTrim = false,
    int? sizeTargetBytes,
    bool clearSizeTarget = false,
    RotatePreset? rotate,
    bool? flipH,
    SpeedPreset? speed,
    CropPreset? crop,
    int? volumePercent,
    bool? keepSubtitles,
    bool? capBitrateToSource,
    ImageScale? imageScale,
    AudioChannels? audioChannels,
    SampleRate? sampleRate,
  }) {
    return ConversionSettings(
      imageScale: imageScale ?? this.imageScale,
      audioChannels: audioChannels ?? this.audioChannels,
      sampleRate: sampleRate ?? this.sampleRate,
      container: container ?? this.container,
      videoCodec: videoCodec ?? this.videoCodec,
      audioCodec: audioCodec ?? this.audioCodec,
      rateControl: rateControl ?? this.rateControl,
      crf: crf ?? this.crf,
      videoBitrateKbps: videoBitrateKbps ?? this.videoBitrateKbps,
      audioBitrateKbps: audioBitrateKbps ?? this.audioBitrateKbps,
      preset: preset ?? this.preset,
      resolution: resolution ?? this.resolution,
      fps: fps ?? this.fps,
      imageQuality: imageQuality ?? this.imageQuality,
      lossless: lossless ?? this.lossless,
      sharpen: sharpen ?? this.sharpen,
      denoise: denoise ?? this.denoise,
      autoColor: autoColor ?? this.autoColor,
      upscale2x: upscale2x ?? this.upscale2x,
      stripMetadata: stripMetadata ?? this.stripMetadata,
      trim: clearTrim ? null : (trim ?? this.trim),
      sizeTargetBytes: clearSizeTarget ? null : (sizeTargetBytes ?? this.sizeTargetBytes),
      rotate: rotate ?? this.rotate,
      flipH: flipH ?? this.flipH,
      speed: speed ?? this.speed,
      crop: crop ?? this.crop,
      volumePercent: volumePercent ?? this.volumePercent,
      keepSubtitles: keepSubtitles ?? this.keepSubtitles,
      capBitrateToSource: capBitrateToSource ?? this.capBitrateToSource,
    );
  }

  Map<String, Object?> toJson() => {
        'container': container.name,
        'videoCodec': videoCodec.name,
        'audioCodec': audioCodec.name,
        'rateControl': rateControl.name,
        'crf': crf,
        'videoBitrateKbps': videoBitrateKbps,
        'audioBitrateKbps': audioBitrateKbps,
        'preset': preset.name,
        'resolution': resolution.name,
        'fps': fps.name,
        'imageQuality': imageQuality,
        'lossless': lossless,
        'sharpen': sharpen.name,
        'denoise': denoise.name,
        'autoColor': autoColor,
        'upscale2x': upscale2x,
        'stripMetadata': stripMetadata,
        if (trim != null) 'trim': trim!.toJson(),
        if (sizeTargetBytes != null) 'sizeTargetBytes': sizeTargetBytes,
        'rotate': rotate.name,
        'flipH': flipH,
        'speed': speed.name,
        'crop': crop.name,
        'volumePercent': volumePercent,
        'keepSubtitles': keepSubtitles,
        'capBitrateToSource': capBitrateToSource,
        'imageScale': imageScale.name,
        'audioChannels': audioChannels.name,
        'sampleRate': sampleRate.name,
      };

  /// Rebuilds settings from storage, re-validating the codec pair: the rules
  /// may have changed since the entry was written.
  static ConversionSettings fromJson(Map<String, Object?> json) {
    final container = enumByName(ContainerFormat.values, json['container'], ContainerFormat.mp4);
    final defaults = ConversionSettings.defaultsFor(container);

    final videoCodec = enumByName(VideoCodec.values, json['videoCodec'], defaults.videoCodec);
    final audioCodec = enumByName(AudioCodec.values, json['audioCodec'], defaults.audioCodec);

    return ConversionSettings(
      container: container,
      videoCodec:
          ContainerRules.allowsVideo(container, videoCodec) ? videoCodec : defaults.videoCodec,
      audioCodec:
          ContainerRules.allowsAudio(container, audioCodec) ? audioCodec : defaults.audioCodec,
      rateControl: enumByName(RateControl.values, json['rateControl'], RateControl.quality),
      crf: json['crf'] as int? ?? 23,
      videoBitrateKbps: json['videoBitrateKbps'] as int? ?? 2500,
      audioBitrateKbps: json['audioBitrateKbps'] as int? ?? 128,
      preset: enumByName(EncodingPreset.values, json['preset'], EncodingPreset.medium),
      resolution: enumByName(ResolutionPreset.values, json['resolution'], ResolutionPreset.keep),
      fps: enumByName(FpsPreset.values, json['fps'], FpsPreset.keep),
      imageQuality: json['imageQuality'] as int? ?? 90,
      lossless: json['lossless'] as bool? ?? false,
      sharpen: enumByName(EnhanceLevel.values, json['sharpen'], EnhanceLevel.none),
      denoise: enumByName(EnhanceLevel.values, json['denoise'], EnhanceLevel.none),
      autoColor: json['autoColor'] as bool? ?? false,
      upscale2x: json['upscale2x'] as bool? ?? false,
      stripMetadata: json['stripMetadata'] as bool? ?? true,
      trim: TrimRange.fromJson(json['trim']),
      // Entries written before these fields existed decode to the defaults.
      sizeTargetBytes: json['sizeTargetBytes'] as int?,
      rotate: enumByName(RotatePreset.values, json['rotate'], RotatePreset.none),
      flipH: json['flipH'] as bool? ?? false,
      speed: enumByName(SpeedPreset.values, json['speed'], SpeedPreset.keep),
      crop: enumByName(CropPreset.values, json['crop'], CropPreset.none),
      volumePercent: json['volumePercent'] as int? ?? 100,
      keepSubtitles: json['keepSubtitles'] as bool? ?? false,
      capBitrateToSource: json['capBitrateToSource'] as bool? ?? true,
      imageScale: enumByName(ImageScale.values, json['imageScale'], ImageScale.keep),
      audioChannels:
          enumByName(AudioChannels.values, json['audioChannels'], AudioChannels.keep),
      sampleRate: enumByName(SampleRate.values, json['sampleRate'], SampleRate.keep),
    );
  }

  /// Sensible starting point for a given target container.
  factory ConversionSettings.defaultsFor(ContainerFormat container) {
    return ConversionSettings(
      container: container,
      videoCodec: ContainerRules.defaultVideoCodec(container),
      audioCodec: ContainerRules.defaultAudioCodec(container),
      lossless: container == ContainerFormat.png,
    );
  }
}
