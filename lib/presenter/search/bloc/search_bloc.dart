import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/presenter/search/models/filter_parameters.dart';

import '../../../domain/model/bo/hotel.dart';
import '../../../domain/model/bo/search_params.dart';
import '../../../domain/model/req/search_req.dart';
import '../../../domain/repository/booking_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc()
      : super(
          SearchInitial(
            search: SearchParams.create(),
            filter: FilterParameters(),
          ),
        ) {
    on<StartSearch>(onStartSearch);
    on<ChangeFilterParameters>(onChangeFilterParameters);
    on<ChangeRooms>(onChangeRooms);
    // on<ChangeSearchDates>(onChangeFilterParameters);
  }

  SearchParams searchParameters = SearchParams.create();
  FilterParameters filterParameters = FilterParameters();
  List<Hotel> _hotels = [];

  Future<void> onStartSearch(
      StartSearch event, Emitter<SearchState> emit) async {
    searchParameters = event.searchParameters;

    emit(SearchProccess(
      search: searchParameters,
      filter: filterParameters,
    ));

    final result = await BookingRepository()
        .loadHotels(searchParameters: searchParameters);
    _hotels = result;

    emitFilteredResult();
  }

  Future<void> onChangeFilterParameters(
      ChangeFilterParameters event, Emitter<SearchState> emit) async {
    filterParameters = event.filterParameters;
    emitFilteredResult();
  }

  Future<void> onChangeSearchDates(
      ChangeSearchDates event, Emitter<SearchState> emit) async {
    // searchParameters.startDate = event.begin;
    // searchParameters.endDate = event.end;

    // emit(SearchState(search: searchParameters, filter: filterParameters));
    // emitFilteredResult();
  }

  Future<void> onChangeRooms(
    ChangeRooms event,
    Emitter<SearchState> emit,
  ) async {
    searchParameters.rooms = event.rooms;
    // searchParameters.endDate = event.end;

    emitFilteredResult();
  }

  void emitFilteredResult() {
    List<Hotel> list = List.from(
      _hotels.where(
        (element) => filterParameters.approve(element),
      ),
    );

    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      SearchFinish(
        hotels: list,
        search: searchParameters,
        filter: filterParameters,
      ),
    );
  }
}
