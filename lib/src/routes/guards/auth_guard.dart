import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/error/app_exception.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/routes/app_router.gr.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';
import 'package:karma/src/shared/providers/token_provider.dart';
import 'package:karma/src/shared/providers/user_provider.dart';

/// Lets `/user/**` through only with a token the backend still accepts.
///
/// Mirrors the web app: `GET /auth/getRole` on entry; failure ⇒ sign out.
/// Unlike the web, an offline launch is not a sign-out — the token is kept and
/// the user lands on the no-internet screen with a retry.
class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._ref);

  final Ref _ref;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final token = _ref.read(tokenProvider.notifier).fetch();
    if (token.isEmpty) {
      unawaited(resolver.redirectUntil(const SignInRoute()));
      return;
    }

    // Already validated this session — don't hit getRole on every push.
    if (_ref.read(userProvider) != null) {
      resolver.next();
      return;
    }

    try {
      await _ref.read(userProvider.notifier).fetch();
      resolver.next();
    } on AppException catch (e) {
      if (e.isConnection) {
        unawaited(resolver.redirectUntil(const NoInternetRoute()));
        return;
      }
      if (e.isUnauthorized) {
        'Session expired. Please sign in again.'
            .toToast(type: SnackBarType.error);
      }
      await _ref.read(tokenProvider.notifier).update(null);
      unawaited(resolver.redirectUntil(const SignInRoute()));
    } catch (_) {
      await _ref.read(tokenProvider.notifier).update(null);
      unawaited(resolver.redirectUntil(const SignInRoute()));
    }
  }
}
