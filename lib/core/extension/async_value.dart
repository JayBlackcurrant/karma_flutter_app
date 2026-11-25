import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/error/app_exception.dart';
import 'package:karma/src/shared/components/app_error.dart';
import 'package:karma/src/shared/components/app_loader.dart';

extension AsyncValueExt<T> on AsyncValue<T> {
  /// Renders loader / error / data for a provider in one call:
  ///
  /// ```dart
  /// ref.watch(leaveSummaryProvider).unfold((summary) => LeaveTiles(summary));
  /// ```
  ///
  /// While refreshing, the previous data stays on screen (pull-to-refresh
  /// friendly). Pass [onRetry] to show a retry button on errors.
  Widget unfold(
    Widget Function(T result) child, {
    Widget? loading,
    VoidCallback? onRetry,
  }) {
    return switch (this) {
      AsyncValue(:final T value, hasValue: true) => child(value),
      AsyncError(:final AppException error, :final stackTrace) => AppError(
          err: kDebugMode
              ? '${error.message} \n $stackTrace'
              : error.isConnection || error.isForbidden
                  ? error.message
                  : 'Something went wrong!',
          onRetry: onRetry,
        ),
      AsyncError(:final error, :final stackTrace) => AppError(
          err: kDebugMode ? '$error \n $stackTrace' : 'Something went wrong!',
          onRetry: onRetry,
        ),
      _ => loading ?? const AppLoader(),
    };
  }

  /// Message for snack bars: the backend's `{message}` when there is one.
  String? get errorMessage => switch (this) {
        AsyncError(:final AppException error) => error.message,
        AsyncError(:final error) =>
          kDebugMode ? '$error' : 'Something went wrong!',
        _ => null,
      };
}
