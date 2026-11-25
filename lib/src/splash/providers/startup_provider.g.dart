// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Everything that must be ready before the first authenticated request.
/// Add new boot-time work here (push notifications, analytics, remote config…).

@ProviderFor(startup)
const startupProvider = StartupProvider._();

/// Everything that must be ready before the first authenticated request.
/// Add new boot-time work here (push notifications, analytics, remote config…).

final class StartupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Everything that must be ready before the first authenticated request.
  /// Add new boot-time work here (push notifications, analytics, remote config…).
  const StartupProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'startupProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$startupHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return startup(ref);
  }
}

String _$startupHash() => r'd98b8b859be9c2428dcdab9677b057ee1be3d824';
