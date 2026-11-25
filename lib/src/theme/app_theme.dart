import 'package:flutter/material.dart';
import 'package:karma/src/theme/app_color.dart';
import 'package:karma/src/theme/app_text_theme.dart';

/// Material theme built from the Karma tokens. Widgets should prefer
/// `context.colors` / `context.text`; this only makes stock Material widgets
/// (inputs, buttons, dialogs, nav bar…) look like the web app.
class AppTheme {
  /// Web `--radius: .625rem` = 10px.
  static const radius = 10.0;

  ThemeData get light => _base(AppLightColor(), Brightness.light);

  ThemeData get dark => _base(AppDarkColor(), Brightness.dark);

  ThemeData _base(BaseColorExtension c, Brightness brightness) {
    final text = AppTypographyExtension(colors: c);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius - 2),
    );
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.primaryForeground,
      secondary: c.secondary,
      onSecondary: c.secondaryForeground,
      error: c.destructive,
      onError: Zinc.white,
      surface: c.background,
      onSurface: c.foreground,
      surfaceContainerLowest: c.background,
      surfaceContainerLow: c.card,
      surfaceContainer: c.card,
      surfaceContainerHigh: c.card,
      surfaceContainerHighest: c.muted,
      onSurfaceVariant: c.mutedForeground,
      outline: c.border,
      outlineVariant: c.border,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      extensions: [c, text],
      textTheme: AppTypographyExtension.textTheme(c),
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      dividerColor: c.border,
      splashFactory: InkSparkle.splashFactory,
      dividerTheme: DividerThemeData(color: c.border, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: c.background,
        foregroundColor: c.foreground,
        titleTextStyle: text.semibold18,
        shape: Border(bottom: BorderSide(color: c.border)),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: c.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius + 4),
          side: BorderSide(color: c.border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size(64, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: c.primary,
          foregroundColor: c.primaryForeground,
          disabledBackgroundColor: c.primary.withValues(alpha: 0.5),
          disabledForegroundColor: c.primaryForeground,
          textStyle: text.medium14,
          shape: shape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          foregroundColor: c.foreground,
          side: BorderSide(color: c.border),
          textStyle: text.medium14,
          shape: shape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.foreground,
          textStyle: text.medium14,
          shape: shape,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        hintStyle: text.muted14,
        labelStyle: text.medium14,
        border: _border(c.input),
        enabledBorder: _border(c.input),
        focusedBorder: _border(c.ring, width: 2),
        errorBorder: _border(c.destructive),
        focusedErrorBorder: _border(c.destructive, width: 2),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.foreground,
        selectionColor: c.ring.withValues(alpha: 0.4),
        selectionHandleColor: c.foreground,
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 64,
        backgroundColor: c.sidebar,
        indicatorColor: c.accent,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? text.medium12
              : text.muted12,
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: 22,
            color: states.contains(WidgetState.selected)
                ? c.foreground
                : c.mutedForeground,
          ),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: c.foreground,
        unselectedLabelColor: c.mutedForeground,
        labelStyle: text.medium14,
        unselectedLabelStyle: text.medium14,
        indicator: BoxDecoration(
          color: c.background,
          borderRadius: BorderRadius.circular(radius - 4),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.background,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: c.border,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.background,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: text.semibold18,
        contentTextStyle: text.muted14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius + 2),
          side: BorderSide(color: c.border),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.secondary,
        labelStyle: text.medium12,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.foreground,
        circularTrackColor: c.muted,
        linearTrackColor: c.muted,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(c.background),
        trackColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? c.primary : c.input,
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      snackBarTheme: const SnackBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  OutlineInputBorder _border(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius - 2),
        borderSide: BorderSide(color: color, width: width),
      );
}
