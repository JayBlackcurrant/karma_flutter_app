// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'long_weekends_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Long weekends over the next 12 months, from the holiday calendar.

@ProviderFor(longWeekends)
const longWeekendsProvider = LongWeekendsProvider._();

/// Long weekends over the next 12 months, from the holiday calendar.

final class LongWeekendsProvider extends $FunctionalProvider<
        AsyncValue<List<LongWeekend>>,
        List<LongWeekend>,
        FutureOr<List<LongWeekend>>>
    with
        $FutureModifier<List<LongWeekend>>,
        $FutureProvider<List<LongWeekend>> {
  /// Long weekends over the next 12 months, from the holiday calendar.
  const LongWeekendsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'longWeekendsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$longWeekendsHash();

  @$internal
  @override
  $FutureProviderElement<List<LongWeekend>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<LongWeekend>> create(Ref ref) {
    return longWeekends(ref);
  }
}

String _$longWeekendsHash() => r'da4b2193d50b5b0eead3f3b87b5cd98be8ce8a56';

/// Holiday days (local midnight) — used to disable them in the date pickers.

@ProviderFor(holidayDays)
const holidayDaysProvider = HolidayDaysProvider._();

/// Holiday days (local midnight) — used to disable them in the date pickers.

final class HolidayDaysProvider extends $FunctionalProvider<
        AsyncValue<Set<DateTime>>, Set<DateTime>, FutureOr<Set<DateTime>>>
    with $FutureModifier<Set<DateTime>>, $FutureProvider<Set<DateTime>> {
  /// Holiday days (local midnight) — used to disable them in the date pickers.
  const HolidayDaysProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'holidayDaysProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$holidayDaysHash();

  @$internal
  @override
  $FutureProviderElement<Set<DateTime>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Set<DateTime>> create(Ref ref) {
    return holidayDays(ref);
  }
}

String _$holidayDaysHash() => r'c576fcb999fd25437d6511437cd9c94371dae369';
