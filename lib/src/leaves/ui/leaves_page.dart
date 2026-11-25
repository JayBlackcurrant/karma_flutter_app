import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karma/src/shared/components/feature_placeholder.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class LeavesPage extends StatelessWidget {
  const LeavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'Leaves',
      subtitle: 'Apply for leave, track your requests and manage holidays.',
      icon: PhosphorIconsRegular.calendarBlank,
      planned: [
        'Balance tiles: leaves remaining · WFH remaining · unpaid taken',
        'Long-weekend planner from the holiday calendar',
        'Apply form: reason, type, date / range, description',
        'My leave details with filters and cancel',
        'Holiday list',
      ],
    );
  }
}
