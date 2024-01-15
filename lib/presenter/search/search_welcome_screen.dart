import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numeroid/core/app_router.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/presenter/search/bloc/search_bloc.dart';

import '../../core/app_typography.dart';
import '../../core/locator.dart';
import '../../generated/locale_keys.g.dart';
import '../../widgets/components/spacers.dart';
import 'widgets/great_deals_block.dart';
import 'widgets/yellow_search_panel.dart';

@RoutePage()
class SearchWelcomeScreen extends StatelessWidget {
  const SearchWelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: appTheme.colors.background.blue,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.welcome_text_1.tr(),
                        style:
                            AppTypography.bold18.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const VerticalSpacer8(),
                      Text(
                        LocaleKeys.welcome_text_2.tr(),
                        style: AppTypography.semiBold14
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: YellowSearchPanel(
                    onTapSearch: (searchParameters) {
                      if (appBloc.state.isLogged) {
                        if (searchParameters.city != null) {
                          locator<SearchBloc>().add(
                            StartSearch(searchParameters: searchParameters),
                          );
                          appNavigator.pushRoute(const SearchRoute());
                        }
                      } else {
                        appNavigator.push(AppRouterPage.login);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GreatDealsBlock(),
          ),
        ],
      ),
    );
  }
}
