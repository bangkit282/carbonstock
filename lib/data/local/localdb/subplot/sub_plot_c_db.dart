import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SubPlotCAreaDB {
  static final SubPlotCAreaDB instance = SubPlotCAreaDB._init();
  static Database? _database;

  SubPlotCAreaDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('subplot_c_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const decimalType = 'REAL';

    await db.execute(
      '''
      CREATE TABLE subplot_c(
        _id $idType,
        areaName $textType,
        plotName $textType,
        keliling $decimalType,
        diameter $decimalType,
        localName $textType,
        bioName $textType,
        kerapatanKayu $decimalType,
        biomassLand $decimalType,
        carbonValue $decimalType,
        carbonAbsorb $decimalType        
      )
      ''',
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<SubPlotAreaCModel> insertSubPlotC(SubPlotAreaCModel subPlotC) async {
    final db = await instance.database;
    final id = await db.insert(tableSubPlotC, subPlotC.toJson());

    return subPlotC.copy(id: id);
  }

  Stream<List<SubPlotAreaCModel>> readAllSubPlotC() async* {
    final db = await instance.database;
    final result = await db.query(tableSubPlotC);

    yield result.map((json) => SubPlotAreaCModel.fromJson(json)).toList();
  }

  Future<int> updateSubPlotC(SubPlotAreaCModel subPlotC) async {
    final db = await instance.database;

    return db.update(
      tableSubPlotC,
      subPlotC.toJson(),
      where: '${SubPlotAreaCFields.id} = ?',
      whereArgs: [subPlotC.id],
    );
  }

  Future<int> deleteSubPlotC(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableSubPlotC,
      where: '${SubPlotAreaCFields.id} = ?',
      whereArgs: [id],
    );
  }
}
