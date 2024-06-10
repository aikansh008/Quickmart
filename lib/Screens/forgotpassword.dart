import 'package:ecommerce/Screens/resetemail.dart';
import 'package:ecommerce/authentication/forgotpassword/forgotpassword.dart';
import 'package:ecommerce/authentication/forgotpassword/forgotpasswordcontroller.dart';
import 'package:ecommerce/common/spacing_styles.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: Padding(
      padding: spacing.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Forget Password",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),
          Text(
            "Don't worry sometimes people can forgot too,enter your email and we will send you a password reset link. ",
            style: TextStyle(
              color: THelperFunctions.getColor("Grey"),
            ),
          ),
          const SizedBox(
            height: ESizes.spaceBtwSections,
          ),
           Container(
            height: THelperFunctions.screenHeight() * 0.1,
            width: THelperFunctions.screenWidth() * 0.8,
            child: TextFormField(
              controller: Resetpasssword.email,
              validator: (value) => Resetpasssword.validateEmail(value),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  labelText: "E-Mail",
                  prefixIcon: const Icon(Icons.email),
                  labelStyle: TextStyle(
                      fontSize: 17,
                      color: dark
                          ? Colors.white
                          : const Color.fromARGB(255, 53, 50, 50)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                        const  BorderSide(width: 1.5, color: ecolor.primary)),
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
                  onPressed: () {
                    forgotpassword.ForgotPassword(
                        Resetpasssword.email.text, context).then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ResetEmail()),
                                ));
                  },
                  child: const Text("Submit"))),
        ],
      ),
    ));
  }
}
