import 'package:carbonstock/data/local/localdb/subplot/sub_plot_a_db.dart';
import 'package:carbonstock/data/local/localdb/subplot/sub_plot_b_db.dart';
import 'package:carbonstock/data/local/localdb/subplot/sub_plot_c_db.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class SubPlotController extends GetxController {
  RxString pickedImage = ''.obs;
  RxBool isLoading = false.obs;

  Stream<List<SubPlotAreaASemaiModel>> streamSubPlotASemaiList =
      SubPlotAAreaDB.instance.readAllSubPlotASemai().map(
            (subPlotList) => subPlotList
                .map(
                  (subPlot) => SubPlotAreaASemaiModel(
                    id: subPlot.id,
                    areaName: subPlot.areaName,
                    plotName: subPlot.plotName,
                    basahTotal: subPlot.basahTotal,
                    basahSample: subPlot.basahSample,
                    keringTotal: subPlot.keringTotal,
                    keringSample: subPlot.keringSample,
                    carbonValue: subPlot.carbonValue,
                    carbonAbsorb: subPlot.carbonAbsorb,
                  ),
                )
                .toList(),
          );

  Stream<List<SubPlotAreaASeresahModel>> streamSubPlotASeresahList =
      SubPlotAAreaDB.instance.readAllSubPlotASeresah().map(
            (subPlotList) => subPlotList
                .map(
                  (subPlot) => SubPlotAreaASeresahModel(
                    id: subPlot.id,
                    areaName: subPlot.areaName,
                    plotName: subPlot.plotName,
                    basahTotal: subPlot.basahTotal,
                    basahSample: subPlot.basahSample,
                    keringTotal: subPlot.keringTotal,
                    keringSample: subPlot.keringSample,
                    carbonValue: subPlot.carbonValue,
                    carbonAbsorb: subPlot.carbonAbsorb,
                  ),
                )
                .toList(),
          );

  Stream<List<SubPlotAreaATumbuhanBawahModel>> streamSubPlotATumbuhanList =
      SubPlotAAreaDB.instance.readAllSubPlotATumbuhan().map(
            (subPlotList) => subPlotList
                .map(
                  (subPlot) => SubPlotAreaATumbuhanBawahModel(
                    id: subPlot.id,
                    areaName: subPlot.areaName,
                    plotName: subPlot.plotName,
                    basahTotal: subPlot.basahTotal,
                    basahSample: subPlot.basahSample,
                    keringTotal: subPlot.keringTotal,
                    keringSample: subPlot.keringSample,
                    carbonValue: subPlot.carbonValue,
                    carbonAbsorb: subPlot.carbonAbsorb,
                  ),
                )
                .toList(),
          );

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

  Stream<List<SubPlotAreaASemaiModel>>? readAllSubPlotASemaiAsStream() async* {
    isLoading.value = true;

    streamSubPlotASemaiList = SubPlotAAreaDB.instance
        .readAllSubPlotASemai()
        .map((subPlotList) => subPlotList);
    isLoading.value = false;

    yield* streamSubPlotASemaiList;
  }

  Stream<List<SubPlotAreaASeresahModel>>?
      readAllSubPlotASeresahAsStream() async* {
    isLoading.value = true;

    streamSubPlotASeresahList = SubPlotAAreaDB.instance
        .readAllSubPlotASeresah()
        .map((subPlotList) => subPlotList);
    isLoading.value = false;

    yield* streamSubPlotASeresahList;
  }

  Stream<List<SubPlotAreaATumbuhanBawahModel>>?
      readAllSubPlotATumbuhanAsStream() async* {
    isLoading.value = true;

    streamSubPlotATumbuhanList = SubPlotAAreaDB.instance
        .readAllSubPlotATumbuhan()
        .map((subPlotList) => subPlotList);
    isLoading.value = false;

    yield* streamSubPlotATumbuhanList;
  }

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

  // Future<SubPlotAreaAModel?> readSingleSubPlotA(int id) async {
  //   SubPlotAreaAModel? foundSubPlot;

  //   await for (final subPlotAList in streamSubPlotAList) {
  //     for (final subPlotA in subPlotAList) {
  //       if (subPlotA.id == id) {
  //         foundSubPlot = subPlotA;
  //         break;
  //       }
  //     }

  //     if (foundSubPlot != null) {
  //       break;
  //     }
  //   }
  // }

  // Future<SubPlotAreaBModel?> readSingleSubPlotB(int id) async {
  //   SubPlotAreaBModel? foundSubPlot;

  //   await for (final subPlotBList in streamSubPlotBList) {
  //     for (final subPlotB in subPlotBList) {
  //       if (subPlotB.id == id) {
  //         foundSubPlot = subPlotB;
  //         break;
  //       }
  //     }

  //     if (foundSubPlot != null) {
  //       break;
  //     }
  //   }

  //   return foundSubPlot;
  // }

  // Future<SubPlotAreaCModel?> readSingleSubPlotC(int id) async {
  //   SubPlotAreaCModel? foundSubPlot;

  //   await for (final subPlotCList in streamSubPlotCList) {
  //     for (final subPlotC in subPlotCList) {
  //       if (subPlotC.id == id) {
  //         foundSubPlot = subPlotC;
  //         break;
  //       }
  //     }

  //     if (foundSubPlot != null) {
  //       break;
  //     }
  //   }

  //   return foundSubPlot;
  // }

  Future<void> insertSubPlotASemai(SubPlotAreaASemaiModel subPlotA) async {
    final SubPlotAreaASemaiModel model = SubPlotAreaASemaiModel(
      areaName: subPlotA.areaName,
      plotName: subPlotA.plotName,
      basahTotal: subPlotA.basahTotal,
      basahSample: subPlotA.basahSample,
      keringTotal: subPlotA.keringTotal,
      keringSample: subPlotA.keringSample,
      carbonValue: subPlotA.carbonValue,
      carbonAbsorb: subPlotA.carbonAbsorb,
    );

    await SubPlotAAreaDB.instance.insertSubPlotASemai(model);
  }

  Future<void> insertSubPlotASeresah(SubPlotAreaASeresahModel subPlotA) async {
    final SubPlotAreaASeresahModel model = SubPlotAreaASeresahModel(
      areaName: subPlotA.areaName,
      plotName: subPlotA.plotName,
      basahTotal: subPlotA.basahTotal,
      basahSample: subPlotA.basahSample,
      keringTotal: subPlotA.keringTotal,
      keringSample: subPlotA.keringSample,
      carbonValue: subPlotA.carbonValue,
      carbonAbsorb: subPlotA.carbonAbsorb,
    );

    await SubPlotAAreaDB.instance.insertSubPlotASeresah(model);
  }

  Future<void> insertSubPlotATumbuhan(
      SubPlotAreaATumbuhanBawahModel subPlotA) async {
    final SubPlotAreaATumbuhanBawahModel model = SubPlotAreaATumbuhanBawahModel(
      areaName: subPlotA.areaName,
      plotName: subPlotA.plotName,
      basahTotal: subPlotA.basahTotal,
      basahSample: subPlotA.basahSample,
      keringTotal: subPlotA.keringTotal,
      keringSample: subPlotA.keringSample,
      carbonValue: subPlotA.carbonValue,
      carbonAbsorb: subPlotA.carbonAbsorb,
    );

    await SubPlotAAreaDB.instance.insertSubPlotATumbuhan(model);
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

  Future<void> updateSubPlotASemai(
    SubPlotAreaASemaiModel subPlotA,
  ) async {
    final SubPlotAreaASemaiModel model = SubPlotAreaASemaiModel(
      areaName: subPlotA.areaName,
      plotName: subPlotA.plotName,
      basahTotal: subPlotA.basahTotal,
      basahSample: subPlotA.basahSample,
      keringTotal: subPlotA.keringTotal,
      keringSample: subPlotA.keringSample,
      carbonValue: subPlotA.carbonValue,
      carbonAbsorb: subPlotA.carbonAbsorb,
    );

    await SubPlotAAreaDB.instance.updateSubPlotASemai(model);
  }

  Future<void> updateSubPlotASeresah(
    SubPlotAreaASeresahModel subPlotA,
  ) async {
    final SubPlotAreaASeresahModel model = SubPlotAreaASeresahModel(
      areaName: subPlotA.areaName,
      plotName: subPlotA.plotName,
      basahTotal: subPlotA.basahTotal,
      basahSample: subPlotA.basahSample,
      keringTotal: subPlotA.keringTotal,
      keringSample: subPlotA.keringSample,
      carbonValue: subPlotA.carbonValue,
      carbonAbsorb: subPlotA.carbonAbsorb,
    );

    await SubPlotAAreaDB.instance.updateSubPlotASeresah(model);
  }

  Future<void> updateSubPlotATumbuhan(
    SubPlotAreaATumbuhanBawahModel subPlotA,
  ) async {
    final SubPlotAreaATumbuhanBawahModel model = SubPlotAreaATumbuhanBawahModel(
      areaName: subPlotA.areaName,
      plotName: subPlotA.plotName,
      basahTotal: subPlotA.basahTotal,
      basahSample: subPlotA.basahSample,
      keringTotal: subPlotA.keringTotal,
      keringSample: subPlotA.keringSample,
      carbonValue: subPlotA.carbonValue,
      carbonAbsorb: subPlotA.carbonAbsorb,
    );

    await SubPlotAAreaDB.instance.updateSubPlotATumbuhan(model);
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
