import 'package:json_annotation/json_annotation.dart';

import '../dto/city.dart';

part 'locations_ro.g.dart';

@JsonSerializable()
class LocationsRo {
  final List<City> cities;

  LocationsRo({
    required this.cities,
  });

  factory LocationsRo.fromJson(Map<String, dynamic> json) => _$LocationsRoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsRoToJson(this);
}
