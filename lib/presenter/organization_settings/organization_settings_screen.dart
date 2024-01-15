import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/domain/model/dto/organization.dart';
import 'package:numeroid/presenter/organization_settings/widgets/organization_settings_main_page.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import '../../core/locator.dart';
import 'widgets/organization_settings_balance_page.dart';
import 'widgets/organization_settings_members_page.dart';

@RoutePage()
class OrganizationSettingsScreen extends StatefulWidget {
  const OrganizationSettingsScreen({super.key});

  @override
  State<OrganizationSettingsScreen> createState() =>
      _OrganizationSettingsScreenState();
}

class _OrganizationSettingsScreenState
    extends State<OrganizationSettingsScreen> {
  Organization? org;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  Future<void> loadInfo() async {
    final result = await authApi.getOrgApi().infoGet();
    setState(() {
      org = result.data;
    });
  }

  void _setPage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 16),
              child: Text(
                'Организация',
                style: AppTypography.bold18,
              ),
            ),
            if (org != null) pagePicker(),
            if (org != null)
              Expanded(
                child: SingleChildScrollView(
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: (_page == 0)
                          ? OrganizationSettingsMainPage(
                              company: org!.company,
                            )
                          : (_page == 1)
                              ? OrganizationSettingsBalancePage(org: org!)
                              : (_page == 2)
                                  ? const OrganizationSettingsMembersPage()
                                  : null,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Row pagePicker() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: (_page == 0)
              ? AppButtonOutlineBlue(
                  text: 'Основное',
                  radius: 8,
                  onTap: () {
                    _setPage(0);
                  },
                )
              : AppButtonOutlineBlack(
                  text: 'Основное',
                  radius: 8,
                  onTap: () {
                    _setPage(0);
                  },
                ),
        ),
        const SizedBox(width: 6),
        Expanded(
          flex: 3,
          child: (_page == 1)
              ? AppButtonOutlineBlue(
                  text: 'Баланс',
                  radius: 8,
                  onTap: () {
                    _setPage(1);
                  },
                )
              : AppButtonOutlineBlack(
                  text: 'Баланс',
                  radius: 8,
                  onTap: () {
                    _setPage(1);
                  },
                ),
        ),
        const SizedBox(width: 6),
        Expanded(
          flex: 4,
          child: (_page == 2)
              ? AppButtonOutlineBlue(
                  text: 'Сотрудники',
                  radius: 8,
                  onTap: () {
                    _setPage(2);
                  },
                )
              : AppButtonOutlineBlack(
                  text: 'Сотрудники',
                  radius: 8,
                  onTap: () {
                    _setPage(2);
                  },
                ),
        ),
      ],
    );
  }
}
