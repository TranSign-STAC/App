import 'package:json_annotation/json_annotation.dart';

part 'text_to_sign_lang.g.dart';

@JsonSerializable()
class TransignTextToSignLangRequest {
  String text;
  String uuid;

  TransignTextToSignLangRequest({this.text, this.uuid});

  factory TransignTextToSignLangRequest.fromJson(Map<String, dynamic> json) =>
      _$TransignTextToSignLangRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TransignTextToSignLangRequestToJson(this);
}

@JsonSerializable()
class TransignTextToSignLangResponse {
  String renderUrl;
  TransignTextToSignLangResponse({this.renderUrl});
  factory TransignTextToSignLangResponse.fromJson(Map<String, dynamic> json) =>
      _$TransignTextToSignLangResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransignTextToSignLangResponseToJson(this);
}
