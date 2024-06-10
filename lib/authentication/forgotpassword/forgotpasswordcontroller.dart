import 'package:flutter/cupertino.dart';

class Resetpasssword {
 static final email = TextEditingController();
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required.';

    final email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!email.hasMatch(value)) {
      return 'Invalid email Address';
    }
    return null;
  }
}
