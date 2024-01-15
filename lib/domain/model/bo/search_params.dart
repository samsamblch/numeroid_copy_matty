import '../dto/city.dart';
import '../req/search_req.dart';

class SearchParams {
  final City? city;
  final DateTime startDate;
  final DateTime endDate;
  List<SearchRoom> rooms;

  SearchParams({
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.rooms,
  });

  static SearchParams create() {
    var now = DateTime.now();
    return SearchParams(
      startDate: now,
      endDate: now.add(
        const Duration(
          days: 7,
        ),
      ),
      rooms: [
        SearchRoom.create(),
      ],
      city: null,
    );
  }

  int allAdult() {
    return rooms
        .map(
          (e) => e.adults,
        )
        .reduce(
          (value, element) => value + element,
        );
  }

  int daysCount() {
    return endDate.difference(startDate).inDays;
  }
}
