part of 'hotel_detail_screen_bloc.dart';

@freezed
class HotelDetailScreenState with _$HotelDetailScreenState {
  factory HotelDetailScreenState({
    required final SearchState searchState,
    final Hotel? hotel,
    @Default(true) final bool loading,
  }) = _HotelDetailScreenState;

  const HotelDetailScreenState._();
}
