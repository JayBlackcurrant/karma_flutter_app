// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_summary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /leave` — my leaves plus balances. Shared by the dashboard glance
/// tiles and the Leaves tab.

@ProviderFor(leaveSummary)
const leaveSummaryProvider = LeaveSummaryProvider._();

/// `GET /leave` — my leaves plus balances. Shared by the dashboard glance
/// tiles and the Leaves tab.

final class LeaveSummaryProvider extends $FunctionalProvider<
        AsyncValue<LeaveSummary>, LeaveSummary, FutureOr<LeaveSummary>>
    with $FutureModifier<LeaveSummary>, $FutureProvider<LeaveSummary> {
  /// `GET /leave` — my leaves plus balances. Shared by the dashboard glance
  /// tiles and the Leaves tab.
  const LeaveSummaryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'leaveSummaryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$leaveSummaryHash();

  @$internal
  @override
  $FutureProviderElement<LeaveSummary> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LeaveSummary> create(Ref ref) {
    return leaveSummary(ref);
  }
}

String _$leaveSummaryHash() => r'bd53c43c4519c9bfc6f929c958feff08749b854b';
