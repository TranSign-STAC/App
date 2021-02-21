import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransignAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransignAppBar({
    this.title,
    this.actions,
    this.color = Colors.white,
    this.centerTitle = true,
    this.enableDarkMode = false,
    this.enableBackButton = false,
    this.leading,
  });
  final Widget title;
  final List<Widget> actions;
  final Color color;
  final bool centerTitle;
  final bool enableDarkMode;
  final bool enableBackButton;
  final Widget leading;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    String backButtonPath = this.enableDarkMode
        ? 'assets/images/back_arrow_white.svg'
        : 'assets/images/back_arrow_black.svg';
    return AppBar(
        backgroundColor: this.color,
        elevation: 0,
        brightness: this.enableDarkMode ? Brightness.dark : Brightness.light,
        centerTitle: this.centerTitle,
        iconTheme: const IconThemeData(color: TransignColors.BlackScale),
        title: title == null
            ? SvgPicture.asset('assets/images/small_logo.svg')
            : title,
        leading: enableBackButton
            ? IconButton(
                icon: SvgPicture.asset(backButtonPath),
                onPressed: () => Navigator.of(context).pop(),
              )
            : this.leading,
        actions: this.actions);
  }
}
