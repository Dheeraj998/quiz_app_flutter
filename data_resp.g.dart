// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResp _$DataRespFromJson(Map<String, dynamic> json) => DataResp(
      questionId: json['question_id'] as int?,
      question: json['question'] as String?,
      time: json['time'] as int?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataRespToJson(DataResp instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'question': instance.question,
      'time': instance.time,
      'options': instance.options,
    };
