// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransignGetFavoriteTranslationResponse
    _$TransignGetFavoriteTranslationResponseFromJson(
        Map<String, dynamic> json) {
  return TransignGetFavoriteTranslationResponse(
    favorites: (json['favorites'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TransignGetFavoriteTranslationResponseToJson(
        TransignGetFavoriteTranslationResponse instance) =>
    <String, dynamic>{
      'favorites': instance.favorites,
    };

TransignToggleFavoriteTranslationRequest
    _$TransignToggleFavoriteTranslationRequestFromJson(
        Map<String, dynamic> json) {
  return TransignToggleFavoriteTranslationRequest(
    text: json['text'] as String,
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$TransignToggleFavoriteTranslationRequestToJson(
        TransignToggleFavoriteTranslationRequest instance) =>
    <String, dynamic>{
      'text': instance.text,
      'uuid': instance.uuid,
    };
