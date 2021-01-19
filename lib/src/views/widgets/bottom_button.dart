import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(this.text,
      {this.enabled = true,
      this.enabledColor = TransignColors.PrimaryColor,
      this.onPressed});
  final String text;
  final bool enabled;
  final Color enabledColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        this.enabled ? this.enabledColor : TransignColors.BlackScale[100];
    Color fontColor =
        this.enabled ? Colors.white : TransignColors.BlackScale[400];
    FontWeight fontWeight = this.enabled ? FontWeight.w700 : FontWeight.w400;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Container(
          child: Text(
            this.text,
            style: TextStyle(
              color: fontColor,
              fontSize: 16,
              fontWeight: fontWeight,
            ),
            textAlign: TextAlign.center,
          ),
          width: 375,
          height: 56,
          padding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: BoxDecoration(color: buttonColor),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).padding.bottom +
            56, // navigation bar + button
      ),
    );
  }
}
