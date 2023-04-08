import 'package:firebase_with_flutter_practice/data/network_utils.dart';
import 'package:firebase_with_flutter_practice/ui/utility/pick_image_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadController extends GetxController {
  XFile? pickedImage;

  Future<void> pickImage() async {
    pickImageDialog(
      onCameraTap: () async {
        pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
        if (pickedImage != null) {
          NetworkUtils().uploadToStorage(pickedImage!);
          pickedImage = null;
        }
        Get.back();
      },
      onGalleryTap: () async {
        pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          NetworkUtils().uploadToStorage(pickedImage!);
          pickedImage = null;
        }
        Get.back();
      }
    );
  }
}