import 'package:flutter/material.dart';

class TranslationBox extends StatelessWidget {
  TranslationBox(this.text, {@required this.button});
  final Widget button;
  String text;
  @override
  Widget build(BuildContext context) {
    final bool expandablyLong = this.text.length > 68;
    final int shortableLength = expandablyLong ? 205 : 68;
    if (this.text.length > shortableLength) {
      this.text = this.text.substring(0, shortableLength + 1) + "...";
    }
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(width: 8),
              button,
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          ),
          width: MediaQuery.of(context).size.width,
          height: expandablyLong ? 134 : 66,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white),
        ));
  }
}
