import 'package:api/api.dart';
import 'package:karma/core/extension/future.dart';
import 'package:karma/core/extension/model.dart';
import 'package:karma/core/instances/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

/// The signed-in user (`GET /auth/getRole` → JWT claims: employeeId, name,
/// email, role). Null until AuthGuard fetches it.
@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  AuthUser? build() => null;

  /// Throws an `AppException` so AuthGuard can tell 401 from offline.
  Future<AuthUser> fetch() async {
    final user = await ref
        .read(apiProvider)
        .getAuthApi()
        .getRole()
        .guard<AuthUser>();
    state = user;
    return user;
  }

  void clear() => state = null;
}

/// `ref.watch(isAdminProvider)` — drives admin-only tabs and actions.
@Riverpod(keepAlive: true)
bool isAdmin(Ref ref) => ref.watch(userProvider)?.isAdmin ?? false;
