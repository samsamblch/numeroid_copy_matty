import 'package:json_annotation/json_annotation.dart';

import '../dto/user.dart';

part 'login_ro.g.dart';

@JsonSerializable()
class LoginRo {
  final String token;
  final User user;

  LoginRo({
    required this.token,
    required this.user,
  });

  factory LoginRo.fromJson(Map<String, dynamic> json) => _$LoginRoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRoToJson(this);
}