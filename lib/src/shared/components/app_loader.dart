import 'package:flutter/material.dart';
import 'package:karma/core/extension/context.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size = 24, this.padding = 24});

  /// Inline variant for buttons.
  const AppLoader.small({super.key, this.size = 16, this.padding = 0});

  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SizedBox.square(
          dimension: size,
          child: CircularProgressIndicator(
            strokeWidth: size < 20 ? 2 : 2.5,
            color: context.colors.foreground,
          ),
        ),
      ),
    );
  }
}
