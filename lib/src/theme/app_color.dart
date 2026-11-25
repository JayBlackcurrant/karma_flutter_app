import 'package:flutter/material.dart';

/// Karma design tokens — a 1:1 port of the web app's shadcn "zinc" palette
/// (OKLCH values converted to sRGB). Read them with `context.colors.<token>`.
class BaseColorExtension extends ThemeExtension<BaseColorExtension> {
  BaseColorExtension({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.border,
    required this.input,
    required this.ring,
    required this.sidebar,
    required this.success,
    required this.warning,
    required this.info,
    required this.festivalAccent,
  });

  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color border;
  final Color input;
  final Color ring;
  final Color sidebar;

  /// Status colours (chips, rings, toasts). Not part of the web's base palette
  /// but used by its status badges.
  final Color success;
  final Color warning;
  final Color info;

  /// Overridden by an active festival theme (`/festival-hunt/theme`); null
  /// means "use [primary]".
  final Color? festivalAccent;

  Color get brand => festivalAccent ?? primary;

  @override
  BaseColorExtension copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? accent,
    Color? accentForeground,
    Color? destructive,
    Color? border,
    Color? input,
    Color? ring,
    Color? sidebar,
    Color? success,
    Color? warning,
    Color? info,
    Color? festivalAccent,
  }) {
    return BaseColorExtension(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      destructive: destructive ?? this.destructive,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      sidebar: sidebar ?? this.sidebar,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      festivalAccent: festivalAccent ?? this.festivalAccent,
    );
  }

  @override
  BaseColorExtension lerp(
    covariant ThemeExtension<BaseColorExtension>? other,
    double t,
  ) {
    if (other is! BaseColorExtension) {
      return this;
    }
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return BaseColorExtension(
      background: l(background, other.background),
      foreground: l(foreground, other.foreground),
      card: l(card, other.card),
      cardForeground: l(cardForeground, other.cardForeground),
      primary: l(primary, other.primary),
      primaryForeground: l(primaryForeground, other.primaryForeground),
      secondary: l(secondary, other.secondary),
      secondaryForeground: l(secondaryForeground, other.secondaryForeground),
      muted: l(muted, other.muted),
      mutedForeground: l(mutedForeground, other.mutedForeground),
      accent: l(accent, other.accent),
      accentForeground: l(accentForeground, other.accentForeground),
      destructive: l(destructive, other.destructive),
      border: l(border, other.border),
      input: l(input, other.input),
      ring: l(ring, other.ring),
      sidebar: l(sidebar, other.sidebar),
      success: l(success, other.success),
      warning: l(warning, other.warning),
      info: l(info, other.info),
      festivalAccent: Color.lerp(festivalAccent, other.festivalAccent, t),
    );
  }
}

/// Tailwind zinc scale used by the tokens below.
abstract final class Zinc {
  static const white = Color(0xFFFFFFFF);
  static const z50 = Color(0xFFFAFAFA);
  static const z100 = Color(0xFFF4F4F5);
  static const z200 = Color(0xFFE4E4E7);
  static const z400 = Color(0xFF9F9FA9);
  static const z500 = Color(0xFF71717B);
  static const z800 = Color(0xFF27272A);
  static const z900 = Color(0xFF18181B);
  static const z950 = Color(0xFF09090B);
}

class AppLightColor extends BaseColorExtension {
  AppLightColor()
      : super(
          background: Zinc.white,
          foreground: Zinc.z950,
          card: Zinc.white,
          cardForeground: Zinc.z950,
          primary: Zinc.z900,
          primaryForeground: Zinc.z50,
          secondary: Zinc.z100,
          secondaryForeground: Zinc.z900,
          muted: Zinc.z100,
          mutedForeground: Zinc.z500,
          accent: Zinc.z100,
          accentForeground: Zinc.z900,
          destructive: const Color(0xFFE7000B),
          border: Zinc.z200,
          input: Zinc.z200,
          ring: Zinc.z400,
          sidebar: Zinc.z50,
          success: const Color(0xFF059669),
          warning: const Color(0xFFD97706),
          info: const Color(0xFF2563EB),
          festivalAccent: null,
        );
}

class AppDarkColor extends BaseColorExtension {
  AppDarkColor()
      : super(
          background: Zinc.z950,
          foreground: Zinc.z50,
          card: Zinc.z900,
          cardForeground: Zinc.z50,
          primary: Zinc.z200,
          primaryForeground: Zinc.z900,
          secondary: Zinc.z800,
          secondaryForeground: Zinc.z50,
          muted: Zinc.z800,
          mutedForeground: Zinc.z400,
          accent: Zinc.z800,
          accentForeground: Zinc.z50,
          destructive: const Color(0xFFFF6467),
          border: const Color(0x1AFFFFFF),
          input: const Color(0x26FFFFFF),
          ring: Zinc.z500,
          sidebar: Zinc.z900,
          success: const Color(0xFF34D399),
          warning: const Color(0xFFFBBF24),
          info: const Color(0xFF60A5FA),
          festivalAccent: null,
        );
}
