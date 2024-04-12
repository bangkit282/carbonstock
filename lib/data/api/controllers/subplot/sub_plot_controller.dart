import 'package:carbonstock/data/local/localdb/subplot/sub_plot_b_db.dart';
import 'package:carbonstock/data/local/localdb/subplot/sub_plot_c_db.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:get/get.dart';

class SubPlotController extends GetxController {
  RxString pickedImage = ''.obs;
  RxBool isLoading = false.obs;

  Stream<List<SubPlotAreaBModel>> streamSubPlotBList =
      SubPlotBAreaDB.instance.readAllSubPlotB().map(
            (subPlotList) => subPlotList
                .map(
                  (subPlot) => SubPlotAreaBModel(
                    id: subPlot.id,
                    areaName: subPlot.areaName,
                    plotName: subPlot.plotName,
                    keliling: subPlot.keliling,
                    diameter: subPlot.diameter,
                    localName: subPlot.localName,
                    bioName: subPlot.bioName,
                    kerapatanKayu: subPlot.kerapatanKayu,
                    biomassLand: subPlot.biomassLand,
                    carbonValue: subPlot.carbonValue,
                    carbonAbsorb: subPlot.carbonAbsorb,
                  ),
                )
                .toList(),
          );

  Stream<List<SubPlotAreaCModel>> streamSubPlotCList =
      SubPlotCAreaDB.instance.readAllSubPlotC().map(
            (subPlotList) => subPlotList
                .map(
                  (subPlot) => SubPlotAreaCModel(
                    id: subPlot.id,
                    areaName: subPlot.areaName,
                    plotName: subPlot.plotName,
                    keliling: subPlot.keliling,
                    diameter: subPlot.diameter,
                    localName: subPlot.localName,
                    bioName: subPlot.bioName,
                    kerapatanKayu: subPlot.kerapatanKayu,
                    biomassLand: subPlot.biomassLand,
                    carbonValue: subPlot.carbonValue,
                    carbonAbsorb: subPlot.carbonAbsorb,
                  ),
                )
                .toList(),
          );

  Stream<List<SubPlotAreaBModel>>? readAllSubPlotBAsStream() async* {
    isLoading.value = true;
    streamSubPlotBList = SubPlotBAreaDB.instance.readAllSubPlotB().map(
          (subPlotList) => subPlotList,
        );
    isLoading.value = false;

    yield* streamSubPlotBList;
  }

  Stream<List<SubPlotAreaCModel>>? readAllSubPlotCAsStream() async* {
    isLoading.value = true;
    streamSubPlotCList = SubPlotCAreaDB.instance.readAllSubPlotC().map(
          (subPlotList) => subPlotList,
        );
    isLoading.value = false;

    yield* streamSubPlotCList;
  }

  Future<SubPlotAreaBModel?> readSingleSubPlotB(int id) async {
    SubPlotAreaBModel? foundSubPlot;

    await for (final subPlotBList in streamSubPlotBList) {
      for (final subPlotB in subPlotBList) {
        if (subPlotB.id == id) {
          foundSubPlot = subPlotB;
          break;
        }
      }

      if (foundSubPlot != null) {
        break;
      }
    }

    return foundSubPlot;
  }

  Future<SubPlotAreaCModel?> readSingleSubPlotC(int id) async {
    SubPlotAreaCModel? foundSubPlot;

    await for (final subPlotCList in streamSubPlotCList) {
      for (final subPlotC in subPlotCList) {
        if (subPlotC.id == id) {
          foundSubPlot = subPlotC;
          break;
        }
      }

      if (foundSubPlot != null) {
        break;
      }
    }

    return foundSubPlot;
  }

  Future<void> insertSubPlotB(SubPlotAreaBModel subPlotB) async {
    final SubPlotAreaBModel model = SubPlotAreaBModel(
      areaName: subPlotB.areaName,
      plotName: subPlotB.plotName,
      keliling: subPlotB.keliling,
      diameter: subPlotB.diameter,
      localName: subPlotB.localName,
      bioName: subPlotB.bioName,
      kerapatanKayu: subPlotB.kerapatanKayu,
      biomassLand: subPlotB.biomassLand,
      carbonValue: subPlotB.carbonValue,
      carbonAbsorb: subPlotB.carbonAbsorb,
    );

    await SubPlotBAreaDB.instance.insertSubPlot(model);
  }

  Future<void> insertSubPlotC(SubPlotAreaCModel subPlotC) async {
    final SubPlotAreaCModel model = SubPlotAreaCModel(
      areaName: subPlotC.areaName,
      plotName: subPlotC.plotName,
      keliling: subPlotC.keliling,
      diameter: subPlotC.diameter,
      localName: subPlotC.localName,
      bioName: subPlotC.bioName,
      kerapatanKayu: subPlotC.kerapatanKayu,
      biomassLand: subPlotC.biomassLand,
      carbonValue: subPlotC.carbonValue,
      carbonAbsorb: subPlotC.carbonAbsorb,
    );

    await SubPlotCAreaDB.instance.insertSubPlotC(model);
  }

  Future<void> updateSubPlotB(SubPlotAreaBModel subPlotB) async {
    final SubPlotAreaBModel model = SubPlotAreaBModel(
      areaName: subPlotB.areaName,
      plotName: subPlotB.plotName,
      keliling: subPlotB.keliling,
      diameter: subPlotB.diameter,
      localName: subPlotB.localName,
      bioName: subPlotB.bioName,
      kerapatanKayu: subPlotB.kerapatanKayu,
      biomassLand: subPlotB.biomassLand,
      carbonValue: subPlotB.carbonValue,
      carbonAbsorb: subPlotB.carbonAbsorb,
    );

    await SubPlotBAreaDB.instance.updateSubPlotB(model);
  }

  Future<void> updateSubPlotC(SubPlotAreaCModel subPlotC) async {
    final SubPlotAreaCModel model = SubPlotAreaCModel(
      areaName: subPlotC.areaName,
      plotName: subPlotC.plotName,
      keliling: subPlotC.keliling,
      diameter: subPlotC.diameter,
      localName: subPlotC.localName,
      bioName: subPlotC.bioName,
      kerapatanKayu: subPlotC.kerapatanKayu,
      biomassLand: subPlotC.biomassLand,
      carbonValue: subPlotC.carbonValue,
      carbonAbsorb: subPlotC.carbonAbsorb,
    );

    await SubPlotCAreaDB.instance.updateSubPlotC(model);
  }
}
