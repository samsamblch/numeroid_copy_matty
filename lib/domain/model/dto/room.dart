import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/photo.dart';

part 'room.g.dart';

@JsonSerializable(includeIfNull: true)
class Room {
  @JsonKey(name: 'name_ru', defaultValue: '')
  final String name;

  @JsonKey(defaultValue: [])
  final List<Photo> photo;
  @JsonKey(defaultValue: 0)
  final int area;

  Room({
    required this.name,
    required this.photo,
    required this.area,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
