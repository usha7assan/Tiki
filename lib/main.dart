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
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3DDE3),
      ),
      home: const NotesView(),
    );
  }
}
