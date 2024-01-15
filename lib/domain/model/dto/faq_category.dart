import 'package:json_annotation/json_annotation.dart';

part 'faq_category.g.dart';

@JsonSerializable()
class FaqCategory {
  final String name;
  final List<int> questions;

  FaqCategory({
    required this.name,
    required this.questions,
  });

  factory FaqCategory.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FaqCategoryToJson(this);
}
