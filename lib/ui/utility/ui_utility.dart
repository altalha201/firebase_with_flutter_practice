import 'package:flutter/material.dart';

import 'application_colors.dart';

class UIUtility {

  static Icon proceedIcon = const Icon(
    Icons.arrow_circle_right_outlined,
    size: 30,
  );

  static Widget whiteProgress() => Center(
    child: CircularProgressIndicator(
      color: ApplicationColor.colorWhite,
    ),
  );
}