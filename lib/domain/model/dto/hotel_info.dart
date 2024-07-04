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
  @JsonKey(name: 'address_ru')
  final String? address;
  @JsonKey(name: 'facilities')
  final List<int>? facilities;

  HotelInfo({
    required this.id,
    required this.name,
    required this.photo,
    required this.stars,
    required this.address,
    required this.facilities,
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) => _$HotelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);

  int get rate => stars ?? 0;
}
