import 'package:flutter/material.dart';

import '../../../domain/model/dto/facility.dart';
import '../../../utils/dialogs.dart';
import '../../../widgets/kit/buttons.dart';
import '../../../widgets/kit/texts.dart';
import 'hotel_detail_section_container.dart';

class HotelDetailFacilitiesBlock extends StatelessWidget {
  const HotelDetailFacilitiesBlock({
    super.key,
    required this.facilities,
  });

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
                    Flexible(child: KitTextMedium14(e.name)),
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
    return HotelDetailSectionContainer(
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
                  Flexible(child: KitTextMedium14(e.name)),
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
