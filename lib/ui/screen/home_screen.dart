import 'package:firebase_with_flutter_practice/ui/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_bar.dart';
import 'photo_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Photos",
        fromHome: true,
        profileTap: () {
          Get.toNamed("/profile");
        },
        onLogoutTap: () {
          Get.find<LoginController>().logout();
        }
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0
        ), 
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(const PhotoView(url: "https://www.woolha.com/media/2019/01/flutter-display-and-adjust-image-from-assets-1200x627.jpg"));
            },
            child: SizedBox(
              height: 100,
              width: 100,
              // color: ApplicationColor.colorBlack,
              child: Image.network(
                  "https://www.woolha.com/media/2019/01/flutter-display-and-adjust-image-from-assets-1200x627.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        }
      ),
    );
  }
}
