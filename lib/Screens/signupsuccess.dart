import 'package:ecommerce/Screens/signupscreen.dart';
import 'package:ecommerce/authentication/controllers/signup/signupcontroller.dart';
import 'package:ecommerce/navigationmenu.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:ecommerce/userdata/userrepository.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({super.key});

  @override

  Widget build(BuildContext context) {
    var dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              color: dark ? ecolor.light : ecolor.dark,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              icon: Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
           Lottie.asset("assets/Images/Animation - 1716561044780.json",
            width: THelperFunctions.screenWidth() * 0.3,
            height: THelperFunctions.screenHeight() * 0.3,
           ),
            Text(
              "Your account successfully created!",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
          
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Text(
                "Welcome to Your Shopping Destination Your Account is Created, Unleash the Joy of Seamless Online Shopping!",
                style: TextStyle(
                  fontSize: ESizes.md,
                  color: Colors.grey,
                )),
            SizedBox(
              height: ESizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ecolor.primary, // set the background 
                    ),
                    onPressed: () async{
                                                      UserModel? usermodel =
                                    await UserRepository.getUserDetail(
                                        SignupController.email.text);
    Navigator.pushReplacement(
      
                  context,
                  MaterialPageRoute(builder: (context) => NaviagtionMenu(usermodel: usermodel,)),
                );
                    },
                    child: Text("Continue"))),
           
          ],
        ),
      ),
    );
  }
}
