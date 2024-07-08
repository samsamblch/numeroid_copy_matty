import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../domain/model/bo/hotel.dart';
import '../../widgets/kit/buttons.dart';
import '../../widgets/kit/combo_texts.dart';
import '../../widgets/kit/common.dart';
import '../../widgets/kit/decorations.dart';
import '../../widgets/kit/stars_rate_view.dart';
import '../../widgets/kit/texts.dart';

class HolelDetailHeaderBlock extends StatelessWidget {
  const HolelDetailHeaderBlock({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: KitTextBold18(hotel.info.name),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
          child: StarsRateView(rate: hotel.rate),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
          child: KitLocationText(hotel.info.address),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: KitButtonBlue(
                    text: 'Показать на карте',
                    onTap: () {},
                    outlined: true,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: KitButtonBlue(
                    text: 'Забронировать',
                    onTap: () {},
                  ),
                ),
              ),
              const _LikeButton(),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
            child: KitButtonGrey(
              text: 'Информация о варианте и стоимости',
              onTap: () {},
              outlined: true,
              radius: 12,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: KitButtonGrey(
              text: 'Удобства и услуги',
              onTap: () {},
              outlined: true,
              radius: 12,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: KitButtonGrey(
              text: 'Условия размещения',
              onTap: () {},
              outlined: true,
              radius: 12,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6, bottom: 16),
          child: KitSeparator(),
        ),
      ],
    );
  }
}

class _LikeButton extends StatelessWidget {
  const _LikeButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: KitDecorations.whiteRBoxWithBorder(),
      child: Center(
        child: Image.asset(
          'assets/icons/heart.png',
          width: 22,
          color: appTheme.colors.elements.grey,
        ),
      ),
    );
  }
}
