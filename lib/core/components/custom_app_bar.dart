import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    required this.color,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final int color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(color),
      title: title,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
