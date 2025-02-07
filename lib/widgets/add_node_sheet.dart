import 'package:flutter/material.dart';
import 'package:tiki/widgets/add_note_form.dart';

class AddNodeSheet extends StatelessWidget {
  const AddNodeSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 700,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: AddNoteForm(),
      ),
    );
  }
}
