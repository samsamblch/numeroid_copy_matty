import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;
  @JsonKey(name: 'name_ru')
  final String name;
  final Country country;

  City({
    required this.id,
    required this.name,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
