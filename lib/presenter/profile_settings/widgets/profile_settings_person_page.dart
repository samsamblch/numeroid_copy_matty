import 'package:flutter/material.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../../core/locator.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/kit/kit_textfield.dart';

class ProfileSettingsPersonPage extends StatelessWidget {
  const ProfileSettingsPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Персональные данные',
          style: KitTextStyles.bold18,
        ),
        const SizedBox(height: 4),
        Text(
          'Заполните свои данные',
          style: KitTextStyles.medium14.copyWith(
            color: appTheme.colors.text.secondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: WhiteContainer(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  KitTextField(
                    title: 'Имя',
                    hintText: 'Введите ваше имя',
                    onChange: (value) {},
                  ),
                  const SizedBox(height: 12),
                  KitTextField(
                    title: 'Телефон',
                    hintText: 'Введите номер телефона',
                    onChange: (value) {},
                  ),
                  const SizedBox(height: 12),
                  KitTextField(
                    title: 'Электронная почта',
                    hintText: 'Введите адрес эл.почты',
                    onChange: (value) {},
                  ),
                  const SizedBox(height: 12),
                  KitTextField(
                    title: 'Дата рождения',
                    hintText: 'ДД ММ ГГ',
                    onChange: (value) {},
                  ),
                  const SizedBox(height: 12),
                  KitTextField(
                    title: 'Гражданство',
                    hintText: 'Выберите страну/регион',
                    onChange: (value) {},
                  ),
                  const SizedBox(height: 12),
                  KitTextField(
                    title: 'Пол',
                    hintText: 'Мужской/Женский',
                    onChange: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
