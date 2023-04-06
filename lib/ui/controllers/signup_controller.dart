import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  bool inProgress = false;

  Future<void> signup(firstName, lastName, email, password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }
}