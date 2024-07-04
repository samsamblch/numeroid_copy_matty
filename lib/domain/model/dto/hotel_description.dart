import 'package:json_annotation/json_annotation.dart';

part 'hotel_description.g.dart';

@JsonSerializable()
class HotelDescription {
  @JsonKey(name: 'description_ru')
  final String? description;

  HotelDescription({
    required this.description,
  });

  factory HotelDescription.fromJson(Map<String, dynamic> json) => _$HotelDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDescriptionToJson(this);
}
