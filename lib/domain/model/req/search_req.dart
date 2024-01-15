import 'package:json_annotation/json_annotation.dart';

part 'search_req.g.dart';

@JsonSerializable()
class SearchReq {
  SearchReq({
    required this.city_id,
    required this.hotel_id,
    required this.arrival_date,
    required this.departure_date,
    required this.rooms,
  });

  final int city_id;
  final String? hotel_id;
  final String arrival_date;
  final String departure_date;
  final List<SearchRoom> rooms;

// {"city_id":54,"hotel_id":null,"arrival_date":"2024-04-24","departure_date":"2024-05-01","rooms":[{"adults":1,"child_ages":[]}]}

  factory SearchReq.fromJson(Map<String, dynamic> json) =>
      _$SearchReqFromJson(json);

  Map<String, dynamic> toJson() => _$SearchReqToJson(this);
}

@JsonSerializable()
class SearchRoom {
  final int adults;
  final List<int> childs;

  SearchRoom({
    required this.adults,
    required this.childs,
  });

  static SearchRoom create() {
    return SearchRoom(adults: 1, childs: []);
  }

  static List<int> childAges = List<int>.generate(18, (index) => index);

  factory SearchRoom.fromJson(Map<String, dynamic> json) =>
      _$SearchRoomFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRoomToJson(this);
}
