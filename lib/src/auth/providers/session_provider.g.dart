// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sign in / forgot password / sign out / session expiry.
///
/// State is the "busy" flag for the sign-in form.

@ProviderFor(Session)
const sessionProvider = SessionProvider._();

/// Sign in / forgot password / sign out / session expiry.
///
/// State is the "busy" flag for the sign-in form.
final class SessionProvider extends $NotifierProvider<Session, bool> {
  /// Sign in / forgot password / sign out / session expiry.
  ///
  /// State is the "busy" flag for the sign-in form.
  const SessionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sessionProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sessionHash();

  @$internal
  @override
  Session create() => Session();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$sessionHash() => r'e46aeccc9fa6605576c3783df77ae1025ce94d35';

/// Sign in / forgot password / sign out / session expiry.
///
/// State is the "busy" flag for the sign-in form.

abstract class _$Session extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
