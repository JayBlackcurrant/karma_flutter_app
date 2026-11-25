import 'package:dio/dio.dart';
import 'package:karma/core/extension/log.dart';

/// Signs the user out when the backend rejects the token (401).
///
/// 403 is NOT treated as a logout: Karma returns 403 for admin-only endpoints
/// called by employees, and the session is still perfectly valid.
class UnauthorizedInterceptor extends Interceptor {
  UnauthorizedInterceptor({required this.onUnauthorized});

  final Future<void> Function() onUnauthorized;

  /// Auth endpoints answer 401 for a wrong password — that is a form error,
  /// not an expired session. `getRole` is the session check AuthGuard runs
  /// itself, so the guard (not this interceptor) decides where to go.
  static const _ignoredPaths = [
    'auth/login',
    'auth/forgotPassword',
    'auth/getRole',
  ];

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final path = err.requestOptions.path;
    final ignored = _ignoredPaths.any(path.contains);
    if (err.response?.statusCode == 401 && !ignored) {
      try {
        await onUnauthorized();
      } catch (error) {
        'Could not expire session: $error'.logError();
      }
    }
    handler.next(err);
  }
}
