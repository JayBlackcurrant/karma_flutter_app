import 'package:dio/dio.dart';
import 'package:karma/core/extension/log.dart';

/// DEV ONLY — rewrites `role` in the `GET /auth/getRole` response so the app
/// treats the signed-in user as an admin. Lets us build the admin screens
/// (Employees, Payment, Attendance, leave approvals…) with an employee account.
///
/// This only changes what the *app* believes. The backend still checks the
/// real role, so admin-only endpoints keep answering 403 — screens will render
/// their admin layout, but admin data calls show the "forbidden" error.
///
/// Added by DioInstance only in debug builds of a flavor whose env sets
/// `forceAdminRole` (staging). Never active in release or production.
class RoleOverrideInterceptor extends Interceptor {
  RoleOverrideInterceptor({this.role = 'ADMIN'});

  final String role;

  static const _path = 'auth/getRole';

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (response.requestOptions.path.endsWith(_path) &&
        data is Map<String, dynamic> &&
        data['role'] != role) {
      'DEV: overriding role "${data['role']}" → "$role" (RoleOverrideInterceptor)'
          .logWarning();
      response.data = {...data, 'role': role};
    }
    handler.next(response);
  }
}
