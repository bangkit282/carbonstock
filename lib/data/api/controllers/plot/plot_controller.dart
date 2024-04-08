import 'dart:developer';

import 'package:carbonstock/data/local/localdb/plot/plot_db.dart';
import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PlotController extends GetxController {
  RxString pickedImage = ''.obs;
  RxBool isLoading = false.obs;

  Stream<List<PlotModel>> streamPlotList = PlotDB.instance.readAllPlot().map(
        (plotList) => plotList
            .map(
              (plot) => PlotModel(
                id: plot.id,
                plotLat: plot.plotLat,
                plotLng: plot.plotLng,
                plotSize: plot.plotSize,
                biomassAvg: plot.biomassAvg,
                biomassStd: plot.biomassStd,
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

  Stream<List<PlotModel>>? readAllPlotAsStream() async* {
    isLoading.value = true;
    streamPlotList = PlotDB.instance.readAllPlot().map((plotList) => plotList);
    isLoading.value = false;

    yield* streamPlotList;
  }

  Future<void> insertPlot(PlotModel plot) async {
    final PlotModel model = PlotModel(
      plotLat: plot.plotLat,
      plotLng: plot.plotLng,
      plotSize: plot.plotSize,
      biomassAvg: plot.biomassAvg,
      biomassStd: plot.biomassStd,
    );

    await PlotDB.instance.insertPlot(model);
  }
}
