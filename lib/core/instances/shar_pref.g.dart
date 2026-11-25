// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shar_pref.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Two stores on purpose: the JWT is the only secret, so it is the only thing
/// in the keystore; theme and other UI flags stay in SharedPreferences.

@ProviderFor(SharedPref)
const sharedPrefProvider = SharedPrefProvider._();

/// Two stores on purpose: the JWT is the only secret, so it is the only thing
/// in the keystore; theme and other UI flags stay in SharedPreferences.
final class SharedPrefProvider
    extends $AsyncNotifierProvider<SharedPref, SharedPreferences> {
  /// Two stores on purpose: the JWT is the only secret, so it is the only thing
  /// in the keystore; theme and other UI flags stay in SharedPreferences.
  const SharedPrefProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPrefProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefHash();

  @$internal
  @override
  SharedPref create() => SharedPref();
}

String _$sharedPrefHash() => r'733452055f84dda3ae6fc5c63aa03a34bb6479c6';

/// Two stores on purpose: the JWT is the only secret, so it is the only thing
/// in the keystore; theme and other UI flags stay in SharedPreferences.

abstract class _$SharedPref extends $AsyncNotifier<SharedPreferences> {
  FutureOr<SharedPreferences> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SharedPreferences>, SharedPreferences>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SharedPreferences>, SharedPreferences>,
        AsyncValue<SharedPreferences>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
