import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';

@JsonSerializable(includeIfNull: true)
class Facility {
  Facility({
    required this.id,
    required this.name1,
    required this.name2,
    required this.category,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);

  final int id;
  @JsonKey(name: 'name_ru')
  final String? name1;
  @JsonKey(name: 'name')
  final String? name2;
  final FacilityCategory? category;

  String get imagePath => 'assets/icons/facilities/category_${category?.id}.png';
  String get name => name1 ?? name2 ?? '';
}

@JsonSerializable(includeIfNull: true)
class FacilityCategory {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;

  FacilityCategory({
    required this.id,
    required this.name,
  });

  factory FacilityCategory.fromJson(Map<String, dynamic> json) => _$FacilityCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityCategoryToJson(this);
}
