import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_d_model.dart';
import 'package:get/get.dart';
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

  static SubPlotAreaAModel getSpecificSubPlotA(String uuid) =>
      subPlotABox.values.toList().firstWhere((element) => uuid == element.uuid);

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

  static Future<void> updateSubPlotA(
    int index,
    SubPlotAreaAModel modelA,
  ) async =>
      await subPlotABox.putAt(
        index,
        modelA,
      );

  static Future<void> updateSubPlotASemai(
    int index,
    SubPlotAreaASemaiModel semaiModel,
  ) async =>
      await subPlotSemaiBox.putAt(
        index,
        semaiModel,
      );

  static Future<void> updateSubPlotASeresah(
    int index,
    SubPlotAreaASeresahModel seresahModel,
  ) async =>
      await subPlotSeresahBox.put(
        index,
        seresahModel,
      );

  static Future<void> updateSubPlotABawah(
    int index,
    SubPlotAreaATumbuhanBawahModel bawahModel,
  ) async =>
      await subPlotBawahBox.putAt(
        index,
        bawahModel,
      );

  // Sub Plot B
  static List<SubPlotAreaBModel> getAllSubPlotB() {
    return subPlotBBox.values.toList();
  }

  static SubPlotAreaBModel getSpecificSubPlotB(String uuid) {
    return subPlotBBox.values.toList().firstWhere((element) => uuid == element.uuid);
  }

  static Future<void> addSubPlotB(SubPlotAreaBModel modelB) async {
    isSubPlotBDone.value = true;
    await subPlotBBox.add(modelB);
  }

  static Future<void> updateSubPlotB(
    int index,
    SubPlotAreaBModel modelB,
  ) async =>
      await subPlotBBox.putAt(
        index,
        modelB,
      );

  // Sub Plot C
  static List<SubPlotAreaCModel> getAllSubPlotC() {
    return subPlotCBox.values.toList();
  }

  static SubPlotAreaCModel getSpecificSubPlotC(String uuid) =>
      subPlotCBox.values.toList().firstWhere((element) => uuid == element.uuid);

  static Future<void> addSubPlotC(SubPlotAreaCModel bModel) async {
    isSubPlotCDone.value = true;
    await subPlotCBox.add(bModel);
  }

  static Future<void> updateSubPlotC(
    int index,
    SubPlotAreaCModel modelC,
  ) async =>
      await subPlotCBox.putAt(
        index,
        modelC,
      );

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

  static SubPlotAreaDModel getSpecificSubPlotD(String uuid) =>
      subPlotDBox.values.toList().firstWhere((element) => uuid == element.uuid);

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

  static Future<void> updateSubPlotD(
    int index,
    SubPlotAreaDModel modelD,
  ) async =>
      await subPlotDBox.putAt(
        index,
        modelD,
      );

  static Future<void> updateSubPlotPohon(
    int index,
    SubPlotAreaDPohonModel pohonModel,
  ) async =>
      await subPlotDPohonBox.putAt(
        index,
        pohonModel,
      );

  static Future<void> updateSubPlotNekromas(
    int index,
    SubPlotAreaDNekromasModel nekromasModel,
  ) async =>
      await subPlotDNekromasBox.putAt(
        index,
        nekromasModel,
      );

  static Future<void> updateSubPlotTanah(
    int index,
    SubPlotAreaDTanahModel tanahModel,
  ) async =>
      await subPlotDTanahBox.putAt(
        index,
        tanahModel,
      );
}
