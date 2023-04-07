import 'package:flutter/material.dart';

import '../utility/application_colors.dart';

AppBar buildAppBar({
  String? title,
  VoidCallback? profileTap,
  bool? fromHome,
  VoidCallback? onLogoutTap,
  PreferredSizeWidget? bottom,
}) {
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
            backgroundColor: ApplicationColor.colorBlack,
            child: const Icon(Icons.person_outline, size: 20,),
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
