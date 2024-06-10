import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo(
      {super.key,
      required this.label,
      required this.icon,
      required this.height,
      required this.width});
  final String label;
  final double height;
  final double width;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: THelperFunctions.screenHeight() * height,
      width: THelperFunctions.screenWidth() * width,
      child: TextFormField(
        style:
            TextStyle(fontSize: 17, color: dark ? Colors.white : Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10),
            labelText: label,
            prefixIcon: icon,
            labelStyle: TextStyle(
                fontSize: 17,
                color: dark
                    ? Colors.white
                    : const Color.fromARGB(255, 53, 50, 50)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 1.5, color: ecolor.primary)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  width: 1.5, color: dark ? ecolor.light : ecolor.dark),
            )),
      ),
    );
  }
}
