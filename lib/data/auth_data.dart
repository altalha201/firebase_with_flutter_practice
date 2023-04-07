import 'package:get_storage/get_storage.dart';

class AuthData {
  static String? firstName, lastName, profileImg, email, uID;
  final box = GetStorage();

  void saveUserData(String fName, String lName, String pImg, String uMail, id) {
    box.write("first_name", fName);
    box.write("last_name", lName);
    box.write("img", pImg);
    box.write("email", uMail);
    box.write("uID", id);

    uID = id;
    firstName = fName;
    lastName = lName;
    profileImg = pImg;
    email = uMail;
  }

  void getData() {
    firstName = box.read("first_name");
    lastName = box.read("last_name");
    uID = box.read("uID");
    email = box.read("email");
    profileImg = box.read("img");
  }

  bool checkLoginState() {
    var getUID = box.read("uID");
    if (getUID == null) {
      return false;
    } else {
      return true;
    }
  }

  void clearAuthData() {
    box.erase();
  }
}