import 'package:flutter/material.dart';
import 'package:tiki/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  const CustomTextField(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
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
