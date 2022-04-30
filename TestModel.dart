// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

List<TestModel> testModelFromJson(String str) =>
    List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

    List<TestModel> testModelFromJson2(str) =>
    List<TestModel>.from(str.map((x) => TestModel.fromJson(x)));

String testModelToJson(List<TestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
  TestModel({
    this.questionId,
    this.question,
    this.time,
    this.options,
  });

  int? questionId;
  String? question;
  int? time;
  List<Option>? options;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        questionId: json["question_id"],
        question: json["question"],
        time: json["time"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "question": question,
        "time": time,
        "options": List<dynamic>.from(options!.map((x) => x.toJson())),
      };

  readJson() {}
}

class Option {
  Option({
    this.optionId,
    this.option,
    this.correct,
  });

  int? optionId;
  String? option;
  bool? correct;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionId: json["option_id"],
        option: json["option"],
        correct: json["correct"],
      );

  Map<String, dynamic> toJson() => {
        "option_id": optionId,
        "option": option,
        "correct": correct,
      };
}
