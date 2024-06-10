import 'package:ecommerce/Screens/loginscreen.dart';
import 'package:ecommerce/Screens/onboarding.dart';
import 'package:ecommerce/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkIfLogin();
  }

  void checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          isLogin = user != null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lighttheme,
      darkTheme: TAppTheme.darktheme,
      home:  (initScreen == 0 || initScreen == null
              ? OnboardingScreen()
              : LoginScreen()),
    );
  }
}
