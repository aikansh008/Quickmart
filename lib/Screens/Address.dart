import 'package:ecommerce/Screens/NewAddress.dart';
import 'package:ecommerce/Screens/profile.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/addresscard.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
 AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewAddress()),
            );
          },
          backgroundColor: ecolor.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: THelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
              )),
          title: const Text(
            "Addresses",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AddressCard(
                    selectedAddress: true,
                    name: "Aikansh Tiwari",
                    number: "+91-638-71-75-488",
                    address: "Sachin Pg Ghaziabad(UP),INDIA"),
                AddressCard(
                    selectedAddress: false,
                    name: "Aikansh Tiwari",
                    number: "+91-638-71-75-488",
                    address: "Sachin Pg Ghaziabad(UP),INDIA"),
                AddressCard(
                    selectedAddress: false,
                    name: "Aikansh Tiwari",
                    number: "+91-638-71-75-488",
                    address: "Sachin Pg Ghaziabad(UP),INDIA"),
                    
              ],
            ),
          ),
        ));
  }
}
