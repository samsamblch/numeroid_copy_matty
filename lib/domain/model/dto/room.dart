import 'package:json_annotation/json_annotation.dart';
import 'package:numeroid/domain/model/dto/photo.dart';

part 'room.g.dart';

@JsonSerializable(includeIfNull: true)
class Room {
  Room( {
    required this.name1,
    required this.name2,
    required this.description,
    required this.photo,
    required this.photos,
    required this.area,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @JsonKey(name: 'name')
  final String? name1;
  @JsonKey(name: 'name_ru')
  final String? name2;
  @JsonKey(name: 'description_ru')
  final String? description;
  final Photo? photo;
  @JsonKey(defaultValue: [])
  final List<Photo> photos;
  @JsonKey(defaultValue: 0)
  final int area;

  String get name => name1 ?? name2 ?? '';
}
