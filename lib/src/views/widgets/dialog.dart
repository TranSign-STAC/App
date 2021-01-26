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
    return Dialog(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        this.content,
        FractionallySizedBox(
          widthFactor: 1,
          child: GestureDetector(
            onTap: this.actionCallback,
            child: Container(
              height: 48,
              decoration: const BoxDecoration(
                color: TransignColors.PrimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(0),
                  topRight: const Radius.circular(0),
                  bottomLeft: const Radius.circular(8),
                  bottomRight: const Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(this.actionText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ),
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
