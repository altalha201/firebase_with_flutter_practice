import 'package:firebase_with_flutter_practice/UI/screen/photo_view.dart';
import 'package:firebase_with_flutter_practice/UI/utility/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ApplicationColor.colorBlue,
        centerTitle: true,
        title: const Text("Photos"),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              
            },
            child: CircleAvatar(
              backgroundColor: ApplicationColor.colorBlack,
              child: const Icon(Icons.person_outline, size: 20,),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.add_circle_outline)
          )
        ],
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
