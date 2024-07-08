part of 'search_screen_bloc.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    @Default(false) final bool loading,
    required final SearchState searchState,
  }) = _SearchScreenState;

  const SearchScreenState._();
}
