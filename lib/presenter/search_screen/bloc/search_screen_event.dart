part of 'search_screen_bloc.dart';

@immutable
sealed class SearchScreenEvent {}

class SearchScreenInit extends SearchScreenEvent {
  SearchScreenInit();
}

class SearchScreenUpdate extends SearchScreenEvent {
  SearchScreenUpdate({required this.searchState});

  final SearchState searchState;
}
