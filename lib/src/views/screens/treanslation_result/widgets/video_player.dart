import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';

class SignLanguageVideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 213,
      decoration: BoxDecoration(
        color: TransignColors.BlackScale[300],
      ),
    );
  }
}
