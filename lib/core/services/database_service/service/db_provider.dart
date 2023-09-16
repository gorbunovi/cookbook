

import 'dart:io';

import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/ingridient_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static late Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'сookbook';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async{
    await db.execute('CREATE TABLE catalogs(id INTEGER PRIMARY KEY, parent_id INTEGER, name TEXT, photo TEXT, info TEXT)');
    await db.execute('CREATE TABLE recipe(id INTEGER PRIMARY KEY, catalog_id INTEGER, name TEXT, info TEXT)');
    await db.execute('CREATE TABLE ingridient(id INTEGER PRIMARY KEY, recipe_id INTEGER, name TEXT, photo TEXT, info TEXT, weight DECIMAL, weightPortion DECIMAL)');
    await db.execute('CREATE TABLE recipe_cooking(id INTEGER PRIMARY KEY, recipe_id INTEGER, photo TEXT, info TEXT)');
    await db.execute('CREATE TABLE recipe_photo(id INTEGER PRIMARY KEY, recipe_id INTEGER, photo TEXT, info TEXT)');
  }

  Future<bool> insertCatalog(CatalogModel catalogModel) async{
    Database db = await this.database;
    catalogModel.id = await db.insert('catalogs', catalogModel.toMap());
    if (catalogModel.id != null) return true;
    return false;
  }

  Future<bool> insertIngridient(IngridientModel ingridientModel) async{
    Database db = await this.database;
    ingridientModel.id = await db.insert('ingridient', ingridientModel.toMap());
    if (ingridientModel.id != null) return true;
    return false;
  }

  Future<bool> insertResipe(RecipeModel resipeModel) async{
    Database db = await this.database;
    resipeModel.id = await db.insert('recipe', resipeModel.toMap());
    if (resipeModel.id != null) return true;
    return false;
  }
}