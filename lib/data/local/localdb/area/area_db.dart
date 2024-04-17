import 'package:carbonstock/data/local/model/area/area_model.dart';
import 'package:carbonstock/utils/style_theme.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AreaDB {
  static Box<AreaModel> areaBox = Hive.box<AreaModel>('areas');

  static Future<void> init() async {
    await Hive.openBox<AreaModel>('areas');
  }

  static List<AreaModel> getAllAreas() {
    return areaBox.values.toList();
  }

  static AreaModel? getSpecificArea(AreaModel areaModel) {
    return areaBox.get(areaModel.areaId);
  }

  static Future<void> addArea(AreaModel areaModel) async {
    await areaBox.add(areaModel);

    Get.snackbar(
      'CarbonStock',
      'Add Area Success!',
      backgroundColor: colorSecondaryGrey1,
    );
  }

  static Future<void> deleteArea(AreaModel areaModel) async {
    await areaBox.delete(areaModel.areaId);

    Get.snackbar(
      'CarbonStock',
      'Delete Area Success!',
      backgroundColor: colorSecondaryGrey1,
    );
  }
}