import '../dto/hotel_info_short.dart';
import 'hotel.dart';

class HotelShort extends AbstractHotel {
  final HotelInfoShort info;

  HotelShort({
    required this.info,
    required super.offers,
  });

  @override
  int get rate => info.rate;
}
