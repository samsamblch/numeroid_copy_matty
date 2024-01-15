import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final bool active;

// "active": false,

  User({
    required this.id,
    required this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

 // "user": {
    //     "id": 14,
    //     "email": "iosmishka@gmail.com",
    //     "org_id": 1,
    //     "phone": "34765898908",
    //     "first_name": "Михаил",
    //     "last_name": "Матвеев",
    //     "role": "admin",
    //     "active": true,
    //     "birth_date": null,
    //     "gender": null,
    //     "citizenship": null
    // },
   