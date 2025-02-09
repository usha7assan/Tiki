import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(notesBox);
      await box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(
        AddNoteFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
