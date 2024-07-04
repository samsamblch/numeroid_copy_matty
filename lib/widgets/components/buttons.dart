import 'package:flutter/material.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';

class AppButtonOrange extends StatelessWidget {
  const AppButtonOrange({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: appTheme.colors.brand.peachy,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide.none,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: AppTypography.semiBold14
            .copyWith(color: appTheme.colors.text.primary),
      ),
    );
  }
}

class AppButtonBlue extends StatelessWidget {
  const AppButtonBlue({
    super.key,
    required this.text,
    required this.onTap,
    this.enable = true,
  });

  final String text;
  final VoidCallback onTap;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: enable
              ? appTheme.colors.elements.blue
              : appTheme.colors.border.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide.none,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: AppTypography.semiBold14.copyWith(
            color: enable ? Colors.white : appTheme.colors.elements.grey,
          ),
        ),
      ),
    );
  }
}

class AppButtonRed extends StatelessWidget {
  const AppButtonRed({
    super.key,
    required this.text,
    required this.onTap,
    this.enable = true,
  });

  final String text;
  final VoidCallback onTap;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor:
            enable ? appTheme.colors.brand.red : appTheme.colors.border.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide.none,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: AppTypography.semiBold14.copyWith(
          color: enable ? Colors.white : appTheme.colors.elements.grey,
        ),
      ),
    );
  }
}

class AppButtonOutlineBlue extends StatelessWidget {
  const AppButtonOutlineBlue({
    super.key,
    required this.text,
    required this.onTap,
    this.radius = 4,
  });

  final String text;
  final VoidCallback onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          side: BorderSide(
            width: 1,
            color: appTheme.colors.brand.blue,
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: AppTypography.semiBold14
              .copyWith(color: appTheme.colors.brand.blue),
        ),
      ),
    );
  }
}

class AppButtonOutlineBlack extends StatelessWidget {
  const AppButtonOutlineBlack({
    super.key,
    required this.text,
    required this.onTap,
    this.radius = 4,
  });

  final String text;
  final VoidCallback onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: const BorderSide(
          width: 1,
          color: Colors.black45,
        ),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: AppTypography.semiBold14
            .copyWith(color: appTheme.colors.text.primary),
      ),
    );
  }
}
