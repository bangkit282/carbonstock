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

  final contactSemaiBox = SubPlotAreaDB.subPlotSemaiBox;
  final contactSeresahBox = SubPlotAreaDB.subPlotSeresahBox;
  final contactTumbuhanBawahBox = SubPlotAreaDB.subPlotBawahBox;

  final contactBBox = SubPlotAreaDB.subPlotBBox;
  final contactCBox = SubPlotAreaDB.subPlotCBox;

  final contactDPohonBox = SubPlotAreaDB.subPlotDPohonBox;
  final contactDNekromasBox = SubPlotAreaDB.subPlotDNekromasBox;
  final contactDTanahBox = SubPlotAreaDB.subPlotDTanahBox;

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

  // Sub Plot D
  Future<void> insertSubPlotD(
    SubPlotAreaDPohonModel? subPlotModelPohon,
    SubPlotAreaDNekromasModel? subPlotModelNekromas,
    SubPlotAreaDTanahModel? subPlotModelTanah,
  ) async {
    isLoading(true);

    if (subPlotModelPohon != null) {
      final SubPlotAreaDPohonModel subPlotPohon = SubPlotAreaDPohonModel(
        uuid: subPlotModelPohon.uuid,
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
        updateAt: subPlotModelPohon.updateAt,
      );

      await SubPlotAreaDB.addSubPlotPohon(subPlotPohon);
    }

    if (subPlotModelNekromas != null) {
      final SubPlotAreaDNekromasModel subPlotNekromas =
          SubPlotAreaDNekromasModel(
        uuid: subPlotModelNekromas.uuid,
        areaName: subPlotModelNekromas.areaName,
        plotName: subPlotModelNekromas.plotName,
        diameterPangkal: subPlotModelNekromas.diameterPangkal,
        diameterUjung: subPlotModelNekromas.diameterUjung,
        panjang: subPlotModelNekromas.panjang,
        volume: subPlotModelNekromas.volume,
        biomassLand: subPlotModelNekromas.biomassLand,
        carbonValue: subPlotModelNekromas.carbonValue,
        carbonAbsorb: subPlotModelNekromas.carbonAbsorb,
        updateAt: subPlotModelNekromas.updateAt,
      );

      await SubPlotAreaDB.addSubPlotNekromas(subPlotNekromas);
    }

    if (subPlotModelTanah != null) {
      final SubPlotAreaDTanahModel subPlotTanah = SubPlotAreaDTanahModel(
        uuid: subPlotModelTanah.uuid,
        areaName: subPlotModelTanah.areaName,
        plotName: subPlotModelTanah.plotName,
        kedalamanSample: subPlotModelTanah.kedalamanSample,
        beratJenisTanah: subPlotModelTanah.beratJenisTanah,
        organicTanah: subPlotModelTanah.organicTanah,
        carbonGrCm: subPlotModelTanah.carbonGrCm,
        carbonTonHa: subPlotModelTanah.carbonTonHa,
        carbonTon: subPlotModelTanah.carbonTon,
        carbonAbsorb: subPlotModelTanah.carbonAbsorb,
        updateAt: subPlotModelTanah.updateAt,
      );

      await SubPlotAreaDB.addSubPlotTanah(subPlotTanah);
    }
    isLoading(false);
  }

  Future<void> updateSubPlotD(
    SubPlotAreaDPohonModel? subPlotModelPohon,
    SubPlotAreaDNekromasModel? subPlotModelNekromas,
    SubPlotAreaDTanahModel? subPlotModelTanah,
  ) async {
    isLoading(true);

    if (subPlotModelPohon != null) {
      final SubPlotAreaDPohonModel subPlotPohon = SubPlotAreaDPohonModel(
        uuid: subPlotModelPohon.uuid,
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
        updateAt: subPlotModelPohon.updateAt,
      );

      await SubPlotAreaDB.updateSubPlotPohon(subPlotPohon);
    }

    if (subPlotModelNekromas != null) {
      final SubPlotAreaDNekromasModel subPlotNekromas =
          SubPlotAreaDNekromasModel(
        uuid: subPlotModelNekromas.uuid,
        areaName: subPlotModelNekromas.areaName,
        plotName: subPlotModelNekromas.plotName,
        diameterPangkal: subPlotModelNekromas.diameterPangkal,
        diameterUjung: subPlotModelNekromas.diameterUjung,
        panjang: subPlotModelNekromas.panjang,
        volume: subPlotModelNekromas.volume,
        biomassLand: subPlotModelNekromas.biomassLand,
        carbonValue: subPlotModelNekromas.carbonValue,
        carbonAbsorb: subPlotModelNekromas.carbonAbsorb,
        updateAt: subPlotModelNekromas.updateAt,
      );

      await SubPlotAreaDB.updateSubPlotNekromas(subPlotNekromas);
    }

    if (subPlotModelTanah != null) {
      final SubPlotAreaDTanahModel subPlotTanah = SubPlotAreaDTanahModel(
        uuid: subPlotModelTanah.uuid,
        areaName: subPlotModelTanah.areaName,
        plotName: subPlotModelTanah.plotName,
        kedalamanSample: subPlotModelTanah.kedalamanSample,
        beratJenisTanah: subPlotModelTanah.beratJenisTanah,
        organicTanah: subPlotModelTanah.organicTanah,
        carbonGrCm: subPlotModelTanah.carbonGrCm,
        carbonTonHa: subPlotModelTanah.carbonTonHa,
        carbonTon: subPlotModelTanah.carbonTon,
        carbonAbsorb: subPlotModelTanah.carbonAbsorb,
        updateAt: subPlotModelTanah.updateAt,
      );

      await SubPlotAreaDB.updateSubPlotTanah(subPlotTanah);
    }
    isLoading(false);
  }
}
