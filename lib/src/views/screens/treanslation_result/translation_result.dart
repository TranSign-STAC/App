import 'package:app/src/views/screens/treanslation_result/widgets/translation_bottom.dart';
import 'package:app/src/views/widgets/appbar.dart';
import 'package:app/src/views/widgets/translation_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/speed_controller.dart';
import 'widgets/video_player.dart';

class TranslationResultScreen extends StatelessWidget {
  const TranslationResultScreen(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransignAppBar(enableBackButton: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TranslationBar(),
          SignLanguageVideoPlayer(),
          SpeedController(),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TranslationBottom(this.text),
          ),
        ],
      ),
    );
  }
}
