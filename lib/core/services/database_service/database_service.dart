import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'tables.dart';

class DatabaseService {
  late final Database _database;

  Future<DatabaseService> init() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = [documentsDirectory.path, '/', kDatabaseName].join();
    _database = await openDatabase(path,
      version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade,);
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
      {required String tableName, String? where}) async =>
      await _database.query(tableName, where: where);

  //INSERT
  Future<void> insertQuery({
    required String tableName,
    required Map<String, Object> value}) async =>
      await _database.insert(tableName, value);

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