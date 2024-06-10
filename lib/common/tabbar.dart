import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget implements PreferredSize {
  Tabbar({
    super.key, required List<Tab> tabs
    });
  List<Widget> get tabs => [
    Tab(child: Text("Sports")),
    Tab(child: Text("Furniture")),
    Tab(child: Text("Clothes")),
    Tab(child: Text("Cosmetics")),
    Tab(child: Text("Electronics"))
  ];
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: ecolor.primary,
        unselectedLabelColor: const Color.fromARGB(255, 104, 102, 102),
        labelColor: dark?Colors.white:Colors.black,
        tabAlignment: TabAlignment.start,
        tabs: tabs),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
