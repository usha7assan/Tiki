import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? selectedColor = colors.first;

  void setColor(Color color) {
    selectedColor = color;
    emit(AddNoteColorChanged());
  }

  addNote(NoteModel note) async {
    note.color = selectedColor!.value;
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
