import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SubPlotAAreaDB {
  static final SubPlotAAreaDB instance = SubPlotAAreaDB._init();
  static Database? _database;

  SubPlotAAreaDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('subplot_a_database.db');
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

    await db.execute('''
      CREATE TABLE subplot_a_semai(
        _id $idType,
        areaName $textType,
        plotName $textType,
        basahTotal $decimalType,
        basahSample $decimalType,
        keringTotal $decimalType,
        keringSample $decimalType,
        carbonValue $decimalType,
        carbonAbsorb $decimalType
      )
      ''');

    await db.execute('''
      CREATE TABLE subplot_a_seresah(
        _id $idType,
        areaName $textType,
        plotName $textType,
        basahTotal $decimalType,
        basahSample $decimalType,
        keringTotal $decimalType,
        keringSample $decimalType,
        carbonValue $decimalType,
        carbonAbsorb $decimalType
      )
      ''');

    await db.execute('''
      CREATE TABLE subplot_a_tumbuhan(
        _id $idType,
        areaName $textType,
        plotName $textType,
        basahTotal $decimalType,
        basahSample $decimalType,
        keringTotal $decimalType,
        keringSample $decimalType,
        carbonValue $decimalType,
        carbonAbsorb $decimalType
      )
      ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<SubPlotAreaASemaiModel> insertSubPlotASemai(
    SubPlotAreaASemaiModel subPlotASemai,
  ) async {
    final db = await instance.database;
    final id = await db.insert(tableSubPlotASemai, subPlotASemai.toJson());

    return subPlotASemai.copy(id: id);
  }

  Future<SubPlotAreaASeresahModel> insertSubPlotASeresah(
    SubPlotAreaASeresahModel subPlotASeresah,
  ) async {
    final db = await instance.database;
    final id = await db.insert(tableSubPlotASeresah, subPlotASeresah.toJson());

    return subPlotASeresah.copy(id: id);
  }

  Future<SubPlotAreaATumbuhanBawahModel> insertSubPlotATumbuhan(
    SubPlotAreaATumbuhanBawahModel subPlotATumbuhan,
  ) async {
    final db = await instance.database;
    final id = await db.insert(
      tableSubPlotATumbuhanBawah,
      subPlotATumbuhan.toJson(),
    );

    return subPlotATumbuhan.copy(id: id);
  }

  Stream<List<SubPlotAreaASemaiModel>> readAllSubPlotASemai() async* {
    final db = await instance.database;
    final result = await db.query(tableSubPlotASemai);

    yield result.map((json) => SubPlotAreaASemaiModel.fromJson(json)).toList();
  }

  Stream<List<SubPlotAreaASeresahModel>> readAllSubPlotASeresah() async* {
    final db = await instance.database;
    final result = await db.query(tableSubPlotASeresah);

    yield result
        .map((json) => SubPlotAreaASeresahModel.fromJson(json))
        .toList();
  }

  Stream<List<SubPlotAreaATumbuhanBawahModel>>
      readAllSubPlotATumbuhan() async* {
    final db = await instance.database;
    final result = await db.query(tableSubPlotATumbuhanBawah);

    yield result
        .map((json) => SubPlotAreaATumbuhanBawahModel.fromJson(json))
        .toList();
  }

  Future<int> updateSubPlotASemai(
    SubPlotAreaASemaiModel subPlotA,
  ) async {
    final db = await instance.database;

    return db.update(
      tableSubPlotASemai,
      subPlotA.toJson(),
      where: '${SubPlotAreaASemaiFields.id} = ?',
      whereArgs: [subPlotA.id],
    );
  }

  Future<int> updateSubPlotASeresah(
    SubPlotAreaASeresahModel subPlotA,
  ) async {
    final db = await instance.database;

    return db.update(
      tableSubPlotASeresah,
      subPlotA.toJson(),
      where: '${SubPlotAreaASeresahFields.id} = ?',
      whereArgs: [subPlotA.id],
    );
  }

  Future<int> updateSubPlotATumbuhan(
    SubPlotAreaATumbuhanBawahModel subPlotA,
  ) async {
    final db = await instance.database;

    return db.update(
      tableSubPlotATumbuhanBawah,
      subPlotA.toJson(),
      where: '${SubPlotAreaATumbuhanBawahFields.id} = ?',
      whereArgs: [subPlotA.id],
    );
  }
}
