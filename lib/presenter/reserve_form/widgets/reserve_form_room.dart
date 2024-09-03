import 'package:flutter/material.dart';
import 'package:numeroid/presenter/reserve_form/widgets/reserve_form_expand_container.dart';
import 'package:numeroid/widgets/kit/texts.dart';

import '../../../widgets/components/buttons.dart';

class ReserveFormRoom extends StatefulWidget {
  const ReserveFormRoom({super.key});

  @override
  State<ReserveFormRoom> createState() => _ReserveFormRoomState();
}

class _ReserveFormRoomState extends State<ReserveFormRoom> {
  int _page = 0;

  void _setPage(int page) {
    setState(() {
      _page = page;
    });
  }

  Row pagePicker() {
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: (_page == 0)
              ? AppButtonOutlineBlue(
                  text: 'Взрослые',
                  radius: 8,
                  onTap: () {
                    _setPage(0);
                  },
                )
              : AppButtonOutlineBlack(
                  text: 'Взрослые',
                  radius: 8,
                  onTap: () {
                    _setPage(0);
                  },
                ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 90,
          child: (_page == 1)
              ? AppButtonOutlineBlue(
                  text: 'Дети',
                  radius: 8,
                  onTap: () {
                    _setPage(1);
                  },
                )
              : AppButtonOutlineBlack(
                  text: 'Дети',
                  radius: 8,
                  onTap: () {
                    _setPage(1);
                  },
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReserveFormExpandContainer(
      title: 'Номер',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: KitTextSemibold15('Количество гостей'),
          ),
          pagePicker(),

          // Padding(
          //   padding: const EdgeInsets.only(bottom: 12),
          //   child: KitTextField(
          //     onChange: (value) {},
          //     title: 'Поздний выезд',
          //   ),
          // ),
        ],
      ),
    );
  }
}
