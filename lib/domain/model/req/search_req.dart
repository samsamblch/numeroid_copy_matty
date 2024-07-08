import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/req/search_room_req.dart';

part 'search_req.g.dart';

@JsonSerializable()
class SearchReq {
  SearchReq({
    required this.cityId,
    required this.hotelId,
    required this.arrivalDate,
    required this.departureDate,
    required this.rooms,
  });

  @JsonKey(name: 'city_id')
  final int? cityId;
   @JsonKey(name: 'hotel_id')
  final int? hotelId;
   @JsonKey(name: 'arrival_date')
  final String arrivalDate;
   @JsonKey(name: 'departure_date')
  final String departureDate;
  final List<SearchRoomReq> rooms;

  factory SearchReq.fromJson(Map<String, dynamic> json) =>
      _$SearchReqFromJson(json);

  Map<String, dynamic> toJson() => _$SearchReqToJson(this);
}