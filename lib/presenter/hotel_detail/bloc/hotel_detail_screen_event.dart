part of 'hotel_detail_screen_bloc.dart';

@immutable
sealed class _HotelDetailScreenEvent {}

class HotelDetailScreenInit extends _HotelDetailScreenEvent {
  HotelDetailScreenInit();
}

class HotelDetailScreenUpdate extends _HotelDetailScreenEvent {
  HotelDetailScreenUpdate({required this.searchState});

  final SearchState searchState;
}
