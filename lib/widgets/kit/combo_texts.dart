import 'package:flutter/material.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';

class KitLocationText extends StatelessWidget {
  const KitLocationText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/pin.png',
          width: 18,
          color: appTheme.colors.elements.blue,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTypography.medium14.copyWith(
            color: appTheme.colors.elements.blue,
          ),
        ),
      ],
    );
  }
}
