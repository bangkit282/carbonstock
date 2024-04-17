import 'dart:developer';

import 'package:carbonstock/data/local/localdb/subplot/sub_plot_a_db.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SubPlotController extends GetxController {
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

  final contactSemaiBox = SubPlotAreaDB.subPlotSemaiBox;
  final contactSeresahBox = SubPlotAreaDB.subPlotSeresahBox;
  final contactTumbuhanBawahBox = SubPlotAreaDB.subPlotBawahBox;

  final contactBBox = SubPlotAreaDB.subPlotBBox;
  final contactCBox = SubPlotAreaDB.subPlotCBox;

  // Sub Plot A
  Future<void> insertSubPlotA(
    SubPlotAreaASemaiModel? subPlotModelSemai,
    SubPlotAreaASeresahModel? subPlotModelSeresah,
    SubPlotAreaATumbuhanBawahModel? subPlotModelTumbuhanBawah,
  ) async {
    isLoading(true);

    if (subPlotModelSemai != null) {
      final SubPlotAreaASemaiModel subPlotSemai = SubPlotAreaASemaiModel(
        uuid: subPlotModelSemai.uuid,
        areaName: subPlotModelSemai.areaName,
        plotName: subPlotModelSemai.plotName,
        basahTotal: subPlotModelSemai.basahTotal,
        basahSample: subPlotModelSemai.basahSample,
        keringTotal: subPlotModelSemai.keringTotal,
        keringSample: subPlotModelSemai.keringSample,
        carbonValue: subPlotModelSemai.carbonValue,
        carbonAbsorb: subPlotModelSemai.carbonAbsorb,
      );

      await SubPlotAreaDB.addSubPlotASemai(subPlotSemai);
    }

    if (subPlotModelSeresah != null) {
      final SubPlotAreaASeresahModel subPlotSeresah = SubPlotAreaASeresahModel(
        uuid: subPlotModelSeresah.uuid,
        areaName: subPlotModelSeresah.areaName,
        plotName: subPlotModelSeresah.plotName,
        basahTotal: subPlotModelSeresah.basahTotal,
        basahSample: subPlotModelSeresah.basahSample,
        keringTotal: subPlotModelSeresah.keringTotal,
        keringSample: subPlotModelSeresah.keringSample,
        carbonValue: subPlotModelSeresah.carbonValue,
        carbonAbsorb: subPlotModelSeresah.carbonAbsorb,
      );

      await SubPlotAreaDB.addSubPlotASeresah(subPlotSeresah);
    }

    if (subPlotModelTumbuhanBawah != null) {
      final SubPlotAreaATumbuhanBawahModel subPlotTumbuhanBawah =
          SubPlotAreaATumbuhanBawahModel(
        uuid: subPlotModelTumbuhanBawah.uuid,
        areaName: subPlotModelTumbuhanBawah.areaName,
        plotName: subPlotModelTumbuhanBawah.plotName,
        basahTotal: subPlotModelTumbuhanBawah.basahTotal,
        basahSample: subPlotModelTumbuhanBawah.basahSample,
        keringTotal: subPlotModelTumbuhanBawah.keringTotal,
        keringSample: subPlotModelTumbuhanBawah.keringSample,
        carbonValue: subPlotModelTumbuhanBawah.carbonValue,
        carbonAbsorb: subPlotModelTumbuhanBawah.carbonAbsorb,
      );

      await SubPlotAreaDB.addSubPlotABawah(subPlotTumbuhanBawah);
    }

    isLoading(false);
  }

  Future<void> updateSubPlotA(
    SubPlotAreaASemaiModel? subPlotModelSemai,
    SubPlotAreaASeresahModel? subPlotModelSeresah,
    SubPlotAreaATumbuhanBawahModel? subPlotModelTumbuhanBawah,
  ) async {
    isLoading(true);

    if (subPlotModelSemai != null) {
      final SubPlotAreaASemaiModel subPlotSemai = SubPlotAreaASemaiModel(
        uuid: subPlotModelSemai.uuid,
        areaName: subPlotModelSemai.areaName,
        plotName: subPlotModelSemai.plotName,
        basahTotal: subPlotModelSemai.basahTotal,
        basahSample: subPlotModelSemai.basahSample,
        keringTotal: subPlotModelSemai.keringTotal,
        keringSample: subPlotModelSemai.keringSample,
        carbonValue: subPlotModelSemai.carbonValue,
        carbonAbsorb: subPlotModelSemai.carbonAbsorb,
      );

      await SubPlotAreaDB.updateSubPlotASemai(subPlotSemai);
    }

    if (subPlotModelSeresah != null) {
      final SubPlotAreaASeresahModel subPlotSeresah = SubPlotAreaASeresahModel(
        uuid: subPlotModelSeresah.uuid,
        areaName: subPlotModelSeresah.areaName,
        plotName: subPlotModelSeresah.plotName,
        basahTotal: subPlotModelSeresah.basahTotal,
        basahSample: subPlotModelSeresah.basahSample,
        keringTotal: subPlotModelSeresah.keringTotal,
        keringSample: subPlotModelSeresah.keringSample,
        carbonValue: subPlotModelSeresah.carbonValue,
        carbonAbsorb: subPlotModelSeresah.carbonAbsorb,
      );

      await SubPlotAreaDB.updateSubPlotASeresah(subPlotSeresah);
    }

    if (subPlotModelTumbuhanBawah != null) {
      final SubPlotAreaATumbuhanBawahModel subPlotTumbuhanBawah =
          SubPlotAreaATumbuhanBawahModel(
        uuid: subPlotModelTumbuhanBawah.uuid,
        areaName: subPlotModelTumbuhanBawah.areaName,
        plotName: subPlotModelTumbuhanBawah.plotName,
        basahTotal: subPlotModelTumbuhanBawah.basahTotal,
        basahSample: subPlotModelTumbuhanBawah.basahSample,
        keringTotal: subPlotModelTumbuhanBawah.keringTotal,
        keringSample: subPlotModelTumbuhanBawah.keringSample,
        carbonValue: subPlotModelTumbuhanBawah.carbonValue,
        carbonAbsorb: subPlotModelTumbuhanBawah.carbonAbsorb,
      );

      await SubPlotAreaDB.updateSubPlotABawah(subPlotTumbuhanBawah);
    }

    isLoading(false);
  }

  // Sub Plot B
  Future<void> insertSubPlotB(SubPlotAreaBModel subPlotBModel) async {
    final SubPlotAreaBModel subPlotB = SubPlotAreaBModel(
      uuid: subPlotBModel.uuid,
      areaName: subPlotBModel.areaName,
      plotName: subPlotBModel.plotName,
      keliling: subPlotBModel.keliling,
      diameter: subPlotBModel.diameter,
      localName: subPlotBModel.localName,
      bioName: subPlotBModel.bioName,
      kerapatanKayu: subPlotBModel.kerapatanKayu,
      biomassLand: subPlotBModel.biomassLand,
      carbonValue: subPlotBModel.carbonValue,
      carbonAbsorb: subPlotBModel.carbonAbsorb,
    );

    await SubPlotAreaDB.addSubPlotB(subPlotB);
  }

  Future<void> updateSubPlotB(SubPlotAreaBModel subPlotBModel) async {
    final SubPlotAreaBModel subPlotB = SubPlotAreaBModel(
      uuid: subPlotBModel.uuid,
      areaName: subPlotBModel.areaName,
      plotName: subPlotBModel.plotName,
      keliling: subPlotBModel.keliling,
      diameter: subPlotBModel.diameter,
      localName: subPlotBModel.localName,
      bioName: subPlotBModel.bioName,
      kerapatanKayu: subPlotBModel.kerapatanKayu,
      biomassLand: subPlotBModel.biomassLand,
      carbonValue: subPlotBModel.carbonValue,
      carbonAbsorb: subPlotBModel.carbonAbsorb,
    );

    await SubPlotAreaDB.updateSubPlotB(subPlotB);
  }

  // Sub Plot C
  Future<void> insertSubPlotC(SubPlotAreaCModel subPlotCModel) async {
    final SubPlotAreaCModel subPlotC = SubPlotAreaCModel(
      uuid: subPlotCModel.uuid,
      areaName: subPlotCModel.areaName,
      plotName: subPlotCModel.plotName,
      keliling: subPlotCModel.keliling,
      diameter: subPlotCModel.diameter,
      localName: subPlotCModel.localName,
      bioName: subPlotCModel.bioName,
      kerapatanKayu: subPlotCModel.kerapatanKayu,
      biomassLand: subPlotCModel.biomassLand,
      carbonValue: subPlotCModel.carbonValue,
      carbonAbsorb: subPlotCModel.carbonAbsorb,
    );

    await SubPlotAreaDB.addSubPlotC(subPlotC);
  }

  Future<void> updateSubPlotC(SubPlotAreaCModel subPlotCModel) async {
    final SubPlotAreaCModel subPlotC = SubPlotAreaCModel(
      uuid: subPlotCModel.uuid,
      areaName: subPlotCModel.areaName,
      plotName: subPlotCModel.plotName,
      keliling: subPlotCModel.keliling,
      diameter: subPlotCModel.diameter,
      localName: subPlotCModel.localName,
      bioName: subPlotCModel.bioName,
      kerapatanKayu: subPlotCModel.kerapatanKayu,
      biomassLand: subPlotCModel.biomassLand,
      carbonValue: subPlotCModel.carbonValue,
      carbonAbsorb: subPlotCModel.carbonAbsorb,
    );

    await SubPlotAreaDB.updateSubPlotC(subPlotC);
  }
}

// class SubPlotController extends GetxController {
//   RxString pickedImage = ''.obs;
//   RxBool isLoading = false.obs;

//   RxList subPlotAList = [].obs;

//   Stream<List<SubPlotAreaBModel>> streamSubPlotBList =
//       SubPlotBAreaDB.instance.readAllSubPlotB().map(
//             (subPlotList) => subPlotList
//                 .map(
//                   (subPlot) => SubPlotAreaBModel(
//                     id: subPlot.id,
//                     areaName: subPlot.areaName,
//                     plotName: subPlot.plotName,
//                     keliling: subPlot.keliling,
//                     diameter: subPlot.diameter,
//                     localName: subPlot.localName,
//                     bioName: subPlot.bioName,
//                     kerapatanKayu: subPlot.kerapatanKayu,
//                     biomassLand: subPlot.biomassLand,
//                     carbonValue: subPlot.carbonValue,
//                     carbonAbsorb: subPlot.carbonAbsorb,
//                   ),
//                 )
//                 .toList(),
//           );

//   Stream<List<SubPlotAreaCModel>> streamSubPlotCList =
//       SubPlotCAreaDB.instance.readAllSubPlotC().map(
//             (subPlotList) => subPlotList
//                 .map(
//                   (subPlot) => SubPlotAreaCModel(
//                     id: subPlot.id,
//                     areaName: subPlot.areaName,
//                     plotName: subPlot.plotName,
//                     keliling: subPlot.keliling,
//                     diameter: subPlot.diameter,
//                     localName: subPlot.localName,
//                     bioName: subPlot.bioName,
//                     kerapatanKayu: subPlot.kerapatanKayu,
//                     biomassLand: subPlot.biomassLand,
//                     carbonValue: subPlot.carbonValue,
//                     carbonAbsorb: subPlot.carbonAbsorb,
//                   ),
//                 )
//                 .toList(),
//           );

//   Future<List>? readAllSubPlotA() async {
//     isLoading.value = true;
//     final combined = subPlotAList([
//       _readAllSubPlotASemai(),
//       _readAllSubPlotASeresah(),
//       _readAllSubPlotATumbuhan(),
//     ]);
//     isLoading.value = false;

//     return combined;
//   }

//   Future<List<SubPlotAreaASemaiModel>>? _readAllSubPlotASemai() async {
//     isLoading.value = true;
//     final result = await subPlotASemaiList;
//     isLoading.value = false;

//     return result;
//   }

//   Future<List<SubPlotAreaASeresahModel>>? _readAllSubPlotASeresah() async {
//     isLoading.value = true;
//     final result = await subPlotASeresahList;
//     isLoading.value = false;

//     return result;
//   }

//   Future<List<SubPlotAreaATumbuhanBawahModel>>?
//       _readAllSubPlotATumbuhan() async {
//     isLoading.value = true;
//     final result = await subPlotATumbuhanList;
//     isLoading.value = false;

//     return result;
//   }

//   Stream<List<SubPlotAreaBModel>>? readAllSubPlotBAsStream() async* {
//     isLoading.value = true;
//     streamSubPlotBList = SubPlotBAreaDB.instance.readAllSubPlotB().map(
//           (subPlotList) => subPlotList,
//         );
//     isLoading.value = false;

//     yield* streamSubPlotBList;
//   }

//   Stream<List<SubPlotAreaCModel>>? readAllSubPlotCAsStream() async* {
//     isLoading.value = true;
//     streamSubPlotCList = SubPlotCAreaDB.instance.readAllSubPlotC().map(
//           (subPlotList) => subPlotList,
//         );
//     isLoading.value = false;

//     yield* streamSubPlotCList;
//   }

//   // Future<SubPlotAreaAModel?> readSingleSubPlotA(int id) async {
//   //   SubPlotAreaAModel? foundSubPlot;

//   //   await for (final subPlotAList in streamSubPlotAList) {
//   //     for (final subPlotA in subPlotAList) {
//   //       if (subPlotA.id == id) {
//   //         foundSubPlot = subPlotA;
//   //         break;
//   //       }
//   //     }

//   //     if (foundSubPlot != null) {
//   //       break;
//   //     }
//   //   }
//   // }

//   // Future<SubPlotAreaBModel?> readSingleSubPlotB(int id) async {
//   //   SubPlotAreaBModel? foundSubPlot;

//   //   await for (final subPlotBList in streamSubPlotBList) {
//   //     for (final subPlotB in subPlotBList) {
//   //       if (subPlotB.id == id) {
//   //         foundSubPlot = subPlotB;
//   //         break;
//   //       }
//   //     }

//   //     if (foundSubPlot != null) {
//   //       break;
//   //     }
//   //   }

//   //   return foundSubPlot;
//   // }

//   // Future<SubPlotAreaCModel?> readSingleSubPlotC(int id) async {
//   //   SubPlotAreaCModel? foundSubPlot;

//   //   await for (final subPlotCList in streamSubPlotCList) {
//   //     for (final subPlotC in subPlotCList) {
//   //       if (subPlotC.id == id) {
//   //         foundSubPlot = subPlotC;
//   //         break;
//   //       }
//   //     }

//   //     if (foundSubPlot != null) {
//   //       break;
//   //     }
//   //   }

//   //   return foundSubPlot;
//   // }

//   Future<void> insertSubPlotASemai(SubPlotAreaASemaiModel subPlotA) async {
//     final SubPlotAreaASemaiModel model = SubPlotAreaASemaiModel(
//       areaName: subPlotA.areaName,
//       plotName: subPlotA.plotName,
//       basahTotal: subPlotA.basahTotal,
//       basahSample: subPlotA.basahSample,
//       keringTotal: subPlotA.keringTotal,
//       keringSample: subPlotA.keringSample,
//       carbonValue: subPlotA.carbonValue,
//       carbonAbsorb: subPlotA.carbonAbsorb,
//     );

//     await SubPlotAAreaDB.instance.insertSubPlotASemai(model);
//   }

//   Future<void> insertSubPlotASeresah(SubPlotAreaASeresahModel subPlotA) async {
//     final SubPlotAreaASeresahModel model = SubPlotAreaASeresahModel(
//       areaName: subPlotA.areaName,
//       plotName: subPlotA.plotName,
//       basahTotal: subPlotA.basahTotal,
//       basahSample: subPlotA.basahSample,
//       keringTotal: subPlotA.keringTotal,
//       keringSample: subPlotA.keringSample,
//       carbonValue: subPlotA.carbonValue,
//       carbonAbsorb: subPlotA.carbonAbsorb,
//     );

//     await SubPlotAAreaDB.instance.insertSubPlotASeresah(model);
//   }

//   Future<void> insertSubPlotATumbuhan(
//       SubPlotAreaATumbuhanBawahModel subPlotA) async {
//     final SubPlotAreaATumbuhanBawahModel model = SubPlotAreaATumbuhanBawahModel(
//       areaName: subPlotA.areaName,
//       plotName: subPlotA.plotName,
//       basahTotal: subPlotA.basahTotal,
//       basahSample: subPlotA.basahSample,
//       keringTotal: subPlotA.keringTotal,
//       keringSample: subPlotA.keringSample,
//       carbonValue: subPlotA.carbonValue,
//       carbonAbsorb: subPlotA.carbonAbsorb,
//     );

//     await SubPlotAAreaDB.instance.insertSubPlotATumbuhan(model);
//   }

//   Future<void> insertSubPlotB(SubPlotAreaBModel subPlotB) async {
//     final SubPlotAreaBModel model = SubPlotAreaBModel(
//       areaName: subPlotB.areaName,
//       plotName: subPlotB.plotName,
//       keliling: subPlotB.keliling,
//       diameter: subPlotB.diameter,
//       localName: subPlotB.localName,
//       bioName: subPlotB.bioName,
//       kerapatanKayu: subPlotB.kerapatanKayu,
//       biomassLand: subPlotB.biomassLand,
//       carbonValue: subPlotB.carbonValue,
//       carbonAbsorb: subPlotB.carbonAbsorb,
//     );

//     await SubPlotBAreaDB.instance.insertSubPlot(model);
//   }

//   Future<void> insertSubPlotC(SubPlotAreaCModel subPlotC) async {
//     final SubPlotAreaCModel model = SubPlotAreaCModel(
//       areaName: subPlotC.areaName,
//       plotName: subPlotC.plotName,
//       keliling: subPlotC.keliling,
//       diameter: subPlotC.diameter,
//       localName: subPlotC.localName,
//       bioName: subPlotC.bioName,
//       kerapatanKayu: subPlotC.kerapatanKayu,
//       biomassLand: subPlotC.biomassLand,
//       carbonValue: subPlotC.carbonValue,
//       carbonAbsorb: subPlotC.carbonAbsorb,
//     );

//     await SubPlotCAreaDB.instance.insertSubPlotC(model);
//   }

//   Future<void> updateSubPlotASemai(
//     SubPlotAreaASemaiModel subPlotA,
//   ) async {
//     log('keupdate $subPlotA');

//     final SubPlotAreaASemaiModel model = SubPlotAreaASemaiModel(
//       areaName: subPlotA.areaName,
//       plotName: subPlotA.plotName,
//       basahTotal: subPlotA.basahTotal,
//       basahSample: subPlotA.basahSample,
//       keringTotal: subPlotA.keringTotal,
//       keringSample: subPlotA.keringSample,
//       carbonValue: subPlotA.carbonValue,
//       carbonAbsorb: subPlotA.carbonAbsorb,
//     );

//     await SubPlotAAreaDB.instance.updateSubPlotASemai(model);
//   }

//   Future<void> updateSubPlotASeresah(
//     SubPlotAreaASeresahModel subPlotA,
//   ) async {
//     final SubPlotAreaASeresahModel model = SubPlotAreaASeresahModel(
//       areaName: subPlotA.areaName,
//       plotName: subPlotA.plotName,
//       basahTotal: subPlotA.basahTotal,
//       basahSample: subPlotA.basahSample,
//       keringTotal: subPlotA.keringTotal,
//       keringSample: subPlotA.keringSample,
//       carbonValue: subPlotA.carbonValue,
//       carbonAbsorb: subPlotA.carbonAbsorb,
//     );

//     await SubPlotAAreaDB.instance.updateSubPlotASeresah(model);
//   }

//   Future<void> updateSubPlotATumbuhan(
//     SubPlotAreaATumbuhanBawahModel subPlotA,
//   ) async {
//     final SubPlotAreaATumbuhanBawahModel model = SubPlotAreaATumbuhanBawahModel(
//       areaName: subPlotA.areaName,
//       plotName: subPlotA.plotName,
//       basahTotal: subPlotA.basahTotal,
//       basahSample: subPlotA.basahSample,
//       keringTotal: subPlotA.keringTotal,
//       keringSample: subPlotA.keringSample,
//       carbonValue: subPlotA.carbonValue,
//       carbonAbsorb: subPlotA.carbonAbsorb,
//     );

//     await SubPlotAAreaDB.instance.updateSubPlotATumbuhan(model);
//   }

//   Future<void> updateSubPlotB(SubPlotAreaBModel subPlotB) async {
//     final SubPlotAreaBModel model = SubPlotAreaBModel(
//       areaName: subPlotB.areaName,
//       plotName: subPlotB.plotName,
//       keliling: subPlotB.keliling,
//       diameter: subPlotB.diameter,
//       localName: subPlotB.localName,
//       bioName: subPlotB.bioName,
//       kerapatanKayu: subPlotB.kerapatanKayu,
//       biomassLand: subPlotB.biomassLand,
//       carbonValue: subPlotB.carbonValue,
//       carbonAbsorb: subPlotB.carbonAbsorb,
//     );

//     await SubPlotBAreaDB.instance.updateSubPlotB(model);
//   }

//   Future<void> updateSubPlotC(SubPlotAreaCModel subPlotC) async {
//     final SubPlotAreaCModel model = SubPlotAreaCModel(
//       areaName: subPlotC.areaName,
//       plotName: subPlotC.plotName,
//       keliling: subPlotC.keliling,
//       diameter: subPlotC.diameter,
//       localName: subPlotC.localName,
//       bioName: subPlotC.bioName,
//       kerapatanKayu: subPlotC.kerapatanKayu,
//       biomassLand: subPlotC.biomassLand,
//       carbonValue: subPlotC.carbonValue,
//       carbonAbsorb: subPlotC.carbonAbsorb,
//     );

//     await SubPlotCAreaDB.instance.updateSubPlotC(model);
//   }
// }
