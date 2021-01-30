import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/changable_translation_box.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  Widget translationBox(String text) {
    return ChangableTranslationBox(
      text,
      enabledButtonIcon: SvgPicture.asset(
        "assets/images/star-filled.svg",
        width: 18,
        height: 18,
        fit: BoxFit.cover,
      ),
      disabledButtonIcon: SvgPicture.asset(
        "assets/images/star-outlined.svg",
        width: 18,
        height: 18,
        fit: BoxFit.cover,
      ),
      onEnabled: () {},
      onDisabled: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransignAppBar(
          title: Text("즐겨찾기",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
      body: Column(
        children: [
          translationBox("Screwed up."),
          translationBox(
              "TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역 솔루션입니다. TranSign이란, 한국 수어 번역 및 웹 페이지 수어 번역..."),
        ],
      ),
    );
  }
}
