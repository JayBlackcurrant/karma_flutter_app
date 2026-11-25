// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// "1.0.0+1" — sent as the `App-Version` header and shown on the profile tab.

@ProviderFor(packageInfo)
const packageInfoProvider = PackageInfoProvider._();

/// "1.0.0+1" — sent as the `App-Version` header and shown on the profile tab.

final class PackageInfoProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  /// "1.0.0+1" — sent as the `App-Version` header and shown on the profile tab.
  const PackageInfoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'packageInfoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$packageInfoHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return packageInfo(ref);
  }
}

String _$packageInfoHash() => r'3fa7033d7fc358bbc52ca7df5610dd058dc70fab';
