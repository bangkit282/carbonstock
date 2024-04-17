// import 'package:carbonstock/data/local/model/plot/plot_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:hive/hive.dart';

class PlotDB {
  static Box<PlotModel> plotBox = Hive.box('plots');

  static Future<void> init() async {
    await Hive.openBox<PlotModel>('plots');
  }

  static List<PlotModel> getAllPlots() {
    return plotBox.values.toList();
  }

  static PlotModel? getSpecificPlot(PlotModel plotModel) {
    return plotBox.get(plotModel.plotId);
  }

  static Future<void> addPlot(PlotModel plotModel) async {
    await plotBox.add(plotModel);

    // Get.snackbar(
    //   'CarbonStock',
    //   'Add Plot Success!',
    //   backgroundColor: colorSecondaryGrey1,
    // );
  }

  static Future<void> deletePlot(PlotModel plotModel) async {
    await plotBox.delete(plotModel.plotId);

    // Get.snackbar(
    //   'CarbonStock',
    //   'Delete Plot Success!',
    //   backgroundColor: colorSecondaryGrey1,
    // );
  }
}

// class PlotDB {
//   static final PlotDB instance = PlotDB._init();
//   static Database? _database;

//   PlotDB._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('plot_database.db');
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
//     const decimalType = 'REAL NOT NULL';

//     await db.execute(
//       '''
//       CREATE TABLE plot(
//         id $idType,
//         plotLat $decimalType,
//         plotLng $decimalType,
//         plotSize $decimalType,
//         biomassAvg $decimalType,
//         biomassStd $decimalType
//       )
//       ''',
//     );
//   }

//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }

//   Future<PlotModel> insertPlot(PlotModel plot) async {
//     final db = await instance.database;
//     final id = await db.insert(tablePlot, plot.toJson());

//     return plot.copy(id: id);
//   }

//   Future<PlotModel> readPlot(int id) async {
//     final db = await instance.database;

//     final mapping = await db.query(
//       tablePlot,
//       columns: PlotFields.values,
//       where: '${PlotFields.id} = ?',
//       whereArgs: [id],
//     );

//     if (mapping.isNotEmpty) {
//       return PlotModel.fromJson(mapping.first);
//     } else {
//       throw Exception('ID $id not found');
//     }
//   }

//   Stream<List<PlotModel>> readAllPlot() async* {
//     final db = await instance.database;
//     final result = await db.query(tablePlot);

//     yield result.map((json) => PlotModel.fromJson(json)).toList();
//   }

//   Future<int> updateArea(PlotModel plot) async {
//     final db = await instance.database;

//     return db.update(
//       tablePlot,
//       plot.toJson(),
//       where: '${PlotFields.id} = ?',
//       whereArgs: [plot.id],
//     );
//   }

//   Future<int> deleteArea(int id) async {
//     final db = await instance.database;

//     return await db.delete(
//       tablePlot,
//       where: '${PlotFields.id} = ?',
//       whereArgs: [id],
//     );
//   }
// }
