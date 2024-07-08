import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/bo/filter_parameters.dart';
import '../../model/bo/hotel_short.dart';
import '../../model/bo/search_parameters.dart';
import '../../model/bo/sort_type.dart';
import '../../model/dto/city.dart';
import '../../model/req/search_room_req.dart';
import '../../repository/booking_repository.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<_SearchEvent, SearchState> {
  SearchBloc()
      : super(
          SearchState(
            search: SearchParameters(
              startDate: DateTime.now(),
              endDate: DateTime.now().add(const Duration(days: 7)),
              rooms: [SearchRoomReq(adults: 1, childs: [])],
            ),
            filter: FilterParameters(),
            sort: SortType.priceLessToMore,
          ),
        ) {
    on<SearchStart>(_onStartSearch);
    on<SearchChangeCity>(_onChangeCity);
    on<SearchChangeDate>(_onChangeDate);
    on<SearchChangeRoom>(_onChangeRoom);
    on<SearchChangeSort>(_onChangeSort);
  }

  List<HotelShort> _hotels = [];

  Future<void> _onStartSearch(
    SearchStart event,
    Emitter<SearchState> emit,
  ) async {
    _hotels = [];
    emit(state.copyWith(loading: true, hotels: _hotels));
    final result = await BookingRepository().loadHotels(searchParameters: state.search);
    _hotels = result;
    emitFilteredResult();
  }

  Future<void> _onChangeCity(
    SearchChangeCity event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        search: SearchParameters(
          startDate: state.search.startDate,
          endDate: state.search.endDate,
          rooms: state.search.rooms,
          city: event.city,
        ),
      ),
    );
  }

  Future<void> _onChangeDate(
    SearchChangeDate event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        search: SearchParameters(
          startDate: event.start,
          endDate: event.end,
          rooms: state.search.rooms,
          city: state.search.city,
        ),
      ),
    );
  }

  Future<void> _onChangeRoom(
    SearchChangeRoom event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        search: SearchParameters(
          startDate: state.search.startDate,
          endDate: state.search.endDate,
          rooms: event.rooms,
          city: state.search.city,
        ),
      ),
    );
  }

  Future<void> _onChangeSort(
    SearchChangeSort event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(sort: event.sort));
    emitFilteredResult();
  }

  void emitFilteredResult() {
    List<HotelShort> list = List.from(
      _hotels.where(
        (element) => state.filter.approve(element),
      ),
    );

    list.sort((e1, e2) {
      switch (state.sort) {
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
    emit(state.copyWith(loading: false, hotels: list));
  }
}
