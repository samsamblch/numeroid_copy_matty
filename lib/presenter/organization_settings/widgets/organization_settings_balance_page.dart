import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/model/dto/organization.dart';
import 'package:numeroid/domain/model/dto/organization_transaction.dart';
import 'package:numeroid/utils/formatters.dart';
import 'package:numeroid/widgets/components/textfield.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/components/containers.dart';

import '../../../utils/dialogs.dart';

class OrganizationSettingsBalancePage extends StatefulWidget {
  const OrganizationSettingsBalancePage({super.key, required this.org});

  final Organization org;

  @override
  State<OrganizationSettingsBalancePage> createState() =>
      _OrganizationSettingsBalancePageState();
}

class _OrganizationSettingsBalancePageState
    extends State<OrganizationSettingsBalancePage> {
  List<OrganizationTransaction> transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransaction();
  }

  Future<void> loadTransaction() async {
    final result = await authApi.getOrgApi().transactionsGet();
    setState(() {
      transactions = result.data?.data ?? [];
    });
  }

  void onTapReplenish() {
    final column = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Прошу пополнить баланс аккаунта на сумму',
            style: AppTypography.semiBold14,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AppTextField(
              title: '',
              onChange: (value) {},
              suffix: 'руб.',
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/attach.png',
                width: 26,
                height: 26,
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'Прикрепить документ, подтверждающий проведение оплаты',
                    style: AppTypography.medium13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AppButtonBlue(
              text: 'Отправить запрос',
              onTap: () {},
              enable: false,
            ),
          ),
        ],
      ),
    );

    Dialogs.showAppDialog(
      context: context,
      title: 'Запрос на пополнение',
      body: column,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Ваш текущий баланс',
                          style: AppTypography.semiBold14.copyWith(
                            color: appTheme.colors.text.secondary,
                          ),
                        ),
                      ),
                      Text(
                        Formatters.formatMoney(
                            sum: widget.org.balanceSum, currency: 'rub'),
                        style: AppTypography.bold16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: AppButtonBlue(
                      text: 'Запрос на пополнение',
                      onTap: onTapReplenish,
                    ),
                  ),
                ),
                ...transactions.map(
                  (e) => BalanceCard(
                    transaction: e,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: AppButtonOutlineBlue(text: 'Показать еще', onTap: () {}),
        ),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.transaction,
  });

  final OrganizationTransaction transaction;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Formatters.formatMoney2(
                    sum: transaction.balanceSum,
                    currency: 'rub',
                  ),
                  style: AppTypography.bold16.copyWith(
                    color: transaction.balanceSum < 0
                        ? appTheme.colors.brand.red
                        : appTheme.colors.brand.greenDarky,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: transaction.localeType,
                        style: AppTypography.regular13.copyWith(
                          color: appTheme.colors.text.primary,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: transaction.order.orderCode,
                        style: AppTypography.semiBold14.copyWith(
                          color: appTheme.colors.elements.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  // height: 34,
                  decoration: BoxDecoration(
                    // color:
                    border: Border.all(
                      color: transaction.statusColor,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      transaction.localeStatus,
                      style: AppTypography.medium13.copyWith(
                        color: transaction.statusColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
