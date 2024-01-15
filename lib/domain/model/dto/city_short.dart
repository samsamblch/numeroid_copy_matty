import 'package:json_annotation/json_annotation.dart';

part 'city_short.g.dart';

@JsonSerializable()
class CityShort {
  final int id;
  @JsonKey(name: 'name_ru')
  final String name;

  CityShort({
    required this.id,
    required this.name,
  });

  factory CityShort.fromJson(Map<String, dynamic> json) => _$CityShortFromJson(json);

  Map<String, dynamic> toJson() => _$CityShortToJson(this);
}