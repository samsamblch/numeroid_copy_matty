import 'package:flutter/material.dart';
import 'package:numeroid/presenter/reserve_form/widgets/reserve_form_expand_container.dart';
import 'package:numeroid/widgets/kit/kit_textfield.dart';

class ReserveFormAdditionalServices extends StatelessWidget {
  const ReserveFormAdditionalServices({super.key});

  @override
  Widget build(BuildContext context) {
    return ReserveFormExpandContainer(
      title: 'Дополнительные услуги',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Ранний заезд',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Поздний выезд',
            ),
          ),
        ],
      ),
    );
  }
}
