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

  static BoxDecoration whiteRBoxWithShadow({
    double radius = 4,
  }) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x22828282),
          blurRadius: 10,
          offset: Offset(0, 0),
        ),
      ],
    );
  }
}
