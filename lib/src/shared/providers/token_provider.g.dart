// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the JWT in memory; persisted in the keystore through [SharedPref].

@ProviderFor(Token)
const tokenProvider = TokenProvider._();

/// Holds the JWT in memory; persisted in the keystore through [SharedPref].
final class TokenProvider extends $NotifierProvider<Token, String> {
  /// Holds the JWT in memory; persisted in the keystore through [SharedPref].
  const TokenProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tokenProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tokenHash();

  @$internal
  @override
  Token create() => Token();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$tokenHash() => r'3b87fda278b133726c0f6f4de91c8b48c1165b6e';

/// Holds the JWT in memory; persisted in the keystore through [SharedPref].

abstract class _$Token extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
