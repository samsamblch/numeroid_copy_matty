import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';

@JsonSerializable()
class Facility {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;
  final FacilityCategory? category;

  Facility({
    required this.id,
    required this.name,
    required this.category,
  });

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);

  String get imagePath {
    print(category?.id);
    final path = 'assets/icons/facilities/category_${category?.id}.png';
    return path;
    // print(path);
    // return File(path).existsSync() ? path : 'assets/icons/facilities/category_8.png';
  }
}

@JsonSerializable()
class FacilityCategory {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;

  FacilityCategory({
    required this.id,
    required this.name,
  });

  factory FacilityCategory.fromJson(Map<String, dynamic> json) =>
      _$FacilityCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityCategoryToJson(this);
}
