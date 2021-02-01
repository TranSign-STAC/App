import 'package:app/src/configs/theme.dart';
import 'package:app/src/models/translation_history.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/bottom_button.dart';
import 'package:app/src/views/widgets/translation_box.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryScreen extends StatefulWidget {
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  bool editingEnabled = false;

  List<TranslationHistory> historyData = [
    TranslationHistory("Screwed up"),
    TranslationHistory(
        "TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역...")
  ];

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

  List<Widget> _renderHistoryTranslationBoxes() {
    final List<Widget> favoriteTranslationBoxes =
        new List(this.historyData.length);
    historyData.asMap().forEach(
      (i, data) {
        favoriteTranslationBoxes[i] = this._translationBox(
          data.text,
          data.favorited,
          () {
            this.setState(
              () {
                historyData[i].favorited = !historyData[i].favorited;
              },
            );
          },
        );
      },
    );
    return favoriteTranslationBoxes;
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

    TransignAppBar editingAppBar = TransignAppBar(
      centerTitle: false,
      enableDarkMode: true,
      color: TransignColors.SubRed,
      leading: IconButton(
        icon: SvgPicture.asset("assets/images/crossed_white.svg"),
        onPressed: this.disableEditing,
      ),
      title: Text("N개 선택",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Center(
            child: GestureDetector(
              child: Text(
                "전체 선택",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.right,
              ),
              onTap: this.selectAllBoxes,
            ),
          ),
        )
      ],
    );

    Scaffold normalScaffold = Scaffold(
      appBar: normalAppBar,
      body: Column(children: this._renderHistoryTranslationBoxes()),
    );

    Scaffold editingScaffold = Scaffold(
      appBar: editingAppBar,
      body: Column(
        children: this._renderFavoriteTranslationBoxes() +
            [
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomButton(
                        "삭제하기",
                        onPressed: () {},
                        enabled: this.isSelectedBoxExists(),
                        enabledColor: TransignColors.SubRed,
                      ))),
            ],
      ),
    );
    return normalScaffold;
    //return this.editingEnabled ? editingScaffold : normalScaffold;
  }
}
