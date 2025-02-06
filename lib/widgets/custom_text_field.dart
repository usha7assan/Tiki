import 'package:flutter/material.dart';
import 'package:tiki/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const CustomTextField({super.key, required this.hint, this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: buildBorder(const Color(0xFFF095B4).withOpacity(0.45)),
        focusedBorder: buildBorder(primaryColor),
        enabledBorder: buildBorder(const Color(0xFFF095B4).withOpacity(0.45)),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.grey),
    );
  }
}
