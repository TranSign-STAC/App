import 'package:json_annotation/json_annotation.dart';

part 'translation_history.g.dart';

class TranslationHistory {
  TranslationHistory(this.text, {this.marked = false, this.favorited = true});
  String text;
  bool marked;
  bool favorited;
}

@JsonSerializable()
class TransignTranslationHistoryResponse {
  List<TransignTranslationHistory> history;

  TransignTranslationHistoryResponse({this.history});
  factory TransignTranslationHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TransignTranslationHistoryResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$TransignTranslationHistoryResponseToJson(this);
}

@JsonSerializable()
class TransignTranslationHistory {
  String text;
  String uuid;

  TransignTranslationHistory({this.text, this.uuid});

  factory TransignTranslationHistory.fromJson(Map<String, dynamic> json) {
    return TransignTranslationHistory(
      text: json['text'],
      uuid: json['uuid'],
    );
  }
}
