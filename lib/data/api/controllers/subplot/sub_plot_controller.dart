import 'dart:developer';

import 'package:carbonstock/data/local/localdb/subplot/sub_plot_db.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_d_model.dart';
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

  final contactABox = SubPlotAreaDB.subPlotABox;
  final contactASemaiBox = SubPlotAreaDB.subPlotSemaiBox;
  final contactASeresahBox = SubPlotAreaDB.subPlotSeresahBox;
  final contactATumbuhanBox = SubPlotAreaDB.subPlotBawahBox;

  final contactBBox = SubPlotAreaDB.subPlotBBox;
  final contactCBox = SubPlotAreaDB.subPlotCBox;

  final contactDBox = SubPlotAreaDB.subPlotDBox;
  final contactDPohonBox = SubPlotAreaDB.subPlotDPohonBox;
  final contactDNekromasBox = SubPlotAreaDB.subPlotDNekromasBox;
  final contactDTanahBox = SubPlotAreaDB.subPlotDTanahBox;

  // Sub Plot A
  Future<void> insertSubPlotA(
    SubPlotAreaAModel subPlotAModel,
    SubPlotAreaASemaiModel? subPlotModelSemai,
    SubPlotAreaASeresahModel? subPlotModelSeresah,
    SubPlotAreaATumbuhanBawahModel? subPlotModelTumbuhanBawah,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotA = subPlotAModel.subPlotAModels ?? [];

    if (subPlotModelSemai != null) {
      final subPlotSemai = SubPlotAreaASemaiModel(
        uuid: subPlotModelSemai.uuid,
        plotId: subPlotModelSemai.plotId,
        areaName: subPlotModelSemai.areaName,
        plotName: subPlotModelSemai.plotName,
        basahTotal: subPlotModelSemai.basahTotal,
        basahSample: subPlotModelSemai.basahSample,
        keringTotal: subPlotModelSemai.keringTotal,
        keringSample: subPlotModelSemai.keringSample,
        carbonValue: subPlotModelSemai.carbonValue,
        carbonAbsorb: subPlotModelSemai.carbonAbsorb,
        updatedAt: subPlotAModel.updatedAt,
      );

      if (listPlotA.isEmpty) {
        listPlotA.addAll([subPlotSemai, null, null]);
      } else {
        listPlotA[0] = subPlotSemai;
      }
      await SubPlotAreaDB.addSubPlotASemai(subPlotSemai);
    }

    if (subPlotModelSeresah != null) {
      final subPlotSeresah = SubPlotAreaASeresahModel(
        uuid: subPlotModelSeresah.uuid,
        plotId: subPlotModelSeresah.plotId,
        areaName: subPlotModelSeresah.areaName,
        plotName: subPlotModelSeresah.plotName,
        basahTotal: subPlotModelSeresah.basahTotal,
        basahSample: subPlotModelSeresah.basahSample,
        keringTotal: subPlotModelSeresah.keringTotal,
        keringSample: subPlotModelSeresah.keringSample,
        carbonValue: subPlotModelSeresah.carbonValue,
        carbonAbsorb: subPlotModelSeresah.carbonAbsorb,
        updatedAt: subPlotAModel.updatedAt,
      );

      if (listPlotA.isEmpty) {
        listPlotA.addAll([null, subPlotSeresah, null]);
      } else {
        listPlotA[1] = subPlotSeresah;
      }

      await SubPlotAreaDB.addSubPlotASeresah(subPlotSeresah);
    }

    if (subPlotModelTumbuhanBawah != null) {
      final subPlotTumbuhanBawah = SubPlotAreaATumbuhanBawahModel(
        uuid: subPlotModelTumbuhanBawah.uuid,
        plotId: subPlotModelTumbuhanBawah.plotId,
        areaName: subPlotModelTumbuhanBawah.areaName,
        plotName: subPlotModelTumbuhanBawah.plotName,
        basahTotal: subPlotModelTumbuhanBawah.basahTotal,
        basahSample: subPlotModelTumbuhanBawah.basahSample,
        keringTotal: subPlotModelTumbuhanBawah.keringTotal,
        keringSample: subPlotModelTumbuhanBawah.keringSample,
        carbonValue: subPlotModelTumbuhanBawah.carbonValue,
        carbonAbsorb: subPlotModelTumbuhanBawah.carbonAbsorb,
        updatedAt: subPlotAModel.updatedAt,
      );

      if (listPlotA.isEmpty) {
        // log('$listPlotA', name: 'isEmpty');
        listPlotA.addAll([null, null, subPlotTumbuhanBawah]);
      } else {
        // log('$listPlotA', name: 'isNotEmpty');
        listPlotA[2] = subPlotTumbuhanBawah;
      }

      await SubPlotAreaDB.addSubPlotABawah(subPlotTumbuhanBawah);
    }

    final subPlotA = SubPlotAreaAModel(
      uuid: subPlotAModel.uuid,
      plotId: subPlotAModel.plotId,
      areaName: subPlotAModel.areaName,
      plotName: subPlotAModel.plotName,
      subPlotAModels: listPlotA,
      updatedAt: subPlotAModel.updatedAt,
    );

    await SubPlotAreaDB.addSubPlotA(subPlotA);
    isLoading(false);
  }

  Future<SubPlotAreaAModel> getSpecificSubPlotA(String uuid) async =>
      SubPlotAreaDB.getSpecificSubPlotA(uuid);

  Future<void> updateSubPlotA(
    int indexA,
    int indexSemai,
    int indexSeresah,
    int indexTumbuhan,
    SubPlotAreaAModel subPlotAModel,
    SubPlotAreaASemaiModel? subPlotModelSemai,
    SubPlotAreaASeresahModel? subPlotModelSeresah,
    SubPlotAreaATumbuhanBawahModel? subPlotModelTumbuhanBawah,
  ) async {
    isLoading(true);

    List<dynamic>? listPlotA = subPlotAModel.subPlotAModels ?? [];

    if (subPlotModelSemai != null) {
      final subPlotSemai = SubPlotAreaASemaiModel(
        uuid: subPlotModelSemai.uuid,
        plotId: subPlotModelSemai.plotId,
        areaName: subPlotModelSemai.areaName,
        plotName: subPlotModelSemai.plotName,
        basahTotal: subPlotModelSemai.basahTotal,
        basahSample: subPlotModelSemai.basahSample,
        keringTotal: subPlotModelSemai.keringTotal,
        keringSample: subPlotModelSemai.keringSample,
        carbonValue: subPlotModelSemai.carbonValue,
        carbonAbsorb: subPlotModelSemai.carbonAbsorb,
        updatedAt: subPlotAModel.updatedAt,
      );

      listPlotA[0] = subPlotSemai;
      await SubPlotAreaDB.updateSubPlotASemai(
        indexSemai,
        subPlotSemai,
      );
    }

    if (subPlotModelSeresah != null) {
      final subPlotSeresah = SubPlotAreaASeresahModel(
        uuid: subPlotModelSeresah.uuid,
        plotId: subPlotModelSeresah.plotId,
        areaName: subPlotModelSeresah.areaName,
        plotName: subPlotModelSeresah.plotName,
        basahTotal: subPlotModelSeresah.basahTotal,
        basahSample: subPlotModelSeresah.basahSample,
        keringTotal: subPlotModelSeresah.keringTotal,
        keringSample: subPlotModelSeresah.keringSample,
        carbonValue: subPlotModelSeresah.carbonValue,
        carbonAbsorb: subPlotModelSeresah.carbonAbsorb,
        updatedAt: subPlotAModel.updatedAt,
      );

      listPlotA[1] = subPlotSeresah;
      await SubPlotAreaDB.updateSubPlotASeresah(
        indexSeresah,
        subPlotSeresah,
      );
    }

    if (subPlotModelTumbuhanBawah != null) {
      final subPlotTumbuhanBawah = SubPlotAreaATumbuhanBawahModel(
        uuid: subPlotModelTumbuhanBawah.uuid,
        plotId: subPlotModelTumbuhanBawah.plotId,
        areaName: subPlotModelTumbuhanBawah.areaName,
        plotName: subPlotModelTumbuhanBawah.plotName,
        basahTotal: subPlotModelTumbuhanBawah.basahTotal,
        basahSample: subPlotModelTumbuhanBawah.basahSample,
        keringTotal: subPlotModelTumbuhanBawah.keringTotal,
        keringSample: subPlotModelTumbuhanBawah.keringSample,
        carbonValue: subPlotModelTumbuhanBawah.carbonValue,
        carbonAbsorb: subPlotModelTumbuhanBawah.carbonAbsorb,
        updatedAt: subPlotAModel.updatedAt,
      );

      listPlotA[2] = subPlotTumbuhanBawah;
      await SubPlotAreaDB.updateSubPlotABawah(
        indexTumbuhan,
        subPlotTumbuhanBawah,
      );
    }

    if (listPlotA.isNotEmpty) {
      final subPlotA = SubPlotAreaAModel(
        uuid: subPlotAModel.uuid,
        plotId: subPlotAModel.plotId,
        areaName: subPlotAModel.areaName,
        plotName: subPlotAModel.plotName,
        subPlotAModels: listPlotA,
        updatedAt: subPlotAModel.updatedAt,
      );

      await SubPlotAreaDB.updateSubPlotA(indexA, subPlotA);
    }

    isLoading(false);
  }

  // Sub Plot B
  Future<void> insertSubPlotB(SubPlotAreaBModel subPlotBModel) async {
    final SubPlotAreaBModel subPlotB = SubPlotAreaBModel(
      uuid: subPlotBModel.uuid,
      plotId: subPlotBModel.plotId,
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
      updatedAt: subPlotBModel.updatedAt,
    );

    await SubPlotAreaDB.addSubPlotB(subPlotB);
  }

  Future<SubPlotAreaBModel> getSpecificSubPlotB(String uuid) async =>
      SubPlotAreaDB.getSpecificSubPlotB(uuid);

  Future<void> updateSubPlotB(
    int index,
    SubPlotAreaBModel subPlotBModel,
  ) async {
    final SubPlotAreaBModel subPlotB = SubPlotAreaBModel(
      uuid: subPlotBModel.uuid,
      plotId: subPlotBModel.plotId,
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
      updatedAt: subPlotBModel.updatedAt,
    );

    await SubPlotAreaDB.updateSubPlotB(index, subPlotB);
  }

  // Sub Plot C
  Future<void> insertSubPlotC(
    SubPlotAreaCModel subPlotCModel,
  ) async {
    final SubPlotAreaCModel subPlotC = SubPlotAreaCModel(
      uuid: subPlotCModel.uuid,
      plotId: subPlotCModel.plotId,
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
      updatedAt: subPlotCModel.updatedAt,
    );

    await SubPlotAreaDB.addSubPlotC(subPlotC);
  }

  Future<SubPlotAreaCModel> getSpecificSubPlotC(String uuid) async =>
      SubPlotAreaDB.getSpecificSubPlotC(uuid);

  Future<void> updateSubPlotC(
    int index,
    SubPlotAreaCModel subPlotCModel,
  ) async {
    final SubPlotAreaCModel subPlotC = SubPlotAreaCModel(
      uuid: subPlotCModel.uuid,
      plotId: subPlotCModel.plotId,
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
      updatedAt: subPlotCModel.updatedAt,
    );

    await SubPlotAreaDB.updateSubPlotC(index, subPlotC);
  }

  // Sub Plot D
  Future<void> insertSubPlotDPohon(
    SubPlotAreaDModel? subPlotModelD,
    SubPlotAreaDPohonModel? subPlotModelPohon,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD?.subPlotDModels ?? [];

    if (subPlotModelPohon != null) {
      final subPlotPohon = SubPlotAreaDPohonModel(
        uuid: subPlotModelPohon.uuid,
        plotId: subPlotModelPohon.plotId,
        areaName: subPlotModelPohon.areaName,
        plotName: subPlotModelPohon.plotName,
        keliling: subPlotModelPohon.keliling,
        diameter: subPlotModelPohon.diameter,
        localName: subPlotModelPohon.localName,
        bioName: subPlotModelPohon.bioName,
        kerapatanKayu: subPlotModelPohon.kerapatanKayu,
        biomassLand: subPlotModelPohon.biomassLand,
        carbonValue: subPlotModelPohon.carbonValue,
        carbonAbsorb: subPlotModelPohon.carbonAbsorb,
        updatedAt: subPlotModelPohon.updatedAt,
      );

      if (listPlotD.isEmpty) {
        listPlotD.addAll([subPlotPohon, null, null]);
      } else {
        listPlotD[0] = subPlotPohon;
      }

      await SubPlotAreaDB.addSubPlotPohon(subPlotPohon);

      if (SubPlotAreaDB.subPlotDBox.values.toList().isNotEmpty) {
        SubPlotAreaDModel? subPlotD = SubPlotAreaDB.subPlotDBox.values
            .toList()
            .firstWhereOrNull((e) => e.plotId == subPlotModelPohon.plotId);

        if (subPlotD != null) {
          if (subPlotModelD != null) {
            final subPlotD = SubPlotAreaDModel(
              uuid: subPlotModelD.uuid,
              plotId: subPlotModelD.plotId,
              areaName: subPlotModelD.areaName,
              plotName: subPlotModelD.plotName,
              subPlotDModels: listPlotD,
              updatedAt: subPlotModelD.updatedAt,
            );

            await SubPlotAreaDB.updateSubPlotD(
              SubPlotAreaDB.subPlotDBox.values
                  .toList()
                  .indexWhere((e) => e.plotId == subPlotModelPohon.plotId),
              subPlotD,
            );
          }
        }
      } else {
        if (subPlotModelD != null) {
          final subPlotD = SubPlotAreaDModel(
            uuid: subPlotModelD.uuid,
            plotId: subPlotModelD.plotId,
            areaName: subPlotModelD.areaName,
            plotName: subPlotModelD.plotName,
            subPlotDModels: listPlotD,
            updatedAt: subPlotModelD.updatedAt,
          );

          await SubPlotAreaDB.addSubPlotD(subPlotD);
        }
      }
    }

    isLoading(false);
  }

  Future<void> insertSubPlotDNekromas(
    SubPlotAreaDModel? subPlotModelD,
    SubPlotAreaDNekromasModel? subPlotModelNekromas,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD?.subPlotDModels ?? [];

    if (subPlotModelNekromas != null) {
      final subPlotNekromas = SubPlotAreaDNekromasModel(
        uuid: subPlotModelNekromas.uuid,
        plotId: subPlotModelNekromas.plotId,
        areaName: subPlotModelNekromas.areaName,
        plotName: subPlotModelNekromas.plotName,
        diameterPangkal: subPlotModelNekromas.diameterPangkal,
        diameterUjung: subPlotModelNekromas.diameterUjung,
        panjang: subPlotModelNekromas.panjang,
        volume: subPlotModelNekromas.volume,
        biomassLand: subPlotModelNekromas.biomassLand,
        carbonValue: subPlotModelNekromas.carbonValue,
        carbonAbsorb: subPlotModelNekromas.carbonAbsorb,
        updatedAt: subPlotModelNekromas.updatedAt,
      );

      if (listPlotD.isEmpty) {
        listPlotD.addAll([null, subPlotNekromas, null]);
      } else {
        listPlotD[1] = subPlotNekromas;
      }

      await SubPlotAreaDB.addSubPlotNekromas(subPlotNekromas);

      if (SubPlotAreaDB.subPlotDBox.values.toList().isNotEmpty) {
        SubPlotAreaDModel? subPlotD = SubPlotAreaDB.subPlotDBox.values
            .toList()
            .firstWhereOrNull((e) => e.plotId == subPlotModelNekromas.plotId);

        if (subPlotD != null) {
          if (subPlotModelD != null) {
            final subPlotD = SubPlotAreaDModel(
              uuid: subPlotModelD.uuid,
              plotId: subPlotModelD.plotId,
              areaName: subPlotModelD.areaName,
              plotName: subPlotModelD.plotName,
              subPlotDModels: listPlotD,
              updatedAt: subPlotModelD.updatedAt,
            );

            await SubPlotAreaDB.updateSubPlotD(
              SubPlotAreaDB.subPlotDBox.values
                  .toList()
                  .indexWhere((e) => e.plotId == subPlotModelNekromas.plotId),
              subPlotD,
            );
          }
        }
      } else {
        if (subPlotModelD != null) {
          final subPlotD = SubPlotAreaDModel(
            uuid: subPlotModelD.uuid,
            plotId: subPlotModelD.plotId,
            areaName: subPlotModelD.areaName,
            plotName: subPlotModelD.plotName,
            subPlotDModels: listPlotD,
            updatedAt: subPlotModelD.updatedAt,
          );

          await SubPlotAreaDB.addSubPlotD(subPlotD);
        }
      }
    }

    isLoading(false);
  }

  Future<void> insertSubPlotDTanah(
    SubPlotAreaDModel? subPlotModelD,
    SubPlotAreaDTanahModel? subPlotModelTanah,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD?.subPlotDModels ?? [];

    if (subPlotModelTanah != null) {
      final subPlotTanah = SubPlotAreaDTanahModel(
        uuid: subPlotModelTanah.uuid,
        plotId: subPlotModelTanah.plotId,
        areaName: subPlotModelTanah.areaName,
        plotName: subPlotModelTanah.plotName,
        kedalamanSample: subPlotModelTanah.kedalamanSample,
        beratJenisTanah: subPlotModelTanah.beratJenisTanah,
        organicTanah: subPlotModelTanah.organicTanah,
        carbonAbsorb: subPlotModelTanah.carbonAbsorb,
        carbonTonHa: subPlotModelTanah.carbonTonHa,
        carbonGrCm: subPlotModelTanah.carbonGrCm,
        carbonTon: subPlotModelTanah.carbonTon,
        updatedAt: subPlotModelTanah.updatedAt,
      );

      if (listPlotD.isEmpty) {
        listPlotD.addAll([null, null, subPlotTanah]);
      } else {
        listPlotD[2] = subPlotTanah;
      }

      await SubPlotAreaDB.addSubPlotTanah(subPlotTanah);

      if (SubPlotAreaDB.subPlotDBox.values.toList().isNotEmpty) {
        SubPlotAreaDModel? subPlotD = SubPlotAreaDB.subPlotDBox.values
            .toList()
            .firstWhereOrNull((e) => e.plotId == subPlotTanah.plotId);

        if (subPlotD != null) {
          if (subPlotModelD != null) {
            final subPlotD = SubPlotAreaDModel(
              uuid: subPlotModelD.uuid,
              plotId: subPlotModelD.plotId,
              areaName: subPlotModelD.areaName,
              plotName: subPlotModelD.plotName,
              subPlotDModels: listPlotD,
              updatedAt: subPlotModelD.updatedAt,
            );

            await SubPlotAreaDB.updateSubPlotD(
              SubPlotAreaDB.subPlotDBox.values
                  .toList()
                  .indexWhere((e) => e.plotId == subPlotTanah.plotId),
              subPlotD,
            );
          }
        }
      } else {
        if (subPlotModelD != null) {
          final subPlotD = SubPlotAreaDModel(
            uuid: subPlotModelD.uuid,
            plotId: subPlotModelD.plotId,
            areaName: subPlotModelD.areaName,
            plotName: subPlotModelD.plotName,
            subPlotDModels: listPlotD,
            updatedAt: subPlotModelD.updatedAt,
          );

          await SubPlotAreaDB.addSubPlotD(subPlotD);
        }
      }
    }

    isLoading(false);
  }

  Future<void> insertSubPlotD(
    SubPlotAreaDModel subPlotModelD,
    SubPlotAreaDPohonModel? subPlotModelPohon,
    SubPlotAreaDNekromasModel? subPlotModelNekromas,
    SubPlotAreaDTanahModel? subPlotModelTanah,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

    // if (subPlotModelPohon != null) {
    //   final subPlotPohon = SubPlotAreaDPohonModel(
    //     uuid: subPlotModelPohon.uuid,
    //     plotId: subPlotModelPohon.plotId,
    //     areaName: subPlotModelPohon.areaName,
    //     plotName: subPlotModelPohon.plotName,
    //     keliling: subPlotModelPohon.keliling,
    //     diameter: subPlotModelPohon.diameter,
    //     localName: subPlotModelPohon.localName,
    //     bioName: subPlotModelPohon.bioName,
    //     kerapatanKayu: subPlotModelPohon.kerapatanKayu,
    //     biomassLand: subPlotModelPohon.biomassLand,
    //     carbonValue: subPlotModelPohon.carbonValue,
    //     carbonAbsorb: subPlotModelPohon.carbonAbsorb,
    //     updatedAt: subPlotModelPohon.updatedAt,
    //   );

    //   if (listPlotD.isEmpty) {
    //     listPlotD.addAll([subPlotPohon, null, null]);
    //   } else {
    //     listPlotD[0] = subPlotPohon;
    //   }

    //   await SubPlotAreaDB.addSubPlotPohon(subPlotPohon);
    // }

    // if (subPlotModelNekromas != null) {
    //   final subPlotNekromas = SubPlotAreaDNekromasModel(
    //     uuid: subPlotModelNekromas.uuid,
    //     plotId: subPlotModelNekromas.plotId,
    //     areaName: subPlotModelNekromas.areaName,
    //     plotName: subPlotModelNekromas.plotName,
    //     diameterPangkal: subPlotModelNekromas.diameterPangkal,
    //     diameterUjung: subPlotModelNekromas.diameterUjung,
    //     panjang: subPlotModelNekromas.panjang,
    //     volume: subPlotModelNekromas.volume,
    //     biomassLand: subPlotModelNekromas.biomassLand,
    //     carbonValue: subPlotModelNekromas.carbonValue,
    //     carbonAbsorb: subPlotModelNekromas.carbonAbsorb,
    //     updatedAt: subPlotModelNekromas.updatedAt,
    //   );

    //   if (listPlotD.isEmpty) {
    //     listPlotD.addAll([null, subPlotNekromas, null]);
    //   } else {
    //     listPlotD[1] = subPlotNekromas;
    //   }

    //   await SubPlotAreaDB.addSubPlotNekromas(subPlotNekromas);
    // }

    // if (subPlotModelTanah != null) {
    //   final subPlotTanah = SubPlotAreaDTanahModel(
    //     uuid: subPlotModelTanah.uuid,
    //     plotId: subPlotModelTanah.plotId,
    //     areaName: subPlotModelTanah.areaName,
    //     plotName: subPlotModelTanah.plotName,
    //     kedalamanSample: subPlotModelTanah.kedalamanSample,
    //     beratJenisTanah: subPlotModelTanah.beratJenisTanah,
    //     organicTanah: subPlotModelTanah.organicTanah,
    //     carbonGrCm: subPlotModelTanah.carbonGrCm,
    //     carbonTonHa: subPlotModelTanah.carbonTonHa,
    //     carbonTon: subPlotModelTanah.carbonTon,
    //     carbonAbsorb: subPlotModelTanah.carbonAbsorb,
    //     updatedAt: subPlotModelTanah.updatedAt,
    //   );

    //   if (listPlotD.isEmpty) {
    //     listPlotD.addAll([null, null, subPlotTanah]);
    //   } else {
    //     listPlotD[2] = subPlotTanah;
    //   }

    //   await SubPlotAreaDB.addSubPlotTanah(subPlotTanah);
    // }

    final subPlotD = SubPlotAreaDModel(
      uuid: subPlotModelD.uuid,
      plotId: subPlotModelD.plotId,
      areaName: subPlotModelD.areaName,
      plotName: subPlotModelD.plotName,
      subPlotDModels: listPlotD,
      updatedAt: subPlotModelD.updatedAt,
    );

    await SubPlotAreaDB.addSubPlotD(subPlotD);
    isLoading(false);
  }

  Future<SubPlotAreaDModel> getSpecificSubPlotD(String uuid) async =>
      SubPlotAreaDB.getSpecificSubPlotD(uuid);

  Future<void> updateSubPlotDPohon(
    int indexD,
    int indexPohon,
    SubPlotAreaDModel subPlotModelD,
    SubPlotAreaDPohonModel subPlotModelPohon,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

    final subPlotPohon = SubPlotAreaDPohonModel(
      uuid: subPlotModelPohon.uuid,
      plotId: subPlotModelPohon.plotId,
      areaName: subPlotModelPohon.areaName,
      plotName: subPlotModelPohon.plotName,
      keliling: subPlotModelPohon.keliling,
      diameter: subPlotModelPohon.diameter,
      localName: subPlotModelPohon.localName,
      bioName: subPlotModelPohon.bioName,
      kerapatanKayu: subPlotModelPohon.kerapatanKayu,
      biomassLand: subPlotModelPohon.biomassLand,
      carbonValue: subPlotModelPohon.carbonValue,
      carbonAbsorb: subPlotModelPohon.carbonAbsorb,
      updatedAt: subPlotModelPohon.updatedAt,
    );

    listPlotD[0] = subPlotPohon;
    await SubPlotAreaDB.updateSubPlotPohon(indexPohon, subPlotPohon);
  }

  Future<void> updateSubPlotDNekromas(
    int indexD,
    int indexNekromas,
    SubPlotAreaDModel subPlotModelD,
    SubPlotAreaDNekromasModel subPlotModelNekromas,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

    final subPlotNekromas = SubPlotAreaDNekromasModel(
      uuid: subPlotModelNekromas.uuid,
      plotId: subPlotModelNekromas.plotId,
      areaName: subPlotModelNekromas.areaName,
      plotName: subPlotModelNekromas.plotName,
      diameterPangkal: subPlotModelNekromas.diameterPangkal,
      diameterUjung: subPlotModelNekromas.diameterUjung,
      panjang: subPlotModelNekromas.panjang,
      volume: subPlotModelNekromas.volume,
      biomassLand: subPlotModelNekromas.biomassLand,
      carbonValue: subPlotModelNekromas.carbonValue,
      carbonAbsorb: subPlotModelNekromas.carbonAbsorb,
      updatedAt: subPlotModelNekromas.updatedAt,
    );

    listPlotD[1] = subPlotNekromas;
    await SubPlotAreaDB.updateSubPlotNekromas(indexNekromas, subPlotNekromas);
  }

  Future<void> updateSubPlotDTanah(
    int indexD,
    int indexTanah,
    SubPlotAreaDModel subPlotModelD,
    SubPlotAreaDTanahModel subPlotModelTanah,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

    listPlotD[2] = subPlotModelTanah;
    await SubPlotAreaDB.updateSubPlotTanah(indexTanah, subPlotModelTanah);
  }

  Future<void> updateSubPlotD(
    int indexD,
    int indexPohon,
    int indexNekromas,
    int indexTanah,
    SubPlotAreaDModel subPlotModelD,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

    if (listPlotD.isNotEmpty) {
      final subPlotD = SubPlotAreaDModel(
        uuid: subPlotModelD.uuid,
        plotId: subPlotModelD.plotId,
        areaName: subPlotModelD.areaName,
        plotName: subPlotModelD.plotName,
        subPlotDModels: listPlotD,
        updatedAt: subPlotModelD.updatedAt,
      );

      await SubPlotAreaDB.updateSubPlotD(indexD, subPlotD);
    }

    isLoading(false);
  }
}
