import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/hotel_description.dart';

import 'facility.dart';
import 'photo.dart';
import 'room.dart';

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
  @JsonKey(name: 'rooms', includeIfNull: true, defaultValue: [])
  final List<Room> privateRooms;

  HotelDetails({
    required this.id,
    required this.name,
    required this.stars,
    required this.address,
    required this.description,
    required this.facilities,
    required this.photos,
    required this.privateRooms,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) => _$HotelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);

  int get rate => stars ?? 0;

  List<Room> get rooms => privateRooms ?? [];
}
