import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';

@JsonSerializable()
class Facility {
  final int id;
  @JsonKey(name: 'name_ru')
  final String? name;

  Facility({
    required this.id,
    required this.name,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);

  static const Map<int, String> _assets = {13: 'wifi.png'};

  String get imagePath {
    final asset = Facility._assets[id];
    if (asset != null) {
      return 'assets/icons/facilities/$asset';
    } else {
      return 'assets/icons/facilities/common.png';
    }
  }
}
