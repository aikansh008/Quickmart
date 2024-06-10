import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key? key,
    required this.text,
    required this.selected,
    this.onSelected,
  }) : super(key: key);

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: THelperFunctions.getColor(text) != null
          ? SizedBox()
          : Text(''),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: THelperFunctions.getColor(text) != null
          ? CircleAvatar(
              backgroundColor: THelperFunctions.getColor(text),
              radius: 25,
            )
          : null,
      shape: THelperFunctions.getColor(text) != null
          ? CircleBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
      labelPadding: THelperFunctions.getColor(text) != null
          ? EdgeInsets.all(0)
          : null,
      padding: THelperFunctions.getColor(text) != null
          ? EdgeInsets.all(0)
          : null,
      backgroundColor: THelperFunctions.getColor(text) != null
          ? THelperFunctions.getColor(text)
          : null,
    );
  }
}
