import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiki/Views/edit_note_view.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/cubits/read_notes_cubit/cubit/read_notes_cubit.dart';
import 'package:tiki/models/note_model.dart';
import 'package:tiki/widgets/custom_app_bar.dart';
import 'package:tiki/widgets/noteItem.dart';

class ShowNoteView extends StatelessWidget {
  const ShowNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              iconSize: 30,
              hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
              focusColor: const Color(0xFFF095B4).withOpacity(0.1),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: '',
          icon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                IconButton(
                  hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
                  focusColor: const Color(0xFFF095B4).withOpacity(0.1),
                  icon: const Icon(
                    Icons.delete,
                    color: primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();

                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
                  focusColor: const Color(0xFFF095B4).withOpacity(0.1),
                  icon: const Icon(
                    Icons.edit_square,
                    color: primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditNoteView();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          NoteItem(note: note),
        ],
      ),
    );
  }
}
