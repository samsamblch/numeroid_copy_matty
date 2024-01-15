import 'package:json_annotation/json_annotation.dart';

import 'order.dart';
import 'hotel_short.dart';

part 'booking_order.g.dart';

@JsonSerializable()
class BookingOrder {
  final Order order;
  final HotelShort hotel;

  BookingOrder({
    required this.order,
    required this.hotel,
  });

  factory BookingOrder.fromJson(Map<String, dynamic> json) => _$BookingOrderFromJson(json);

  Map<String, dynamic> toJson() => _$BookingOrderToJson(this);
}
