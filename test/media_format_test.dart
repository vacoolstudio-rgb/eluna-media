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

    test('audio containers advertise exactly one codec', () {
      for (final c in ContainerFormat.ofKind(MediaKind.audio)) {
        expect(ContainerRules.audioCodecsFor(c), hasLength(1), reason: c.name);
        expect(ContainerRules.videoCodecsFor(c), isEmpty, reason: c.name);
      }
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
