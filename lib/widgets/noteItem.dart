import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiki/Views/edit_note_view.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/cubits/read_notes_cubit/cubit/read_notes_cubit.dart';

import 'package:tiki/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        splashColor: Color(note.color).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        hoverColor: Color(note.color).withOpacity(0.1),
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          note.subTitle,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          note.delete();
                          BlocProvider.of<ReadNotesCubit>(context)
                              .fetchAllNotes();
                          BlocProvider.of<ReadNotesCubit>(context)
                              .fetchFavoriteNotes();
                        },
                      ),
                      IconButton(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          note.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          note.isFavorite = !note.isFavorite;
                          note.save();
                          BlocProvider.of<ReadNotesCubit>(context)
                              .fetchAllNotes();
                          BlocProvider.of<ReadNotesCubit>(context)
                              .fetchFavoriteNotes();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 20),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
