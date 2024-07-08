part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required final SearchParameters search,
    required final FilterParameters filter,
    required final SortType sort,
    @Default(false) final bool loading,
    @Default(null) final String? error,
    @Default([]) final List<HotelShort> hotels,
  }) = _SearchState;

  const SearchState._();
}
