import 'package:dio/dio.dart';

/// Karma authenticates with a custom `Token: <jwt>` header (not
/// `Authorization: Bearer`). The token is read per request so a fresh login is
/// picked up without recreating Dio.
class TokenInterceptor extends Interceptor {
  TokenInterceptor({required this.getToken});

  static const header = 'Token';

  final String Function() getToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = getToken();
    if (token.isNotEmpty && !options.headers.containsKey(header)) {
      options.headers[header] = token;
    }
    handler.next(options);
  }
}
