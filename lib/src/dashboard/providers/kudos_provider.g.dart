// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kudos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /kudos` — the public thank-you wall, newest first.

@ProviderFor(KudosWall)
const kudosWallProvider = KudosWallProvider._();

/// `GET /kudos` — the public thank-you wall, newest first.
final class KudosWallProvider
    extends $AsyncNotifierProvider<KudosWall, List<Kudos>> {
  /// `GET /kudos` — the public thank-you wall, newest first.
  const KudosWallProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'kudosWallProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$kudosWallHash();

  @$internal
  @override
  KudosWall create() => KudosWall();
}

String _$kudosWallHash() => r'cbaa4729d34272ca4f79a363da674ee3b4dbfced';

/// `GET /kudos` — the public thank-you wall, newest first.

abstract class _$KudosWall extends $AsyncNotifier<List<Kudos>> {
  FutureOr<List<Kudos>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Kudos>>, List<Kudos>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Kudos>>, List<Kudos>>,
        AsyncValue<List<Kudos>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// `GET /kudos/colleagues` — people you can send kudos to.

@ProviderFor(colleagues)
const colleaguesProvider = ColleaguesProvider._();

/// `GET /kudos/colleagues` — people you can send kudos to.

final class ColleaguesProvider extends $FunctionalProvider<
        AsyncValue<List<Colleague>>, List<Colleague>, FutureOr<List<Colleague>>>
    with $FutureModifier<List<Colleague>>, $FutureProvider<List<Colleague>> {
  /// `GET /kudos/colleagues` — people you can send kudos to.
  const ColleaguesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'colleaguesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$colleaguesHash();

  @$internal
  @override
  $FutureProviderElement<List<Colleague>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Colleague>> create(Ref ref) {
    return colleagues(ref);
  }
}

String _$colleaguesHash() => r'e4ef3a09095935ec5b2ad1329dba13cd8a7f0510';
