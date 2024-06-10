import 'package:ecommerce/navigationmenu.dart';
import 'package:ecommerce/userdata/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninController {
  static var email = TextEditingController();
  static var password = TextEditingController();
  
  static Future<void> signIncall(
     UserModel? usermodel, String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NaviagtionMenu(usermodel: usermodel!,)),
              ));
      throw "Successfully LoggedIn !";
    } on FirebaseAuthException {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong !")));
    } catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Sucessful !")));
    }
  }
}
