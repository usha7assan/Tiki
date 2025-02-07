import 'package:flutter/material.dart';
import 'package:tiki/widgets/custom_button.dart';
import 'package:tiki/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _title, _content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      _title = value;
                    },
                    hint: 'Title',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      _content = value;
                    },
                    hint: 'content',
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 300,
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          )
        ],
      ),
    );
  }
}
