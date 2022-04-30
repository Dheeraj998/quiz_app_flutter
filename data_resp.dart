import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'data_resp.g.dart';

@JsonSerializable()
class DataResp {
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'question')
  String? question;
  @JsonKey(name: 'time')
  int? time;
  @JsonKey(name: 'options')
  List<Option>? options;

  DataResp({this.questionId, this.question, this.time, this.options});

  factory DataResp.fromJson(Map<String, dynamic> json) {
    return _$DataRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataRespToJson(this);
}
