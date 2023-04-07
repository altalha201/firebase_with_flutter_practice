import 'package:firebase_with_flutter_practice/data/network_utils.dart';
import 'package:firebase_with_flutter_practice/ui/utility/toasts.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool inProgress = false;

  Future<bool> login(email, pass) async {
    inProgress = true;
    update();
    var result = await NetworkUtils().authValidation(email, pass);
    inProgress = false;
    update();
    if (result) {
      successToast("Login Success");
      return true;
    } else {
      errorToast("Login Failed");
      return false;
    }
  }

  Future<void> logout() async {
    await NetworkUtils().authRemove();
  }
}