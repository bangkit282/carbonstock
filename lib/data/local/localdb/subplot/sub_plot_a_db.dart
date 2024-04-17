// import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

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

// class SubPlotAAreaDB {
//   static final SubPlotAAreaDB instance = SubPlotAAreaDB._init();
//   static Database? _database;

//   SubPlotAAreaDB._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('subplot_a_database.db');
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
//     const textType = 'TEXT';
//     const decimalType = 'REAL';

//     await db.execute('''
//       CREATE TABLE subplot_a_semai(
//         _id $idType,
//         areaName $textType,
//         plotName $textType,
//         basahTotal $decimalType,
//         basahSample $decimalType,
//         keringTotal $decimalType,
//         keringSample $decimalType,
//         carbonValue $decimalType,
//         carbonAbsorb $decimalType
//       )
//       ''');

//     await db.execute('''
//       CREATE TABLE subplot_a_seresah(
//         _id $idType,
//         areaName $textType,
//         plotName $textType,
//         basahTotal $decimalType,
//         basahSample $decimalType,
//         keringTotal $decimalType,
//         keringSample $decimalType,
//         carbonValue $decimalType,
//         carbonAbsorb $decimalType
//       )
//       ''');

//     await db.execute('''
//       CREATE TABLE subplot_a_tumbuhan(
//         _id $idType,
//         areaName $textType,
//         plotName $textType,
//         basahTotal $decimalType,
//         basahSample $decimalType,
//         keringTotal $decimalType,
//         keringSample $decimalType,
//         carbonValue $decimalType,
//         carbonAbsorb $decimalType
//       )
//       ''');
//   }

//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }

//   Future<SubPlotAreaASemaiModel> insertSubPlotASemai(
//     SubPlotAreaASemaiModel subPlotASemai,
//   ) async {
//     final db = await instance.database;
//     final id = await db.insert(tableSubPlotASemai, subPlotASemai.toJson());

//     return subPlotASemai.copy(id: id);
//   }

//   Future<SubPlotAreaASeresahModel> insertSubPlotASeresah(
//     SubPlotAreaASeresahModel subPlotASeresah,
//   ) async {
//     final db = await instance.database;
//     final id = await db.insert(tableSubPlotASeresah, subPlotASeresah.toJson());

//     return subPlotASeresah.copy(id: id);
//   }

//   Future<SubPlotAreaATumbuhanBawahModel> insertSubPlotATumbuhan(
//     SubPlotAreaATumbuhanBawahModel subPlotATumbuhan,
//   ) async {
//     final db = await instance.database;
//     final id = await db.insert(
//       tableSubPlotATumbuhanBawah,
//       subPlotATumbuhan.toJson(),
//     );

//     return subPlotATumbuhan.copy(id: id);
//   }

//   Future<List<SubPlotAreaASemaiModel>> readAllSubPlotASemai() async {
//     final db = await instance.database;
//     final result = await db.query(tableSubPlotASemai);

//     return result.map((e) => SubPlotAreaASemaiModel.fromJson(e)).toList();
//   }

//   Future<List<SubPlotAreaASeresahModel>> readAllSubPlotASeresah() async {
//     final db = await instance.database;
//     final result = await db.query(tableSubPlotASeresah);

//     return result.map((e) => SubPlotAreaASeresahModel.fromJson(e)).toList();
//   }

//   Future<List<SubPlotAreaATumbuhanBawahModel>> readAllSubPlotATumbuhan() async {
//     final db = await instance.database;
//     final result = await db.query(tableSubPlotATumbuhanBawah);

//     return result
//         .map((e) => SubPlotAreaATumbuhanBawahModel.fromJson(e))
//         .toList();
//   }

//   // Stream<List<SubPlotAreaASemaiModel>> readAllSubPlotASemai() async* {
//   //   final db = await instance.database;
//   //   final result = await db.query(tableSubPlotASemai);

//   //   yield result.map((json) => SubPlotAreaASemaiModel.fromJson(json)).toList();
//   // }

//   // Stream<List<SubPlotAreaASeresahModel>> readAllSubPlotASeresah() async* {
//   //   final db = await instance.database;
//   //   final result = await db.query(tableSubPlotASeresah);

//   //   yield result
//   //       .map((json) => SubPlotAreaASeresahModel.fromJson(json))
//   //       .toList();
//   // }

//   // Stream<List<SubPlotAreaATumbuhanBawahModel>>
//   //     readAllSubPlotATumbuhan() async* {
//   //   final db = await instance.database;
//   //   final result = await db.query(tableSubPlotATumbuhanBawah);

//   //   yield result
//   //       .map((json) => SubPlotAreaATumbuhanBawahModel.fromJson(json))
//   //       .toList();
//   // }

//   Future<int> updateSubPlotASemai(
//     SubPlotAreaASemaiModel subPlotA,
//   ) async {
//     final db = await instance.database;

//     return db.update(
//       tableSubPlotASemai,
//       subPlotA.toJson(),
//       where: '${SubPlotAreaASemaiFields.id} = ?',
//       whereArgs: [subPlotA.id],
//     );
//   }

//   Future<int> updateSubPlotASeresah(
//     SubPlotAreaASeresahModel subPlotA,
//   ) async {
//     final db = await instance.database;

//     return db.update(
//       tableSubPlotASeresah,
//       subPlotA.toJson(),
//       where: '${SubPlotAreaASeresahFields.id} = ?',
//       whereArgs: [subPlotA.id],
//     );
//   }

//   Future<int> updateSubPlotATumbuhan(
//     SubPlotAreaATumbuhanBawahModel subPlotA,
//   ) async {
//     final db = await instance.database;

//     return db.update(
//       tableSubPlotATumbuhanBawah,
//       subPlotA.toJson(),
//       where: '${SubPlotAreaATumbuhanBawahFields.id} = ?',
//       whereArgs: [subPlotA.id],
//     );
//   }
// }
