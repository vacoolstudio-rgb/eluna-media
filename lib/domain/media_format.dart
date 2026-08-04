/// Catalogue of supported containers/codecs and the compatibility rules
/// between them.
///
/// Everything here is pure Dart with no plugin dependencies so it can be
/// unit-tested on the host VM.
library;

enum MediaKind { image, video, audio }

/// Output container. The name doubles as the file extension.
enum ContainerFormat {
  // ---- images ----
  jpg(MediaKind.image, 'JPEG'),
  png(MediaKind.image, 'PNG'),
  webp(MediaKind.image, 'WebP'),
  bmp(MediaKind.image, 'BMP'),
  tiff(MediaKind.image, 'TIFF'),
  gif(MediaKind.image, 'GIF'),

  // ---- video ----
  mp4(MediaKind.video, 'MP4'),
  mkv(MediaKind.video, 'MKV'),
  mov(MediaKind.video, 'MOV'),
  webm(MediaKind.video, 'WebM'),
  avi(MediaKind.video, 'AVI'),

  // ---- audio ----
  mp3(MediaKind.audio, 'MP3'),
  m4a(MediaKind.audio, 'M4A / AAC'),
  wav(MediaKind.audio, 'WAV'),
  flac(MediaKind.audio, 'FLAC'),
  ogg(MediaKind.audio, 'OGG Vorbis'),
  opus(MediaKind.audio, 'Opus');

  const ContainerFormat(this.kind, this.label);

  final MediaKind kind;
  final String label;

  String get extension => name;

  /// GIF is the one image container that can hold motion, so a video input is
  /// meaningful for it.
  bool get isAnimatedImage => this == ContainerFormat.gif;

  static ContainerFormat? fromExtension(String ext) {
    final normalised = ext.toLowerCase().replaceFirst('.', '');
    const aliases = <String, ContainerFormat>{
      'jpeg': ContainerFormat.jpg,
      'jpe': ContainerFormat.jpg,
      'tif': ContainerFormat.tiff,
      'aac': ContainerFormat.m4a,
      'oga': ContainerFormat.ogg,
    };
    if (aliases.containsKey(normalised)) return aliases[normalised];
    for (final f in ContainerFormat.values) {
      if (f.name == normalised) return f;
    }
    return null;
  }

  static List<ContainerFormat> ofKind(MediaKind kind) =>
      ContainerFormat.values.where((f) => f.kind == kind).toList();

  /// The kind of media a file *is*, guessed from its name. Null when the
  /// extension is missing or unknown — the app never claims to know more than
  /// it does.
  static MediaKind? kindOfFile(String fileName) {
    final dot = fileName.lastIndexOf('.');
    if (dot < 0) return null;
    // Inputs the app can decode but never write have no ContainerFormat of
    // their own; they still have a knowable kind.
    const extraInputs = <String, MediaKind>{
      'heic': MediaKind.image,
      'heif': MediaKind.image,
      'avif': MediaKind.image,
      'jfif': MediaKind.image,
      'ico': MediaKind.image,
      'svg': MediaKind.image,
      '3gp': MediaKind.video,
      'm4v': MediaKind.video,
      'mpg': MediaKind.video,
      'mpeg': MediaKind.video,
      'ts': MediaKind.video,
      'wmv': MediaKind.video,
      'flv': MediaKind.video,
      'm2ts': MediaKind.video,
      'wma': MediaKind.audio,
      'aiff': MediaKind.audio,
      'alac': MediaKind.audio,
      'amr': MediaKind.audio,
      'ape': MediaKind.audio,
    };
    final ext = fileName.substring(dot + 1).toLowerCase();
    return ContainerFormat.fromExtension(ext)?.kind ?? extraInputs[ext];
  }

  /// True for a source that carries motion inside an image container.
  ///
  /// A GIF is a picture by extension and a film by content, and "GIF → MP4" is
  /// one of the most-asked conversions there is: the same animation as an H.264
  /// clip is routinely a tenth of the size and plays in places a GIF does not.
  /// Only `.gif` qualifies — an animated WebP exists, but the extension it
  /// shares with still WebP cannot tell the two apart, and offering a video
  /// target for a still photo would be a lie.
  static bool isAnimatedSource(String fileName) =>
      fileName.toLowerCase().endsWith('.gif');

  /// Which containers a source of [source] may legally be written to.
  ///
  /// A video can become another video, an animated GIF, or — by extraction —
  /// an audio file. A still image can only become another still image, and
  /// audio only other audio. Offering "JPEG" for an MP3 is the kind of
  /// nonsense the old all-formats dropdown allowed.
  ///
  /// [animatedSource] widens the image case to the video containers: the GIF
  /// keeps its still-image targets (one frame out as a JPEG is a real thing to
  /// want) and gains the ones its motion deserves.
  static List<ContainerFormat> outputsFor(
    MediaKind source, {
    bool animatedSource = false,
  }) =>
      switch (source) {
        MediaKind.video => [
            ...ofKind(MediaKind.video),
            ContainerFormat.gif,
            ...ofKind(MediaKind.audio),
          ],
        MediaKind.image => [
            ...ofKind(MediaKind.image),
            if (animatedSource) ...ofKind(MediaKind.video),
          ],
        MediaKind.audio => ofKind(MediaKind.audio),
      };

  /// The output the app picks by default for a given source: compatible,
  /// widely playable, and lossy where lossiness is expected.
  static ContainerFormat defaultOutputFor(MediaKind source) => switch (source) {
        MediaKind.video => ContainerFormat.mp4,
        MediaKind.image => ContainerFormat.jpg,
        MediaKind.audio => ContainerFormat.mp3,
      };
}

/// Video encoders available in the bundled `full-gpl` FFmpeg build.
///
/// Note: the build ships `dav1d`, which is an AV1 *decoder*. There is no AV1
/// encoder, so AV1 output is not offered.
enum VideoCodec {
  copy('Copy (remux)', null),
  h264('H.264 / AVC', 'libx264'),
  h265('H.265 / HEVC', 'libx265'),
  vp9('VP9', 'libvpx-vp9'),
  mpeg4('MPEG-4 Part 2', 'mpeg4'),
  none('No video', null);

  const VideoCodec(this.label, this.encoder);

  final String label;
  final String? encoder;

  /// CRF is only meaningful for the rate-controlled x264/x265/VP9 encoders.
  bool get supportsCrf =>
      this == VideoCodec.h264 || this == VideoCodec.h265 || this == VideoCodec.vp9;

  /// x264/x265 accept `-preset`; VP9 and mpeg4 do not.
  bool get supportsPreset => this == VideoCodec.h264 || this == VideoCodec.h265;

  /// VP9's CRF scale runs to 63; x264/x265 stop at 51.
  int get maxCrf => this == VideoCodec.vp9 ? 63 : 51;
}

enum AudioCodec {
  copy('Copy', null),
  aac('AAC', 'aac'),
  mp3('MP3', 'libmp3lame'),
  opus('Opus', 'libopus'),
  vorbis('Vorbis', 'libvorbis'),
  flac('FLAC (lossless)', 'flac'),
  pcm16('PCM 16-bit (lossless)', 'pcm_s16le'),
  none('No audio', null);

  const AudioCodec(this.label, this.encoder);

  final String label;
  final String? encoder;

  /// Lossless and copy codecs ignore `-b:a`.
  bool get supportsBitrate =>
      this == AudioCodec.aac ||
      this == AudioCodec.mp3 ||
      this == AudioCodec.opus ||
      this == AudioCodec.vorbis;
}

/// Which codecs each container may legally hold.
///
/// These tables exist so the UI can never offer a combination that makes
/// FFmpeg fail at runtime (e.g. Vorbis inside MP4).
abstract final class ContainerRules {
  static const Map<ContainerFormat, List<VideoCodec>> _video = {
    ContainerFormat.mp4: [
      VideoCodec.h264,
      VideoCodec.h265,
      VideoCodec.mpeg4,
      VideoCodec.copy,
    ],
    ContainerFormat.mov: [
      VideoCodec.h264,
      VideoCodec.h265,
      VideoCodec.mpeg4,
      VideoCodec.copy,
    ],
    ContainerFormat.mkv: [
      VideoCodec.h264,
      VideoCodec.h265,
      VideoCodec.vp9,
      VideoCodec.mpeg4,
      VideoCodec.copy,
    ],
    ContainerFormat.webm: [VideoCodec.vp9, VideoCodec.copy],
    ContainerFormat.avi: [VideoCodec.mpeg4, VideoCodec.h264, VideoCodec.copy],
  };

  static const Map<ContainerFormat, List<AudioCodec>> _audio = {
    // Video containers.
    ContainerFormat.mp4: [AudioCodec.aac, AudioCodec.mp3, AudioCodec.copy, AudioCodec.none],
    ContainerFormat.mov: [AudioCodec.aac, AudioCodec.pcm16, AudioCodec.copy, AudioCodec.none],
    ContainerFormat.mkv: [
      AudioCodec.aac,
      AudioCodec.mp3,
      AudioCodec.opus,
      AudioCodec.vorbis,
      AudioCodec.flac,
      AudioCodec.copy,
      AudioCodec.none,
    ],
    ContainerFormat.webm: [AudioCodec.opus, AudioCodec.vorbis, AudioCodec.copy, AudioCodec.none],
    ContainerFormat.avi: [AudioCodec.mp3, AudioCodec.pcm16, AudioCodec.copy, AudioCodec.none],
    // Audio-only containers.
    ContainerFormat.mp3: [AudioCodec.mp3],
    ContainerFormat.m4a: [AudioCodec.aac],
    ContainerFormat.wav: [AudioCodec.pcm16],
    ContainerFormat.flac: [AudioCodec.flac],
    ContainerFormat.ogg: [AudioCodec.vorbis],
    ContainerFormat.opus: [AudioCodec.opus],
  };

  static List<VideoCodec> videoCodecsFor(ContainerFormat c) =>
      _video[c] ?? const <VideoCodec>[];

  static List<AudioCodec> audioCodecsFor(ContainerFormat c) =>
      _audio[c] ?? const <AudioCodec>[];

  static bool allowsVideo(ContainerFormat c, VideoCodec v) =>
      videoCodecsFor(c).contains(v);

  static bool allowsAudio(ContainerFormat c, AudioCodec a) =>
      audioCodecsFor(c).contains(a);

  /// First entry of each table is the sensible default.
  static VideoCodec defaultVideoCodec(ContainerFormat c) =>
      videoCodecsFor(c).firstOrNull ?? VideoCodec.none;

  static AudioCodec defaultAudioCodec(ContainerFormat c) =>
      audioCodecsFor(c).firstOrNull ?? AudioCodec.none;
}

extension _FirstOrNull<E> on List<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
