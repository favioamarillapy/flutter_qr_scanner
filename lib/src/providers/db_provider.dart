import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_qr_scanner/src/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "QrScan.db");

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) => {},
      onCreate: (Database db, int version) async => {
        await db.execute('''
          CREATE TABLE scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''')
      },
    );
  }

  Future<List<ScanModel>?> getAll() async {
    final db = await database;
    final response = await db?.query("scans");

    return response!.isNotEmpty
        ? response.map((e) => ScanModel.fromJson(e.toString())).toList()
        : null;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final response = await db?.query("scans", where: "id=?", whereArgs: [id]);

    return response!.isNotEmpty
        ? ScanModel.fromJson(response.first.toString())
        : null;
  }

  Future<List<ScanModel>?> getScanByType(String type) async {
    final db = await database;
    final response =
        await db?.query("scans", where: "type=?", whereArgs: [type]);

    return response!.isNotEmpty
        ? response.map((e) => ScanModel.fromJson(e.toString())).toList()
        : null;
  }

  Future<int> saveScan(ScanModel scanModel) async {
    final db = await database;
    final response = await db?.insert("scans", scanModel.toMap());

    return response!;
  }

  Future<int> updateScan(ScanModel scanModel) async {
    final db = await database;
    final response = await db?.update("scans", scanModel.toMap(),
        where: "id=?", whereArgs: [scanModel.id]);

    return response!;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final response = await db?.delete("scans", where: "id=?", whereArgs: [id]);

    return response!;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final response = await db?.delete("scans");

    return response!;
  }
}
