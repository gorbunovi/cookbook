import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'tables.dart';

class DatabaseService {
  late final Database _database;

  Future<DatabaseService> init() async {

    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = [documentsDirectory.path, '/', kDatabaseName].join();
    _database = await openDatabase(path,
      version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade,);
    print('DatabaseService');
    return this;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.transaction((transaction) async {
      await Future.forEach([
        '$kCreateTable $kCatalogSchemes',
        '$kCreateTable $kIngridientSchemes',
        '$kCreateTable $kRecipeSchemes',
        '$kCreateTable $kRecipeCookingSchemes',
        '$kCreateTable $kRecipePhotoSchemes',
      ], (String command) async {
        await transaction.execute(command);
      });
    });
  }

  Future<void> _onUpgrade(Database db, int ver1, int ver2) async {
    // await _appDataService.clearAllEtags();
    await db.transaction(
          (transaction) async {
        await Future.forEach<String>(allTables, (tableName) async {
          try {
            await transaction.execute('$kDropTable $tableName');
          } catch (e) {
            // logger.v(e.toString());
          }
        });
        await _onCreate(db, ver2);
      },
    );
  }

  //Read
  Future<List<Map<String, dynamic?>>> getQuery(
    {required String tableName})async =>
      await _database.query(tableName);

  Future<List<Map<String, dynamic?>>> getQueryID(
      {required String tableName, String? where}) async =>
      await _database.query(tableName, where: where);

  Future<List<Map<String, dynamic?>>> getQueryWere(
      {required String tableName, String? where}) async =>
      await _database.query(tableName, where: where);




//SQLQUERY
  Future<List<Map<String, dynamic?>>> rawQuery({required String sql}) async {
    return await _database.rawQuery(sql);
  }


  //INSERT
  Future<int> insertQuery({
    required String tableName,
    required Map<String, dynamic> value}) async {
    var resault = await _database.insert(tableName, value, conflictAlgorithm: ConflictAlgorithm.replace);
    print('insertQuery ==== $resault');
    return resault;
  }

  //UPDATE
  Future<void> updateQuery({
    required String tableName,
    required Map<String, dynamic> value,
    required int id}) async =>
      await _database.update(
        tableName,
        value,
        where: 'id = ?',
        whereArgs: [id]
      );

  Future<int> delete({
    required String table,
    required int id}) async =>
      await _database.delete(
        table,
        where: 'id = ?',
        whereArgs: [id]
      );
}