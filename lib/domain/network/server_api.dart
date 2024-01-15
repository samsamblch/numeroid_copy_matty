import 'package:dio/dio.dart';
import 'package:numeroid/domain/network/api/booking_api.dart';

import 'api/org_api.dart';
import 'api/user_api.dart';

class ServerApi {
  ServerApi({
    required this.dio,
  });

  final Dio dio;

  BookingApi getBookingApi() {
    return BookingApi(dio);
  }

  UserApi getUserApi() {
    return UserApi(dio);
  }

  OrgApi getOrgApi() {
    return OrgApi(dio);
  }
}
