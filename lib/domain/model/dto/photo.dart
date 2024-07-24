import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(includeIfNull: true)
class Photo {
  @JsonKey(defaultValue: '')
  final String url;

  const Photo({
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
