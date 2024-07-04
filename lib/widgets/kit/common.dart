import 'package:flutter/widgets.dart';
import 'package:numeroid/core/locator.dart';

class KitSeparator extends StatelessWidget {
  const KitSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: appTheme.colors.border.grey,
    );
  }
}
