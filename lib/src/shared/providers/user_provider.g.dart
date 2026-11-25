// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The signed-in user (`GET /auth/getRole` → JWT claims: employeeId, name,
/// email, role). Null until AuthGuard fetches it.

@ProviderFor(User)
const userProvider = UserProvider._();

/// The signed-in user (`GET /auth/getRole` → JWT claims: employeeId, name,
/// email, role). Null until AuthGuard fetches it.
final class UserProvider extends $NotifierProvider<User, AuthUser?> {
  /// The signed-in user (`GET /auth/getRole` → JWT claims: employeeId, name,
  /// email, role). Null until AuthGuard fetches it.
  const UserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userHash();

  @$internal
  @override
  User create() => User();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUser? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUser?>(value),
    );
  }
}

String _$userHash() => r'548e8e93e9db3c1970b31b6c333980cf38303c12';

/// The signed-in user (`GET /auth/getRole` → JWT claims: employeeId, name,
/// email, role). Null until AuthGuard fetches it.

abstract class _$User extends $Notifier<AuthUser?> {
  AuthUser? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthUser?, AuthUser?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AuthUser?, AuthUser?>, AuthUser?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// `ref.watch(isAdminProvider)` — drives admin-only tabs and actions.

@ProviderFor(isAdmin)
const isAdminProvider = IsAdminProvider._();

/// `ref.watch(isAdminProvider)` — drives admin-only tabs and actions.

final class IsAdminProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// `ref.watch(isAdminProvider)` — drives admin-only tabs and actions.
  const IsAdminProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isAdminProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isAdminHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAdmin(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAdminHash() => r'fbc95371b0f55c3b3bd77a62096ee4cefbb69220';
