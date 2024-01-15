import 'package:json_annotation/json_annotation.dart';

import 'photo.dart';

part 'hotel_info.g.dart';

@JsonSerializable()
class HotelInfo {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;
  final Photo? photo;
  @JsonKey(name: 'category')
  final int? stars;
  // final City? city;

  HotelInfo({
    required this.id,
    required this.name,
    required this.photo,
    required this.stars,
    // required this.city,
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}