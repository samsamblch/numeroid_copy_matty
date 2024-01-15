import 'package:flutter/material.dart';

import '../../../core/app_typography.dart';
import '../../../core/locator.dart';
import 'profile_settings_page_banner.dart';

class ProfileSettingsWelcomePage extends StatelessWidget {
  const ProfileSettingsWelcomePage({
    super.key,
    required this.onTapPerson,
    required this.onTapNotify,
    required this.onTapSecure,
  });

  final VoidCallback onTapPerson;
  final VoidCallback onTapNotify;
  final VoidCallback onTapSecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'Настройки аккаунта',
            style: AppTypography.bold18,
          ),
          Text(
            'Настройте Нумероид под себя',
            style: AppTypography.semiBold16.copyWith(
              color: appTheme.colors.text.secondary,
            ),
          ),
          const SizedBox(height: 16),
          ProfileSettingsPageBanner(
            title: 'Персональные данные',
            subTitle: 'Заполните свои данные',
            iconPath: 'assets/icons/user.png',
            onTap: onTapPerson,
          ),
          ProfileSettingsPageBanner(
            title: 'Электронная рассылка',
            subTitle:
                'Укажите, какие уведомления вы хотите получать, а какие - нет',
            iconPath: 'assets/icons/send.png',
            onTap: onTapNotify,
          ),
          ProfileSettingsPageBanner(
            title: 'Безопасность',
            subTitle: 'Настройте параметры безопасности',
            iconPath: 'assets/icons/safety.png',
            onTap: onTapSecure,
          ),
        ],
      ),
    );
  }
}
