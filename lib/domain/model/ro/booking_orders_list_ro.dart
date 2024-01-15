import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/ro/booking_orders_ro.dart';

part 'booking_orders_list_ro.g.dart';

@JsonSerializable()
class BookingOrdersListRo {
  final BookingOrdersRo data;

  BookingOrdersListRo({
    required this.data,
  });

  factory BookingOrdersListRo.fromJson(Map<String, dynamic> json) =>
      _$BookingOrdersListRoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingOrdersListRoToJson(this);
}
