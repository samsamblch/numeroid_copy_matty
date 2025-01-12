import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:numeroid/core/app_route.dart';
import 'package:numeroid/domain/model/ro/login_ro.dart';
import 'package:numeroid/domain/network/network_service.dart';
import 'package:numeroid/domain/repository/user_repository.dart';

import '../../../core/locator.dart';
import '../../model/dto/user.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          AppState(),
        ) {
    on<AuthLogin>(onAuthLogin);
    on<AuthLogout>(onAuthLogout);
    on<AppStart>(onStart);

    add(AppStart());
  }

  Future<void> onStart(
    AppStart event,
    Emitter<AppState> emit,
  ) async {
    final data = await UserRepository().loadAuthData();

    if (data != null) {
      locator<AuthNetworkService>().token = data.token;
      emit(state.copyWith(isStarting: false, loggedUser: data.user));
    } else {
      emit(state.copyWith(isStarting: false));
    }
    AppRoute.router.go(AppRoutes.searchWelcome);
  }

  void onAuthLogin(
    AuthLogin event,
    Emitter<AppState> emit,
  ) {
    locator<AuthNetworkService>().token = event.response.token;
    UserRepository().saveAuthData(event.response);
    emit(
      state.copyWith(
        isStarting: false,
        loggedUser: event.response.user,
      ),
    );
  }

  void onAuthLogout(
    AuthLogout event,
    Emitter<AppState> emit,
  ) {
    locator<AuthNetworkService>().token = '';
    emit(
      state.copyWith(loggedUser: null),
    );
  }
}
