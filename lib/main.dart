import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_route.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/init.dart';
import 'core/locator.dart';
import 'domain/bloc/app/app_bloc.dart';
import 'widgets/blue_header.dart';
import 'widgets/kit/app_theme.dart';
import 'widgets/menu_banner.dart';
import 'widgets/profile_dropmenu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ru')],
      path: 'assets/lang',
      fallbackLocale: const Locale('ru'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: appTheme.colors.background.primary,
        fontFamily: AppTheme.defaultFontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      routerConfig: AppRoute.router,
      builder: (context, child) => BlocProvider.value(
        value: appBloc,
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return state.isStarting ? child! : _AppShell(child: child);
          },
        ),
      ),
    );
  }
}

class _AppShell extends StatefulWidget {
  const _AppShell({this.child});

  final Widget? child;

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  bool _showMenu = false;
  bool _showProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              BlueHeader(
                showMenu: _showMenu,
                onTapSupport: () {
                  setState(() {
                    _showMenu = !_showMenu;
                  });
                },
                onTapProfile: () {
                  setState(() {
                    _showProfile = !_showProfile;
                  });
                },
              ),
              if (widget.child != null) Expanded(child: widget.child!),
            ],
          ),
          if (_showMenu)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() => _showMenu = false);
              },
              child: SizedBox(
                height: double.maxFinite,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 54, left: 10, right: 10),
                    child: Column(
                      children: [
                        MenuBanner(
                          onTapClose: () => setState(() => _showMenu = false),
                          onTapCall: () {
                            setState(() => _showMenu = false);
                            launchUrl(Uri.parse('tel://+74954457445'));
                          },
                          onTapMail: () {
                            setState(() => _showMenu = false);
                            launchUrl(Uri.parse('mailto:booking@numeroid.ru'));
                          },
                          onTapSupport: () {
                            setState(() => _showMenu = false);
                            AppRoute.router.push(AppRoutes.supportCenter);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (_showProfile)
            ProfileDropMenu(
              onTapSettings: () {
                setState(() => _showProfile = false);
                AppRoute.router.go(AppRoutes.profile);
              },
              onTapOrganization: () {
                setState(() => _showProfile = false);
                AppRoute.router.go(AppRoutes.profile);
              },
              onTapBooking: () {
                setState(() => _showProfile = false);
                AppRoute.router.go(AppRoutes.booking);
              },
              onTapFavourite: () {
                setState(() => _showProfile = false);
                AppRoute.router.go(AppRoutes.favourites);
              },
              onTapLogout: () {
                setState(() => _showProfile = false);
                appBloc.add(AuthLogout());
              },
              onTapClose: () {
                setState(() => _showProfile = false);
              },
            )
        ],
      ),
    );
  }
}


// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: ui.TextDirection.ltr,
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Column(
//             children: [
//               BlueHeader(
//                 showMenu: _showMenu,
//                 onTapMenu: () {
//                   setState(() {
//                     _showMenu = !_showMenu;
//                   });
//                 },
//                 onTapProfile: () {
//                   setState(() {
//                     _showProfile = !_showProfile;
//                   });
//                 },
//               ),
//               Expanded(
//                 child: MaterialApp.router(
//                   localizationsDelegates: context.localizationDelegates,
//                   supportedLocales: context.supportedLocales,
//                   locale: context.locale,
//                   theme: ThemeData(
//                     useMaterial3: true,
//                     scaffoldBackgroundColor: appTheme.colors.background.primary,
//                     fontFamily: AppTheme.defaultFontFamily,
//                     appBarTheme: const AppBarTheme(
//                       backgroundColor: Colors.white,
//                     ),
//                   ),
//                   routerConfig: appNavigator.config,
//                 ),
//               ),
//             ],
//           ),
//           if (_showMenu)
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 54, left: 10, right: 10),
//                 child: MenuBanner(
//                   onTapClose: () => setState(() => _showMenu = false),
//                   onTapCall: () {
//                     setState(() => _showMenu = false);
//                     launchUrl(Uri.parse('tel://+74954457445'));
//                   },
//                   onTapMail: () {
//                     setState(() => _showMenu = false);
//                     launchUrl(Uri.parse('mailto:booking@numeroid.ru'));
//                   },
//                   onTapSupport: () {
//                     setState(() => _showMenu = false);
//                     appNavigator.push(AppRouterPage.supportCenter);
//                   },
//                 ),
//               ),
//             ),
//           if (_showProfile)
//             ProfileDropMenu(
//               onTapSettings: () {
//                 setState(() => _showProfile = false);
//                 appNavigator.openTab(3);
//               },
//               onTapOrganization: () {
//                 setState(() => _showProfile = false);
//                 appNavigator.openTab(3);
//               },
//               onTapBooking: () {
//                 setState(() => _showProfile = false);
//                 appNavigator.openTab(2);
//               },
//               onTapFavourite: () {
//                 setState(() => _showProfile = false);
//                 appNavigator.openTab(1);
//               },
//               onTapLogout: () {
//                 setState(() => _showProfile = false);
//                 appBloc.add(AuthLogout());
//               },
//             )
//         ],
//       ),
//     );
//   }
// }
