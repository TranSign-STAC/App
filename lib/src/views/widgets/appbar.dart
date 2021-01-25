import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransignAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransignAppBar(
      {this.title, this.enableBackButton = false, this.actions});
  final Widget title;
  final bool enableBackButton;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: TransignColors.BlackScale),
        title: title == null
            ? SvgPicture.asset('assets/images/small_logo.svg')
            : title,
        leading: enableBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: this.actions);
  }
}
