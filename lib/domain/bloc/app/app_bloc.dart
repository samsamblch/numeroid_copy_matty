import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/domain/model/ro/login_ro.dart';
import 'package:numeroid/domain/network/network_service.dart';
import 'package:numeroid/domain/repository/user_repository.dart';

import '../../../core/app_router.dart';
import '../../../core/locator.dart';
import '../../model/dto/organization_short.dart';
import '../../model/dto/user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          const AppStarting(),
        ) {
    on<AuthLogin>(onAuthLogin);
    on<AuthLogout>(onAuthLogout);
    on<AppStart>(onStart);

    add(AppStart());
  }

  User? _user;
  OrganizationShort? _organization;

  Future<void> onStart(
    AppStart event,
    Emitter<AppState> emit,
  ) async {
    final savedToken = await UserRepository().loadToken();
    if (savedToken != null) {
      locator<AuthNetworkService>().token = savedToken.replaceAll('"', '');
      emit(const AppRunningAuth());
    } else {
      emit(const AppRunningUnauth());
    }
    appNavigator.present(AppRouterPage.main);
  }

  void onAuthLogin(
    AuthLogin event,
    Emitter<AppState> emit,
  ) {
    locator<AuthNetworkService>().token = event.response.token;
    _user = event.response.user;
    // _organization = event.response.org;
    String jsonToken = jsonEncode(event.response.token);
    UserRepository().saveToken(jsonToken);

    emit(const AppRunningAuth());
  }

  void onAuthLogout(
    AuthLogout event,
    Emitter<AppState> emit,
  ) {
    locator<AuthNetworkService>().token = '';

    _user = null;
    _organization = null;
    emit(const AppRunningUnauth());
  }
}
