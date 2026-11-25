import 'package:flutter/material.dart';
import 'package:karma/src/theme/app_color.dart';
import 'package:karma/src/theme/app_text_theme.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Karma design tokens: `context.colors.mutedForeground`.
  BaseColorExtension get colors =>
      Theme.of(this).extension<BaseColorExtension>() ?? AppLightColor();

  /// Typography scale: `context.text.semibold16`.
  AppTypographyExtension get text =>
      Theme.of(this).extension<AppTypographyExtension>() ??
      AppTypographyExtension(colors: colors);

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Size get screenSize => MediaQuery.sizeOf(this);
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Phones get one column, wider screens (tablets / landscape) two.
  bool get isWide => width >= 600;

  void hideKeyboard() => FocusScope.of(this).unfocus();
}
