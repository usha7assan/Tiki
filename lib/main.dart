import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiki/Views/notesView.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tiki/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(notesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const Tiki());
}

class Tiki extends StatelessWidget {
  const Tiki({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Caveat',
        ),
        home: const NotesView(),
      ),
    );
  }
}
