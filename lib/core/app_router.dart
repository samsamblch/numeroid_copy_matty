import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: MainRoute.page,
          path: AppRouterPage.main,
          children: [
            AutoRoute(
              page: SearchWelcomeRoute.page,
              path: AppRouterPage.searchWelcome,
            ),
            AutoRoute(
                page: FavouritesRoute.page, path: AppRouterPage.favourites),
            AutoRoute(page: BookingRoute.page, path: AppRouterPage.booking),
            AutoRoute(page: ProfileRoute.page, path: AppRouterPage.profile),
          ],
        ),
        AutoRoute(page: LoginRoute.page, path: AppRouterPage.login),
        AutoRoute(page: PasswordRoute.page, path: AppRouterPage.password),
        AutoRoute(
            page: ForgotPasswordRoute.page, path: AppRouterPage.forgotPassword),
        AutoRoute(
            page: ForgotPasswordFinishRoute.page,
            path: AppRouterPage.forgotPasswordFinish),
        AutoRoute(
            page: SupportCenterRoute.page, path: AppRouterPage.supportCenter),
        AutoRoute(page: SearchRoute.page, path: AppRouterPage.search),
        AutoRoute(
            page: SearchFilterRoute.page, path: AppRouterPage.searchFilter),
        AutoRoute(page: HotelDetailRoute.page, path: AppRouterPage.hotelDetail),
        AutoRoute(
          page: ProfileSettingsRoute.page,
          path: AppRouterPage.profileSettings,
        ),
        AutoRoute(
          page: OrganizationSettingsRoute.page,
          path: AppRouterPage.organizationSettings,
        ),
      ];
}

class AppRouterPage {
  static const String searchWelcome = 'search_welcome';
  static const String favourites = 'favourites';
  static const String booking = 'booking';
  static const String profile = 'profile';
  static const String search = '/search';
  static const String main = '/main';
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
}
