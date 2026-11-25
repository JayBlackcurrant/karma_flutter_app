import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';

/// Page title + muted subtitle, as on every web page
/// ("Leaves — Apply for leave, track your requests and manage holidays.").
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.italic = false,
  });

  final String title;
  final String? subtitle;

  /// Dashboard tagline style.
  final bool italic;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.bold24),
        if (subtitle != null) ...[
          const Gap(4),
          Text(
            subtitle!,
            style: italic ? context.text.tagline : context.text.muted14,
          ),
        ],
      ],
    );
  }
}
