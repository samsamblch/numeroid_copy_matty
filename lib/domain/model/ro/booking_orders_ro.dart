import 'package:json_annotation/json_annotation.dart';

import '../dto/hotel_short.dart';
import '../dto/order.dart';

part 'booking_orders_ro.g.dart';

@JsonSerializable()
class BookingOrdersRo {
  final List<Order> orders;
  final List<HotelShort> hotels;

  BookingOrdersRo({
    required this.orders,
    required this.hotels,
  });

  factory BookingOrdersRo.fromJson(Map<String, dynamic> json) =>
      _$BookingOrdersRoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingOrdersRoToJson(this);
}