import 'package:flutter/material.dart';

import '../../../core/locator.dart';
import '../../../domain/model/bo/hotel_short.dart';
import '../../../widgets/components/buttons.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/components/spacers.dart';
import '../../../widgets/kit/app_typography.dart';
import '../../../widgets/kit/stars_rate_view.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotel,
    required this.days,
    required this.adult,
    required this.onTap,
  });

  final HotelShort hotel;
  final int days;
  final int adult;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: double.infinity,
        child: WhiteContainer(
          shadow: true,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        color: appTheme.colors.background.greyLight,
                        width: 167,
                        height: 116,
                        child: (hotel.info.photo?.url != null)
                            ? Image.network(
                                hotel.info.photo!.url,
                                fit: BoxFit.fill,
                              )
                            : null,
                      ),
                    ),
                    const HorizontalSpacer8(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel.info.name,
                            style: KitTextStyles.bold15,
                          ),
                          const SizedBox(height: 8),
                          StarsRateView(rate: hotel.info.rate),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    height: 1,
                    color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    hotel.offers.first.rooms.first.name,
                    style: KitTextStyles.semiBold13.copyWith(
                      color: appTheme.colors.text.primary,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$days ночей, $adult взрослых',
                            style: KitTextStyles.medium13.copyWith(
                              color: appTheme.colors.text.primary,
                            ),
                          ),
                          Text(
                            '${hotel.price.price} руб.',
                            style: KitTextStyles.bold14.copyWith(
                              color: appTheme.colors.text.primary,
                            ),
                          ),
                          Text(
                            'Включая налоги и сборы',
                            style: KitTextStyles.medium12.copyWith(
                              color: appTheme.colors.text.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (hotel.offers.first.cancelConditions.cancelled)
                          Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: 16,
                                color: appTheme.colors.brand.greenDarky,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Бесплатная отмена',
                                style: KitTextStyles.medium12.copyWith(
                                  color: appTheme.colors.brand.greenDarky,
                                ),
                              ),
                            ],
                          ),
                        if (hotel.offers.first.meals?.first.included == true)
                          Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: 16,
                                color: appTheme.colors.brand.greenDarky,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Завтрак включен',
                                style: KitTextStyles.medium12.copyWith(
                                  color: appTheme.colors.brand.greenDarky,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: AppButtonBlue(
                    text: 'Смотреть наличие мест',
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
