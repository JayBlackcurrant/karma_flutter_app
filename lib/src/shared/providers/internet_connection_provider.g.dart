// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_connection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `true` while any network interface is up. Good enough for banners and for
/// deciding whether to retry; the request itself is the real test.

@ProviderFor(internetConnection)
const internetConnectionProvider = InternetConnectionProvider._();

/// `true` while any network interface is up. Good enough for banners and for
/// deciding whether to retry; the request itself is the real test.

final class InternetConnectionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// `true` while any network interface is up. Good enough for banners and for
  /// deciding whether to retry; the request itself is the real test.
  const InternetConnectionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'internetConnectionProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$internetConnectionHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return internetConnection(ref);
  }
}

String _$internetConnectionHash() =>
    r'8f82ca40d8dd1fd7019d89227b7757b121bab5e2';
