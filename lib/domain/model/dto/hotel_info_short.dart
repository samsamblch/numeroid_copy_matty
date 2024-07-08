import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/city.dart';
import 'package:numeroid/domain/model/dto/country.dart';
import 'package:numeroid/domain/model/dto/photo.dart';

part 'hotel_info_short.g.dart';

@JsonSerializable(includeIfNull: true)
class HotelInfoShort {
  final int id;
  @JsonKey(name: 'name_ru', defaultValue: '')
  final String name;
  final Photo? photo;
  @JsonKey(name: 'category', defaultValue: 0)
  final int rate;
  @JsonKey(name: 'address_ru')
  final String? address;
  final City? city;

  HotelInfoShort({
    required this.id,
    required this.name,
    required this.photo,
    required this.rate,
    required this.address,
    required this.city,
  });

  factory HotelInfoShort.fromJson(Map<String, dynamic> json) => _$HotelInfoShortFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoShortToJson(this);
}
