import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContainerFormat.fromExtension', () {
    test('accepts common aliases and is case insensitive', () {
      expect(ContainerFormat.fromExtension('JPEG'), ContainerFormat.jpg);
      expect(ContainerFormat.fromExtension('.jpg'), ContainerFormat.jpg);
      expect(ContainerFormat.fromExtension('tif'), ContainerFormat.tiff);
      expect(ContainerFormat.fromExtension('aac'), ContainerFormat.m4a);
    });

    test('returns null for anything it does not know', () {
      expect(ContainerFormat.fromExtension('xyz'), isNull);
    });
  });

  group('container rules', () {
    test('every video container has at least one legal video and audio codec', () {
      for (final c in ContainerFormat.ofKind(MediaKind.video)) {
        expect(ContainerRules.videoCodecsFor(c), isNotEmpty, reason: '${c.name} video');
        expect(ContainerRules.audioCodecsFor(c), isNotEmpty, reason: '${c.name} audio');
      }
    });

    test('WebM rejects codecs it cannot legally hold', () {
      expect(ContainerRules.allowsVideo(ContainerFormat.webm, VideoCodec.h264), isFalse);
      expect(ContainerRules.allowsAudio(ContainerFormat.webm, AudioCodec.aac), isFalse);
      expect(ContainerRules.allowsVideo(ContainerFormat.webm, VideoCodec.vp9), isTrue);
      expect(ContainerRules.allowsAudio(ContainerFormat.webm, AudioCodec.opus), isTrue);
    });

    test('MP4 rejects Vorbis', () {
      expect(ContainerRules.allowsAudio(ContainerFormat.mp4, AudioCodec.vorbis), isFalse);
    });

    test('audio containers carry audio and nothing else', () {
      for (final c in ContainerFormat.ofKind(MediaKind.audio)) {
        expect(ContainerRules.audioCodecsFor(c), isNotEmpty, reason: c.name);
        expect(ContainerRules.videoCodecsFor(c), isEmpty, reason: c.name);
      }
    });

    test('M4A is the only audio container offering a choice, and AAC leads it', () {
      expect(ContainerRules.defaultAudioCodec(ContainerFormat.m4a), AudioCodec.aac);
      expect(ContainerRules.allowsAudio(ContainerFormat.m4a, AudioCodec.alac), isTrue);
      // The rest name their codec in their own name — "FLAC" is not a box that
      // could hold something else — so a second entry there would be a mistake.
      for (final c in ContainerFormat.ofKind(MediaKind.audio)) {
        if (c == ContainerFormat.m4a) continue;
        expect(ContainerRules.audioCodecsFor(c), hasLength(1), reason: c.name);
      }
    });

    test('ALAC is lossless, so it takes no bitrate', () {
      expect(AudioCodec.alac.supportsBitrate, isFalse);
      expect(AudioCodec.alac.encoder, 'alac');
    });

    test('every default codec pair is itself legal', () {
      for (final c in ContainerFormat.values) {
        final v = ContainerRules.defaultVideoCodec(c);
        final a = ContainerRules.defaultAudioCodec(c);
        if (ContainerRules.videoCodecsFor(c).isNotEmpty) {
          expect(ContainerRules.allowsVideo(c, v), isTrue, reason: c.name);
        }
        if (ContainerRules.audioCodecsFor(c).isNotEmpty) {
          expect(ContainerRules.allowsAudio(c, a), isTrue, reason: c.name);
        }
      }
    });
  });

  group('withContainer', () {
    test('keeps a codec that the new container still allows', () {
      const s = ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h265,
        audioCodec: AudioCodec.aac,
      );
      final moved = s.withContainer(ContainerFormat.mkv);
      expect(moved.videoCodec, VideoCodec.h265);
      expect(moved.audioCodec, AudioCodec.aac);
    });

    test('replaces an illegal codec with the new container default', () {
      const s = ConversionSettings(
        container: ContainerFormat.mp4,
        videoCodec: VideoCodec.h264,
        audioCodec: AudioCodec.aac,
      );
      final moved = s.withContainer(ContainerFormat.webm);
      expect(moved.videoCodec, VideoCodec.vp9);
      expect(moved.audioCodec, AudioCodec.opus);
    });

    test('switching to any container never yields an illegal pair', () {
      for (final from in ContainerFormat.values) {
        final start = ConversionSettings.defaultsFor(from);
        for (final to in ContainerFormat.values) {
          final moved = start.withContainer(to);
          if (ContainerRules.videoCodecsFor(to).isNotEmpty) {
            expect(ContainerRules.allowsVideo(to, moved.videoCodec), isTrue,
                reason: '${from.name} -> ${to.name}');
          }
          if (ContainerRules.audioCodecsFor(to).isNotEmpty) {
            expect(ContainerRules.allowsAudio(to, moved.audioCodec), isTrue,
                reason: '${from.name} -> ${to.name}');
          }
        }
      }
    });
  });

  group('animated WebP and AVIF', () {
    test('animated WebP writes a .webp file, like the still one', () {
      expect(ContainerFormat.webpAnimated.extension, 'webp');
      expect(ContainerFormat.webp.extension, 'webp');
      // The extension is shared, the identity is not.
      expect(ContainerFormat.webpAnimated, isNot(ContainerFormat.webp));
    });

    test('a .webp input resolves to the still format, never the animated one', () {
      expect(ContainerFormat.fromExtension('webp'), ContainerFormat.webp);
      expect(ContainerFormat.fromExtension('.WEBP'), ContainerFormat.webp);
    });

    test('animated WebP counts as a moving output, AVIF does not', () {
      expect(ContainerFormat.webpAnimated.isAnimatedImage, isTrue);
      expect(ContainerFormat.gif.isAnimatedImage, isTrue);
      expect(ContainerFormat.avif.isAnimatedImage, isFalse);
      expect(ContainerFormat.webp.isAnimatedImage, isFalse);
    });

    test('a still source is not offered animated WebP, a GIF source is', () {
      final still = ContainerFormat.outputsFor(MediaKind.image);
      expect(still, isNot(contains(ContainerFormat.webpAnimated)));
      // A one-frame GIF out of a photo is a real thing to want, so GIF stays.
      expect(still, contains(ContainerFormat.gif));
      expect(still, contains(ContainerFormat.avif));

      final animated =
          ContainerFormat.outputsFor(MediaKind.image, animatedSource: true);
      expect(animated, contains(ContainerFormat.webpAnimated));
    });

    test('a video source is offered animated WebP alongside GIF', () {
      final outputs = ContainerFormat.outputsFor(MediaKind.video);
      expect(outputs, contains(ContainerFormat.webpAnimated));
      expect(outputs, contains(ContainerFormat.gif));
    });

    test('audio is offered neither', () {
      final outputs = ContainerFormat.outputsFor(MediaKind.audio);
      expect(outputs, isNot(contains(ContainerFormat.webpAnimated)));
      expect(outputs, isNot(contains(ContainerFormat.avif)));
    });

    test('AVIF is a known image input, as it was before it became a container', () {
      expect(ContainerFormat.kindOfFile('photo.avif'), MediaKind.image);
      expect(ContainerFormat.kindOfFile('photo.heic'), MediaKind.image);
    });
  });

  group('TrimRange', () {
    test('validates ordering', () {
      expect(const TrimRange(startMs: 0, endMs: 1).isValid, isTrue);
      expect(const TrimRange(startMs: 5, endMs: 5).isValid, isFalse);
      expect(const TrimRange(startMs: -1, endMs: 5).isValid, isFalse);
    });

    test('duration is end minus start', () {
      expect(const TrimRange(startMs: 2000, endMs: 5500).durationMs, 3500);
    });
  });
}
