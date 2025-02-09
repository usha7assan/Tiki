import 'package:flutter/material.dart';
import 'package:tiki/constants.dart';

class EditCustomTextField extends StatelessWidget {
  final String hint;
  final String? initialValue;
  final int? maxLines;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final TextStyle textStyle;
  const EditCustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.initialValue,
      required this.textStyle});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      initialValue: initialValue ?? "",
      style: textStyle,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      cursorColor: Colors.white,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
