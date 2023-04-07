import 'package:firebase_with_flutter_practice/data/network_utils.dart';
import 'package:get/get.dart';

class PhotoGetController extends GetxController {
  List imageReferences = [];

  Future<void> getImages() async {
    imageReferences = await NetworkUtils().getImageForUser();
    update();
  }
}