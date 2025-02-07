import 'package:flutter/material.dart';
import 'package:tiki/Views/show_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        splashColor: const Color(0xFFF095B4).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ShowNoteView();
          }));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF095B4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Text(
                  'Flutter Tips',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    'Build faster, deploy faster.with Flutter.Build faster, deploy faster.with Flutter.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                trailing: IconButton(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 20),
                child: Text(
                  'May 21,2022',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
