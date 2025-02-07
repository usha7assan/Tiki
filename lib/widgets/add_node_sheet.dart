import 'package:flutter/material.dart';
import 'package:tiki/widgets/custom_button.dart';
import 'package:tiki/widgets/custom_text_field.dart';

class AddNodeSheet extends StatelessWidget {
  const AddNodeSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 700,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                      height: 300,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(),
                SizedBox(
                  height: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
