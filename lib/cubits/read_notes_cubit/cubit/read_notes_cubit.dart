import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/models/note_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModel> notes = [];
  List<NoteModel> favoriteNotes = [];

  fetchAllNotes() {
    var box = Hive.box<NoteModel>(notesBox);
    notes = box.values.toList();
    emit(ReadNotesSuccess());
  }

  fetchFavoriteNotes() {
    var box = Hive.box<NoteModel>(notesBox);
    favoriteNotes = box.values.where((note) => note.isFavorite).toList();
    emit(ReadNotesSuccess());
  }
}
