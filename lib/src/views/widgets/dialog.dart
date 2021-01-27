import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';

class TransignDialog extends StatelessWidget {
  const TransignDialog(this.actionText,
      {this.content,
      this.actionColor = TransignColors.PrimaryColor,
      this.actionCallback});
  final String actionText;
  final Widget content;
  final Color actionColor;
  final VoidCallback actionCallback;
  @override
  Widget build(BuildContext context) {
    const actionButtonBorderRadius = const BorderRadius.only(
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    );
    Widget actionButton = FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: this.actionColor,
          borderRadius: actionButtonBorderRadius,
        ),
        child: Material(
            child: InkWell(
              onTap: this.actionCallback,
              customBorder: RoundedRectangleBorder(
                  borderRadius: actionButtonBorderRadius),
              child: Center(
                child: Text(
                  this.actionText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            color: Colors.transparent),
      ),
    );

    return Dialog(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        this.content,
        actionButton, // action button
      ]),
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(8),
        ),
      ),
      elevation: 0,
    );
  }
}
