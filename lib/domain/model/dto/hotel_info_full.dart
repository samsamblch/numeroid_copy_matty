import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/hotel_description.dart';

import 'facility.dart';
import 'photo.dart';
import 'room.dart';

part 'hotel_info_full.g.dart';

@JsonSerializable(includeIfNull: true)
class HotelInfoFull {
  final int id;
  @JsonKey(name: 'name_ru', defaultValue: '')
  final String name;
  @JsonKey(name: 'category', defaultValue: 0)
  final int rate;
  @JsonKey(name: 'address_ru', defaultValue: '')
  final String address;
  final HotelDescription? description;

  @JsonKey(defaultValue: [])
  final List<Facility> facilities;
  final List<Photo>? photos;

  @JsonKey(defaultValue: [])
  final List<Room> rooms;

  // String get address => '';
  // HotelDescription? get description => null;
  // List<Facility> get facilities => [];
  // List<Photo>? get photos => [];
  // List<Room> get rooms => [];

  HotelInfoFull({
    required this.id,
    required this.name,
    required this.rate,
    required this.address,
    required this.description,
    required this.facilities,
    required this.photos,
    required this.rooms,
  });

  factory HotelInfoFull.fromJson(Map<String, dynamic> json) => _$HotelInfoFullFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoFullToJson(this);
}
