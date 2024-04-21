import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_d_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hive/hive.dart';

class SubPlotAreaDB {
  static Box<SubPlotAreaAModel> subPlotABox = Hive.box('subplot_a');
  static Box<SubPlotAreaCModel> subPlotCBox = Hive.box('subplot_c');
  static Box<SubPlotAreaDModel> subPlotDBox = Hive.box('subplot_d');
  static Box<SubPlotAreaBModel> subPlotBBox = Hive.box('subplot_b');

  static Box<SubPlotAreaASemaiModel> subPlotSemaiBox =
      Hive.box('subplot_a_semai');
  static Box<SubPlotAreaASeresahModel> subPlotSeresahBox =
      Hive.box('subplot_a_seresah');
  static Box<SubPlotAreaATumbuhanBawahModel> subPlotBawahBox =
      Hive.box('subplot_a_tumbuhan');

  static Box<SubPlotAreaDPohonModel> subPlotDPohonBox =
      Hive.box('subplot_d_pohon');
  static Box<SubPlotAreaDNekromasModel> subPlotDNekromasBox =
      Hive.box('subplot_d_nekromas');
  static Box<SubPlotAreaDTanahModel> subPlotDTanahBox =
      Hive.box('subplot_d_tanah');

  static RxBool isSubPlotSemaiDone = false.obs;
  static RxBool isSubPlotSeresahDone = false.obs;
  static RxBool isSubPlotBawahDone = false.obs;

  static RxBool isSubPlotBDone = false.obs;
  static RxBool isSubPlotCDone = false.obs;

  static RxBool isSubPlotPohonDone = false.obs;
  static RxBool isSubPlotNekromasDone = false.obs;
  static RxBool isSubPlotTanahDone = false.obs;

  static Future<void> init() async {
    await Hive.openBox<SubPlotAreaAModel>('subplot_a');
    await Hive.openBox<SubPlotAreaASemaiModel>('subplot_a_semai');
    await Hive.openBox<SubPlotAreaASeresahModel>('subplot_a_seresah');
    await Hive.openBox<SubPlotAreaATumbuhanBawahModel>('subplot_a_tumbuhan');

    await Hive.openBox<SubPlotAreaBModel>('subplot_b');
    await Hive.openBox<SubPlotAreaCModel>('subplot_c');

    await Hive.openBox<SubPlotAreaDModel>('subplot_d');
    await Hive.openBox<SubPlotAreaDPohonModel>('subplot_d_pohon');
    await Hive.openBox<SubPlotAreaDNekromasModel>('subplot_d_nekromas');
    await Hive.openBox<SubPlotAreaDTanahModel>('subplot_d_tanah');
  }

  // Sub Plot A
  static List<SubPlotAreaAModel> getAllSubPlotA() {
    return subPlotABox.values.toList();
  }

  static List<SubPlotAreaASemaiModel> getAllSubPlotSemai() {
    return subPlotSemaiBox.values.toList();
  }

  static List<SubPlotAreaASeresahModel> getAllSubPlotSeresah() {
    return subPlotSeresahBox.values.toList();
  }

  static List<SubPlotAreaATumbuhanBawahModel> getAllSubPlotBawah() {
    return subPlotBawahBox.values.toList();
  }

  // static SubPlotAreaASemaiModel? getSpecificSubPlotSemai(
  //   SubPlotAreaASemaiModel semaiModel,
  // ) =>
  //     subPlotSemaiBox.get(semaiModel.uuid);

  // static SubPlotAreaASeresahModel? getSpecificSubPlotSeresah(
  //   SubPlotAreaASeresahModel seresahModel,
  // ) =>
  //     subPlotSeresahBox.get(seresahModel.uuid);

  // static SubPlotAreaATumbuhanBawahModel? getSpecificSubPlotBawah(
  //   SubPlotAreaATumbuhanBawahModel bawahModel,
  // ) =>
  //     subPlotBawahBox.get(bawahModel.uuid);

  static Future<void> addSubPlotA(SubPlotAreaAModel modelA) async {
    await subPlotABox.add(modelA);
  }

  static Future<void> addSubPlotASemai(
    SubPlotAreaASemaiModel semaiModel,
  ) async {
    isSubPlotSemaiDone.value = true;

    await subPlotSemaiBox.add(semaiModel);
  }

  static Future<void> addSubPlotASeresah(
    SubPlotAreaASeresahModel seresahModel,
  ) async {
    isSubPlotSeresahDone.value = true;
    await subPlotSeresahBox.add(seresahModel);
  }

  static Future<void> addSubPlotABawah(
    SubPlotAreaATumbuhanBawahModel bawahModel,
  ) async {
    isSubPlotBawahDone.value = true;
    await subPlotBawahBox.add(bawahModel);
  }

  static Future<void> updateSubPlotA(SubPlotAreaAModel modelA) async =>
      await subPlotABox.put(modelA.uuid, modelA);

  static Future<void> updateSubPlotASemai(
    SubPlotAreaASemaiModel semaiModel,
  ) async =>
      await subPlotSemaiBox.put(semaiModel.uuid, semaiModel);

  static Future<void> updateSubPlotASeresah(
    SubPlotAreaASeresahModel seresahModel,
  ) async =>
      await subPlotSeresahBox.put(seresahModel.uuid, seresahModel);

  static Future<void> updateSubPlotABawah(
    SubPlotAreaATumbuhanBawahModel bawahModel,
  ) async =>
      await subPlotBawahBox.put(bawahModel.uuid, bawahModel);

  // Sub Plot B
  static List<SubPlotAreaBModel> getAllSubPlotB() {
    return subPlotBBox.values.toList();
  }

  // static SubPlotAreaBModel? getSpecificSubPlotB(
  //   SubPlotAreaBModel bModel,
  // ) =>
  //     subPlotBBox.get(bModel.uuid);

  static Future<void> addSubPlotB(SubPlotAreaBModel modelB) async {
    isSubPlotBDone.value = true;
    await subPlotBBox.add(modelB);
  }

  static Future<void> updateSubPlotB(SubPlotAreaBModel modelB) async =>
      await subPlotBBox.put(modelB.uuid, modelB);

  // Sub Plot C
  static List<SubPlotAreaCModel> getAllSubPlotC() {
    return subPlotCBox.values.toList();
  }

  // static SubPlotAreaCModel? getSpecificSubPlotC(
  //   SubPlotAreaCModel bModel,
  // ) =>
  //     subPlotCBox.get(bModel.uuid);

  static Future<void> addSubPlotC(SubPlotAreaCModel bModel) async {
    isSubPlotCDone.value = true;
    await subPlotCBox.add(bModel);
  }

  static Future<void> updateSubPlotC(SubPlotAreaCModel bModel) async =>
      await subPlotCBox.put(bModel.uuid, bModel);

  // Sub Plot D
  static List<SubPlotAreaDModel> getAllSubPlotD() {
    return subPlotDBox.values.toList();
  }

  static List<SubPlotAreaDPohonModel> getAllSubPlotPohon() {
    return subPlotDPohonBox.values.toList();
  }

  static List<SubPlotAreaDNekromasModel> getAllSubPlotNekromas() {
    return subPlotDNekromasBox.values.toList();
  }

  static List<SubPlotAreaDTanahModel> getAllSubPlotTanah() {
    return subPlotDTanahBox.values.toList();
  }

  // static SubPlotAreaDPohonModel? getSpecificSubPlotPohon(
  //   SubPlotAreaDPohonModel pohonModel,
  // ) =>
  //     subPlotDPohonBox.get(pohonModel.uuid);

  // static SubPlotAreaDNekromasModel? getSpecificSubPlotNekromas(
  //   SubPlotAreaDNekromasModel nekromasModel,
  // ) =>
  //     subPlotDNekromasBox.get(nekromasModel.uuid);

  // static SubPlotAreaDTanahModel? getSpecificSubPlotTanah(
  //   SubPlotAreaDTanahModel tanahModel,
  // ) =>
  //     subPlotDTanahBox.get(tanahModel.uuid);

  static Future<void> addSubPlotD(SubPlotAreaDModel modelD) async {
    await subPlotDBox.add(modelD);
  }

  static Future<void> addSubPlotPohon(
    SubPlotAreaDPohonModel pohonModel,
  ) async {
    isSubPlotPohonDone.value = true;
    await subPlotDPohonBox.add(pohonModel);
  }

  static Future<void> addSubPlotNekromas(
    SubPlotAreaDNekromasModel nekromasModel,
  ) async {
    isSubPlotNekromasDone.value = true;
    await subPlotDNekromasBox.add(nekromasModel);
  }

  static Future<void> addSubPlotTanah(
    SubPlotAreaDTanahModel tanahModel,
  ) async {
    isSubPlotTanahDone.value = true;
    await subPlotDTanahBox.add(tanahModel);
  }

  static Future<void> updateSubPlotD(SubPlotAreaDModel modelD) async =>
      await subPlotDBox.put(modelD.uuid, modelD);

  static Future<void> updateSubPlotPohon(
    SubPlotAreaDPohonModel pohonModel,
  ) async =>
      await subPlotDPohonBox.put(pohonModel.uuid, pohonModel);

  static Future<void> updateSubPlotNekromas(
    SubPlotAreaDNekromasModel nekromasModel,
  ) async =>
      await subPlotDNekromasBox.put(nekromasModel.uuid, nekromasModel);

  static Future<void> updateSubPlotTanah(
    SubPlotAreaDTanahModel tanahModel,
  ) async =>
      await subPlotDTanahBox.put(tanahModel.uuid, tanahModel);
}
