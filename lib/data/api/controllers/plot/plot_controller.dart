import 'dart:developer';

import 'package:carbonstock/data/api/client/plot/plot_service.dart';
import 'package:carbonstock/data/api/response/plot/plot_response.dart';
import 'package:carbonstock/data/local/localdb/plot/plot_db.dart';
import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PlotController extends GetxController {
  RxString pickedImage = ''.obs;
  RxBool isLoading = false.obs;

  final _plotService = PlotService(dio: Dio());
  final contactBox = PlotDB.plotBox;

  Plot plot = Plot();

  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = pickedFile.path;
    } else {
      log('No image selected');
    }
  }

  Future getAllPlot() async {
    final response = await _plotService.getAllPlot();

    response.fold(
      (l) {
        log(l.message, name: 'plot-controller');
      },
      (r) {
        plot = r;
      },
    );

    return plot;
  }

  Future<void> insertPlot(PlotModel plotModel) async {
    final PlotModel plot = PlotModel(
      plotId: plotModel.plotId,
      plotLat: plotModel.plotLat,
      plotLng: plotModel.plotLng,
      plotSize: plotModel.plotSize,
      biomassAvg: plotModel.biomassAvg,
      biomassStd: plotModel.biomassStd,
      updatedAt: plotModel.updatedAt,
    );

    await PlotDB.addPlot(plot);
  }

  Future<void> updatePlot(int index, PlotModel plotModel) async {
    final PlotModel plot = PlotModel(
      plotId: plotModel.plotId,
      plotLat: plotModel.plotLat,
      plotLng: plotModel.plotLng,
      plotSize: plotModel.plotSize,
      biomassAvg: plotModel.biomassAvg,
      biomassStd: plotModel.biomassStd,
      updatedAt: plotModel.updatedAt,
    );

    await PlotDB.updatePlot(index, plot);
  }
}
