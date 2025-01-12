import 'package:flutter/material.dart';

import '../../../core/locator.dart';
import '../../../widgets/components/buttons.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/kit/app_typography.dart';

class ProfileSettingsPageBanner extends StatelessWidget {
  const ProfileSettingsPageBanner({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconPath,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: WhiteContainer(
        shadow: true,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: appTheme.colors.elements.paleBlue,
                    child: Image.asset(
                      iconPath,
                      color: appTheme.colors.brand.blue,
                      width: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: KitTextStyles.bold16,
                        ),
                        Text(
                          subTitle,
                          style: KitTextStyles.medium14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: AppButtonOutlineBlue(
                  text: 'Настроить',
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
