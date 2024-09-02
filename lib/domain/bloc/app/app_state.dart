part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    User? loggedUser,
    @Default(true) final bool isStarting,
  }) = _AppState;

  const AppState._();

  bool get isLogged => user != null;

  User get user => user!;
}
