class TranslationHistory {
  TranslationHistory(this.text, {this.marked = false, this.favorited = true});
  String text;
  bool marked;
  bool favorited;
}
