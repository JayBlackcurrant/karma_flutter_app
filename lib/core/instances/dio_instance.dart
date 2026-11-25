import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:karma/core/interceptors/logging_interceptor.dart';
import 'package:karma/core/interceptors/role_override_interceptor.dart';
import 'package:karma/core/interceptors/token_interceptor.dart';
import 'package:karma/core/interceptors/unauthorized_interceptor.dart';

class DioInstance extends DioMixin implements Dio {
  DioInstance({
    required this.baseUrl,
    required this.version,
    required this.tokenInterceptor,
    required this.unauthorizedInterceptor,
    this.forceAdminRole = false,
  }) {
    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'App-Version': version,
      },
    );
    httpClientAdapter = HttpClientAdapter();
    _setUpInterceptor();
  }

  final String baseUrl;
  final String version;
  final TokenInterceptor tokenInterceptor;
  final UnauthorizedInterceptor unauthorizedInterceptor;

  /// DEV: see [RoleOverrideInterceptor]. Ignored outside debug builds.
  final bool forceAdminRole;

  void _setUpInterceptor() {
    interceptors.addAll([
      tokenInterceptor,
      unauthorizedInterceptor,
      if (kDebugMode) LoggingInterceptor(),
      // After logging, so the log still shows the real role from the server.
      if (kDebugMode && forceAdminRole) RoleOverrideInterceptor(),
    ]);
  }
}
