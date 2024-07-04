import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numeroid/generated/locale_keys.g.dart';

import '../../../core/app_router.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/locator.dart';
import '../../../widgets/kit/app_typography.dart';

class GreatDealsModel {
  const GreatDealsModel({
    required this.name,
    required this.assetPath,
  });

  final String name;
  final String assetPath;
}

class GreatDealsBlock extends StatelessWidget {
  GreatDealsBlock({
    super.key,
  });

  final List<GreatDealsModel> dealsList = [
    GreatDealsModel(
      name: LocaleKeys.promo_moscow.tr(),
      assetPath: 'assets/images/promo/moscow.jpg',
    ),
    GreatDealsModel(
      name: LocaleKeys.promo_petersburg.tr(),
      assetPath: 'assets/images/promo/petersburg.jpg',
    ),
    GreatDealsModel(
      name: LocaleKeys.promo_sochi.tr(),
      assetPath: 'assets/images/promo/sochi.jpg',
    ),
    GreatDealsModel(
      name: LocaleKeys.promo_kaliningrad.tr(),
      assetPath: 'assets/images/promo/kaliningrad.jpg',
    ),
    GreatDealsModel(
      name: LocaleKeys.promo_nizhny.tr(),
      assetPath: 'assets/images/promo/nizhny.jpg',
    ),
    GreatDealsModel(
      name: LocaleKeys.promo_kazan.tr(),
      assetPath: 'assets/images/promo/kazan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Выгодные предложения',
                style: KitTextStyles.bold18,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: dealsList.length,
                itemBuilder: (context, index) {
                  final item = dealsList[index];
                  return InkWell(
                      onTap: () {
                        if (appBloc.state.isLogged) {
                          appNavigator.pushRoute(const SearchRoute());
                        } else {
                          appNavigator.push(AppRouterPage.login);
                        }
                      },
                      child: _DealCard(item: item));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DealCard extends StatelessWidget {
  const _DealCard({
    required this.item,
  });

  final GreatDealsModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 250,
        // height: 160,
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                item.assetPath,
                height: 132,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.name,
                    style: KitTextStyles.bold15,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
