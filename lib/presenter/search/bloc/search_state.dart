part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final SearchParams search;
  final FilterParameters filter;
  final SortType sortType;

  const SearchState({
    required this.search,
    required this.filter,
    required this.sortType,
  });
}

final class SearchInitial extends SearchState {
  const SearchInitial({
    required super.filter,
    required super.search,
    required super.sortType,
  });
}

final class SearchProccess implements SearchState {
  @override
  final SearchParams search;
  @override
  final FilterParameters filter;
  @override
  final SortType sortType;

  SearchProccess({required this.search, required this.filter, required this.sortType});
}

final class SearchError extends SearchState {
  const SearchError({required super.filter, required super.search, required super.sortType});
}

final class SearchFinish extends SearchState {
  const SearchFinish({
    required this.hotels,
    required super.search,
    required super.filter,
    required super.sortType,
  });

  final List<SearchHotel> hotels;
}
