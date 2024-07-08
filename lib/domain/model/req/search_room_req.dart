import 'package:json_annotation/json_annotation.dart';

part 'search_room_req.g.dart';

@JsonSerializable()
class SearchRoomReq {
  final int adults;
  final List<int> childs;

  SearchRoomReq({
    required this.adults,
    required this.childs,
  });

  factory SearchRoomReq.fromJson(Map<String, dynamic> json) => _$SearchRoomReqFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRoomReqToJson(this);
}
