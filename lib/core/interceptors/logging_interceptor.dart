import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:karma/core/extension/log.dart';
import 'package:karma/core/interceptors/token_interceptor.dart';

/// Debug-only request/response logger (added by DioInstance in kDebugMode).
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = Map.of(options.headers)
      ..update(TokenInterceptor.header, (_) => '***', ifAbsent: () => null)
      ..removeWhere((_, v) => v == null);
    [
      'x------------------------------',
      '${options.method} ${options.uri}',
      if (options.queryParameters.isNotEmpty) 'Query : ${options.queryParameters}',
      'Headers : $headers',
      if (options.data != null) 'Data : ${options.data}',
      '------------------------------x',
    ].join('\n').logInfo();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    [
      'x------------------------------',
      '${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}',
      'Response : ${_encode(response.data)}',
      '------------------------------x',
    ].join('\n').logSuccess();
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    [
      'x------------------------------',
      '${err.response?.statusCode ?? err.type.name} ${err.requestOptions.method} ${err.requestOptions.uri}',
      'Error : ${err.message}',
      'Response : ${err.response?.data}',
      '------------------------------x',
    ].join('\n').logError();
    handler.next(err);
  }

  String _encode(Object? data) {
    try {
      final text = jsonEncode(data);
      return text.length > 2000 ? '${text.substring(0, 2000)}…' : text;
    } catch (_) {
      return '$data';
    }
  }
}
