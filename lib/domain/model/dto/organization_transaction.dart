import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/model/dto/transaction_hotel.dart';
import 'package:numeroid/domain/model/dto/transaction_order.dart';

part 'organization_transaction.g.dart';

@JsonSerializable()
class OrganizationTransaction {
  final int id;
  final String status;
  final String type;
  final TransactionOrder order;
  final TransactionHotel hotel;
  @JsonKey(name: 'value')
  final String balance;

  OrganizationTransaction({
    required this.id,
    required this.status,
    required this.type,
    required this.order,
    required this.hotel,
    required this.balance,
  });

  factory OrganizationTransaction.fromJson(Map<String, dynamic> json) =>
      _$OrganizationTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationTransactionToJson(this);

  String get localeType => switch (type) {
        'order_cancel' => 'Отмена бронирования',
        'order_book' => 'Списание за удержание штрафа по бронированию',
        String() => type,
      };

  String get localeStatus => switch (status) {
        'accepted' => 'Проведена',
        'declined' => 'Отклонена',
        String() => status,
      };

  double get balanceSum => double.parse(balance);

  Color get statusColor => switch (status) {
        'accepted' => appTheme.colors.brand.greenDarky,
        'declined' => appTheme.colors.brand.red,
        String() => appTheme.colors.brand.grey,
      };
}

//  {
//             "id": 79,
//             "status": "accepted",
//             "type": "order_cancel",
//             "value": "118192",
//             "org_id": 1,
//             "order_id": 47,
//             "order_code": "616E-A14F-F8228",
//             "user_id": 8,
//             "order": {
//                 "order_code": "616E-A14F-F8228",
//                 "arrival_date": "2024-06-20",
//                 "departure_date": "2024-06-23",
//                 "customer_first_name": "Елена",
//                 "customer_last_name": "Ковязина",
//                 "customer_middle_name": null
//             },
//             "hotel": {
//                 "hotel_name": "Кристалл Хаус Сьют Отель&СПА",
//                 "hotel_address": "улица Сергеева, 4"
//             },
//             "created_at": "2024-04-25T11:39:28Z",
//             "updated_at": "2024-04-25T11:39:28Z"
//         },