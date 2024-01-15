import 'package:numeroid/domain/model/bo/hotel.dart';
import 'package:numeroid/domain/model/bo/search_params.dart';
import 'package:numeroid/domain/model/dto/booking_order.dart';
import 'package:numeroid/utils/formatters.dart';

import '../../core/locator.dart';
import '../model/dto/city.dart';

class BookingRepository {
  Map<String, List<City>> _locations = {};

  Future<List<City>> loadLocations({
    required String? term,
  }) async {
    final key = term ?? '<default>';

    if (_locations.containsKey(key)) {
      // значит уже грузили ранее
      return _locations[key] ?? [];
    }

    final response = await unauthApi.getBookingApi().locationsGet(term: term);
    _locations[key] = response.data?.cities ?? [];

    return _locations[key] ?? [];
  }

  Future<List<Hotel>> loadHotels({
    required SearchParams searchParameters,
  }) async {
    final api = authApi.getBookingApi();

    final search = await api.hotelsSearch(
      cityId: searchParameters.city?.id ?? 0,
      arrivalDate: Formatters.fromDateServer(searchParameters.startDate),
      departureDate: Formatters.fromDateServer(searchParameters.endDate),
      rooms: searchParameters.rooms,
    );
    final ref = search.data;

    if (search.statusCode == 201 && ref != null) {
      final info = await api.hotelsInfoGet(
        cityId: searchParameters.city?.id ?? 0,
      );

      final detail = await api.hotelsDetailsGet(ref: ref);

      final infoList = info.data?.hotels ?? [];
      final offersList = detail.data?.offers ?? [];

      List<Hotel> hotels = [];

      for (var offer in offersList) {
        final hotelIndex =
            hotels.indexWhere((element) => element.info.id == offer.hotelId);

        if (hotelIndex >= 0) {
          hotels[hotelIndex].offers.add(offer);
        } else {
          final infoIndex =
              infoList.indexWhere((element) => element.id == offer.hotelId);
          if (infoIndex >= 0) {
            hotels.add(
              Hotel(
                info: infoList[infoIndex],
                offers: [offer],
              ),
            );
          }
        }
      }

      hotels.forEach((element) {
        element.offers.sort((a, b) => (a.price.value).compareTo(b.price.value));
      });

      hotels.sort((a, b) {
        int starsComp = (a.info.stars ?? 0).compareTo(b.info.stars ?? 0);
        if (starsComp == 0) {
          return (a.price.value).compareTo(b.price.value);
        }
        return starsComp;
      });

      return hotels;
    } else {
      return [];
    }
  }

  Future<List<BookingOrder>> loadOrders() async {
    final response = await authApi.getBookingApi().myOrdersGet();
    final data = response.data?.data;
    if (data != null) {
      final orders = data.orders.map((e) {
        final index =
            data.hotels.indexWhere((element) => element.id == e.hotelId);

        if (index >= 0) {
          return BookingOrder(order: e, hotel: data.hotels[index]);
        } else {
          return null;
        }
      }).toList();

      return List.from(orders.where((element) => element != null));
    }

    return [];
  }
}
