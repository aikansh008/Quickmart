import 'package:ecommerce/Screens/Home.dart';
import 'package:ecommerce/Screens/favourite.dart';
import 'package:ecommerce/Screens/profile.dart';
import 'package:ecommerce/Screens/shop.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class NaviagtionMenu extends StatefulWidget {
  final UserModel? usermodel;
  
  NaviagtionMenu({super.key, required this.usermodel});

  @override
  State<NaviagtionMenu> createState() => _NaviagtionMenuState();
}

class _NaviagtionMenuState extends State<NaviagtionMenu> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    List<Widget> widgetlist = [
      HomeScreen(usermodel: widget.usermodel),
      const Favourite(),
       ShopScreen(),
       ProfileScreen(usermodel: widget.usermodel)
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ecolor.primary,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            myIndex = value;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        children: widgetlist,
        index: myIndex,
      ),
    );
  }
}

