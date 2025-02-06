import 'package:flutter/material.dart';
import 'package:tiki/Views/notesView.dart';

void main() {
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
