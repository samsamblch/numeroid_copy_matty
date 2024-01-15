import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @JsonKey(name: 'itn')
  final String? inn;
  @JsonKey(name: 'iec')
  final String? kpp;

  Company({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.inn,
    required this.kpp,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}