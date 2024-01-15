import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/company.dart';

part 'organization.g.dart';

@JsonSerializable()
class Organization {
  final int id;
  final Company company;
  final String balance;

  Organization( {
    required this.id,
    required this.company,
    required this.balance,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  double get balanceSum => double.parse(balance);
}
 
// {
//     "id": 1,
//     "name": "test",
//     "company_id": 1,
//     "token": "554484ee-fd78-48f1-a252-56dc3ab45a4a",
//     "options": 0,
//     "balance": "1015427",
//     "voucher_type": "docx",
//     "voucher_file": {
//         "url": "https://s3.numeroid.ru/hotels/85cb78e6-3886-4ef8-ac04-114103720462.docx",
//         "uuid": "85cb78e6-3886-4ef8-ac04-114103720462",
//         "user_id": null,
//         "disk": "s3",
//         "mime_type": "",
//         "size": 1805055,
//         "origin_name": "aeroton_template (шаблон Ваучера Аэротон).docx",
//         "created_at": "2024-04-18T12:21:53Z",
//         "updated_at": "2024-04-18T12:21:53Z"
//     },
//     "created_at": "2023-10-13T15:38:55Z",
//     "updated_at": "2024-04-25T11:39:28Z",
//     "company": {
//         "id": 1,
//         "name_ru": "тестовая компания",
//         "name_en": null,
//         "itn": "9999999999",
//         "legal_address": null,
//         "actual_address": null,
//         "email": null,
//         "phone": null,
//         "deleted_at": null,
//         "fax": null,
//         "description": null,
//         "iec": "111111111",
//         "bic": null,
//         "okpo": null,
//         "psrn": null,
//         "bank": null,
//         "corr_account": null,
//         "account": null,
//         "created_at": "2023-10-13T11:35:24Z",
//         "updated_at": "2023-10-13T11:35:24Z"
//     }
// }