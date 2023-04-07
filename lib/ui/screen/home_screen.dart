import 'package:firebase_with_flutter_practice/ui/controllers/login_controller.dart';
import 'package:firebase_with_flutter_practice/ui/controllers/photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_bar.dart';
import '../widgets/image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState()  {
    Get.find<PhotoGetController>().getImages();
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<PhotoGetController>(builder: (photoController) {
          return GridView.builder(
              itemCount: photoController.imageReferences.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0
              ),
              itemBuilder: (context, index) {
                return ImageWidget(url: photoController.imageReferences[index],);
              }
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
