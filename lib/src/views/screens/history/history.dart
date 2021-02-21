import 'package:app/src/configs/theme.dart';
import 'package:app/src/models/api.dart';
import 'package:app/src/models/favorite_translation.dart';
import 'package:app/src/models/translation_history.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/bottom_button.dart';
import 'package:app/src/views/widgets/translation_box.dart';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  final client = ApiClient(Dio(BaseOptions()));
  String uuid;
  bool editingEnabled = false;
  List<TranslationHistory> historyData;

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

  void enableEditing() {
    this.setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      this.editingEnabled = true;
      this.historyData.asMap().forEach((i, data) {
        this.historyData[i].marked = false;
      });
    });
  }

  void disableEditing() {
    this.setState(() {
      this.editingEnabled = false;
    });
  }

  void selectAllBoxes() {
    this.setState(
      () => this.historyData.asMap().forEach(
        (i, data) {
          this.historyData[i].marked = true;
        },
      ),
    );
  }
  // actionbar actions

  int countSelectedBoxExists() {
    int selectedBoxCount = 0;
    this.historyData.forEach((data) {
      if (data.marked) {
        selectedBoxCount++;
      }
    });
    return selectedBoxCount;
  }

  bool isSelectedBoxExists() {
    for (int i = 0; i < this.historyData.length; i++) {
      if (this.historyData[i].marked) {
        return true;
      }
    }
    return false;
  }

  Future<Map<String, dynamic>> getHistory(uuid) async {
    Map<String, dynamic> rawData = {
      "history": await this.client.getHistory(uuid),
      "favorite": await this.client.getFavorite(uuid),
    };
    return rawData;
  }

  void loadTranslationHistory() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    this.uuid = pref.getString("uuid");
    final queriedData = await this.getHistory(this.uuid);
    final List<TransignTranslationHistory> rawHistory = queriedData["history"]
        .history; // set reversed order because server returns oldest order
    final List<String> favorites = queriedData['favorite'].favorites;
    final List<String> histories = [];
    rawHistory.asMap().forEach((int i, TransignTranslationHistory data) {
      if (!histories.contains(data.text)) {
        histories.add(data.text);
      }
    }); // remove duplicates
    this.historyData = new List(histories.length);
    this.setState(() {
      histories.asMap().forEach((int i, String text) {
        this.historyData[i] =
            TranslationHistory(text, favorited: favorites.contains(text));
      }); // convert to TranslationHistory
    });
  }
  // utils

  List<Widget> _renderHistoryTranslationBoxes() {
    final List<Widget> historyTranslationBoxes =
        new List(this.historyData.length);

    this.historyData.asMap().forEach(
      (int i, TranslationHistory data) {
        historyTranslationBoxes[i] = this._translationBox(
          data.text,
          data.favorited,
          () {
            this.setState(
              () {
                this.historyData[i].favorited = !this.historyData[i].favorited;
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

    return historyTranslationBoxes;
  }

  List<Widget> _renderFavoriteTranslationBoxes() {
    final List<Widget> historyTranslationBoxes =
        new List(this.historyData.length);

    this.historyData.asMap().forEach(
      (i, data) {
        historyTranslationBoxes[i] = this._translationBox(
          data.text,
          data.marked,
          () {
            this.setState(
              () {
                this.historyData[i].marked = !this.historyData[i].marked;
              },
            );
          },
        );
      },
    );

    return historyTranslationBoxes;
  }
  // renderers

  @override
  void initState() {
    super.initState();
    this.loadTranslationHistory();
  }

  @override
  Widget build(BuildContext context) {
    TransignAppBar normalAppBar = TransignAppBar(
      title: Text("번역기록",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
      /*actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Center(
            child: GestureDetector(
              child: Text(
                "편집",
                style: TextStyle(
                  color: TransignColors.BlackScale,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.right,
              ),
              onTap: enableEditing,
            ),
          ),
        )
      ],*/
    );
    Scaffold normalScaffold = Scaffold(
      appBar: normalAppBar,
      body: this.historyData == null
          ? Center(
              child: SizedBox(
                  child: CircularProgressIndicator(), width: 60, height: 60))
          : ListView(children: this._renderHistoryTranslationBoxes()),
    );
    return normalScaffold;
    //return this.editingEnabled ? editingScaffold : normalScaffold;
    // TransignAppBar editingAppBar = TransignAppBar(
    //   centerTitle: false,
    //   enableDarkMode: true,
    //   color: TransignColors.SubRed,
    //   leading: IconButton(
    //     icon: SvgPicture.asset("assets/images/crossed_white.svg"),
    //     onPressed: this.disableEditing,
    //   ),
    //   title: Text("N개 선택",
    //       style: TextStyle(
    //           color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
    //   actions: [
    //     Padding(
    //       padding: EdgeInsets.only(right: 16),
    //       child: Center(
    //         child: GestureDetector(
    //           child: Text(
    //             "전체 선택",
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 13,
    //               fontWeight: FontWeight.w300,
    //             ),
    //             textAlign: TextAlign.right,
    //           ),
    //           onTap: this.selectAllBoxes,
    //         ),
    //       ),
    //     )
    //   ],
    // );
    // Scaffold editingScaffold = Scaffold(
    //   appBar: editingAppBar,
    //   body: Column(
    //     children: this._renderFavoriteTranslationBoxes() +
    //         [
    //           Expanded(
    //               child: Align(
    //                   alignment: Alignment.bottomCenter,
    //                   child: BottomButton(
    //                     "삭제하기",
    //                     onPressed: () {},
    //                     enabled: this.isSelectedBoxExists(),
    //                     enabledColor: TransignColors.SubRed,
    //                   ))),
    //         ],
    //   ),
    // );
  }
}
