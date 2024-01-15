import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeroid/presenter/profile_settings/widgets/profile_settings_notify_page.dart';
import 'package:numeroid/presenter/profile_settings/widgets/profile_settings_person_page.dart';
import 'package:numeroid/presenter/profile_settings/widgets/profile_settings_secure_page.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import 'widgets/profile_settings_welcome_page.dart';

@RoutePage()
class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  bool _isWelcome = true;

  int _page = 0;

  void _onTapPage({required int index}) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: _isWelcome
          ? ProfileSettingsWelcomePage(
              onTapPerson: () {
                _isWelcome = false;
                _onTapPage(index: 0);
              },
              onTapNotify: () {
                _isWelcome = false;
                _onTapPage(index: 1);
              },
              onTapSecure: () {
                _isWelcome = false;
                _onTapPage(index: 2);
              },
            )
          : _ProfileSettingsScreenBody(
              activePage: _page,
              onTap: (int value) {
                _onTapPage(index: value);
              },
            ),
    );
  }
}

class _ProfileSettingsScreenBody extends StatelessWidget {
  const _ProfileSettingsScreenBody({
    required this.activePage,
    required this.onTap,
  });

  final int activePage;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.,
      child: Column(
        children: [
          getButton(
            text: 'Персональные данные',
            active: activePage == 0,
            onTap: () {
              onTap(0);
            },
          ),
          getButton(
            text: 'Электронная рассылка',
            active: activePage == 1,
            onTap: () {
              onTap(1);
            },
          ),
          getButton(
            text: 'Безопасность',
            active: activePage == 2,
            onTap: () {
              onTap(2);
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: (activePage == 0)
                  ? const ProfileSettingsPersonPage()
                  : (activePage == 1)
                      ? const ProfileSettingsNotifyPage()
                      : (activePage == 2)
                          ? const ProfileSettingsSecurePage()
                          : null,
            ),
          ),
        ],
      ),
    );
  }

  Padding getButton({
    required String text,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: active
            ? AppButtonOutlineBlue(
                text: text,
                radius: 12,
                onTap: onTap,
              )
            : AppButtonOutlineBlack(
                text: text,
                onTap: onTap,
                radius: 12,
              ),
      ),
    );
  }
}
