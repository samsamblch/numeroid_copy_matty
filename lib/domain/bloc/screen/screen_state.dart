part of 'screen_bloc.dart';

@immutable
sealed class ScreenState {
  const ScreenState({
    required this.isLoading,
  });

  final bool isLoading;
}

final class ScreenLoadingState extends ScreenState {
  const ScreenLoadingState({
    required super.isLoading,
  });
}

final class ScreenLoadedState extends ScreenState {
  const ScreenLoadedState({
    required super.isLoading,
  });
}

final class ScreenErrorState extends ScreenState {
  const ScreenErrorState({
    required this.message,
    required super.isLoading,
  });

  final String message;
}
