import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karma/src/shared/components/feature_placeholder.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'My Attendance',
      subtitle:
          'Your office door entries each month. Office hours are 9 to 6 with a '
          '45-minute buffer; what matters is covering 8 hours a working day.',
      icon: PhosphorIconsRegular.clockCountdown,
      planned: [
        'Month list',
        'Summary tiles: days in office, time, late check-ins, short days…',
        'Per-day table with findings',
      ],
    );
  }
}
