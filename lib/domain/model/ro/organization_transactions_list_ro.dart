import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/organization_transaction.dart';

part 'organization_transactions_list_ro.g.dart';

@JsonSerializable()
class OrganizationTransactionListRo {
  final List<OrganizationTransaction> data;

  OrganizationTransactionListRo({
    required this.data,
  });

  factory OrganizationTransactionListRo.fromJson(Map<String, dynamic> json) =>
      _$OrganizationTransactionListRoFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationTransactionListRoToJson(this);
}
