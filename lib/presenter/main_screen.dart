import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numeroid/core/app_route.dart';
import 'package:numeroid/presenter/search_welcome/search_welcome_screen.dart';

import '../core/locator.dart';
import '../generated/locale_keys.g.dart';
import '../widgets/kit/app_typography.dart';
import 'booking/booking_screen.dart';
import 'favourites/favourites_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageStorageBucket _bucket = PageStorageBucket();
  late Widget _currentTab;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _currentTab = _getTabContent(_tabController.index);
  }

  @override
  void didUpdateWidget(MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = _getTabIndexFromRoute(
      AppRoute.router.routerDelegate.currentConfiguration.uri.toString(),
    );
    _currentTab = _getTabContent(_tabController.index);
  }

  int _getTabIndexFromRoute(String route) {
    switch (route) {
      case AppRoutes.searchWelcome:
        return 0;
      case AppRoutes.favourites:
        return 1;
      case AppRoutes.booking:
        return 2;
      case AppRoutes.profile:
        return 3;
      default:
        throw UnimplementedError();
    }
  }

  Widget _getTabContent(int index) {
    switch (index) {
      case 0:
        return const SearchWelcomeScreen();
      case 1:
        return const FavouritesScreen();
      case 2:
        return const BookingScreen();
      case 3:
        return const ProfileScreen();
      default:
        throw UnimplementedError();
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
      _currentTab = _getTabContent(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colors.background.primary,
      body: PageStorage(
        bucket: _bucket,
        child: _currentTab,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 20),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
          child: BottomNavigationBar(
            currentIndex: _tabController.index,
            onTap: (value) {
              _onTabTapped(value);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: appTheme.colors.brand.blue,
            unselectedItemColor: appTheme.colors.text.secondary,
            selectedLabelStyle: KitTextStyles.semiBold12,
            unselectedLabelStyle: KitTextStyles.semiBold12,
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
            ],
          ),
        ),
      ),
    );
  }
}
