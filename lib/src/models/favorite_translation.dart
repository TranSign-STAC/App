import 'package:json_annotation/json_annotation.dart';

part 'favorite_translation.g.dart';

@JsonSerializable()
class TransignGetFavoriteTranslationResponse {
  List<String> favorites;

  TransignGetFavoriteTranslationResponse({this.favorites});

  factory TransignGetFavoriteTranslationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TransignGetFavoriteTranslationResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$TransignGetFavoriteTranslationResponseToJson(this);
}

@JsonSerializable()
class TransignToggleFavoriteTranslationRequest {
  String text;
  String uuid;

  TransignToggleFavoriteTranslationRequest({this.text, this.uuid});

  factory TransignToggleFavoriteTranslationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$TransignToggleFavoriteTranslationRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$TransignToggleFavoriteTranslationRequestToJson(this);
}
