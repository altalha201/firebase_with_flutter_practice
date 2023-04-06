import 'package:firebase_with_flutter_practice/UI/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI/screen/home_screen.dart';
import 'UI/screen/login_screen.dart';
import 'UI/screen/splash_screen.dart';

void main() {
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter with Firebase",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/create", page: () => SignupScreen()),
        GetPage(name: "/home", page: () => HomeScreen()),
      ],
    );
  }
}

