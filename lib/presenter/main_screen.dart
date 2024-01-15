import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/core/app_typography.dart';

import '../core/locator.dart';
import '../generated/locale_keys.g.dart';
import 'search/bloc/search_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late PageController _controller;
  int page = 0;

  @override
  void initState() {
    super.initState();

    appNavigator.mainScreenState = this;
  }

  void setPage(int index) {
    setState(() {
      page = index;
    });
    _controller.animateToPage(
      index,
      duration: Durations.medium2,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<SearchBloc>(),
      child: AutoTabsRouter.pageView(
        physics: NeverScrollableScrollPhysics(),
        routes: const [
          SearchWelcomeRoute(),
          FavouritesRoute(),
          BookingRoute(),
          ProfileRoute(),
        ],
        builder: (context, child, controller) {
          _controller = controller;
          return Scaffold(
            body: child,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 2, blurRadius: 20),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                  right: Radius.circular(12),
                ),
                child: BottomNavigationBar(
                    currentIndex: page,
                    onTap: (value) {
                      setPage(value);
                    },
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: appTheme.colors.brand.blue,
                    unselectedItemColor: appTheme.colors.text.secondary,
                    selectedLabelStyle: AppTypography.semiBold12,
                    unselectedLabelStyle: AppTypography.semiBold12,
                    items: [
                      BottomNavigationBarItem(
                        label: LocaleKeys.page_search.tr(),
                        icon: Image.asset(
                          'assets/icons/search.png',
                          height: 24,
                          color: appTheme.colors.text.secondary,
                        ),
                        activeIcon: Image.asset(
                          'assets/icons/search.png',
                          height: 24,
                          color: appTheme.colors.brand.blue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: LocaleKeys.page_favourites.tr(),
                        icon: Image.asset(
                          'assets/icons/heart.png',
                          color: appTheme.colors.text.secondary,
                          height: 24,
                        ),
                        activeIcon: Image.asset(
                          'assets/icons/heart.png',
                          height: 24,
                          color: appTheme.colors.brand.blue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: LocaleKeys.page_booking.tr(),
                        icon: Image.asset(
                          'assets/icons/ticket.png',
                          color: appTheme.colors.text.secondary,
                          height: 24,
                        ),
                        activeIcon: Image.asset(
                          'assets/icons/ticket.png',
                          height: 24,
                          color: appTheme.colors.brand.blue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: LocaleKeys.page_profile.tr(),
                        icon: Image.asset(
                          height: 24,
                          'assets/icons/user.png',
                          color: appTheme.colors.text.secondary,
                        ),
                        activeIcon: Image.asset(
                          'assets/icons/user.png',
                          height: 24,
                          color: appTheme.colors.brand.blue,
                        ),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
