import 'package:firebase_with_flutter_practice/ui/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'UI/screen/home_screen.dart';
import 'UI/screen/login_screen.dart';
import 'UI/screen/profile_update.dart';
import 'UI/screen/signup_screen.dart';
import 'UI/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialBinding: StoreBinding(),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/create", page: () => SignupScreen()),
        GetPage(name: "/home", page: () => const HomeScreen()),
        GetPage(name: "/profile", page: () => const ProfileUpdate()),
      ],
    );
  }
}

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }

}

