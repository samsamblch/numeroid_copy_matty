import 'package:json_annotation/json_annotation.dart';

part 'faq_question.g.dart';

@JsonSerializable()
class FaqQuestion {
  final int id;
  final String question, answer;

  FaqQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqQuestion.fromJson(Map<String, dynamic> json) =>
      _$FaqQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$FaqQuestionToJson(this);
}
