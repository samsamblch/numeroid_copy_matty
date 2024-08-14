part of 'app_bloc.dart';

@immutable
sealed class AppState {
  const AppState();

  bool get isLogged => this is AppRunningAuth;
}

final class AppStarting extends AppState {
  const AppStarting();
}

final class AppRunningUnauth extends AppState {
  const AppRunningUnauth();
}

final class AppRunningAuth extends AppState {
  const AppRunningAuth({
    required this.user,
  });

  final User user;
}
