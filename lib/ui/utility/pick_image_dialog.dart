import 'package:firebase_with_flutter_practice/ui/utility/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

pickImageDialog({VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) async {
  Get.defaultDialog(
    title: "Pick Image Form",
    textCancel: "Cancel",
    cancelTextColor: ApplicationColor.colorRed,
    buttonColor: ApplicationColor.colorRed,
    content: Column(
      children: [
        ListTile(
          onTap: onCameraTap,
          leading: Icon(Icons.camera_alt_outlined, size: 34, color: ApplicationColor.colorBlack,),
          title: const Text("Camera"),
        ),
        ListTile(
          onTap: onGalleryTap,
          leading: Icon(Icons.image_outlined, size: 34, color: ApplicationColor.colorBlack,),
          title: const Text("Gallery"),
        )
      ],
    ),
  );
}