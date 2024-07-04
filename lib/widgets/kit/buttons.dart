import 'package:flutter/material.dart';

import '../../core/locator.dart';
import 'app_typography.dart';

class _KitButton extends StatelessWidget {
  const _KitButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.textColor,
    required this.outlinedTextColor,
    this.enable = true,
    this.outlined = false,
    this.radius = 4,
  });

  final String text;
  final VoidCallback onTap;
  final bool enable;
  final bool outlined;
  final double radius;
  final Color color;
  final Color textColor;
  final Color outlinedTextColor;

  ButtonStyle get _outlineButtonStyle => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: BorderSide(
          width: 1,
          color: color,
        ),
        padding: EdgeInsets.zero,
      );

  ButtonStyle get _buttonStyle => OutlinedButton.styleFrom(
        backgroundColor: enable ? color : appTheme.colors.border.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide.none,
        padding: EdgeInsets.zero,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: outlined ? _outlineButtonStyle : _buttonStyle,
        child: Text(
          text,
          style: KitTextStyles.semiBold14.copyWith(
            color: outlined ? outlinedTextColor : (enable ? textColor : appTheme.colors.elements.grey),
          ),
        ),
      ),
    );
  }
}

class KitButtonBlue extends StatelessWidget {
  const KitButtonBlue({
    super.key,
    required this.text,
    required this.onTap,
    this.enable = true,
    this.outlined = false,
    this.radius = 4,
  });

  final String text;
  final VoidCallback onTap;
  final bool enable;
  final bool outlined;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return _KitButton(
      text: text,
      onTap: onTap,
      enable: enable,
      outlined: outlined,
      radius: radius,
      color: appTheme.colors.elements.blue,
      textColor: appTheme.colors.elements.white,
      outlinedTextColor: appTheme.colors.elements.blue,
    );
  }
}

class KitButtonGrey extends StatelessWidget {
  const KitButtonGrey({
    super.key,
    required this.text,
    required this.onTap,
    this.enable = true,
    this.outlined = false,
    this.radius = 4,
  });

  final String text;
  final VoidCallback onTap;
  final bool enable;
  final bool outlined;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return _KitButton(
      text: text,
      onTap: onTap,
      enable: enable,
      outlined: outlined,
      radius: radius,
      color: appTheme.colors.elements.grey,
      textColor: appTheme.colors.text.primary,
      outlinedTextColor: appTheme.colors.text.primary,
    );
  }
}
