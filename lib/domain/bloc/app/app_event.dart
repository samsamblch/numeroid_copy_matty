part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class AuthLogin extends AppEvent {
  AuthLogin({
    required this.response,
  });

  final LoginRo response;
}

class AppStart extends AppEvent {
  AppStart();
}

class AuthLogout extends AppEvent {
  AuthLogout();
}