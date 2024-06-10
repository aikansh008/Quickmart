import 'package:ecommerce/Screens/personalinfo.dart';
import 'package:ecommerce/common/spacing_styles.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class updatesinglefield extends StatefulWidget {
  final String? text;
  final UserModel usermodel;
  final String? field;
  const updatesinglefield(
      {super.key, this.text, required this.usermodel, this.field});

  @override
  State<updatesinglefield> createState() => _updatesinglefieldState();
}

class _updatesinglefieldState extends State<updatesinglefield> {
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    var value = TextEditingController();
    return Scaffold(
     
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: dark ? Colors.white : Colors.black,
            ),
            onPressed: () {
             
            },
          ),
        ),
        body: Padding(
          padding: spacing.padding,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: THelperFunctions.screenHeight() * 0.1,
              width: THelperFunctions.screenWidth() * 0.8,
              child: TextFormField(
                controller: value,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    labelText: widget.text,
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
                          width: 1.5, color: dark ? ecolor.light : ecolor.dark),
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
                   await   UserRepository.updateuserRecord(
                          widget.usermodel, widget.field!, value.text);
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonnalInfo(usermodel: widget.usermodel)));},
                                
                    child: const Text("Submit"))),
          ]),
        ));
  }
}
