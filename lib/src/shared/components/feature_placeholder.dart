import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';
import 'package:karma/src/shared/components/app_card.dart';
import 'package:karma/src/shared/components/page_header.dart';

/// Temporary body for tabs whose feature isn't built yet. Lists what the
/// screen will contain (from the reverse-engineering spec) so the shell is
/// navigable end to end.
class FeaturePlaceholder extends StatelessWidget {
  const FeaturePlaceholder({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.planned,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> planned;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        PageHeader(title: title, subtitle: subtitle),
        const Gap(20),
        AppCard(
          icon: icon,
          title: 'Coming next',
          description: 'This screen is scaffolded; the feature is next up.',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in planned)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('•  $item', style: context.text.regular14),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
