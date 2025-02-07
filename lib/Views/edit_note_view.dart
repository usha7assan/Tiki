import 'package:flutter/material.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/widgets/custom_app_bar.dart';
import 'package:tiki/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: 'Edit',
          icon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              hoverColor: const Color(0xFFF095B4).withOpacity(0.1),
              focusColor: const Color(0xFFF095B4).withOpacity(0.1),
              icon: const Icon(
                Icons.done,
                color: primaryColor,
                size: 50,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: 'Title',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                hint: 'content',
                maxLines: 5,
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
