// CupertinoPageTransitionsBuilder lives in the cupertino library, not material.
import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';

/// The Eluna visual language, shared with the other apps in the family.
///
/// Two things make it look like itself, and neither is a seed color:
///  * **hand-authored color schemes**, so nothing is left to Material's
///    harmoniser — `ColorScheme.fromSeed` is deliberately never called;
///  * **transparent scaffolds over an ambient gradient canvas**
///    ([AmbientBackground]), which every screen lets show through.
///
/// `surfaceTint: transparent` on both schemes kills Material 3's elevation
/// tinting, which would otherwise wash the accent colors over every surface.
abstract final class AppTheme {
  static const _fontFamily = 'Manrope';

  // Brand.
  static const primary = Color(0xFF7C3AED); // violet 600
  static const secondary = Color(0xFFA855F7); // purple 500
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFEF4444);
  static const info = Color(0xFF42A5F5);

  /// The signature gradient: primary CTAs, selected states, badges.
  static const brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C3AED), Color(0xFFA855F7)],
  );

  /// A finished conversion is green, and says so.
  static const successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF16A34A), Color(0xFF22C55E)],
  );

  /// Hairline that gives a card a defined edge instead of melting into the
  /// canvas behind it.
  static Color cardBorder(bool isDark) =>
      isDark ? const Color(0x14FFFFFF) : const Color(0x0F111827);

  static ThemeData light({ColorScheme? dynamicScheme}) =>
      _build(dynamicScheme ?? _lightScheme, Brightness.light);

  static ThemeData dark({ColorScheme? dynamicScheme, bool oled = false}) {
    var scheme = dynamicScheme ?? _darkScheme;
    if (oled) {
      // True black saves real power on OLED panels — worth having in an app
      // whose whole job is long CPU burns. The containers stay a shade above
      // black so cards still read as cards.
      scheme = scheme.copyWith(
        surface: Colors.black,
        surfaceContainerLowest: Colors.black,
        surfaceContainerLow: const Color(0xFF0A0A0C),
        surfaceContainer: const Color(0xFF101014),
        surfaceContainerHigh: const Color(0xFF17171D),
        surfaceContainerHighest: const Color(0xFF212129),
      );
    }
    return _build(scheme, Brightness.dark);
  }

  static const _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF3A2A66),
    onPrimaryContainer: Color(0xFFE3D7FF),
    secondary: secondary,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFF332A4D),
    onSecondaryContainer: Color(0xFFEBDCFF),
    tertiary: info,
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFF17384F),
    onTertiaryContainer: Color(0xFFD3ECFF),
    error: danger,
    onError: Colors.white,
    errorContainer: Color(0xFF4A1D1D),
    onErrorContainer: Color(0xFFFFD9D6),
    surface: Color(0xFF0D0F17),
    onSurface: Color(0xF2FFFFFF),
    onSurfaceVariant: Color(0xCCFFFFFF),
    surfaceContainerLowest: Color(0xFF090B11),
    surfaceContainerLow: Color(0xFF141821),
    surfaceContainer: Color(0xFF181C26),
    surfaceContainerHigh: Color(0xFF1F2430),
    surfaceContainerHighest: Color(0xFF2A3140),
    outline: Color(0x8AFFFFFF),
    outlineVariant: Color(0x33FFFFFF),
    surfaceTint: Colors.transparent,
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Color(0xFFE6E8EE),
    onInverseSurface: Color(0xFF1B1F2A),
    inversePrimary: Color(0xFF5B21B6),
  );

  static const _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFEDE4FF),
    onPrimaryContainer: Color(0xFF3A1E70),
    secondary: secondary,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFF1E6FF),
    onSecondaryContainer: Color(0xFF42206E),
    tertiary: info,
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFDDEEFC),
    onTertiaryContainer: Color(0xFF10394F),
    error: danger,
    onError: Colors.white,
    errorContainer: Color(0xFFFDE2E1),
    onErrorContainer: Color(0xFF7A1A1A),
    surface: Color(0xFFF4F6FA),
    onSurface: Color(0xFF0F172A),
    onSurfaceVariant: Color(0xFF475569),
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: Colors.white,
    surfaceContainer: Colors.white,
    surfaceContainerHigh: Color(0xFFEAEEF4),
    surfaceContainerHighest: Color(0xFFDFE5EE),
    outline: Color(0xFF8A93A3),
    outlineVariant: Color(0xFFD4D9E2),
    surfaceTint: Colors.transparent,
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Color(0xFF1B1F2A),
    onInverseSurface: Colors.white,
    inversePrimary: Color(0xFFC4B5FD),
  );

  static ThemeData _build(ColorScheme scheme, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final cardColor = isDark ? scheme.surfaceContainer : Colors.white;

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: brightness,
    );
    final textTheme = _textTheme(base.textTheme, scheme).apply(fontFamily: _fontFamily);

    return base.copyWith(
      // Transparent, so the AmbientBackground wrapped around each screen shows
      // through. No screen may set an opaque background of its own.
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: textTheme,
      splashFactory: InkSparkle.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
          color: scheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: isDark ? 2 : 5,
        clipBehavior: Clip.antiAlias,
        color: cardColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withValues(alpha: isDark ? 0.55 : 0.12),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: cardBorder(isDark)),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        selectedColor: scheme.primary,
        checkmarkColor: scheme.onPrimary,
        side: BorderSide.none,
        labelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
        secondaryLabelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: scheme.onPrimary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          side: BorderSide(color: scheme.outlineVariant),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.primary.withValues(alpha: isDark ? 0.26 : 0.16),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        height: 68,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontFamily: _fontFamily,
            fontSize: 11,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            size: 24,
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
          );
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Colors.transparent,
        indicatorColor: scheme.primary.withValues(alpha: isDark ? 0.26 : 0.16),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        selectedIconTheme: IconThemeData(color: scheme.primary),
        unselectedIconTheme: IconThemeData(color: scheme.onSurfaceVariant),
        selectedLabelTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: scheme.primary,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: scheme.onSurfaceVariant,
        ),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, thickness: 1, space: 1),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          side: WidgetStatePropertyAll(BorderSide(color: scheme.outlineVariant)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cardBorder(isDark)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.primary, width: 1.6),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.surfaceContainerHighest,
        contentTextStyle: TextStyle(fontFamily: _fontFamily, color: scheme.onSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.surfaceContainerHighest,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? Colors.white : null,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? scheme.primary : null,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: scheme.primary,
        inactiveTrackColor: scheme.surfaceContainerHighest,
        thumbColor: scheme.primary,
        overlayColor: scheme.primary.withValues(alpha: 0.12),
      ),
    );
  }

  /// Negative letter-spacing on the headings is doing a lot of the work here:
  /// it is what stops a UI font from looking like a default.
  static TextTheme _textTheme(TextTheme base, ColorScheme scheme) {
    final main = scheme.onSurface;
    final muted = scheme.onSurfaceVariant;
    TextStyle s(double size, FontWeight w, {double spacing = 0, Color? color}) => TextStyle(
          fontSize: size,
          fontWeight: w,
          letterSpacing: spacing,
          color: color ?? main,
        );
    return base.copyWith(
      displaySmall: s(32, FontWeight.w800, spacing: -0.8),
      headlineMedium: s(26, FontWeight.w800, spacing: -0.6),
      headlineSmall: s(22, FontWeight.w700, spacing: -0.4),
      titleLarge: s(19, FontWeight.w700, spacing: -0.3),
      titleMedium: s(16, FontWeight.w600, spacing: -0.2),
      titleSmall: s(14, FontWeight.w600),
      bodyLarge: s(16, FontWeight.w400),
      bodyMedium: s(14, FontWeight.w400),
      bodySmall: s(12.5, FontWeight.w400, color: muted),
      labelLarge: s(14, FontWeight.w600),
      labelMedium: s(12, FontWeight.w600),
      labelSmall: s(11, FontWeight.w500, spacing: 0.2, color: muted),
    );
  }
}

/// Per-domain accents. Each media kind owns a hue, so a video card and a photo
/// card are distinguishable at a glance and the settings sections do not all
/// read as one grey wall.
abstract final class Accents {
  static const video = Color(0xFF7C3AED);
  static const audio = Color(0xFF2E90FA);
  static const image = Color(0xFFF59E0B);
  static const privacy = Color(0xFF22C55E);
  static const transform = Color(0xFFEC4899);
  static const output = Color(0xFF14B8A6);
  static const support = Color(0xFFA855F7);
}
