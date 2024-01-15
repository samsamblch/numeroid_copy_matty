import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/organization_member.dart';

part 'organization_members_list_ro.g.dart';

@JsonSerializable()
class OrganizationMembersListRo {
  final List<OrganizationMember> data;

  OrganizationMembersListRo({
    required this.data,
  });

  factory OrganizationMembersListRo.fromJson(Map<String, dynamic> json) =>
      _$OrganizationMembersListRoFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationMembersListRoToJson(this);
}
