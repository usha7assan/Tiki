import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiki/Views/notesView.dart';
import 'package:tiki/constants.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(notesBox);
  runApp(const Tiki());
}

class Tiki extends StatelessWidget {
  const Tiki({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Caveat',
      ),
      home: const NotesView(),
    );
  }
}
