import 'package:flutter/material.dart';

import '../../widgets/kit/decorations.dart';
import '../../widgets/kit/texts.dart';

class HotelDetailSectionContainer extends StatelessWidget {
  const HotelDetailSectionContainer({
    required this.title,
    required this.body,
    this.bottom = 16,
    this.left = 16,
    this.right = 16,
  });

  final String title;
  final Widget body;
  final double bottom;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: KitDecorations.whiteRBoxWithBorder(radius: 12),
        child: Padding(
          padding: EdgeInsets.only(top: 16, bottom: bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
                child: KitTextBold18(title),
              ),
              Padding(
                padding: EdgeInsets.only(left: left, right: right),
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
