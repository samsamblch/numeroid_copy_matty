import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/model/dto/hotel_details.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/kit/decorations.dart';

import '../../domain/model/dto/facility.dart';
import '../../domain/repository/booking_repository.dart';
import '../../utils/dialogs.dart';
import '../../widgets/kit/buttons.dart';
import '../../widgets/kit/combo_texts.dart';
import '../../widgets/kit/common.dart';
import '../../widgets/kit/stars_rate_view.dart';
import '../../widgets/kit/texts.dart';

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
                      _HeaderBlock(hotel: hotel!),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: _ImagesBlock(),
                      ),
                      if (hotel?.facilities != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _FacilitiesBlock(hotel!.facilities!),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _SectionContainer(
                          title: 'Описание отеля',
                          body: KitTextMedium14(hotel!.description?.description ?? '-'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: _SectionContainer(
                          title: 'Наличие мест',
                          body: KitTextMedium14('Загрузка'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _SectionContainer(
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

class _SectionContainer extends StatelessWidget {
  const _SectionContainer({
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

class _FacilitiesBlock extends StatelessWidget {
  const _FacilitiesBlock(this.facilities);

  final List<Facility> facilities;

  void _showFullFacilities(BuildContext context) {
    Dialogs.showAppDialog(
        context: context,
        title: 'Удобства и услуги',
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...facilities.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Image.asset(
                      e.imagePath,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 6),
                    Flexible(child: KitTextMedium14('<${e.id}>${e.name ?? ''}')),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final faci = (facilities.length > 5) ? facilities.sublist(0, 5) : facilities;
    return _SectionContainer(
      title: 'Самые популярные удобства и услуги',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...faci.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    e.imagePath,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 6),
                  Flexible(child: KitTextMedium14(e.name ?? '')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          KitButtonBlue(
            text: 'Показать все удобства',
            onTap: () => _showFullFacilities(context),
            outlined: true,
          ),
        ],
      ),
    );
  }
}

class _ImagesBlock extends StatelessWidget {
  const _ImagesBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: double.infinity,
      height: 300,
    );
  }
}

class _HeaderBlock extends StatelessWidget {
  const _HeaderBlock({
    required this.hotel,
  });

  final HotelDetails hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: KitTextBold18(hotel.name ?? '<name>'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
          child: StarsRateView(rate: hotel.rate),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
          child: KitLocationText(hotel.address ?? '<address>'),
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
