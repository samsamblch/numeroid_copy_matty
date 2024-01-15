// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:numeroid/domain/model/bo/hotel.dart' as _i19;
import 'package:numeroid/presenter/auth/forgot_password_finish_screen.dart'
    as _i3;
import 'package:numeroid/presenter/auth/forgot_password_screen.dart' as _i4;
import 'package:numeroid/presenter/auth/login_screen.dart' as _i6;
import 'package:numeroid/presenter/auth/password_screen.dart' as _i9;
import 'package:numeroid/presenter/booking/booking_screen.dart' as _i1;
import 'package:numeroid/presenter/favourites/favourites_screen.dart' as _i2;
import 'package:numeroid/presenter/hotel/hotel_detail_screen.dart' as _i5;
import 'package:numeroid/presenter/main_screen.dart' as _i7;
import 'package:numeroid/presenter/organization_settings/organization_settings_screen.dart'
    as _i8;
import 'package:numeroid/presenter/profile/profile_screen.dart' as _i10;
import 'package:numeroid/presenter/profile_settings/profile_settings_screen.dart'
    as _i11;
import 'package:numeroid/presenter/search/search_filter_screen.dart' as _i12;
import 'package:numeroid/presenter/search/search_screen.dart' as _i13;
import 'package:numeroid/presenter/search/search_welcome_screen.dart' as _i14;
import 'package:numeroid/presenter/splash_screen.dart' as _i15;
import 'package:numeroid/presenter/support_center/support_center_screen.dart'
    as _i16;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    BookingRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookingScreen(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavouritesScreen(),
      );
    },
    ForgotPasswordFinishRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordFinishRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ForgotPasswordFinishScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ForgotPasswordScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    HotelDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HotelDetailRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HotelDetailScreen(
          key: args.key,
          hotel: args.hotel,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainScreen(),
      );
    },
    OrganizationSettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OrganizationSettingsScreen(),
      );
    },
    PasswordRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.PasswordScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileScreen(),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileSettingsScreen(),
      );
    },
    SearchFilterRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SearchFilterScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SearchScreen(),
      );
    },
    SearchWelcomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SearchWelcomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashScreen(),
      );
    },
    SupportCenterRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SupportCenterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookingScreen]
class BookingRoute extends _i17.PageRouteInfo<void> {
  const BookingRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavouritesScreen]
class FavouritesRoute extends _i17.PageRouteInfo<void> {
  const FavouritesRoute({List<_i17.PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordFinishScreen]
class ForgotPasswordFinishRoute
    extends _i17.PageRouteInfo<ForgotPasswordFinishRouteArgs> {
  ForgotPasswordFinishRoute({
    _i18.Key? key,
    required String email,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordFinishRoute.name,
          args: ForgotPasswordFinishRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordFinishRoute';

  static const _i17.PageInfo<ForgotPasswordFinishRouteArgs> page =
      _i17.PageInfo<ForgotPasswordFinishRouteArgs>(name);
}

class ForgotPasswordFinishRouteArgs {
  const ForgotPasswordFinishRouteArgs({
    this.key,
    required this.email,
  });

  final _i18.Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPasswordFinishRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i17.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i18.Key? key,
    required String email,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i17.PageInfo<ForgotPasswordRouteArgs> page =
      _i17.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    required this.email,
  });

  final _i18.Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i5.HotelDetailScreen]
class HotelDetailRoute extends _i17.PageRouteInfo<HotelDetailRouteArgs> {
  HotelDetailRoute({
    _i18.Key? key,
    required _i19.Hotel hotel,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          HotelDetailRoute.name,
          args: HotelDetailRouteArgs(
            key: key,
            hotel: hotel,
          ),
          initialChildren: children,
        );

  static const String name = 'HotelDetailRoute';

  static const _i17.PageInfo<HotelDetailRouteArgs> page =
      _i17.PageInfo<HotelDetailRouteArgs>(name);
}

class HotelDetailRouteArgs {
  const HotelDetailRouteArgs({
    this.key,
    required this.hotel,
  });

  final _i18.Key? key;

  final _i19.Hotel hotel;

  @override
  String toString() {
    return 'HotelDetailRouteArgs{key: $key, hotel: $hotel}';
  }
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OrganizationSettingsScreen]
class OrganizationSettingsRoute extends _i17.PageRouteInfo<void> {
  const OrganizationSettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OrganizationSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrganizationSettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PasswordScreen]
class PasswordRoute extends _i17.PageRouteInfo<PasswordRouteArgs> {
  PasswordRoute({
    _i18.Key? key,
    required String email,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          PasswordRoute.name,
          args: PasswordRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'PasswordRoute';

  static const _i17.PageInfo<PasswordRouteArgs> page =
      _i17.PageInfo<PasswordRouteArgs>(name);
}

class PasswordRouteArgs {
  const PasswordRouteArgs({
    this.key,
    required this.email,
  });

  final _i18.Key? key;

  final String email;

  @override
  String toString() {
    return 'PasswordRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileSettingsScreen]
class ProfileSettingsRoute extends _i17.PageRouteInfo<void> {
  const ProfileSettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SearchFilterScreen]
class SearchFilterRoute extends _i17.PageRouteInfo<void> {
  const SearchFilterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchFilterRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SearchScreen]
class SearchRoute extends _i17.PageRouteInfo<void> {
  const SearchRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SearchWelcomeScreen]
class SearchWelcomeRoute extends _i17.PageRouteInfo<void> {
  const SearchWelcomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchWelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchWelcomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SupportCenterScreen]
class SupportCenterRoute extends _i17.PageRouteInfo<void> {
  const SupportCenterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SupportCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportCenterRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
