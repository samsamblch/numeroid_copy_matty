import 'package:numeroid/domain/model/bo/hotel_short.dart';
import 'package:numeroid/domain/model/bo/search_parameters.dart';
import 'package:numeroid/domain/model/dto/booking_order.dart';
import 'package:numeroid/domain/model/dto/hotel_info_short.dart';
import 'package:numeroid/domain/model/req/search_req.dart';
import 'package:numeroid/utils/formatters.dart';

import '../../core/locator.dart';
import '../model/bo/hotel.dart';
import '../model/dto/city.dart';
import '../model/dto/hotel_offer.dart';

class BookingRepository {
  final Map<String, List<City>> _locations = {};

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

  Future<List<HotelOffer>> loadOffers({
    required SearchParameters searchParameters,
  }) async {
    final api = authApi.getBookingApi();

    final search = await api.search(
      req: SearchReq(
        cityId: searchParameters.city?.id ?? 0,
        hotelId: null,
        arrivalDate: Formatters.fromDateServer(searchParameters.startDate),
        departureDate: Formatters.fromDateServer(searchParameters.endDate),
        rooms: searchParameters.rooms,
      ),
    );

    final ref = search.data;

    if (search.statusCode == 201 && ref != null) {
      final result = await api.hotelsOffersGet(ref: ref);
      return result.data?.offers ?? [];
    } else {
      return [];
    }
  }

  Future<List<HotelShort>> loadHotels({
    required SearchParameters searchParameters,
  }) async {
    final info = await authApi.getBookingApi().hotelsInfoGet(
          cityId: searchParameters.city?.id ?? 0,
        );
    if (info.statusCode != 200 && info.data?.hotels == null) {
      return [];
    }
    final offersList = await loadOffers(searchParameters: searchParameters);
    final infoList = info.data?.hotels ?? [];

    List<HotelShort> hotels = _parseHotelsAndOffers(offersList, infoList);
    hotels = _sortHotels(hotels);

    return hotels;
  }

  List<T> _sortHotels<T extends AbstractHotel>(
    List<T> hotels,
  ) {
    for (var element in hotels) {
      element.offers.sort((a, b) => (a.price.value).compareTo(b.price.value));
    }

    hotels.sort((a, b) {
      int starsComp = (a.rate).compareTo(b.rate);
      if (starsComp == 0) {
        return (a.price.value).compareTo(b.price.value);
      }
      return starsComp;
    });
    return hotels;
  }

  List<HotelShort> _parseHotelsAndOffers(
    List<HotelOffer> offersList,
    List<HotelInfoShort> infoList,
  ) {
    List<HotelShort> hotels = [];

    for (var offer in offersList) {
      final hotelIndex = hotels.indexWhere((element) => element.info.id == offer.hotelId);

      if (hotelIndex >= 0) {
        hotels[hotelIndex].offers.add(offer);
      } else {
        final infoIndex = infoList.indexWhere((element) => element.id == offer.hotelId);
        if (infoIndex >= 0) {
          final hotelInfo = infoList[infoIndex];

          hotels.add(
            HotelShort(
              info: hotelInfo,
              offers: [offer],
            ),
          );
        }
      }
    }
    return hotels;
  }

  Future<List<BookingOrder>> loadOrders() async {
    final response = await authApi.getBookingApi().myOrdersGet();
    final data = response.data?.data;
    if (data != null) {
      final orders = data.orders.map((e) {
        final index = data.hotels.indexWhere((element) => element.id == e.hotelId);

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

  Future<Hotel?> loadHotel({
    required int hotelId,
    required SearchParameters searchParameters,
  }) async {
    final info = await authApi.getBookingApi().hotelInfoFullGet(hotelId: hotelId);
    if (info.statusCode != 200 && info.data == null) {
      return null;
    }
    final offersList = await loadOffers(searchParameters: searchParameters);

    Hotel hotel = Hotel(info: info.data!, offers: offersList);
    hotel.offers.sort((a, b) => (a.price.value).compareTo(b.price.value));

    return hotel;
  }
}
