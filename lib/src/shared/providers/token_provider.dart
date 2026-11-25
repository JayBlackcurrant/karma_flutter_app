import 'package:karma/core/instances/shar_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_provider.g.dart';

/// Holds the JWT in memory; persisted in the keystore through [SharedPref].
@Riverpod(keepAlive: true)
class Token extends _$Token {
  @override
  String build() {
    return '';
  }

  /// `null` / empty clears the session everywhere (memory + disk).
  Future<void> update(String? token) async {
    state = token ?? '';
    await ref.read(sharedPrefProvider.notifier).setToken(token);
  }

  /// Restores the stored token (startup + AuthGuard).
  String fetch() {
    final token = ref.read(sharedPrefProvider.notifier).getToken();
    state = token;
    return token;
  }
}
