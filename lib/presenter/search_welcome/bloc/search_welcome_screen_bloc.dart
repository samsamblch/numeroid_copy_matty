import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:numeroid/domain/bloc/search/search_bloc.dart';

import '../../../core/app_router.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/locator.dart';

part 'search_welcome_screen_bloc.freezed.dart';
part 'search_welcome_screen_event.dart';
part 'search_welcome_screen_state.dart';

class SearchWelcomeScreenBloc extends Bloc<_SearchWelcomeScreenEvent, SearchWelcomeScreenState> {
  SearchWelcomeScreenBloc({
    required this.searchBloc,
  }) : super(
          SearchWelcomeScreenState(searchState: searchBloc.state),
        ) {
    on<SearchWelcomeScreenInit>(_onSearchWelcomeScreenInit);
    on<SearchWelcomeScreenUpdate>(_onSearchWelcomeScreenUpdate);
    on<SearchWelcomeTapSearch>(_onSearchWelcomeTapSearch);
    on<SearchWelcomeTapDeal>(_onSearchWelcomeTapDeal);

    subscription = searchBloc.stream.listen(_handleSearchBloc);
  }

  final SearchBloc searchBloc;
  late StreamSubscription subscription;

  void _handleSearchBloc(SearchState searchState) => add(
        SearchWelcomeScreenUpdate(searchState: searchState),
      );

  Future<void> _onSearchWelcomeScreenInit(
    SearchWelcomeScreenInit event,
    Emitter<SearchWelcomeScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        searchState: searchBloc.state,
      ),
    );
  }

  Future<void> _onSearchWelcomeScreenUpdate(
    SearchWelcomeScreenUpdate event,
    Emitter<SearchWelcomeScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        searchState: event.searchState,
      ),
    );
  }

  Future<void> _onSearchWelcomeTapSearch(
    SearchWelcomeTapSearch event,
    Emitter<SearchWelcomeScreenState> emit,
  ) async {
    if (appBloc.state.isLogged) {
      searchBloc.add(SearchStart());
      appNavigator.pushRoute(const SearchRoute());
    } else {
      appNavigator.push(AppRouterPage.login);
    }
  }

  Future<void> _onSearchWelcomeTapDeal(
    SearchWelcomeTapDeal event,
    Emitter<SearchWelcomeScreenState> emit,
  ) async {
    if (appBloc.state.isLogged) {
      searchBloc.add(SearchStart());
      appNavigator.pushRoute(const SearchRoute());
    } else {
      appNavigator.push(AppRouterPage.login);
    }
  }
}
