import 'package:numeroid/domain/model/dto/price.dart';

import '../dto/hotel_info.dart';
import '../dto/hotel_offer.dart';

class Hotel {
  final HotelInfo info;
  final List<HotelOffer> offers;

  Hotel({
    required this.info,
    required this.offers,
  });

  Price get price => offers.first.price;
}
