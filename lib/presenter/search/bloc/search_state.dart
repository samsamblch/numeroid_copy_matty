part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final SearchParams search;
  final FilterParameters filter;

  const SearchState({required this.search, required this.filter});
}

final class SearchInitial extends SearchState {
  const SearchInitial({required super.filter, required super.search});
}

final class SearchProccess implements SearchState {
  // const SearchProccess({filter});
  @override
  final SearchParams search;
  @override
  final FilterParameters filter;

  SearchProccess({required this.search, required this.filter});
}

final class SearchError extends SearchState {
  const SearchError({required super.filter, required super.search});
}

final class SearchFinish extends SearchState {
  const SearchFinish({
    required this.hotels,
    required super.search,
    required super.filter,
  });

  final List<Hotel> hotels;
}
