part of 'search_bloc.dart';

@immutable
sealed class _SearchEvent {}

class SearchStart extends _SearchEvent {
  SearchStart();
}

class SearchChangeCity extends _SearchEvent {
  SearchChangeCity({required this.city});

  final City? city;
}

class SearchChangeDate extends _SearchEvent {
  SearchChangeDate({
    required this.start,
    required this.end,
  });

  final DateTime start;
  final DateTime end;
}

class SearchChangeRoom extends _SearchEvent {
  SearchChangeRoom({
    required this.rooms,
  });

  final List<SearchRoomReq> rooms;
}

class SearchChangeSort extends _SearchEvent {
    SearchChangeSort({
    required this.sort,
  });

  final SortType sort;


}
