import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:hive/hive.dart';

class SubPlotAreaDB {
  static Box<SubPlotAreaASemaiModel> subPlotSemaiBox =
      Hive.box('subplot_a_semai');
  static Box<SubPlotAreaASeresahModel> subPlotSeresahBox =
      Hive.box('subplot_a_seresah');
  static Box<SubPlotAreaATumbuhanBawahModel> subPlotBawahBox =
      Hive.box('subplot_a_tumbuhan');

  static Box<SubPlotAreaBModel> subPlotBBox = Hive.box('subplot_b');
  static Box<SubPlotAreaCModel> subPlotCBox = Hive.box('subplot_c');

  static Future<void> init() async {
    await Hive.openBox<SubPlotAreaASemaiModel>('subplot_a_semai');
    await Hive.openBox<SubPlotAreaASeresahModel>('subplot_a_seresah');
    await Hive.openBox<SubPlotAreaATumbuhanBawahModel>('subplot_a_tumbuhan');

    await Hive.openBox<SubPlotAreaBModel>('subplot_b');
    await Hive.openBox<SubPlotAreaCModel>('subplot_c');
  }

  // Sub Plot A
  static List<SubPlotAreaASemaiModel> getAllSubPlotSemai() {
    return subPlotSemaiBox.values.toList();
  }

  static List<SubPlotAreaASeresahModel> getAllSubPlotSeresah() {
    return subPlotSeresahBox.values.toList();
  }

  static List<SubPlotAreaATumbuhanBawahModel> getAllSubPlotBawah() {
    return subPlotBawahBox.values.toList();
  }

  static SubPlotAreaASemaiModel? getSpecificSubPlotSemai(
    SubPlotAreaASemaiModel semaiModel,
  ) =>
      subPlotSemaiBox.get(semaiModel.uuid);

  static SubPlotAreaASeresahModel? getSpecificSubPlotSeresah(
    SubPlotAreaASeresahModel seresahModel,
  ) =>
      subPlotSeresahBox.get(seresahModel.uuid);

  static SubPlotAreaATumbuhanBawahModel? getSpecificSubPlotBawah(
    SubPlotAreaATumbuhanBawahModel bawahModel,
  ) =>
      subPlotBawahBox.get(bawahModel.uuid);

  static Future<void> addSubPlotASemai(
    SubPlotAreaASemaiModel semaiModel,
  ) async =>
      await subPlotSemaiBox.add(semaiModel);

  static Future<void> addSubPlotASeresah(
    SubPlotAreaASeresahModel seresahModel,
  ) async =>
      await subPlotSeresahBox.add(seresahModel);

  static Future<void> addSubPlotABawah(
    SubPlotAreaATumbuhanBawahModel bawahModel,
  ) async =>
      await subPlotBawahBox.add(bawahModel);

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

  static SubPlotAreaBModel? getSpecificSubPlotB(
    SubPlotAreaBModel bModel,
  ) =>
      subPlotBBox.get(bModel.uuid);

  static Future<void> addSubPlotB(SubPlotAreaBModel bModel) async =>
      await subPlotBBox.add(bModel);

  static Future<void> updateSubPlotB(SubPlotAreaBModel bModel) async =>
      await subPlotBBox.put(bModel.uuid, bModel);

  // Sub Plot C
  static List<SubPlotAreaCModel> getAllSubPlotC() {
    return subPlotCBox.values.toList();
  }

  static SubPlotAreaCModel? getSpecificSubPlotC(
    SubPlotAreaCModel bModel,
  ) =>
      subPlotCBox.get(bModel.uuid);

  static Future<void> addSubPlotC(SubPlotAreaCModel bModel) async =>
      await subPlotCBox.add(bModel);

  static Future<void> updateSubPlotC(SubPlotAreaCModel bModel) async =>
      await subPlotCBox.put(bModel.uuid, bModel);
}
