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
    Container(
      child: new Material(
        child: new InkWell(
          onTap: () {
            print("tapped");
          },
          child: new Container(
            width: 100.0,
            height: 100.0,
          ),
        ),
        color: Colors.transparent,
      ),
      color: Colors.orange,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height:
          MediaQuery.of(context).padding.bottom + 56, // navigation bar + button
      child: Material(
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              this.text,
              style: TextStyle(
                color: fontColor,
                fontSize: 16,
                fontWeight: fontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: this.enabled ? onPressed : null,
        ),
        color: Colors.transparent,
      ),
      color: buttonColor,
    );
  }
}
