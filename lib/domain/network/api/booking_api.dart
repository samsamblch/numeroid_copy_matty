import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:numeroid/domain/model/dto/hotel_details.dart';
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

  Future<Response<SearchRefRo>> hotelsSearch({
    required int cityId,
    required String arrivalDate,
    required String departureDate,
    required List<SearchRoom> rooms,
  }) async {
    final rms = rooms
        .map((e) => {
              'adults': e.adults,
              'child_ages': e.childs,
            })
        .toList();

    return await post<SearchRefRo>(
      path: '/search',
      data: jsonEncode(SearchReq(
        city_id: cityId,
        hotel_id: null, //hotel_id,
        arrival_date: arrivalDate,
        departure_date: departureDate,
        rooms: rooms,
      )),
    );
  }

  Future<Response<HotelInfoRo>> hotelsInfoGet({
    required int cityId,
  }) async {
    return await get<HotelInfoRo>(
      path: '/cities/$cityId/hotels',
    );
  }

  Future<Response<HotelOffersRo>> hotelsDetailsGet({
    required SearchRefRo ref,
  }) async {
    final result = await get<HotelOffersRo>(path: '/search/${ref.hash}', query: {
      'currency': 'RUB',
      'session': ref.session,
    });

    if (result.data?.isOver != true) {
      return hotelsDetailsGet(ref: ref);
    } else {
      return result;
    }
  }

  Future<Response<BookingOrdersListRo>> myOrdersGet() async {
    return get<BookingOrdersListRo>(path: '/cabinet/orders');
  }

  Future<Response<HotelDetails>> hotelDetailsGet({
    required int hotelId,
  }) async {
    return await get<HotelDetails>(
      path: '/hotels/$hotelId',
    );
  }
}
