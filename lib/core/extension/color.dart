import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color setOpacity(double opacity) {
    return withAlpha((opacity * 255).toInt());
  }
}
