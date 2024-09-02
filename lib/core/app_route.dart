import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroid/presenter/auth/forgot_password_finish_screen.dart';
import 'package:numeroid/presenter/reserve_form/reserve_form_screen.dart';

import '../domain/model/bo/hotel.dart';
import '../presenter/auth/forgot_password_screen.dart';
import '../presenter/auth/login_screen.dart';
import '../presenter/auth/password_screen.dart';
import '../presenter/booking/booking_screen.dart';
import '../presenter/favourites/favourites_screen.dart';
import '../presenter/hotel_detail/hotel_detail_screen.dart';
import '../presenter/main_screen.dart';
import '../presenter/organization_settings/organization_settings_screen.dart';
import '../presenter/profile/profile_screen.dart';
import '../presenter/profile_settings/profile_settings_screen.dart';
import '../presenter/search_screen/search_filter_screen.dart';
import '../presenter/search_screen/search_screen.dart';
import '../presenter/search_welcome/search_welcome_screen.dart';
import '../presenter/splash_screen.dart';
import '../presenter/support_center/support_center_screen.dart';

class AppRoute {
  factory AppRoute() => _instance;
  AppRoute._internal() {
    // initialization logic
  }

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final AppRoute _instance = AppRoute._internal();
  static final GoRouter _router = GoRouter(
    routes: _routeBase,
    navigatorKey: _rootNavigatorKey,
  );

  ///list of route base for the router
  static final List<RouteBase> _routeBase = [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.searchWelcome,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchWelcomeScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.favourites,
          builder: (BuildContext context, GoRouterState state) {
            return const FavouritesScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.booking,
          builder: (BuildContext context, GoRouterState state) {
            return const BookingScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.password,
      builder: (BuildContext context, GoRouterState state) {
        return PasswordScreen(email: state.extra as String);
      },
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (BuildContext context, GoRouterState state) {
        return ForgotPasswordScreen(email: state.extra as String);
      },
    ),
    GoRoute(
      path: AppRoutes.forgotPasswordFinish,
      builder: (BuildContext context, GoRouterState state) {
        return ForgotPasswordFinishScreen(email: state.extra as String);
      },
    ),
    GoRoute(
      path: AppRoutes.supportCenter,
      builder: (BuildContext context, GoRouterState state) {
        return const SupportCenterScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.search,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.searchFilter,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchFilterScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.hotelDetail,
      builder: (BuildContext context, GoRouterState state) {
        return HotelDetailScreen(
          hotelId: state.extra as int,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.profileSettings,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileSettingsScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.organizationSettings,
      builder: (BuildContext context, GoRouterState state) {
        return const OrganizationSettingsScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.reserve,
      builder: (BuildContext context, GoRouterState state) {
        return ReserveFormScreen(hotel: state.extra as Hotel);
      },
    ),
  ];

  ///return router object
  static GoRouter get router => _router;

  static void popUntilRoot() {
    while (_router.canPop()) {
      _router.pop();
    }
  }
}

class AppRoutes {
  static const String searchWelcome = '/search_welcome';
  static const String favourites = '/favourites';
  static const String booking = '/booking';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String profileSettings = '/profile_settings';
  static const String login = '/login';
  static const String password = '/password';
  static const String createPassword = '/create_password';
  static const String forgotPassword = '/forgot_password';
  static const String forgotPasswordFinish = '/forgot_password_finish';
  static const String supportCenter = '/support_center';
  static const String searchFilter = '/search_filter';
  static const String hotelDetail = '/hotel_detail';
  static const String organizationSettings = '/organization_settings';
  static const String reserve = '/reserve';
}
