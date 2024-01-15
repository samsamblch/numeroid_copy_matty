import 'package:json_annotation/json_annotation.dart';

import 'faq_category.dart';
import 'faq_question.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq {
  final List<FaqCategory> categories;
  final List<FaqQuestion> questions;

  Faq({
    required this.categories,
    required this.questions,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);

  Map<String, dynamic> toJson() => _$FaqToJson(this);
}

