import 'package:json_annotation/json_annotation.dart';

import '../dto/hotel_info.dart';

part 'hotel_info_ro.g.dart';

@JsonSerializable()
class HotelInfoRo {
  final List<HotelInfo>? hotels;

  HotelInfoRo({
    required this.hotels,
  });

  factory HotelInfoRo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoRoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoRoToJson(this);
}
