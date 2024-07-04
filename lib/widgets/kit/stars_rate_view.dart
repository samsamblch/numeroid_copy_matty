import 'package:flutter/material.dart';

import '../../core/locator.dart';

class StarsRateView extends StatelessWidget {
  const StarsRateView({
    super.key,
    required this.rate,
  });

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StarsRateItem(active: rate > 0),
        _StarsRateItem(active: rate > 1),
        _StarsRateItem(active: rate > 2),
        _StarsRateItem(active: rate > 3),
        _StarsRateItem(active: rate > 4),
      ],
    );
  }
}

class _StarsRateItem extends StatelessWidget {
  const _StarsRateItem({
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rounded,
      size: 14,
      color: active ? appTheme.colors.brand.peachy : Colors.grey.shade300,
    );
  }
}
