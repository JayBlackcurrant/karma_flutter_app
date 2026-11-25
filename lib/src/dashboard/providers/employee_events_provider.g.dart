// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(employeeEvents)
const employeeEventsProvider = EmployeeEventsProvider._();

final class EmployeeEventsProvider extends $FunctionalProvider<
        AsyncValue<DashboardEvents>, DashboardEvents, FutureOr<DashboardEvents>>
    with $FutureModifier<DashboardEvents>, $FutureProvider<DashboardEvents> {
  const EmployeeEventsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'employeeEventsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$employeeEventsHash();

  @$internal
  @override
  $FutureProviderElement<DashboardEvents> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardEvents> create(Ref ref) {
    return employeeEvents(ref);
  }
}

String _$employeeEventsHash() => r'4a6924cbc87ab5f1c2629767f054a2a577938870';
