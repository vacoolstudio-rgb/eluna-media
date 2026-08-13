/// Подписи кодеков и контейнеров для экрана.
///
/// Каталог в `lib/domain` — чистый Dart без зависимостей, чтобы его можно было
/// гонять на host VM, поэтому переводов он не знает и знать не должен: его
/// `label` — это имя формата (`H.264 / AVC`, `WebP`), а имена форматов не
/// переводятся ни в одном языке.
///
/// Но у части значений подпись — не имя, а английское слово: `Copy`,
/// `No audio`, `(lossless)`, `(animated)`. Они и переводятся здесь. Так
/// перевод оказывается ровно в одном месте, а не в выпадающем списке отдельно
/// от сводки настроек — эти два места разошлись бы на первой же правке.
library;

import '../domain/media_format.dart';
import '../domain/quick_presets.dart';
import '../l10n/app_localizations.dart';

String videoCodecLabel(L10n l10n, VideoCodec c) => switch (c) {
      VideoCodec.copy => l10n.codecCopyRemux,
      VideoCodec.none => l10n.codecNoVideo,
      _ => c.label,
    };

/// Короткая форма для чипа: из `H.264 / AVC` берётся `H.264`. У переводимых
/// значений резать нечего — перевод и так короткий, а `split` по ` / ` над
/// «Копировать» дал бы то же самое слово, только случайно.
String videoCodecShort(L10n l10n, VideoCodec c) => switch (c) {
      VideoCodec.copy => l10n.codecCopy,
      VideoCodec.none => l10n.codecNoVideo,
      _ => c.label.split(' / ').first,
    };

String audioCodecLabel(L10n l10n, AudioCodec c) => switch (c) {
      AudioCodec.copy => l10n.codecCopy,
      AudioCodec.none => l10n.codecNoAudio,
      // Слово «без потерь» отделено от имени кодека: имя остаётся собой на всех
      // языках, переводится только пояснение.
      AudioCodec.flac => l10n.codecLossless('FLAC'),
      AudioCodec.alac => l10n.codecLossless('ALAC'),
      AudioCodec.pcm16 => l10n.codecLossless('PCM 16-bit'),
      _ => c.label,
    };

String containerLabel(L10n l10n, ContainerFormat f) =>
    f == ContainerFormat.webpAnimated ? l10n.formatAnimated('WebP') : f.label;

/// Имя сервиса у размерного пресета. Discord и WhatsApp — торговые марки и
/// остаются собой; «Email» — обычное слово, и в списке рядом с двумя марками
/// оно единственное, что читается по-английски в русском интерфейсе.
String? sizeTargetService(L10n l10n, SizeTarget t) =>
    t == SizeTarget.email ? l10n.sizeTargetEmail : t.service;
