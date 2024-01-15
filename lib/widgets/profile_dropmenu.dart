import 'package:flutter/material.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/components/containers.dart';

class ProfileDropMenu extends StatelessWidget {
  const ProfileDropMenu({
    super.key,
    required this.onTapSettings,
    required this.onTapOrganization,
    required this.onTapBooking,
    required this.onTapFavourite,
    required this.onTapLogout,
    required this.onTapClose,
  });

  final VoidCallback onTapSettings;
  final VoidCallback onTapOrganization;
  final VoidCallback onTapBooking;
  final VoidCallback onTapFavourite;
  final VoidCallback onTapLogout;

  final VoidCallback onTapClose;
  @override
  Widget build(BuildContext context) {
    var separator = Container(
      height: 1,
      color: appTheme.colors.border.grey,
    );
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTapClose,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 48),
                  child: SizedBox(
                    width: 200,
                    child: WhiteContainer(
                      child: Column(
                        children: [
                          _MenuItem(
                            onTapSettings: onTapSettings,
                            title: 'Управлять аккаунтом',
                            imagePath: 'assets/icons/settings_gear.png',
                          ),
                          separator,
                          _MenuItem(
                            onTapSettings: onTapOrganization,
                            title: 'Организация',
                            imagePath: 'assets/icons/organization.png',
                          ),
                          separator,
                          _MenuItem(
                            onTapSettings: onTapBooking,
                            title: 'Мои бронирования',
                            imagePath: 'assets/icons/ticket.png',
                          ),
                          separator,
                          _MenuItem(
                            onTapSettings: onTapFavourite,
                            title: 'Сохраненное',
                            imagePath: 'assets/icons/heart.png',
                          ),
                          separator,
                          _MenuItem(
                            onTapSettings: onTapLogout,
                            title: 'Выйти',
                            imagePath: 'assets/icons/logout.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.onTapSettings,
    required this.title,
    required this.imagePath,
  });

  final VoidCallback onTapSettings;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapSettings,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
              color: appTheme.colors.text.primary,
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                title,
                style: AppTypography.medium13.copyWith(
                  color: appTheme.colors.text.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
