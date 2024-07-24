import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/domain/bloc/search/search_bloc.dart';

import '../../core/locator.dart';
import '../../generated/locale_keys.g.dart';
import '../../widgets/components/spacers.dart';
import '../../widgets/kit/app_typography.dart';
import 'bloc/search_welcome_screen_bloc.dart';
import 'widgets/great_deals_block.dart';
import 'widgets/yellow_search_panel.dart';

class SearchWelcomeScreen extends StatelessWidget {
  const SearchWelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchWelcomeScreenBloc(
        searchBloc: locator<SearchBloc>(),
      ),
      child: BlocListener<SearchWelcomeScreenBloc, SearchWelcomeScreenState>(
        listener: (context, state) {
          if (state.errorMsg != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMsg ?? 'Error'),
                duration: Durations.medium3,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: appTheme.colors.background.blue,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
                      child: Column(
                        children: [
                          Text(
                            LocaleKeys.welcome_text_1.tr(),
                            style: KitTextStyles.bold18.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const VerticalSpacer8(),
                          Text(
                            LocaleKeys.welcome_text_2.tr(),
                            style: KitTextStyles.semiBold14.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: YellowSearchPanel(),
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
        ),
      ),
    );
  }
}
