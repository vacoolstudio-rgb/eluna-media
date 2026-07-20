import 'package:flutter/material.dart';

import '../../core/output_paths.dart';
import '../../domain/conversion_job.dart';
import '../../domain/conversion_settings.dart';
import '../../domain/media_format.dart';
import '../../l10n/app_localizations.dart';

/// One line per setting that actually applies to this job — what a user who
/// queued eight files an hour ago needs in order to remember what they asked
/// for. Only settings the conversion will really use are listed: no CRF on a
/// remux, no subtitle row on an MP3.
String _levelName(L10n l10n, EnhanceLevel level) => switch (level) {
      EnhanceLevel.none => l10n.enhanceOff,
      EnhanceLevel.light => l10n.enhanceLight,
      EnhanceLevel.medium => l10n.enhanceMedium,
      EnhanceLevel.strong => l10n.enhanceStrong,
    };

List<String> summariseSettings(L10n l10n, ConversionJob job) {
  final s = job.settings;
  final out = <String>[];

  out.add('${s.container.label}  ·  .${s.container.extension}');

  if (job.isMerge) {
    out.add(l10n.summaryMerge(job.extraInputPaths.length + 1));
  }

  final kind = s.container.kind;
  final reencoding = s.videoCodec != VideoCodec.copy && s.videoCodec != VideoCodec.none;

  if (kind == MediaKind.video) {
    out.add('${l10n.videoCodec}: ${s.videoCodec.label}');
    if (reencoding) {
      out.add(switch (s.rateControl) {
        RateControl.quality => '${l10n.rateControlQuality}: ${l10n.summaryQuality(s.crf)}',
        RateControl.bitrate =>
          '${l10n.rateControlBitrate}: ${l10n.summaryBitrate(s.videoBitrateKbps)}',
        RateControl.size => s.sizeTargetBytes == null
            ? l10n.rateControlSize
            : '${l10n.rateControlSize}: '
                '${l10n.summaryTargetSize(OutputPaths.humanBytes(s.sizeTargetBytes!))}',
      });
      if (s.resolution != ResolutionPreset.keep) {
        out.add('${l10n.resolution}: ${s.resolution.label}');
      }
      if (s.fps != FpsPreset.keep) out.add('${l10n.frameRate}: ${s.fps.label}');
    }
    if (s.keepSubtitles) out.add(l10n.keepSubtitles);
  }

  if (kind != MediaKind.image && s.audioCodec != AudioCodec.none) {
    final bitrate = s.audioCodec.supportsBitrate
        ? '  ·  ${l10n.summaryBitrate(s.audioBitrateKbps)}'
        : '';
    out.add('${l10n.audioCodec}: ${s.audioCodec.label}$bitrate');
  }

  if (kind == MediaKind.image) {
    if (s.resolution != ResolutionPreset.keep) {
      out.add('${l10n.resolution}: ${s.resolution.label}');
    }
    if (s.container == ContainerFormat.jpg ||
        (s.container == ContainerFormat.webp && !s.lossless)) {
      out.add(l10n.imageQuality(s.imageQuality));
    }
    if (s.lossless) out.add(l10n.lossless);
    if (!s.container.isAnimatedImage) {
      if (s.sharpen.isOn) {
        out.add('${l10n.sharpenLabel}: ${_levelName(l10n, s.sharpen)}');
      }
      if (s.denoise.isOn) {
        out.add('${l10n.denoiseLabel}: ${_levelName(l10n, s.denoise)}');
      }
      if (s.autoColor) out.add(l10n.autoColorLabel);
      if (s.upscaleActive) out.add(l10n.upscaleLabel);
    }
  }

  if (s.rotate != RotatePreset.none) out.add('${l10n.rotateLabel}: ${s.rotate.label}');
  if (s.flipH) out.add(l10n.flipLabel);
  if (s.crop.isChanged) out.add('${l10n.cropLabel}: ${s.crop.label}');
  if (s.speed.isChanged) out.add('${l10n.speedLabel}: ${s.speed.label}');
  if (s.volumePercent != 100) out.add(l10n.volumeLabel(s.volumePercent));

  if (s.trim case final trim? when trim.isValid) {
    String mmss(int ms) {
      final total = ms ~/ 1000;
      return '${total ~/ 60}:${(total % 60).toString().padLeft(2, '0')}';
    }

    out.add('${l10n.sectionTrim}: ${l10n.trimRangeLabel(mmss(trim.startMs), mmss(trim.endMs))}');
  }

  if (s.stripMetadata) out.add(l10n.summaryMetadataStripped);

  return out;
}

/// The two or three facts worth showing without opening anything: what it is
/// becoming, and how.
List<String> summaryChips(L10n l10n, ConversionJob job) {
  final s = job.settings;
  final chips = <String>['.${s.container.extension}'];

  if (s.container.kind == MediaKind.video &&
      s.videoCodec != VideoCodec.none &&
      s.videoCodec != VideoCodec.copy) {
    chips.add(s.videoCodec.label.split(' / ').first);
    if (s.rateControl == RateControl.size && s.sizeTargetBytes != null) {
      chips.add(l10n.summaryTargetSize(OutputPaths.humanBytes(s.sizeTargetBytes!)));
    } else if (s.rateControl == RateControl.bitrate) {
      chips.add(l10n.summaryBitrate(s.videoBitrateKbps));
    } else {
      chips.add(l10n.summaryQuality(s.crf));
    }
  } else if (s.container.kind == MediaKind.audio && s.audioCodec.supportsBitrate) {
    chips.add(l10n.summaryBitrate(s.audioBitrateKbps));
  } else if (s.container.kind == MediaKind.image &&
      (s.container == ContainerFormat.jpg || s.container == ContainerFormat.webp)) {
    if (!s.lossless) chips.add(l10n.imageQuality(s.imageQuality));
  }

  if (s.container.kind == MediaKind.image && !s.container.isAnimatedImage && s.enhances) {
    chips.add(l10n.summaryEnhanced);
  }

  if (s.resolution != ResolutionPreset.keep) {
    chips.add(s.resolution.label.split(' ').first);
  } else if (s.upscaleActive) {
    // A doubled photo is worth a chip of its own: it is the one enhancement
    // that changes the pixel dimensions the user gets back.
    chips.add(l10n.upscaleChip);
  }

  return chips;
}

/// A compact, muted pill for one summary fact.
class SummaryChip extends StatelessWidget {
  const SummaryChip({super.key, required this.label, this.accent});

  final String label;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = accent ?? theme.colorScheme.onSurfaceVariant;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
