import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/kit/texts.dart';

import '../../../domain/model/dto/room.dart';
import '../../../utils/dialogs.dart';
import 'hotel_detail_images_block.dart';

class HotelDetailRoomDetailDialog extends StatelessWidget {
  const HotelDetailRoomDetailDialog({
    super.key,
    required this.room,
  });

  final Room room;

  static void showSheet({
    required BuildContext context,
    required Room room,
  }) {
    Dialogs.showAppDialog(
      context: context,
      title: 'Подробнее о номере',
      body: HotelDetailRoomDetailDialog(
        room: room,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KitTextSemibold16(room.name),
              const SizedBox(height: 6),
              KitTextSemibold14(
                '${room.area}кв.м',
                color: appTheme.colors.text.secondary,
              ),
              const SizedBox(height: 10),
              KitTextMedium14(room.description ?? ''),
            ],
          ),
        ),
        HotelDetailImagesBlock(photos: room.photos),
        // ...facilities.map(
        //   (e) => Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 5),
        //     child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       Image.asset(
        //         e.imagePath,
        //         width: 24,
        //         height: 24,
        //       ),
        //       const SizedBox(width: 6),
        //       Flexible(child: KitTextMedium14(e.name)),
        //     ]),
        //   ),
        // ),
      ],
    );
  }
}
