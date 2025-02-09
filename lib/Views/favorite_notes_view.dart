import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiki/cubits/read_notes_cubit/cubit/read_notes_cubit.dart';
import 'package:tiki/models/note_model.dart';
import 'package:tiki/widgets/noteItem.dart';

class FavoriteNotesView extends StatefulWidget {
  const FavoriteNotesView({super.key});

  @override
  State<FavoriteNotesView> createState() => _FavoriteNotesViewState();
}

class _FavoriteNotesViewState extends State<FavoriteNotesView> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).fetchFavoriteNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, favoriteNotes) {
        List<NoteModel> favoriteNotes =
            BlocProvider.of<ReadNotesCubit>(context).favoriteNotes ?? [];
        return ListView.builder(
          itemCount: favoriteNotes.length,
          itemBuilder: (context, index) {
            return NoteItem(note: favoriteNotes[index]);
          },
        );
      },
    );
  }
}
