import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karma/src/theme/app_color.dart';

/// Typography scale. The web uses Geist; Inter is the closest family available
/// in google_fonts. To switch to Geist, bundle the TTFs under assets/fonts and
/// change [_family].
///
/// Naming follows the other apps: `<weight><size>` → `context.text.semibold16`.
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  AppTypographyExtension({required this.colors}) {
    regular10 = _style(10, FontWeight.w400);
    regular12 = _style(12, FontWeight.w400);
    regular14 = _style(14, FontWeight.w400);
    regular16 = _style(16, FontWeight.w400);
    medium12 = _style(12, FontWeight.w500);
    medium14 = _style(14, FontWeight.w500);
    medium16 = _style(16, FontWeight.w500);
    semibold12 = _style(12, FontWeight.w600);
    semibold14 = _style(14, FontWeight.w600);
    semibold16 = _style(16, FontWeight.w600);
    semibold18 = _style(18, FontWeight.w600);
    semibold20 = _style(20, FontWeight.w600);
    bold24 = _style(24, FontWeight.w700, letterSpacing: -0.4);
    bold28 = _style(28, FontWeight.w700, letterSpacing: -0.6);
    muted12 = regular12.copyWith(color: colors.mutedForeground);
    muted14 = regular14.copyWith(color: colors.mutedForeground);
    tagline = GoogleFonts.getFont(
      _family,
      fontSize: 13,
      fontStyle: FontStyle.italic,
      color: colors.mutedForeground,
    );
  }

  static const _family = 'Inter';

  final BaseColorExtension colors;

  late final TextStyle regular10;
  late final TextStyle regular12;
  late final TextStyle regular14;
  late final TextStyle regular16;
  late final TextStyle medium12;
  late final TextStyle medium14;
  late final TextStyle medium16;
  late final TextStyle semibold12;
  late final TextStyle semibold14;
  late final TextStyle semibold16;
  late final TextStyle semibold18;
  late final TextStyle semibold20;
  late final TextStyle bold24;
  late final TextStyle bold28;

  /// Secondary copy ("Company-wide announcements.").
  late final TextStyle muted12;
  late final TextStyle muted14;

  /// Italic taglines ("Celebrate someone else's win today.").
  late final TextStyle tagline;

  static TextTheme textTheme(BaseColorExtension colors) =>
      GoogleFonts.getTextTheme(_family).apply(
        bodyColor: colors.foreground,
        displayColor: colors.foreground,
      );

  TextStyle _style(double size, FontWeight weight, {double? letterSpacing}) {
    return GoogleFonts.getFont(
      _family,
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
      color: colors.foreground,
    );
  }

  @override
  AppTypographyExtension copyWith({BaseColorExtension? colors}) {
    return AppTypographyExtension(colors: colors ?? this.colors);
  }

  @override
  AppTypographyExtension lerp(
    covariant ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return t < 0.5 ? this : other;
  }
}
