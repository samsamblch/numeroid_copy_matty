import 'package:json_annotation/json_annotation.dart';

part 'transaction_hotel.g.dart';

@JsonSerializable()
class TransactionHotel {
  @JsonKey(name: 'hotel_name')
  final String name;
  @JsonKey(name: 'hotel_address')
  final String address;

  TransactionHotel({
    required this.name,
    required this.address,
  });

  factory TransactionHotel.fromJson(Map<String, dynamic> json) => _$TransactionHotelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHotelToJson(this);
}
