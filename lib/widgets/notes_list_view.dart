import 'package:flutter/material.dart';
import 'package:tiki/widgets/noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView(
        children: const [
          NoteItem(),
          NoteItem(),
          NoteItem(),
          NoteItem(),
        ],
      ),
    );
  }
}
