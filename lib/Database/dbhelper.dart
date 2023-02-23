import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Model/model_class.dart';

class DatabaseHandler {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String joinPath = join(path, 'todo.db');
      //await deleteDatabase(joinPath);
    return openDatabase(joinPath, onCreate:
        // _onCreate
        (database, version) async {
      await database.execute(
        "CREATE TABLE data(primaryId INTEGER PRIMARY KEY AUTOINCREMENT, Id INTEGER,"
            "FirstName TEXT,"
            "LastName TEXT,"
            "Organization TEXT,"
            "Barcode TEXT,"
            "SectionId INTEGER,"
            "ShowId INTEGER,"

            "TimeId INTEGER,"
            "AdmittedOn TEXT,"
            "Admitted TEXT,"
            "SectionTitle TEXT,"
            "RowTitle TEXT,"
            "SeatTitle TEXT,"
            "BuyerFirstName TEXT,"
            "BuyerLastName TEXT,"
            "PromoCode TEXT,"
            "OrderId INTEGER,"
            "OrderNumber TEXT,"
            "IsDocumentSigned TEXT,"
            "AttendeeImage TEXT,"
            "ScanCount INTEGER,"
            "IsSquareMerchandise TEXT,"
            "MaxUses INTEGER,"
            "OrderIdentifier TEXT)",
        //"CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL,description TEXT NOT NULL, date DateTime DEFAULT (datetime('now', 'localtime')) )",
      );
    }, version: 1);
  }

  Future<void> add(DataModel dm) async {
    final db = await initDB();
    print("db create and insert call");
    await db.insert(
      "data",
      dm.toJson(),
    );

    print("db create and insert ok");
  }

  Future<List<DataModel>> retriveAllTask() async {
    final db = await initDB();
    final List<Map<String, dynamic>> query = await db.query('data');
    return query.map((e) => DataModel.fromJson(e)).toList();
  }

  Future<dynamic> deleteTask(int id) async {
    final db = await initDB();
    await db.delete('data', where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateTask(DataModel task) async {
    final db = await initDB();
    var result = await db
        .update("data", task.toJson(), where: 'id= ?', whereArgs: [task.id]);
    return result;
  }


  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL,description TEXT NOT NULL");
    //"""CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, desc TEXT NOT NULL """);
  }
}
