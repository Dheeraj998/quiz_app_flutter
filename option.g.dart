// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      optionId: json['option_id'] as int?,
      option: json['option'] as String?,
      correct: json['correct'] as bool?,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'option_id': instance.optionId,
      'option': instance.option,
      'correct': instance.correct,
    };
