// import 'package:carbonstock/data/local/model/area/area_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

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

// class AreaDB {
//   static final AreaDB instance = AreaDB._init();
//   static Database? _database;

//   AreaDB._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('area_database.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }

//   Future _createDB(Database db, int version) async {
//     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     const textType = 'TEXT NOT NULL';

//     await db.execute(
//       '''
//       CREATE TABLE area(
//         id $idType,
//         areaName $textType,
//         areaLocation $textType,
//         areaImage $textType,
//         forestType $textType,
//         landType $textType,
//         createdAt $textType,
//         notationTeam $textType
//       )
//       ''',
//     );
//   }

//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }

//   // CRUD
//   Future<AreaModel> insertArea(AreaModel area) async {
//     final db = await instance.database;
//     final id = await db.insert(tableArea, area.toJson());

//     return area.copy(id: id);
//   }

//   Future<AreaModel> readArea(int id) async {
//     final db = await instance.database;

//     final mapping = await db.query(
//       tableArea,
//       columns: AreaFields.values,
//       where: '${AreaFields.id} = ?',
//       whereArgs: [id],
//     );

//     if (mapping.isNotEmpty) {
//       return AreaModel.fromJson(mapping.first);
//     } else {
//       throw Exception('ID $id not found');
//     }
//   }

//   Stream<List<AreaModel>> readAllArea() async* {
//     final db = await instance.database;
//     final result = await db.query(tableArea);
    
//     yield result.map((json) => AreaModel.fromJson(json)).toList();
//   }

//   Future<int> updateArea(AreaModel area) async {
//     final db = await instance.database;

//     return db.update(
//       tableArea,
//       area.toJson(),
//       where: '${AreaFields.id} = ?',
//       whereArgs: [area.id],
//     );
//   }

//   Future<int> deleteArea(int id) async {
//     final db = await instance.database;

//     return await db.delete(
//       tableArea,
//       where: '${AreaFields.id} = ?',
//       whereArgs: [id],
//     );
//   }
// }
