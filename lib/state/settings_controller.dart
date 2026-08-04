import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/conversion_settings.dart';
import '../domain/media_format.dart';

/// Overridden in `main()` once SharedPreferences has loaded.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider must be overridden'),
);

T _enumFromName<T extends Enum>(List<T> values, String? name, T fallback) {
  if (name == null) return fallback;
  for (final v in values) {
    if (v.name == name) return v;
  }
  return fallback;
}

/// The conversion profile the user last used, restored across launches.
class SettingsController extends Notifier<ConversionSettings> {
  static const _kContainer = 'settings.container';
  static const _kVideoCodec = 'settings.videoCodec';
  static const _kAudioCodec = 'settings.audioCodec';
  static const _kRateControl = 'settings.rateControl';
  static const _kCrf = 'settings.crf';
  static const _kVideoBitrate = 'settings.videoBitrate';
  static const _kAudioBitrate = 'settings.audioBitrate';
  static const _kPreset = 'settings.preset';
  static const _kResolution = 'settings.resolution';
  static const _kFps = 'settings.fps';
  static const _kImageQuality = 'settings.imageQuality';
  static const _kLossless = 'settings.lossless';
  static const _kStripMetadata = 'settings.stripMetadata';
  static const _kKeepSubtitles = 'settings.keepSubtitles';
  static const _kImageScale = 'settings.imageScale';
  static const _kAudioChannels = 'settings.audioChannels';
  static const _kSampleRate = 'settings.sampleRate';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  ConversionSettings build() {
    final p = _prefs;
    final container = _enumFromName(
      ContainerFormat.values,
      p.getString(_kContainer),
      ContainerFormat.mp4,
    );
    final defaults = ConversionSettings.defaultsFor(container);

    // Codecs are validated against the container: a stored pair could have been
    // written by an older build with different rules.
    final videoCodec =
        _enumFromName(VideoCodec.values, p.getString(_kVideoCodec), defaults.videoCodec);
    final audioCodec =
        _enumFromName(AudioCodec.values, p.getString(_kAudioCodec), defaults.audioCodec);

    return ConversionSettings(
      container: container,
      videoCodec: ContainerRules.allowsVideo(container, videoCodec)
          ? videoCodec
          : defaults.videoCodec,
      audioCodec: ContainerRules.allowsAudio(container, audioCodec)
          ? audioCodec
          : defaults.audioCodec,
      rateControl:
          _enumFromName(RateControl.values, p.getString(_kRateControl), RateControl.quality),
      crf: p.getInt(_kCrf) ?? 23,
      videoBitrateKbps: p.getInt(_kVideoBitrate) ?? 2500,
      audioBitrateKbps: p.getInt(_kAudioBitrate) ?? 128,
      preset: _enumFromName(EncodingPreset.values, p.getString(_kPreset), EncodingPreset.medium),
      resolution:
          _enumFromName(ResolutionPreset.values, p.getString(_kResolution), ResolutionPreset.keep),
      fps: _enumFromName(FpsPreset.values, p.getString(_kFps), FpsPreset.keep),
      imageQuality: p.getInt(_kImageQuality) ?? 90,
      lossless: p.getBool(_kLossless) ?? false,
      stripMetadata: p.getBool(_kStripMetadata) ?? true,
      keepSubtitles: p.getBool(_kKeepSubtitles) ?? false,
      imageScale: _enumFromName(ImageScale.values, p.getString(_kImageScale), ImageScale.keep),
      audioChannels: _enumFromName(
        AudioChannels.values,
        p.getString(_kAudioChannels),
        AudioChannels.keep,
      ),
      sampleRate: _enumFromName(SampleRate.values, p.getString(_kSampleRate), SampleRate.keep),
    );
  }

  void _persist(ConversionSettings s) {
    final p = _prefs;
    p.setString(_kContainer, s.container.name);
    p.setString(_kVideoCodec, s.videoCodec.name);
    p.setString(_kAudioCodec, s.audioCodec.name);
    p.setString(_kRateControl, s.rateControl.name);
    p.setInt(_kCrf, s.crf);
    p.setInt(_kVideoBitrate, s.videoBitrateKbps);
    p.setInt(_kAudioBitrate, s.audioBitrateKbps);
    p.setString(_kPreset, s.preset.name);
    p.setString(_kResolution, s.resolution.name);
    p.setString(_kFps, s.fps.name);
    p.setInt(_kImageQuality, s.imageQuality);
    p.setBool(_kLossless, s.lossless);
    p.setBool(_kStripMetadata, s.stripMetadata);
    p.setBool(_kKeepSubtitles, s.keepSubtitles);
    p.setString(_kImageScale, s.imageScale.name);
    p.setString(_kAudioChannels, s.audioChannels.name);
    p.setString(_kSampleRate, s.sampleRate.name);
  }

  void update(ConversionSettings next) {
    state = next;
    _persist(next);
  }

  /// Switching container re-validates the codec pair rather than letting an
  /// illegal combination reach FFmpeg.
  void setContainer(ContainerFormat container) => update(state.withContainer(container));

  void setVideoCodec(VideoCodec c) => update(state.copyWith(videoCodec: c));
  void setAudioCodec(AudioCodec c) => update(state.copyWith(audioCodec: c));
  void setRateControl(RateControl r) => update(state.copyWith(rateControl: r));
  void setCrf(int v) => update(state.copyWith(crf: v));
  void setVideoBitrate(int kbps) => update(state.copyWith(videoBitrateKbps: kbps));
  void setAudioBitrate(int kbps) => update(state.copyWith(audioBitrateKbps: kbps));
  void setPreset(EncodingPreset p) => update(state.copyWith(preset: p));
  void setResolution(ResolutionPreset r) => update(state.copyWith(resolution: r));
  void setFps(FpsPreset f) => update(state.copyWith(fps: f));
  void setImageQuality(int q) => update(state.copyWith(imageQuality: q));
  void setLossless(bool v) => update(state.copyWith(lossless: v));
  void setSharpen(EnhanceLevel l) => update(state.copyWith(sharpen: l));
  void setDenoise(EnhanceLevel l) => update(state.copyWith(denoise: l));
  void setAutoColor(bool v) => update(state.copyWith(autoColor: v));
  void setUpscale2x(bool v) => update(state.copyWith(upscale2x: v));
  void setStripMetadata(bool v) => update(state.copyWith(stripMetadata: v));
  void setKeepSubtitles(bool v) => update(state.copyWith(keepSubtitles: v));
  void setCapBitrateToSource(bool v) => update(state.copyWith(capBitrateToSource: v));
  void setImageScale(ImageScale s) => update(state.copyWith(imageScale: s));
  void setAudioChannels(AudioChannels c) => update(state.copyWith(audioChannels: c));
  void setSampleRate(SampleRate r) => update(state.copyWith(sampleRate: r));

  // Transforms and trim are decisions about *this* batch, so they are held in
  // memory only: update() persists the shared keys above, and these fields
  // simply have none. Nobody wants last week's rotation applied to today's
  // files.
  void setRotate(RotatePreset r) => update(state.copyWith(rotate: r));
  void setFlipH(bool v) => update(state.copyWith(flipH: v));
  void setSpeed(SpeedPreset s) => update(state.copyWith(speed: s));
  void setCrop(CropPreset c) => update(state.copyWith(crop: c));
  void setVolumePercent(int v) => update(state.copyWith(volumePercent: v.clamp(0, 200)));
  void setTrim(TrimRange range) => update(state.copyWith(trim: range));
  void clearTrim() => update(state.copyWith(clearTrim: true));
}

final settingsProvider =
    NotifierProvider<SettingsController, ConversionSettings>(SettingsController.new);

// -----------------------------------------------------------------------------
// App-level preferences (theme, language)
// -----------------------------------------------------------------------------

/// How hard the video encoders may work. This maps directly onto the x264/
/// x265 `-preset` flag and nothing else — no hidden throttling, no quality
/// downgrades. Battery drain is the category's #5 complaint, and this is the
/// one honest knob that controls it.
enum PowerMode {
  /// `ultrafast`: coolest and fastest, biggest files.
  efficiency,

  /// `veryfast`: the sweet spot for phone hardware.
  balanced,

  /// `medium`: best compression, hottest device.
  quality;

  EncodingPreset get encodingPreset => switch (this) {
        PowerMode.efficiency => EncodingPreset.ultrafast,
        PowerMode.balanced => EncodingPreset.veryfast,
        PowerMode.quality => EncodingPreset.medium,
      };
}

class AppPrefs {
  const AppPrefs({
    this.themeMode = ThemeMode.system,
    this.localeCode,
    this.oledDark = false,
    this.dynamicColor = false,
    this.hapticsEnabled = true,
    this.powerMode = PowerMode.balanced,
    this.useHardwareEncoder = true,
    this.twoPassFitToSize = false,
    this.simpleMode = true,
    this.autoSaveResults = true,
  });

  /// Copy every finished output into the gallery (or Downloads, for audio) as
  /// soon as it is done.
  ///
  /// On by default. Conversions land in the app's own folder, which is correct
  /// — nothing reaches shared storage by accident — but that folder is inside
  /// the sandbox and no file manager can reach it, so the honest default is
  /// the one where the result appears where the user already looks. "I can't
  /// find my file" is the category's most common complaint, and it is entirely
  /// self-inflicted.
  final bool autoSaveResults;

  final ThemeMode themeMode;

  /// Null means "follow the system language".
  final String? localeCode;

  /// Pure-black dark surfaces for OLED panels.
  final bool oledDark;

  /// Material You wallpaper colors where the platform offers them.
  final bool dynamicColor;

  final bool hapticsEnabled;

  final PowerMode powerMode;

  /// Prefer the device's hardware video encoder (MediaCodec/VideoToolbox)
  /// where the FFmpeg build has one and the job is bitrate-driven. Faster and
  /// far cooler than x264/x265; constant-quality jobs stay on software, and a
  /// failed hardware job silently retries on software.
  final bool useHardwareEncoder;

  /// Two-pass encoding for fit-to-size jobs: hits the byte budget noticeably
  /// more precisely at roughly double the encode time. Off by default — the
  /// time cost surprises people; the single-pass safety margin already lands
  /// under the limit.
  final bool twoPassFitToSize;

  /// Simple (preset cards) vs Advanced (full codec controls) on the Convert
  /// tab. Simple is the default: presets first, power one tap deeper.
  final bool simpleMode;

  Locale? get locale => localeCode == null ? null : Locale(localeCode!);

  AppPrefs copyWith({
    ThemeMode? themeMode,
    String? localeCode,
    bool clearLocale = false,
    bool? oledDark,
    bool? dynamicColor,
    bool? hapticsEnabled,
    PowerMode? powerMode,
    bool? useHardwareEncoder,
    bool? twoPassFitToSize,
    bool? simpleMode,
    bool? autoSaveResults,
  }) =>
      AppPrefs(
        themeMode: themeMode ?? this.themeMode,
        localeCode: clearLocale ? null : (localeCode ?? this.localeCode),
        oledDark: oledDark ?? this.oledDark,
        dynamicColor: dynamicColor ?? this.dynamicColor,
        hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
        powerMode: powerMode ?? this.powerMode,
        useHardwareEncoder: useHardwareEncoder ?? this.useHardwareEncoder,
        twoPassFitToSize: twoPassFitToSize ?? this.twoPassFitToSize,
        simpleMode: simpleMode ?? this.simpleMode,
        autoSaveResults: autoSaveResults ?? this.autoSaveResults,
      );
}

class AppPrefsController extends Notifier<AppPrefs> {
  static const _kThemeMode = 'app.themeMode';
  static const _kLocale = 'app.locale';
  static const _kOledDark = 'app.oledDark';
  static const _kDynamicColor = 'app.dynamicColor';
  static const _kHaptics = 'app.haptics';
  static const _kPowerMode = 'app.powerMode';
  static const _kHwEncoder = 'app.useHardwareEncoder';
  static const _kTwoPass = 'app.twoPassFitToSize';
  static const _kSimpleMode = 'app.simpleMode';
  static const _kAutoSave = 'app.autoSaveResults';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  AppPrefs build() {
    final p = _prefs;
    return AppPrefs(
      themeMode: _enumFromName(ThemeMode.values, p.getString(_kThemeMode), ThemeMode.system),
      localeCode: p.getString(_kLocale),
      oledDark: p.getBool(_kOledDark) ?? false,
      dynamicColor: p.getBool(_kDynamicColor) ?? false,
      hapticsEnabled: p.getBool(_kHaptics) ?? true,
      powerMode: _enumFromName(PowerMode.values, p.getString(_kPowerMode), PowerMode.balanced),
      useHardwareEncoder: p.getBool(_kHwEncoder) ?? true,
      twoPassFitToSize: p.getBool(_kTwoPass) ?? false,
      simpleMode: p.getBool(_kSimpleMode) ?? true,
      autoSaveResults: p.getBool(_kAutoSave) ?? true,
    );
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _prefs.setString(_kThemeMode, mode.name);
  }

  void setLocale(String? code) {
    state = state.copyWith(localeCode: code, clearLocale: code == null);
    if (code == null) {
      _prefs.remove(_kLocale);
    } else {
      _prefs.setString(_kLocale, code);
    }
  }

  void setOledDark(bool v) {
    state = state.copyWith(oledDark: v);
    _prefs.setBool(_kOledDark, v);
  }

  void setDynamicColor(bool v) {
    state = state.copyWith(dynamicColor: v);
    _prefs.setBool(_kDynamicColor, v);
  }

  void setHapticsEnabled(bool v) {
    state = state.copyWith(hapticsEnabled: v);
    _prefs.setBool(_kHaptics, v);
  }

  void setPowerMode(PowerMode mode) {
    state = state.copyWith(powerMode: mode);
    _prefs.setString(_kPowerMode, mode.name);
  }

  void setUseHardwareEncoder(bool v) {
    state = state.copyWith(useHardwareEncoder: v);
    _prefs.setBool(_kHwEncoder, v);
  }

  void setTwoPassFitToSize(bool v) {
    state = state.copyWith(twoPassFitToSize: v);
    _prefs.setBool(_kTwoPass, v);
  }

  void setSimpleMode(bool v) {
    state = state.copyWith(simpleMode: v);
    _prefs.setBool(_kSimpleMode, v);
  }

  void setAutoSaveResults(bool v) {
    state = state.copyWith(autoSaveResults: v);
    _prefs.setBool(_kAutoSave, v);
  }
}

final appPrefsProvider = NotifierProvider<AppPrefsController, AppPrefs>(AppPrefsController.new);
