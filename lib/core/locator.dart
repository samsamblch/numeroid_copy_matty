import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:numeroid/core/locator.config.dart';
import 'package:numeroid/domain/database/database.dart';
import 'package:numeroid/domain/network/server_api.dart';

import '../domain/network/network_service.dart';
import '../domain/bloc/app/app_bloc.dart';
import '../domain/bloc/search/search_bloc.dart';
import '../widgets/kit/app_theme.dart';

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
