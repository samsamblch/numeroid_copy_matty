import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/presenter/reserve_form/widgets/reserve_form_expand_container.dart';
import 'package:numeroid/widgets/kit/kit_textfield.dart';
import 'package:numeroid/widgets/kit/texts.dart';

class ReserveFormPersonalData extends StatelessWidget {
  const ReserveFormPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return ReserveFormExpandContainer(
      title: 'Введите свои данные',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Ваше имя',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Ваша фамилия',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Ваше отчество',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Адрес эл.почты',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextSemibold13(
              'На этот адрес будет отправлено подтверждение бронирования',
              color: appTheme.colors.text.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextField(
              onChange: (value) {},
              title: 'Телефон',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: KitTextSemibold13(
              'Необходим объекту размещения, чтобы убедиться в действительности вашего бронирования',
              color: appTheme.colors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
