import 'package:flutter/widgets.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

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
      style: KitTextStyles.bold16,
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
      style: KitTextStyles.bold18,
    );
  }
}

class KitTextSemibold13 extends StatelessWidget {
  const KitTextSemibold13(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Text(text, style: KitTextStyles.semiBold13.copyWith(color: color));
}

class KitTextSemibold14 extends StatelessWidget {
  const KitTextSemibold14(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Text(text, style: KitTextStyles.semiBold14.copyWith(color: color));
}

class KitTextMedium13 extends StatelessWidget {
  const KitTextMedium13(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Text(text, style: KitTextStyles.medium13.copyWith(color: color));
}

class KitTextMedium14 extends StatelessWidget {
  const KitTextMedium14(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Text(text, style: KitTextStyles.medium14.copyWith(color: color));
}
