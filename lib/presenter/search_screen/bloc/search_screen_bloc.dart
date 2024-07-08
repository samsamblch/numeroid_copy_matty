import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/bloc/search/search_bloc.dart';

part 'search_screen_bloc.freezed.dart';
part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc({
    required this.searchBloc,
  }) : super(
          SearchScreenState(searchState: searchBloc.state),
        ) {
    on<SearchScreenInit>(_onSearchScreenInit);
    on<SearchScreenUpdate>(_onSearchScreenUpdate);

    subscription = searchBloc.stream.listen(_handleSearchBloc);
  }

  final SearchBloc searchBloc;
  late StreamSubscription subscription;

  void _handleSearchBloc(SearchState searchState) {
    add(SearchScreenUpdate(searchState: searchState));
  }

  Future<void> _onSearchScreenInit(
    SearchScreenInit event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        searchState: searchBloc.state,
      ),
    );
  }

  Future<void> _onSearchScreenUpdate(
    SearchScreenUpdate event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        searchState: event.searchState,
      ),
    );
  }
}
