import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/bloc/search/search_bloc.dart';
import '../../../domain/model/bo/hotel.dart';
import '../../../domain/repository/booking_repository.dart';

part 'hotel_detail_screen_bloc.freezed.dart';
part 'hotel_detail_screen_event.dart';
part 'hotel_detail_screen_state.dart';

class HotelDetailScreenBloc extends Bloc<_HotelDetailScreenEvent, HotelDetailScreenState> {
  HotelDetailScreenBloc({
    required this.hotelId,
    required this.searchBloc,
  }) : super(
          HotelDetailScreenState(searchState: searchBloc.state),
        ) {
    on<HotelDetailScreenInit>(_onSearchWelcomeScreenInit);
    on<HotelDetailScreenUpdate>(_onSearchWelcomeScreenUpdate);

    subscription = searchBloc.stream.listen(_handleSearchBloc);

    add(HotelDetailScreenInit());
  }

  final int hotelId;
  final SearchBloc searchBloc;
  late StreamSubscription subscription;

  void _handleSearchBloc(SearchState searchState) {
    if (!isClosed) {
      add(HotelDetailScreenUpdate(searchState: searchState));
    }
  }

  Future<void> _onSearchWelcomeScreenInit(
    HotelDetailScreenInit event,
    Emitter<HotelDetailScreenState> emit,
  ) async {
    final result = await BookingRepository().loadHotel(
      hotelId: hotelId,
      searchParameters: searchBloc.state.search,
    );

    if (result != null) {
      emit(
        state.copyWith(
          hotel: result,
          searchState: searchBloc.state,
          loading: false,
        ),
      );
    }
  }

  Future<void> _onSearchWelcomeScreenUpdate(
    HotelDetailScreenUpdate event,
    Emitter<HotelDetailScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        searchState: event.searchState,
      ),
    );
  }
}
