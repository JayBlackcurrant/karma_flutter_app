extension EnumFilterExt<T extends Enum> on Iterable<T> {
  /// Drops the generator's `unknownDefaultOpenApi` fallback case so it never
  /// shows up in pickers: `LeaveType.values.filtered()`.
  List<T> filtered() {
    return where((e) => e.name != 'unknownDefaultOpenApi').toList();
  }
}
