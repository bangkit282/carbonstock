import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SubPlotBAreaDB {
  static final SubPlotBAreaDB instance = SubPlotBAreaDB._init();
  static Database? _database;

  SubPlotBAreaDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('sub_plot_b_database.db');
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
    const textType = 'TEXT NOT NULL';
    const decimalType = 'REAL NOT NULL';

    await db.execute(
      '''
      CREATE TABLE sub_plot_b_pancang(
        id $idType,
        keliling $decimalType,
        diameter $decimalType,
        localName $textType,
        bioName $textType,
        kerapatanKayu $decimalType,
        biomassTanah $decimalType,
        carbonAmount $decimalType,
        carbonAbsorb $decimalType,        
      )
      ''',
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<SubPlotAreaBModel> insertSubPlot(SubPlotAreaBModel subPlotB) async {
    final db = await instance.database;
    final id = await db.insert(tableSubPlotB, subPlotB.toJson());

    return subPlotB.copy(id: id);
  }

  Stream<List<SubPlotAreaBModel>> readAllSubPlotB() async* {
    final db = await instance.database;
    final result = await db.query(tableSubPlotB);

    yield result.map((json) => SubPlotAreaBModel.fromJson(json)).toList();
  }

  Future<int> updateSubPlotB(SubPlotAreaBModel subPlotB) async {
    final db = await instance.database;

    return db.update(
      tableSubPlotB,
      subPlotB.toJson(),
      where: '${SubPlotAreaBFields.id} = ?',
      whereArgs: [subPlotB.id],
    );
  }

  Future<int> deleteSubPlotB(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableSubPlotB,
      where: '${SubPlotAreaBFields.id} = ?',
      whereArgs: [id],
    );
  }
}
