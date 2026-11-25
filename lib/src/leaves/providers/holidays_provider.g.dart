// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holidays_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /holiday` — the company holiday calendar, sorted by date.

@ProviderFor(holidays)
const holidaysProvider = HolidaysProvider._();

/// `GET /holiday` — the company holiday calendar, sorted by date.

final class HolidaysProvider extends $FunctionalProvider<
        AsyncValue<List<Holiday>>, List<Holiday>, FutureOr<List<Holiday>>>
    with $FutureModifier<List<Holiday>>, $FutureProvider<List<Holiday>> {
  /// `GET /holiday` — the company holiday calendar, sorted by date.
  const HolidaysProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'holidaysProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$holidaysHash();

  @$internal
  @override
  $FutureProviderElement<List<Holiday>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Holiday>> create(Ref ref) {
    return holidays(ref);
  }
}

String _$holidaysHash() => r'fee5366fa16cbf064a5d0e39c0242c678497af51';

/// First holiday from today on, or null — dashboard countdown tile.

@ProviderFor(nextHoliday)
const nextHolidayProvider = NextHolidayProvider._();

/// First holiday from today on, or null — dashboard countdown tile.

final class NextHolidayProvider extends $FunctionalProvider<
        AsyncValue<Holiday?>, Holiday?, FutureOr<Holiday?>>
    with $FutureModifier<Holiday?>, $FutureProvider<Holiday?> {
  /// First holiday from today on, or null — dashboard countdown tile.
  const NextHolidayProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'nextHolidayProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$nextHolidayHash();

  @$internal
  @override
  $FutureProviderElement<Holiday?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Holiday?> create(Ref ref) {
    return nextHoliday(ref);
  }
}

String _$nextHolidayHash() => r'a35e9cb3be5f19f60923ecb3511a151a1efbd0c5';
