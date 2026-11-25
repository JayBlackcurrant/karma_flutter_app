import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karma/src/shared/components/feature_placeholder.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class AppraisalPage extends StatelessWidget {
  const AppraisalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'Appraisal',
      subtitle:
          'Complete your self-assessment and see the outcome of past cycles.',
      icon: PhosphorIconsRegular.clipboardText,
      planned: [
        'My appraisal cards: cycle, period, status chips',
        'Overall rating and performance bonus',
        'Self-assessment form (long / short text, rating, number, pick one)',
      ],
    );
  }
}
