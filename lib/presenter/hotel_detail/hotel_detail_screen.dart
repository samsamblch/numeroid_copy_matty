import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/bloc/search/search_bloc.dart';
import 'package:numeroid/presenter/hotel_detail/bloc/hotel_detail_screen_bloc.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/kit/decorations.dart';

import '../../widgets/kit/texts.dart';
import 'widgets/hotel_detail_facilities_block.dart';
import 'widgets/hotel_detail_header_block.dart';
import 'widgets/hotel_detail_images_block.dart';
import 'widgets/hotel_detail_rooms_block.dart';
import 'widgets/hotel_detail_section_container.dart';

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
  final priceKey = GlobalKey();
  final conditionsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelDetailScreenBloc(
        hotelId: widget.hotelId,
        searchBloc: locator<SearchBloc>(),
      ),
      child: BlocBuilder<HotelDetailScreenBloc, HotelDetailScreenState>(
        builder: (context, state) {
          return AppScaffold(
            title: (state.loading) ? 'Загрузка' : '',
            child: Column(
              children: [
                if (state.hotel != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: SafeArea(
                        top: false,
                        child: Column(
                          children: [
                            HolelDetailHeaderBlock(
                              hotel: state.hotel!,
                              onTapPrice: () {
                                Scrollable.ensureVisible(
                                  priceKey.currentContext!,
                                  duration: Durations.medium2,
                                );
                              },
                              onTapConditions: () {
                                Scrollable.ensureVisible(
                                  conditionsKey.currentContext!,
                                  duration: Durations.medium2,
                                );
                              },
                              onTapRecerve: () {
                                Scrollable.ensureVisible(
                                  priceKey.currentContext!,
                                  duration: Durations.medium2,
                                );
                              },
                              onTapMap: () {
                                //TODO
                              },
                            ),
                            if (state.hotel!.info.photos.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
                                child: HotelDetailImagesBlock(
                                  photos: state.hotel!.info.photos,
                                ),
                              ),
                            if (state.hotel?.info.facilities != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: HotelDetailFacilitiesBlock(facilities: state.hotel!.info.facilities),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: HotelDetailSectionContainer(
                                title: 'Описание отеля',
                                body: KitTextMedium14(state.hotel!.info.description?.description ?? '-'),
                              ),
                            ),
                            Padding(
                              key: priceKey,
                              padding: const EdgeInsets.only(bottom: 14),
                              child: const HotelDetailsRoomsBlock(),
                            ),
                            Padding(
                              key: conditionsKey,
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
                                        'Отель ${state.hotel!.info.name} принимает особые пожелания - добавьте их на следующем шаге',
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
                                                    'Отель ${state.hotel!.info.name} принимает эти карты и оставляет за собой право предварительного бокирования средств на карте до вашего приезда',
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
        },
      ),
    );
  }
}
