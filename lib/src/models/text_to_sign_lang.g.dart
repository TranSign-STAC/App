// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_to_sign_lang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransignTextToSignLangRequest _$TransignTextToSignLangRequestFromJson(
    Map<String, dynamic> json) {
  return TransignTextToSignLangRequest(
    text: json['text'] as String,
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$TransignTextToSignLangRequestToJson(
        TransignTextToSignLangRequest instance) =>
    <String, dynamic>{
      'text': instance.text,
      'uuid': instance.uuid,
    };

TransignTextToSignLangResponse _$TransignTextToSignLangResponseFromJson(
    Map<String, dynamic> json) {
  return TransignTextToSignLangResponse(
    renderUrl: json['renderUrl'] as String,
  );
}

Map<String, dynamic> _$TransignTextToSignLangResponseToJson(
        TransignTextToSignLangResponse instance) =>
    <String, dynamic>{
      'renderUrl': instance.renderUrl,
    };
