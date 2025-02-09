import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tiki/Views/notesView.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/cubits/read_notes_cubit/cubit/read_notes_cubit.dart';
import 'package:tiki/models/note_model.dart';
import 'package:tiki/widgets/custom_app_bar.dart';
import 'package:tiki/widgets/edit_colors_list_view.dart';
import 'package:tiki/widgets/edit_custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title;
  String? subTitle;
  late Color containerColor = Color(widget.note.color);

  @override
  void initState() {
    super.initState();
    containerColor = Color(widget.note.color);
  }

  void updateContainerColor(Color newColor) {
    setState(() {
      containerColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: 'Edit',
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
                    widget.note.delete();
                    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotesView()));
                  },
                ),
                IconButton(
                  hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
                  focusColor:
                      const Color.fromRGBO(240, 149, 180, 1).withOpacity(0.1),
                  icon: const Icon(
                    Icons.done,
                    color: primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subTitle = subTitle ?? widget.note.subTitle;
                    widget.note.date =
                        DateFormat('MMM d,yyyy').format(DateTime.now());
                    widget.note.save();
                    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotesView()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              EditColorsListView(
                note: widget.note,
                onColorChanged: updateContainerColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: EditCustomTextField(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        onChanged: (value) {
                          title = value;
                        },
                        hint: 'Title',
                        initialValue: widget.note.title,
                      ),
                      subtitle: EditCustomTextField(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        onChanged: (value) {
                          subTitle = value;
                        },
                        hint: 'Content',
                        initialValue: widget.note.subTitle,
                        maxLines: null,
                      ),
                      trailing: IconButton(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          widget.note.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {});
                          widget.note.isFavorite = !widget.note.isFavorite;
                          widget.note.save();
                          BlocProvider.of<ReadNotesCubit>(context)
                              .fetchAllNotes();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, top: 20),
                      child: Text(
                        widget.note.date,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
