import 'package:flutter/material.dart';

import '../../core/locator.dart';

class KitDecorations {
  static BoxDecoration whiteRBoxWithBorder({
    double radius = 4,
    Color? borderColor,
    Color? color,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      border: Border.all(
        color: borderColor ?? appTheme.colors.border.grey,
      ),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
