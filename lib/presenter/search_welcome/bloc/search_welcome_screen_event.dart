part of 'search_welcome_screen_bloc.dart';

@immutable
sealed class _SearchWelcomeScreenEvent {}

class SearchWelcomeScreenInit extends _SearchWelcomeScreenEvent {
  SearchWelcomeScreenInit();
}

class SearchWelcomeScreenUpdate extends _SearchWelcomeScreenEvent {
  SearchWelcomeScreenUpdate({required this.searchState});

  final SearchState searchState;
}

class SearchWelcomeTapSearch extends _SearchWelcomeScreenEvent {
  SearchWelcomeTapSearch();
}

class SearchWelcomeTapDeal extends _SearchWelcomeScreenEvent {
  SearchWelcomeTapDeal();
}
