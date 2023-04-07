import 'package:flutter/material.dart';

import 'application_colors.dart';

class UIUtility {

  static Icon proceedIcon = const Icon(
    Icons.arrow_circle_right_outlined,
    size: 30,
  );

  static String noImg = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png";

  static Widget profileIcon = const Icon(Icons.person_outline, size: 20,);


  static Widget whiteProgress() => Center(
    child: CircularProgressIndicator(
      color: ApplicationColor.colorWhite,
    ),
  );
}