import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AreaController extends GetxController {
  RxString pickedImage = ''.obs;

  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = pickedFile.path;
    } else {
      log('No image selected');
    }
  }
}
