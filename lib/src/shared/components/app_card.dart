import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karma/core/extension/context.dart';

/// The web's `hlmCard`: bordered, rounded, optional header (icon + title +
/// muted description) above the content.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.title,
    this.description,
    this.icon,
    this.trailing,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  final Widget child;
  final String? title;
  final String? description;
  final IconData? icon;
  final Widget? trailing;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final hasHeader = title != null || description != null;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasHeader) ...[
                Row(
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: 18,
                        color: context.colors.mutedForeground,
                      ),
                      const Gap(8),
                    ],
                    if (title != null)
                      Expanded(
                        child: Text(title!, style: context.text.semibold16),
                      ),
                    if (trailing case final Widget trailing) trailing,
                  ],
                ),
                if (description != null) ...[
                  const Gap(4),
                  Text(description!, style: context.text.muted14),
                ],
                const Gap(16),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}
