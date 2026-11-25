import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karma/core/extension/string.dart';
import 'package:karma/src/shared/components/app_snack_bar.dart';
import 'package:karma/src/shared/providers/user_provider.dart';

/// For admin-only routes (Employees, Payment, Attendance admin, Settings…).
/// Must sit below AuthGuard so the user is already loaded.
class AdminGuard extends AutoRouteGuard {
  AdminGuard(this._ref);

  final Ref _ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_ref.read(isAdminProvider)) {
      resolver.next();
      return;
    }
    'Only administrators can open this page.'
        .toToast(type: SnackBarType.warning);
    resolver.next(false);
  }
}
