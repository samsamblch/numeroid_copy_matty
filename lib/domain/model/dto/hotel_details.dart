import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/hotel_description.dart';

import 'facility.dart';
import 'photo.dart';

part 'hotel_details.g.dart';

@JsonSerializable()
class HotelDetails {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;
  @JsonKey(name: 'category')
  final int? stars;
  @JsonKey(name: 'address_ru')
  final String? address;
  final HotelDescription? description;
  final List<Facility>? facilities;
  final List<Photo>? photos;

  HotelDetails({
    required this.id,
    required this.name,
    required this.stars,
    required this.address,
    required this.description,
    required this.facilities,
    required this.photos,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) => _$HotelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);

  int get rate => stars ?? 0;
}
