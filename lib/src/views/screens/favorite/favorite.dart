import 'package:app/src/models/api.dart';
import 'package:app/src/models/favorite_translation.dart';
import 'package:app/src/models/translation_history.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/translation_box.dart';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  final client = ApiClient(Dio(BaseOptions()));
  String uuid;
  bool editingEnabled = false;
  List<TranslationHistory> translations;

  Widget _translationBox(String text, bool marked, VoidCallback onTap) {
    String iconPath = this.editingEnabled
        ? (marked
            ? "assets/images/checkmark-filled.svg"
            : "assets/images/checkmark-outlined.svg")
        : (marked
            ? "assets/images/star-filled.svg"
            : "assets/images/star-outlined.svg");

    Widget button = Material(
        child: InkWell(
            customBorder: new CircleBorder(),
            child: Padding(
                child: SvgPicture.asset(
                  iconPath,
                  width: 18,
                  height: 18,
                  fit: BoxFit.cover,
                ),
                padding: EdgeInsets.all(4)),
            onTap: onTap),
        color: Colors.transparent);
    return TranslationBox(text, button: button);
  }
  // widget

  void loadTranslationHistory() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    this.uuid = pref.getString("uuid");
    final List<String> favorites =
        (await this.client.getFavorite(uuid)).favorites;
    this.translations = new List(favorites.length);
    this.setState(() {
      favorites.asMap().forEach((int i, String text) {
        this.translations[i] = TranslationHistory(text, favorited: true);
      }); // convert to TranslationHistory
    });
  }
  // utils

  List<Widget> _renderTranslationBoxes() {
    final List<Widget> translationBoxes = new List(this.translations.length);

    this.translations.asMap().forEach(
      (int i, TranslationHistory data) {
        translationBoxes[i] = this._translationBox(
          data.text,
          data.favorited,
          () {
            this.setState(
              () {
                this.translations[i].favorited =
                    !this.translations[i].favorited;
              },
            );
            this.client.toggleFavorite(
                  TransignToggleFavoriteTranslationRequest(
                    text: data.text,
                    uuid: this.uuid,
                  ),
                );
          },
        );
      },
    );

    return translationBoxes;
  }
  // renderers

  @override
  void initState() {
    super.initState();
    this.loadTranslationHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransignAppBar(
          title: Text("즐겨찾기",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
      body: this.translations == null
          ? Center(
              child: SizedBox(
                  child: CircularProgressIndicator(), width: 60, height: 60))
          : ListView(children: this._renderTranslationBoxes()),
    );
    ;
  }
}
