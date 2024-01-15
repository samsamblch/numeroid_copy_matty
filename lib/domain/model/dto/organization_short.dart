import 'package:json_annotation/json_annotation.dart';

part 'organization_short.g.dart';

@JsonSerializable()
class OrganizationShort {
  final int id;

  OrganizationShort({
    required this.id,
  });

  factory OrganizationShort.fromJson(Map<String, dynamic> json) =>
      _$OrganizationShortFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationShortToJson(this);
}