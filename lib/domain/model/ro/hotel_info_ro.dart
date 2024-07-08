import 'package:json_annotation/json_annotation.dart';

import '../dto/facility.dart';
import '../dto/hotel_info_short.dart';

part 'hotel_info_ro.g.dart';

@JsonSerializable()
class HotelInfoRo {
  final List<HotelInfoShort>? hotels;
  final List<Facility>? facilities;

  HotelInfoRo({
    required this.hotels,
    required this.facilities,
  });

  factory HotelInfoRo.fromJson(Map<String, dynamic> json) => _$HotelInfoRoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoRoToJson(this);
}
