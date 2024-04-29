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

  Future<void> updateSubPlotA(
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
      await SubPlotAreaDB.updateSubPlotASemai(subPlotSemai);
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
      await SubPlotAreaDB.updateSubPlotASeresah(subPlotSeresah);
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
      await SubPlotAreaDB.updateSubPlotABawah(subPlotTumbuhanBawah);
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

      await SubPlotAreaDB.updateSubPlotA(subPlotA);
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

  Future<void> updateSubPlotB(SubPlotAreaBModel subPlotBModel) async {
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

    await SubPlotAreaDB.updateSubPlotB(subPlotB);
  }

  // Sub Plot C
  Future<void> insertSubPlotC(SubPlotAreaCModel subPlotCModel) async {
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

  Future<void> updateSubPlotC(SubPlotAreaCModel subPlotCModel) async {
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

    await SubPlotAreaDB.updateSubPlotC(subPlotC);
  }

  // Sub Plot D
  Future<void> insertSubPlotD(
    SubPlotAreaDModel subPlotModelD,
    SubPlotAreaDPohonModel? subPlotModelPohon,
    SubPlotAreaDNekromasModel? subPlotModelNekromas,
    SubPlotAreaDTanahModel? subPlotModelTanah,
  ) async {
    isLoading(true);
    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

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
    }

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
    }

    if (subPlotModelTanah != null) {
      final subPlotTanah = SubPlotAreaDTanahModel(
        uuid: subPlotModelTanah.uuid,
        plotId: subPlotModelTanah.plotId,
        areaName: subPlotModelTanah.areaName,
        plotName: subPlotModelTanah.plotName,
        kedalamanSample: subPlotModelTanah.kedalamanSample,
        beratJenisTanah: subPlotModelTanah.beratJenisTanah,
        organicTanah: subPlotModelTanah.organicTanah,
        carbonGrCm: subPlotModelTanah.carbonGrCm,
        carbonTonHa: subPlotModelTanah.carbonTonHa,
        carbonTon: subPlotModelTanah.carbonTon,
        carbonAbsorb: subPlotModelTanah.carbonAbsorb,
        updatedAt: subPlotModelTanah.updatedAt,
      );

      if (listPlotD.isEmpty) {
        listPlotD.addAll([null, null, subPlotTanah]);
      } else {
        listPlotD[2] = subPlotTanah;
      }

      await SubPlotAreaDB.addSubPlotTanah(subPlotTanah);
    }

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

  Future<void> updateSubPlotD(
    SubPlotAreaDModel subPlotModelD,
    SubPlotAreaDPohonModel? subPlotModelPohon,
    SubPlotAreaDNekromasModel? subPlotModelNekromas,
    SubPlotAreaDTanahModel? subPlotModelTanah,
  ) async {
    isLoading(true);

    List<dynamic>? listPlotD = subPlotModelD.subPlotDModels ?? [];

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

      listPlotD[0] = subPlotPohon;
      await SubPlotAreaDB.updateSubPlotPohon(subPlotPohon);
    }

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

      listPlotD[1] = subPlotNekromas;
      await SubPlotAreaDB.updateSubPlotNekromas(subPlotNekromas);
    }

    if (subPlotModelTanah != null) {
      final subPlotTanah = SubPlotAreaDTanahModel(
        uuid: subPlotModelTanah.uuid,
        plotId: subPlotModelTanah.plotId,
        areaName: subPlotModelTanah.areaName,
        plotName: subPlotModelTanah.plotName,
        kedalamanSample: subPlotModelTanah.kedalamanSample,
        beratJenisTanah: subPlotModelTanah.beratJenisTanah,
        organicTanah: subPlotModelTanah.organicTanah,
        carbonGrCm: subPlotModelTanah.carbonGrCm,
        carbonTonHa: subPlotModelTanah.carbonTonHa,
        carbonTon: subPlotModelTanah.carbonTon,
        carbonAbsorb: subPlotModelTanah.carbonAbsorb,
        updatedAt: subPlotModelTanah.updatedAt,
      );

      listPlotD[2] = subPlotTanah;
      await SubPlotAreaDB.updateSubPlotTanah(subPlotTanah);
    }

    if (listPlotD.isNotEmpty) {
      final subPlotD = SubPlotAreaDModel(
        uuid: subPlotModelD.uuid,
        plotId: subPlotModelD.plotId,
        areaName: subPlotModelD.areaName,
        plotName: subPlotModelD.plotName,
        subPlotDModels: listPlotD,
        updatedAt: subPlotModelD.updatedAt,
      );

      await SubPlotAreaDB.updateSubPlotD(subPlotD);
    }

    isLoading(false);
  }
}
