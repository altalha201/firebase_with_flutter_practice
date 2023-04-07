import 'package:firebase_with_flutter_practice/ui/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


import 'ui/controllers/profile_creation_controller.dart';
import 'ui/screen/home_screen.dart';
import 'ui/screen/login_screen.dart';
import 'ui/screen/profile_update.dart';
import 'ui/screen/signup_screen.dart';
import 'ui/screen/splash_screen.dart';

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
    Get.put(ProfileCreationController());
    Get.put(LoginController());
  }

}

