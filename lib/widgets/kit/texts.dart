import 'package:flutter/widgets.dart';
import 'package:numeroid/core/app_typography.dart';

class KitTextBold16 extends StatelessWidget {
  const KitTextBold16(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bold16,
    );
  }
}

class KitTextBold18 extends StatelessWidget {
  const KitTextBold18(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bold18,
    );
  }
}

class KitTextMedium14 extends StatelessWidget {
  const KitTextMedium14(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.medium14,
    );
  }
}
