// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absent_employees_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /employee/get-absent-employees` — who is out today, including leaves
/// still awaiting approval.

@ProviderFor(absentEmployees)
const absentEmployeesProvider = AbsentEmployeesProvider._();

/// `GET /employee/get-absent-employees` — who is out today, including leaves
/// still awaiting approval.

final class AbsentEmployeesProvider extends $FunctionalProvider<
        AsyncValue<List<AbsentEmployee>>,
        List<AbsentEmployee>,
        FutureOr<List<AbsentEmployee>>>
    with
        $FutureModifier<List<AbsentEmployee>>,
        $FutureProvider<List<AbsentEmployee>> {
  /// `GET /employee/get-absent-employees` — who is out today, including leaves
  /// still awaiting approval.
  const AbsentEmployeesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'absentEmployeesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$absentEmployeesHash();

  @$internal
  @override
  $FutureProviderElement<List<AbsentEmployee>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<AbsentEmployee>> create(Ref ref) {
    return absentEmployees(ref);
  }
}

String _$absentEmployeesHash() => r'44fd61e5ae317bb2356c54d348aa6ed3ce2e7f2c';
