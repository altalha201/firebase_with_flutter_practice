import 'package:get/get.dart';

import '../../data/network_utils.dart';
import '../utility/toasts.dart';

class ProfileCreationController extends GetxController {
  bool inProgress = false;

  Future<bool> signup(firstName, lastName, email, password) async {
    inProgress = true;
    update();
    var result = await NetworkUtils().authCreation(email, firstName, lastName, password);

    inProgress = false;
    update();
    if(result) {
      successToast("Profile Create Success");
      return true;
    } else {
      errorToast("Request failed! Try again");
      return false;
    }
  }
}