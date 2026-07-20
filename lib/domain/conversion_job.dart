import 'conversion_settings.dart';

enum JobStatus { queued, running, completed, failed, cancelled }

/// Why a job failed, when the reason is something the app knows about rather
/// than a line of FFmpeg output.
enum JobFailure {
  /// FFmpeg rejected the job; [ConversionJob.errorMessage] holds its last line.
  ffmpeg,

  /// The source file is gone. Picked files live in a cache directory the system
  /// may clear, so a restored queue can outlive its own inputs.
  sourceMissing,
}

extension JobStatusX on JobStatus {
  bool get isTerminal =>
      this == JobStatus.completed ||
      this == JobStatus.failed ||
      this == JobStatus.cancelled;

  bool get isActive => this == JobStatus.running;
}

/// One file's trip through the converter. Immutable; the queue replaces the
/// instance on every state change.
class ConversionJob {
  const ConversionJob({
    required this.id,
    required this.inputPath,
    required this.inputName,
    required this.settings,
    this.status = JobStatus.queued,
    this.progress = 0,
    this.outputPath,
    this.errorMessage,
    this.failure,
    this.sessionId,
    this.inputBytes = 0,
    this.outputBytes = 0,
    this.sourceDurationMs,
    this.extraInputPaths = const [],
    this.startedAtMs,
  });

  final String id;
  final String inputPath;
  final String inputName;
  final ConversionSettings settings;

  /// Additional sources concatenated after [inputPath]. Non-empty makes this
  /// a merge job: N inputs, one output.
  final List<String> extraInputPaths;

  bool get isMerge => extraInputPaths.isNotEmpty;

  final JobStatus status;

  /// 0.0 .. 1.0. Stays at 0 for stills, where FFmpeg reports no useful
  /// intermediate statistics. Not persisted: a restored job starts over.
  final double progress;

  /// Assigned before the encode begins, so a job interrupted by process death
  /// can have its truncated output cleaned up on the next launch.
  final String? outputPath;

  final String? errorMessage;
  final JobFailure? failure;

  /// FFmpegKit session handle, needed to cancel a running job.
  final int? sessionId;

  final int inputBytes;
  final int outputBytes;

  /// Source length, used to turn FFmpeg's `time=` statistic into a percentage.
  /// Null for stills.
  final int? sourceDurationMs;

  /// When the encode began. Transient — a restored job starts over, so a
  /// persisted start time would only produce a nonsense estimate.
  final int? startedAtMs;

  /// Seconds left, extrapolated from how long the job has taken to reach its
  /// current progress. Null until there is enough signal to be honest about:
  /// a still image reports no timeline, and the first fraction of a percent
  /// of a long encode says nothing about the rest of it.
  Duration? estimatedRemaining({DateTime? now}) {
    if (status != JobStatus.running) return null;
    final started = startedAtMs;
    if (started == null || sourceDurationMs == null) return null;
    if (progress < 0.02) return null;

    final elapsedMs = (now ?? DateTime.now()).millisecondsSinceEpoch - started;
    if (elapsedMs <= 0) return null;
    final remainingMs = elapsedMs * (1 - progress) / progress;
    if (!remainingMs.isFinite || remainingMs < 0) return null;
    return Duration(milliseconds: remainingMs.round());
  }

  /// Negative means the output grew. Null until the job completes.
  double? get sizeDeltaRatio {
    if (status != JobStatus.completed || inputBytes <= 0 || outputBytes <= 0) {
      return null;
    }
    return 1 - (outputBytes / inputBytes);
  }

  ConversionJob copyWith({
    JobStatus? status,
    double? progress,
    String? outputPath,
    String? errorMessage,
    JobFailure? failure,
    int? sessionId,
    int? inputBytes,
    int? outputBytes,
    int? sourceDurationMs,
    ConversionSettings? settings,
    int? startedAtMs,
    bool clearError = false,
    bool clearSession = false,
  }) {
    return ConversionJob(
      id: id,
      inputPath: inputPath,
      inputName: inputName,
      settings: settings ?? this.settings,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      outputPath: outputPath ?? this.outputPath,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      failure: clearError ? null : (failure ?? this.failure),
      sessionId: clearSession ? null : (sessionId ?? this.sessionId),
      inputBytes: inputBytes ?? this.inputBytes,
      outputBytes: outputBytes ?? this.outputBytes,
      sourceDurationMs: sourceDurationMs ?? this.sourceDurationMs,
      extraInputPaths: extraInputPaths,
      startedAtMs: startedAtMs ?? this.startedAtMs,
    );
  }

  /// Transient fields — `progress` and `sessionId` — are deliberately omitted:
  /// an FFmpegKit session cannot outlive the process that created it.
  Map<String, Object?> toJson() => {
        'id': id,
        'inputPath': inputPath,
        'inputName': inputName,
        'settings': settings.toJson(),
        'status': status.name,
        if (outputPath != null) 'outputPath': outputPath,
        if (errorMessage != null) 'errorMessage': errorMessage,
        if (failure != null) 'failure': failure!.name,
        'inputBytes': inputBytes,
        'outputBytes': outputBytes,
        if (sourceDurationMs != null) 'sourceDurationMs': sourceDurationMs,
        if (extraInputPaths.isNotEmpty) 'extraInputs': extraInputPaths,
      };

  /// Returns null when the entry is too malformed to be worth resurrecting.
  /// The whole body is guarded: a wrong-typed field deep inside (a corrupt
  /// store, a future build's schema) must cost one queue entry, never the
  /// launch — `QueueController.build()` runs this on every start.
  static ConversionJob? fromJson(Object? json) {
    try {
      return _fromJsonUnsafe(json);
    } catch (_) {
      return null;
    }
  }

  static ConversionJob? _fromJsonUnsafe(Object? json) {
    if (json is! Map) return null;
    final id = json['id'];
    final inputPath = json['inputPath'];
    final inputName = json['inputName'];
    final settings = json['settings'];
    if (id is! String || inputPath is! String || inputName is! String || settings is! Map) {
      return null;
    }

    return ConversionJob(
      id: id,
      inputPath: inputPath,
      inputName: inputName,
      settings: ConversionSettings.fromJson(Map<String, Object?>.from(settings)),
      status: enumByName(JobStatus.values, json['status'], JobStatus.queued),
      outputPath: json['outputPath'] as String?,
      errorMessage: json['errorMessage'] as String?,
      failure: json['failure'] == null
          ? null
          : enumByName(JobFailure.values, json['failure'], JobFailure.ffmpeg),
      inputBytes: json['inputBytes'] as int? ?? 0,
      outputBytes: json['outputBytes'] as int? ?? 0,
      sourceDurationMs: json['sourceDurationMs'] as int?,
      extraInputPaths: [
        if (json['extraInputs'] is List)
          for (final p in json['extraInputs'] as List)
            if (p is String) p,
      ],
    );
  }
}
