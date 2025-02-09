import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tiki/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedColorIndex = index;
              BlocProvider.of<AddNoteCubit>(context).setColor(colors[index]);
            });
          },
          child: ColorItem(
            color: colors[index],
            isSelected: selectedColorIndex == index ? true : false,
          ),
        ),
      ),
    );
  }
}
