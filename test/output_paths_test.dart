import 'package:eluna_media/core/output_paths.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sanitiseBaseName', () {
    test('drops the extension', () {
      expect(OutputPaths.sanitiseBaseName('holiday.mov'), 'holiday');
    });

    test('keeps dots that are part of the name', () {
      expect(OutputPaths.sanitiseBaseName('v1.2.final.mp4'), 'v1.2.final');
    });

    test('replaces characters that are illegal in a filename', () {
      expect(OutputPaths.sanitiseBaseName('a/b:c*d?.png'), 'a_b_c_d_');
    });

    test('preserves non-ASCII names', () {
      expect(OutputPaths.sanitiseBaseName('отпуск.mp4'), 'отпуск');
    });

    test('falls back to a placeholder when nothing usable is left', () {
      expect(OutputPaths.sanitiseBaseName(''), 'output');
    });

    test('truncates very long names', () {
      final long = '${'x' * 300}.mp4';
      expect(OutputPaths.sanitiseBaseName(long).length, 80);
    });
  });

  group('uniquePath', () {
    test('uses the plain name when nothing is in the way', () {
      final path = OutputPaths.uniquePath(
        directory: '/out',
        baseName: 'clip',
        extension: 'mp4',
        exists: (_) => false,
        separator: '/',
      );
      expect(path, '/out/clip.mp4');
    });

    test('suffixes rather than overwriting an existing file', () {
      const taken = {'/out/clip.mp4', '/out/clip (1).mp4'};
      final path = OutputPaths.uniquePath(
        directory: '/out',
        baseName: 'clip',
        extension: 'mp4',
        exists: taken.contains,
        separator: '/',
      );
      expect(path, '/out/clip (2).mp4');
    });
  });

  group('humanBytes', () {
    test('scales through the units', () {
      expect(OutputPaths.humanBytes(0), '0 B');
      expect(OutputPaths.humanBytes(512), '512 B');
      expect(OutputPaths.humanBytes(1536), '1.5 KB');
      expect(OutputPaths.humanBytes(5 * 1024 * 1024), '5.0 MB');
    });
  });

  group('ConversionJob.sizeDeltaRatio', () {
    ConversionJob job({
      required JobStatus status,
      required int inputBytes,
      required int outputBytes,
    }) =>
        ConversionJob(
          id: 'j',
          inputPath: '/in',
          inputName: 'in',
          settings: ConversionSettings.defaultsFor(ContainerFormat.mp4),
          status: status,
          inputBytes: inputBytes,
          outputBytes: outputBytes,
        );

    test('is null until the job completes', () {
      expect(
        job(status: JobStatus.running, inputBytes: 100, outputBytes: 50).sizeDeltaRatio,
        isNull,
      );
    });

    test('is positive when the output shrank', () {
      final ratio =
          job(status: JobStatus.completed, inputBytes: 100, outputBytes: 25).sizeDeltaRatio;
      expect(ratio, closeTo(0.75, 1e-9));
    });

    test('is negative when the output grew', () {
      final ratio =
          job(status: JobStatus.completed, inputBytes: 100, outputBytes: 150).sizeDeltaRatio;
      expect(ratio, closeTo(-0.5, 1e-9));
    });

    test('is null when a size could not be read', () {
      expect(
        job(status: JobStatus.completed, inputBytes: 0, outputBytes: 10).sizeDeltaRatio,
        isNull,
      );
    });
  });
}
