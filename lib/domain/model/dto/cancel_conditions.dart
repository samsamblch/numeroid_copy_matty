import 'package:json_annotation/json_annotation.dart';

part 'cancel_conditions.g.dart';

@JsonSerializable()
class CancelConditions {
  @JsonKey(name: 'free_cancellation')
  final bool cancelled;

  CancelConditions({
    required this.cancelled,
  });

  factory CancelConditions.fromJson(Map<String, dynamic> json) => _$CancelConditionsFromJson(json);

  Map<String, dynamic> toJson() => _$CancelConditionsToJson(this);
}
