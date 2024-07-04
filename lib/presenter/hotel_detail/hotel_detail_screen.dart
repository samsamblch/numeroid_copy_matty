import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/model/dto/hotel_details.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/kit/buttons.dart';
import 'package:numeroid/widgets/kit/decorations.dart';

import '../../domain/repository/booking_repository.dart';
import '../../widgets/components/containers.dart';
import '../../widgets/kit/texts.dart';
import 'hotel_detail_facilities_block.dart';
import 'hotel_detail_header_block.dart';
import 'hotel_detail_images_block.dart';
import 'hotel_detail_section_container.dart';

@RoutePage()
class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({
    super.key,
    required this.hotelId,
  });

  final int hotelId;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  HotelDetails? hotel;

  @override
  void initState() {
    super.initState();

    load();
  }

  Future<void> load() async {
    final result = await BookingRepository().loadHotelDetails(hotelId: widget.hotelId);

    setState(() {
      hotel = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '',
      child: Column(
        children: [
          if (hotel != null)
            Expanded(
              child: SingleChildScrollView(
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      HolelDetailHeaderBlock(hotel: hotel!),
                      if (hotel?.photos != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: HotelDetailImagesBlock(
                            photos: hotel!.photos!,
                          ),
                        ),
                      if (hotel?.facilities != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: HotelDetailFacilitiesBlock(hotel!.facilities!),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: HotelDetailSectionContainer(
                          title: 'Описание отеля',
                          body: KitTextMedium14(hotel!.description?.description ?? '-'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: HotelDetailSectionContainer(
                            title: 'Наличие мест',
                            left: 0,
                            right: 0,
                            body: Column(
                              children: [
                                ...hotel!.rooms.map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: WhiteContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          children: [
                                            Text(e.name),
                                            KitButtonBlue(
                                              text: 'Я бронирую',
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: HotelDetailSectionContainer(
                          title: 'Условия размещения',
                          bottom: 0,
                          left: 0,
                          right: 0,
                          body: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                child: KitTextMedium14(
                                  'Отель ${hotel!.name ?? '-'} принимает особые пожелания - добавьте их на следующем шаге',
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: KitDecorations.whiteRBoxWithBorder(
                                  radius: 12,
                                  color: appTheme.colors.elements.paleBlue,
                                  borderColor: appTheme.colors.border.blue,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KitTextBold16('Заезд'),
                                                  KitTextMedium14('C 00:00 до 00:00'),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  KitTextBold16('Выезд'),
                                                  KitTextMedium14('C 00:00 до 00:00'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 6),
                                              child: KitTextBold16('Отмена/предоплата'),
                                            ),
                                            KitTextMedium14(
                                              'Правила отмены бронирования и предполаты зависят от типа выбранного варианта. Проверьте условия бронирования каждого варианта, прежде чем сделать выбор',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 6),
                                              child: KitTextBold16('Возрастное ограничение'),
                                            ),
                                            KitTextMedium14(
                                              'Минимальный допустимый возраст для заезда: 18 лет',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 6),
                                              child: KitTextBold16('Домашние животные'),
                                            ),
                                            KitTextMedium14(
                                              'Разрешение домашних животных допускается по предварительному запросу. Данная услуга может быть платной',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(bottom: 6),
                                              child: KitTextBold16('Карты для оплаты в отеле'),
                                            ),
                                            KitTextMedium14(
                                              'Отель ${hotel!.name ?? '-'} принимает эти карты и оставляет за собой право предварительного бокирования средств на карте до вашего приезда',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
