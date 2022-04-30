import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  @JsonKey(name: 'option_id')
  int? optionId;
  @JsonKey(name: 'option')
  String? option;
  @JsonKey(name: 'correct')
  bool? correct;

  Option({this.optionId, this.option, this.correct});

  factory Option.fromJson(Map<String, dynamic> json) {
    return _$OptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
