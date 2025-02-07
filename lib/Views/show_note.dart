import 'package:flutter/material.dart';
import 'package:tiki/Views/edit_note_view.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/widgets/custom_app_bar.dart';

class ShowNoteView extends StatelessWidget {
  const ShowNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              iconSize: 30,
              hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
              focusColor: const Color(0xFFF095B4).withOpacity(0.1),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: '',
          icon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                IconButton(
                  hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
                  focusColor: const Color(0xFFF095B4).withOpacity(0.1),
                  icon: const Icon(
                    Icons.delete,
                    color: primaryColor,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
                  focusColor: const Color(0xFFF095B4).withOpacity(0.1),
                  icon: const Icon(
                    Icons.edit_square,
                    color: primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditNoteView();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
      ),
    );
  }
}
