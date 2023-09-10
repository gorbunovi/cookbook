import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'tables.dart';

class DatabaseService {
  late final Database _database;

  Future<DatabaseService> init() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = [documentsDirectory.path, '/', kDatabaseName].join();
    _database = await openDatabase(path,
      version: 01, onCreate: _onCreate, onUpgrade: _onUpgrade,);
    return this;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.transaction((transaction) async {
      await Future.forEach([
        'PRAGMA case_sensitive_like=OFF;',
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
    await db.transaction(
          (transaction) async {
        await Future.forEach<String>(allTables, (tableName) async {
          try {
            await transaction.execute('$kDropTable $tableName');
          } catch (e) {
            print('DatabaseService _onUpgrade --- ${e.toString()}');
            // logger.v(e.toString());
          }
        });
        await _onCreate(db, ver2);
      },
    );
  }

  Future<int> delete(String table, {String? where}) async =>
      await _database.delete(table, where: where);
}