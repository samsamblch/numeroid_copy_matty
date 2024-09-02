import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/presenter/reserve_form/bloc/reserve_form_bloc.dart';
import 'package:numeroid/presenter/reserve_form/widgets/reserve_form_personal_data.dart';
import 'package:numeroid/widgets/kit/circular_progress.dart';
import 'package:numeroid/widgets/kit/common.dart';
import 'package:numeroid/widgets/kit/decorations.dart';
import 'package:numeroid/widgets/kit/texts.dart';

import '../../../core/locator.dart';
import '../../../widgets/kit/buttons.dart';
import '../../../widgets/kit/combo_texts.dart';
import '../../../widgets/kit/stars_rate_view.dart';

class ReserveFormBody extends StatefulWidget {
  const ReserveFormBody({super.key});

  @override
  State<ReserveFormBody> createState() => _ReserveFormBodyState();
}

class _ReserveFormBodyState extends State<ReserveFormBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveFormBloc, ReserveFormState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: KitCircularProgress(
                            progress: 1 / 3,
                            child: KitTextSemibold14('2/3'),
                          ),
                        ),
                        SizedBox(width: 10),
                        KitTextSemibold14('Ввод данных'),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
                    child: Container(
                      decoration: KitDecorations.whiteRBoxWithShadow(radius: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  state.hotel.info.photos.first.url,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                              child: KitTextBold18(state.hotel.info.name),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
                              child: StarsRateView(rate: state.hotel.rate),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
                              child: KitLocationText(state.hotel.info.address),
                            ),
                            const KitSeparator(),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (state.hotel.offers.first.cancelConditions.cancelled)
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/check_mark.png',
                                        width: 20,
                                        color: appTheme.colors.elements.green,
                                      ),
                                      const SizedBox(width: 4),
                                      KitTextMedium13(
                                        'Бесплатная отмена',
                                        color: appTheme.colors.elements.green,
                                      )
                                    ],
                                  ),
                                if (state.hotel.offers.first.meals?.first.included == true)
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/check_mark.png',
                                        width: 20,
                                        color: appTheme.colors.elements.green,
                                      ),
                                      const SizedBox(width: 4),
                                      KitTextMedium13(
                                        'Завтрак включен',
                                        color: appTheme.colors.elements.green,
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: KitButtonGrey(
                        text: 'Детали вашего бронирования',
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
                        text: 'Детали цены',
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
                        text: 'Стоимость отмены бронирования',
                        onTap: () {},
                        outlined: true,
                        radius: 12,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: ReserveFormPersonalData(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: KitButtonBlue(text: 'Забронировать', onTap: () {}),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
