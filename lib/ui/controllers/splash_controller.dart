import 'package:firebase_with_flutter_practice/data/auth_data.dart';

class SplashController {
  bool userAvailable() {
    if(AuthData().checkLoginState()) {
      AuthData().getData();
      return true;
    } else {
      return false;
    }
  }
}