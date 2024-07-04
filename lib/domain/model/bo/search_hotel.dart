import 'package:numeroid/domain/model/dto/facility.dart';
import 'package:numeroid/domain/model/dto/price.dart';

import '../dto/hotel_info.dart';
import '../dto/hotel_offer.dart';

class SearchHotel {
  final HotelInfo info;
  final List<HotelOffer> offers;
  final List<Facility> facilities;

  SearchHotel( {
    required this.info,
    required this.offers,
    required this.facilities,
  });

  Price get price => offers.first.price;
}


// "facilities": [
//                 13,
//                 15,
//                 62,
//                 74,
//                 95,
//                 147,
//                 152,
//                 154,
//                 159,
//                 216,
//                 217,
//                 220,
//                 221,
//                 246,
//                 249
//             ]