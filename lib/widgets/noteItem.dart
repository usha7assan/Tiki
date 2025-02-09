import 'package:flutter/material.dart';

import 'package:tiki/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, this.onTap});
  final void Function()? onTap;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        splashColor: Color(note.color).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        hoverColor: Color(note.color).withOpacity(0.1),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    note.subTitle,
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
                  onPressed: () {
                    note.isFavorite = !note.isFavorite;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 20),
                child: Text(
                  note.date,
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
