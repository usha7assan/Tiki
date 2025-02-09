import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorItem({super.key, required this.color, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.white,
          child: isSelected
              ? CircleAvatar(
                  radius: 25,
                  backgroundColor: color,
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                )
              : CircleAvatar(
                  radius: 25,
                  backgroundColor: color,
                ),
        ));
  }
}
