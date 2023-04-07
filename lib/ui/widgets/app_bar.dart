import 'package:firebase_with_flutter_practice/data/auth_data.dart';
import 'package:firebase_with_flutter_practice/ui/utility/ui_utility.dart';
import 'package:flutter/material.dart';

import '../utility/application_colors.dart';

AppBar buildAppBar({
  String? title,
  VoidCallback? profileTap,
  bool? fromHome,
  VoidCallback? onLogoutTap,
  PreferredSizeWidget? bottom,
}) {
  bool hasImage = true;
  var image = AuthData.profileImg;
  if (image == "" || image == null) {
    hasImage = false;
  }

  return AppBar(
    backgroundColor: ApplicationColor.colorBlue,
    centerTitle: true,
    title: Text(title ?? ""),
    leading: Visibility(
      visible: fromHome ?? false,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: profileTap,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: ApplicationColor.colorBlack,
            child: hasImage
                ? Image.network(image!)
                : UIUtility.profileIcon,
          ),
        ),
      ),
    ),
    actions: [
      IconButton(
          onPressed: onLogoutTap,
          icon: Icon(Icons.logout, color: ApplicationColor.colorWhite,)
      )
    ],
    bottom: bottom,
  );
}
