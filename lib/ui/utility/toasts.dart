import 'package:fluttertoast/fluttertoast.dart';

import 'application_colors.dart';

void successToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: ApplicationColor.colorGreen,
      textColor: ApplicationColor.colorWhite,
      fontSize: 16.0
  );
}

void errorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: ApplicationColor.colorRed,
      textColor: ApplicationColor.colorWhite,
      fontSize: 16.0
  );
}