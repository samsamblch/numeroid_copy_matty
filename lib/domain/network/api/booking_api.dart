import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:numeroid/domain/model/dto/hotel_info_full.dart';
import 'package:numeroid/domain/model/ro/hotel_offers_ro.dart';
import 'package:numeroid/domain/model/ro/locations_ro.dart';
import 'package:numeroid/domain/model/ro/search_ref_ro.dart';
import 'package:numeroid/domain/network/api/base_api.dart';

import '../../model/req/search_req.dart';
import '../../model/ro/booking_orders_list_ro.dart';
import '../../model/ro/hotel_info_ro.dart';

class BookingApi extends BaseApi {
  BookingApi(super.dio);

  Future<Response<LocationsRo>> locationsGet({String? term}) async {
    return get<LocationsRo>(
      path: '/locations',
      query: term != null ? {"term": term} : null,
    );
  }

  Future<Response<SearchRefRo>> search({
    required SearchReq req,
  }) async {
    return await post<SearchRefRo>(
      path: '/search',
      data: jsonEncode(req),
    );
  }

  Future<Response<HotelOffersRo>> hotelsOffersGet({
    required SearchRefRo ref,
  }) async {
    final result = await get<HotelOffersRo>(path: '/search/${ref.hash}', query: {
      'currency': 'RUB',
      'session': ref.session,
    });

    if (result.data?.isOver != true) {
      return hotelsOffersGet(ref: ref);
    } else {
      return result;
    }
  }

  Future<Response<HotelOffersRo>> hotelOffersGet({
    required int hotelId,
    required SearchRefRo ref,
  }) async {
    final result = await get<HotelOffersRo>(path: '/search/${ref.hash}/hotel/$hotelId', query: {
      'currency': 'RUB',
    });

    if (result.data?.isOver != true) {
      return hotelOffersGet(hotelId: hotelId, ref: ref);
    } else {
      return result;
    }
  }

  Future<Response<HotelInfoRo>> hotelsInfoGet({
    required int cityId,
  }) async {
    return await get<HotelInfoRo>(
      path: '/cities/$cityId/hotels',
    );
  }

  Future<Response<BookingOrdersListRo>> myOrdersGet() async {
    return get<BookingOrdersListRo>(path: '/cabinet/orders');
  }

  Future<Response<HotelInfoFull>> hotelInfoFullGet({
    required int hotelId,
  }) async {
    return await get<HotelInfoFull>(
      path: '/hotels/$hotelId',
    );
  }
}
