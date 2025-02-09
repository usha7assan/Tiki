import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tiki/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tiki/models/note_model.dart';
import 'package:tiki/widgets/colors_list_view.dart';
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
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          Color selectedColor =
              BlocProvider.of<AddNoteCubit>(context).selectedColor ??
                  Colors.grey.shade200;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                onSaved: (value) {
                  _title = value;
                },
                hint: 'Title.....',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onSaved: (value) {
                  _content = value;
                },
                hint: 'content.....',
                maxLines: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              const ColorsListView(),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return CustomButton(
                    color: selectedColor,
                    isLoading: state is AddNoteLoading ? true : false,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var currentDate = DateTime.now();
                        var formattedCurrentDate =
                            DateFormat('MMM d,yyyy').format(currentDate);
                        var noteModel = NoteModel(
                            title: _title!,
                            subTitle: _content!,
                            date: formattedCurrentDate,
                            color: BlocProvider.of<AddNoteCubit>(context)
                                .selectedColor!
                                .value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
