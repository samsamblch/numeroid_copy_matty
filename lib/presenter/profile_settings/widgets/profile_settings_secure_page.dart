import 'package:flutter/material.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import '../../../core/locator.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/components/textfield.dart';
import '../../../widgets/kit/app_typography.dart';

class ProfileSettingsSecurePage extends StatelessWidget {
  const ProfileSettingsSecurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Безопасность',
          style: KitTextStyles.bold18,
        ),
        const SizedBox(height: 4),
        Text(
          'Настройкте параметры\nбезопасности',
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
                  AppSecureTextField(
                    title: 'Пароль',
                    hintText: 'Введите ваш пароль',
                    onChange: (value) {},
                  ),
                  const SizedBox(height: 16),
                  AppButtonOutlineBlue(text: 'Удалить аккаунт навсегда', onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
