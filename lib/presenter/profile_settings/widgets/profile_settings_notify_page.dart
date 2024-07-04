import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/components/containers.dart';
import 'package:numeroid/widgets/components/textfield.dart';

import '../../../widgets/kit/app_typography.dart';

class ProfileSettingsNotifyPage extends StatelessWidget {
  const ProfileSettingsNotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Электронная рассылка',
          style: KitTextStyles.bold18,
        ),
        const SizedBox(height: 4),
        Text(
          'Укажите, какие уведомления вы\nхотите получать, а какие - нет',
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
            child: AppTextField(title: 'Электронная почта', hintText: 'Введите адрес эл.почты', onChange: (value) {}),
          )),
        ),
      ],
    );
  }
}
