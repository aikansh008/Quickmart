import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}
