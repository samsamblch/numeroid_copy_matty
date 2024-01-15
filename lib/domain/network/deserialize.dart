import 'package:numeroid/domain/model/dto/organization.dart';
import 'package:numeroid/domain/model/ro/booking_orders_list_ro.dart';
import 'package:numeroid/domain/model/ro/organization_members_list_ro.dart';
import 'package:numeroid/domain/model/ro/organization_transactions_list_ro.dart';

import '../model/ro/hotel_info_ro.dart';
import '../model/ro/hotel_offers_ro.dart';
import '../model/ro/locations_ro.dart';
import '../model/ro/login_ro.dart';
import '../model/ro/search_ref_ro.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'SearchRefRo':
      return SearchRefRo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LocationsRo':
      return LocationsRo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'HotelInfoRo':
      return HotelInfoRo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'HotelOffersRo':
      return HotelOffersRo.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LoginRo':
      return LoginRo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'BookingOrdersListRo':
      return BookingOrdersListRo.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Organization':
      return Organization.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OrganizationMembersListRo':
      return OrganizationMembersListRo.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OrganizationTransactionListRo':
      return OrganizationTransactionListRo.fromJson(
          value as Map<String, dynamic>) as ReturnType;

    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return Map<dynamic, BaseType>.fromIterables(
          value.keys,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
