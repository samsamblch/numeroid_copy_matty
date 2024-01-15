import 'package:flutter/material.dart';

import '../../../domain/model/dto/company.dart';
import '../../../widgets/components/textfield.dart';
import '../../../widgets/components/containers.dart';

class OrganizationSettingsMainPage extends StatelessWidget {
  const OrganizationSettingsMainPage({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Название на русском',
              value: company.name,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Название на английском',
              value: company.nameEn,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Юридический адрес',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Фактический адрес',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Название банка',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Корреспондентский счет',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Расчетный счет',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'ИНН',
              value: company.inn,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'КПП',
              value: company.kpp,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'БИК',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'ОКПО',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'ОРГН',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'E-mail',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Телефон',
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Факс',
              onChange: (value) {},
            ),
          ),
        ],
      ),
    ));
  }
}
