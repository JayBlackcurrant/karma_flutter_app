import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karma/src/shared/components/feature_placeholder.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class PaySlipsPage extends StatelessWidget {
  const PaySlipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'Pay Slips',
      subtitle: 'Download your salary and bonus pay slips.',
      icon: PhosphorIconsRegular.envelopeSimple,
      planned: [
        'Slip list by month with category badge',
        'Open slip via presigned download link',
      ],
    );
  }
}
