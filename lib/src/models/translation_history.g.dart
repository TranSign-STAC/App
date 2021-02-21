// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransignTranslationHistoryResponse _$TransignTranslationHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return TransignTranslationHistoryResponse(
    history: (json['history'] as List)
        ?.map((e) => e == null
            ? null
            : TransignTranslationHistory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TransignTranslationHistoryResponseToJson(
        TransignTranslationHistoryResponse instance) =>
    <String, dynamic>{
      'history': instance.history,
    };

TransignTranslationHistory _$TransignTranslationHistoryFromJson(
    Map<String, dynamic> json) {
  return TransignTranslationHistory(
    text: json['text'] as String,
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$TransignTranslationHistoryToJson(
        TransignTranslationHistory instance) =>
    <String, dynamic>{
      'text': instance.text,
      'uuid': instance.uuid,
    };
