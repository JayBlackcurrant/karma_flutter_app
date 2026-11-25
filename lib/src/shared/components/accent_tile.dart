import 'package:flutter/material.dart';
import 'package:karma/core/extension/context.dart';

/// Rounded, bordered tile with a coloured stripe on the left — the web's
/// `border border-l-4 border-l-primary rounded-lg` (kudos, today's events).
///
/// Flutter can't paint a rounded border whose sides differ in colour, so the
/// border stays uniform and the stripe is drawn inside the clipped box.
class AccentTile extends StatelessWidget {
  const AccentTile({
    super.key,
    required this.child,
    this.accent,
    this.padding = const EdgeInsets.all(14),
  });

  final Widget child;

  /// Defaults to the brand colour (festival accent when one is active).
  final Color? accent;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: c.border),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColoredBox(
              color: accent ?? c.brand,
              child: const SizedBox(width: 4),
            ),
            Expanded(child: Padding(padding: padding, child: child)),
          ],
        ),
      ),
    );
  }
}
