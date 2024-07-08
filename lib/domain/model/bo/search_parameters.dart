import '../dto/city.dart';
import '../req/search_room_req.dart';

class SearchParameters {
  static List<int> childAges = List<int>.generate(18, (index) => index);

  SearchParameters({this.city, required this.startDate, required this.endDate, required this.rooms}) {
    adults = rooms.map((e) => e.adults).reduce((value, element) => value + element);
    childs = rooms.map((e) => e.childs).reduce((value, element) => value + element);
  }

  final City? city;
  final DateTime startDate; // = DateTime.now();
  final DateTime endDate; // = DateTime.now().add(const Duration(days: 7));
  final List<SearchRoomReq> rooms; // = [SearchRoomReq(adults: 1, childs: [])];

  int get days => endDate.difference(startDate).inDays;
  late int adults;
  late List<int> childs;

  // void setRooms(List<SearchRoomReq> rooms) {
  //   _rooms = rooms;
  //   adults = rooms.map((e) => e.adults).reduce((value, element) => value + element);
  //   childs = rooms.map((e) => e.childs).reduce((value, element) => value + element);
  // }
}
