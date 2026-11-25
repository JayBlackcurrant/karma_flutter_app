import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:karma/core/error/app_exception.dart';
import 'package:karma/core/extension/log.dart';

extension FutureExtension on Future {
  /// Unwraps a Dio `Response<T>` into `T` and turns every failure into an
  /// [AppException], so providers only ever deal with one error type:
  ///
  /// ```dart
  /// final summary = await _api.getLeaves().guard<LeaveSummary>();
  /// ```
  Future<T> guard<T>() async {
    try {
      final res = await this;
      if (res is Response<T> && res.data is T) {
        return res.data as T;
      }
      if (res is T) {
        return res;
      }
      return Future.error(
        AppException(
          message:
              kDebugMode ? 'Null/Response Mismatch' : 'Something went wrong!',
          type: ErrorType.parse,
        ),
      );
    } on DioException catch (e) {
      e.logError();
      return Future.error(e.toAppException());
    } on Exception catch (e, stack) {
      '$e\n$stack'.logError();
      return Future.error(
        AppException(
          message: kDebugMode ? '$e' : 'Something went wrong!',
          type: ErrorType.other,
        ),
      );
    }
  }
}

extension VoidFutureExtension on Future<Response<Object?>> {
  /// For mutations whose response body we don't use (acknowledge, delete…).
  ///
  /// The spec only guesses these bodies, so a 2xx whose body fails to parse
  /// into the generated model still counts as success; real failures still
  /// become an [AppException] exactly like [FutureExtension.guard].
  Future<void> guardVoid() async {
    try {
      await this;
    } on DioException catch (e) {
      final status = e.response?.statusCode ?? 0;
      if (e.type == DioExceptionType.unknown && status >= 200 && status < 300) {
        'Ignored unparseable 2xx body: ${e.error}'.logWarning();
        return;
      }
      e.logError();
      return Future.error(e.toAppException());
    }
  }
}

extension DioExceptionExt on DioException {
  AppException toAppException() {
    final status = response?.statusCode;
    final type = switch (status) {
      401 => ErrorType.unauthorized,
      403 => ErrorType.forbidden,
      _ => ErrorType.response,
    };

    // Karma errors are `{ "message": "..." }`.
    if (response?.data case {'message': final String message}) {
      return AppException(
        message: message,
        type: type,
        data: response?.data,
        statusCode: status,
      );
    }
    if (response?.data case final String text when text.isNotEmpty) {
      return AppException(
        message: text,
        type: type,
        data: text,
        statusCode: status,
      );
    }
    if (error is SocketException ||
        this.type == DioExceptionType.connectionError ||
        this.type == DioExceptionType.connectionTimeout ||
        this.type == DioExceptionType.receiveTimeout ||
        this.type == DioExceptionType.sendTimeout) {
      return AppException(
        message: 'No Internet Connection',
        type: ErrorType.connection,
      );
    }
    if (error is AppException) {
      return error! as AppException;
    }
    // json_serializable throws CheckedFromJsonException inside the generated
    // client when a response does not match the spec.
    if (this.type == DioExceptionType.unknown && status == null) {
      return AppException(
        message: kDebugMode ? '$error' : 'Something went wrong!',
        type: ErrorType.parse,
      );
    }
    return AppException(
      message: kDebugMode ? 'Unhandled Dio Exception' : 'Something went wrong!',
      type: type,
      statusCode: status,
    );
  }
}
