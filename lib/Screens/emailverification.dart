import 'dart:async';

import 'package:ecommerce/Screens/signupscreen.dart';
import 'package:ecommerce/Screens/signupsuccess.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginVerification extends StatefulWidget {
  const LoginVerification({super.key});

  @override
  State<LoginVerification> createState() => _LoginVerificationState();
}

class _LoginVerificationState extends State<LoginVerification> {
  bool isEmailVerified = false;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
    }
   timer = Timer.periodic(Duration(seconds: 3), (timer) {
  FirebaseAuth.instance.currentUser?.reload();
  if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignupSuccess()));
  }
});
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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
                    context, MaterialPageRoute(builder: (context) => SignUp()));
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
              "Verify your email address!",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Text(
              "support@aikanshtiwari.com",
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Text(
                "Congratulations! Your Account Awaits: Verify Your Email to Start shopping and Experience a world of Unrivaled Deals and Personalized Offers.",
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
                    onPressed: () {},
                    child: Text("Continue"))),
            TextButton(
                onPressed: () {
                  sendVerificationEmail();
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
