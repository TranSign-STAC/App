import 'package:app/src/configs/theme.dart';
import 'package:app/src/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TranslatingDialog extends StatelessWidget {
  const TranslatingDialog({this.requestCallback, this.cancelCallback});
  final VoidCallback requestCallback;
  final VoidCallback cancelCallback;
  @override
  Widget build(BuildContext context) {
    this.requestCallback();
    Widget content = Container(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
            ),
            Container(
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: TransignColors.PrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  child:
                      SvgPicture.asset("assets/images/crossed_arrows_big.svg"),
                  padding: EdgeInsets.all(40),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
            ),
            Container(
              child: Text(
                "번역중..",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
          ],
        ),
      ),
    );
    return TransignDialog(
      "취소",
      content: content,
      actionCallback: this.cancelCallback,
    );
  }
}
