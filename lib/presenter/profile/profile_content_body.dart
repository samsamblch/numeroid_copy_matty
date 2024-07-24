import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroid/core/app_route.dart';
import 'package:numeroid/core/locator.dart';

import '../../utils/dialogs.dart';
import '../../widgets/kit/app_typography.dart';

class ProfileContentBody extends StatelessWidget {
  const ProfileContentBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Image.asset(
                'assets/images/robot_welcome.png',
                height: 160,
              ),
            ),
            _MenuBanner(
              assetPath: 'assets/icons/organization_peoples.png',
              title: 'Организация',
              description: 'Управление организацией, сотрудниками и балансом',
              onTap: () => context.push(AppRoutes.organizationSettings),
            ),
            const SizedBox(height: 12),
            _MenuBanner(
              assetPath: 'assets/icons/settings_gear.png',
              title: 'Настройка аккаунта',
              description: 'Настройте Нумероид под себя',
              onTap: () => context.push(AppRoutes.profileSettings),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 20,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MenuButton(
                      title: 'О Нумероид',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'О Нумероид',
                        fileName: 'about.txt',
                      ),
                    ),
                    _MenuButton(
                      title: 'Обьектам размещения',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'Обьектам размещения',
                        fileName: 'pravila_i_poryadok.txt',
                      ),
                    ),
                    _MenuButton(
                      title: 'Правила и условия бронирования',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'Правила и условия бронирования',
                        fileName: 'pravila_i_usloviya_bronirovaniya.txt',
                      ),
                    ),
                    _MenuButton(
                      title: 'Часто задаваемые вопросы',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'Часто задаваемые вопросы',
                        fileName: 'about.txt',
                      ),
                    ),
                    _MenuButton(
                      title: 'Центр поддержки',
                      callback: () => context.push(AppRoutes.supportCenter),
                    ),
                    _MenuButton(
                      title: 'Контакты',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'Контакты',
                        fileName: 'contacts.txt',
                      ),
                    ),
                    _MenuButton(
                      title: 'Политика конфиденциальности',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'Политика конфиденциальности',
                        fileName: 'politika_confidencial_i_personal.txt',
                      ),
                    ),
                    _MenuButton(
                      title: 'Политика использования cookie-файллов',
                      callback: () => Dialogs.showAssetText(
                        context,
                        title: 'Политика использования cookie-файллов',
                        fileName: 'politika_ispolzovaniya_cookie.txt',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _CurrencySelector(),
          ],
        ),
      ),
    );
  }
}

class _CurrencySelector extends StatefulWidget {
  const _CurrencySelector();

  @override
  State<_CurrencySelector> createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<_CurrencySelector> {
  static List<String> list = <String>[
    'Рубль',
    'Евро',
    'Доллар',
  ];

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Валюта',
            style: KitTextStyles.semiBold14,
          ),
          const SizedBox(height: 6),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: appTheme.colors.border.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                underline: Container(height: 0),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          const Text(
                            '₽',
                            style: KitTextStyles.bold14,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            value,
                            style: KitTextStyles.medium14,
                          ),
                        ],
                      ),
                      // Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuBanner extends StatelessWidget {
  const _MenuBanner({
    required this.assetPath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String assetPath;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: appTheme.colors.elements.paleBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Image.asset(
                      assetPath,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: KitTextStyles.bold16,
                      ),
                      Text(
                        description,
                        style: KitTextStyles.medium14,
                      ),
                    ],
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

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.title,
    required this.callback,
  });

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: GestureDetector(
        onTap: callback,
        child: Text(
          title,
          style: KitTextStyles.medium14.copyWith(
            color: appTheme.colors.text.primary,
          ),
        ),
      ),
    );
  }
}
