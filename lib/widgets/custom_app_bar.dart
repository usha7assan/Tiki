import 'package:flutter/material.dart';
import 'package:tiki/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget? leading;
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.leading});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      clipBehavior: Clip.none,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white.withOpacity(0.6),
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 70,
          color: primaryColor,
        ),
      ),
      actions: [
        icon,
      ],
    );
  }
}
