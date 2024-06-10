import 'package:ecommerce/Screens/loginscreen.dart';
import 'package:ecommerce/authentication/forgotpassword/forgotpassword.dart';
import 'package:ecommerce/authentication/forgotpassword/forgotpasswordcontroller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ResetEmail extends StatefulWidget {
  const ResetEmail({super.key});

  @override
  State<ResetEmail> createState() => _ResetEmailState();
}


class _ResetEmailState extends State<ResetEmail> {
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              color: dark ? ecolor.light : ecolor.dark,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
            Image(
                width: THelperFunctions.screenWidth() * 0.3,
                height: THelperFunctions.screenHeight() * 0.3,
                image: AssetImage(
                    "assets/Images/sammy-line-man-receives-a-mail.png")),
            Text(
              "Password Reset Email Sent",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Text(
              Resetpasssword.email.text,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Text(
                "Your Account Security is Our Priority ! We've sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected",
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
                          ecolor.primary, // Set the background color here
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Done"))),
            TextButton(
                onPressed: () {
                  forgotpassword.ForgotPassword(
                      Resetpasssword.email.text, context);
                },
                child: Text(
                  "Resend Email",
                  style: TextStyle(color: ecolor.primary),
                )),
          ],
        ),
      ),
    );
  }
}
