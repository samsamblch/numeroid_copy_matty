import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/presenter/hotel_detail/bloc/hotel_detail_screen_bloc.dart';

import '../../../core/app_route.dart';
import '../../../core/locator.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/kit/buttons.dart';
import '../../../widgets/kit/common.dart';
import '../../../widgets/kit/texts.dart';
import 'hotel_detail_section_container.dart';

class HotelDetailsRoomsBlock extends StatelessWidget {
  const HotelDetailsRoomsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelDetailScreenBloc, HotelDetailScreenState>(
      builder: (context, state) {
        return HotelDetailSectionContainer(
          title: 'Наличие мест',
          left: 0,
          right: 0,
          body: Column(
            children: [
              ...state.hotel!.info.rooms.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: WhiteContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: SizedBox(
                              height: 130,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Container(
                                      color: appTheme.colors.background.greyLight,
                                      width: 115,
                                      height: 130,
                                      child: (e.photo != null)
                                          ? Image.network(
                                              e.photo!.url,
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        KitTextSemibold14(e.name),
                                        KitTextSemibold14(
                                          '${e.area} кв.м',
                                          color: appTheme.colors.text.secondary,
                                        ),
                                        const Spacer(),
                                        KitButtonBlue(
                                          text: 'Подробнее о номере',
                                          onTap: () {},
                                          outlined: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: KitSeparator(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                KitTextSemibold14(
                                  'Вместимость',
                                  color: appTheme.colors.text.secondary,
                                ),
                                const Spacer(),
                                const KitTextSemibold14('0'),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: KitSeparator(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KitTextSemibold14(
                                  'Условия тарифа',
                                  color: appTheme.colors.text.secondary,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    KitTextMedium14(
                                      'бесплатная отмена',
                                      color: appTheme.colors.elements.green,
                                    ),
                                    const Spacer(),
                                    KitTextMedium14(
                                      'завтрак включен',
                                      color: appTheme.colors.elements.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: KitSeparator(),
                          ),
                          Row(
                            children: [
                              KitTextSemibold14(
                                'Актуальная цена',
                                color: appTheme.colors.text.secondary,
                              ),
                              const Spacer(),
                              const KitTextBold16('0 руб'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const KitTextMedium13('включая налоги и сборы'),
                                  KitTextSemibold13(
                                    'оплата в отеле',
                                    color: appTheme.colors.elements.green,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          KitButtonBlue(
                            text: 'Я бронирую',
                            onTap: () {
                              AppRoute.router.push(
                                AppRoutes.reserve,
                                extra: state.hotel,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
