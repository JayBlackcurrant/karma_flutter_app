import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:karma/core/constants/app_constants.dart';
import 'package:karma/core/extension/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shar_pref.g.dart';

/// Two stores on purpose: the JWT is the only secret, so it is the only thing
/// in the keystore; theme and other UI flags stay in SharedPreferences.
@Riverpod(keepAlive: true)
class SharedPref extends _$SharedPref {
  static const _storage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// Mirrors the keystore value so [getToken] stays synchronous for route
  /// guards, which cannot await.
  String _token = '';

  @override
  FutureOr<SharedPreferences> build() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      _token = await _storage.read(key: StorageKeys.token) ?? '';
    } catch (error) {
      // An unreadable keystore (restored backup, corrupted keys) reads as
      // signed out instead of crashing startup.
      'Could not read secure storage: $error'.logError();
      _token = '';
    }
    return prefs;
  }

  /// Never throws — it is called from guards and interceptors.
  Future<bool> setToken(String? token) async {
    _token = token ?? '';
    try {
      if (_token.isEmpty) {
        await _storage.delete(key: StorageKeys.token);
      } else {
        await _storage.write(key: StorageKeys.token, value: _token);
      }
      return true;
    } catch (error) {
      'Could not store token: $error'.logError();
      return false;
    }
  }

  String getToken() => _token;

  Future<bool> setTheme(String mode) => _pref.setString(StorageKeys.theme, mode);

  String getTheme() => _pref.getString(StorageKeys.theme) ?? '';

  Future<void> clear() async {
    _token = '';
    try {
      await _storage.deleteAll();
    } catch (error) {
      'Could not clear secure storage: $error'.logError();
    }
    // Theme is a device preference, not account data — keep it across logout.
    final theme = getTheme();
    await _pref.clear();
    if (theme.isNotEmpty) {
      await setTheme(theme);
    }
  }

  String? getString(String key) => _pref.getString(key);

  Future<bool> setString(String key, String value) =>
      _pref.setString(key, value);

  bool? getBool(String key) => _pref.getBool(key);

  Future<bool> setBool(String key, {required bool value}) =>
      _pref.setBool(key, value);

  SharedPreferences get _pref => state.requireValue;
}
