part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class StartSearch extends SearchEvent {
  final SearchParams searchParameters;

  StartSearch({required this.searchParameters});
}

class ChangeFilterParameters extends SearchEvent {
  final FilterParameters filterParameters;

  ChangeFilterParameters({
    required this.filterParameters,
  });
}

class ChangeSearchDates extends SearchEvent {
  final DateTime begin;
  final DateTime end;

  ChangeSearchDates({
    required this.begin,
    required this.end,
  });
}

class ChangeRooms extends SearchEvent {
  final List<SearchRoom> rooms;

  ChangeRooms({
    required this.rooms,
  });
}
