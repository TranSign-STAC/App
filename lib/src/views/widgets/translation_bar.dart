import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TranslationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    "한국어",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 159,
                ),
                SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  "assets/images/crossed_arrows.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  child: Text(
                    "수어",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 160,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            ),
            width: 375,
            height: 44,
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
}
