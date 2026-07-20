import 'conversion_settings.dart';
import 'media_format.dart';

/// The outcome-first presets on the Simple view. Each answers "what do you
/// want?" rather than "which codec?" — the market's best-rated converters are
/// preset-first, and its worst-rated one is codec-first.
enum QuickPreset {
  /// Noticeably smaller MP4 at still-good quality.
  compressVideo,

  /// Hit an exact size budget — Discord, e-mail, messengers.
  fitToSize,

  /// Plays anywhere: MP4 + H.264 + AAC.
  compatibleMp4,

  /// Audio track out of a video, as MP3.
  extractAudio,

  /// Short video to an animated GIF.
  videoToGif,

  /// Stitch several clips into one MP4, in selection order.
  mergeVideos,

  /// Smaller JPEG out of any picture.
  compressImage,

  /// Cleaner, punchier, apparently sharper JPEG out of any picture.
  enhancePhoto,

  /// Any picture to WebP.
  imageToWebp,

  /// Any audio file to a universally playable MP3.
  audioToMp3,

  /// Audio at a leaner bitrate — voice notes, podcasts, long recordings.
  compressAudio;

  /// Which kind of source file the preset expects; the UI uses it to warn
  /// when the selection does not match.
  /// The kind of *source* this preset applies to.
  MediaKind get expectsKind => switch (this) {
        compressVideo ||
        fitToSize ||
        compatibleMp4 ||
        extractAudio ||
        videoToGif ||
        mergeVideos =>
          MediaKind.video,
        compressImage || enhancePhoto || imageToWebp => MediaKind.image,
        audioToMp3 || compressAudio => MediaKind.audio,
      };

  bool get needsSizeTarget => this == QuickPreset.fitToSize;

  /// Merge collapses the whole pending selection into one output.
  bool get isMerge => this == QuickPreset.mergeVideos;

  /// The presets that make sense for a source of this kind. The UI shows only
  /// these — offering "Compress video" for a photo, and then defaulting to it,
  /// is how the app used to confuse people.
  static List<QuickPreset> forKind(MediaKind kind) =>
      QuickPreset.values.where((p) => p.expectsKind == kind).toList();

  /// The preset a fresh selection of this kind starts on.
  static QuickPreset defaultFor(MediaKind kind) => switch (kind) {
        MediaKind.video => QuickPreset.compressVideo,
        MediaKind.image => QuickPreset.compressImage,
        MediaKind.audio => QuickPreset.audioToMp3,
      };

  /// The conversion profile this preset stands for. [sizeTargetBytes] is only
  /// read by [fitToSize].
  ConversionSettings settings({int? sizeTargetBytes}) => switch (this) {
        compressVideo => const ConversionSettings(
            container: ContainerFormat.mp4,
            videoCodec: VideoCodec.h264,
            audioCodec: AudioCodec.aac,
            rateControl: RateControl.quality,
            // CRF 28 ≈ half the size of the CRF 23 default at a quality drop
            // most phone screens do not show.
            crf: 28,
            audioBitrateKbps: 128,
          ),
        fitToSize => ConversionSettings(
            container: ContainerFormat.mp4,
            videoCodec: VideoCodec.h264,
            audioCodec: AudioCodec.aac,
            rateControl: RateControl.size,
            sizeTargetBytes: sizeTargetBytes ?? SizeTarget.discord.bytes,
            // Audio gets a lean but not ruinous share of the budget.
            audioBitrateKbps: 96,
          ),
        compatibleMp4 => const ConversionSettings(
            container: ContainerFormat.mp4,
            videoCodec: VideoCodec.h264,
            audioCodec: AudioCodec.aac,
            rateControl: RateControl.quality,
            crf: 23,
          ),
        extractAudio => const ConversionSettings(
            container: ContainerFormat.mp3,
            audioCodec: AudioCodec.mp3,
            audioBitrateKbps: 192,
          ),
        videoToGif => const ConversionSettings(
            container: ContainerFormat.gif,
            resolution: ResolutionPreset.p480,
            fps: FpsPreset.fps15,
          ),
        mergeVideos => const ConversionSettings(
            container: ContainerFormat.mp4,
            videoCodec: VideoCodec.h264,
            audioCodec: AudioCodec.aac,
            rateControl: RateControl.quality,
            crf: 23,
            // The concat canvas; every clip is letterboxed onto it.
            resolution: ResolutionPreset.p720,
            fps: FpsPreset.fps30,
          ),
        compressImage => const ConversionSettings(
            container: ContainerFormat.jpg,
            imageQuality: 80,
          ),
        enhancePhoto => const ConversionSettings(
            container: ContainerFormat.jpg,
            // The one preset that deliberately spends bits: re-compressing an
            // enhanced photo at the usual 80 would throw away the detail the
            // filters just brought out, and the point here is the picture, not
            // the file size.
            imageQuality: 92,
            // Deliberately conservative. A phone snapshot is mildly soft and
            // mildly noisy; medium sharpening on light denoising fixes that,
            // while "strong" everything is what makes a face look like plastic.
            sharpen: EnhanceLevel.medium,
            denoise: EnhanceLevel.light,
            autoColor: true,
          ),
        imageToWebp => const ConversionSettings(
            container: ContainerFormat.webp,
            imageQuality: 80,
          ),
        audioToMp3 => const ConversionSettings(
            container: ContainerFormat.mp3,
            audioCodec: AudioCodec.mp3,
            audioBitrateKbps: 192,
          ),
        compressAudio => const ConversionSettings(
            container: ContainerFormat.m4a,
            audioCodec: AudioCodec.aac,
            // AAC at 96k is transparent enough for speech and roughly a third
            // the size of a 256k source.
            audioBitrateKbps: 96,
          ),
      };
}

/// Named size budgets for [QuickPreset.fitToSize]. The labels quote the
/// service because that is how users think ("fit under Discord's limit"),
/// with the number alongside so it survives the services changing their
/// limits.
enum SizeTarget {
  discord(10, 'Discord'),
  email(25, 'Email'),
  fiftyMb(50, null),
  hundredMb(100, null);

  const SizeTarget(this.megabytes, this.service);

  final int megabytes;
  final String? service;

  int get bytes => megabytes * 1000 * 1000;
}
