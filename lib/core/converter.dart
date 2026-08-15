import 'dart:async';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:ffmpeg_kit_flutter_new/statistics.dart';

import '../domain/conversion_settings.dart';
import '../domain/media_format.dart';
import 'ffmpeg_args.dart';
import 'quality_search.dart';
import 'still_decoder.dart';

enum ConversionOutcome { success, cancelled, failed }

/// What a source file spends per second. Any field may be null when the
/// container does not report it.
class SourceRates {
  const SourceRates({this.totalKbps, this.videoKbps, this.audioKbps});

  final int? totalKbps;
  final int? videoKbps;
  final int? audioKbps;

  /// The video rate, falling back to "everything the file spends, minus what
  /// the audio track admits to" when the video stream reports nothing.
  int? get effectiveVideoKbps {
    if (videoKbps != null) return videoKbps;
    if (totalKbps == null) return null;
    final rest = totalKbps! - (audioKbps ?? 0);
    return rest > 0 ? rest : null;
  }
}

class ConversionResult {
  const ConversionResult(this.outcome, {this.message});

  final ConversionOutcome outcome;
  final String? message;

  bool get isSuccess => outcome == ConversionOutcome.success;
}

/// Thin wrapper over FFmpegKit that turns a session into an awaitable future
/// with progress callbacks.
///
/// All work happens in FFmpeg's own native threads, off the Dart isolate, so
/// the UI stays responsive without any manual isolate plumbing.
class FFmpegConverter {
  FFmpegConverter({StillDecoder? stillDecoder})
      : _stillDecoder = stillDecoder ?? const StillDecoder();

  /// Injectable so the substitution can be exercised without a platform.
  final StillDecoder _stillDecoder;

  /// Reads the source duration in milliseconds. Returns null for stills or when
  /// the container carries no duration.
  Future<int?> probeDurationMs(String path) async {
    final session = await FFprobeKit.getMediaInformation(path);
    final info = session.getMediaInformation();
    final raw = info?.getDuration();
    if (raw == null) return null;
    final seconds = double.tryParse(raw);
    if (seconds == null || seconds <= 0) return null;
    return (seconds * 1000).round();
  }

  /// What the source spends per second, per stream. Feeds the "a conversion
  /// must never inflate the file" guarantee: constant quality has no ceiling
  /// of its own, so an already-compressed source comes out *larger* unless
  /// both streams are held to what the original spent.
  ///
  /// Either figure can be null — plenty of containers report only an overall
  /// rate — in which case the caller falls back to [SourceRates.totalKbps].
  Future<SourceRates> probeRates(String path) async {
    try {
      final session = await FFprobeKit.getMediaInformation(path);
      final info = session.getMediaInformation();
      if (info == null) return const SourceRates();

      int? kbps(String? raw) {
        if (raw == null) return null;
        final bps = int.tryParse(raw);
        if (bps == null || bps <= 0) return null;
        final k = bps ~/ 1000;
        return k > 0 ? k : null;
      }

      int? video;
      int? audio;
      for (final stream in info.getStreams()) {
        final rate = kbps(stream.getBitrate());
        if (rate == null) continue;
        if (stream.getType() == 'video') {
          video ??= rate;
        } else if (stream.getType() == 'audio') {
          audio ??= rate;
        }
      }

      return SourceRates(
        totalKbps: kbps(info.getBitrate()),
        videoKbps: video,
        audioKbps: audio,
      );
    } catch (_) {
      return const SourceRates();
    }
  }

  /// Whether the file carries an audio stream. Null when the probe itself
  /// failed — the caller must treat that as "don't know", not "no".
  Future<bool?> probeHasAudio(String path) async {
    try {
      final session = await FFprobeKit.getMediaInformation(path);
      final streams = session.getMediaInformation()?.getStreams();
      if (streams == null) return null;
      return streams.any((s) => s.getType() == 'audio');
    } catch (_) {
      return null;
    }
  }

  /// Runs one conversion to completion.
  ///
  /// [onSession] receives the session id as soon as it exists, so the caller can
  /// cancel a job that is already in flight.
  ///
  /// [onProgress] is fed a 0..1 fraction whenever FFmpeg reports statistics and
  /// [totalDurationMs] is known.
  /// [progressDurationMs] is what the statistics callback divides by — the
  /// duration of what will actually be *encoded* (after trim and speed), as
  /// opposed to [totalDurationMs], which is the raw source duration the
  /// bitrate maths needs. Passing null falls back to the raw duration.
  Future<ConversionResult> convert({
    required String inputPath,
    required String outputPath,
    required ConversionSettings settings,
    int? totalDurationMs,
    int? progressDurationMs,
    SourceRates sourceRates = const SourceRates(),
    String? hwVideoEncoder,
    List<String> extraInputPaths = const [],
    List<bool?> extraInputsHaveAudio = const [],
    List<int?> extraInputDurationsMs = const [],
    bool twoPass = false,
    void Function(int sessionId)? onSession,
    void Function(double progress)? onProgress,
  }) async {
    // Some stills reach FFmpeg only partly readable — a tiled HEIC arrives as
    // one tile of itself. Where the platform can decode the whole picture, it
    // does, and everything downstream sees an ordinary PNG. Null means nothing
    // was substituted, which is also what every non-iOS platform returns.
    final decoded = StillDecoder.worthDecoding(inputPath)
        ? await _stillDecoder.decode(inputPath)
        : null;
    try {
      return await _convertFrom(
        inputPath: decoded ?? inputPath,
        outputPath: outputPath,
        settings: settings,
        totalDurationMs: totalDurationMs,
        progressDurationMs: progressDurationMs,
        sourceRates: sourceRates,
        hwVideoEncoder: hwVideoEncoder,
        extraInputPaths: extraInputPaths,
        extraInputsHaveAudio: extraInputsHaveAudio,
        extraInputDurationsMs: extraInputDurationsMs,
        twoPass: twoPass,
        onSession: onSession,
        onProgress: onProgress,
      );
    } finally {
      // A 12-megapixel intermediate is tens of megabytes; leaving one behind
      // per photo would fill a phone over a batch. Failure to delete is not
      // worth failing a finished conversion over — the cache is purgeable.
      if (decoded != null) {
        try {
          final file = File(decoded);
          if (file.existsSync()) file.deleteSync();
        } on FileSystemException {
          // Ignored on purpose: see above.
        }
      }
    }
  }

  Future<ConversionResult> _convertFrom({
    required String inputPath,
    required String outputPath,
    required ConversionSettings settings,
    int? totalDurationMs,
    int? progressDurationMs,
    SourceRates sourceRates = const SourceRates(),
    String? hwVideoEncoder,
    List<String> extraInputPaths = const [],
    List<bool?> extraInputsHaveAudio = const [],
    List<int?> extraInputDurationsMs = const [],
    bool twoPass = false,
    void Function(int sessionId)? onSession,
    void Function(double progress)? onProgress,
  }) async {
    // A still has no bitrate to solve for, so hitting a byte budget means
    // encoding and measuring. It gets its own path entirely.
    if (settings.container.kind == MediaKind.image &&
        !settings.container.isAnimatedImage &&
        settings.sizeTargetBytes != null &&
        extraInputPaths.isEmpty) {
      return _convertImageToSize(
        inputPath: inputPath,
        outputPath: outputPath,
        settings: settings,
        onSession: onSession,
        onProgress: onProgress,
      );
    }

    if (twoPass && extraInputPaths.isEmpty) {
      return _convertTwoPass(
        inputPath: inputPath,
        outputPath: outputPath,
        settings: settings,
        totalDurationMs: totalDurationMs,
        progressDurationMs: progressDurationMs,
        onSession: onSession,
        onProgress: onProgress,
      );
    }

    final args = extraInputPaths.isEmpty
        ? FFmpegArgs.build(
            inputPath: inputPath,
            outputPath: outputPath,
            settings: settings,
            sourceDurationMs: totalDurationMs,
            sourceVideoKbps: sourceRates.effectiveVideoKbps,
            sourceAudioKbps: sourceRates.audioKbps,
            hwVideoEncoder: hwVideoEncoder,
          )
        : FFmpegArgs.buildConcat(
            inputPaths: [inputPath, ...extraInputPaths],
            outputPath: outputPath,
            settings: settings,
            inputsHaveAudio: extraInputsHaveAudio,
            inputDurationsMs: extraInputDurationsMs,
          );

    return _execute(
      args,
      totalDurationMs: progressDurationMs ?? totalDurationMs,
      onSession: onSession,
      onProgress: onProgress,
    );
  }

  /// Encodes a still repeatedly, closing in on the largest version of it that
  /// still fits [ConversionSettings.sizeTargetBytes].
  ///
  /// This is the photo half of the app's one real differentiator. The video
  /// side computes a bitrate from a duration and a budget; a JPEG has neither,
  /// so the only honest way to know what quality 70 costs is to write it and
  /// measure. A binary search over the quality scale gets there in seven
  /// encodes, and a phone photo encodes in tens of milliseconds.
  ///
  /// When no quality fits — a 12-megapixel photo will not become 100 KB by
  /// coarsening alone — the search restarts on a smaller frame. Fewer pixels
  /// is the lever that actually works, and it looks far better than quality 2.
  /// If even that misses, the smallest achievable file is returned rather than
  /// a failure: an honest result the user can see the size of beats an error
  /// message, and the UI already warns when a budget looks unreachable.
  Future<ConversionResult> _convertImageToSize({
    required String inputPath,
    required String outputPath,
    required ConversionSettings settings,
    void Function(int sessionId)? onSession,
    void Function(double progress)? onProgress,
  }) async {
    final target = settings.sizeTargetBytes!;
    const scales = [1.0, 0.7, 0.5];
    // Enough halvings to close the quality interval exactly; see QualitySearch.
    const probeBudget = 7;

    var attempts = 0;
    int? lastQuality;
    var lastScale = double.nan;

    Future<ConversionResult?> encode(int quality, double scale) async {
      lastQuality = quality;
      lastScale = scale;
      final result = await _execute(
        FFmpegArgs.build(
          inputPath: inputPath,
          outputPath: outputPath,
          settings: settings.copyWith(imageQuality: quality),
          imageDownscale: scale,
        ),
        onSession: onSession,
      );
      attempts++;
      // Each probe is a real FFmpeg session, so a cancel lands here as an
      // outcome rather than as an exception; anything but success ends it.
      return result.isSuccess ? null : result;
    }

    int sizeOf(String path) {
      try {
        return File(path).lengthSync();
      } on FileSystemException {
        return 0;
      }
    }

    for (final scale in scales) {
      final search = QualitySearch(maxSteps: probeBudget);
      while (true) {
        final quality = search.next();
        if (quality == null) break;

        final failure = await encode(quality, scale);
        if (failure != null) return failure;

        search.record(
          quality: quality,
          bytes: sizeOf(outputPath),
          targetBytes: target,
        );
        // Rough but honest: the bar moves per probe across the whole budget.
        onProgress?.call((attempts / (probeBudget * scales.length)).clamp(0.0, 0.95));
      }

      final best = search.bestFitting;
      if (best == null) continue; // Nothing fit at this size; shrink and retry.

      // The file on disk belongs to the last probe, which is rarely the winner.
      if (lastQuality != best || lastScale != scale) {
        final failure = await encode(best, scale);
        if (failure != null) return failure;
      }
      onProgress?.call(1);
      return const ConversionResult(ConversionOutcome.success);
    }

    // Unreachable budget: hand back the smallest thing this app is willing to
    // call a photo.
    final failure = await encode(QualitySearch().minQuality, scales.last);
    if (failure != null) return failure;
    onProgress?.call(1);
    return const ConversionResult(ConversionOutcome.success);
  }

  /// Two encodes of the same source: an analysis pass into a log file, then
  /// the real encode reading it. This is how x264/x265 hit a size budget
  /// precisely — at the cost of roughly double the time, which is why it is
  /// an opt-in setting rather than the default.
  Future<ConversionResult> _convertTwoPass({
    required String inputPath,
    required String outputPath,
    required ConversionSettings settings,
    int? totalDurationMs,
    int? progressDurationMs,
    void Function(int sessionId)? onSession,
    void Function(double progress)? onProgress,
  }) async {
    final passLog = '$outputPath.passlog';

    try {
      final analysis = await _execute(
        FFmpegArgs.build(
          inputPath: inputPath,
          outputPath: _nullDevice,
          settings: settings,
          sourceDurationMs: totalDurationMs,
          passNumber: 1,
          passLogFile: passLog,
        ),
        totalDurationMs: progressDurationMs ?? totalDurationMs,
        onSession: onSession,
        onProgress: (p) => onProgress?.call(p * 0.5),
      );
      if (!analysis.isSuccess) return analysis;

      return await _execute(
        FFmpegArgs.build(
          inputPath: inputPath,
          outputPath: outputPath,
          settings: settings,
          sourceDurationMs: totalDurationMs,
          passNumber: 2,
          passLogFile: passLog,
        ),
        totalDurationMs: progressDurationMs ?? totalDurationMs,
        onSession: onSession,
        onProgress: (p) => onProgress?.call(0.5 + p * 0.5),
      );
    } finally {
      // x264 writes "<log>-0.log" (and .mbtree); best-effort cleanup either way.
      for (final suffix in ['-0.log', '-0.log.mbtree', '']) {
        try {
          final f = File('$passLog$suffix');
          if (f.existsSync()) f.deleteSync();
        } on FileSystemException {
          // Temp junk; the OS will get to it eventually.
        }
      }
    }
  }

  static String get _nullDevice => Platform.isWindows ? 'NUL' : '/dev/null';

  Future<ConversionResult> _execute(
    List<String> args, {
    int? totalDurationMs,
    void Function(int sessionId)? onSession,
    void Function(double progress)? onProgress,
  }) async {
    final completer = Completer<ConversionResult>();

    // FFmpeg reports statistics several times a second. Forwarding every one
    // of them rebuilds the queue UI for a change nobody can see, so progress
    // is only published when it moves a visible amount — the ring shows whole
    // percentages — or when a slow encode has been quiet for a while.
    var lastPublished = -1.0;
    var lastPublishedAt = DateTime.now();

    void onStatistics(Statistics stats) {
      if (totalDurationMs == null || totalDurationMs <= 0) return;
      final fraction = (stats.getTime() / totalDurationMs).clamp(0.0, 1.0);

      final now = DateTime.now();
      final movedEnough = (fraction - lastPublished).abs() >= 0.01;
      final waitedEnough = now.difference(lastPublishedAt) >= const Duration(milliseconds: 500);
      if (!movedEnough && !waitedEnough) return;

      lastPublished = fraction;
      lastPublishedAt = now;
      onProgress?.call(fraction);
    }

    final session = await FFmpegKit.executeWithArgumentsAsync(
      args,
      (session) async {
        final returnCode = await session.getReturnCode();
        if (ReturnCode.isSuccess(returnCode)) {
          onProgress?.call(1);
          completer.complete(const ConversionResult(ConversionOutcome.success));
        } else if (ReturnCode.isCancel(returnCode)) {
          completer.complete(const ConversionResult(ConversionOutcome.cancelled));
        } else {
          // The tail of the log is what actually explains an FFmpeg failure;
          // it stays on-device and is only surfaced in the UI.
          final logs = await session.getLogsAsString();
          completer.complete(
            ConversionResult(ConversionOutcome.failed, message: _lastMeaningfulLine(logs)),
          );
        }
      },
      null,
      onStatistics,
    );

    final id = session.getSessionId();
    if (id != null) onSession?.call(id);

    return completer.future;
  }

  Future<void> cancel(int sessionId) => FFmpegKit.cancel(sessionId);

  Future<void> cancelAll() => FFmpegKit.cancel();

  static String _lastMeaningfulLine(String logs) {
    final lines = logs
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();
    if (lines.isEmpty) return 'FFmpeg failed with no output.';
    return lines.last;
  }
}
