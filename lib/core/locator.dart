import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:numeroid/core/locator.config.dart';
import 'package:numeroid/domain/database/database.dart';
import 'package:numeroid/domain/network/server_api.dart';

import '../domain/network/network_service.dart';
import '../domain/bloc/app/app_bloc.dart';
import '../presenter/search/bloc/search_bloc.dart';
import 'app_navigator.dart';
import 'app_theme.dart';

AppNavigator get appNavigator => locator<AppNavigator>();
AppTheme get appTheme => locator<AppTheme>();
ServerApi get unauthApi => locator<NetworkService>().api;
ServerApi get authApi => locator<AuthNetworkService>().api;
AppBloc get appBloc => locator<AppBloc>();

final locator = GetIt.I;

@InjectableInit()
void setupLocator() {
  locator.init();
}

@module
abstract class RegisterModule {
  @singleton
  AppNavigator get appNavigator => AppNavigator();

  @singleton
  AppTheme get appTheme => AppTheme();

  @singleton
  NetworkService get unauthNetworkService => NetworkService();

  @singleton
  AuthNetworkService get authNetworkService => AuthNetworkService();

  @singleton
  SearchBloc get searchBloc => SearchBloc();

  @singleton
  AppBloc get appBloc => AppBloc();

  @singleton
  DataBase get db => DataBase();
}
