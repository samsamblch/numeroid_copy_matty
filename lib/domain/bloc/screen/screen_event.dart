part of 'screen_bloc.dart';

@immutable
sealed class ScreenEvent {}

class ScreenLoadData extends ScreenEvent {
  ScreenLoadData();
}

class ScreenLoadDataError extends ScreenEvent {
  ScreenLoadDataError({
    required this.message,
  });

  final String message;
}
