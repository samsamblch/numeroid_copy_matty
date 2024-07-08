import '../dto/hotel_info_full.dart';
import '../dto/hotel_offer.dart';
import '../dto/price.dart';

abstract class AbstractHotel {
  AbstractHotel({required this.offers});

  final List<HotelOffer> offers;

  Price get price => offers.first.price;
  int get rate;
}

class Hotel extends AbstractHotel {
  final HotelInfoFull info;

  Hotel({
    required this.info,
    required super.offers,
  });
  
  @override
  int get rate => info.rate;
}
