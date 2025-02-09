import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiki/Views/edit_note_view.dart';
import 'package:tiki/Views/show_note.dart';
import 'package:tiki/cubits/read_notes_cubit/cubit/read_notes_cubit.dart';
import 'package:tiki/models/note_model.dart';

import 'package:tiki/widgets/noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<ReadNotesCubit>(context).notes ?? [];
        print(notes.length);
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => NoteItem(
              note: notes[index],
            ),
          ),
        );
      },
    );
  }
}
