import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

class KitLocationText extends StatelessWidget {
  const KitLocationText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Image.asset(
            'assets/icons/pin.png',
            width: 18,
            color: appTheme.colors.elements.blue,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: KitTextStyles.medium14.copyWith(
              color: appTheme.colors.elements.blue,
            ),
          ),
        ),
      ],
    );
  }
}
