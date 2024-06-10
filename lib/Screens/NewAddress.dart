import 'package:ecommerce/Screens/Address.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/widgets/addressinput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: GestureDetector(onTap: (){   Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>AddressScreen() ),
                                    );},child: Icon(Icons.arrow_back,color: THelperFunctions.isDarkMode(context)?Colors.white:Colors.black,)),
        title: Text("Add New Address",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(child: Column(
            children: [
             AddressInfo(label: "Name", icon: Icon(Icons.person),height: 0.1,width:0.5),
             AddressInfo(label: "Phone Number", icon: Icon(Icons.phone),height: 0.1,width: 0.5,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    AddressInfo(label: "Street", icon: Icon(Icons.location_city), height:0.1 ,width:0.19),
                        AddressInfo(label: "Postal Code", icon: Icon(Icons.padding),height:0.1,width:0.19),
              ],
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    AddressInfo(label: "City", icon: Icon(Icons.location_city),height:0.1 ,width:0.19),
                        AddressInfo(label: "State", icon: Icon(Icons.rectangle),height:0.1 ,width:0.19),
              ],
             ),
                 AddressInfo(label: "Country", icon: Icon(Icons.public),height: 0.1,width:0.5),
                  SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ecolor.primary, // Set the background color here
                                  ),
                                  onPressed: () {
                                     Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>AddressScreen() ),
                                    );
                                  },
                                  child: Text("Save"))),
            ],
          )),
        ),
      ),
    );
  }
}