import 'dart:async';

import 'package:app/src/configs/theme.dart';
import 'package:app/src/views/screens/favorite/favorite.dart';
import 'package:app/src/views/screens/history/history.dart';
import 'package:app/src/views/screens/treanslation_result/translation_result.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/bottom_button.dart';
import 'package:app/src/views/widgets/translating_dialog.dart';
import 'package:app/src/views/widgets/translation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool translationButtonEnabled = false;
  final koreanTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransignAppBar(),
      body: Column(
        children: [
          TranslationBar(),
          Expanded(
            child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.all(24.0),
                    border: InputBorder.none,
                    hintText: '번역할 텍스트를 입력해주세요.'),
                controller: this.koreanTextController,
                onChanged: (text) => {
                      setState(() =>
                          {this.translationButtonEnabled = text.length != 0})
                    }),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Container(
                      child: Row(
                        children: [
                          /// Detected as Icon
                          /// FIXME: Check your design. this is an icon of node "mic/Fill". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                          SvgPicture.asset(
                            "assets/images/mic.svg",
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                              child: Text(
                                "음성번역",
                                style: TextStyle(
                                  color: TransignColors.PrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: 96),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                      ),
                      height: 56,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(color: Color(0x19000000), blurRadius: 10)
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 24)),
                  BottomButton(
                    "번역하기",
                    onPressed: () {
                      var timer = Timer(
                        Duration(seconds: 1),
                        () {
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TranslationResultScreen(
                                  koreanTextController.text)));
                        }, // mimicking request
                      );
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return TranslatingDialog(() {
                              timer.cancel();
                              Navigator.of(context, rootNavigator: true).pop();
                            });
                          });
                    },
                    enabled: this.translationButtonEnabled,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: _drawer(context),
      drawerEdgeDragWidth: 0,
    );
  }

  @override
  void dispose() {
    koreanTextController.dispose();
    super.dispose();
  }
}

Widget _drawer(BuildContext context) {
  List<Widget> drawerContents = [
    Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SvgPicture.asset("assets/images/big_logo.svg"),
    ),
    const Padding(
      padding: const EdgeInsets.only(top: 48),
    ),
    const ListTile(
      title: const Text(
        "홈",
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    ListTile(
      title: const Text(
        "번역기록",
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HistoryScreen())),
    ),
    ListTile(
      title: const Text(
        "번역즐겨찾기",
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FavoriteScreen())),
    ),
    Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              "서비스약관",
              style: TextStyle(
                color: TransignColors.BlackScale[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "개인정보처리방침",
              style: TextStyle(
                color: TransignColors.BlackScale[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  return Drawer(
    child: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: drawerContents),
      padding: const EdgeInsets.only(
        top: 64,
        bottom: 40,
      ),
    ),
  );
}
