import 'package:json_annotation/json_annotation.dart';

part 'transaction_order.g.dart';

@JsonSerializable()
class TransactionOrder {
  @JsonKey(name: 'order_code')
  final String orderCode;

  @JsonKey(name: 'customer_first_name')
  final String customerFirstName;

  @JsonKey(name: 'customer_last_name')
  final String customerLastName;

  @JsonKey(name: 'arrival_date')
  final String arrivalDate;

  @JsonKey(name: 'departure_date')
  final String departureDate;

  TransactionOrder({
    required this.orderCode,
    required this.customerFirstName,
    required this.customerLastName,
    required this.arrivalDate,
    required this.departureDate,
  });

  factory TransactionOrder.fromJson(Map<String, dynamic> json) =>
      _$TransactionOrderFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionOrderToJson(this);
}
    // "order": {
    //             "order_code": "616E-A14F-F8228",
    //             "arrival_date": "2024-06-20",
    //             "departure_date": "2024-06-23",
    //             "customer_first_name": "Елена",
    //             "customer_last_name": "Ковязина",
    //             "customer_middle_name": null
    //         },
          