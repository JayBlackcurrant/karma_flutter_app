import 'package:flutter/material.dart';
import 'package:karma/core/instances/shar_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// Light / dark / system, persisted in SharedPreferences.
@Riverpod(keepAlive: true)
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  /// Called from startup once prefs are loaded.
  void fetch() {
    final stored = ref.read(sharedPrefProvider.notifier).getTheme();
    state = ThemeMode.values.firstWhere(
      (m) => m.name == stored,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setMode(ThemeMode mode) async {
    state = mode;
    await ref.read(sharedPrefProvider.notifier).setTheme(mode.name);
  }

  /// Sun/moon button in the app bar: flips between explicit light and dark.
  Future<void> toggle(Brightness current) => setMode(
        current == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
      );
}
