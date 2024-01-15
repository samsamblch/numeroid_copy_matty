import 'package:json_annotation/json_annotation.dart';

import 'cancel_conditions.dart';
import 'meal.dart';
import 'price.dart';
import 'room.dart';

part 'hotel_offer.g.dart';

@JsonSerializable()
class HotelOffer {
  @JsonKey(name: 'hotel_id')
  final int hotelId;
  final Price price;
  final List<Room> rooms;
  final List<Meal>? meals;
  @JsonKey(name: 'cancel_conditions')
  final CancelConditions cancelConditions;

  HotelOffer({
    required this.hotelId,
    required this.price,
    required this.rooms,
    required this.meals,
    required this.cancelConditions,
  });

  factory HotelOffer.fromJson(Map<String, dynamic> json) =>
      _$HotelOfferFromJson(json);

  Map<String, dynamic> toJson() => _$HotelOfferToJson(this);
}
