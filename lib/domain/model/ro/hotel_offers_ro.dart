import 'package:json_annotation/json_annotation.dart';

import '../dto/hotel_offer.dart';

part 'hotel_offers_ro.g.dart';

@JsonSerializable()
class HotelOffersRo {
  @JsonKey(name: 'results')
  final List<HotelOffer>? offers;
  @JsonKey(name: 'is_over')
  final bool isOver;

  HotelOffersRo({
    required this.offers,
    required this.isOver,
  });

  factory HotelOffersRo.fromJson(Map<String, dynamic> json) =>
      _$HotelOffersRoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelOffersRoToJson(this);
}
