import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/presenter/search/models/filter_parameters.dart';

import '../../../domain/model/bo/search_hotel.dart';
import '../../../domain/model/bo/search_params.dart';
import '../../../domain/model/req/search_req.dart';
import '../../../domain/repository/booking_repository.dart';
import '../models/sort_type.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc()
      : super(
          SearchInitial(
            search: SearchParams.create(),
            filter: FilterParameters(),
            sortType: SortType.priceLessToMore,
          ),
        ) {
    on<StartSearch>(onStartSearch);
    on<ChangeFilterParameters>(onChangeFilterParameters);
    on<ChangeRooms>(onChangeRooms);
    on<ChangeSortType>(onChangeSortType);
  }

  SearchParams searchParameters = SearchParams.create();
  FilterParameters filterParameters = FilterParameters();
  List<SearchHotel> _hotels = [];
  SortType _sortType = SortType.priceLessToMore;

  Future<void> onStartSearch(StartSearch event, Emitter<SearchState> emit) async {
    searchParameters = event.searchParameters;

    emit(SearchProccess(
      search: searchParameters,
      filter: filterParameters,
      sortType: _sortType,
    ));

    final result = await BookingRepository().loadHotels(searchParameters: searchParameters);
    _hotels = result;

    emitFilteredResult();
  }

  Future<void> onChangeFilterParameters(ChangeFilterParameters event, Emitter<SearchState> emit) async {
    filterParameters = event.filterParameters;
    emitFilteredResult();
  }

  Future<void> onChangeSortType(
    ChangeSortType event,
    Emitter<SearchState> emit,
  ) async {
    _sortType = event.sortType;
    emitFilteredResult();
  }

  Future<void> onChangeRooms(
    ChangeRooms event,
    Emitter<SearchState> emit,
  ) async {
    searchParameters.rooms = event.rooms;
    emitFilteredResult();
  }

  void emitFilteredResult() {
    List<SearchHotel> list = List.from(
      _hotels.where(
        (element) => filterParameters.approve(element),
      ),
    );

    list.sort((e1, e2) {
      switch (_sortType) {
        case SortType.priceLessToMore:
          return e1.price.value < e2.price.value ? -1 : 1;
        case SortType.priceMoreToLess:
          return e1.price.value > e2.price.value ? -1 : 1;
        case SortType.categoryLessToMore:
          return e1.info.rate < e2.info.rate ? -1 : 1;
        case SortType.categoryMoreToLess:
          return e1.info.rate > e2.info.rate ? -1 : 1;
        case SortType.distance:
          return 1;
      }
    });

    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      SearchFinish(
        hotels: list,
        search: searchParameters,
        filter: filterParameters,
        sortType: _sortType,
      ),
    );
  }
}
