import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'translation_box.dart';

class ChangableTranslationBox extends StatefulWidget {
  const ChangableTranslationBox(
    this.text, {
    this.isEnabled = false,
    @required this.onEnabled,
    @required this.onDisabled,
    @required this.enabledButtonIcon,
    @required this.disabledButtonIcon,
  });
  final bool isEnabled;
  final String text;
  final Widget enabledButtonIcon;
  final Widget disabledButtonIcon;
  final VoidCallback onEnabled;
  final VoidCallback onDisabled;

  _ChangableTranslationBox createState() => _ChangableTranslationBox();
}

class _ChangableTranslationBox extends State<ChangableTranslationBox> {
  bool isEnabled;
  @override
  void initState() {
    setState(() {
      this.isEnabled = widget.isEnabled;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget button = this.isEnabled
        ? GestureDetector(
            onTap: () {
              this.setState(() {
                this.isEnabled = !this.isEnabled;
              });
              widget.onEnabled();
            },
            child: widget.enabledButtonIcon,
          )
        : GestureDetector(
            onTap: () {
              this.setState(() {
                this.isEnabled = !this.isEnabled;
              });
              widget.onDisabled();
            },
            child: widget.disabledButtonIcon,
          );

    return TranslationBox(widget.text, button: button);
  }
}
