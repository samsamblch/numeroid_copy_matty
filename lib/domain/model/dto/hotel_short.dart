import 'package:json_annotation/json_annotation.dart';

import 'city_short.dart';
import 'photo.dart';

part 'hotel_short.g.dart';

@JsonSerializable()
class HotelShort {
  final int id;
  @JsonKey(name: 'name_ru')
  final String name;
  final Photo photo;
  final CityShort city;

  HotelShort({
    required this.id,
    required this.name,
    required this.photo,
    required this.city,
  });

  factory HotelShort.fromJson(Map<String, dynamic> json) => _$HotelShortFromJson(json);

  Map<String, dynamic> toJson() => _$HotelShortToJson(this);
}