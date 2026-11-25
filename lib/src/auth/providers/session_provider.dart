import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:karma/core/instances/shar_pref.dart';
import 'package:karma/core/mixins/action_mixin.dart';
import 'package:karma/src/routes/app_router.dart';
import 'package:karma/src/routes/app_router.gr.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';
import 'package:karma/src/shared/providers/token_provider.dart';
import 'package:karma/src/shared/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

/// Sign in / forgot password / sign out / session expiry.
///
/// State is the "busy" flag for the sign-in form.
@Riverpod(keepAlive: true)
class Session extends _$Session with ActionMixin {
  bool _expiring = false;

  @override
  bool build() => false;

  AuthApi get _auth => ref.read(apiProvider).getAuthApi();

  /// `POST /auth/login` → store JWT → `GET /auth/getRole` → home.
  Future<void> login({required String email, required String password}) async {
    state = true;
    final ok = await runAction(() async {
      final res = await _auth
          .login(
            loginRequest: LoginRequest(email: email.trim(), password: password),
          )
          .guard<LoginResponse>();
      final token = res.token;
      if (token == null || token.isEmpty) {
        throw StateError('Login response had no token');
      }
      await ref.read(tokenProvider.notifier).update(token);
      await ref.read(userProvider.notifier).fetch();
      return true;
    });
    state = false;
    if (ok ?? false) {
      await ref
          .read(appRouterProvider)
          .replaceAll([const GuardedRouteWrapper()]);
    } else {
      // Don't keep a token whose profile could not be loaded.
      await ref.read(tokenProvider.notifier).update(null);
    }
  }

  /// `POST /auth/forgotPassword` — emails a reset link to the web app.
  Future<bool> forgotPassword(String email) async {
    final res = await runAction(
      () => _auth
          .forgotPassword(
            forgotPasswordRequest: ForgotPasswordRequest(email: email.trim()),
          )
          .guard<MessageResponse>(),
      success: 'The link for resetting the password has been sent to the email',
    );
    return res != null;
  }

  /// User tapped "Logout".
  Future<void> logout() => _signOut();

  /// Backend rejected the token (401 from any non-auth endpoint).
  Future<void> expire() async {
    if (_expiring) {
      return;
    }
    _expiring = true;
    try {
      'Session expired. Please sign in again.'
          .toToast(type: SnackBarType.error);
      await _signOut();
    } finally {
      _expiring = false;
    }
  }

  Future<void> _signOut() async {
    await ref.read(tokenProvider.notifier).update(null);
    await ref.read(sharedPrefProvider.notifier).clear();
    ref.read(userProvider.notifier).clear();
    await ref.read(appRouterProvider).replaceAll([const SignInRoute()]);
  }
}
