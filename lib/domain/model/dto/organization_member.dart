import 'package:json_annotation/json_annotation.dart';

part 'organization_member.g.dart';

@JsonSerializable()
class OrganizationMember {
  final int id;
  final String email;
  final String? phone;
  final String role;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;

  OrganizationMember({
    required this.id,
    required this.email,
    required this.phone,
    required this.role,
    required this.firstName,
    required this.lastName,
  });

  factory OrganizationMember.fromJson(Map<String, dynamic> json) =>
      _$OrganizationMemberFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationMemberToJson(this);

  String localeRole() {
    switch (role) {
      case 'admin':
        return 'Администратор';
      default:
        return 'Пользователь';
    }
  }

  String? get localeFIO {
    String? result;
    if (firstName != null) {
      result = firstName;
    }
    if (lastName != null) {
      result = (result != null) ? '$result $lastName' : lastName;
    }

    return result;
  }
}



//  {
//             "id": 14,
//             "email": "iosmishka@gmail.com",
//             "org_id": 1,
//             "phone": "34765898908",
//             "first_name": "Михаил",
//             "last_name": "Матвеев",
//             "role": "admin",
//             "active": true,
//             "birth_date": null,
//             "gender": null,
//             "citizenship": null
//         },