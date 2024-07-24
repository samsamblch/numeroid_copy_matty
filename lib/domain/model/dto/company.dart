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
  @JsonKey(name: 'legal_address')
  final String? legalAddress;
  @JsonKey(name: 'actual_address')
  final String? actualAddress;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'fax')
  final String? fax;
  @JsonKey(name: 'bic')
  final String? bic;
  @JsonKey(name: 'okpo')
  final String? okpo;
  @JsonKey(name: 'psrn')
  final String? psrn;
  @JsonKey(name: 'bank')
  final String? bank;
  @JsonKey(name: 'corr_account')
  final String? corrAccount;
  @JsonKey(name: 'account')
  final String? account;
  @JsonKey(name: 'phone')
  final String? phone;

  Company({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.inn,
    required this.kpp,
    required this.legalAddress,
    required this.actualAddress,
    required this.account,
    required this.bank,
    required this.bic,
    required this.corrAccount,
    required this.email,
    required this.fax,
    required this.okpo,
    required this.psrn,
    required this.phone,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
