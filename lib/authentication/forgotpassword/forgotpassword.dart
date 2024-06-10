import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class forgotpassword {
  static Future<void> ForgotPassword(String Email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
    } on FirebaseAuthException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } on FirebaseException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));  //Amazon WOW
    } on PlatformException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } on FormatException catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
