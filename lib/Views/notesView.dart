import 'package:flutter/material.dart';
import 'package:tiki/widgets/add_node_sheet.dart';
import 'package:tiki/widgets/noteItem.dart';
import 'package:tiki/widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Tiki',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 60,
            color: Color(0xFFE85B8B),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0, top: 5.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFFE85B8B),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const AddNodeSheet(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
