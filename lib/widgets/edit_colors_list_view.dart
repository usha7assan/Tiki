import 'package:flutter/material.dart';
import 'package:tiki/constants.dart';
import 'package:tiki/models/note_model.dart';
import 'package:tiki/widgets/color_item.dart';

class EditColorsListView extends StatefulWidget {
  final NoteModel note;
  final Function(Color) onColorChanged;

  const EditColorsListView({
    super.key,
    required this.note,
    required this.onColorChanged,
  });

  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  late int selectedColorIndex;

  @override
  void initState() {
    selectedColorIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedColorIndex = index;
              widget.note.color = colors[index].value;
            });
            widget.onColorChanged(colors[index]);
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
