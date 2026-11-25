// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single REST client. Feature providers grab a typed API from it:
/// `ref.read(apiProvider).getLeaveApi()`.

@ProviderFor(api)
const apiProvider = ApiProvider._();

/// The single REST client. Feature providers grab a typed API from it:
/// `ref.read(apiProvider).getLeaveApi()`.

final class ApiProvider
    extends $FunctionalProvider<models.Api, models.Api, models.Api>
    with $Provider<models.Api> {
  /// The single REST client. Feature providers grab a typed API from it:
  /// `ref.read(apiProvider).getLeaveApi()`.
  const ApiProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'apiProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$apiHash();

  @$internal
  @override
  $ProviderElement<models.Api> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  models.Api create(Ref ref) {
    return api(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(models.Api value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<models.Api>(value),
    );
  }
}

String _$apiHash() => r'93839967d869c0d5a3afb2e2f4e0ba1801a99a3b';
