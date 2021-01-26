import 'package:flutter/material.dart';

class TranslationBottom extends StatelessWidget {
  const TranslationBottom(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)));
  }
}
