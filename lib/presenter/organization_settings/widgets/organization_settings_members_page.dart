import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/model/dto/organization_member.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/components/containers.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../../utils/dialogs.dart';
import '../../../widgets/components/dropfield.dart';
import '../../../widgets/kit/kit_textfield.dart';

class OrganizationSettingsMembersPage extends StatefulWidget {
  const OrganizationSettingsMembersPage({super.key});

  @override
  State<OrganizationSettingsMembersPage> createState() => _OrganizationSettingsMembersPageState();
}

class _OrganizationSettingsMembersPageState extends State<OrganizationSettingsMembersPage> {
  List<OrganizationMember> members = [];

  @override
  void initState() {
    super.initState();
    loadMembers();
  }

  Future<void> loadMembers() async {
    final result = await authApi.getOrgApi().workersGet();
    setState(() {
      members = result.data?.data ?? [];
    });
  }

  void onTapDelete({required OrganizationMember member}) {
    Dialogs.showAppDialog(
      context: context,
      title: 'Удалить сотрудника',
      body: DeleteDialogBody(
        fio: member.localeFIO,
        onTapDelete: () {},
      ),
    );
  }

  void onTapEdit({required OrganizationMember member}) {
    Dialogs.showAppDialog(
      context: context,
      title: 'Изменить роль',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сотрудник',
              style: KitTextStyles.semiBold14,
            ),
            const SizedBox(height: 4),
            Text(
              member.localeFIO ?? '',
              style: KitTextStyles.medium14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AppDropField(
                title: 'Роль',
                texts: const ['Пользователь', 'Администратор'],
                selectedText: member.localeRole(),
              ),
            ),
            AppButtonBlue(
              text: 'Сохранить',
              onTap: () {
                appNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onTapInvite() {
    Dialogs.showAppDialog(
      context: context,
      title: 'Пригласить сотрудника',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: KitTextField(
                onChange: (value) {},
                title: 'Имя',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: KitTextField(
                onChange: (value) {},
                title: 'Фамилия',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: KitTextField(
                onChange: (value) {},
                title: 'Отчество',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: KitTextField(
                onChange: (value) {},
                title: 'Телефон',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: KitTextField(
                onChange: (value) {},
                title: 'Почта',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: KitTextField(
                onChange: (value) {},
                title: 'Роль',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: AppButtonBlue(
                text: 'Пригласить сотрудника',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: AppButtonBlue(
                text: 'Пригласить сотрудника',
                onTap: _onTapInvite,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...members.map(
            (e) => _MemberCard(
              member: e,
              onTapEdit: () {
                onTapEdit(member: e);
              },
              onTapDelete: () {
                onTapDelete(member: e);
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class DeleteDialogBody extends StatelessWidget {
  const DeleteDialogBody({
    super.key,
    required this.fio,
    required this.onTapDelete,
  });

  final String? fio;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Вы уверены, что хотите удалить\nсотрудника ',
                  style: KitTextStyles.medium14.copyWith(
                    color: appTheme.colors.text.primary,
                  ),
                ),
                TextSpan(
                  text: fio,
                  style: KitTextStyles.semiBold14.copyWith(
                    color: appTheme.colors.text.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AppButtonOutlineBlack(
              text: 'Отменить',
              onTap: () {
                appNavigator.pop();
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AppButtonRed(
              text: 'Удалить сотрудника',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard({
    required this.member,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final OrganizationMember member;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: appTheme.colors.border.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (member.localeFIO != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Имя сотрудника',
                                style: KitTextStyles.semiBold14,
                              ),
                              Text(
                                member.localeFIO!,
                                style: KitTextStyles.medium14,
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Роль',
                              style: KitTextStyles.semiBold14,
                            ),
                            Text(
                              member.localeRole(),
                              style: KitTextStyles.medium14,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Контакты',
                            style: KitTextStyles.semiBold14,
                          ),
                          Text(
                            member.email,
                            style: KitTextStyles.medium14,
                          ),
                          if (member.phone != null)
                            Text(
                              member.phone!,
                              style: KitTextStyles.medium14,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: appTheme.colors.border.grey,
                          ),
                        ),
                        onPressed: onTapEdit,
                        child: Icon(
                          Icons.edit_outlined,
                          color: appTheme.colors.elements.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: appTheme.colors.border.grey,
                          ),
                        ),
                        onPressed: onTapDelete,
                        child: Icon(
                          Icons.delete_outlined,
                          color: appTheme.colors.elements.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
