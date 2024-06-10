import 'package:ecommerce/Screens/personalinfo.dart';
import 'package:ecommerce/common/spacing_styles.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpdateuserData extends StatelessWidget {
  UserModel? usermodel;
  String? fieldfirst;
  String? fieldlast;

  UpdateuserData({
    super.key,
    required this.usermodel,
    required this.fieldfirst,
    required this.fieldlast,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    var first = TextEditingController();
    var last = TextEditingController();
    String? email = usermodel!.email;
    return Scaffold(
        appBar: AppBar(
          
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: dark ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: spacing.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: THelperFunctions.screenHeight() * 0.1,
                width: THelperFunctions.screenWidth() * 0.8,
                child: TextFormField(
                  controller: first,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      labelText: "First Name",
                      labelStyle: TextStyle(
                          fontSize: 17,
                          color: dark
                              ? Colors.white
                              : const Color.fromARGB(255, 53, 50, 50)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              width: 1.5, color: ecolor.primary)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            width: 1.5,
                            color: dark ? ecolor.light : ecolor.dark),
                      )),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              Container(
                height: THelperFunctions.screenHeight() * 0.1,
                width: THelperFunctions.screenWidth() * 0.8,
                child: TextFormField(
                  controller: last,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      labelText: "Last Name",
                      labelStyle: TextStyle(
                          fontSize: 17,
                          color: dark
                              ? Colors.white
                              : const Color.fromARGB(255, 53, 50, 50)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              width: 1.5, color: ecolor.primary)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            width: 1.5,
                            color: dark ? ecolor.light : ecolor.dark),
                      )),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ecolor.primary, // Set the background color here
                      ),
                      onPressed: () async{
                      
                        UserRepository.updateuserRecord(
                            usermodel!, fieldfirst!, first.text);
                        UserRepository.updateuserRecord(
                            usermodel!, fieldlast!, last.text);
                         UserModel? userdata =
                                    await UserRepository.getUserDetail(
                                        email!);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PersonnalInfo(usermodel:userdata )));
                      },
                      child: const Text("Submit"))),
            ],
          ),
        ));
  }
}
