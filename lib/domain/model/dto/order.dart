import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/price.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String code;
  final Price price;
  @JsonKey(name: 'arrival_date')
  final String arrivalDate;
  @JsonKey(name: 'departure_date')
  final String departureDate;
  @JsonKey(name: 'hotel_id')
  final int hotelId;
  final int status;

  Order({
    required this.code,
    required this.price,
    required this.arrivalDate,
    required this.departureDate,
    required this.hotelId,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  String displayStatus() {
    switch (status) {
      case 2:
        return 'Отменен';
      case 6:
        return 'Отклонен';
      default:
        return 'Не определен';
    }
  }
}
