import 'package:json_annotation/json_annotation.dart';

part 'search_ref_ro.g.dart';

@JsonSerializable()
class SearchRefRo {
  final String hash;
  final String session;

  SearchRefRo({
    required this.hash,
    required this.session,
  });

  factory SearchRefRo.fromJson(Map<String, dynamic> json) => _$SearchRefRoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRefRoToJson(this);
}
