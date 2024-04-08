import 'dart:async';
import 'dart:developer';

import 'package:carbonstock/data/local/localdb/area/area_db.dart';
import 'package:carbonstock/data/local/model/area/area_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AreaController extends GetxController {
  RxString pickedImage = ''.obs;
  RxBool isLoading = false.obs;

  Stream<List<AreaModel>> streamAreaList = AreaDB.instance.readAllArea().map(
        (areaList) => areaList
            .map(
              (area) => AreaModel(
                id: area.id,
                areaName: area.areaName,
                areaLocation: area.areaLocation,
                areaImage: area.areaImage,
                forestType: area.forestType,
                landType: area.landType,
                createdAt: area.createdAt,
                notationTeam: area.notationTeam,
              ),
            )
            .toList(),
      );

  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = pickedFile.path;
    } else {
      log('No image selected');
    }
  }

  Stream<List<AreaModel>> readAllAreaAsStream() async* {
    isLoading.value = true;
    streamAreaList = AreaDB.instance.readAllArea().map((areaList) => areaList);
    isLoading.value = false;

    yield* streamAreaList;
  }

  Future<void> insertArea(AreaModel area) async {
    final AreaModel model = AreaModel(
      areaName: area.areaName,
      areaLocation: area.areaLocation,
      areaImage: area.areaImage,
      forestType: area.forestType,
      landType: area.landType,
      createdAt: area.createdAt,
      notationTeam: area.notationTeam,
    );

    await AreaDB.instance.insertArea(model);
  }
}
