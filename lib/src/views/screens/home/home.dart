import 'package:app/src/configs/theme.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/bottom_button.dart';
import 'package:app/src/views/widgets/translation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool translationButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransignAppBar(),
      body: Column(
        children: [
          TranslationBar(),
          TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(24.0),
                border: InputBorder.none,
                hintText: '번역할 텍스트를 입력해주세요.',
              ),
              onChanged: (text) => {
                    setState(() =>
                        {this.translationButtonEnabled = text.length != 0})
                  }),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BottomButton("번역하기", enabled: this.translationButtonEnabled)
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: _drawer(),
      drawerEdgeDragWidth: 0,
    );
  }
}

Widget _drawer() {
  return Drawer(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: SvgPicture.asset("assets/images/big_logo.svg"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 48),
          ),
          ListTile(
            title: Text(
              "홈",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "번역기록",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "번역즐겨찾기",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
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
        ],
      ),
      width: 250,
      padding: EdgeInsets.only(
        top: 64,
        bottom: 40,
      ),
    ),
  );
}
