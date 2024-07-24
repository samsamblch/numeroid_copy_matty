part of 'search_welcome_screen_bloc.dart';

@freezed
class SearchWelcomeScreenState with _$SearchWelcomeScreenState {
  factory SearchWelcomeScreenState({
    required final SearchState searchState,
    String? errorMsg,
  }) = _SearchWelcomeScreenState;

  const SearchWelcomeScreenState._();
}
