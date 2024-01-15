import 'package:dio/dio.dart';
import 'package:numeroid/domain/model/dto/organization.dart';
import 'package:numeroid/domain/model/ro/organization_members_list_ro.dart';
import 'package:numeroid/domain/model/ro/organization_transactions_list_ro.dart';
import 'package:numeroid/domain/network/api/base_api.dart';

class OrgApi extends BaseApi {
  OrgApi(super.dio);

  Future<Response<Organization>> infoGet() async {
    return get<Organization>(path: '/cabinet/orgs');
  }

  Future<Response<OrganizationTransactionListRo>> transactionsGet() async {
    return get<OrganizationTransactionListRo>(
        path: '/cabinet/orgTransactions',
        query: {'page': 1, 'limit': 20, 'sort': '-otr.created_at'});
  }

  Future<Response<OrganizationMembersListRo>> workersGet() async {
    return get<OrganizationMembersListRo>(path: '/cabinet/workers');
  }
}
