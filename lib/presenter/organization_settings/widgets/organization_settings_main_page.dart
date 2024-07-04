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
              value: company.actualAddress,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Фактический адрес',
              value: company.legalAddress,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Название банка',
              value: company.bank,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Корреспондентский счет',
              value: company.corrAccount,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Расчетный счет',
              value: company.account,
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
              value: company.bic,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'ОКПО',
              value: company.okpo,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'ОГРН',
              value: company.psrn,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'E-mail',
              value: company.email,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Телефон',
              value: company.phone,
              onChange: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppTextField(
              title: 'Факс',
              value: company.fax,
              onChange: (value) {},
            ),
          ),
        ],
      ),
    ));
  }
}
       
//       'created_at': instance.createdAt,
//       'deleted_at': instance.deletedAt,
     
//       'updated_at': instance.updatedAt,
      