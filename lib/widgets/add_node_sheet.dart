import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tiki/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tiki/widgets/add_note_form.dart';

class AddNodeSheet extends StatelessWidget {
  const AddNodeSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {

          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: ,
          child: const SizedBox(
            height: 700,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}
