import 'dart:convert';

import 'package:eluna_media/core/queue_storage.dart';
import 'package:eluna_media/domain/conversion_job.dart';
import 'package:eluna_media/domain/conversion_settings.dart';
import 'package:eluna_media/domain/media_format.dart';
import 'package:flutter_test/flutter_test.dart';

ConversionJob job({
  String id = 'j1',
  String inputPath = '/in/a.mov',
  JobStatus status = JobStatus.queued,
  String? outputPath,
  ConversionSettings? settings,
  int inputBytes = 100,
  int outputBytes = 0,
  String? errorMessage,
  JobFailure? failure,
  int? sourceDurationMs,
}) =>
    ConversionJob(
      id: id,
      inputPath: inputPath,
      inputName: 'a.mov',
      settings: settings ?? ConversionSettings.defaultsFor(ContainerFormat.mp4),
      status: status,
      outputPath: outputPath,
      inputBytes: inputBytes,
      outputBytes: outputBytes,
      errorMessage: errorMessage,
      failure: failure,
      sourceDurationMs: sourceDurationMs,
    );

/// Records deletions so restore's cleanup can be asserted without a disk.
class _Fs {
  _Fs(this.present);

  final Set<String> present;
  final deleted = <String>[];

  bool exists(String p) => present.contains(p);
  void delete(String p) => deleted.add(p);
}

void main() {
  group('round trip', () {
    test('a full job survives encode/decode unchanged', () {
      final original = job(
        id: 'abc',
        status: JobStatus.completed,
        outputPath: '/out/a.mp4',
        outputBytes: 40,
        sourceDurationMs: 12345,
        settings: const ConversionSettings(
          container: ContainerFormat.webm,
          videoCodec: VideoCodec.vp9,
          audioCodec: AudioCodec.opus,
          rateControl: RateControl.bitrate,
          crf: 31,
          videoBitrateKbps: 1234,
          audioBitrateKbps: 96,
          preset: EncodingPreset.slow,
          resolution: ResolutionPreset.p720,
          fps: FpsPreset.fps24,
          imageQuality: 55,
          lossless: true,
          stripMetadata: false,
          trim: TrimRange(startMs: 100, endMs: 900),
        ),
      );

      final restored = QueueStorage.decode(QueueStorage.encode([original])).jobs.single;

      expect(restored.id, 'abc');
      expect(restored.status, JobStatus.completed);
      expect(restored.outputPath, '/out/a.mp4');
      expect(restored.outputBytes, 40);
      expect(restored.sourceDurationMs, 12345);

      final s = restored.settings;
      expect(s.container, ContainerFormat.webm);
      expect(s.videoCodec, VideoCodec.vp9);
      expect(s.audioCodec, AudioCodec.opus);
      expect(s.rateControl, RateControl.bitrate);
      expect(s.crf, 31);
      expect(s.videoBitrateKbps, 1234);
      expect(s.audioBitrateKbps, 96);
      expect(s.preset, EncodingPreset.slow);
      expect(s.resolution, ResolutionPreset.p720);
      expect(s.fps, FpsPreset.fps24);
      expect(s.imageQuality, 55);
      expect(s.lossless, isTrue);
      expect(s.stripMetadata, isFalse);
      expect(s.trim, const TrimRange(startMs: 100, endMs: 900));
    });

    test('the failure reason survives', () {
      final restored = QueueStorage.decode(
        QueueStorage.encode([
          job(status: JobStatus.failed, failure: JobFailure.sourceMissing),
          job(id: 'j2', status: JobStatus.failed, failure: JobFailure.ffmpeg, errorMessage: 'boom'),
        ]),
      ).jobs;
      expect(restored[0].failure, JobFailure.sourceMissing);
      expect(restored[1].failure, JobFailure.ffmpeg);
      expect(restored[1].errorMessage, 'boom');
    });

    test('the in-flight flag round trips', () {
      expect(QueueStorage.decode(QueueStorage.encode([job()], wasRunning: true)).wasRunning, isTrue);
      expect(QueueStorage.decode(QueueStorage.encode([job()])).wasRunning, isFalse);
    });

    test('an entry written before auto-resume existed reads as not running', () {
      // Conservative default: never start converting on an old queue's behalf.
      final raw = jsonEncode({
        'version': QueueStorage.schemaVersion,
        'jobs': [job().toJson()],
      });
      expect(QueueStorage.decode(raw).wasRunning, isFalse);
    });

    test('transient fields are not written out', () {
      final encoded = jsonDecode(QueueStorage.encode([job()])) as Map<String, Object?>;
      final entry = (encoded['jobs'] as List).single as Map<String, Object?>;
      // A session id cannot outlive the process, and progress restarts anyway.
      expect(entry.containsKey('sessionId'), isFalse);
      expect(entry.containsKey('progress'), isFalse);
    });
  });

  group('decode is defensive', () {
    test('empty and null input yield an empty queue', () {
      expect(QueueStorage.decode(null).jobs, isEmpty);
      expect(QueueStorage.decode('').jobs, isEmpty);
    });

    test('malformed JSON does not throw', () {
      expect(QueueStorage.decode('{not json').jobs, isEmpty);
      expect(QueueStorage.decode('[]').jobs, isEmpty);
    });

    test('a different schema version is discarded rather than half-read', () {
      final raw = jsonEncode({
        'version': QueueStorage.schemaVersion + 1,
        'jobs': [job().toJson()],
      });
      expect(QueueStorage.decode(raw).jobs, isEmpty);
    });

    test('an unusable entry is skipped, and its siblings survive', () {
      final raw = jsonEncode({
        'version': QueueStorage.schemaVersion,
        'jobs': [
          {'id': 'broken'}, // no inputPath, no settings
          job(id: 'good').toJson(),
        ],
      });
      final decoded = QueueStorage.decode(raw).jobs;
      expect(decoded.map((j) => j.id), ['good']);
    });

    test('an unknown enum name falls back instead of dropping the job', () {
      final entry = job().toJson();
      (entry['settings']! as Map)['videoCodec'] = 'av1_from_the_future';
      final raw = jsonEncode({'version': QueueStorage.schemaVersion, 'jobs': [entry]});

      final decoded = QueueStorage.decode(raw).jobs.single;
      expect(decoded.settings.videoCodec, VideoCodec.h264, reason: 'MP4 default');
    });

    test('a codec that is no longer legal for its container is corrected', () {
      final entry = job().toJson();
      final settings = entry['settings']! as Map;
      settings['container'] = 'webm';
      settings['audioCodec'] = 'aac'; // WebM cannot hold AAC.
      final raw = jsonEncode({'version': QueueStorage.schemaVersion, 'jobs': [entry]});

      final decoded = QueueStorage.decode(raw).jobs.single;
      expect(decoded.settings.audioCodec, AudioCodec.opus);
    });
  });

  group('restore', () {
    test('a job interrupted mid-encode is re-queued and its partial deleted', () {
      final fs = _Fs({'/in/a.mov', '/out/a.mp4'});
      final result = QueueStorage.restore(
        [job(status: JobStatus.running, outputPath: '/out/a.mp4')],
        exists: fs.exists,
        delete: fs.delete,
      );

      expect(result.single.status, JobStatus.queued);
      expect(result.single.progress, 0);
      expect(result.single.sessionId, isNull);
      // FFmpeg cannot resume a truncated encode, so the stub must go.
      expect(fs.deleted, ['/out/a.mp4']);
    });

    test('an interrupted job whose source also vanished fails, not re-queues', () {
      final fs = _Fs({'/out/a.mp4'});
      final result = QueueStorage.restore(
        [job(status: JobStatus.running, outputPath: '/out/a.mp4')],
        exists: fs.exists,
        delete: fs.delete,
      );

      expect(result.single.status, JobStatus.failed);
      expect(result.single.failure, JobFailure.sourceMissing);
      expect(fs.deleted, ['/out/a.mp4']);
    });

    test('a queued job with a missing source is failed with a translatable reason', () {
      final fs = _Fs({});
      final result = QueueStorage.restore([job()], exists: fs.exists, delete: fs.delete);

      expect(result.single.status, JobStatus.failed);
      expect(result.single.failure, JobFailure.sourceMissing);
      expect(fs.deleted, isEmpty);
    });

    test('a queued job whose source is still there is left alone', () {
      final fs = _Fs({'/in/a.mov'});
      final result = QueueStorage.restore([job()], exists: fs.exists, delete: fs.delete);

      expect(result.single.status, JobStatus.queued);
      expect(result.single.failure, isNull);
    });

    test('a completed job whose output the user deleted is dropped', () {
      final fs = _Fs({'/in/a.mov'});
      final result = QueueStorage.restore(
        [job(status: JobStatus.completed, outputPath: '/out/a.mp4')],
        exists: fs.exists,
        delete: fs.delete,
      );
      expect(result, isEmpty);
    });

    test('a completed job keeps its row even after its source is gone', () {
      // Only the output matters once the work is done.
      final fs = _Fs({'/out/a.mp4'});
      final result = QueueStorage.restore(
        [job(status: JobStatus.completed, outputPath: '/out/a.mp4')],
        exists: fs.exists,
        delete: fs.delete,
      );
      expect(result.single.status, JobStatus.completed);
    });

    test('cancelled and failed rows are preserved as history', () {
      final fs = _Fs({});
      final result = QueueStorage.restore(
        [
          job(id: 'c', status: JobStatus.cancelled),
          job(id: 'f', status: JobStatus.failed, failure: JobFailure.ffmpeg, errorMessage: 'x'),
        ],
        exists: fs.exists,
        delete: fs.delete,
      );
      expect(result.map((j) => j.id), ['c', 'f']);
      expect(result[1].errorMessage, 'x');
    });

    test('order is preserved across a restore', () {
      final fs = _Fs({'/in/a.mov'});
      final result = QueueStorage.restore(
        [job(id: '1'), job(id: '2'), job(id: '3')],
        exists: fs.exists,
        delete: fs.delete,
      );
      expect(result.map((j) => j.id), ['1', '2', '3']);
    });

    test('a running job with no recorded output path deletes nothing', () {
      final fs = _Fs({'/in/a.mov'});
      final result = QueueStorage.restore(
        [job(status: JobStatus.running)],
        exists: fs.exists,
        delete: fs.delete,
      );
      expect(result.single.status, JobStatus.queued);
      expect(fs.deleted, isEmpty);
    });
  });
}
