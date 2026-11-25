import 'package:karma/core/error/app_exception.dart';
import 'package:karma/core/extension/log.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';

/// One-shot mutations (apply leave, send kudos, acknowledge notice…) with the
/// same toast behaviour everywhere. Mix into a notifier:
///
/// ```dart
/// @riverpod
/// class ApplyLeave extends _$ApplyLeave with ActionMixin {
///   Future<bool> submit(ApplyLeaveRequest body) => runAction(
///     () => _api.applyForLeave(applyLeaveRequest: body).guard<MessageResponse>(),
///     success: 'Leave requested. May your approver be kind.',
///   ).then((r) => r != null);
/// }
/// ```
mixin ActionMixin {
  bool _busy = false;

  /// True while an action from this object is in flight (double-tap guard).
  bool get isBusy => _busy;

  /// Runs [action]; returns its result, or `null` if it failed or another
  /// action is still running. Errors are shown as an error toast.
  Future<T?> runAction<T>(
    Future<T> Function() action, {
    String? success,
    bool showError = true,
  }) async {
    if (_busy) {
      return null;
    }
    _busy = true;
    try {
      final result = await action();
      success?.toToast();
      return result;
    } on AppException catch (e) {
      if (showError && !e.isUnauthorized) {
        e.message.toToast(type: SnackBarType.error);
      }
      return null;
    } catch (e) {
      e.logError();
      if (showError) {
        'Something went wrong!'.toToast(type: SnackBarType.error);
      }
      return null;
    } finally {
      _busy = false;
    }
  }
}
