import 'dart:developer';

import 'package:carbonstock/data/local/localdb/plot/plot_db.dart';
import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PlotController extends GetxController {
  RxString pickedImage = ''.obs;
  RxBool isLoading = false.obs;

  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = pickedFile.path;
    } else {
      log('No image selected');
    }
  }

  final contactBox = PlotDB.plotBox;

  Future<void> insertPlot(PlotModel plotModel) async {
    final PlotModel plot = PlotModel(
      plotId: plotModel.plotId,
      plotLat: plotModel.plotLat,
      plotLng: plotModel.plotLng,
      plotSize: plotModel.plotSize,
      biomassAvg: plotModel.biomassAvg,
      biomassStd: plotModel.biomassStd,
    );

    await PlotDB.addPlot(plot);
  }

  Future<void> updatePlot(PlotModel plotModel) async {
    final PlotModel plot = PlotModel(
      plotId: plotModel.plotId,
      plotLat: plotModel.plotLat,
      plotLng: plotModel.plotLng,
      plotSize: plotModel.plotSize,
      biomassAvg: plotModel.biomassAvg,
      biomassStd: plotModel.biomassStd,
    );

    await PlotDB.updatePlot(plot);
  }
}
