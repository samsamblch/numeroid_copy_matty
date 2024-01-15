import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../presenter/main_screen.dart';
import 'app_router.dart';

class AppNavigator {
  final key = GlobalKey<NavigatorState>();

  final appRouter = AppRouter();

  NavigatorState get navigator => key.currentState!;

  NavigatorState? get maybeNavigator => key.currentState;

  RouterConfig<UrlState> get config => appRouter.config();

  late MainScreenState? mainScreenState;

  void push(String pageName) {
    appRouter.pushNamed(pageName);
  }

  void pushRoute(PageRouteInfo route) {
    appRouter.push(route);
  }

  void present(String pageName) {
    appRouter.replaceNamed(pageName);
  }

  void popRoot() {
    appRouter.popUntilRoot();
  }

  void pop() {
    appRouter.maybePop();
  }

  void openTab(int page) {
    appRouter.popUntilRoot();
    mainScreenState?.setPage(page);
  }
}
